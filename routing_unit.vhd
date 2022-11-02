----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:35:17 06/08/2018 
-- Design Name: 
-- Module Name:    routing_unit - Behavioral 
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

entity routing_unit is
	port(
		en : in std_logic;
		data_in : in std_logic_vector(31 downto 0);
		out_dir : out std_logic_vector(2 downto 0);
		current_pos : in std_logic_vector(15 downto 0)
		);
end routing_unit;

architecture Behavioral of routing_unit is
signal x_val : std_logic_vector(4 downto 0);
signal y_val : std_logic_vector(4 downto 0);
signal z_val : std_logic_vector(4 downto 0);

signal x_cur : std_logic_vector(4 downto 0);
signal y_cur : std_logic_vector(4 downto 0);
signal z_cur : std_logic_vector(4 downto 0);

begin
	x_val <= data_in(31 downto 27);
	y_val <= data_in(26 downto 22);
	z_val <= data_in(21 downto 17);
	
	x_cur <= current_pos(15 downto 11);
	y_cur <= current_pos(10 downto 6);
	z_cur <= current_pos(5 downto 1);
	
	out_dir <= "001" when x_val > x_cur and en = '1'
			else "010" when x_val < x_cur and en = '1'
			else "011" when y_val < y_cur and en = '1'
			else "100" when y_val > y_cur and en = '1'
			else "101" when z_val > z_cur and en = '1'
			else "110" when z_val < z_cur and en = '1'
			else "111" when ((x_val = x_cur) and (y_val = y_cur) and (z_val = z_cur)  and (en = '1'))
			else "000";

end Behavioral;

