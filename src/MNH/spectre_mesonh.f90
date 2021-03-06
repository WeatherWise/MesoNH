!MNH_LIC Copyright 1994-2014 CNRS, Meteo-France and Universite Paul Sabatier
!MNH_LIC This is part of the Meso-NH software governed by the CeCILL-C licence
!MNH_LIC version 1. See LICENSE, CeCILL-C_V1-en.txt and CeCILL-C_V1-fr.txt  
!MNH_LIC for details. version 1.
!     ####################
      MODULE MODI_SPECTRE_MESONH
!     ####################
!
INTERFACE
!
SUBROUTINE SPECTRE_MESONH(HOUTFILE)
CHARACTER(LEN=*) , INTENT(IN)               :: HOUTFILE

END SUBROUTINE SPECTRE_MESONH
      !
END INTERFACE
!
END MODULE    

!     ######spl
SUBROUTINE SPECTRE_MESONH(HOUTFILE)
!     ######################################################################
!     
!
USE MODD_SPECTRE
USE MODD_DYN_n
USE MODD_FIELD_n
USE MODD_LSFIELD_n
USE MODI_COMPUTE_SPECTRE
USE MODD_PARAMETERS
!
USE MODI_INIT_MNH
!
IMPLICIT NONE
!
CHARACTER(LEN=*) , INTENT(IN) :: HOUTFILE
CHARACTER(LEN=5) :: YFIELDSP
REAL,DIMENSION(:,:,:),ALLOCATABLE:: ZWORK         ! work array
!------------------------------------------------------------------------------------------------
CALL INIT_MNH
!
IF (LSPECTRE_U) THEN
 YFIELDSP="U"       
 IF (LZOOM) THEN
   ALLOCATE(ZWORK(NITOT+2,NJTOT+2,SIZE(XUT,3)))
   ZWORK(:,:,:)=XUT(NXDEB-JPHEXT+1:NXDEB+NITOT+2*JPHEXT-1,NYDEB-JPHEXT+1:NYDEB+NJTOT+2*JPHEXT-1,:)
 ELSE
   ALLOCATE(ZWORK(SIZE(XUT,1),SIZE(XUT,2),SIZE(XUT,3)))
   ZWORK(:,:,:)=XUT(:,:,:)
 ENDIF
 print*,"CALL COMPUTE_SPECTRE FOR ",YFIELDSP
 CALL COMPUTE_SPECTRE(XDXHATM,XDYHATM,ZWORK,YFIELDSP,HOUTFILE)
 DEALLOCATE(ZWORK)
ENDIF
!
IF (LSPECTRE_V) THEN
  IF (LZOOM) THEN
   ALLOCATE(ZWORK(NITOT+2,NJTOT+2,SIZE(XVT,3)))
   ZWORK(:,:,:)=XVT(NXDEB-JPHEXT+1:NXDEB+NITOT+2*JPHEXT-1,NYDEB-JPHEXT+1:NYDEB+NJTOT+2*JPHEXT-1,:)
 ELSE
   ALLOCATE(ZWORK(SIZE(XVT,1),SIZE(XVT,2),SIZE(XVT,3)))
   ZWORK(:,:,:)=XVT(:,:,:)
 ENDIF
 YFIELDSP="V"
 print*,"CALL COMPUTE_SPECTRE FOR ",YFIELDSP
 CALL COMPUTE_SPECTRE(XDXHATM,XDYHATM,ZWORK,YFIELDSP,HOUTFILE)
 DEALLOCATE(ZWORK)              
