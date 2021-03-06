!-----------------------------------------------------------------
!--------------- special set of characters for RCS information
!-----------------------------------------------------------------
! $Source$ $Revision$
! ECMWF_RAD2 2003/02/19 13:36:50
!-----------------------------------------------------------------
MODULE OYOESW


#include "tsmbkind.h"

IMPLICIT NONE

SAVE

!     ------------------------------------------------------------------
!*    ** *YOESW* - COEFFICIENTS FOR SHORTWAVE RADIATION TRANSFER
!     ------------------------------------------------------------------

REAL_B :: APAD(6,3,7)
REAL_B :: BPAD(6,3,7)
REAL_B :: RRAY(6,6)
REAL_B :: RSUN(6)
REAL_B :: RPDH1
REAL_B :: RPDU1
REAL_B :: RPNH
REAL_B :: RPNU
REAL_B :: RSWCE(6)
REAL_B :: RSWCP(6)
REAL_B :: RTDH2O
REAL_B :: RTDUMG
REAL_B :: RTH2O
REAL_B :: RTUMG
REAL_B :: D(6,3)
REAL_B :: REXPO3(6,2,7)
INTEGER_M :: NEXPO3(6)

REAL_B :: RYFWCA(6)
REAL_B :: RYFWCB(6)
REAL_B :: RYFWCC(6)
REAL_B :: RYFWCD(6)
REAL_B :: RYFWCE(6)
REAL_B :: RYFWCF(6)

REAL_B :: REBCUA(6)
REAL_B :: REBCUB(6)
REAL_B :: REBCUC(6)
REAL_B :: REBCUD(6)
REAL_B :: REBCUE(6)
REAL_B :: REBCUF(6)
REAL_B :: REBCUG(16)
REAL_B :: REBCUH(16)
REAL_B :: REBCUI(6)
REAL_B :: REBCUJ(6)

REAL_B :: RASWCA(6)
REAL_B :: RASWCB(6)
REAL_B :: RASWCC(6)
REAL_B :: RASWCD(6)
REAL_B :: RASWCE(6)
REAL_B :: RASWCF(6)

REAL_B :: RFUETA(16,3)
REAL_B :: RFULIO(16,3)
REAL_B :: RLINLI(16,5)

REAL_B :: RFUAA0(6)
REAL_B :: RFUAA1(6)
REAL_B :: RFUBB0(6)
REAL_B :: RFUBB1(6)
REAL_B :: RFUBB2(6)
REAL_B :: RFUBB3(6)
REAL_B :: RFUCC0(6)
REAL_B :: RFUCC1(6)
REAL_B :: RFUCC2(6)
REAL_B :: RFUCC3(6)

REAL_B :: RFLAA0(6)
REAL_B :: RFLAA1(6)
REAL_B :: RFLBB0(6)
REAL_B :: RFLBB1(6)
REAL_B :: RFLBB2(6)
REAL_B :: RFLBB3(6)
REAL_B :: RFLCC0(6)
REAL_B :: RFLCC1(6)
REAL_B :: RFLCC2(6)
REAL_B :: RFLCC3(6)
REAL_B :: RFLDD0(6)
REAL_B :: RFLDD1(6)
REAL_B :: RFLDD2(6)
REAL_B :: RFLDD3(6)

REAL_B :: RHSAVI(16,3)

REAL_B :: RSUSHE(6)
REAL_B :: RSUSHF(6)
REAL_B :: RSUSHH(6)
REAL_B :: RSUSHK(6)
REAL_B :: RSUSHA(6)
REAL_B :: RSUSHG(6)
REAL_B :: RSUSHFA(4)
REAL_B :: RSUSHC
REAL_B :: RSUSHD

REAL_B :: REFFIA
REAL_B :: REFFIB
REAL_B :: RTIW
REAL_B :: RRIW
REAL_B :: RROMA(6)
REAL_B :: RROMB(6)
REAL_B :: RRASY(6)

REAL_B :: RHSRA(6)
REAL_B :: RHSRB(6)
REAL_B :: RHSRC(6)
REAL_B :: RHSRD(6)
REAL_B :: RHSRE(6)
REAL_B :: RHSRF(6)
REAL_B :: RHSRTA
REAL_B :: RHSRTB

REAL_B :: RTAUA(6,6)
REAL_B :: RPIZA(6,6)
REAL_B :: RCGA(6,6)
REAL_B :: RAER(6,6)

REAL_B :: RALBICE_AR(12,6)
REAL_B :: RALBICE_AN(12,6)
REAL_B :: RTWEIGHT(8)
REAL_B :: RWEIGHT(6,8)
INTEGER_M :: NTYPS
REAL_B :: RWEIGS(6)
REAL_B :: RWEIGV(6)

REAL_B :: RADJUST

LOGICAL LO3ONLY


!        * E.C.M.W.F. PHYSICS PACKAGE *

!     J.-J. MORCRETTE       E.C.M.W.F.      89/07/14

