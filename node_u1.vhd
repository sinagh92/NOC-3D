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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY node_u1 IS
     PORT (
          clk : IN STD_LOGIC;
          rst : IN STD_LOGIC;

          --- f1i correct		
          f1i_wr_en_fifo : IN STD_LOGIC;
          f1i_wr_data_fifo : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
          f1i_full_fifo : OUT STD_LOGIC;

          --- f1o correct
          f1o_wr_en_fifo : OUT STD_LOGIC;
          f1o_wr_data_fifo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
          f1o_full_fifo : IN STD_LOGIC;

          --- f2i correct		
          f2i_wr_en_fifo : IN STD_LOGIC;
          f2i_wr_data_fifo : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
          f2i_full_fifo : OUT STD_LOGIC;

          --- f2o correct
          f2o_wr_en_fifo : OUT STD_LOGIC;
          f2o_wr_data_fifo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
          f2o_full_fifo : IN STD_LOGIC;

          --- f3i correct		
          f3i_wr_en_fifo : IN STD_LOGIC;
          f3i_wr_data_fifo : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
          f3i_full_fifo : OUT STD_LOGIC;

          --- f3o correct
          f3o_wr_en_fifo : OUT STD_LOGIC;
          f3o_wr_data_fifo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
          f3o_full_fifo : IN STD_LOGIC;

          --- f4i correct		
          f4i_wr_en_fifo : IN STD_LOGIC;
          f4i_wr_data_fifo : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
          f4i_full_fifo : OUT STD_LOGIC;

          --- f4o correct
          f4o_wr_en_fifo : OUT STD_LOGIC;
          f4o_wr_data_fifo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
          f4o_full_fifo : IN STD_LOGIC;

          --- f5i correct		
          f5i_wr_en_fifo : IN STD_LOGIC;
          f5i_wr_data_fifo : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
          f5i_full_fifo : OUT STD_LOGIC;

          --- f5o correct
          f5o_wr_en_fifo : OUT STD_LOGIC;
          f5o_wr_data_fifo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
          f5o_full_fifo : IN STD_LOGIC;

          --- f6i correct		
          f6i_wr_en_fifo : IN STD_LOGIC;
          f6i_wr_data_fifo : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
          f6i_full_fifo : OUT STD_LOGIC;

          --- f6o correct
          f6o_wr_en_fifo : OUT STD_LOGIC;
          f6o_wr_data_fifo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
          f6o_full_fifo : IN STD_LOGIC;

          current_pos : IN STD_LOGIC_VECTOR(15 DOWNTO 0)
     );
END node_u1;

