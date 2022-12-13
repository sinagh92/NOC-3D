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

ENTITY instruction_mem_u1 IS
	PORT (
		clk : IN STD_LOGIC;
		en : IN STD_LOGIC;
		address : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END instruction_mem_u1;

ARCHITECTURE Behavioral OF instruction_mem_u1 IS
	TYPE memory_type IS ARRAY (0 TO 7) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL memory : memory_type := (

		-- first test
		--											x"08430500",
		--											x"08431500",
		--											x"08432500",
		--											x"08433500",
		--											x"08434500",
		--											x"08435500",
		--											x"08436500",
		--											x"08437500"		

		-- second test	(3rd simulation)
		x"08031500",
		x"08032500",
		x"08033300",
		x"08034500",
		x"08035500",
		x"08036500",
		x"08037500",
		x"08030500"
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