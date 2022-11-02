----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:33:43 06/08/2018 
-- Design Name: 
-- Module Name:    crossbar_swtich - Behavioral 
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

entity crossbar_switch is
	port(
		clk, en : in std_logic;
		grant : in std_logic_vector(6 downto 0);
		-- input ports
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
		wr_en_out : out std_logic_vector(6 downto 0)
		);
		
end crossbar_switch;

architecture Behavioral of crossbar_switch is
signal in1r,in2r,in3r,in4r,in5r,in6r,in_localr : std_logic_vector(31 downto 0) := (others =>'0');
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(en = '1') then
		
			if(control(2 downto 0) = "111" and grant(0) = '1') then
					out_local <= in_local;
				elsif(control(2 downto 0) ="001" and grant(1) = '1') then
					out_local <= in1;
				elsif(control(2 downto 0) ="010" and grant(2) = '1') then
					out_local <= in2;
				elsif(control(2 downto 0) ="011" and grant(3) = '1') then
					out_local <= in3;
				elsif(control(2 downto 0) ="100" and grant(4) = '1') then
					out_local <= in4;
				elsif(control(2 downto 0) ="101" and grant(5) = '1') then
					out_local <= in5;
				elsif(control(2 downto 0) ="110" and grant(6) = '1') then
					out_local <= in6;
				else
						out_local <= (others=>'0');
			end if;	
			
				if(control(5 downto 3) = "111" and grant(0) = '1') then
					out1 <= in_local;
				elsif(control(5 downto 3) ="001" and grant(1) = '1') then
					out1 <= in1;
				elsif(control(5 downto 3) ="010" and grant(2) = '1') then
					out1 <= in2;
				elsif(control(5 downto 3) ="011" and grant(3) = '1') then
					out1 <= in3;
				elsif(control(5 downto 3) ="100" and grant(4) = '1') then
					out1 <= in4;
				elsif(control(5 downto 3) ="101" and grant(5) = '1') then
					out1 <= in5;
				elsif(control(5 downto 3) ="110" and grant(6) = '1') then
					out1 <= in6;
				else
					out1 <= (others=>'0');
			end if;	

				if(control(8 downto 6) = "111" and grant(0) = '1') then
					out2 <= in_local;
				elsif(control(8 downto 6) ="001" and grant(1) = '1') then
					out2 <= in1;
				elsif(control(8 downto 6) ="010" and grant(2) = '1') then
					out2 <= in2;
				elsif(control(8 downto 6) ="011" and grant(3) = '1') then
					out2 <= in3;
				elsif(control(8 downto 6) ="100" and grant(4) = '1') then
					out2 <= in4;
				elsif(control(8 downto 6) ="101" and grant(5) = '1') then
					out2 <= in5;
				elsif(control(8 downto 6) ="110" and grant(6) = '1') then
					out2 <= in6;
				else
					out2 <= (others=>'0');
			end if;	
			
				if(control(11 downto 9) = "111" and grant(0) = '1') then
					out3 <= in_local;
				elsif(control(11 downto 9) ="001" and grant(1) = '1') then
					out3 <= in1;
				elsif(control(11 downto 9) ="010" and grant(2) = '1') then
					out3 <= in2;
				elsif(control(11 downto 9) ="011" and grant(3) = '1') then
					out3 <= in3;
				elsif(control(11 downto 9) ="100" and grant(4) = '1') then
					out3 <= in4;
				elsif(control(11 downto 9) ="101" and grant(5) = '1') then
					out3 <= in5;
				elsif(control(11 downto 9) ="110" and grant(6) = '1') then
					out3 <= in6;
				else
					out3 <= (others=>'0');
			end if;				
			
				if(control(14 downto 12) = "111" and grant(0) = '1') then
					out4 <= in_local;
				elsif(control(14 downto 12) ="001" and grant(1) = '1') then
					out4 <= in1;
				elsif(control(14 downto 12) ="010" and grant(2) = '1') then
					out4 <= in2;
				elsif(control(14 downto 12) ="011" and grant(3) = '1') then
					out4 <= in3;
				elsif(control(14 downto 12) ="100" and grant(4) = '1') then
					out4 <= in4;
				elsif(control(14 downto 12) ="101" and grant(5) = '1') then
					out4 <= in5;
				elsif(control(14 downto 12) ="110" and grant(6) = '1') then
					out4 <= in6;
				else
					out4 <= (others=>'0');
			end if;				

				if(control(17 downto 15) = "111" and grant(0) = '1') then
					out5 <= in_local;
				elsif(control(17 downto 15) ="001" and grant(1) = '1') then
					out5 <= in1;
				elsif(control(17 downto 15) ="010" and grant(2) = '1') then
					out5 <= in2;
				elsif(control(17 downto 15) ="011" and grant(3) = '1') then
					out5 <= in3;
				elsif(control(17 downto 15) ="100" and grant(4) = '1') then
					out5 <= in4;
				elsif(control(17 downto 15) ="101" and grant(5) = '1') then
					out5 <= in5;
				elsif(control(17 downto 15) ="110" and grant(6) = '1') then
					out5 <= in6;
				else
					out5 <= (others=>'0');
			end if;				

				if(control(20 downto 18) = "111" and grant(0) = '1') then
					out6 <= in_local;
				elsif(control(20 downto 18) ="001" and grant(1) = '1') then
					out6 <= in1;
				elsif(control(20 downto 18) ="010" and grant(2) = '1') then
					out6 <= in2;
				elsif(control(20 downto 18) ="011" and grant(3) = '1') then
					out6 <= in3;
				elsif(control(20 downto 18) ="100" and grant(4) = '1') then
					out6 <= in4;
				elsif(control(20 downto 18) ="101" and grant(5) = '1') then
					out6 <= in5;
				elsif(control(20 downto 18) ="110" and grant(6) = '1') then
					out6 <= in6;
				else
					out6 <= (others=>'0');
			end if;	
		wr_en_out <= wr_en_in;
			else
				wr_en_out <= (others=>'0');
				out_local <=  (others=>'0');
				out1 <= (others=>'0');
				out2 <= (others=>'0');
				out3 <= (others=>'0');
				out4 <= (others=>'0');
				out5 <= (others=>'0');
				out6 <= (others=>'0');				
				
		end if; -- enable
		end if; -- rise edge clk
	end process;
end Behavioral;