ARCHITECTURE Behavioral OF node_u1 IS
     COMPONENT local_cpu_u1
          PORT (
               clk : IN STD_LOGIC;
               rst : IN STD_LOGIC;
               current_pos : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
               f1i_wr_en_loc : IN STD_LOGIC;
               f1i_wr_data_loc : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
               f1i_full_loc : OUT STD_LOGIC;
               f1o_rd_en_loc : IN STD_LOGIC;
               f1o_rd_data_loc : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
               f1o_empty_loc : OUT STD_LOGIC
          );
     END COMPONENT;

     COMPONENT router
          PORT (
               clk : IN STD_LOGIC;
               rst : IN STD_LOGIC;
               current_pos : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
               f1i_rd_en : OUT STD_LOGIC;
               f1i_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
               f1i_empty : IN STD_LOGIC;
               f1o_wr_en : OUT STD_LOGIC;
               f1o_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
               f1o_full : IN STD_LOGIC;
               f2i_rd_en : OUT STD_LOGIC;
               f2i_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
               f2i_empty : IN STD_LOGIC;
               f2o_wr_en : OUT STD_LOGIC;
               f2o_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
               f2o_full : IN STD_LOGIC;
               f3i_rd_en : OUT STD_LOGIC;
               f3i_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
               f3i_empty : IN STD_LOGIC;
               f3o_wr_en : OUT STD_LOGIC;
               f3o_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
               f3o_full : IN STD_LOGIC;
               f4i_rd_en : OUT STD_LOGIC;
               f4i_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
               f4i_empty : IN STD_LOGIC;
               f4o_wr_en : OUT STD_LOGIC;
               f4o_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
               f4o_full : IN STD_LOGIC;
               f5i_rd_en : OUT STD_LOGIC;
               f5i_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
               f5i_empty : IN STD_LOGIC;
               f5o_wr_en : OUT STD_LOGIC;
               f5o_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
               f5o_full : IN STD_LOGIC;
               f6i_rd_en : OUT STD_LOGIC;
               f6i_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
               f6i_empty : IN STD_LOGIC;
               f6o_wr_en : OUT STD_LOGIC;
               f6o_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
               f6o_full : IN STD_LOGIC;
               fi_rd_en_loc : OUT STD_LOGIC;
               fi_rd_data_loc : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
               fi_empty_loc : IN STD_LOGIC;
               fo_wr_en_loc : OUT STD_LOGIC;
               fo_wr_data_loc : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
               fo_full_loc : IN STD_LOGIC
          );
     END COMPONENT;

     COMPONENT fifo_32b
          PORT (
               i_rst_sync : IN STD_LOGIC;
               i_clk : IN STD_LOGIC;
               i_wr_en : IN STD_LOGIC;
               i_wr_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
               o_full : OUT STD_LOGIC;
               i_rd_en : IN STD_LOGIC;
               o_rd_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
               o_empty : OUT STD_LOGIC
          );
     END COMPONENT;
     SIGNAL f1i_wr_en_loc, f1i_full_loc, f1o_rd_en_loc, f1o_empty_loc : STD_LOGIC := '0';
     SIGNAL f1i_wr_data_loc, f1o_rd_data_loc : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');

     SIGNAL fi_rd_en_loc, fi_empty_loc, fo_wr_en_loc, fo_full_loc : STD_LOGIC := '0';
     SIGNAL fo_wr_data_loc, fi_rd_data_loc : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');

     SIGNAL f1i_rd_en, f2i_rd_en, f3i_rd_en, f4i_rd_en, f5i_rd_en, f6i_rd_en : STD_LOGIC := '0';
     SIGNAL f1i_rd_data, f2i_rd_data, f3i_rd_data, f4i_rd_data, f5i_rd_data, f6i_rd_data : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
     SIGNAL f1i_empty, f2i_empty, f3i_empty, f4i_empty, f5i_empty, f6i_empty : STD_LOGIC := '0';
     SIGNAL f1o_wr_en, f2o_wr_en, f3o_wr_en, f4o_wr_en, f5o_wr_en, f6o_wr_en : STD_LOGIC := '0';
     SIGNAL f1o_wr_data, f2o_wr_data, f3o_wr_data, f4o_wr_data, f5o_wr_data, f6o_wr_data : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
     SIGNAL f1o_full, f2o_full, f3o_full, f4o_full, f5o_full, f6o_full : STD_LOGIC := '0';
     SIGNAL f1i_rd_en_fifo, f2i_rd_en_fifo, f3i_rd_en_fifo, f4i_rd_en_fifo, f5i_rd_en_fifo, f6i_rd_en_fifo : STD_LOGIC := '0';
     SIGNAL f1i_rd_data_fifo, f2i_rd_data_fifo, f3i_rd_data_fifo, f4i_rd_data_fifo, f5i_rd_data_fifo, f6i_rd_data_fifo : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
     SIGNAL f1i_empty_fifo, f2i_empty_fifo, f3i_empty_fifo, f4i_empty_fifo, f5i_empty_fifo, f6i_empty_fifo : STD_LOGIC := '0';
