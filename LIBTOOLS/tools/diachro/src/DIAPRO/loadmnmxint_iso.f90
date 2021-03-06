!     ######spl
      MODULE MODI_LOADMNMXINT_ISO 
!     ############################
!
INTERFACE
!
SUBROUTINE LOADMNMXINT_ISO(HCARIN,KIND,PMNMXINT,K)
CHARACTER(LEN=*)  :: HCARIN
INTEGER           :: KIND,K
REAL              :: PMNMXINT
END SUBROUTINE LOADMNMXINT_ISO
!
END INTERFACE
END MODULE MODI_LOADMNMXINT_ISO
!     ######spl
      SUBROUTINE LOADMNMXINT_ISO(HCARIN,KIND,PMNMXINT,K)
!     ##################################################
!
!!****  *LOADMNMXINT_ISO* - 
!!
!!    PURPOSE
!!    -------
!       Memorise pour un processus donne les limites et l'intervalle
!       d'isocontours (utilises quand NIMNMX=1)
!
!!**  METHOD
!!    ------
!!      K = 1 --> memorisation MIN
!!      K = 2 --> memorisation MAX
!!      K = 3 --> memorisation Intervalle
!!      K = 4 --> memorisation ISOREF (NIMNMX=3)
!!
!!    EXTERNAL
!!    --------
!!      None
!!
!!    IMPLICIT ARGUMENTS
!!    ------------------
!!      Module
!!
!!      Module
!!
!!    REFERENCE
!!    ---------
!!
!!
!!    AUTHOR
!!    ------
!!      J. Duron    * Laboratoire d'Aerologie *
!!
!!
!!    MODIFICATIONS
!!    -------------
!!      Original       2/09/96
!!      Updated   PM   
!-------------------------------------------------------------------------------
!
!*       0.    DECLARATIONS
!              ------------
!
USE MODD_RESOLVCAR

IMPLICIT NONE
!
!*       0.1   Dummy arguments
!              ---------------

CHARACTER(LEN=*) :: HCARIN
INTEGER          :: KIND, K
REAL             :: PMNMXINT
!
!*       0.1   Local variables
!              ---------------

INTEGER           :: ILEN
INTEGER           :: J,JM
REAL,DIMENSION(:),ALLOCATABLE  :: ZISOSAVE
CHARACTER(LEN=100),DIMENSION(:),ALLOCATABLE  :: YISOSAVE

!
!------------------------------------------------------------------------------
ILEN=7
IF(HCARIN(KIND+ILEN:KIND+ILEN) /= '_')THEN
  RETURN
ELSE
  DO J=ILEN+1,ILEN+100
    IF(HCARIN(KIND+J:KIND+J) == ' ' .OR.  &
       HCARIN(KIND+J:KIND+J) == '=')THEN
      JM=J-1
      EXIT
    ENDIF
  ENDDO
ENDIF
IF(K == 1)THEN                                 ! memorisation MIN
  IF(NBISOMN == 0)THEN
    NBISOMN=NBISOMN+1
    ALLOCATE(XISOMN(NBISOMN),CISOMN(NBISOMN))
    XISOMN(NBISOMN)=PMNMXINT
    CISOMN(NBISOMN)=HCARIN(KIND+ILEN+1:KIND+JM)
    CISOMN(NBISOMN)=ADJUSTL(CISOMN(NBISOMN))
  ELSE
    DO J=1,NBISOMN
    IF(HCARIN(KIND+ILEN+1:KIND+JM) == CISOMN(J))THEN
      XISOMN(J)=PMNMXINT
      RETURN
    ENDIF
    ENDDO
    ALLOCATE(ZISOSAVE(NBISOMN),YISOSAVE(NBISOMN))
    ZISOSAVE(:)=XISOMN(:)
    YISOSAVE(:)=CISOMN(:)
    DEALLOCATE(XISOMN,CISOMN)
    NBISOMN=NBISOMN+1
    ALLOCATE(XISOMN(NBISOMN),CISOMN(NBISOMN))
    XISOMN(1:NBISOMN-1)=ZISOSAVE(:)
    CISOMN(1:NBISOMN-1)=YISOSAVE(:)
    XISOMN(NBISOMN)=PMNMXINT
    CISOMN(NBISOMN)=HCARIN(KIND+ILEN+1:KIND+JM)
    CISOMN(NBISOMN)=ADJUSTL(CISOMN(NBISOMN))
    DEALLOCATE(ZISOSAVE,YISOSAVE)
  ENDIF
