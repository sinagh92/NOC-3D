----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:33:43 06/08/2018 
-- Design Name: 
-- Module Name:    crossbar_swtich - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY crossbar_switch IS
	PORT (
		clk, en : IN STD_LOGIC;
		grant : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		-- input ports
		in1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in5 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in6 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_local : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		-- output ports
		out1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out5 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out6 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_local : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		-- control signal
		control : IN STD_LOGIC_VECTOR(20 DOWNTO 0);
		wr_en_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		wr_en_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);

END crossbar_switch;

ARCHITECTURE Behavioral OF crossbar_switch IS
	SIGNAL in1r, in2r, in3r, in4r, in5r, in6r, in_localr : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
BEGIN
	PROCESS (clk)
	BEGIN
		IF (rising_edge(clk)) THEN
			IF (en = '1') THEN

				IF (control(2 DOWNTO 0) = "111" AND grant(0) = '1') THEN
					out_local <= in_local;
				ELSIF (control(2 DOWNTO 0) = "001" AND grant(1) = '1') THEN
					out_local <= in1;
				ELSIF (control(2 DOWNTO 0) = "010" AND grant(2) = '1') THEN
					out_local <= in2;
				ELSIF (control(2 DOWNTO 0) = "011" AND grant(3) = '1') THEN
					out_local <= in3;
				ELSIF (control(2 DOWNTO 0) = "100" AND grant(4) = '1') THEN
					out_local <= in4;
				ELSIF (control(2 DOWNTO 0) = "101" AND grant(5) = '1') THEN
					out_local <= in5;
				ELSIF (control(2 DOWNTO 0) = "110" AND grant(6) = '1') THEN
					out_local <= in6;
				ELSE
					out_local <= (OTHERS => '0');
				END IF;

				IF (control(5 DOWNTO 3) = "111" AND grant(0) = '1') THEN
					out1 <= in_local;
				ELSIF (control(5 DOWNTO 3) = "001" AND grant(1) = '1') THEN
					out1 <= in1;
				ELSIF (control(5 DOWNTO 3) = "010" AND grant(2) = '1') THEN
					out1 <= in2;
				ELSIF (control(5 DOWNTO 3) = "011" AND grant(3) = '1') THEN
					out1 <= in3;
				ELSIF (control(5 DOWNTO 3) = "100" AND grant(4) = '1') THEN
					out1 <= in4;
				ELSIF (control(5 DOWNTO 3) = "101" AND grant(5) = '1') THEN
					out1 <= in5;
				ELSIF (control(5 DOWNTO 3) = "110" AND grant(6) = '1') THEN
					out1 <= in6;
				ELSE
					out1 <= (OTHERS => '0');
				END IF;

				IF (control(8 DOWNTO 6) = "111" AND grant(0) = '1') THEN
					out2 <= in_local;
				ELSIF (control(8 DOWNTO 6) = "001" AND grant(1) = '1') THEN
					out2 <= in1;
				ELSIF (control(8 DOWNTO 6) = "010" AND grant(2) = '1') THEN
					out2 <= in2;
				ELSIF (control(8 DOWNTO 6) = "011" AND grant(3) = '1') THEN
					out2 <= in3;
				ELSIF (control(8 DOWNTO 6) = "100" AND grant(4) = '1') THEN
					out2 <= in4;
				ELSIF (control(8 DOWNTO 6) = "101" AND grant(5) = '1') THEN
					out2 <= in5;
				ELSIF (control(8 DOWNTO 6) = "110" AND grant(6) = '1') THEN
					out2 <= in6;
				ELSE
					out2 <= (OTHERS => '0');
				END IF;

				IF (control(11 DOWNTO 9) = "111" AND grant(0) = '1') THEN
					out3 <= in_local;
				ELSIF (control(11 DOWNTO 9) = "001" AND grant(1) = '1') THEN
					out3 <= in1;
				ELSIF (control(11 DOWNTO 9) = "010" AND grant(2) = '1') THEN
					out3 <= in2;
				ELSIF (control(11 DOWNTO 9) = "011" AND grant(3) = '1') THEN
					out3 <= in3;
				ELSIF (control(11 DOWNTO 9) = "100" AND grant(4) = '1') THEN
					out3 <= in4;
				ELSIF (control(11 DOWNTO 9) = "101" AND grant(5) = '1') THEN
					out3 <= in5;
				ELSIF (control(11 DOWNTO 9) = "110" AND grant(6) = '1') THEN
					out3 <= in6;
				ELSE
					out3 <= (OTHERS => '0');
				END IF;

				IF (control(14 DOWNTO 12) = "111" AND grant(0) = '1') THEN
					out4 <= in_local;
				ELSIF (control(14 DOWNTO 12) = "001" AND grant(1) = '1') THEN
					out4 <= in1;
				ELSIF (control(14 DOWNTO 12) = "010" AND grant(2) = '1') THEN
					out4 <= in2;
				ELSIF (control(14 DOWNTO 12) = "011" AND grant(3) = '1') THEN
					out4 <= in3;
				ELSIF (control(14 DOWNTO 12) = "100" AND grant(4) = '1') THEN
					out4 <= in4;
				ELSIF (control(14 DOWNTO 12) = "101" AND grant(5) = '1') THEN
					out4 <= in5;
				ELSIF (control(14 DOWNTO 12) = "110" AND grant(6) = '1') THEN
					out4 <= in6;
				ELSE
					out4 <= (OTHERS => '0');
				END IF;

				IF (control(17 DOWNTO 15) = "111" AND grant(0) = '1') THEN
					out5 <= in_local;
				ELSIF (control(17 DOWNTO 15) = "001" AND grant(1) = '1') THEN
					out5 <= in1;
				ELSIF (control(17 DOWNTO 15) = "010" AND grant(2) = '1') THEN
					out5 <= in2;
				ELSIF (control(17 DOWNTO 15) = "011" AND grant(3) = '1') THEN
					out5 <= in3;
				ELSIF (control(17 DOWNTO 15) = "100" AND grant(4) = '1') THEN
					out5 <= in4;
				ELSIF (control(17 DOWNTO 15) = "101" AND grant(5) = '1') THEN
					out5 <= in5;
				ELSIF (control(17 DOWNTO 15) = "110" AND grant(6) = '1') THEN
					out5 <= in6;
				ELSE
					out5 <= (OTHERS => '0');
				END IF;

				IF (control(20 DOWNTO 18) = "111" AND grant(0) = '1') THEN
					out6 <= in_local;
				ELSIF (control(20 DOWNTO 18) = "001" AND grant(1) = '1') THEN
					out6 <= in1;
				ELSIF (control(20 DOWNTO 18) = "010" AND grant(2) = '1') THEN
					out6 <= in2;
				ELSIF (control(20 DOWNTO 18) = "011" AND grant(3) = '1') THEN
					out6 <= in3;
				ELSIF (control(20 DOWNTO 18) = "100" AND grant(4) = '1') THEN
					out6 <= in4;
				ELSIF (control(20 DOWNTO 18) = "101" AND grant(5) = '1') THEN
					out6 <= in5;
				ELSIF (control(20 DOWNTO 18) = "110" AND grant(6) = '1') THEN
					out6 <= in6;
				ELSE
					out6 <= (OTHERS => '0');
				END IF;
				wr_en_out <= wr_en_in;
			ELSE
				wr_en_out <= (OTHERS => '0');
				out_local <= (OTHERS => '0');
				out1 <= (OTHERS => '0');
				out2 <= (OTHERS => '0');
				out3 <= (OTHERS => '0');
				out4 <= (OTHERS => '0');
				out5 <= (OTHERS => '0');
				out6 <= (OTHERS => '0');

			END IF; -- enable
		END IF; -- rise edge clk
	END PROCESS;
END Behavioral;