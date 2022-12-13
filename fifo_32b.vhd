----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:31:08 06/09/2018 
-- Design Name: 
-- Module Name:    fifo_32b - Behavioral 
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
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY fifo_32b IS
  GENERIC (
    g_WIDTH : NATURAL := 32;
    g_DEPTH : INTEGER := 8
  );
  PORT (
    i_rst_sync : IN STD_LOGIC;
    i_clk : IN STD_LOGIC;

    -- FIFO Write Interface
    i_wr_en : IN STD_LOGIC;
    i_wr_data : IN STD_LOGIC_VECTOR(g_WIDTH - 1 DOWNTO 0);
    o_full : OUT STD_LOGIC;

    -- FIFO Read Interface
    i_rd_en : IN STD_LOGIC;
    o_rd_data : OUT STD_LOGIC_VECTOR(g_WIDTH - 1 DOWNTO 0);
    o_empty : OUT STD_LOGIC
  );
END fifo_32b;

ARCHITECTURE rtl OF fifo_32b IS

  TYPE t_FIFO_DATA IS ARRAY (0 TO g_DEPTH - 1) OF STD_LOGIC_VECTOR(g_WIDTH - 1 DOWNTO 0);
  SIGNAL r_FIFO_DATA : t_FIFO_DATA := (OTHERS => (OTHERS => '0'));

  SIGNAL r_WR_INDEX : INTEGER RANGE 0 TO g_DEPTH - 1 := 0;
  SIGNAL r_RD_INDEX : INTEGER RANGE 0 TO g_DEPTH - 1 := 0;

  -- # Words in FIFO, has extra range to allow for assert conditions
  SIGNAL r_FIFO_COUNT : INTEGER RANGE -1 TO g_DEPTH + 1 := 0;

  SIGNAL w_FULL : STD_LOGIC;
  SIGNAL w_EMPTY : STD_LOGIC;

BEGIN

  p_CONTROL : PROCESS (i_clk) IS
  BEGIN
    IF rising_edge(i_clk) THEN
      IF i_rst_sync = '1' THEN
        r_FIFO_COUNT <= 0;
        r_WR_INDEX <= 0;
        r_RD_INDEX <= 0;
      ELSE

        -- Keeps track of the total number of words in the FIFO
        IF (i_wr_en = '1' AND i_rd_en = '0') THEN
          r_FIFO_COUNT <= r_FIFO_COUNT + 1;
        ELSIF (i_wr_en = '0' AND i_rd_en = '1') THEN
          r_FIFO_COUNT <= r_FIFO_COUNT - 1;
        END IF;

        -- Keeps track of the write index (and controls roll-over)
        IF (i_wr_en = '1' AND w_FULL = '0') THEN
          IF r_WR_INDEX = g_DEPTH - 1 THEN
            r_WR_INDEX <= 0;
          ELSE
            r_WR_INDEX <= r_WR_INDEX + 1;
          END IF;
        END IF;

        -- Keeps track of the read index (and controls roll-over)        
        IF (i_rd_en = '1' AND w_EMPTY = '0') THEN
          IF r_RD_INDEX = g_DEPTH - 1 THEN
            r_RD_INDEX <= 0;
          ELSE
            r_RD_INDEX <= r_RD_INDEX + 1;
          END IF;
        END IF;

        -- Registers the input data when there is a write
        IF i_wr_en = '1' THEN
          r_FIFO_DATA(r_WR_INDEX) <= i_wr_data;
        END IF;

      END IF; -- sync reset
    END IF; -- rising_edge(i_clk)
  END PROCESS p_CONTROL;

  o_rd_data <= r_FIFO_DATA(r_RD_INDEX);

  w_FULL <= '1' WHEN r_FIFO_COUNT = g_DEPTH ELSE
    '0';
  w_EMPTY <= '1' WHEN r_FIFO_COUNT = 0 ELSE
    '0';

  o_full <= w_FULL;
  o_empty <= w_EMPTY;

  -- ASSERTION LOGIC - Not synthesized
  -- synthesis translate_off

  p_ASSERT : PROCESS (i_clk) IS
  BEGIN
    IF rising_edge(i_clk) THEN
      IF i_wr_en = '1' AND w_FULL = '1' THEN
        REPORT "ASSERT FAILURE - MODULE_REGISTER_FIFO: FIFO IS FULL AND BEING WRITTEN " SEVERITY failure;
      END IF;

      IF i_rd_en = '1' AND w_EMPTY = '1' THEN
        REPORT "ASSERT FAILURE - MODULE_REGISTER_FIFO: FIFO IS EMPTY AND BEING READ " SEVERITY failure;
      END IF;
    END IF;
  END PROCESS p_ASSERT;

  -- synthesis translate_on
END rtl;