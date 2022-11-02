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

entity register_file is
	port(
		clk :  in std_logic;
		wr : in std_logic;
		rd : in std_logic;
		Ri : in std_logic_vector(2 downto 0);
		Rj : in std_logic_vector(2 downto 0);
		Rk : in std_logic_vector(2 downto 0);
		data_in : in std_logic_vector(7 downto 0);
		data_out_i : out std_logic_vector(7 downto 0);
		data_out_j : out std_logic_vector(7 downto 0)
		);
end register_file;

architecture Behavioral of register_file is
type memory_type is array (0 to 7) of std_logic_vector(7 downto 0);
-- initial value for register file
signal memory : memory_type := ("00000000", "00000001", "00000010",
                       "00000011","00000100","00000101","00000110","00000111");						  
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if(wr = '1') then
				memory(to_integer(unsigned(Rk))) <= data_in;
			end if;
		end if;
	end process;
data_out_i <= memory(to_integer(unsigned(Ri))) when rd = '1' else (others => '0');
data_out_j <= memory(to_integer(unsigned(Rj))) when rd = '1' else (others => '0');
end Behavioral;