!  NAME     TYPE     PURPOSE
!  ----  :  ----   : ---------------------------------------------------
!  APAD  :  REAL     PADE APPROXIMANTS NUMERATOR
!  BPAD  :  REAL     PADE APPROXIMANTS DENOMINATOR
!  D     :  REAL     TRANSMISSION LIMIT FOR INFINITE ABSORBER AMOUNT
!  RRAY  :  REAL     RAYLEIGH SCATTERING COEFFICIENTS
!  RSUN  :  REAL     SOLAR FRACTION IN SPECTRAL INTERVALS
!  RPDH1 :  1 + EXPONENT PRESSURE DEPENDENCE H2O
!  RPDU1 :  1 + EXPONENT PRESSURE DEPENDENCE UNIFORMLY MIXED GASES
!  RPNH  :  REFERENCE PRESSURE FACTOR FOR H2O
!  RPNU  :  REFERENCE PRESSURE FACTOR FOR UNIFORMLY MIXED GASES
!  RSWCE :  E-TYPE, H2O CONTINUUM ABSORPTION COEFFICIENT 
!  RSWCP :  P-TYPE, H2O CONTINUUM ABSORPTION COEFFICIENT 
!  RTDH2O:  EXPONENT TEMPERATURE DEPENDENCE H2O
!  RTDUMG:  EXPONENT TEMPERATURE DEPENDENCE UNIFORMLY MIXED GASES
!  RTH2O :  REFERENCE TEMPERATURE H2O
!  RTUMG :  REFERENCE TEMPERATURE UNIFORMLY MIXED GASES
!     -----------------------------------------------------------------

!        * E.C.M.W.F. PHYSICS PACKAGE *

!     J.-J. MORCRETTE       E.C.M.W.F.      89/07/14

!  NAME     TYPE     PURPOSE
!  ----  :  ----   : ---------------------------------------------------
!*    FOUQUART (1987) WATER CLOUD OPTICAL PROPERTIES

! RYFWCA :  REAL   : C1 IN OPTICAL THICKNESS FORMULA
! RYFWCB :  REAL   : C2 IN OPTICAL THICKNESS FORMULA
! RYFWCC :  REAL   : SINGLE SCATTERING ALBEDO PARAMETER
! RYFWCD :  REAL   : SINGLE SCATTERING ALBEDO PARAMETER
! RYFWCE :  REAL   : SINGLE SCATTERING ALBEDO PARAMETER
! RYFWCF :  REAL   : ASSYMETRY FACTOR

!*    SLINGO (1989) WATER CLOUD OPTICAL PROPERTIES

! RASWCA :  REAL   : C1 IN OPTICAL THICKNESS FORMULA
! RASWCB :  REAL   : C2 IN OPTICAL THICKNESS FORMULA
! RASWCC :  REAL   : SINGLE SCATTERING ALBEDO PARAMETER
! RASWCD :  REAL   : SINGLE SCATTERING ALBEDO PARAMETER
! RASWCE :  REAL   : SINGLE SCATTERING ALBEDO PARAMETER
! RASWCF :  REAL   : ASSYMETRY FACTOR

!*   SAVIJARVI (1998) WATER CLOUD OPTICAL PROPERTIES (RRTM)

! RHSAVI : REAL    : MASS ABSORPTION COEFFICIENTS (POLYNOMIAL DEVELOPM)

!*    ICE CLOUD OPTICAL PROPERTIES DERIVED FROM EBERT-CURRY (1992)

! REBCUA :  REAL   : C1 IN OPTICAL THICKNESS FORMULA
! REBCUB :  REAL   : C2 IN OPTICAL THICKNESS FORMULA
! REBCUC :  REAL   : 1-C3  IN SINGLE SCATTERING ALBEDO FORMULA
! REBCUD :  REAL   : C4 IN SINGLE SCATTERING ALBEDO FORMULA
! REBCUE :  REAL   : C5 IN ASSYMETRY FACTOR FORMULA
! REBCUF :  REAL   : C6 IN ASSYMETRY FACTOR FORMULA
! REBCUG :  REAL   : C7 IN MASS ABSORPTION COEFFICIENT FORMULA
! REBCUH :  REAL   : C8 IN MASS ABSORPTION COEFFICIENT FORMULA
! REBCUI :  REAL   : C7 IN MASS ABSORPTION COEFFICIENT SPECTRAL FORMULA
! REBCUJ :  REAL   : C8 IN MASS ABSORPTION COEFFICIENT SPECTRAL FORMULA

!*    ICE CLOUD OPTICAL PROPERTIES DERIVED FROM SUN-SHINE (1995)

! RSHSUE :  REAL   : E IN SINGLE SCATTERING ALBEDO FORMULA
! RSHSUF :  REAL   : F IN SINGLE SCATTERING ALBEDO FORMULA
! RSHSUH :  REAL   : H IN ASSYMETRY FACTOR FORMULA
! RSHSUK :  REAL   : K IN ASSYMETRY FACTOR FORMULA
! RSHSUA :  REAL   : ALPHA IN SSA CORRECTION FACTOR FORMULA
! RSHSUG :  REAL   : GAMMA IN ASSYMETRY CORRECTION FACTOR FORMULA
! RSHSUFA:  REAL   : COEFFICIENTS IN TEMPERATURE CORRECTION FACTOR

