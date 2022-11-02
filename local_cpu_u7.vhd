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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity local_cpu_u7 is
		port(
				clk : in std_logic;
				rst : in std_logic;
				current_pos : in std_logic_vector(15 downto 0);
				 --- inside fifo
				f1i_wr_en_loc : in std_logic;
				f1i_wr_data_loc : in std_logic_vector(31 downto 0);
				f1i_full_loc : out std_logic;
				--- outside fifo
				f1o_rd_en_loc : in std_logic;
				f1o_rd_data_loc : out std_logic_vector(31 downto 0);
				f1o_empty_loc : out std_logic
				);
end local_cpu_u7;

architecture Behavioral of local_cpu_u7 is
component alu
	port(
			data_a : in std_logic_vector (7 downto 0);
			data_b : in std_logic_vector (7 downto 0);
			sel : in std_logic_vector (2 downto 0);
			data_out : out std_logic_vector (7 downto 0)
		);
 end component;

component register_file 
	port(
		clk :  in std_logic;
		wr : in std_logic;
		rd : in std_logic;
		Ri : in std_logic_vector(2 downto 0);
		Rj : in std_logic_vector(2 downto 0);
		Rk : in std_logic_vector(2 downto 0);
		data_in : in std_logic_vector(7 downto 0);
		data_out_i : out std_logic_vector(7 downto 0);
		data_out_j : out std_logic_vector(7 downto 0)
		);
end component;
component instruction_mem_u7
	port(
		clk :  in std_logic;
		en : in std_logic;
		address : in std_logic_vector(4 downto 0);
		data_out : out std_logic_vector(31 downto 0)
		);
end component;
component pc 
	port(
			clk :  in std_logic;
			en : in std_logic;
			pc_out : out std_logic_vector(4 downto 0)
			);
end component;
component decode_unit
	port( instruction : in std_logic_vector (31 downto 0);
			current_pos : in std_logic_vector (15 downto 0);
			Ri_adr : out std_logic_vector (2 downto 0);
			Rj_adr : out std_logic_vector (2 downto 0);
			Rk_adr : out std_logic_vector (2 downto 0);
			sel : out std_logic_vector (2 downto 0);
			send_out: out std_logic);
end component;
 component fifo_32b 
  generic (
    g_WIDTH : natural := 32;
    g_DEPTH : integer := 8
    );
  port (
    i_rst_sync : in std_logic;
    i_clk      : in std_logic;
    -- FIFO Write Interface
    i_wr_en   : in  std_logic;
    i_wr_data : in  std_logic_vector(g_WIDTH-1 downto 0);
    o_full    : out std_logic;
    -- FIFO Read Interface
    i_rd_en   : in  std_logic;
    o_rd_data : out std_logic_vector(g_WIDTH-1 downto 0);
    o_empty   : out std_logic
    );
end component;
signal data_a,data_b,data_out, data_in,data_out_i,data_out_j : std_logic_vector (7 downto 0) := (others => '0');
signal sel : std_logic_vector(2 downto 0) := (others=> '0');
signal wr,rd,mem_en,pc_en,send_out,req : std_logic := '0';
signal Ri_adr,Rj_adr,Rk_adr,Rk_adr_mux : std_logic_vector(2 downto 0) := (others=> '0');
signal pc_out,address : std_logic_vector(4 downto 0);
signal data_out_mem,instruction : std_logic_vector(31 downto 0);
signal f1i_empty_loc,f1i_rd_en_loc : std_logic := '0'; --f1i_wr_en_loc,f1i_full_loc,
signal f1i_rd_data_loc: std_logic_vector(31 downto 0):= (others => '0'); --f1i_wr_data_loc,
signal f1o_wr_en_loc,f1o_full_loc : std_logic := '0'; --f1o_empty_loc,f1o_rd_en_loc
signal f1o_wr_data_loc: std_logic_vector(31 downto 0) := (others => '0'); --f1o_rd_data_loc
signal local_in : std_logic_vector(31 downto 0) := (others => '0');

begin
alu1 : alu port map(data_a => data_a,
							data_b => data_b,
							sel => sel,
							data_out => data_out);
rf1 : register_file port map(clk => clk,
										wr => wr,
										rd => rd,
										Ri => Ri_adr,
										Rj => Rj_adr,
										Rk => Rk_adr_mux,
										data_in => data_in,
										data_out_i => data_out_i,
										data_out_j => data_out_j);
pc1 : pc port map(clk => clk,
						en => pc_en,
						pc_out => pc_out);

im1 : instruction_mem_u7 port map( clk => clk,
										  en => mem_en,
										  address => address,
										  data_out => data_out_mem);

du1 : decode_unit port map(instruction =>instruction,
									current_pos => current_pos,
									Ri_adr => Ri_adr,
									Rj_adr => Rj_adr,
									Rk_adr => Rk_adr,
									sel => sel,
									send_out => send_out);


F1in_loc : fifo_32b port map (
    i_rst_sync => rst,
    i_clk => clk,
    i_wr_en => f1i_wr_en_loc,
    i_wr_data=> f1i_wr_data_loc,
    o_full => f1i_full_loc,
    i_rd_en => f1i_rd_en_loc,
    o_rd_data => f1i_rd_data_loc,
    o_empty => f1i_empty_loc
    );		
F1out_loc : fifo_32b port map (
    i_rst_sync => rst,
    i_clk => clk,
    i_wr_en => f1o_wr_en_loc,
    i_wr_data=> f1o_wr_data_loc,
    o_full => f1o_full_loc,
    i_rd_en => f1o_rd_en_loc,
    o_rd_data => f1o_rd_data_loc,
    o_empty => f1o_empty_loc
    );										 
									
data_a <= data_out_i;
data_b <= data_out_j;

wr <=	'1' when ((sel /= "000") or req = '1') else '0';
rd <= '1' when (sel /= "000") or (send_out = '1') else '0'; 								
instruction <= data_out_mem;									
address <= pc_out;
mem_en <= '1'; -- start memory
-- send data out of local cpu
f1o_wr_data_loc <= instruction(31 downto 17) & '0' & instruction(15 downto 12) & "0000" & data_out_i when (send_out = '1') else (others =>'0');
f1o_wr_en_loc <= send_out when f1o_full_loc = '0' else '0';
-- recieve data from out of local cpu
req <= not f1i_empty_loc;
local_in <= f1i_rd_data_loc;
f1i_rd_en_loc <= req when f1i_empty_loc = '0' else '0';
pc_en <= '0' when req = '1' else '1';
Rk_adr_mux <= Rk_adr when req = '0' else local_in(14 downto 12);
data_in <= data_out when req = '0' else local_in(7 downto 0);
end Behavioral;


