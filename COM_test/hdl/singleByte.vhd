ARCHITECTURE singleByte OF rom IS

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

  subtype memoryWordType is std_ulogic_vector(dataOut'range);
  type memoryArrayType is array (0 to 2**address'length-1) of memoryWordType;

  signal memoryArray : memoryArrayType := (
    -- line idle
    16#00# => opLoadC   & "0011" & "11111111",         -- load    s3 FF
    16#01# => opOutputC & "0011" & "00000000",         -- output  s3
    16#02# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    16#03# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    16#04# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    16#05# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    16#06# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    16#07# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    16#08# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    16#09# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    16#0A# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    16#0B# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    16#0C# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    16#0D# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    16#0E# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    16#0F# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    -- start bit
    16#10# => opLoadC   & "0000" & "00000000",         -- load    s0 00
    16#11# => opOutputC & "0000" & "00000000",         -- output  s0
    -- data bits
    16#12# => opInputC  & "0001" & "00000000",         -- input   s1
    16#13# => opOutputC & "0001" & "00000000",         -- output  s1
    16#14# => opShRot   & "0001" & shRotR & shRotLd0,  -- sr0     s1
    16#15# => opOutputC & "0001" & "00000000",         -- output  s1
    16#16# => opShRot   & "0001" & shRotR & shRotLd0,  -- sr0     s1
    16#17# => opOutputC & "0001" & "00000000",         -- output  s1
    16#18# => opShRot   & "0001" & shRotR & shRotLd0,  -- sr0     s1
    16#19# => opOutputC & "0001" & "00000000",         -- output  s1
    16#1A# => opShRot   & "0001" & shRotR & shRotLd0,  -- sr0     s1
    16#1B# => opOutputC & "0001" & "00000000",         -- output  s1
    16#1C# => opShRot   & "0001" & shRotR & shRotLd0,  -- sr0     s1
    16#1D# => opOutputC & "0001" & "00000000",         -- output  s1
    16#1E# => opShRot   & "0001" & shRotR & shRotLd0,  -- sr0     s1
    16#1F# => opOutputC & "0001" & "00000000",         -- output  s1
    16#20# => opShRot   & "0001" & shRotR & shRotLd0,  -- sr0     s1
    16#21# => opOutputC & "0001" & "00000000",         -- output  s1
    -- stop bit
    16#22# => opLoadR   & "0011" & "0011" & "0000",    -- load    s3 s3
    16#23# => opOutputC & "0011" & "00000000",         -- output  s3
    others => (others => '0')
  );

BEGIN

  process (en, address)
  begin
    if en = '1' then
      dataOut <= memoryArray(to_integer(address));
    else
      dataOut <= (others => 'Z');
    end if;
  end process;

END ARCHITECTURE singleByte;
