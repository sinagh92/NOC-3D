----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:56:31 06/11/2018 
-- Design Name: 
-- Module Name:    node - Behavioral 
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

entity node_u1 is
	port(
	clk : in std_logic;
	rst : in std_logic;
	
		--- f1i correct		
		   f1i_wr_en_fifo : in std_logic;
         f1i_wr_data_fifo : in std_logic_vector(31 downto 0);
         f1i_full_fifo : out std_logic;
			
		--- f1o correct
          f1o_wr_en_fifo : out std_logic;
          f1o_wr_data_fifo : out std_logic_vector(31 downto 0);
          f1o_full_fifo : in std_logic;

		--- f2i correct		
		   f2i_wr_en_fifo : in std_logic;
         f2i_wr_data_fifo : in std_logic_vector(31 downto 0);
         f2i_full_fifo : out std_logic;
			
		--- f2o correct
          f2o_wr_en_fifo : out std_logic;
          f2o_wr_data_fifo : out std_logic_vector(31 downto 0);
          f2o_full_fifo : in std_logic;
			
		--- f3i correct		
		   f3i_wr_en_fifo : in std_logic;
         f3i_wr_data_fifo : in std_logic_vector(31 downto 0);
         f3i_full_fifo : out std_logic;
			
		--- f3o correct
          f3o_wr_en_fifo : out std_logic;
          f3o_wr_data_fifo : out std_logic_vector(31 downto 0);
          f3o_full_fifo : in std_logic;

		--- f4i correct		
		   f4i_wr_en_fifo : in std_logic;
         f4i_wr_data_fifo : in std_logic_vector(31 downto 0);
         f4i_full_fifo : out std_logic;
			
		--- f4o correct
          f4o_wr_en_fifo : out std_logic;
          f4o_wr_data_fifo : out std_logic_vector(31 downto 0);
          f4o_full_fifo : in std_logic;
			 
		--- f5i correct		
		   f5i_wr_en_fifo : in std_logic;
         f5i_wr_data_fifo : in std_logic_vector(31 downto 0);
         f5i_full_fifo : out std_logic;
			
		--- f5o correct
          f5o_wr_en_fifo : out std_logic;
          f5o_wr_data_fifo : out std_logic_vector(31 downto 0);
          f5o_full_fifo : in std_logic;
			 
		--- f6i correct		
		   f6i_wr_en_fifo : in std_logic;
         f6i_wr_data_fifo : in std_logic_vector(31 downto 0);
         f6i_full_fifo : out std_logic;
			
		--- f6o correct
          f6o_wr_en_fifo : out std_logic;
          f6o_wr_data_fifo : out std_logic_vector(31 downto 0);
          f6o_full_fifo : in std_logic;

   current_pos : IN  std_logic_vector(15 downto 0)
	);
end node_u1;

