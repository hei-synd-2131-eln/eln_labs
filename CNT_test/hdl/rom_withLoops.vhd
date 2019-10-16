ARCHITECTURE withLoops OF rom IS

  subtype opCodeType is std_ulogic_vector(5 downto 0);
  constant opLoadC   : opCodeType := "000000";
  constant opLoadR   : opCodeType := "000001";
  constant opInputC  : opCodeType := "000100";
  constant opInputR  : opCodeType := "000101";
  constant opFetchC  : opCodeType := "000110";
  constant opFetchR  : opCodeType := "000111";
  constant opAndC    : opCodeType := "001010";
  constant opAndR    : opCodeType := "001011";
  constant opOrC     : opCodeType := "001100";
  constant opOrR     : opCodeType := "001101";
  constant opXorC    : opCodeType := "001110";
  constant opXorR    : opCodeType := "001111";
  constant opTestC   : opCodeType := "010010";
  constant opTestR   : opCodeType := "010011";
  constant opCompC   : opCodeType := "010100";
  constant opCompR   : opCodeType := "010101";
  constant opAddC    : opCodeType := "011000";
  constant opAddR    : opCodeType := "011001";
  constant opAddCyC  : opCodeType := "011010";
  constant opAddCyR  : opCodeType := "011011";
  constant opSubC    : opCodeType := "011100";
  constant opSubR    : opCodeType := "011101";
  constant opSubCyC  : opCodeType := "011110";
  constant opSubCyR  : opCodeType := "011111";
  constant opShRot   : opCodeType := "100000";
  constant opOutputC : opCodeType := "101100";
  constant opOutputR : opCodeType := "101101";
  constant opStoreC  : opCodeType := "101110";
  constant opStoreR  : opCodeType := "101111";

  subtype shRotDirType is std_ulogic_vector(4 downto 0);
  constant shRotL : shRotDirType := "----0";
  constant shRotR : shRotDirType := "----1";

  subtype shRotCinType is std_ulogic_vector(2 downto 0);
  constant shRotLdC : shRotCinType := "00-";
  constant shRotLdM : shRotCinType := "01-";
  constant shRotLdL : shRotCinType := "10-";
  constant shRotLd0 : shRotCinType := "110";
  constant shRotLd1 : shRotCinType := "111";

  subtype branchCodeType is std_ulogic_vector(4 downto 0);
  constant brRet  : branchCodeType := "10101";
  constant brCall : branchCodeType := "11000";
  constant brJump : branchCodeType := "11010";
  constant brReti : branchCodeType := "11100";
  constant brEni  : branchCodeType := "11110";

  subtype branchConditionType is std_ulogic_vector(2 downto 0);
  constant brDo : branchConditionType := "000";
  constant brZ  : branchConditionType := "100";
  constant brNZ : branchConditionType := "101";
  constant brC  : branchConditionType := "110";
  constant brNC : branchConditionType := "111";

  subtype memoryWordType is std_ulogic_vector(dataOut'range);
  type memoryArrayType is array (0 to 2**address'length-1) of memoryWordType;

  signal memoryArray : memoryArrayType := (
    -- line idle
    16#00# => opLoadC   & "0011" & "11111111",         -- load    s3 FF
    16#01# => opOutputC & "0011" & "00000000",         -- output  s3
    16#02# => opLoadC   & "0010" & "00001000",         -- load    s2 08
    16#03# => opSubC    & "0010" & "00000001",         -- sub     s2 01
    16#04# => brJump    & brNZ   & "0000000011",       -- jump nz 03      ; loop back
    -- start bit
    16#05# => opLoadC   & "0000" & "00000000",         -- load    s0 00
    16#06# => opOutputC & "0000" & "00000000",         -- output  s0
    -- data bits
    16#07# => opLoadC   & "0010" & "00001000",         -- load    s2 08
    16#08# => opInputC  & "0001" & "00000000",         -- input   s1
    16#09# => opLoadR   & "0011" & "0011" & "0011",    -- load    s3 s3
    16#0A# => opOutputC & "0001" & "00000000",         -- output  s1
    16#0B# => opShRot   & "0001" & shRotR & shRotLd0,  -- sr0     s1
    16#0C# => opSubC    & "0010" & "00000001",         -- sub     s2 01
    16#0D# => brJump    & brNZ   & "0000001010",       -- jump nz 0A      ; loop back
    -- stop bit
    16#0E# => opOutputC & "0011" & "00000000",         -- output  s3
    others => (others => '0')
  );

  signal en: std_ulogic;

BEGIN

  en <= OE and CS;

  process (en, address)
  begin
    if en = '1' then
      dataOut <= memoryArray(to_integer(address));
    else
      dataOut <= (others => 'Z');
    end if;
  end process;

END ARCHITECTURE withLoops;
