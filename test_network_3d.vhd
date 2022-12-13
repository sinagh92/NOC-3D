--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:54:57 06/13/2018
-- Design Name:   
-- Module Name:  
-- Project Name:  NOC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: network_3d
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY test_network_3d IS
END test_network_3d;

ARCHITECTURE behavior OF test_network_3d IS

   -- Component Declaration for the Unit Under Test (UUT)

   COMPONENT network_3d
      PORT (
         clk : IN STD_LOGIC;
         rst : IN STD_LOGIC
      );
   END COMPONENT;
   --Inputs
   SIGNAL clk : STD_LOGIC := '0';
   SIGNAL rst : STD_LOGIC := '0';

   -- Clock period definitions
   CONSTANT clk_period : TIME := 10 ns;

BEGIN

   -- Instantiate the Unit Under Test (UUT)
   uut : network_3d PORT MAP(
      clk => clk,
      rst => rst
   );

   -- Clock process definitions
   clk_process : PROCESS
   BEGIN
      clk <= '0';
      WAIT FOR clk_period/2;
      clk <= '1';
      WAIT FOR clk_period/2;
   END PROCESS;
   -- Stimulus process
   stim_proc : PROCESS
   BEGIN
      -- hold reset state for 100 ns.
      WAIT FOR 100 ns;

      WAIT FOR clk_period * 10;

      -- insert stimulus here 

      WAIT;
   END PROCESS;

END;