architecture Behavioral of node_u1 is
    COMPONENT local_cpu_u1
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         current_pos : IN  std_logic_vector(15 downto 0);
         f1i_wr_en_loc : IN  std_logic;
         f1i_wr_data_loc : IN  std_logic_vector(31 downto 0);
         f1i_full_loc : OUT  std_logic;
         f1o_rd_en_loc : IN  std_logic;
         f1o_rd_data_loc : OUT  std_logic_vector(31 downto 0);
         f1o_empty_loc : OUT  std_logic			
        );
    END COMPONENT;
	 
	    COMPONENT router
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         current_pos : IN  std_logic_vector(15 downto 0);
         f1i_rd_en : OUT  std_logic;
         f1i_rd_data : IN  std_logic_vector(31 downto 0);
         f1i_empty : IN  std_logic;
         f1o_wr_en : OUT  std_logic;
         f1o_wr_data : OUT  std_logic_vector(31 downto 0);
         f1o_full : IN  std_logic;
         f2i_rd_en : OUT  std_logic;
         f2i_rd_data : IN  std_logic_vector(31 downto 0);
         f2i_empty : IN  std_logic;
         f2o_wr_en : OUT  std_logic;
         f2o_wr_data : OUT  std_logic_vector(31 downto 0);
         f2o_full : IN  std_logic;
         f3i_rd_en : OUT  std_logic;
         f3i_rd_data : IN  std_logic_vector(31 downto 0);
         f3i_empty : IN  std_logic;
         f3o_wr_en : OUT  std_logic;
         f3o_wr_data : OUT  std_logic_vector(31 downto 0);
         f3o_full : IN  std_logic;
         f4i_rd_en : OUT  std_logic;
         f4i_rd_data : IN  std_logic_vector(31 downto 0);
         f4i_empty : IN  std_logic;
         f4o_wr_en : OUT  std_logic;
         f4o_wr_data : OUT  std_logic_vector(31 downto 0);
         f4o_full : IN  std_logic;
         f5i_rd_en : OUT  std_logic;
         f5i_rd_data : IN  std_logic_vector(31 downto 0);
         f5i_empty : IN  std_logic;
         f5o_wr_en : OUT  std_logic;
         f5o_wr_data : OUT  std_logic_vector(31 downto 0);
         f5o_full : IN  std_logic;
         f6i_rd_en : OUT  std_logic;
         f6i_rd_data : IN  std_logic_vector(31 downto 0);
         f6i_empty : IN  std_logic;
         f6o_wr_en : OUT  std_logic;
         f6o_wr_data : OUT  std_logic_vector(31 downto 0);
         f6o_full : IN  std_logic;
         fi_rd_en_loc : OUT  std_logic;
         fi_rd_data_loc : IN  std_logic_vector(31 downto 0);
         fi_empty_loc : IN  std_logic;
         fo_wr_en_loc : OUT  std_logic;
         fo_wr_data_loc : OUT  std_logic_vector(31 downto 0);
         fo_full_loc : IN  std_logic
        );
    END COMPONENT;
	 
	     COMPONENT fifo_32b
    PORT(
         i_rst_sync : IN  std_logic;
         i_clk : IN  std_logic;
         i_wr_en : IN  std_logic;
         i_wr_data : IN  std_logic_vector(31 downto 0);
         o_full : OUT  std_logic;
         i_rd_en : IN  std_logic;
         o_rd_data : OUT  std_logic_vector(31 downto 0);
         o_empty : OUT  std_logic
        );
    END COMPONENT;
signal f1i_wr_en_loc,f1i_full_loc,f1o_rd_en_loc,f1o_empty_loc : std_logic := '0';
signal f1i_wr_data_loc,f1o_rd_data_loc : std_logic_vector(31 downto 0) := (others =>'0');

signal fi_rd_en_loc,fi_empty_loc,fo_wr_en_loc,fo_full_loc :  std_logic := '0';
signal fo_wr_data_loc,fi_rd_data_loc : std_logic_vector(31 downto 0) := (others =>'0');

