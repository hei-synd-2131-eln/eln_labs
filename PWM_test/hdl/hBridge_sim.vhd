ARCHITECTURE sim OF hBridge IS

  signal amplitude1, amplitude2, amplitudeDiff : real := 0.0;
  signal current_int : real := 0.0;

  constant samplingFrequency : real := 100.0E6;
  constant sampligPeriod : time := 1.0 / samplingFrequency * 1 sec;
  signal samplingClock : std_ulogic := '1';
  signal amplitudeAccumulator, amplitudeFiltered : real := 0.0;
  signal currentAccumulator, currentFiltered : real := 0.0;

BEGIN
  ------------------------------------------------------------------------------
  -- side 1
  --
  process(pwm1, pwm1_n)
  begin
    case std_ulogic_vector'(pwm1 & pwm1_n) is
      when "00" => amplitude1 <= -0.1;
      when "01" => amplitude1 <= 0.0;
      when "10" => amplitude1 <= 1.0;
      when "11" => amplitude1 <= 1.1;
      when others => amplitude1 <= 2.0;
    end case;
  end process;

  ------------------------------------------------------------------------------
  -- side 2
  --
  process(pwm2, pwm2_n)
  begin
    case std_ulogic_vector'(pwm2 & pwm2_n) is
      when "00" => amplitude2 <= -0.1;
      when "01" => amplitude2 <= 0.0;
      when "10" => amplitude2 <= 1.0;
      when "11" => amplitude2 <= 1.1;
      when others => amplitude2 <= 2.0;
    end case;
  end process;

  ------------------------------------------------------------------------------
  -- current
  --
  process(pwm1, pwm1_n, pwm2, pwm2_n)
  begin
    current_int <= 0.0;
    if std_ulogic_vector'(pwm1 & pwm2_n) = "11" then
      current_int <= 1.0;
    elsif std_ulogic_vector'(pwm2 & pwm1_n) = "11" then
      current_int <= -1.0;
    end if;
  end process;

  current <= (Vp-Vm)/resistance * current_int;

  ------------------------------------------------------------------------------
  -- switched output
  --
  amplitudeDiff <= amplitude1 - amplitude2;
  amplitude <= (Vp+Vm) / 2.0 + (Vp-Vm) / 2.0 * amplitudeDiff;

  ------------------------------------------------------------------------------
  -- filtered output
  --
  samplingClock <= not samplingClock after sampligPeriod/2;
                                                         -- sampled accumulators
  amplitudeAccumulator <= amplitudeAccumulator + amplitudeDiff - amplitudeFiltered
    when rising_edge(samplingClock);
  currentAccumulator <= currentAccumulator + current_int - currentFiltered
    when rising_edge(samplingClock);
                                                      -- effect of time constant
  amplitudeFiltered <= amplitudeAccumulator / timeConstant;
  currentFiltered <= currentAccumulator / timeConstant;
                                                             -- filtered outputs
  meanAmplitude <= (Vp+Vm) / 2.0 + (Vp-Vm) / 2.0 * amplitudeFiltered;
  meanCurrent <= (Vp-Vm)/resistance * currentFiltered;

END ARCHITECTURE sim;
