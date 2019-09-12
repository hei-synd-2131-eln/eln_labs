ARCHITECTURE masterVersion OF cordicQuadrants IS

BEGIN

  playSymmetries: process(phaseHigh, x, y)
  begin
    case phaseHigh is
      when "00" =>
        sine   <=  signed(resize(y, sine'length));
        cosine <=  signed(resize(x, sine'length));
      when "01" =>
        sine   <=  signed(resize(x, sine'length));
        cosine <= -signed(resize(y, sine'length));
      when "10" =>
        sine   <= -signed(resize(y, sine'length));
        cosine <= -signed(resize(x, sine'length));
      when "11" =>
        sine   <= -signed(resize(x, sine'length));
        cosine <=  signed(resize(y, sine'length));
      when others =>
        sine <= (others => '0');
        cosine <= (others => '0');
    end case;
  end process playSymmetries;

END ARCHITECTURE masterVersion;
