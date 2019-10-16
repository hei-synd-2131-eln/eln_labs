ARCHITECTURE masterVersion OF phaseCalculator IS
BEGIN
  ------------------------------------------------------------------------------
  -- calculate phase difference from phase counter
  --
  modifyForNegative: process(phaseCount, period)
  begin
    if phaseCount <= period/2 then
                                    -- change sign for small counts (phase lead)
      phaseDiff <= -resize(signed(phaseCount), phaseDiff'length) - 1;
    else
                           -- substract from period for large counts (phase lag)
      phaseDiff <= resize(signed(period - phaseCount), phaseDiff'length);
    end if;
  end process modifyForNegative;

END ARCHITECTURE masterVersion;
