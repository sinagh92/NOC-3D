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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_mem is
	port(
		clk :  in std_logic;
		en : in std_logic;
		address : in std_logic_vector(4 downto 0);
		data_out : out std_logic_vector(31 downto 0)
		);
end instruction_mem;

architecture Behavioral of instruction_mem is
type memory_type is array (0 to 7) of std_logic_vector(31 downto 0);
signal memory : memory_type := (
										  x"00000000",
										  x"00000000",
										  x"00000000",
										  x"00000000",
										  x"00000000",
										  x"00000000",
										  x"00000000",
										  x"00000000"						  										  
										  );
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if(en = '1') then 
				data_out <= memory(to_integer(unsigned(address)));
				else
				data_out <= (others => '0');
			end if;
		end if;
	end process;

end Behavioral;

