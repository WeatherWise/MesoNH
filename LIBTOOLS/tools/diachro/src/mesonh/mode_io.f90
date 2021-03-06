FUNCTION UPCASE(HSTRING)
CHARACTER(LEN=*)            :: HSTRING
CHARACTER(LEN=LEN(HSTRING)) :: UPCASE

INTEGER :: JC
INTEGER, PARAMETER :: IAMIN = IACHAR("a")
INTEGER, PARAMETER :: IAMAJ = IACHAR("A")

DO JC=1,LEN(HSTRING)
  IF (HSTRING(JC:JC) >= "a" .AND. HSTRING(JC:JC) <= "z") THEN
    UPCASE(JC:JC) = ACHAR(IACHAR(HSTRING(JC:JC)) - IAMIN + IAMAJ)
  ELSE
    UPCASE(JC:JC) = HSTRING(JC:JC)
  END IF
END DO

END FUNCTION UPCASE
