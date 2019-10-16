ARCHITECTURE masterVersion OF cordicAddSub IS

  signal add_sub: std_ulogic;

BEGIN

  add_sub <= not phaseIn(phaseIn'high);

  addAndSubstract: process(
    add_sub,
    xIn, xInShifted,
    yIn, yInShifted,
    phaseIn, stepAngle
  )
  begin
    if add_sub = '1' then
      xOut     <=     xIn - yInShifted;
      yOut     <=     yIn + xInShifted;
      phaseOut <= phaseIn - stepAngle;
    else
      xOut     <=     xIn + yInShifted;
      yOut     <=     yIn - xInShifted;
      phaseOut <= phaseIn + stepAngle;
    end if;
  end process addAndSubstract;

END ARCHITECTURE masterVersion;
