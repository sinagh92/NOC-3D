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

ENTITY scheduler IS
	PORT (
		clk : IN STD_LOGIC;
		rst : IN STD_LOGIC;
		req : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		grant : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		data_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- read when granted
		data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- to routing unit
		in_dir : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- direction
		control : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
		wr_req : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END scheduler;

ARCHITECTURE Behavioral OF scheduler IS
	TYPE State_type IS (s_ideal, s0, s1, s2, s3, s4, s5, s6); -- Define the states
	SIGNAL state : State_Type; -- Create a signal that uses
	SIGNAL next_state : State_Type;
	SIGNAL count, countr : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
	clk_process : PROCESS (clk, rst)
	BEGIN
		IF (rising_edge(clk)) THEN
			IF (rst = '1') THEN
				state <= s_ideal;
				countr <= "00";
			ELSE
				state <= next_state;
				countr <= countr + "01";
			END IF;
		END IF;
	END PROCESS;

	states_process : PROCESS (clk)
	BEGIN
		IF (rising_edge(clk)) THEN
			CASE state IS
				WHEN s0 => -------------------------- s0
					IF (req(0) = '1') THEN
						IF (count = "11") THEN
							IF (req(1) = '1') THEN
								count <= "00";
								next_state <= s1;
							ELSIF (req(2) = '1') THEN
								count <= "00";
								next_state <= s2;
							ELSIF (req(3) = '1') THEN
								count <= "00";
								next_state <= s3;
							ELSIF (req(4) = '1') THEN
								count <= "00";
								next_state <= s4;
							ELSIF (req(5) = '1') THEN
								count <= "00";
								next_state <= s5;
							ELSIF (req(6) = '1') THEN
								count <= "00";
								next_state <= s6;
							END IF;
						ELSE
							count <= count + "01";
							next_state <= s0; ----------s0
						END IF;
					ELSIF (req(1) = '1') THEN
						count <= "00";
						next_state <= s1;
					ELSIF (req(2) = '1') THEN
						count <= "00";
						next_state <= s2;
					ELSIF (req(3) = '1') THEN
						count <= "00";
						next_state <= s3;
					ELSIF (req(4) = '1') THEN
						count <= "00";
						next_state <= s4;
					ELSIF (req(5) = '1') THEN
						count <= "00";
						next_state <= s5;
					ELSIF (req(6) = '1') THEN
						count <= "00";
						next_state <= s6;
					ELSE
						count <= "00";
						next_state <= s_ideal;
					END IF;
				WHEN s1 => -------------------------- s1
					IF (req(1) = '1') THEN
						IF (count = "11") THEN
							IF (req(2) = '1') THEN
								count <= "00";
								next_state <= s2;
							ELSIF (req(3) = '1') THEN
								count <= "00";
								next_state <= s3;
							ELSIF (req(4) = '1') THEN
								count <= "00";
								next_state <= s4;
							ELSIF (req(5) = '1') THEN
								count <= "00";
								next_state <= s5;
							ELSIF (req(6) = '1') THEN
								count <= "00";
								next_state <= s6;
							ELSIF (req(0) = '1') THEN
								count <= "00";
								next_state <= s0;
							END IF;
						ELSE
							count <= count + "01";
							next_state <= s1; ------- s1
						END IF;
					ELSIF (req(2) = '1') THEN
						count <= "00";
						next_state <= s2;
					ELSIF (req(3) = '1') THEN
						count <= "00";
						next_state <= s3;
					ELSIF (req(4) = '1') THEN
						count <= "00";
						next_state <= s4;
					ELSIF (req(5) = '1') THEN
						count <= "00";
						next_state <= s5;
					ELSIF (req(6) = '1') THEN
						count <= "00";
						next_state <= s6;
					ELSIF (req(0) = '1') THEN
						count <= "00";
						next_state <= s0;
					ELSE
						count <= "00";
						next_state <= s_ideal;
					END IF;
				WHEN s2 => -------------------------- s2
					IF (req(2) = '1') THEN
						IF (count = "11") THEN
							IF (req(3) = '1') THEN
								count <= "00";
								next_state <= s3;
							ELSIF (req(4) = '1') THEN
								count <= "00";
								next_state <= s4;
							ELSIF (req(5) = '1') THEN
								count <= "00";
								next_state <= s5;
							ELSIF (req(6) = '1') THEN
								count <= "00";
								next_state <= s6;
							ELSIF (req(0) = '1') THEN
								count <= "00";
								next_state <= s0;
							ELSIF (req(1) = '1') THEN
								count <= "00";
								next_state <= s1;
							END IF;
						ELSE
							count <= count + "01";
							next_state <= s2; ------------s2	
						END IF;
					ELSIF (req(3) = '1') THEN
						count <= "00";
						next_state <= s3;
					ELSIF (req(4) = '1') THEN
						count <= "00";
						next_state <= s4;
					ELSIF (req(5) = '1') THEN
						count <= "00";
						next_state <= s5;
					ELSIF (req(6) = '1') THEN
						count <= "00";
						next_state <= s6;
					ELSIF (req(0) = '1') THEN
						count <= "00";
						next_state <= s0;
					ELSIF (req(1) = '1') THEN
						count <= "00";
						next_state <= s1;
					ELSE
						count <= "00";
						next_state <= s_ideal;
					END IF;
				WHEN s3 => -------------------------- s3
					IF (req(3) = '1') THEN
						IF (count = "11") THEN
							IF (req(4) = '1') THEN
								count <= "00";
								next_state <= s4;
							ELSIF (req(5) = '1') THEN
								count <= "00";
								next_state <= s5;
							ELSIF (req(6) = '1') THEN
								count <= "00";
								next_state <= s6;
							ELSIF (req(0) = '1') THEN
								count <= "00";
								next_state <= s0;
							ELSIF (req(1) = '1') THEN
								count <= "00";
								next_state <= s1;
							ELSIF (req(2) = '1') THEN
								count <= "00";
								next_state <= s2;
							END IF;
						ELSE
							count <= count + "01";
							next_state <= s3; ------------s3
						END IF;
					ELSIF (req(4) = '1') THEN
						count <= "00";
						next_state <= s4;
					ELSIF (req(5) = '1') THEN
						count <= "00";
						next_state <= s5;
					ELSIF (req(6) = '1') THEN
						count <= "00";
						next_state <= s6;
					ELSIF (req(0) = '1') THEN
						count <= "00";
						next_state <= s0;
					ELSIF (req(1) = '1') THEN
						count <= "00";
						next_state <= s1;
					ELSIF (req(2) = '1') THEN
						count <= "00";
						next_state <= s2;
					ELSE
						count <= "00";
						next_state <= s_ideal;
					END IF;
				WHEN s4 => -------------------------- s4
					IF (req(4) = '1') THEN
						IF (count = "11") THEN
							IF (req(5) = '1') THEN
								count <= "00";
								next_state <= s5;
							ELSIF (req(6) = '1') THEN
								count <= "00";
								next_state <= s6;
							ELSIF (req(0) = '1') THEN
								count <= "00";
								next_state <= s0;
							ELSIF (req(1) = '1') THEN
								count <= "00";
								next_state <= s1;
							ELSIF (req(2) = '1') THEN
								count <= "00";
								next_state <= s2;
							ELSIF (req(3) = '1') THEN
								count <= "00";
								next_state <= s3;
							END IF;
						ELSE
							count <= count + "01";
							next_state <= s4; ------------s4
						END IF;
					ELSIF (req(5) = '1') THEN
						count <= "00";
						next_state <= s5;
					ELSIF (req(6) = '1') THEN
						count <= "00";
						next_state <= s6;
					ELSIF (req(0) = '1') THEN
						count <= "00";
						next_state <= s0;
					ELSIF (req(1) = '1') THEN
						count <= "00";
						next_state <= s1;
					ELSIF (req(2) = '1') THEN
						count <= "00";
						next_state <= s2;
					ELSIF (req(3) = '1') THEN
						count <= "00";
						next_state <= s3;
					ELSE
						count <= "00";
						next_state <= s_ideal;
					END IF;
				WHEN s5 => -------------------------- s5
					IF (req(5) = '1') THEN
						IF (count = "11") THEN
							IF (req(6) = '1') THEN
								count <= "00";
								next_state <= s6;
							ELSIF (req(0) = '1') THEN
								count <= "00";
								next_state <= s0;
							ELSIF (req(1) = '1') THEN
								count <= "00";
								next_state <= s1;
							ELSIF (req(2) = '1') THEN
								count <= "00";
								next_state <= s2;
							ELSIF (req(3) = '1') THEN
								count <= "00";
								next_state <= s3;
							ELSIF (req(4) = '1') THEN
								count <= "00";
								next_state <= s4;
							END IF;
						ELSE
							count <= count + "01";
							next_state <= s5; ------------s5
						END IF;
					ELSIF (req(6) = '1') THEN
						count <= "00";
						next_state <= s6;
					ELSIF (req(0) = '1') THEN
						count <= "00";
						next_state <= s0;
					ELSIF (req(1) = '1') THEN
						count <= "00";
						next_state <= s1;
					ELSIF (req(2) = '1') THEN
						count <= "00";
						next_state <= s2;
					ELSIF (req(3) = '1') THEN
						count <= "00";
						next_state <= s3;
					ELSIF (req(4) = '1') THEN
						count <= "00";
						next_state <= s4;
					ELSE
						count <= "00";
						next_state <= s_ideal;
					END IF;
				WHEN s6 => -------------------------- s6
					IF (req(6) = '1') THEN
						IF (count = "11") THEN
							IF (req(0) = '1') THEN
								count <= "00";
								next_state <= s0;
							ELSIF (req(1) = '1') THEN
								count <= "00";
								next_state <= s1;
							ELSIF (req(2) = '1') THEN
								count <= "00";
								next_state <= s2;
							ELSIF (req(3) = '1') THEN
								count <= "00";
								next_state <= s3;
							ELSIF (req(4) = '1') THEN
								count <= "00";
								next_state <= s4;
							ELSIF (req(5) = '1') THEN
								count <= "00";
								next_state <= s5;
							END IF;
						ELSE
							count <= count + "01";
							next_state <= s6; ------------s6
						END IF;
					ELSIF (req(0) = '1') THEN
						count <= "00";
						next_state <= s0;
					ELSIF (req(1) = '1') THEN
						count <= "00";
						next_state <= s1;
					ELSIF (req(2) = '1') THEN
						count <= "00";
						next_state <= s2;
					ELSIF (req(3) = '1') THEN
						count <= "00";
						next_state <= s3;
					ELSIF (req(4) = '1') THEN
						count <= "00";
						next_state <= s4;
					ELSIF (req(5) = '1') THEN
						count <= "00";
						next_state <= s5;
					ELSE
						count <= "00";
						next_state <= s_ideal;
					END IF;
				WHEN OTHERS =>
					IF (req(0) = '1') THEN
						count <= "00";
						next_state <= s0;
					ELSIF (req(1) = '1') THEN
						count <= "00";
						next_state <= s1;
					ELSIF (req(2) = '1') THEN
						count <= "00";
						next_state <= s2;
					ELSIF (req(3) = '1') THEN
						count <= "00";
						next_state <= s3;
					ELSIF (req(4) = '1') THEN
						count <= "00";
						next_state <= s4;
					ELSIF (req(5) = '1') THEN
						count <= "00";
						next_state <= s5;
					ELSIF (req(6) = '1') THEN
						count <= "00";
						next_state <= s6;
					ELSE
						count <= "00";
						next_state <= s_ideal;
					END IF;
			END CASE;
		END IF;
	END PROCESS;

	grant_process : PROCESS (state, next_state, count)
	BEGIN
		CASE state IS
			WHEN s0 => grant <= "0000001"; -- local
			WHEN s1 => grant <= "0000010"; -- in1
			WHEN s2 => grant <= "0000100"; -- in2
			WHEN s3 => grant <= "0001000"; -- in3
			WHEN s4 => grant <= "0010000"; -- in4
			WHEN s5 => grant <= "0100000"; -- in5
			WHEN s6 => grant <= "1000000"; -- in6
			WHEN OTHERS => grant <= "0000000";
		END CASE;
	END PROCESS;
	routing_interface : PROCESS (clk)
	BEGIN
		--		if(rising_edge(clk)) then
		--			data_out <= data_in;
		--		end if;
	END PROCESS;
	data_out <= data_in;
	control <= "000000000000000000111" WHEN (in_dir = "111" AND state = s0) -- local -> local
		ELSE
		"000000000000000111000" WHEN (in_dir = "001" AND state = s0) -- local -> out1
		ELSE
		"000000000000111000000" WHEN (in_dir = "010" AND state = s0) -- local -> out2
		ELSE
		"000000000111000000000" WHEN (in_dir = "011" AND state = s0) -- local -> out3
		ELSE
		"000000111000000000000" WHEN (in_dir = "100" AND state = s0) -- local -> out4
		ELSE
		"000111000000000000000" WHEN (in_dir = "101" AND state = s0) -- local -> out5
		ELSE
		"111000000000000000000" WHEN (in_dir = "110" AND state = s0) -- local -> out6	 

		ELSE
		"000000000000000000001" WHEN (in_dir = "111" AND state = s1) -- in1 -> local
		ELSE
		"000000000000000001000" WHEN (in_dir = "001" AND state = s1) -- in1 -> out1
		ELSE
		"000000000000001000000" WHEN (in_dir = "010" AND state = s1) -- in1 -> out2
		ELSE
		"000000000001000000000" WHEN (in_dir = "011" AND state = s1) -- in1 -> out3
		ELSE
		"000000001000000000000" WHEN (in_dir = "100" AND state = s1) -- in1 -> out4
		ELSE
		"000001000000000000000" WHEN (in_dir = "101" AND state = s1) -- in1 -> out5
		ELSE
		"001000000000000000000" WHEN (in_dir = "110" AND state = s1) -- in1 -> out6	 

		ELSE
		"000000000000000000010" WHEN (in_dir = "111" AND state = s2) -- in2 -> local
		ELSE
		"000000000000000010000" WHEN (in_dir = "001" AND state = s2) -- in2 -> out1
		ELSE
		"000000000000010000000" WHEN (in_dir = "010" AND state = s2) -- in2 -> out2
		ELSE
		"000000000010000000000" WHEN (in_dir = "011" AND state = s2) -- in2 -> out3
		ELSE
		"000000010000000000000" WHEN (in_dir = "100" AND state = s2) -- in2 -> out4
		ELSE
		"000010000000000000000" WHEN (in_dir = "101" AND state = s2) -- in2 -> out5
		ELSE
		"010000000000000000000" WHEN (in_dir = "110" AND state = s2) -- in2 -> out6	 

		ELSE
		"000000000000000000011" WHEN (in_dir = "111" AND state = s3) -- in3 -> local
		ELSE
		"000000000000000011000" WHEN (in_dir = "001" AND state = s3) -- in3 -> out1
		ELSE
		"000000000000011000000" WHEN (in_dir = "010" AND state = s3) -- in3 -> out2
		ELSE
		"000000000011000000000" WHEN (in_dir = "011" AND state = s3) -- in3 -> out3
		ELSE
		"000000011000000000000" WHEN (in_dir = "100" AND state = s3) -- in3 -> out4
		ELSE
		"000011000000000000000" WHEN (in_dir = "101" AND state = s3) -- in3 -> out5
		ELSE
		"011000000000000000000" WHEN (in_dir = "110" AND state = s3) -- in3 -> out6	 

		ELSE
		"000000000000000000100" WHEN (in_dir = "111" AND state = s4) -- in4 -> local
		ELSE
		"000000000000000100000" WHEN (in_dir = "001" AND state = s4) -- in4 -> out1
		ELSE
		"000000000000100000000" WHEN (in_dir = "010" AND state = s4) -- in4 -> out2
		ELSE
		"000000000100000000000" WHEN (in_dir = "011" AND state = s4) -- in4 -> out3
		ELSE
		"000000100000000000000" WHEN (in_dir = "100" AND state = s4) -- in4 -> out4
		ELSE
		"000100000000000000000" WHEN (in_dir = "101" AND state = s4) -- in4 -> out5
		ELSE
		"100000000000000000000" WHEN (in_dir = "110" AND state = s4) -- in4 -> out6

		ELSE
		"000000000000000000101" WHEN (in_dir = "111" AND state = s5) -- in5 -> local
		ELSE
		"000000000000000101000" WHEN (in_dir = "001" AND state = s5) -- in5 -> out1
		ELSE
		"000000000000101000000" WHEN (in_dir = "010" AND state = s5) -- in5 -> out2
		ELSE
		"000000000101000000000" WHEN (in_dir = "011" AND state = s5) -- in5 -> out3
		ELSE
		"000000101000000000000" WHEN (in_dir = "100" AND state = s5) -- in5 -> out4
		ELSE
		"000101000000000000000" WHEN (in_dir = "101" AND state = s5) -- in5 -> out5
		ELSE
		"101000000000000000000" WHEN (in_dir = "110" AND state = s5) -- in5 -> out6

		ELSE
		"000000000000000000110" WHEN (in_dir = "111" AND state = s6) -- in6 -> local
		ELSE
		"000000000000000110000" WHEN (in_dir = "001" AND state = s6) -- in6 -> out1
		ELSE
		"000000000000110000000" WHEN (in_dir = "010" AND state = s6) -- in6 -> out2
		ELSE
		"000000000110000000000" WHEN (in_dir = "011" AND state = s6) -- in6 -> out3
		ELSE
		"000000110000000000000" WHEN (in_dir = "100" AND state = s6) -- in6 -> out4
		ELSE
		"000110000000000000000" WHEN (in_dir = "101" AND state = s6) -- in6 -> out5
		ELSE
		"110000000000000000000" WHEN (in_dir = "110" AND state = s6) -- in6 -> out6
		ELSE
		"000000000000000000000";

	wr_req <= "0000010" WHEN ((in_dir = "001") AND (state /= s_ideal))
		ELSE
		"0000100" WHEN ((in_dir = "010") AND (state /= s_ideal))
		ELSE
		"0001000" WHEN ((in_dir = "011") AND (state /= s_ideal))
		ELSE
		"0010000" WHEN ((in_dir = "100") AND (state /= s_ideal))
		ELSE
		"0100000" WHEN ((in_dir = "101") AND (state /= s_ideal))
		ELSE
		"1000000" WHEN ((in_dir = "110") AND (state /= s_ideal))
		ELSE
		"0000001" WHEN ((in_dir = "111") AND (state /= s_ideal))
		ELSE
		"0000000";

END Behavioral;