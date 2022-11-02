----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:35:51 06/08/2018 
-- Design Name: 
-- Module Name:    scheduler - Behavioral 
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

entity scheduler is
	port(
		clk : in std_logic;
		rst : in std_logic;
		req : in std_logic_vector(6 downto 0);
		grant : out std_logic_vector(6 downto 0);
		data_in : in std_logic_vector(31 downto 0);	-- read when granted
		data_out : out std_logic_vector(31 downto 0);	-- to routing unit
		in_dir : in std_logic_vector (2 downto 0); -- direction
		control : out std_logic_vector(20 downto 0);
		wr_req : out std_logic_vector(6 downto 0)
		);
end scheduler;

architecture Behavioral of scheduler is
TYPE State_type IS (s_ideal, s0, s1, s2, s3, s4, s5, s6);  -- Define the states
	signal state : State_Type;    -- Create a signal that uses
	signal next_state : State_Type;
	signal count,countr : std_logic_vector(1 downto 0);
begin
clk_process:	process(clk,rst)
		begin
		if(rising_edge(clk)) then
			if(rst = '1') then
				state <= s_ideal;
				countr <= "00";
			else
				state <= next_state;
				countr <= countr + "01";
			end if;
		end if;
	end process;
	
states_process: 	process(clk)
		begin
		if(rising_edge(clk)) then
			case state is
			when s0 =>  	-------------------------- s0
				if(req(0) = '1') then
					if(count = "11") then
						if(req(1) ='1') then
							count <= "00";
							next_state <= s1;
						elsif(req(2) = '1') then
							count <= "00";
							next_state <= s2;
						elsif(req(3) = '1') then
							count <= "00";
							next_state <= s3;
						elsif(req(4) = '1') then
							count <= "00";
							next_state <= s4;
						elsif(req(5) = '1') then
							count <= "00";
							next_state <= s5;
						elsif(req(6) = '1') then
							count <= "00";
							next_state <= s6;
						end if;
					else
						count <= count + "01";
						next_state <= s0;	----------s0
					end if;
				elsif( req(1) = '1') then
					count <= "00";
					next_state <= s1;
				elsif( req(2) = '1') then
					count <= "00";
					next_state <= s2;
				elsif( req(3) = '1') then
					count <= "00";
					next_state <= s3;
				elsif( req(4) = '1') then
					count <= "00";
					next_state <= s4;
				elsif( req(5) = '1') then
					count <= "00";
					next_state <= s5;
				elsif( req(6) = '1') then 
					count <= "00";
					next_state <= s6;
				else 
					count <= "00";
					next_state <= s_ideal;
				end if;
		when s1 =>  	-------------------------- s1
				if(req(1) = '1') then
					if(count = "11") then
						if(req(2) = '1') then
							count <= "00";
							next_state <= s2;
						elsif(req(3) = '1') then
							count <= "00";
							next_state <= s3;
						elsif(req(4) = '1') then
							count <= "00";
							next_state <= s4;
						elsif(req(5) = '1') then
							count <= "00";
							next_state <= s5;
						elsif(req(6) = '1') then
							count <= "00";
							next_state <= s6;
						elsif(req(0) ='1') then
							count <= "00";
							next_state <= s0;	
						end if;
					else
						count <= count + "01";
						next_state <= s1;			------- s1
					end if;
				elsif( req(2) = '1') then
					count <= "00";
					next_state <= s2;
				elsif( req(3) = '1') then
					count <= "00";
					next_state <= s3;
				elsif( req(4) = '1') then
					count <= "00";
					next_state <= s4;
				elsif( req(5) = '1') then
					count <= "00";
					next_state <= s5;
				elsif( req(6) = '1') then 
					count <= "00";
					next_state <= s6;
				elsif( req(0) = '1') then
					count <= "00";
					next_state <= s0;
				else 
					count <= "00";
					next_state <= s_ideal;
				end if;
			when s2 =>  	-------------------------- s2
				if(req(2) = '1') then
					if(count = "11") then
						if(req(3) = '1') then
							count <= "00";
							next_state <= s3;
						elsif(req(4) = '1') then
							count <= "00";
							next_state <= s4;
						elsif(req(5) = '1') then
							count <= "00";
							next_state <= s5;
						elsif(req(6) = '1') then
							count <= "00";
							next_state <= s6;
						elsif(req(0) ='1') then
							count <= "00";
							next_state <= s0;
						elsif(req(1) = '1') then
							count <= "00";
							next_state <= s1;
						end if;
					else
						count <= count + "01";
						next_state <= s2;			------------s2	
					end if;
				elsif( req(3) = '1') then
					count <= "00";
					next_state <= s3;
				elsif( req(4) = '1') then
					count <= "00";
					next_state <= s4;
				elsif( req(5) = '1') then
					count <= "00";
					next_state <= s5;
				elsif( req(6) = '1') then 
					count <= "00";
					next_state <= s6;
				elsif( req(0) = '1') then
					count <= "00";
					next_state <= s0;
				elsif( req(1) = '1') then
					count <= "00";
					next_state <= s1;
				else 
					count <= "00";
					next_state <= s_ideal;
				end if;			
			when s3 =>  	-------------------------- s3
				if(req(3) = '1') then
					if(count = "11") then
						if(req(4) = '1') then
							count <= "00";
							next_state <= s4;
						elsif(req(5) = '1') then
							count <= "00";
							next_state <= s5;
						elsif(req(6) = '1') then
							count <= "00";
							next_state <= s6;
						elsif(req(0) ='1') then
							count <= "00";
							next_state <= s0;
						elsif(req(1) = '1') then
							count <= "00";
							next_state <= s1;
						elsif(req(2) = '1') then
							count <= "00";
							next_state <= s2;
						end if;
					else
						count <= count + "01";
						next_state <= s3;			------------s3
					end if;
				elsif( req(4) = '1') then
					count <= "00";
					next_state <= s4;
				elsif( req(5) = '1') then
					count <= "00";
					next_state <= s5;
				elsif( req(6) = '1') then 
					count <= "00";
					next_state <= s6;
				elsif( req(0) = '1') then
					count <= "00";
					next_state <= s0;
				elsif( req(1) = '1') then
					count <= "00";
					next_state <= s1;
				elsif( req(2) = '1') then
					count <= "00";
					next_state <= s2;
				else 
					count <= "00";
					next_state <= s_ideal;
				end if;			
			when s4 =>  	-------------------------- s4
				if(req(4) = '1') then
					if(count = "11") then
						if(req(5) = '1') then
							count <= "00";
							next_state <= s5;
						elsif(req(6) = '1') then
							count <= "00";
							next_state <= s6;
						elsif(req(0) ='1') then
							count <= "00";
							next_state <= s0;
						elsif(req(1) = '1') then
							count <= "00";
							next_state <= s1;
						elsif(req(2) = '1') then
							count <= "00";
							next_state <= s2;
						elsif(req(3) = '1') then
							count <= "00";
							next_state <= s3;
						end if;
					else
						count <= count + "01";
						next_state <= s4;			------------s4
					end if;
				elsif( req(5) = '1') then
					count <= "00";
					next_state <= s5;
				elsif( req(6) = '1') then 
					count <= "00";
					next_state <= s6;
				elsif( req(0) = '1') then
					count <= "00";
					next_state <= s0;
				elsif( req(1) = '1') then
					count <= "00";
					next_state <= s1;
				elsif( req(2) = '1') then
					count <= "00";
					next_state <= s2;
				elsif( req(3) = '1') then
					count <= "00";
					next_state <= s3;
				else 
					count <= "00";
					next_state <= s_ideal;
				end if;					
			when s5 =>  	-------------------------- s5
				if(req(5) = '1') then
					if(count = "11") then
						if(req(6) = '1') then
							count <= "00";
							next_state <= s6;
						elsif(req(0) ='1') then
							count <= "00";
							next_state <= s0;
						elsif(req(1) = '1') then
							count <= "00";
							next_state <= s1;
						elsif(req(2) = '1') then
							count <= "00";
							next_state <= s2;
						elsif(req(3) = '1') then
							count <= "00";
							next_state <= s3;
						elsif(req(4) = '1') then
							count <= "00";
							next_state <= s4;
						end if;
					else
						count <= count + "01";
						next_state <= s5;			------------s5
					end if;
				elsif( req(6) = '1') then 
					count <= "00";
					next_state <= s6;
				elsif( req(0) = '1') then
					count <= "00";
					next_state <= s0;
				elsif( req(1) = '1') then
					count <= "00";
					next_state <= s1;
				elsif( req(2) = '1') then
					count <= "00";
					next_state <= s2;
				elsif( req(3) = '1') then
					count <= "00";
					next_state <= s3;
				elsif( req(4) = '1') then
					count <= "00";
					next_state <= s4;
				else 
					count <= "00";
					next_state <= s_ideal;
				end if;		
			when s6 =>  	-------------------------- s6
				if(req(6) = '1') then
					if(count = "11") then
						if(req(0) ='1') then
							count <= "00";
							next_state <= s0;
						elsif(req(1) = '1') then
							count <= "00";
							next_state <= s1;
						elsif(req(2) = '1') then
							count <= "00";
							next_state <= s2;
						elsif(req(3) = '1') then
							count <= "00";
							next_state <= s3;
						elsif(req(4) = '1') then
							count <= "00";
							next_state <= s4;
						elsif(req(5) = '1') then
							count <= "00";
							next_state <= s5;
						end if;
					else
						count <= count + "01";
						next_state <= s6;			------------s6
					end if;
				elsif( req(0) = '1') then
					count <= "00";
					next_state <= s0;
				elsif( req(1) = '1') then
					count <= "00";
					next_state <= s1;
				elsif( req(2) = '1') then
					count <= "00";
					next_state <= s2;
				elsif( req(3) = '1') then
					count <= "00";
					next_state <= s3;
				elsif( req(4) = '1') then
					count <= "00";
					next_state <= s4;
				elsif( req(5) = '1') then 
					count <= "00";
					next_state <= s5;
				else 
					count <= "00";
					next_state <= s_ideal;
				end if;					
			when others =>
				if( req(0) = '1') then
					count <= "00";
					next_state <= s0;
				elsif( req(1) = '1') then
					count <= "00";
					next_state <= s1;
				elsif( req(2) = '1') then
					count <= "00";
					next_state <= s2;
				elsif( req(3) = '1') then
					count <= "00";
					next_state <= s3;
				elsif( req(4) = '1') then
					count <= "00";
					next_state <= s4;
				elsif( req(5) = '1') then 
					count <= "00";
					next_state <= s5;
				elsif( req(6) = '1') then
					count <= "00";
					next_state <= s6;
				else 
					count <= "00";
					next_state <= s_ideal;
				end if;
			end case;
		end if;
	end process;
	
