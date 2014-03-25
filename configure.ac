AC_INIT([libdm36x-codecs], [1.0.0], [ddompe@gmail.com])
AM_INIT_AUTOMAKE([1.11 foreign])

AM_SILENT_RULES([yes])

AC_PROG_CC
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_HEADERS([config.h])

# Initialize libtool
LT_PREREQ([2.2])
LT_INIT([disable-static])

AC_ARG_VAR([DVSDKDIR], [path for the dvsdk location])
AC_ARG_WITH(dvsdkdir,
    [AS_HELP_STRING([--with-dvsdkdir=<path>],
        [Set the path for the dvsdk])],
    [AC_MSG_NOTICE([Setting the dvsdkdir "$withval"])
     AC_SUBST([DVSDKDIR],[$withval])
    ]
)

if test -z $DVSDKDIR ; then
  AC_MSG_ERROR([you need to provide the path for the DVSDK installation dir!, use --with-dvsdkdir])
fi

if ! test -f $DVSDKDIR/Rules.make ; then
  AC_MSG_ERROR([Can not find Rules.make in the DVSDK installation directory provided ($DVSDKDIR/Rules.make)])
fi

AC_ARG_WITH(mp3encoder,
    [AS_HELP_STRING([--with-mp3encoder=<path>],
        [Set the path for the mp3 encoder codec directory])],
    [AC_MSG_NOTICE([Setting the mp3encoderdir "$withval"])
     AC_SUBST([MP3ENCODER],[$withval])
    ]
)

if ! test -z $MP3ENCODER ; then
  if ! test -f $MP3ENCODER/packages-production/ittiam/codecs/mp3_enc/MP3_ENC.xdc ; then
    AC_MSG_ERROR([Can not find MP3_ENC.xdc in the MP3 encoder codec directory provided ($MP3ENCODER/packages-production/ittiam/codecs/mp3_enc/MP3_ENC.xdc)])
  fi
  AC_SUBST([MP3_ENCODER_ENABLED],"yes")
  AC_SUBST([MP3_ENCODER_PACKAGE],"$MP3ENCODER/packages-production/")
fi

AC_ARG_WITH(mp3decoder,
    [AS_HELP_STRING([--with-mp3decoder=<path>],
        [Set the path for the mp3 decoder codec directory])],
    [AC_MSG_NOTICE([Setting the mp3decoderdir "$withval"])
     AC_SUBST([MP3DECODER],[$withval])
    ]
)

if ! test -z $MP3DECODER ; then
  if ! test -f $MP3DECODER/packages-production/ittiam/codecs/mp3_dec/MP3_DEC.xdc ; then
    AC_MSG_ERROR([Can not find MP3_DEC.xdc in the MP3 decoder codec directory provided ($MP3DECODER/packages-production/ittiam/codecs/mp3_dec/MP3_DEC.xdc)])
  fi
  AC_SUBST([MP3_DECODER_ENABLED],"yes")
  AC_SUBST([MP3_DECODER_PACKAGE],"$MP3DECODER/packages-production/")
fi



# Inform the automake files about the host prefix
AC_SUBST([TOOLCHAIN_PREFIX],[$ac_cv_host])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