ENDIF
!
IF (LSPECTRE_W) THEN  
 IF (LZOOM) THEN
   ALLOCATE(ZWORK(NITOT+2,NJTOT+2,SIZE(XWT,3)))
   ZWORK(:,:,:)=XWT(NXDEB-JPHEXT+1:NXDEB+NITOT+2*JPHEXT-1,NYDEB-JPHEXT+1:NYDEB+NJTOT+2*JPHEXT-1,:)
 ELSE
   ALLOCATE(ZWORK(SIZE(XWT,1),SIZE(XWT,2),SIZE(XWT,3)))
   ZWORK(:,:,:)=XWT(:,:,:)
 ENDIF        
 YFIELDSP="W"
 print*,"CALL COMPUTE_SPECTRE FOR ",YFIELDSP 
 CALL COMPUTE_SPECTRE(XDXHATM,XDYHATM,ZWORK,YFIELDSP,HOUTFILE)
 DEALLOCATE(ZWORK)
ENDIF
!
IF (LSPECTRE_RV) THEN
 IF (LZOOM) THEN
   ALLOCATE(ZWORK(NITOT+2,NJTOT+2,SIZE(XRT,3)))
   ZWORK(:,:,:)=XRT(NXDEB-JPHEXT+1:NXDEB+NITOT+2*JPHEXT-1,NYDEB-JPHEXT+1:NYDEB+NJTOT+2*JPHEXT-1,:,1)
 ELSE
   ALLOCATE(ZWORK(SIZE(XRT,1),SIZE(XRT,2),SIZE(XRT,3)))
   ZWORK(:,:,:)=XRT(:,:,:,1)
 ENDIF
 YFIELDSP="Rv"
 print*,"CALL COMPUTE_SPECTRE FOR ",YFIELDSP
 CALL COMPUTE_SPECTRE(XDXHATM,XDYHATM,ZWORK,YFIELDSP,HOUTFILE)
 DEALLOCATE(ZWORK)
ENDIF
!
IF (LSPECTRE_TH) THEN
 IF (LZOOM) THEN
   ALLOCATE(ZWORK(NITOT+2,NJTOT+2,SIZE(XTHT,3)))
   ZWORK(:,:,:)=XTHT(NXDEB-JPHEXT+1:NXDEB+NITOT+2*JPHEXT-1,NYDEB-JPHEXT+1:NYDEB+NJTOT+2*JPHEXT-1,:)
 ELSE
   ALLOCATE(ZWORK(SIZE(XTHT,1),SIZE(XTHT,2),SIZE(XTHT,3)))
   ZWORK(:,:,:)=XTHT(:,:,:)
 ENDIF        
 YFIELDSP="Theta"
 print*,"CALL COMPUTE_SPECTRE FOR ",YFIELDSP
 CALL COMPUTE_SPECTRE(XDXHATM,XDYHATM,ZWORK,YFIELDSP,HOUTFILE)
 DEALLOCATE(ZWORK)
ENDIF
!
IF (LSPECTRE_LSU) THEN              
 IF (LZOOM) THEN
   ALLOCATE(ZWORK(NITOT+2,NJTOT+2,SIZE(XLSUM,3)))
   ZWORK(:,:,:)=XLSUM(NXDEB-JPHEXT+1:NXDEB+NITOT+2*JPHEXT-1,NYDEB-JPHEXT+1:NYDEB+NJTOT+2*JPHEXT-1,:)
 ELSE
   ALLOCATE(ZWORK(SIZE(XLSUM,1),SIZE(XLSUM,2),SIZE(XLSUM,3)))
   ZWORK(:,:,:)=XLSUM(:,:,:)
 ENDIF 
 YFIELDSP="LSUM"
 print*,"CALL COMPUTE_SPECTRE FOR ",YFIELDSP
 CALL COMPUTE_SPECTRE(XDXHATM,XDYHATM,ZWORK,YFIELDSP,HOUTFILE)
 DEALLOCATE(ZWORK)
