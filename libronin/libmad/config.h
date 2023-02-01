/* config.h.  Generated automatically by configure.  */
/* config.h.in.  Generated automatically from configure.in by autoheader.  */
/*
 * mad - MPEG audio decoder
 * Copyright (C) 2000-2001 Robert Leslie
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * $Id: config.h,v 1.3 2001-05-06 00:10:37 peter Exp $
 */



# ifndef MAD_CONFIG_H
# define MAD_CONFIG_H
extern void reportf(const char *fmt, ...);
void reporthex( int d, int n );
void report(const char *str);


/*****************************************************************************
 * Definitions selected automatically by `configure'                         *
 *****************************************************************************/

/* Define to empty if the keyword does not work.  */
/* #undef const */

/* Define if you have <sys/wait.h> that is POSIX.1 compatible.  */
/* #undef HAVE_SYS_WAIT_H */

/* Define as __inline if that's what the C compiler calls it.  */
/* #undef inline */

/* Define to `int' if <sys/types.h> doesn't define.  */
#define pid_t int

/* Define if you have the ANSI C header files.  */
/* #define STDC_HEADERS 1 */

/* Define to optimize for speed over accuracy. */
/* #define OPT_SPEED */

/* Define to optimize for accuracy over speed. */
/* #undef OPT_ACCURACY */

/* Define to enable a fast subband synthesis approximation optimization. */
/* #define OPT_SSO */

/* Define to influence a strict interpretation of the ISO/IEC standards,
   even if this is in opposition with best accepted practices. */
/* #undef OPT_STRICT */

/* Define if your MIPS CPU supports a 2-operand MADD instruction. */
/* #undef HAVE_MADD_ASM */

/* Define if your MIPS CPU supports a 2-operand MADD16 instruction. */
/* #undef HAVE_MADD16_ASM */

/* Define to enable diagnostic debugging support. */
/* #undef DEBUG */
#include "armlib.h"
/* Define to disable debugging assertions. */
#define NDEBUG

/* Define to enable experimental code. */
/* #undef EXPERIMENTAL */

/* The number of bytes in a int.  */
#define SIZEOF_INT 4

/* The number of bytes in a long.  */
#define SIZEOF_LONG 4

/* The number of bytes in a long long.  */
#define SIZEOF_LONG_LONG 8

/* Define if you have the <limits.h> header file.  */
#define HAVE_LIMITS_H 1

/* Define if you have the <unistd.h> header file.  */
#define HAVE_UNISTD_H 1

/* Name of package */
#define PACKAGE "libmad"

/* Version number of package */
#define VERSION "0.12.5b"

/*****************************************************************************
 * End of automatically configured definitions                               *
 *****************************************************************************/

# endif
