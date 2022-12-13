----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:09:49 06/11/2018 
-- Design Name: 
-- Module Name:    local_cpu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY local_cpu IS
	PORT (
		clk : IN STD_LOGIC;
		rst : IN STD_LOGIC;
		current_pos : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		--- inside fifo
		f1i_wr_en_loc : IN STD_LOGIC;
		f1i_wr_data_loc : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		f1i_full_loc : OUT STD_LOGIC;
		--- outside fifo
		f1o_rd_en_loc : IN STD_LOGIC;
		f1o_rd_data_loc : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		f1o_empty_loc : OUT STD_LOGIC
	);
END local_cpu;

ARCHITECTURE Behavioral OF local_cpu IS
	COMPONENT alu
		PORT (
			data_a : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			data_b : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			sel : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT register_file
		PORT (
			clk : IN STD_LOGIC;
			wr : IN STD_LOGIC;
			rd : IN STD_LOGIC;
			Ri : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			Rj : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			Rk : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			data_out_i : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			data_out_j : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT instruction_mem
		PORT (
			clk : IN STD_LOGIC;
			en : IN STD_LOGIC;
			address : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT pc
		PORT (
			clk : IN STD_LOGIC;
			en : IN STD_LOGIC;
			pc_out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT decode_unit
		PORT (
			instruction : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			current_pos : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			Ri_adr : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
			Rj_adr : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
			Rk_adr : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
			sel : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
			send_out : OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT fifo_32b
		GENERIC (
			g_WIDTH : NATURAL := 32;
			g_DEPTH : INTEGER := 8
		);
		PORT (
			i_rst_sync : IN STD_LOGIC;
			i_clk : IN STD_LOGIC;
			-- FIFO Write Interface
			i_wr_en : IN STD_LOGIC;
			i_wr_data : IN STD_LOGIC_VECTOR(g_WIDTH - 1 DOWNTO 0);
			o_full : OUT STD_LOGIC;
			-- FIFO Read Interface
			i_rd_en : IN STD_LOGIC;
			o_rd_data : OUT STD_LOGIC_VECTOR(g_WIDTH - 1 DOWNTO 0);
			o_empty : OUT STD_LOGIC
		);
	END COMPONENT;
	SIGNAL data_a, data_b, data_out, data_in, data_out_i, data_out_j : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sel : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');
	SIGNAL wr, rd, mem_en, pc_en, send_out, req : STD_LOGIC := '0';
	SIGNAL Ri_adr, Rj_adr, Rk_adr, Rk_adr_mux : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');
	SIGNAL pc_out, address : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL data_out_mem, instruction : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL f1i_empty_loc, f1i_rd_en_loc : STD_LOGIC := '0'; --f1i_wr_en_loc,f1i_full_loc,
	SIGNAL f1i_rd_data_loc : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0'); --f1i_wr_data_loc,
	SIGNAL f1o_wr_en_loc, f1o_full_loc : STD_LOGIC := '0'; --f1o_empty_loc,f1o_rd_en_loc
	SIGNAL f1o_wr_data_loc : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0'); --f1o_rd_data_loc
	SIGNAL local_in : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');

BEGIN
	alu1 : alu PORT MAP(
		data_a => data_a,
		data_b => data_b,
		sel => sel,
		data_out => data_out);
	rf1 : register_file PORT MAP(
		clk => clk,
		wr => wr,
		rd => rd,
		Ri => Ri_adr,
		Rj => Rj_adr,
		Rk => Rk_adr_mux,
		data_in => data_in,
		data_out_i => data_out_i,
		data_out_j => data_out_j);
	pc1 : pc PORT MAP(
		clk => clk,
		en => pc_en,
		pc_out => pc_out);

	im1 : instruction_mem PORT MAP(
		clk => clk,
		en => mem_en,
		address => address,
		data_out => data_out_mem);

	du1 : decode_unit PORT MAP(
		instruction => instruction,
		current_pos => current_pos,
		Ri_adr => Ri_adr,
		Rj_adr => Rj_adr,
		Rk_adr => Rk_adr,
		sel => sel,
		send_out => send_out);
	F1in_loc : fifo_32b PORT MAP(
		i_rst_sync => rst,
		i_clk => clk,
		i_wr_en => f1i_wr_en_loc,
		i_wr_data => f1i_wr_data_loc,
		o_full => f1i_full_loc,
		i_rd_en => f1i_rd_en_loc,
		o_rd_data => f1i_rd_data_loc,
		o_empty => f1i_empty_loc
	);
	F1out_loc : fifo_32b PORT MAP(
		i_rst_sync => rst,
		i_clk => clk,
		i_wr_en => f1o_wr_en_loc,
		i_wr_data => f1o_wr_data_loc,
		o_full => f1o_full_loc,
		i_rd_en => f1o_rd_en_loc,
		o_rd_data => f1o_rd_data_loc,
		o_empty => f1o_empty_loc
	);

	data_a <= data_out_i;
	data_b <= data_out_j;

	wr <= '1' WHEN ((sel /= "000") OR req = '1') ELSE
		'0';
	rd <= '1' WHEN (sel /= "000") OR (send_out = '1') ELSE
		'0';
	instruction <= data_out_mem;
	address <= pc_out;
	mem_en <= '1'; -- start memory
	-- send data out of local cpu
	f1o_wr_data_loc <= instruction(31 DOWNTO 17) & '0' & instruction(15 DOWNTO 12) & "0000" & data_out_i WHEN (send_out = '1') ELSE
		(OTHERS => '0');
	f1o_wr_en_loc <= send_out WHEN f1o_full_loc = '0' ELSE
		'0';
	-- recieve data from out of local cpu
	req <= NOT f1i_empty_loc;
	local_in <= f1i_rd_data_loc;
	f1i_rd_en_loc <= req WHEN f1i_empty_loc = '0' ELSE
		'0';
	pc_en <= '0' WHEN req = '1' ELSE
		'1';
	Rk_adr_mux <= Rk_adr WHEN req = '0' ELSE
		local_in(14 DOWNTO 12);
	data_in <= data_out WHEN req = '0' ELSE
		local_in(7 DOWNTO 0);
END Behavioral;