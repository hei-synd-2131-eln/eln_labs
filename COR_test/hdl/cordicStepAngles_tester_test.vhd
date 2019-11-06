library ieee;
  use ieee.math_real.all;

ARCHITECTURE test OF cordicStepAngles_tester IS

  constant angleNb : positive := 10;
  subtype angleType is signed(phaseBitNb-1 downto 0);
  type angleArrayType is array(0 to 9) of angleType;

  function initPhaseArray return angleArrayType is
    variable phaseIncrement: angleArrayType;
  begin
    for index in phaseIncrement'range loop
      phaseIncrement(index) := to_signed(
        integer( arctan(1.0/2.0**index) / math_pi * 2.0**(phaseBitNb-1) ),
        angleType'length
      );
    end loop;
    return phaseIncrement;
  end initPhaseArray;

  constant phaseStepMaster: angleArrayType := initPhaseArray;
  signal phaseStepStudent : angleArrayType;

BEGIN

  phaseStepStudent(0) <= stepAngle0;
  phaseStepStudent(1) <= stepAngle1;
  phaseStepStudent(2) <= stepAngle2;
  phaseStepStudent(3) <= stepAngle3;
  phaseStepStudent(4) <= stepAngle4;
  phaseStepStudent(5) <= stepAngle5;
  phaseStepStudent(6) <= stepAngle6;
  phaseStepStudent(7) <= stepAngle7;
  phaseStepStudent(8) <= stepAngle8;
  phaseStepStudent(9) <= stepAngle9;

  testAngles: process
  begin
    wait for 1 ns;
                                                             -- test first angle
    assert phaseStepStudent(0) = 2**(phaseBitNb-3)
      report "Bad start : the first step should corresponf to 45 degrees"
      severity error;
    wait for 1 ns;
                                                 -- test angles with margin of 1
    for index in 1 to angleNb-1 loop
      assert abs(phaseStepMaster(index)-phaseStepStudent(index)) <= 1
        report "We do not agree on the phase steps"
        severity error;
    end loop;
    wait for 1 ns;
                                                          -- test angles exactly
    for index in 1 to angleNb-1 loop
      assert phaseStepStudent(index) = phaseStepMaster(index)
        report "We do not agree on the rounding of the values"
        severity error;
    end loop;
    ----------------------------------------------------------------------------
                                                              -- stop simulation
    wait for 11 ns - now;
    assert false
      report cr &
             "----------------------------------------" &
             "----------------------------------------" &
             "----------------------------------------" &
             cr &
             "End of tests." &
             cr & cr
      severity failure;
    wait;  end process testAngles;

END ARCHITECTURE test;
