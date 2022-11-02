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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
	port(
			data_a : in std_logic_vector (7 downto 0);
			data_b : in std_logic_vector (7 downto 0);
			sel : in std_logic_vector (2 downto 0);
			data_out : out std_logic_vector (7 downto 0)
		);
end alu;

architecture Behavioral of alu is

begin
	data_out <= data_a + data_b when sel = "001"
			else data_a - data_b when sel = "010"
			else data_a and data_b when sel = "011"
			else data_a or data_b when sel = "100"
			else not data_a when sel = "101"
			else data_a xor data_b when sel = "110"
			else data_a nand data_b when sel = "111"
			else (others=>'0');

end Behavioral;

