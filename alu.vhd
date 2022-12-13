----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:28:01 06/08/2018 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
USE IEEE.std_logic_unsigned.ALL;
USE IEEE.std_logic_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY alu IS
	PORT (
		data_a : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_b : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		sel : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
		data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END alu;

ARCHITECTURE Behavioral OF alu IS

BEGIN
	data_out <= data_a + data_b WHEN sel = "001"
		ELSE
		data_a - data_b WHEN sel = "010"
		ELSE
		data_a AND data_b WHEN sel = "011"
		ELSE
		data_a OR data_b WHEN sel = "100"
		ELSE
		NOT data_a WHEN sel = "101"
		ELSE
		data_a XOR data_b WHEN sel = "110"
		ELSE
		data_a NAND data_b WHEN sel = "111"
		ELSE
		(OTHERS => '0');

END Behavioral;