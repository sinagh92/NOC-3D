----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:01:13 06/09/2018 
-- Design Name: 
-- Module Name:    instruction_mem - Behavioral 
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
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY instruction_mem IS
	PORT (
		clk : IN STD_LOGIC;
		en : IN STD_LOGIC;
		address : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END instruction_mem;

ARCHITECTURE Behavioral OF instruction_mem IS
	TYPE memory_type IS ARRAY (0 TO 7) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL memory : memory_type := (
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000"
	);
BEGIN
	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF (en = '1') THEN
				data_out <= memory(to_integer(unsigned(address)));
			ELSE
				data_out <= (OTHERS => '0');
			END IF;
		END IF;
	END PROCESS;

END Behavioral;