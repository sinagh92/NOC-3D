----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:29:43 06/08/2018 
-- Design Name: 
-- Module Name:    decode_unit - Behavioral 
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

ENTITY decode_unit IS
	PORT (
		instruction : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		current_pos : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		Ri_adr : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		Rj_adr : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		Rk_adr : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		sel : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		send_out : OUT STD_LOGIC);
END decode_unit;

ARCHITECTURE Behavioral OF decode_unit IS
BEGIN
	sel <= instruction(2 DOWNTO 0) WHEN (instruction(31 DOWNTO 16) = current_pos)
		ELSE
		"000"; -- opcode;
	Ri_adr <= instruction(11 DOWNTO 9) WHEN (instruction(31 DOWNTO 16) = current_pos)
		ELSE
		instruction(10 DOWNTO 8) WHEN (instruction(16) = '1')
		ELSE
		"000";
	Rj_adr <= instruction(8 DOWNTO 6) WHEN (instruction(31 DOWNTO 16) = current_pos)
		ELSE
		"000";
	Rk_adr <= instruction(5 DOWNTO 3) WHEN (instruction(31 DOWNTO 16) = current_pos)
		ELSE
		"000";
	send_out <= instruction(16);
END Behavioral;