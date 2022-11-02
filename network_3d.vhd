----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:46:55 06/12/2018 
-- Design Name: 
-- Module Name:    network_3d - Behavioral 
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

entity network_3d is
	port( clk : in std_logic;
			rst : in std_logic);
end network_3d;

architecture Behavioral of network_3d is
  COMPONENT node
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         f1i_wr_en_fifo : IN  std_logic;
         f1i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f1i_full_fifo : OUT  std_logic;
         f1o_wr_en_fifo : OUT  std_logic;
         f1o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f1o_full_fifo : IN  std_logic;
         f2i_wr_en_fifo : IN  std_logic;
         f2i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f2i_full_fifo : OUT  std_logic;
         f2o_wr_en_fifo : OUT  std_logic;
         f2o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f2o_full_fifo : IN  std_logic;
         f3i_wr_en_fifo : IN  std_logic;
         f3i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f3i_full_fifo : OUT  std_logic;
         f3o_wr_en_fifo : OUT  std_logic;
         f3o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f3o_full_fifo : IN  std_logic;
         f4i_wr_en_fifo : IN  std_logic;
         f4i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f4i_full_fifo : OUT  std_logic;
         f4o_wr_en_fifo : OUT  std_logic;
         f4o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f4o_full_fifo : IN  std_logic;
         f5i_wr_en_fifo : IN  std_logic;
         f5i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f5i_full_fifo : OUT  std_logic;
         f5o_wr_en_fifo : OUT  std_logic;
         f5o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f5o_full_fifo : IN  std_logic;
         f6i_wr_en_fifo : IN  std_logic;
         f6i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f6i_full_fifo : OUT  std_logic;
         f6o_wr_en_fifo : OUT  std_logic;
         f6o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f6o_full_fifo : IN  std_logic;
         current_pos : IN  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT node_u1
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         f1i_wr_en_fifo : IN  std_logic;
         f1i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f1i_full_fifo : OUT  std_logic;
         f1o_wr_en_fifo : OUT  std_logic;
         f1o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f1o_full_fifo : IN  std_logic;
         f2i_wr_en_fifo : IN  std_logic;
         f2i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f2i_full_fifo : OUT  std_logic;
         f2o_wr_en_fifo : OUT  std_logic;
         f2o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f2o_full_fifo : IN  std_logic;
         f3i_wr_en_fifo : IN  std_logic;
         f3i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f3i_full_fifo : OUT  std_logic;
         f3o_wr_en_fifo : OUT  std_logic;
         f3o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f3o_full_fifo : IN  std_logic;
         f4i_wr_en_fifo : IN  std_logic;
         f4i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f4i_full_fifo : OUT  std_logic;
         f4o_wr_en_fifo : OUT  std_logic;
         f4o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f4o_full_fifo : IN  std_logic;
         f5i_wr_en_fifo : IN  std_logic;
         f5i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f5i_full_fifo : OUT  std_logic;
         f5o_wr_en_fifo : OUT  std_logic;
         f5o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f5o_full_fifo : IN  std_logic;
         f6i_wr_en_fifo : IN  std_logic;
         f6i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f6i_full_fifo : OUT  std_logic;
         f6o_wr_en_fifo : OUT  std_logic;
         f6o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f6o_full_fifo : IN  std_logic;
         current_pos : IN  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT node_u7
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         f1i_wr_en_fifo : IN  std_logic;
         f1i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f1i_full_fifo : OUT  std_logic;
         f1o_wr_en_fifo : OUT  std_logic;
         f1o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f1o_full_fifo : IN  std_logic;
         f2i_wr_en_fifo : IN  std_logic;
         f2i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f2i_full_fifo : OUT  std_logic;
         f2o_wr_en_fifo : OUT  std_logic;
         f2o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f2o_full_fifo : IN  std_logic;
         f3i_wr_en_fifo : IN  std_logic;
         f3i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f3i_full_fifo : OUT  std_logic;
         f3o_wr_en_fifo : OUT  std_logic;
         f3o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f3o_full_fifo : IN  std_logic;
         f4i_wr_en_fifo : IN  std_logic;
         f4i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f4i_full_fifo : OUT  std_logic;
         f4o_wr_en_fifo : OUT  std_logic;
         f4o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f4o_full_fifo : IN  std_logic;
         f5i_wr_en_fifo : IN  std_logic;
         f5i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f5i_full_fifo : OUT  std_logic;
         f5o_wr_en_fifo : OUT  std_logic;
         f5o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f5o_full_fifo : IN  std_logic;
         f6i_wr_en_fifo : IN  std_logic;
         f6i_wr_data_fifo : IN  std_logic_vector(31 downto 0);
         f6i_full_fifo : OUT  std_logic;
         f6o_wr_en_fifo : OUT  std_logic;
         f6o_wr_data_fifo : OUT  std_logic_vector(31 downto 0);
         f6o_full_fifo : IN  std_logic;
         current_pos : IN  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	--- u1 Inputs
   signal f1i_wr_en_u1 : std_logic := '0';
   signal f1i_wr_data_u1 : std_logic_vector(31 downto 0) := (others => '0');
   signal f1o_full_u1 : std_logic := '0';
   signal f2i_wr_en_u1 : std_logic := '0';
   signal f2i_wr_data_u1 : std_logic_vector(31 downto 0) := (others => '0');
   signal f2o_full_u1 : std_logic := '0';
   signal f3i_wr_en_u1 : std_logic := '0';
   signal f3i_wr_data_u1 : std_logic_vector(31 downto 0) := (others => '0');
   signal f3o_full_u1 : std_logic := '0';
   signal f4i_wr_en_u1 : std_logic := '0';
   signal f4i_wr_data_u1 : std_logic_vector(31 downto 0) := (others => '0');
   signal f4o_full_u1 : std_logic := '0';
   signal f5i_wr_en_u1 : std_logic := '0';
   signal f5i_wr_data_u1 : std_logic_vector(31 downto 0) := (others => '0');
   signal f5o_full_u1 : std_logic := '0';
   signal f6i_wr_en_u1 : std_logic := '0';
   signal f6i_wr_data_u1 : std_logic_vector(31 downto 0) := (others => '0');
   signal f6o_full_u1 : std_logic := '0';
   signal current_pos_u1 : std_logic_vector(15 downto 0) := (others => '0');

 	--- u1 Outputs
   signal f1i_full_u1 : std_logic;
   signal f1o_wr_en_u1 : std_logic;
   signal f1o_wr_data_u1 : std_logic_vector(31 downto 0);
   signal f2i_full_u1 : std_logic;
   signal f2o_wr_en_u1 : std_logic;
   signal f2o_wr_data_u1 : std_logic_vector(31 downto 0);
   signal f3i_full_u1 : std_logic;
   signal f3o_wr_en_u1 : std_logic;
   signal f3o_wr_data_u1 : std_logic_vector(31 downto 0);
   signal f4i_full_u1 : std_logic;
   signal f4o_wr_en_u1 : std_logic;
   signal f4o_wr_data_u1 : std_logic_vector(31 downto 0);
   signal f5i_full_u1 : std_logic;
   signal f5o_wr_en_u1 : std_logic;
   signal f5o_wr_data_u1 : std_logic_vector(31 downto 0);
   signal f6i_full_u1 : std_logic;
   signal f6o_wr_en_u1 : std_logic;
   signal f6o_wr_data_u1 : std_logic_vector(31 downto 0);
	--- u2
	signal f1i_wr_en_u2 : std_logic := '0';
   signal f1i_wr_data_u2 : std_logic_vector(31 downto 0) := (others => '0');
   signal f1o_full_u2 : std_logic := '0';
   signal f2i_wr_en_u2 : std_logic := '0';
   signal f2i_wr_data_u2 : std_logic_vector(31 downto 0) := (others => '0');
   signal f2o_full_u2 : std_logic := '0';
   signal f3i_wr_en_u2 : std_logic := '0';
   signal f3i_wr_data_u2 : std_logic_vector(31 downto 0) := (others => '0');
   signal f3o_full_u2 : std_logic := '0';
   signal f4i_wr_en_u2 : std_logic := '0';
   signal f4i_wr_data_u2 : std_logic_vector(31 downto 0) := (others => '0');
   signal f4o_full_u2 : std_logic := '0';
   signal f5i_wr_en_u2 : std_logic := '0';
   signal f5i_wr_data_u2 : std_logic_vector(31 downto 0) := (others => '0');
   signal f5o_full_u2 : std_logic := '0';
   signal f6i_wr_en_u2 : std_logic := '0';
   signal f6i_wr_data_u2 : std_logic_vector(31 downto 0) := (others => '0');
   signal f6o_full_u2 : std_logic := '0';
   signal current_pos_u2 : std_logic_vector(15 downto 0) := (others => '0');

 	--- u2 Outputs
   signal f1i_full_u2 : std_logic;
   signal f1o_wr_en_u2 : std_logic;
   signal f1o_wr_data_u2 : std_logic_vector(31 downto 0);
   signal f2i_full_u2 : std_logic;
   signal f2o_wr_en_u2 : std_logic;
   signal f2o_wr_data_u2 : std_logic_vector(31 downto 0);
   signal f3i_full_u2 : std_logic;
   signal f3o_wr_en_u2 : std_logic;
   signal f3o_wr_data_u2 : std_logic_vector(31 downto 0);
   signal f4i_full_u2 : std_logic;
   signal f4o_wr_en_u2 : std_logic;
   signal f4o_wr_data_u2 : std_logic_vector(31 downto 0);
   signal f5i_full_u2 : std_logic;
   signal f5o_wr_en_u2 : std_logic;
   signal f5o_wr_data_u2 : std_logic_vector(31 downto 0);
   signal f6i_full_u2 : std_logic;
   signal f6o_wr_en_u2 : std_logic;
   signal f6o_wr_data_u2 : std_logic_vector(31 downto 0);
	
	--- u3 Inputs
   signal f1i_wr_en_u3 : std_logic := '0';
   signal f1i_wr_data_u3 : std_logic_vector(31 downto 0) := (others => '0');
   signal f1o_full_u3 : std_logic := '0';
   signal f2i_wr_en_u3 : std_logic := '0';
   signal f2i_wr_data_u3 : std_logic_vector(31 downto 0) := (others => '0');
   signal f2o_full_u3 : std_logic := '0';
   signal f3i_wr_en_u3 : std_logic := '0';
   signal f3i_wr_data_u3 : std_logic_vector(31 downto 0) := (others => '0');
   signal f3o_full_u3 : std_logic := '0';
   signal f4i_wr_en_u3 : std_logic := '0';
   signal f4i_wr_data_u3 : std_logic_vector(31 downto 0) := (others => '0');
   signal f4o_full_u3 : std_logic := '0';
   signal f5i_wr_en_u3 : std_logic := '0';
   signal f5i_wr_data_u3 : std_logic_vector(31 downto 0) := (others => '0');
   signal f5o_full_u3 : std_logic := '0';
   signal f6i_wr_en_u3 : std_logic := '0';
   signal f6i_wr_data_u3 : std_logic_vector(31 downto 0) := (others => '0');
   signal f6o_full_u3 : std_logic := '0';
   signal current_pos_u3 : std_logic_vector(15 downto 0) := (others => '0');

 	--- u3 Outputs
   signal f1i_full_u3 : std_logic;
   signal f1o_wr_en_u3 : std_logic;
   signal f1o_wr_data_u3 : std_logic_vector(31 downto 0);
   signal f2i_full_u3 : std_logic;
   signal f2o_wr_en_u3 : std_logic;
   signal f2o_wr_data_u3 : std_logic_vector(31 downto 0);
   signal f3i_full_u3 : std_logic;
   signal f3o_wr_en_u3 : std_logic;
   signal f3o_wr_data_u3 : std_logic_vector(31 downto 0);
   signal f4i_full_u3 : std_logic;
   signal f4o_wr_en_u3 : std_logic;
   signal f4o_wr_data_u3 : std_logic_vector(31 downto 0);
   signal f5i_full_u3 : std_logic;
   signal f5o_wr_en_u3 : std_logic;
   signal f5o_wr_data_u3 : std_logic_vector(31 downto 0);
   signal f6i_full_u3 : std_logic;
   signal f6o_wr_en_u3 : std_logic;
   signal f6o_wr_data_u3 : std_logic_vector(31 downto 0);
	
	--- u4 Inputs
   signal f1i_wr_en_u4 : std_logic := '0';
   signal f1i_wr_data_u4 : std_logic_vector(31 downto 0) := (others => '0');
   signal f1o_full_u4 : std_logic := '0';
   signal f2i_wr_en_u4 : std_logic := '0';
   signal f2i_wr_data_u4 : std_logic_vector(31 downto 0) := (others => '0');
   signal f2o_full_u4 : std_logic := '0';
   signal f3i_wr_en_u4 : std_logic := '0';
   signal f3i_wr_data_u4 : std_logic_vector(31 downto 0) := (others => '0');
   signal f3o_full_u4 : std_logic := '0';
   signal f4i_wr_en_u4 : std_logic := '0';
   signal f4i_wr_data_u4 : std_logic_vector(31 downto 0) := (others => '0');
   signal f4o_full_u4 : std_logic := '0';
   signal f5i_wr_en_u4 : std_logic := '0';
   signal f5i_wr_data_u4 : std_logic_vector(31 downto 0) := (others => '0');
   signal f5o_full_u4 : std_logic := '0';
   signal f6i_wr_en_u4 : std_logic := '0';
   signal f6i_wr_data_u4 : std_logic_vector(31 downto 0) := (others => '0');
   signal f6o_full_u4 : std_logic := '0';
   signal current_pos_u4 : std_logic_vector(15 downto 0) := (others => '0');

 	--- u4 Outputs
   signal f1i_full_u4 : std_logic;
   signal f1o_wr_en_u4 : std_logic;
   signal f1o_wr_data_u4 : std_logic_vector(31 downto 0);
   signal f2i_full_u4 : std_logic;
   signal f2o_wr_en_u4 : std_logic;
   signal f2o_wr_data_u4 : std_logic_vector(31 downto 0);
   signal f3i_full_u4 : std_logic;
   signal f3o_wr_en_u4 : std_logic;
   signal f3o_wr_data_u4 : std_logic_vector(31 downto 0);
   signal f4i_full_u4 : std_logic;
   signal f4o_wr_en_u4 : std_logic;
   signal f4o_wr_data_u4 : std_logic_vector(31 downto 0);
   signal f5i_full_u4 : std_logic;
   signal f5o_wr_en_u4 : std_logic;
   signal f5o_wr_data_u4 : std_logic_vector(31 downto 0);
   signal f6i_full_u4 : std_logic;
   signal f6o_wr_en_u4 : std_logic;
   signal f6o_wr_data_u4 : std_logic_vector(31 downto 0);
	
	--- u5 Inputs
   signal f1i_wr_en_u5 : std_logic := '0';
   signal f1i_wr_data_u5 : std_logic_vector(31 downto 0) := (others => '0');
   signal f1o_full_u5 : std_logic := '0';
   signal f2i_wr_en_u5 : std_logic := '0';
   signal f2i_wr_data_u5 : std_logic_vector(31 downto 0) := (others => '0');
   signal f2o_full_u5 : std_logic := '0';
   signal f3i_wr_en_u5 : std_logic := '0';
   signal f3i_wr_data_u5 : std_logic_vector(31 downto 0) := (others => '0');
   signal f3o_full_u5 : std_logic := '0';
   signal f4i_wr_en_u5 : std_logic := '0';
   signal f4i_wr_data_u5 : std_logic_vector(31 downto 0) := (others => '0');
   signal f4o_full_u5 : std_logic := '0';
   signal f5i_wr_en_u5 : std_logic := '0';
   signal f5i_wr_data_u5 : std_logic_vector(31 downto 0) := (others => '0');
   signal f5o_full_u5 : std_logic := '0';
   signal f6i_wr_en_u5 : std_logic := '0';
   signal f6i_wr_data_u5 : std_logic_vector(31 downto 0) := (others => '0');
   signal f6o_full_u5 : std_logic := '0';
   signal current_pos_u5 : std_logic_vector(15 downto 0) := (others => '0');

 	--- u5 Outputs
   signal f1i_full_u5 : std_logic;
   signal f1o_wr_en_u5 : std_logic;
   signal f1o_wr_data_u5 : std_logic_vector(31 downto 0);
   signal f2i_full_u5 : std_logic;
   signal f2o_wr_en_u5 : std_logic;
   signal f2o_wr_data_u5 : std_logic_vector(31 downto 0);
   signal f3i_full_u5 : std_logic;
   signal f3o_wr_en_u5 : std_logic;
   signal f3o_wr_data_u5 : std_logic_vector(31 downto 0);
   signal f4i_full_u5 : std_logic;
   signal f4o_wr_en_u5 : std_logic;
   signal f4o_wr_data_u5 : std_logic_vector(31 downto 0);
   signal f5i_full_u5 : std_logic;
   signal f5o_wr_en_u5 : std_logic;
   signal f5o_wr_data_u5 : std_logic_vector(31 downto 0);
   signal f6i_full_u5 : std_logic;
   signal f6o_wr_en_u5 : std_logic;
   signal f6o_wr_data_u5 : std_logic_vector(31 downto 0);
	
	--- u6 Inputs
   signal f1i_wr_en_u6 : std_logic := '0';
   signal f1i_wr_data_u6 : std_logic_vector(31 downto 0) := (others => '0');
   signal f1o_full_u6 : std_logic := '0';
   signal f2i_wr_en_u6 : std_logic := '0';
   signal f2i_wr_data_u6 : std_logic_vector(31 downto 0) := (others => '0');
   signal f2o_full_u6 : std_logic := '0';
   signal f3i_wr_en_u6 : std_logic := '0';
   signal f3i_wr_data_u6 : std_logic_vector(31 downto 0) := (others => '0');
   signal f3o_full_u6 : std_logic := '0';
   signal f4i_wr_en_u6 : std_logic := '0';
   signal f4i_wr_data_u6 : std_logic_vector(31 downto 0) := (others => '0');
   signal f4o_full_u6 : std_logic := '0';
   signal f5i_wr_en_u6 : std_logic := '0';
   signal f5i_wr_data_u6 : std_logic_vector(31 downto 0) := (others => '0');
   signal f5o_full_u6 : std_logic := '0';
   signal f6i_wr_en_u6 : std_logic := '0';
   signal f6i_wr_data_u6 : std_logic_vector(31 downto 0) := (others => '0');
   signal f6o_full_u6 : std_logic := '0';
   signal current_pos_u6 : std_logic_vector(15 downto 0) := (others => '0');

 	--- u6 Outputs
   signal f1i_full_u6 : std_logic;
   signal f1o_wr_en_u6 : std_logic;
   signal f1o_wr_data_u6 : std_logic_vector(31 downto 0);
   signal f2i_full_u6 : std_logic;
   signal f2o_wr_en_u6 : std_logic;
   signal f2o_wr_data_u6 : std_logic_vector(31 downto 0);
   signal f3i_full_u6 : std_logic;
   signal f3o_wr_en_u6 : std_logic;
   signal f3o_wr_data_u6 : std_logic_vector(31 downto 0);
   signal f4i_full_u6 : std_logic;
   signal f4o_wr_en_u6 : std_logic;
   signal f4o_wr_data_u6 : std_logic_vector(31 downto 0);
   signal f5i_full_u6 : std_logic;
   signal f5o_wr_en_u6 : std_logic;
   signal f5o_wr_data_u6 : std_logic_vector(31 downto 0);
   signal f6i_full_u6 : std_logic;
   signal f6o_wr_en_u6 : std_logic;
   signal f6o_wr_data_u6 : std_logic_vector(31 downto 0);
	
	--- u7 Inputs
   signal f1i_wr_en_u7 : std_logic := '0';
   signal f1i_wr_data_u7 : std_logic_vector(31 downto 0) := (others => '0');
   signal f1o_full_u7 : std_logic := '0';
   signal f2i_wr_en_u7 : std_logic := '0';
   signal f2i_wr_data_u7 : std_logic_vector(31 downto 0) := (others => '0');
   signal f2o_full_u7 : std_logic := '0';
   signal f3i_wr_en_u7 : std_logic := '0';
   signal f3i_wr_data_u7 : std_logic_vector(31 downto 0) := (others => '0');
   signal f3o_full_u7 : std_logic := '0';
   signal f4i_wr_en_u7 : std_logic := '0';
   signal f4i_wr_data_u7 : std_logic_vector(31 downto 0) := (others => '0');
   signal f4o_full_u7 : std_logic := '0';
   signal f5i_wr_en_u7 : std_logic := '0';
   signal f5i_wr_data_u7 : std_logic_vector(31 downto 0) := (others => '0');
   signal f5o_full_u7 : std_logic := '0';
   signal f6i_wr_en_u7 : std_logic := '0';
   signal f6i_wr_data_u7 : std_logic_vector(31 downto 0) := (others => '0');
   signal f6o_full_u7 : std_logic := '0';
   signal current_pos_u7 : std_logic_vector(15 downto 0) := (others => '0');

 	--- u7 Outputs
   signal f1i_full_u7 : std_logic;
   signal f1o_wr_en_u7 : std_logic;
   signal f1o_wr_data_u7 : std_logic_vector(31 downto 0);
   signal f2i_full_u7 : std_logic;
   signal f2o_wr_en_u7 : std_logic;
   signal f2o_wr_data_u7 : std_logic_vector(31 downto 0);
   signal f3i_full_u7 : std_logic;
   signal f3o_wr_en_u7 : std_logic;
   signal f3o_wr_data_u7 : std_logic_vector(31 downto 0);
   signal f4i_full_u7 : std_logic;
   signal f4o_wr_en_u7 : std_logic;
   signal f4o_wr_data_u7 : std_logic_vector(31 downto 0);
   signal f5i_full_u7 : std_logic;
   signal f5o_wr_en_u7 : std_logic;
   signal f5o_wr_data_u7 : std_logic_vector(31 downto 0);
   signal f6i_full_u7 : std_logic;
   signal f6o_wr_en_u7 : std_logic;
   signal f6o_wr_data_u7 : std_logic_vector(31 downto 0);
	
	--- u8 Inputs
   signal f1i_wr_en_u8 : std_logic := '0';
   signal f1i_wr_data_u8 : std_logic_vector(31 downto 0) := (others => '0');
   signal f1o_full_u8 : std_logic := '0';
   signal f2i_wr_en_u8 : std_logic := '0';
   signal f2i_wr_data_u8 : std_logic_vector(31 downto 0) := (others => '0');
   signal f2o_full_u8 : std_logic := '0';
   signal f3i_wr_en_u8 : std_logic := '0';
   signal f3i_wr_data_u8 : std_logic_vector(31 downto 0) := (others => '0');
   signal f3o_full_u8 : std_logic := '0';
   signal f4i_wr_en_u8 : std_logic := '0';
   signal f4i_wr_data_u8 : std_logic_vector(31 downto 0) := (others => '0');
   signal f4o_full_u8 : std_logic := '0';
   signal f5i_wr_en_u8 : std_logic := '0';
   signal f5i_wr_data_u8 : std_logic_vector(31 downto 0) := (others => '0');
   signal f5o_full_u8 : std_logic := '0';
   signal f6i_wr_en_u8 : std_logic := '0';
   signal f6i_wr_data_u8 : std_logic_vector(31 downto 0) := (others => '0');
   signal f6o_full_u8 : std_logic := '0';
   signal current_pos_u8 : std_logic_vector(15 downto 0) := (others => '0');

 	--- u8 Outputs
   signal f1i_full_u8 : std_logic;
   signal f1o_wr_en_u8 : std_logic;
   signal f1o_wr_data_u8 : std_logic_vector(31 downto 0);
   signal f2i_full_u8 : std_logic;
   signal f2o_wr_en_u8 : std_logic;
   signal f2o_wr_data_u8 : std_logic_vector(31 downto 0);
   signal f3i_full_u8 : std_logic;
   signal f3o_wr_en_u8 : std_logic;
   signal f3o_wr_data_u8 : std_logic_vector(31 downto 0);
   signal f4i_full_u8 : std_logic;
   signal f4o_wr_en_u8 : std_logic;
   signal f4o_wr_data_u8 : std_logic_vector(31 downto 0);
   signal f5i_full_u8 : std_logic;
   signal f5o_wr_en_u8 : std_logic;
   signal f5o_wr_data_u8 : std_logic_vector(31 downto 0);
   signal f6i_full_u8 : std_logic;
   signal f6o_wr_en_u8 : std_logic;
   signal f6o_wr_data_u8 : std_logic_vector(31 downto 0);
