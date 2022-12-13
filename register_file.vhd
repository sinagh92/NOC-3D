----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:28:24 06/08/2018 
-- Design Name: 
-- Module Name:    register_file - Behavioral 
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

ENTITY register_file IS
	PORT (
		clk : IN STD_LOGIC;
		wr : IN STD_LOGIC;
		rd : IN STD_LOGIC;
		Ri : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		Rj : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		Rk : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_out_i : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_out_j : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END register_file;

ARCHITECTURE Behavioral OF register_file IS
	TYPE memory_type IS ARRAY (0 TO 7) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
	-- initial value for register file
	SIGNAL memory : memory_type := ("00000000", "00000001", "00000010",
	"00000011", "00000100", "00000101", "00000110", "00000111");
BEGIN
	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF (wr = '1') THEN
				memory(to_integer(unsigned(Rk))) <= data_in;
			END IF;
		END IF;
	END PROCESS;
	data_out_i <= memory(to_integer(unsigned(Ri))) WHEN rd = '1' ELSE
		(OTHERS => '0');
	data_out_j <= memory(to_integer(unsigned(Rj))) WHEN rd = '1' ELSE
		(OTHERS => '0');
END Behavioral;