ENDIF
!
IF (LSPECTRE_LSV) THEN              
 IF (LZOOM) THEN
   ALLOCATE(ZWORK(NITOT+2,NJTOT+2,SIZE(XLSVM,3)))
   ZWORK(:,:,:)=XLSVM(NXDEB-JPHEXT+1:NXDEB+NITOT+2*JPHEXT-1,NYDEB-JPHEXT+1:NYDEB+NJTOT+2*JPHEXT-1,:)
 ELSE
   ALLOCATE(ZWORK(SIZE(XLSVM,1),SIZE(XLSVM,2),SIZE(XLSVM,3)))
   ZWORK(:,:,:)=XLSVM(:,:,:)
 ENDIF 
 YFIELDSP="LSVM"
 print*,"CALL COMPUTE_SPECTRE FOR ",YFIELDSP
 CALL COMPUTE_SPECTRE(XDXHATM,XDYHATM,ZWORK,YFIELDSP,HOUTFILE)
 DEALLOCATE(ZWORK)
ENDIF
!
IF (LSPECTRE_LSW) THEN             
 IF (LZOOM) THEN
   ALLOCATE(ZWORK(NITOT+2,NJTOT+2,SIZE(XLSWM,3)))
   ZWORK(:,:,:)=XLSWM(NXDEB-JPHEXT+1:NXDEB+NITOT+2*JPHEXT-1,NYDEB-JPHEXT+1:NYDEB+NJTOT+2*JPHEXT-1,:)
 ELSE
   ALLOCATE(ZWORK(SIZE(XLSWM,1),SIZE(XLSWM,2),SIZE(XLSWM,3)))
   ZWORK(:,:,:)=XLSWM(:,:,:)
 ENDIF 
 YFIELDSP="LSWM"
 print*,"CALL COMPUTE_SPECTRE FOR ",YFIELDSP
 CALL COMPUTE_SPECTRE(XDXHATM,XDYHATM,ZWORK,YFIELDSP,HOUTFILE)
 DEALLOCATE(ZWORK)
ENDIF
!
IF (LSPECTRE_LSRV) THEN             
 IF (LZOOM) THEN
   ALLOCATE(ZWORK(NITOT+2,NJTOT+2,SIZE(XLSRVM,3)))
   ZWORK(:,:,:)=XLSRVM(NXDEB-JPHEXT+1:NXDEB+NITOT+2*JPHEXT-1,NYDEB-JPHEXT+1:NYDEB+NJTOT+2*JPHEXT-1,:)
 ELSE
   ALLOCATE(ZWORK(SIZE(XLSRVM,1),SIZE(XLSRVM,2),SIZE(XLSRVM,3)))
   ZWORK(:,:,:)=XLSRVM(:,:,:)
 ENDIF 
 YFIELDSP="LSRVM"
 print*,"CALL COMPUTE_SPECTRE FOR ",YFIELDSP
 CALL COMPUTE_SPECTRE(XDXHATM,XDYHATM,ZWORK,YFIELDSP,HOUTFILE)
 DEALLOCATE(ZWORK)
ENDIF
!
IF (LSPECTRE_LSTH) THEN              
 IF (LZOOM) THEN
   ALLOCATE(ZWORK(NITOT+2,NJTOT+2,SIZE(XLSTHM,3)))
   ZWORK(:,:,:)=XLSTHM(NXDEB-JPHEXT+1:NXDEB+NITOT+2*JPHEXT-1,NYDEB-JPHEXT+1:NYDEB+NJTOT+2*JPHEXT-1,:)
 ELSE
   ALLOCATE(ZWORK(SIZE(XLSTHM,1),SIZE(XLSTHM,2),SIZE(XLSTHM,3)))
   ZWORK(:,:,:)=XLSTHM(:,:,:)
 ENDIF 
 YFIELDSP="LSTHM"
 print*,"CALL COMPUTE_SPECTRE FOR ",YFIELDSP
 CALL COMPUTE_SPECTRE(XDXHATM,XDYHATM,ZWORK,YFIELDSP,HOUTFILE)
 DEALLOCATE(ZWORK)
ENDIF
!
!
END SUBROUTINE SPECTRE_MESONH
      
