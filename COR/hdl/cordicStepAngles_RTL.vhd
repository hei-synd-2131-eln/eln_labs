library ieee;
  use ieee.math_real.all;

ARCHITECTURE masterVersion OF cordicStepAngles IS

  constant iterationNb: positive := 10;
  subtype phaseType is signed(phaseBitNb-1 downto 0);
  type phaseArrayType is array (0 to iterationNb-1) of phaseType;

  function initPhaseArray return phaseArrayType is
    variable phaseIncrement: phaseArrayType;
  begin
    for index in phaseIncrement'range loop
      phaseIncrement(index) := to_signed(integer( arctan(1.0/2.0**index) / math_pi * 2.0**(phaseBitNb-1) ), phaseType'length);
    end loop;
    return phaseIncrement;
  end initPhaseArray;

  constant phaseIncrement: phaseArrayType := initPhaseArray;

BEGIN

  stepAngle0 <= phaseIncrement(0);
  stepAngle1 <= phaseIncrement(1);
  stepAngle2 <= phaseIncrement(2);
  stepAngle3 <= phaseIncrement(3);
  stepAngle4 <= phaseIncrement(4);
  stepAngle5 <= phaseIncrement(5);
  stepAngle6 <= phaseIncrement(6);
  stepAngle7 <= phaseIncrement(7);
  stepAngle8 <= phaseIncrement(8);
  stepAngle9 <= phaseIncrement(9);

END ARCHITECTURE masterVersion;
