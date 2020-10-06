ARCHITECTURE test OF sub8_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0 / clockFrequency * 1 sec;

BEGIN

  test: PROCESS
  BEGIN
                                                                    -- loop on a
    for a_int in 0 to 15 loop
      a   <=to_unsigned(a_int, a'length);
                                                                  -- loop on cIn
      for cIn_int in 0 to 1 loop
        if cIn_int = 0 then
          cIn <= '0';
        else
          cIn <= '1';
        end if;
                                                                    -- loop on b
        for b_int in 0 to 15 loop
          b   <= to_unsigned(b_int, b'length);
                                                                  -- test result
          WAIT FOR clockPeriod;
          if cIn_int = 0 then
            assert (to_integer(signed(s)) = a_int-b_int)
              report
                "test for " &
                "a = " & integer'image(a_int) & " " &
                "b = " & integer'image(b_int) & " " &
                "cIn = '" & integer'image(cIn_int) & "' " &
                "wrong"
              severity error;
          else
            assert (to_integer(signed(s)) = a_int-b_int-1)
              report
                "test for " &
                "a = " & integer'image(a_int) & " " &
                "b = " & integer'image(b_int) & " " &
                "cIn = '" & integer'image(cIn_int) & "' " &
                "wrong"
              severity error;
          end if;
        end loop;
      end loop;
    end loop;

    WAIT;
  END PROCESS test;

END ARCHITECTURE test;
