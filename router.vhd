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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity router is
	port(
		clk : in std_logic;
		rst : in std_logic;
		current_pos : in std_logic_vector(15 downto 0);
		-- fifo in 1
				f1i_rd_en : out std_logic;
				f1i_rd_data : in std_logic_vector(31 downto 0);
				f1i_empty : in std_logic;
		-- fifo out 1
				f1o_wr_en : out std_logic;
				f1o_wr_data : out std_logic_vector(31 downto 0);
				f1o_full : in std_logic;
		-- fifo in 2
				f2i_rd_en : out std_logic;
				f2i_rd_data : in std_logic_vector(31 downto 0);
				f2i_empty : in std_logic;
		-- fifo out 2
				f2o_wr_en : out std_logic;
				f2o_wr_data : out std_logic_vector(31 downto 0);
				f2o_full : in std_logic;
		-- fifo in 3
				f3i_rd_en : out std_logic;
				f3i_rd_data : in std_logic_vector(31 downto 0);
				f3i_empty : in std_logic;
		-- fifo out 3
				f3o_wr_en : out std_logic;
				f3o_wr_data : out std_logic_vector(31 downto 0);
				f3o_full : in std_logic;
		-- fifo in 4
				f4i_rd_en : out std_logic;
				f4i_rd_data : in std_logic_vector(31 downto 0);
				f4i_empty : in std_logic;
		-- fifo out 4
				f4o_wr_en : out std_logic;
				f4o_wr_data : out std_logic_vector(31 downto 0);
				f4o_full : in std_logic;
		-- fifo in 5
				f5i_rd_en : out std_logic;
				f5i_rd_data : in std_logic_vector(31 downto 0);
				f5i_empty : in std_logic;
		-- fifo out 5
				f5o_wr_en : out std_logic;
				f5o_wr_data : out std_logic_vector(31 downto 0);
				f5o_full : in std_logic;
		-- fifo in 6
				f6i_rd_en : out std_logic;
				f6i_rd_data : in std_logic_vector(31 downto 0);
				f6i_empty : in std_logic;
		-- fifo out 6
				f6o_wr_en : out std_logic;
				f6o_wr_data : out std_logic_vector(31 downto 0);
				f6o_full : in std_logic;
		-- fifo in local
				fi_rd_en_loc : out std_logic;
				fi_rd_data_loc : in std_logic_vector(31 downto 0);
				fi_empty_loc : in std_logic;
		-- fifo out local
				fo_wr_en_loc : out std_logic;
				fo_wr_data_loc : out std_logic_vector(31 downto 0);
				fo_full_loc : in std_logic			
		); 
end router;

architecture Behavioral of router is
 component crossbar_switch
    port(-- input ports
		clk, en : in std_logic;
		grant : in std_logic_vector(6 downto 0);	 
		in1 : in std_logic_vector(31 downto 0);
		in2 : in std_logic_vector(31 downto 0);
		in3 : in std_logic_vector(31 downto 0);
		in4 : in std_logic_vector(31 downto 0);
		in5 : in std_logic_vector(31 downto 0);
		in6 : in std_logic_vector(31 downto 0);
		in_local : in std_logic_vector(31 downto 0);
		-- output ports
		out1 : out std_logic_vector(31 downto 0);
		out2 : out std_logic_vector(31 downto 0);
		out3 : out std_logic_vector(31 downto 0);
		out4 : out std_logic_vector(31 downto 0);
		out5 : out std_logic_vector(31 downto 0);
		out6 : out std_logic_vector(31 downto 0);
		out_local : out std_logic_vector(31 downto 0);
		-- control signal
		control : in std_logic_vector(20 downto 0);
		wr_en_in : in std_logic_vector(6 downto 0);
		wr_en_out : out std_logic_vector(6 downto 0));
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

component routing_unit
	port(
		en : in std_logic;
		data_in : in std_logic_vector(31 downto 0);
		out_dir : out std_logic_vector(2 downto 0);
		current_pos : in std_logic_vector(15 downto 0)
		);
end component;
component scheduler
	port(
		clk : in std_logic;
		rst : in std_logic;
		req : in std_logic_vector(6 downto 0);
		grant : out std_logic_vector(6 downto 0);
		data_in : in std_logic_vector(31 downto 0);	-- read when granted
		data_out : out std_logic_vector(31 downto 0);	-- to routing unit
		in_dir : in std_logic_vector (2 downto 0); -- direction
		control : out std_logic_vector(20 downto 0);
		wr_req : out std_logic_vector(6 downto 0)
		);
