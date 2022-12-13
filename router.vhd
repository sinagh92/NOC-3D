----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:22:33 06/10/2018 
-- Design Name: 
-- Module Name:    router - Behavioral 
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

ENTITY router IS
	PORT (
		clk : IN STD_LOGIC;
		rst : IN STD_LOGIC;
		current_pos : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		-- fifo in 1
		f1i_rd_en : OUT STD_LOGIC;
		f1i_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		f1i_empty : IN STD_LOGIC;
		-- fifo out 1
		f1o_wr_en : OUT STD_LOGIC;
		f1o_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		f1o_full : IN STD_LOGIC;
		-- fifo in 2
		f2i_rd_en : OUT STD_LOGIC;
		f2i_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		f2i_empty : IN STD_LOGIC;
		-- fifo out 2
		f2o_wr_en : OUT STD_LOGIC;
		f2o_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		f2o_full : IN STD_LOGIC;
		-- fifo in 3
		f3i_rd_en : OUT STD_LOGIC;
		f3i_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		f3i_empty : IN STD_LOGIC;
		-- fifo out 3
		f3o_wr_en : OUT STD_LOGIC;
		f3o_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		f3o_full : IN STD_LOGIC;
		-- fifo in 4
		f4i_rd_en : OUT STD_LOGIC;
		f4i_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		f4i_empty : IN STD_LOGIC;
		-- fifo out 4
		f4o_wr_en : OUT STD_LOGIC;
		f4o_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		f4o_full : IN STD_LOGIC;
		-- fifo in 5
		f5i_rd_en : OUT STD_LOGIC;
		f5i_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		f5i_empty : IN STD_LOGIC;
		-- fifo out 5
		f5o_wr_en : OUT STD_LOGIC;
		f5o_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		f5o_full : IN STD_LOGIC;
		-- fifo in 6
		f6i_rd_en : OUT STD_LOGIC;
		f6i_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		f6i_empty : IN STD_LOGIC;
		-- fifo out 6
		f6o_wr_en : OUT STD_LOGIC;
		f6o_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		f6o_full : IN STD_LOGIC;
		-- fifo in local
		fi_rd_en_loc : OUT STD_LOGIC;
		fi_rd_data_loc : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		fi_empty_loc : IN STD_LOGIC;
		-- fifo out local
		fo_wr_en_loc : OUT STD_LOGIC;
		fo_wr_data_loc : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		fo_full_loc : IN STD_LOGIC
	);
END router;

