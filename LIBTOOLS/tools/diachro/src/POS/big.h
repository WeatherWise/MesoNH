#ifdef SMALL
#ifndef f77
INTEGER, PARAMETER :: N2DVERTX=1000 , NPMAP=800000
#else
      INTEGER N2DVERTX, NPMAP
      PARAMETER(N2DVERTX=1000, NPMAP=800000)
#endif
#else
#ifndef f77
INTEGER, PARAMETER :: N2DVERTX=4000 , NPMAP=1800000
#else
      INTEGER N2DVERTX, NPMAP
      PARAMETER(N2DVERTX=4000, NPMAP=1800000)
#endif
#endif