end component;
signal data_in_rout,in1,in2,in3,in4,in5,in6,out1,out2,out3,out4,out5,out6, in_local,out_local : std_logic_vector(31 downto 0):= (others => '0');
signal direction : std_logic_vector(2 downto 0):= (others => '0');

signal control : std_logic_vector(20 downto 0);
signal data_in_scheduler,data_out_scheduler : std_logic_vector (31 downto 0):= (others => '0');

signal req,grant,wr_req,wr_en_in,wr_en_out: std_logic_vector (6 downto 0) := "0000000";
signal en_cb,en_routing: std_logic := '0';
		
begin
R1 : routing_unit port map (	en => en_routing,
									data_in => data_in_rout,
									out_dir => direction,
									current_pos => current_pos);
S1 : scheduler port map (clk => clk,
								 rst => rst,
								 req => req,
								 grant => grant,
								 data_in => data_in_scheduler,
								 data_out => data_out_scheduler,
								 in_dir => direction,
								 control => control,
								 wr_req => wr_req);
C1 : crossbar_switch port map (clk => clk, en=> en_cb, grant => grant,
										 in1 => in1, in2 => in2, in3 => in3, in4 => in4, in5 => in5, in6 =>in6, in_local => in_local,
										 out1 => out1, out2 => out2, out3 => out3, out4 => out4, out5 => out5, out6 => out6, out_local=> out_local,
										 control => control,
										 wr_en_in => wr_en_in,
										 wr_en_out => wr_en_out
										 );

		
	
	data_in_rout <= data_out_scheduler;
	
	data_in_scheduler <= f1i_rd_data when grant(1) = '1'
						else  f2i_rd_data when grant(2) = '1'
						else  f3i_rd_data when grant(3) = '1'
						else  f4i_rd_data when grant(4) = '1'
						else  f5i_rd_data when grant(5) = '1'
						else  f6i_rd_data when grant(6) = '1'
						else  fi_rd_data_loc when grant(0) = '1'
						else (others=>'0');
	
	 in1 <= f1i_rd_data;
	 in2 <= f2i_rd_data;
	 in3 <= f3i_rd_data;
	 in4 <= f4i_rd_data;
	 in5 <= f5i_rd_data;
	 in6 <= f6i_rd_data;
	 in_local <= fi_rd_data_loc;
	 
	 req(0) <= not fi_empty_loc;
	 req(1) <= not f1i_empty;
	 req(2) <= not f2i_empty;
	 req(3) <= not f3i_empty;
	 req(4) <= not f4i_empty;
	 req(5) <= not f5i_empty;
	 req(6) <= not f6i_empty;
	 
	
	 fi_rd_en_loc  <= grant(0) when (fi_empty_loc = '0') else '0';
	 f1i_rd_en <= grant(1) when (f1i_empty = '0') else '0';
	 f2i_rd_en <= grant(2) when (f2i_empty = '0') else '0';
	 f3i_rd_en <= grant(3) when (f3i_empty = '0') else '0';
	 f4i_rd_en <= grant(4) when (f4i_empty = '0') else '0';
	 f5i_rd_en <= grant(5) when (f5i_empty = '0') else '0';
	 f6i_rd_en <= grant(6) when (f6i_empty = '0') else '0';


	 wr_en_in <= wr_req;
	 
	 en_routing <= '1' when (req /= "0000000") else '0';
	 
	 fo_wr_en_loc <= wr_en_out(0) when (fo_full_loc = '0') else '0';
	 f1o_wr_en <= wr_en_out(1) when (f1o_full = '0') else '0';
	 f2o_wr_en <= wr_en_out(2) when (f2o_full = '0') else '0';
	 f3o_wr_en <= wr_en_out(3) when (f3o_full = '0') else '0';
	 f4o_wr_en <= wr_en_out(4) when (f4o_full = '0') else '0';
	 f5o_wr_en <= wr_en_out(5) when (f5o_full = '0') else '0';
	 f6o_wr_en <= wr_en_out(6) when (f6o_full = '0') else '0';
	 
	 fo_wr_data_loc <= out_local;
	 f1o_wr_data <= out1; 
	 f2o_wr_data <= out2; 
	 f3o_wr_data <= out3; 
	 f4o_wr_data <= out4; 
	 f5o_wr_data <= out5; 
	 f6o_wr_data <= out6; 
	 
	 en_cb <= '1' when (wr_req/="0000000") else '0'; 
end Behavioral;

