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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decode_unit is
	port( instruction : in std_logic_vector (31 downto 0);
			current_pos : in std_logic_vector (15 downto 0);
			Ri_adr : out std_logic_vector (2 downto 0);
			Rj_adr : out std_logic_vector (2 downto 0);
			Rk_adr : out std_logic_vector (2 downto 0);
			sel : out std_logic_vector (2 downto 0);
			send_out: out std_logic);
end decode_unit;

architecture Behavioral of decode_unit is
begin
	sel <= instruction(2 downto 0) when (instruction(31 downto 16) = current_pos)
			else "000"; -- opcode;
	Ri_adr <= instruction(11 downto 9) when (instruction(31 downto 16) = current_pos)
			else instruction(10 downto 8) when (instruction(16) = '1')
			else "000";
	Rj_adr <= instruction(8 downto 6) when (instruction(31 downto 16) = current_pos)
			else "000";
	Rk_adr <= instruction(5 downto 3) when (instruction(31 downto 16) = current_pos)
			else "000";
	send_out <= instruction(16);
end Behavioral;