signal f1i_rd_en,f2i_rd_en,f3i_rd_en,f4i_rd_en,f5i_rd_en,f6i_rd_en : std_logic := '0';
signal f1i_rd_data,f2i_rd_data,f3i_rd_data,f4i_rd_data,f5i_rd_data,f6i_rd_data : std_logic_vector(31 downto 0) := (others =>'0');
signal f1i_empty,f2i_empty,f3i_empty,f4i_empty,f5i_empty,f6i_empty : std_logic := '0';
signal f1o_wr_en,f2o_wr_en,f3o_wr_en,f4o_wr_en,f5o_wr_en,f6o_wr_en : std_logic := '0';
signal f1o_wr_data,f2o_wr_data,f3o_wr_data,f4o_wr_data,f5o_wr_data,f6o_wr_data : std_logic_vector(31 downto 0) := (others =>'0');
signal f1o_full,f2o_full,f3o_full,f4o_full,f5o_full,f6o_full : std_logic := '0';
signal f1i_rd_en_fifo,f2i_rd_en_fifo,f3i_rd_en_fifo,f4i_rd_en_fifo,f5i_rd_en_fifo,f6i_rd_en_fifo : std_logic := '0';
signal f1i_rd_data_fifo,f2i_rd_data_fifo,f3i_rd_data_fifo,f4i_rd_data_fifo,f5i_rd_data_fifo,f6i_rd_data_fifo :  std_logic_vector(31 downto 0) := (others =>'0');
signal f1i_empty_fifo,f2i_empty_fifo,f3i_empty_fifo,f4i_empty_fifo,f5i_empty_fifo,f6i_empty_fifo : std_logic := '0';
begin



   local_cpu_unit: local_cpu_u1 PORT MAP (
          clk => clk,
          rst => rst,
          current_pos => current_pos,
          f1i_wr_en_loc => f1i_wr_en_loc,
          f1i_wr_data_loc => f1i_wr_data_loc,
          f1i_full_loc => f1i_full_loc,
          f1o_rd_en_loc => f1o_rd_en_loc,
          f1o_rd_data_loc => f1o_rd_data_loc,
          f1o_empty_loc => f1o_empty_loc
        );
  router_unit: router PORT MAP (
          clk => clk,
          rst => rst,
          current_pos => current_pos,
          f1i_rd_en => f1i_rd_en,
          f1i_rd_data => f1i_rd_data,
          f1i_empty => f1i_empty,
          f1o_wr_en => f1o_wr_en,
          f1o_wr_data => f1o_wr_data,
          f1o_full => f1o_full,
          f2i_rd_en => f2i_rd_en,
          f2i_rd_data => f2i_rd_data,
          f2i_empty => f2i_empty,
          f2o_wr_en => f2o_wr_en,
          f2o_wr_data => f2o_wr_data,
          f2o_full => f2o_full,
          f3i_rd_en => f3i_rd_en,
          f3i_rd_data => f3i_rd_data,
          f3i_empty => f3i_empty,
          f3o_wr_en => f3o_wr_en,
          f3o_wr_data => f3o_wr_data,
          f3o_full => f3o_full,
          f4i_rd_en => f4i_rd_en,
          f4i_rd_data => f4i_rd_data,
          f4i_empty => f4i_empty,
          f4o_wr_en => f4o_wr_en,
          f4o_wr_data => f4o_wr_data,
          f4o_full => f4o_full,
          f5i_rd_en => f5i_rd_en,
          f5i_rd_data => f5i_rd_data,
          f5i_empty => f5i_empty,
          f5o_wr_en => f5o_wr_en,
          f5o_wr_data => f5o_wr_data,
          f5o_full => f5o_full,
          f6i_rd_en => f6i_rd_en,
          f6i_rd_data => f6i_rd_data,
          f6i_empty => f6i_empty,
          f6o_wr_en => f6o_wr_en,
          f6o_wr_data => f6o_wr_data,
          f6o_full => f6o_full,
          fi_rd_en_loc => fi_rd_en_loc,
          fi_rd_data_loc => fi_rd_data_loc,
          fi_empty_loc => fi_empty_loc,
          fo_wr_en_loc => fo_wr_en_loc,
          fo_wr_data_loc => fo_wr_data_loc,
          fo_full_loc => fo_full_loc
        );
		  
   f1i: fifo_32b PORT MAP (
          i_rst_sync => rst,
          i_clk => clk,
          i_wr_en => f1i_wr_en_fifo,
          i_wr_data => f1i_wr_data_fifo,
          o_full => f1i_full_fifo,
          i_rd_en => f1i_rd_en_fifo,
          o_rd_data => f1i_rd_data_fifo,
          o_empty => f1i_empty_fifo
        );
		  
   f2i: fifo_32b PORT MAP (
          i_rst_sync => rst,
          i_clk => clk,
          i_wr_en => f2i_wr_en_fifo,
          i_wr_data => f2i_wr_data_fifo,
          o_full => f2i_full_fifo,
          i_rd_en => f2i_rd_en_fifo,
          o_rd_data => f2i_rd_data_fifo,
          o_empty => f2i_empty_fifo
        );

   f3i: fifo_32b PORT MAP (
          i_rst_sync => rst,
          i_clk => clk,
          i_wr_en => f3i_wr_en_fifo,
          i_wr_data => f3i_wr_data_fifo,
          o_full => f3i_full_fifo,
          i_rd_en => f3i_rd_en_fifo,
          o_rd_data => f3i_rd_data_fifo,
          o_empty => f3i_empty_fifo
        );		  

   f4i: fifo_32b PORT MAP (
          i_rst_sync => rst,
          i_clk => clk,
          i_wr_en => f4i_wr_en_fifo,
          i_wr_data => f4i_wr_data_fifo,
          o_full => f4i_full_fifo,
          i_rd_en => f4i_rd_en_fifo,
          o_rd_data => f4i_rd_data_fifo,
          o_empty => f4i_empty_fifo
        );	

   f5i: fifo_32b PORT MAP (
          i_rst_sync => rst,
          i_clk => clk,
          i_wr_en => f5i_wr_en_fifo,
          i_wr_data => f5i_wr_data_fifo,
          o_full => f5i_full_fifo,
          i_rd_en => f5i_rd_en_fifo,
          o_rd_data => f5i_rd_data_fifo,
          o_empty => f5i_empty_fifo
        );

   f6i: fifo_32b PORT MAP (
          i_rst_sync => rst,
          i_clk => clk,
          i_wr_en => f6i_wr_en_fifo,
          i_wr_data => f6i_wr_data_fifo,
          o_full => f6i_full_fifo,
          i_rd_en => f6i_rd_en_fifo,
          o_rd_data => f6i_rd_data_fifo,
          o_empty => f6i_empty_fifo
        );		  

			---- f1
			---  read for fifo inside this module
			 f1i_wr_en_loc <= fo_wr_en_loc;
			 f1i_wr_data_loc <= fo_wr_data_loc;
			 f1i_full_loc <= fo_full_loc;
			--- writing on fifo adjecent to this module
			 f1o_rd_en_loc <= fi_rd_en_loc;
			 fi_rd_data_loc <= f1o_rd_data_loc;
			 fi_empty_loc <= f1o_empty_loc;
			 

			---- f1
			---  read for fifo inside this module
			 f1i_rd_en_fifo <= f1i_rd_en;		-- out
          f1i_rd_data <= f1i_rd_data_fifo;	-- in
          f1i_empty <= f1i_empty_fifo;		-- in
			--- writing on fifo adjecent to this module
          f1o_wr_en_fifo <= f1o_wr_en; 	-- out
          f1o_wr_data_fifo <= f1o_wr_data;	-- out
          f1o_full <= f1o_full_fifo; 		-- in

			---- f2
			---  read for fifo inside this module
			 f2i_rd_en_fifo <= f2i_rd_en;		-- out
          f2i_rd_data <= f2i_rd_data_fifo;	-- in
          f2i_empty <= f2i_empty_fifo;		-- in
			--- writing on fifo adjecent to this module
          f2o_wr_en_fifo <= f2o_wr_en; 	-- out
          f2o_wr_data_fifo <= f2o_wr_data;	-- out
          f2o_full <= f2o_full_fifo; 		-- in

			---- f3
			---  read for fifo inside this module
			 f3i_rd_en_fifo <= f3i_rd_en;		-- out
          f3i_rd_data <= f3i_rd_data_fifo;	-- in
          f3i_empty <= f3i_empty_fifo;		-- in
			--- writing on fifo adjecent to this module
          f3o_wr_en_fifo <= f3o_wr_en; 	-- out
          f3o_wr_data_fifo <= f3o_wr_data;	-- out
          f3o_full <= f3o_full_fifo; 		-- in
			 
			---- f4
			---  read for fifo inside this module
			 f4i_rd_en_fifo <= f4i_rd_en;		-- out
          f4i_rd_data <= f4i_rd_data_fifo;	-- in
          f4i_empty <= f4i_empty_fifo;		-- in
			--- writing on fifo adjecent to this module
          f4o_wr_en_fifo <= f4o_wr_en; 	-- out
          f4o_wr_data_fifo <= f4o_wr_data;	-- out
          f4o_full <= f4o_full_fifo; 		-- in

			---- f5
			---  read for fifo inside this module
			 f5i_rd_en_fifo <= f5i_rd_en;		-- out
          f5i_rd_data <= f5i_rd_data_fifo;	-- in
          f5i_empty <= f5i_empty_fifo;		-- in
			--- writing on fifo adjecent to this module
          f5o_wr_en_fifo <= f5o_wr_en; 	-- out
          f5o_wr_data_fifo <= f5o_wr_data;	-- out
          f5o_full <= f5o_full_fifo; 		-- in
			 
			---- f6
			---  read for fifo inside this module
			 f6i_rd_en_fifo <= f6i_rd_en;		-- out
          f6i_rd_data <= f6i_rd_data_fifo;	-- in
          f6i_empty <= f6i_empty_fifo;		-- in
			--- writing on fifo adjecent to this module
          f6o_wr_en_fifo <= f6o_wr_en; 	-- out
          f6o_wr_data_fifo <= f6o_wr_data;	-- out
          f6o_full <= f6o_full_fifo; 		-- in
			 
end Behavioral;

