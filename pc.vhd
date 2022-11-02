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

entity pc is
	port(
			clk :  in std_logic;
			en : in std_logic;
			pc_out : out std_logic_vector(4 downto 0)
			);
end pc;

architecture Behavioral of pc is
signal counter : std_logic_vector(4 downto 0) := "00000";

begin
	process(clk)
	begin
		if rising_edge(clk) then
			if( en = '1') then
				if(counter = "00111") then
					counter <= "00000";
					else
					counter <= counter + "00001";
				end if;
			end if;
		end if;
	end process;

	pc_out <= counter;
end Behavioral;

