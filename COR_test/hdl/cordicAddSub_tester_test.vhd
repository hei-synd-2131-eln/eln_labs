ARCHITECTURE test OF cordicAddSub_tester IS

  constant operatorDelay: time := 10 ns;

  constant phaseMin: integer := -2**(phaseBitNb-1);
  constant phaseMax: integer := 2**(phaseBitNb-1)-1;
  constant amplitudeMin: integer := 0;
  constant amplitudeMax: integer := 2**(sineBitNb-1)-1;
  signal add_sub: std_ulogic;
  signal phaseIn_int, stepAngle_int: signed(phaseIn'range);
  signal xIn_int, xInShifted_int, yIn_int, yInShifted_int: unsigned(xIn'range) := (others => '0');

BEGIN

  testAll: process
  begin
    for phaseIndex in phaseMin to phaseMax loop
      phaseIn_int <= to_signed(phaseIndex, phaseIn'length);
      if phaseIndex >= 0 then
        add_sub <= '1';
      else
        add_sub <= '0';
      end if;
                                    -- test angle incrementation / decrementation
      for atanIndex in phaseMin to phaseMax loop
        stepAngle_int <= to_signed(atanIndex, stepAngle'length);
        wait for operatorDelay*9/10;
        if add_sub = '1' then
          assert phaseOut = phaseIn_int - stepAngle_int
            report "phase update wrong"
            severity error;
        else
          assert phaseOut = phaseIn_int + stepAngle_int
            report "phase update wrong"
            severity error;
        end if;
        wait for operatorDelay/10;
      end loop;
      if abs(phaseIndex) = 1 then
                      -- test x- and y-coordinate incrementation / decrementation
        for amplitudeIndex in amplitudeMin to amplitudeMax loop
          xIn_int <= to_unsigned(amplitudeIndex, xIn_int'length);
          yIn_int <= to_unsigned(amplitudeIndex, yIn_int'length);
          for shiftedIndex in amplitudeMin to amplitudeMax loop
            xInShifted_int <= to_unsigned(shiftedIndex, xInShifted_int'length);
            yInShifted_int <= to_unsigned(shiftedIndex, yInShifted_int'length);
            wait for operatorDelay*9/10;
            if add_sub = '1' then
              assert xOut = xIn_int - yInShifted_int
                report "real part update wrong"
                severity error;
              assert yOut = yIn_int + xInShifted_int
                report "imaginary part update wrong"
                severity error;
            else
              assert xOut = xIn_int + yInShifted_int
                report "real part update wrong"
                severity error;
              assert yOut = yIn_int - xInShifted_int
                report "imaginary part update wrong"
                severity error;
            end if;
            wait for operatorDelay/10;
          end loop;
        end loop;
      end if;
    end loop;

    ----------------------------------------------------------------------------
                                                              -- stop simulation
    wait for 6.01 ms - now;
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
  end process;

  phaseIn <= phaseIn_int;
  stepAngle <= stepAngle_int;
  xIn <= xIn_int;
  xInShifted <= xInShifted_int;
  yIn <= xIn_int;
  yInShifted <= xInShifted_int;

END ARCHITECTURE test;
