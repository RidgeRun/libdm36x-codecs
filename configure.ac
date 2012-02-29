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

# Inform the automake files about the host prefix
AC_SUBST([TOOLCHAIN_PREFIX],[$ac_cv_host])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
