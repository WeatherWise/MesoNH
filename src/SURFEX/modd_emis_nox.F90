!SFX_LIC Copyright 1994-2014 CNRS, Meteo-France and Universite Paul Sabatier
!SFX_LIC This is part of the SURFEX software governed by the CeCILL-C licence
!SFX_LIC version 1. See LICENSE, CeCILL-C_V1-en.txt and CeCILL-C_V1-fr.txt  
!SFX_LIC for details. version 1.
!     ######################
      MODULE MODD_EMIS_NOX
!     ######################
!
!!****  *MODD_EMIS_NOX* - declaration of prognostic variables related
!!                          to the  soilemisNO routine.
!!
!!    PURPOSE
!!    -------
!       The purpose of this declarative module is to specify  the 
!     coefficients and weights related to the NOx emissions routine (soilemisno). 
!
!!
!!**  IMPLICIT ARGUMENTS
!!    ------------------
!!      None 
!!
!-------------------------------------------------------------------------------
!
!*       0.   DECLARATIONS
!             ------------
!
IMPLICIT NONE
!
!------------------------------------------------------------------------------
!
! Weights
!
REAL, DIMENSION(3), PARAMETER :: XWGT_0 = (/0.561651794427011,-1.62075908632141,-0.21261983875851/)
REAL, DIMENSION(3), PARAMETER :: XWGT_TG_S = (/-0.48932473825312,0.638173941854311,0.901773966331639/)
REAL, DIMENSION(3), PARAMETER :: XWGT_WFPS_S = (/-0.73521035872982,3.88469485689393,-5.18779902340853/)
!REAL, DIMENSION(3), PARAMETER :: XWGT_WFPS_S = (/0.33521035872982,3.88469485689393,-1.18779902340853/)
REAL, DIMENSION(3), PARAMETER :: XWGT_TG_D = (/0.506600069632212,-0.942985468044301,1.23132977162784/)
REAL, DIMENSION(3), PARAMETER :: XWGT_FERT = (/-0.784867014304196,-0.862455616914003,-2.62451302093078/)
REAL, DIMENSION(3), PARAMETER :: XWGT_SAND = (/-0.283241716518431,-2.68040193699105,-0.27778477919531/)
!REAL, DIMENSION(3), PARAMETER :: XWGT_SAND = (/0.283241716518431,-2.68040193699105,-0.27778477919531/)
REAL, DIMENSION(3), PARAMETER :: XWGT_PH = (/0.132539461337082,1.61126351888328,0.413060247967231/)
REAL, DIMENSION(3), PARAMETER :: XWGT_WIND = (/-0.00839661549597702,0.134088164903734,-0.560462552556124/)

REAL, DIMENSION(4), PARAMETER :: XWGT_TOT = (/0.499562769416134,-1.23876483956298,-1.41295235373665,-1.20659105237301/)
!REAL, DIMENSION(4), PARAMETER :: XWGT_TOT = (/0.499562769416134,-1.23876483956298,1.41295235373665,1.20659105237301/)
!
! Coefficients
REAL, DIMENSION(2), PARAMETER :: XCOEF_TG_S = (/-2.453992,0.142680/)
REAL, DIMENSION(2), PARAMETER :: XCOEF_WFPS_S = (/-4.609693,0.115964/)
REAL, DIMENSION(2), PARAMETER :: XCOEF_TG_D = (/-2.717366,0.163039/)
REAL, DIMENSION(2), PARAMETER :: XCOEF_FERT = (/-0.364632,5.577532/)
REAL, DIMENSION(2), PARAMETER :: XCOEF_SAND = (/-1.535199,0.054909/)
REAL, DIMENSION(2), PARAMETER :: XCOEF_PH = (/-25.554238,3.158129/)
REAL, DIMENSION(2), PARAMETER :: XCOEF_WIND = (/-1.182905,0.614317/)
!
!REAL, PARAMETER    :: XCOEF_NO0 = 7.903007
REAL, PARAMETER    :: XCOEF_NO0 = 3.403007
!REAL, PARAMETER    :: XCOEF_NO0 = 4.903007
!REAL, PARAMETER    :: XCOEF_NO1 = 8.205080
REAL, PARAMETER    :: XCOEF_NO1_s = 7.205080
REAL, PARAMETER    :: XCOEF_NO1_l = 2.205080
!
END MODULE MODD_EMIS_NOX
