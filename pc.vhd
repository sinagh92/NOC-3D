----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:28:57 06/08/2018 
-- Design Name: 
-- Module Name:    pc - Behavioral 
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

ENTITY pc IS
	PORT (
		clk : IN STD_LOGIC;
		en : IN STD_LOGIC;
		pc_out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END pc;

ARCHITECTURE Behavioral OF pc IS
	SIGNAL counter : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";

BEGIN
	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF (en = '1') THEN
				IF (counter = "00111") THEN
					counter <= "00000";
				ELSE
					counter <= counter + "00001";
				END IF;
			END IF;
		END IF;
	END PROCESS;

	pc_out <= counter;
END Behavioral;