ARCHITECTURE test OF IND_tester IS
BEGIN

  -- truth table, LSB toggles at 10 ns


--  ------------------------------------------------------------------------------
--  -- Chronogram with random signal order (but with glitch anyway)
--  --
--  unmarried  <= '0',
--                '1' after  10 ns, 
--                '0' after  20 ns, 
--                '1' after  30 ns, 
--                '0' after  40 ns, 
--                '1' after  50 ns, 
--                '0' after  60 ns, 
--                '1' after  70 ns, 
--                '0' after  80 ns, 
--                '1' after  90 ns, 
--                '0' after 100 ns, 
--                '1' after 110 ns, 
--                '0' after 120 ns, 
--                '1' after 130 ns, 
--                '0' after 140 ns, 
--                '1' after 150 ns;
--
--  moreThan25 <= '0',
--                '1' after  20 ns, 
--                '0' after  40 ns, 
--                '1' after  60 ns, 
--                '0' after  80 ns, 
--                '1' after 100 ns, 
--                '0' after 120 ns, 
--                '1' after 140 ns;
--
--  man        <= '0',
--                '1' after  40 ns, 
--                '0' after  80 ns, 
--                '1' after 120 ns;
--
--  swiss      <= '0',
--                '1' after  80 ns;

  ------------------------------------------------------------------------------
  -- Chronogram with "unmarried" as MSB
  --
  moreThan25 <= '0',
                '1' after  10 ns, 
                '0' after  20 ns, 
                '1' after  30 ns, 
                '0' after  40 ns, 
                '1' after  50 ns, 
                '0' after  60 ns, 
                '1' after  70 ns, 
                '0' after  80 ns, 
                '1' after  90 ns, 
                '0' after 100 ns, 
                '1' after 110 ns, 
                '0' after 120 ns, 
                '1' after 130 ns, 
                '0' after 140 ns, 
                '1' after 150 ns;

  swiss      <= '0',
                '1' after  20 ns, 
                '0' after  40 ns, 
                '1' after  60 ns, 
                '0' after  80 ns, 
                '1' after 100 ns, 
                '0' after 120 ns, 
                '1' after 140 ns;

  man        <= '0',
                '1' after  40 ns, 
                '0' after  80 ns, 
                '1' after 120 ns;

  unmarried  <= '0',
                '1' after  80 ns;

END ARCHITECTURE test;