ARCHITECTURE Behavioral OF router IS
	COMPONENT crossbar_switch
		PORT (-- input ports
			clk, en : IN STD_LOGIC;
			grant : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
			in1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			in2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			in3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			in4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			in5 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			in6 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			in_local : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			-- output ports
			out1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			out2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			out3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			out4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			out5 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			out6 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			out_local : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			-- control signal
			control : IN STD_LOGIC_VECTOR(20 DOWNTO 0);
			wr_en_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
			wr_en_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
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

	COMPONENT routing_unit
		PORT (
			en : IN STD_LOGIC;
			data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			out_dir : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			current_pos : IN STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT scheduler
		PORT (
			clk : IN STD_LOGIC;
			rst : IN STD_LOGIC;
			req : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
			grant : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- read when granted
			data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- to routing unit
			in_dir : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- direction
			control : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
			wr_req : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
		);
	END COMPONENT;
	SIGNAL data_in_rout, in1, in2, in3, in4, in5, in6, out1, out2, out3, out4, out5, out6, in_local, out_local : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL direction : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');

	SIGNAL control : STD_LOGIC_VECTOR(20 DOWNTO 0);
	SIGNAL data_in_scheduler, data_out_scheduler : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');

	SIGNAL req, grant, wr_req, wr_en_in, wr_en_out : STD_LOGIC_VECTOR (6 DOWNTO 0) := "0000000";
	SIGNAL en_cb, en_routing : STD_LOGIC := '0';

BEGIN
	R1 : routing_unit PORT MAP(
		en => en_routing,
		data_in => data_in_rout,
		out_dir => direction,
		current_pos => current_pos);
	S1 : scheduler PORT MAP(
		clk => clk,
		rst => rst,
		req => req,
		grant => grant,
		data_in => data_in_scheduler,
		data_out => data_out_scheduler,
		in_dir => direction,
		control => control,
		wr_req => wr_req);
	C1 : crossbar_switch PORT MAP(
		clk => clk, en => en_cb, grant => grant,
		in1 => in1, in2 => in2, in3 => in3, in4 => in4, in5 => in5, in6 => in6, in_local => in_local,
		out1 => out1, out2 => out2, out3 => out3, out4 => out4, out5 => out5, out6 => out6, out_local => out_local,
		control => control,
		wr_en_in => wr_en_in,
		wr_en_out => wr_en_out
	);

	data_in_rout <= data_out_scheduler;

	data_in_scheduler <= f1i_rd_data WHEN grant(1) = '1'
		ELSE
		f2i_rd_data WHEN grant(2) = '1'
		ELSE
		f3i_rd_data WHEN grant(3) = '1'
		ELSE
		f4i_rd_data WHEN grant(4) = '1'
		ELSE
		f5i_rd_data WHEN grant(5) = '1'
		ELSE
		f6i_rd_data WHEN grant(6) = '1'
		ELSE
		fi_rd_data_loc WHEN grant(0) = '1'
		ELSE
		(OTHERS => '0');

	in1 <= f1i_rd_data;
	in2 <= f2i_rd_data;
	in3 <= f3i_rd_data;
	in4 <= f4i_rd_data;
	in5 <= f5i_rd_data;
	in6 <= f6i_rd_data;
	in_local <= fi_rd_data_loc;

	req(0) <= NOT fi_empty_loc;
	req(1) <= NOT f1i_empty;
	req(2) <= NOT f2i_empty;
	req(3) <= NOT f3i_empty;
	req(4) <= NOT f4i_empty;
	req(5) <= NOT f5i_empty;
	req(6) <= NOT f6i_empty;
	fi_rd_en_loc <= grant(0) WHEN (fi_empty_loc = '0') ELSE
		'0';
	f1i_rd_en <= grant(1) WHEN (f1i_empty = '0') ELSE
		'0';
	f2i_rd_en <= grant(2) WHEN (f2i_empty = '0') ELSE
		'0';
	f3i_rd_en <= grant(3) WHEN (f3i_empty = '0') ELSE
		'0';
	f4i_rd_en <= grant(4) WHEN (f4i_empty = '0') ELSE
		'0';
	f5i_rd_en <= grant(5) WHEN (f5i_empty = '0') ELSE
		'0';
	f6i_rd_en <= grant(6) WHEN (f6i_empty = '0') ELSE
		'0';
	wr_en_in <= wr_req;

	en_routing <= '1' WHEN (req /= "0000000") ELSE
		'0';

	fo_wr_en_loc <= wr_en_out(0) WHEN (fo_full_loc = '0') ELSE
		'0';
	f1o_wr_en <= wr_en_out(1) WHEN (f1o_full = '0') ELSE
		'0';
	f2o_wr_en <= wr_en_out(2) WHEN (f2o_full = '0') ELSE
		'0';
	f3o_wr_en <= wr_en_out(3) WHEN (f3o_full = '0') ELSE
		'0';
	f4o_wr_en <= wr_en_out(4) WHEN (f4o_full = '0') ELSE
		'0';
	f5o_wr_en <= wr_en_out(5) WHEN (f5o_full = '0') ELSE
		'0';
	f6o_wr_en <= wr_en_out(6) WHEN (f6o_full = '0') ELSE
		'0';

	fo_wr_data_loc <= out_local;
	f1o_wr_data <= out1;
	f2o_wr_data <= out2;
	f3o_wr_data <= out3;
	f4o_wr_data <= out4;
	f5o_wr_data <= out5;
	f6o_wr_data <= out6;

	en_cb <= '1' WHEN (wr_req /= "0000000") ELSE
		'0';
END Behavioral;