grant_process: process(state,next_state,count)
		begin
			case state is 
				when s0 => grant <="0000001";	-- local
				when s1 => grant <="0000010";	-- in1
				when s2 => grant <="0000100";	-- in2
				when s3 => grant <="0001000"; -- in3
				when s4 => grant <="0010000"; -- in4
				when s5 => grant <="0100000"; -- in5
				when s6 => grant <="1000000"; -- in6
				when others => grant <="0000000";
			end case;
		end process;
routing_interface: process(clk)
		begin
	--		if(rising_edge(clk)) then
	--			data_out <= data_in;
	--		end if;
		end process;
data_out <= data_in;		
control <= "000000000000000000111" when (in_dir ="111" and state = s0) -- local -> local
		else "000000000000000111000" when (in_dir ="001" and state = s0) -- local -> out1
		else "000000000000111000000" when (in_dir ="010" and state = s0) -- local -> out2
		else "000000000111000000000" when (in_dir ="011" and state = s0) -- local -> out3
		else "000000111000000000000" when (in_dir ="100" and state = s0) -- local -> out4
		else "000111000000000000000" when (in_dir ="101" and state = s0) -- local -> out5
		else "111000000000000000000" when (in_dir ="110" and state = s0) -- local -> out6	 

		else "000000000000000000001" when (in_dir ="111" and state = s1) -- in1 -> local
		else "000000000000000001000" when (in_dir ="001" and state = s1) -- in1 -> out1
		else "000000000000001000000" when (in_dir ="010" and state = s1) -- in1 -> out2
		else "000000000001000000000" when (in_dir ="011" and state = s1) -- in1 -> out3
		else "000000001000000000000" when (in_dir ="100" and state = s1) -- in1 -> out4
		else "000001000000000000000" when (in_dir ="101" and state = s1) -- in1 -> out5
		else "001000000000000000000" when (in_dir ="110" and state = s1) -- in1 -> out6	 

		else "000000000000000000010" when (in_dir ="111" and state = s2) -- in2 -> local
		else "000000000000000010000" when (in_dir ="001" and state = s2) -- in2 -> out1
		else "000000000000010000000" when (in_dir ="010" and state = s2) -- in2 -> out2
		else "000000000010000000000" when (in_dir ="011" and state = s2) -- in2 -> out3
		else "000000010000000000000" when (in_dir ="100" and state = s2) -- in2 -> out4
		else "000010000000000000000" when (in_dir ="101" and state = s2) -- in2 -> out5
		else "010000000000000000000" when (in_dir ="110" and state = s2) -- in2 -> out6	 
		
		else "000000000000000000011" when (in_dir ="111" and state = s3) -- in3 -> local
		else "000000000000000011000" when (in_dir ="001" and state = s3) -- in3 -> out1
		else "000000000000011000000" when (in_dir ="010" and state = s3) -- in3 -> out2
		else "000000000011000000000" when (in_dir ="011" and state = s3) -- in3 -> out3
		else "000000011000000000000" when (in_dir ="100" and state = s3) -- in3 -> out4
		else "000011000000000000000" when (in_dir ="101" and state = s3) -- in3 -> out5
		else "011000000000000000000" when (in_dir ="110" and state = s3) -- in3 -> out6	 
		
		else "000000000000000000100" when (in_dir ="111" and state = s4) -- in4 -> local
		else "000000000000000100000" when (in_dir ="001" and state = s4) -- in4 -> out1
		else "000000000000100000000" when (in_dir ="010" and state = s4) -- in4 -> out2
		else "000000000100000000000" when (in_dir ="011" and state = s4) -- in4 -> out3
		else "000000100000000000000" when (in_dir ="100" and state = s4) -- in4 -> out4
		else "000100000000000000000" when (in_dir ="101" and state = s4) -- in4 -> out5
		else "100000000000000000000" when (in_dir ="110" and state = s4) -- in4 -> out6
		
		else "000000000000000000101" when (in_dir ="111" and state = s5) -- in5 -> local
		else "000000000000000101000" when (in_dir ="001" and state = s5) -- in5 -> out1
		else "000000000000101000000" when (in_dir ="010" and state = s5) -- in5 -> out2
		else "000000000101000000000" when (in_dir ="011" and state = s5) -- in5 -> out3
		else "000000101000000000000" when (in_dir ="100" and state = s5) -- in5 -> out4
		else "000101000000000000000" when (in_dir ="101" and state = s5) -- in5 -> out5
		else "101000000000000000000" when (in_dir ="110" and state = s5) -- in5 -> out6
		
		else "000000000000000000110" when (in_dir ="111" and state = s6) -- in6 -> local
		else "000000000000000110000" when (in_dir ="001" and state = s6) -- in6 -> out1
		else "000000000000110000000" when (in_dir ="010" and state = s6) -- in6 -> out2
		else "000000000110000000000" when (in_dir ="011" and state = s6) -- in6 -> out3
		else "000000110000000000000" when (in_dir ="100" and state = s6) -- in6 -> out4
		else "000110000000000000000" when (in_dir ="101" and state = s6) -- in6 -> out5
		else "110000000000000000000" when (in_dir ="110" and state = s6) -- in6 -> out6
		else "000000000000000000000";
		
		wr_req <= "0000010" when ((in_dir = "001") and (state /= s_ideal))
			  else "0000100" when ((in_dir = "010") and (state /= s_ideal))
			  else "0001000" when ((in_dir = "011") and (state /= s_ideal))
			  else "0010000" when ((in_dir = "100") and (state /= s_ideal))
			  else "0100000" when ((in_dir = "101") and (state /= s_ideal))
			  else "1000000" when ((in_dir = "110") and (state /= s_ideal))
			  else "0000001" when ((in_dir = "111") and (state /= s_ideal))
			  else "0000000";

end Behavioral;

