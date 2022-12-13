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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY routing_unit IS
	PORT (
		en : IN STD_LOGIC;
		data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_dir : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		current_pos : IN STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END routing_unit;

ARCHITECTURE Behavioral OF routing_unit IS
	SIGNAL x_val : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL y_val : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL z_val : STD_LOGIC_VECTOR(4 DOWNTO 0);

	SIGNAL x_cur : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL y_cur : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL z_cur : STD_LOGIC_VECTOR(4 DOWNTO 0);

BEGIN
	x_val <= data_in(31 DOWNTO 27);
	y_val <= data_in(26 DOWNTO 22);
	z_val <= data_in(21 DOWNTO 17);

	x_cur <= current_pos(15 DOWNTO 11);
	y_cur <= current_pos(10 DOWNTO 6);
	z_cur <= current_pos(5 DOWNTO 1);

	out_dir <= "001" WHEN x_val > x_cur AND en = '1'
		ELSE
		"010" WHEN x_val < x_cur AND en = '1'
		ELSE
		"011" WHEN y_val < y_cur AND en = '1'
		ELSE
		"100" WHEN y_val > y_cur AND en = '1'
		ELSE
		"101" WHEN z_val > z_cur AND en = '1'
		ELSE
		"110" WHEN z_val < z_cur AND en = '1'
		ELSE
		"111" WHEN ((x_val = x_cur) AND (y_val = y_cur) AND (z_val = z_cur) AND (en = '1'))
		ELSE
		"000";

END Behavioral;