begin
uut1: node_u1 PORT MAP (
          clk => clk,
          rst => rst,
          f1i_wr_en_fifo => f1i_wr_en_u1,
          f1i_wr_data_fifo => f1i_wr_data_u1,
          f1i_full_fifo => f1i_full_u1,
          f1o_wr_en_fifo => f1o_wr_en_u1,
          f1o_wr_data_fifo => f1o_wr_data_u1,
          f1o_full_fifo => f1o_full_u1,
          f2i_wr_en_fifo => f2i_wr_en_u1,
          f2i_wr_data_fifo => f2i_wr_data_u1,
          f2i_full_fifo => f2i_full_u1,
          f2o_wr_en_fifo => f2o_wr_en_u1,
          f2o_wr_data_fifo => f2o_wr_data_u1,
          f2o_full_fifo => f2o_full_u1,
          f3i_wr_en_fifo => f3i_wr_en_u1,
          f3i_wr_data_fifo => f3i_wr_data_u1,
          f3i_full_fifo => f3i_full_u1,
          f3o_wr_en_fifo => f3o_wr_en_u1,
          f3o_wr_data_fifo => f3o_wr_data_u1,
          f3o_full_fifo => f3o_full_u1,
          f4i_wr_en_fifo => f4i_wr_en_u1,
          f4i_wr_data_fifo => f4i_wr_data_u1,
          f4i_full_fifo => f4i_full_u1,
          f4o_wr_en_fifo => f4o_wr_en_u1,
          f4o_wr_data_fifo => f4o_wr_data_u1,
          f4o_full_fifo => f4o_full_u1,
          f5i_wr_en_fifo => f5i_wr_en_u1,
          f5i_wr_data_fifo => f5i_wr_data_u1,
          f5i_full_fifo => f5i_full_u1,
          f5o_wr_en_fifo => f5o_wr_en_u1,
          f5o_wr_data_fifo => f5o_wr_data_u1,
          f5o_full_fifo => f5o_full_u1,
          f6i_wr_en_fifo => f6i_wr_en_u1,
          f6i_wr_data_fifo => f6i_wr_data_u1,
          f6i_full_fifo => f6i_full_u1,
          f6o_wr_en_fifo => f6o_wr_en_u1,
          f6o_wr_data_fifo => f6o_wr_data_u1,
          f6o_full_fifo => f6o_full_u1,
          current_pos => current_pos_u1
        );
		  
		  uut2: node PORT MAP (
          clk => clk,
          rst => rst,
          f1i_wr_en_fifo => f1i_wr_en_u2,
          f1i_wr_data_fifo => f1i_wr_data_u2,
          f1i_full_fifo => f1i_full_u2,
          f1o_wr_en_fifo => f1o_wr_en_u2,
          f1o_wr_data_fifo => f1o_wr_data_u2,
          f1o_full_fifo => f1o_full_u2,
          f2i_wr_en_fifo => f2i_wr_en_u2,
          f2i_wr_data_fifo => f2i_wr_data_u2,
          f2i_full_fifo => f2i_full_u2,
          f2o_wr_en_fifo => f2o_wr_en_u2,
          f2o_wr_data_fifo => f2o_wr_data_u2,
          f2o_full_fifo => f2o_full_u2,
          f3i_wr_en_fifo => f3i_wr_en_u2,
          f3i_wr_data_fifo => f3i_wr_data_u2,
          f3i_full_fifo => f3i_full_u2,
          f3o_wr_en_fifo => f3o_wr_en_u2,
          f3o_wr_data_fifo => f3o_wr_data_u2,
          f3o_full_fifo => f3o_full_u2,
          f4i_wr_en_fifo => f4i_wr_en_u2,
          f4i_wr_data_fifo => f4i_wr_data_u2,
          f4i_full_fifo => f4i_full_u2,
          f4o_wr_en_fifo => f4o_wr_en_u2,
          f4o_wr_data_fifo => f4o_wr_data_u2,
          f4o_full_fifo => f4o_full_u2,
          f5i_wr_en_fifo => f5i_wr_en_u2,
          f5i_wr_data_fifo => f5i_wr_data_u2,
          f5i_full_fifo => f5i_full_u2,
          f5o_wr_en_fifo => f5o_wr_en_u2,
          f5o_wr_data_fifo => f5o_wr_data_u2,
          f5o_full_fifo => f5o_full_u2,
          f6i_wr_en_fifo => f6i_wr_en_u2,
          f6i_wr_data_fifo => f6i_wr_data_u2,
          f6i_full_fifo => f6i_full_u2,
          f6o_wr_en_fifo => f6o_wr_en_u2,
          f6o_wr_data_fifo => f6o_wr_data_u2,
          f6o_full_fifo => f6o_full_u2,
          current_pos => current_pos_u2
        );
	
		
			uut3: node PORT MAP (
          clk => clk,
          rst => rst,
          f1i_wr_en_fifo => f1i_wr_en_u3,
          f1i_wr_data_fifo => f1i_wr_data_u3,
          f1i_full_fifo => f1i_full_u3,
          f1o_wr_en_fifo => f1o_wr_en_u3,
          f1o_wr_data_fifo => f1o_wr_data_u3,
          f1o_full_fifo => f1o_full_u3,
          f2i_wr_en_fifo => f2i_wr_en_u3,
          f2i_wr_data_fifo => f2i_wr_data_u3,
          f2i_full_fifo => f2i_full_u3,
          f2o_wr_en_fifo => f2o_wr_en_u3,
          f2o_wr_data_fifo => f2o_wr_data_u3,
          f2o_full_fifo => f2o_full_u3,
          f3i_wr_en_fifo => f3i_wr_en_u3,
          f3i_wr_data_fifo => f3i_wr_data_u3,
          f3i_full_fifo => f3i_full_u3,
          f3o_wr_en_fifo => f3o_wr_en_u3,
          f3o_wr_data_fifo => f3o_wr_data_u3,
          f3o_full_fifo => f3o_full_u3,
          f4i_wr_en_fifo => f4i_wr_en_u3,
          f4i_wr_data_fifo => f4i_wr_data_u3,
          f4i_full_fifo => f4i_full_u3,
          f4o_wr_en_fifo => f4o_wr_en_u3,
          f4o_wr_data_fifo => f4o_wr_data_u3,
          f4o_full_fifo => f4o_full_u3,
          f5i_wr_en_fifo => f5i_wr_en_u3,
          f5i_wr_data_fifo => f5i_wr_data_u3,
          f5i_full_fifo => f5i_full_u3,
          f5o_wr_en_fifo => f5o_wr_en_u3,
          f5o_wr_data_fifo => f5o_wr_data_u3,
          f5o_full_fifo => f5o_full_u3,
          f6i_wr_en_fifo => f6i_wr_en_u3,
          f6i_wr_data_fifo => f6i_wr_data_u3,
          f6i_full_fifo => f6i_full_u3,
          f6o_wr_en_fifo => f6o_wr_en_u3,
          f6o_wr_data_fifo => f6o_wr_data_u3,
          f6o_full_fifo => f6o_full_u3,
          current_pos => current_pos_u3
        );
		  
		  uut4: node PORT MAP (
          clk => clk,
          rst => rst,
          f1i_wr_en_fifo => f1i_wr_en_u4,
          f1i_wr_data_fifo => f1i_wr_data_u4,
          f1i_full_fifo => f1i_full_u4,
          f1o_wr_en_fifo => f1o_wr_en_u4,
          f1o_wr_data_fifo => f1o_wr_data_u4,
          f1o_full_fifo => f1o_full_u4,
          f2i_wr_en_fifo => f2i_wr_en_u4,
          f2i_wr_data_fifo => f2i_wr_data_u4,
          f2i_full_fifo => f2i_full_u4,
          f2o_wr_en_fifo => f2o_wr_en_u4,
          f2o_wr_data_fifo => f2o_wr_data_u4,
          f2o_full_fifo => f2o_full_u4,
          f3i_wr_en_fifo => f3i_wr_en_u4,
          f3i_wr_data_fifo => f3i_wr_data_u4,
          f3i_full_fifo => f3i_full_u4,
          f3o_wr_en_fifo => f3o_wr_en_u4,
          f3o_wr_data_fifo => f3o_wr_data_u4,
          f3o_full_fifo => f3o_full_u4,
          f4i_wr_en_fifo => f4i_wr_en_u4,
          f4i_wr_data_fifo => f4i_wr_data_u4,
          f4i_full_fifo => f4i_full_u4,
          f4o_wr_en_fifo => f4o_wr_en_u4,
          f4o_wr_data_fifo => f4o_wr_data_u4,
          f4o_full_fifo => f4o_full_u4,
          f5i_wr_en_fifo => f5i_wr_en_u4,
          f5i_wr_data_fifo => f5i_wr_data_u4,
          f5i_full_fifo => f5i_full_u4,
          f5o_wr_en_fifo => f5o_wr_en_u4,
          f5o_wr_data_fifo => f5o_wr_data_u4,
          f5o_full_fifo => f5o_full_u4,
          f6i_wr_en_fifo => f6i_wr_en_u4,
          f6i_wr_data_fifo => f6i_wr_data_u4,
          f6i_full_fifo => f6i_full_u4,
          f6o_wr_en_fifo => f6o_wr_en_u4,
          f6o_wr_data_fifo => f6o_wr_data_u4,
          f6o_full_fifo => f6o_full_u4,
          current_pos => current_pos_u4
        );
		  
		  uut5: node PORT MAP (
          clk => clk,
          rst => rst,
          f1i_wr_en_fifo => f1i_wr_en_u5,
          f1i_wr_data_fifo => f1i_wr_data_u5,
          f1i_full_fifo => f1i_full_u5,
          f1o_wr_en_fifo => f1o_wr_en_u5,
          f1o_wr_data_fifo => f1o_wr_data_u5,
          f1o_full_fifo => f1o_full_u5,
          f2i_wr_en_fifo => f2i_wr_en_u5,
          f2i_wr_data_fifo => f2i_wr_data_u5,
          f2i_full_fifo => f2i_full_u5,
          f2o_wr_en_fifo => f2o_wr_en_u5,
          f2o_wr_data_fifo => f2o_wr_data_u5,
          f2o_full_fifo => f2o_full_u5,
          f3i_wr_en_fifo => f3i_wr_en_u5,
          f3i_wr_data_fifo => f3i_wr_data_u5,
          f3i_full_fifo => f3i_full_u5,
          f3o_wr_en_fifo => f3o_wr_en_u5,
          f3o_wr_data_fifo => f3o_wr_data_u5,
          f3o_full_fifo => f3o_full_u5,
          f4i_wr_en_fifo => f4i_wr_en_u5,
          f4i_wr_data_fifo => f4i_wr_data_u5,
          f4i_full_fifo => f4i_full_u5,
          f4o_wr_en_fifo => f4o_wr_en_u5,
          f4o_wr_data_fifo => f4o_wr_data_u5,
          f4o_full_fifo => f4o_full_u5,
          f5i_wr_en_fifo => f5i_wr_en_u5,
          f5i_wr_data_fifo => f5i_wr_data_u5,
          f5i_full_fifo => f5i_full_u5,
          f5o_wr_en_fifo => f5o_wr_en_u5,
          f5o_wr_data_fifo => f5o_wr_data_u5,
          f5o_full_fifo => f5o_full_u5,
          f6i_wr_en_fifo => f6i_wr_en_u5,
          f6i_wr_data_fifo => f6i_wr_data_u5,
          f6i_full_fifo => f6i_full_u5,
          f6o_wr_en_fifo => f6o_wr_en_u5,
          f6o_wr_data_fifo => f6o_wr_data_u5,
          f6o_full_fifo => f6o_full_u5,
          current_pos => current_pos_u5
        );
		  
		  uut6: node PORT MAP (
          clk => clk,
          rst => rst,
          f1i_wr_en_fifo => f1i_wr_en_u6,
          f1i_wr_data_fifo => f1i_wr_data_u6,
          f1i_full_fifo => f1i_full_u6,
          f1o_wr_en_fifo => f1o_wr_en_u6,
          f1o_wr_data_fifo => f1o_wr_data_u6,
          f1o_full_fifo => f1o_full_u6,
          f2i_wr_en_fifo => f2i_wr_en_u6,
          f2i_wr_data_fifo => f2i_wr_data_u6,
          f2i_full_fifo => f2i_full_u6,
          f2o_wr_en_fifo => f2o_wr_en_u6,
          f2o_wr_data_fifo => f2o_wr_data_u6,
          f2o_full_fifo => f2o_full_u6,
          f3i_wr_en_fifo => f3i_wr_en_u6,
          f3i_wr_data_fifo => f3i_wr_data_u6,
          f3i_full_fifo => f3i_full_u6,
          f3o_wr_en_fifo => f3o_wr_en_u6,
          f3o_wr_data_fifo => f3o_wr_data_u6,
          f3o_full_fifo => f3o_full_u6,
          f4i_wr_en_fifo => f4i_wr_en_u6,
          f4i_wr_data_fifo => f4i_wr_data_u6,
          f4i_full_fifo => f4i_full_u6,
          f4o_wr_en_fifo => f4o_wr_en_u6,
          f4o_wr_data_fifo => f4o_wr_data_u6,
          f4o_full_fifo => f4o_full_u6,
          f5i_wr_en_fifo => f5i_wr_en_u6,
          f5i_wr_data_fifo => f5i_wr_data_u6,
          f5i_full_fifo => f5i_full_u6,
          f5o_wr_en_fifo => f5o_wr_en_u6,
          f5o_wr_data_fifo => f5o_wr_data_u6,
          f5o_full_fifo => f5o_full_u6,
          f6i_wr_en_fifo => f6i_wr_en_u6,
          f6i_wr_data_fifo => f6i_wr_data_u6,
          f6i_full_fifo => f6i_full_u6,
          f6o_wr_en_fifo => f6o_wr_en_u6,
          f6o_wr_data_fifo => f6o_wr_data_u6,
          f6o_full_fifo => f6o_full_u6,
          current_pos => current_pos_u6
        );
		  
		  uut7: node_u7 PORT MAP (
          clk => clk,
          rst => rst,
          f1i_wr_en_fifo => f1i_wr_en_u7,
          f1i_wr_data_fifo => f1i_wr_data_u7,
          f1i_full_fifo => f1i_full_u7,
          f1o_wr_en_fifo => f1o_wr_en_u7,
          f1o_wr_data_fifo => f1o_wr_data_u7,
          f1o_full_fifo => f1o_full_u7,
          f2i_wr_en_fifo => f2i_wr_en_u7,
          f2i_wr_data_fifo => f2i_wr_data_u7,
          f2i_full_fifo => f2i_full_u7,
          f2o_wr_en_fifo => f2o_wr_en_u7,
          f2o_wr_data_fifo => f2o_wr_data_u7,
          f2o_full_fifo => f2o_full_u7,
          f3i_wr_en_fifo => f3i_wr_en_u7,
          f3i_wr_data_fifo => f3i_wr_data_u7,
          f3i_full_fifo => f3i_full_u7,
          f3o_wr_en_fifo => f3o_wr_en_u7,
          f3o_wr_data_fifo => f3o_wr_data_u7,
          f3o_full_fifo => f3o_full_u7,
          f4i_wr_en_fifo => f4i_wr_en_u7,
          f4i_wr_data_fifo => f4i_wr_data_u7,
          f4i_full_fifo => f4i_full_u7,
          f4o_wr_en_fifo => f4o_wr_en_u7,
          f4o_wr_data_fifo => f4o_wr_data_u7,
          f4o_full_fifo => f4o_full_u7,
          f5i_wr_en_fifo => f5i_wr_en_u7,
          f5i_wr_data_fifo => f5i_wr_data_u7,
          f5i_full_fifo => f5i_full_u7,
          f5o_wr_en_fifo => f5o_wr_en_u7,
          f5o_wr_data_fifo => f5o_wr_data_u7,
          f5o_full_fifo => f5o_full_u7,
          f6i_wr_en_fifo => f6i_wr_en_u7,
          f6i_wr_data_fifo => f6i_wr_data_u7,
          f6i_full_fifo => f6i_full_u7,
          f6o_wr_en_fifo => f6o_wr_en_u7,
          f6o_wr_data_fifo => f6o_wr_data_u7,
          f6o_full_fifo => f6o_full_u7,
          current_pos => current_pos_u7
        );
		  
		  uut8: node PORT MAP (
          clk => clk,
          rst => rst,
          f1i_wr_en_fifo => f1i_wr_en_u8,
          f1i_wr_data_fifo => f1i_wr_data_u8,
          f1i_full_fifo => f1i_full_u8,
          f1o_wr_en_fifo => f1o_wr_en_u8,
          f1o_wr_data_fifo => f1o_wr_data_u8,
          f1o_full_fifo => f1o_full_u8,
          f2i_wr_en_fifo => f2i_wr_en_u8,
          f2i_wr_data_fifo => f2i_wr_data_u8,
          f2i_full_fifo => f2i_full_u8,
          f2o_wr_en_fifo => f2o_wr_en_u8,
          f2o_wr_data_fifo => f2o_wr_data_u8,
          f2o_full_fifo => f2o_full_u8,
          f3i_wr_en_fifo => f3i_wr_en_u8,
          f3i_wr_data_fifo => f3i_wr_data_u8,
          f3i_full_fifo => f3i_full_u8,
          f3o_wr_en_fifo => f3o_wr_en_u8,
          f3o_wr_data_fifo => f3o_wr_data_u8,
          f3o_full_fifo => f3o_full_u8,
          f4i_wr_en_fifo => f4i_wr_en_u8,
          f4i_wr_data_fifo => f4i_wr_data_u8,
          f4i_full_fifo => f4i_full_u8,
          f4o_wr_en_fifo => f4o_wr_en_u8,
          f4o_wr_data_fifo => f4o_wr_data_u8,
          f4o_full_fifo => f4o_full_u8,
          f5i_wr_en_fifo => f5i_wr_en_u8,
          f5i_wr_data_fifo => f5i_wr_data_u8,
          f5i_full_fifo => f5i_full_u8,
          f5o_wr_en_fifo => f5o_wr_en_u8,
          f5o_wr_data_fifo => f5o_wr_data_u8,
          f5o_full_fifo => f5o_full_u8,
          f6i_wr_en_fifo => f6i_wr_en_u8,
          f6i_wr_data_fifo => f6i_wr_data_u8,
          f6i_full_fifo => f6i_full_u8,
          f6o_wr_en_fifo => f6o_wr_en_u8,
          f6o_wr_data_fifo => f6o_wr_data_u8,
          f6o_full_fifo => f6o_full_u8,
          current_pos => current_pos_u8
        );
		  
		  ---- u1 (f5-f6) u2
		  	 f5i_wr_en_u1 <= f6o_wr_en_u2;
          f5i_wr_data_u1 <= f6o_wr_data_u2;
          f6o_full_u2 <=  f5i_full_u1;
			 
			 f6i_wr_en_u2 <= f5o_wr_en_u1;
          f6i_wr_data_u2 <= f5o_wr_data_u1;
          f5o_full_u1 <= f6i_full_u2;
		  -----u1 (f1 f2) u3
			 f1i_wr_en_u1 <= f2o_wr_en_u3;
          f1i_wr_data_u1 <= f2o_wr_data_u3;
          f2o_full_u3 <=  f1i_full_u1;
			 
			 f2i_wr_en_u3 <= f1o_wr_en_u1;
          f2i_wr_data_u3 <= f1o_wr_data_u1;
          f1o_full_u1 <= f2i_full_u3;
		  ------ u1(f4   f3) u5
			 f4i_wr_en_u1 <= f3o_wr_en_u3;
          f4i_wr_data_u1 <= f3o_wr_data_u3;
          f3o_full_u3 <=  f4i_full_u1;
			 
			 f3i_wr_en_u3 <= f4o_wr_en_u1;
          f3i_wr_data_u3 <= f4o_wr_data_u1;
          f4o_full_u1 <= f3i_full_u3;	
			-----	u7 (f2  f1) u2
			 f2i_wr_en_u7 <= f1o_wr_en_u2;
          f2i_wr_data_u7 <= f1o_wr_data_u2;
          f1o_full_u2 <=  f2i_full_u7;
			 
			 f1i_wr_en_u2 <= f2o_wr_en_u7;
          f1i_wr_data_u2 <= f2o_wr_data_u7;
          f2o_full_u7 <= f1i_full_u2;	
			----- u7 (f6  f5) u3
			 f6i_wr_en_u7 <= f5o_wr_en_u3;
          f6i_wr_data_u7 <= f5o_wr_data_u3;
          f5o_full_u3 <=  f6i_full_u7;
			 
			 f5i_wr_en_u3 <= f6o_wr_en_u7;
          f5i_wr_data_u3 <= f6o_wr_data_u7;
          f6o_full_u7 <= f5i_full_u3;	
			----- u7 (f4   f3) u8
			 f4i_wr_en_u7 <= f3o_wr_en_u8;
          f4i_wr_data_u7 <= f3o_wr_data_u8;
          f3o_full_u8 <=  f4i_full_u7;
			 
			 f3i_wr_en_u8 <= f4o_wr_en_u7;
          f3i_wr_data_u8 <= f4o_wr_data_u7;
          f4o_full_u7 <= f3i_full_u8;
			---- u4 (f5  f6) u8
			 f5i_wr_en_u4 <= f6o_wr_en_u8;
          f5i_wr_data_u4 <= f6o_wr_data_u8;
          f6o_full_u8 <=  f5i_full_u4;
			 
			 f6i_wr_en_u8 <= f5o_wr_en_u4;
          f6i_wr_data_u8 <= f5o_wr_data_u4;
          f5o_full_u4 <= f6i_full_u8;
			----- u4 (f2 f1) u5
			 f2i_wr_en_u4 <= f1o_wr_en_u5;
          f2i_wr_data_u4 <= f1o_wr_data_u5;
          f1o_full_u5 <=  f2i_full_u4;
			 
			 f1i_wr_en_u5 <= f2o_wr_en_u4;
          f1i_wr_data_u5 <= f2o_wr_data_u4;
          f2o_full_u4 <= f1i_full_u5;			
			------- u4 (f3 f4) u3
			 f3i_wr_en_u4 <= f4o_wr_en_u3;
          f3i_wr_data_u4 <= f4o_wr_data_u3;
          f4o_full_u3 <=  f3i_full_u4;
			 
			 f4i_wr_en_u3 <= f3o_wr_en_u4;
          f4i_wr_data_u3 <= f3o_wr_data_u4;
          f3o_full_u4 <= f4i_full_u3;
			 ------ u6 (f3 f4) u2
			 f3i_wr_en_u6 <= f4o_wr_en_u2;
          f3i_wr_data_u6 <= f4o_wr_data_u2;
          f4o_full_u2 <=  f3i_full_u6;
			 
			 f4i_wr_en_u2 <= f3o_wr_en_u6;
          f4i_wr_data_u2 <= f3o_wr_data_u6;
          f3o_full_u6 <= f4i_full_u2;
			 ------ u6(f1  f2) u8
			 f1i_wr_en_u6 <= f2o_wr_en_u8;
          f1i_wr_data_u6 <= f2o_wr_data_u8;
          f2o_full_u8 <=  f1i_full_u6;
			 
			 f2i_wr_en_u8 <= f1o_wr_en_u6;
          f2i_wr_data_u8 <= f1o_wr_data_u6;
          f1o_full_u6 <= f2i_full_u8;	
			 ------- u6(f6  f5) u5
			 f6i_wr_en_u6 <= f5o_wr_en_u5;
          f6i_wr_data_u6 <= f5o_wr_data_u5;
          f5o_full_u5 <=  f6i_full_u6;
			 
			 f5i_wr_en_u5 <= f6o_wr_en_u6;
          f5i_wr_data_u5 <= f6o_wr_data_u6;
          f6o_full_u6 <= f5i_full_u5;				 
			 
			 current_pos_u1 <=x"0000";
			 current_pos_u2 <=x"0002";
			 current_pos_u3 <=x"0800";
			 current_pos_u4 <=x"0840";
			 current_pos_u5 <=x"0040";
			 current_pos_u6 <=x"0042";
			 current_pos_u7 <=x"0802";
			 current_pos_u8 <=x"0842";

end Behavioral;