ELSE IF(K == 2)THEN                            ! memorisation MAX
  IF(NBISOMX == 0)THEN
    NBISOMX=NBISOMX+1
    ALLOCATE(XISOMX(NBISOMX),CISOMX(NBISOMX))
    XISOMX(NBISOMX)=PMNMXINT
    CISOMX(NBISOMX)=HCARIN(KIND+ILEN+1:KIND+JM)
    CISOMX(NBISOMX)=ADJUSTL(CISOMX(NBISOMX))
  ELSE
    DO J=1,NBISOMX
    IF(HCARIN(KIND+ILEN+1:KIND+JM) == CISOMX(J))THEN
      XISOMX(J)=PMNMXINT
      RETURN
    ENDIF
    ENDDO
    ALLOCATE(ZISOSAVE(NBISOMX),YISOSAVE(NBISOMX))
    ZISOSAVE(:)=XISOMX(:)
    YISOSAVE(:)=CISOMX(:)
    DEALLOCATE(XISOMX,CISOMX)
    NBISOMX=NBISOMX+1
    ALLOCATE(XISOMX(NBISOMX),CISOMX(NBISOMX))
    XISOMX(1:NBISOMX-1)=ZISOSAVE(:)
    CISOMX(1:NBISOMX-1)=YISOSAVE(:)
    XISOMX(NBISOMX)=PMNMXINT
    CISOMX(NBISOMX)=HCARIN(KIND+ILEN+1:KIND+JM)
    CISOMX(NBISOMX)=ADJUSTL(CISOMX(NBISOMX))
    DEALLOCATE(ZISOSAVE,YISOSAVE)
  ENDIF
ELSE IF(K == 3)THEN                            ! memorisation INTervalle
  IF(NBISOINT == 0)THEN
    NBISOINT=NBISOINT+1
    ALLOCATE(XISOINT(NBISOINT),CISOINT(NBISOINT))
    XISOINT(NBISOINT)=PMNMXINT
    CISOINT(NBISOINT)=HCARIN(KIND+ILEN+1:KIND+JM)
    CISOINT(NBISOINT)=ADJUSTL(CISOINT(NBISOINT))
  ELSE
    DO J=1,NBISOINT
    IF(HCARIN(KIND+ILEN+1:KIND+JM) == CISOINT(J))THEN
      XISOINT(J)=PMNMXINT
      RETURN
    ENDIF
    ENDDO
    ALLOCATE(ZISOSAVE(NBISOINT),YISOSAVE(NBISOINT))
    ZISOSAVE(:)=XISOINT(:)
    YISOSAVE(:)=CISOINT(:)
    DEALLOCATE(XISOINT,CISOINT)
    NBISOINT=NBISOINT+1
    ALLOCATE(XISOINT(NBISOINT),CISOINT(NBISOINT))
    XISOINT(1:NBISOINT-1)=ZISOSAVE(:)
    CISOINT(1:NBISOINT-1)=YISOSAVE(:)
    XISOINT(NBISOINT)=PMNMXINT
    CISOINT(NBISOINT)=HCARIN(KIND+ILEN+1:KIND+JM)
    CISOINT(NBISOINT)=ADJUSTL(CISOINT(NBISOINT))
    DEALLOCATE(ZISOSAVE,YISOSAVE)
  ENDIF
ELSE IF(K == 4)THEN                            ! memorisation ISOligne de REF
  IF(NBISOREF == 0)THEN
    NBISOREF=NBISOREF+1
    ALLOCATE(XISOREFP(NBISOREF),CISOREF(NBISOREF))
    XISOREFP(NBISOREF)=PMNMXINT
    CISOREF(NBISOREF)=HCARIN(KIND+ILEN+1:KIND+JM)
    CISOREF(NBISOREF)=ADJUSTL(CISOREF(NBISOREF))
  ELSE
    DO J=1,NBISOREF
    IF(HCARIN(KIND+ILEN+1:KIND+JM) == CISOINT(J))THEN
      XISOREFP(J)=PMNMXINT
      RETURN
    ENDIF
    ENDDO
    ALLOCATE(ZISOSAVE(NBISOREF),YISOSAVE(NBISOREF))
    ZISOSAVE(:)=XISOREFP(:)
    YISOSAVE(:)=CISOREF(:)
    DEALLOCATE(XISOREFP,CISOREF)
    NBISOREF=NBISOREF+1
    ALLOCATE(XISOREFP(NBISOREF),CISOREF(NBISOREF))
    XISOREFP(1:NBISOREF-1)=ZISOSAVE(:)
    CISOREF(1:NBISOREF-1)=YISOSAVE(:)
    XISOREFP(NBISOREF)=PMNMXINT
    CISOREF(NBISOREF)=HCARIN(KIND+ILEN+1:KIND+JM)
    CISOREF(NBISOREF)=ADJUSTL(CISOREF(NBISOREF))
    DEALLOCATE(ZISOSAVE,YISOSAVE)
  ENDIF
ENDIF

RETURN
END SUBROUTINE LOADMNMXINT_ISO
