ARCHITECTURE test OF cordicQuadrants_tester IS

  constant operatorDelay: time := 10 ns;
  constant testX: integer := 2**(x'length-2) + 2**(x'length-3);
  constant testY: integer := 2**(x'length-2);

BEGIN

  x <= to_unsigned(testX, x'length);
  y <= to_unsigned(testY, y'length);

  testAll: process
  begin
    phaseHigh <= (others => '0');
    wait for operatorDelay;
    for quadrant in 0 to 2**phaseHigh'length-1 loop
      phaseHigh <= to_unsigned(quadrant, phaseHigh'length);
      wait for operatorDelay;
      case quadrant is
                                                                   -- quadrant 00
        when 0 =>
          assert cosine = resize(        signed(x), cosine'length)
            report "error on cosine in 1st quadrant"
            severity error;
          assert   sine = resize(        signed(y),   sine'length)
            report "error on sine in 1st quadrant"
            severity error;
                                                                   -- quadrant 01
        when 1 =>
          assert cosine = resize(       -signed(y), cosine'length)
            report "error on cosine in 2nd quadrant"
            severity error;
          assert   sine = resize(        signed(x),   sine'length)
            report "error on sine in 2nd quadrant"
            severity error;
                                                                   -- quadrant 10
        when 2 =>
          assert cosine = resize(       -signed(x), cosine'length)
            report "error on cosine in 3rd quadrant"
            severity error;
          assert   sine = resize(       -signed(y),   sine'length)
            report "error on sine in 3rd quadrant"
            severity error;
                                                                   -- quadrant 11
        when 3 =>
          assert cosine = resize(        signed(y), cosine'length)
            report "error on cosine in 4th quadrant"
            severity error;
          assert   sine = resize(       -signed(x),   sine'length)
            report "error on sine in 4th quadrant"
            severity error;
        when others => null;
      end case;
    end loop;

    ----------------------------------------------------------------------------
                                                              -- stop simulation
    wait for 71 ns - now;
    assert false
      report cr &
             "----------------------------------------" &
             "----------------------------------------" &
             "----------------------------------------" &
             cr &
             "End of tests." &
             cr & cr
      severity failure;
    wait;
  end process testAll;

END ARCHITECTURE test;
