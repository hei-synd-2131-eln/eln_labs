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
      case quadrant is
        when 0 =>
          assert cosine = resize(signed(x), cosine'length)
            report "error on cosine in 1st quadrant"
            severity error;
          assert sine = resize(signed(y), sine'length)
            report "error on sine in 1st quadrant"
            severity error;
        when others => null;
      end case;
      wait for operatorDelay;
    end loop;
    wait;
  end process testAll;

END ARCHITECTURE test;
