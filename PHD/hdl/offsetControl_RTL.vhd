ARCHITECTURE RTL OF offsetControl IS

  signal phaseIn1, oldPhaseIn1 : signed(phaseIn'high+1 downto 0);
  signal offsetAdd_int, offsetSub_int : std_ulogic;

BEGIN

  phaseIn1 <= resize(phaseIn, phaseIn1'length);
  oldPhaseIn1 <= resize(oldPhaseIn, oldPhaseIn1'length);

  offsetAdd_int <= '1' when
    oldPhaseIn1 - phaseIn1 > refPeriodSigned/2
    else '0';

  offsetSub_int <= '1' when
    phaseIn1 - oldPhaseIn1 > refPeriodSigned/2
    else '0';

  offsetAdd <= offsetAdd_int;
  offsetSub <= offsetSub_int;
  updateOffset <= (offsetAdd_int or offsetSub_int) and enable;

END ARCHITECTURE RTL;