! REFFIA :  REAL   : C9  IN EFFECTIVE RADIUS FORMULA
! REFFIB :  REAL   : C10 IN EFFECTIVE RADIUS FORMULA

!*    ICE CLOUD OPTICAL PROPERTIES DERIVED FROM FU-LIOU (1993)

! RFULIO :  REAL   : COEFFICIENTS IN EXPRESSION FOR LW EXTINCTION COEFF.
! RFLAA  :  REAL   : COEFFICIENTS IN EXPRESSION FOR SW EXTINCTION COEFF.
! RFLBB  :  REAL   : COEFFICIENTS IN EXPRESSION FOR SW SINGLE SCATT.ALB.
! RFLCC  :  REAL   : COEFFICIENTS IN EXPRESSION FOR SW ASSYMETRY FACTOR
! RFLDD  :  REAL   : COEFFICIENTS IN EXPRESSION FOR SW ASSYMETRY FACTOR

!*    ICE CLOUD OPTICAL PROPERTIES DERIVED FROM FU (1996) & FU ET AL. (1998)

! RFUETA :  REAL   : COEFFICIENTS IN EXPRESSION FOR LW EXTINCTION COEFF.
! RFUAA  :  REAL   : COEFFICIENTS IN EXPRESSION FOR SW EXTINCTION COEFF.
! RFUBB  :  REAL   : COEFFICIENTS IN EXPRESSION FOR SW SINGLE SCATT.ALB.
! RFUCC  :  REAL   : COEFFICIENTS IN EXPRESSION FOR SW ASSYMETRY FACTOR

!*    TRANSITION BETWEEN LIQUID AND SOLID WATER

! RTIW   :  REAL   : TEMPERATURE THRESHOLD
! RRIW   :  REAL   : TRANSITION RANGE

!*    RAIN OPTICAL PROPERTIES FROM SAVIJARVI (1996)

! RROMA  :  REAL   : COEFFICIENTS FOR SINGLE SCATTERING ALBEDO
! RROMB  :  REAL   : COEFFICIENTS FOR SINGLE SCATTERING ALBEDO
! RRASY  :  REAL   : COEFFICIENTS FOR ASSYMETRY FACTOR
! RHSRA  :  REAL   : COEFFICIENTS FOR OPTICAL THICKNESS
! RHSRB  :  REAL   : COEFFICIENTS FOR OPTICAL THICKNESS
! RHSRC  :  REAL   : COEFFICIENTS FOR SINGLE SCATTERING ALBEDO
! RHSRD  :  REAL   : COEFFICIENTS FOR SINGLE SCATTERING ALBEDO
! RHSRE  :  REAL   : COEFFICIENTS FOR ASSYMETRY FACTOR 
! RHSRF  :  REAL   : COEFFICIENTS FOR ASSYMETRY FACTOR
! RHSRTA :  REAL   : COEFFICIENTS FOR OPTICAL THICKNESS
! RHSRTB :  REAL   : COEFFICIENTS FOR OPTICAL THICKNESS
!     -----------------------------------------------------------------

!        * E.C.M.W.F. PHYSICS PACKAGE *

!     J.-J. MORCRETTE       E.C.M.W.F.      89/07/14

!  NAME     TYPE     PURPOSE
!  ----  :  ----   : -------
!  RTAUA :  REAL     S.W. NORMALIZED OPTICAL THICKNESS AT 0.55 MICRON
!  RPIZA :  REAL     S.W. SINGLE SCATTERING ALBEDO
!  RCGA  :  REAL     S.W. ASSYMETRY FACTOR
!  RAER  :  REAL     L.W. ABSORPTION COEFFICIENTS
!     -----------------------------------------------------------------

!        * E.C.M.W.F. PHYSICS PACKAGE *

!     J.-J. MORCRETTE       E.C.M.W.F.      89/07/14

!  NAME     TYPE     PURPOSE
!  ----  :  ----   : -------
!RTWEIGHT:  REAL     S.W. INTEGRATED WEIGHT 
! RWEIGHT:  REAL     S.W. SPECTR WEIGHT 
!                     1 - ocean (flat response)
!                     2 - sea-ice (as snow or ice depending on month)
!                     3 - wet skin (flat)
!                     4 - vegetation low and snow-free (BR, 1986)
!                     5 - snow on low vegetation       (Warren, 1982)
!                     6 - vegetation high and snow-free (BR, 1986)
!                     7 - snow under high vegetation   (Warren, 1982)
!                     8 - bare soil (Briegleb, Ramanathan, 1986)
! RALBICE_AN : REAL : monthly sea-ice albedo in SW spectral intervals
!                     for Antarctica
! RALBICE_AN : REAL : for Arctic
!     -----------------------------------------------------------------
END MODULE OYOESW