BEGIN

     local_cpu_unit : local_cpu_u1 PORT MAP(
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
     router_unit : router PORT MAP(
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

     f1i : fifo_32b PORT MAP(
          i_rst_sync => rst,
          i_clk => clk,
          i_wr_en => f1i_wr_en_fifo,
          i_wr_data => f1i_wr_data_fifo,
          o_full => f1i_full_fifo,
          i_rd_en => f1i_rd_en_fifo,
          o_rd_data => f1i_rd_data_fifo,
          o_empty => f1i_empty_fifo
     );

     f2i : fifo_32b PORT MAP(
          i_rst_sync => rst,
          i_clk => clk,
          i_wr_en => f2i_wr_en_fifo,
          i_wr_data => f2i_wr_data_fifo,
          o_full => f2i_full_fifo,
          i_rd_en => f2i_rd_en_fifo,
          o_rd_data => f2i_rd_data_fifo,
          o_empty => f2i_empty_fifo
     );

     f3i : fifo_32b PORT MAP(
          i_rst_sync => rst,
          i_clk => clk,
          i_wr_en => f3i_wr_en_fifo,
          i_wr_data => f3i_wr_data_fifo,
          o_full => f3i_full_fifo,
          i_rd_en => f3i_rd_en_fifo,
          o_rd_data => f3i_rd_data_fifo,
          o_empty => f3i_empty_fifo
     );

     f4i : fifo_32b PORT MAP(
          i_rst_sync => rst,
          i_clk => clk,
          i_wr_en => f4i_wr_en_fifo,
          i_wr_data => f4i_wr_data_fifo,
          o_full => f4i_full_fifo,
          i_rd_en => f4i_rd_en_fifo,
          o_rd_data => f4i_rd_data_fifo,
          o_empty => f4i_empty_fifo
     );

     f5i : fifo_32b PORT MAP(
          i_rst_sync => rst,
          i_clk => clk,
          i_wr_en => f5i_wr_en_fifo,
          i_wr_data => f5i_wr_data_fifo,
          o_full => f5i_full_fifo,
          i_rd_en => f5i_rd_en_fifo,
          o_rd_data => f5i_rd_data_fifo,
          o_empty => f5i_empty_fifo
     );

     f6i : fifo_32b PORT MAP(
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
     f1i_rd_en_fifo <= f1i_rd_en; -- out
     f1i_rd_data <= f1i_rd_data_fifo; -- in
     f1i_empty <= f1i_empty_fifo; -- in
     --- writing on fifo adjecent to this module
     f1o_wr_en_fifo <= f1o_wr_en; -- out
     f1o_wr_data_fifo <= f1o_wr_data; -- out
     f1o_full <= f1o_full_fifo; -- in

     ---- f2
     ---  read for fifo inside this module
     f2i_rd_en_fifo <= f2i_rd_en; -- out
     f2i_rd_data <= f2i_rd_data_fifo; -- in
     f2i_empty <= f2i_empty_fifo; -- in
     --- writing on fifo adjecent to this module
     f2o_wr_en_fifo <= f2o_wr_en; -- out
     f2o_wr_data_fifo <= f2o_wr_data; -- out
     f2o_full <= f2o_full_fifo; -- in

     ---- f3
     ---  read for fifo inside this module
     f3i_rd_en_fifo <= f3i_rd_en; -- out
     f3i_rd_data <= f3i_rd_data_fifo; -- in
     f3i_empty <= f3i_empty_fifo; -- in
     --- writing on fifo adjecent to this module
     f3o_wr_en_fifo <= f3o_wr_en; -- out
     f3o_wr_data_fifo <= f3o_wr_data; -- out
     f3o_full <= f3o_full_fifo; -- in

     ---- f4
     ---  read for fifo inside this module
     f4i_rd_en_fifo <= f4i_rd_en; -- out
     f4i_rd_data <= f4i_rd_data_fifo; -- in
     f4i_empty <= f4i_empty_fifo; -- in
     --- writing on fifo adjecent to this module
     f4o_wr_en_fifo <= f4o_wr_en; -- out
     f4o_wr_data_fifo <= f4o_wr_data; -- out
     f4o_full <= f4o_full_fifo; -- in

     ---- f5
     ---  read for fifo inside this module
     f5i_rd_en_fifo <= f5i_rd_en; -- out
     f5i_rd_data <= f5i_rd_data_fifo; -- in
     f5i_empty <= f5i_empty_fifo; -- in
     --- writing on fifo adjecent to this module
     f5o_wr_en_fifo <= f5o_wr_en; -- out
     f5o_wr_data_fifo <= f5o_wr_data; -- out
     f5o_full <= f5o_full_fifo; -- in

     ---- f6
     ---  read for fifo inside this module
     f6i_rd_en_fifo <= f6i_rd_en; -- out
     f6i_rd_data <= f6i_rd_data_fifo; -- in
     f6i_empty <= f6i_empty_fifo; -- in
     --- writing on fifo adjecent to this module
     f6o_wr_en_fifo <= f6o_wr_en; -- out
     f6o_wr_data_fifo <= f6o_wr_data; -- out
     f6o_full <= f6o_full_fifo; -- in

END Behavioral;