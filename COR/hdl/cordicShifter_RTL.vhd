ARCHITECTURE masterVersion OF cordicShifter IS

BEGIN

  xShifted <= shift_right(xIn, shiftBitNb);
  yShifted <= shift_right(yIn, shiftBitNb);

END ARCHITECTURE masterVersion;
