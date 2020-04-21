#!/bin/bash
#===============================================================================
# ubuntu_devenv.sh
# http://symbiosoft.net/ubuntu_devenv
#
# (K)UBUNTU - POST INSTALLATION SCRIPT THAT SETUP A DEVELOPER ENVIRONMENT
#
# Copyright (C) 2010, Etienne Savard
#
# This program is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; either version 2 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE. See the GNU General Public License for more details
# (http://www.opensource.org/licenses/gpl-2.0.php).
#===============================================================================

function failure()
{
  printf "\n$@\n"
  exit 2
}

#Find which dialog tool is available
function find_dialog()
{
  if [ ! -z "$DISPLAY" ] ; then
    DIALOG=`which kdialog`

    if [ ! -z "$DIALOG" ]; then
      DIALOG_TYPE=kdialog
    else
      DIALOG=`which Xdialog`

      if [ ! -z "$DIALOG" ]; then
        DIALOG_TYPE=dialog
      fi
    fi

    if [ -z "$DIALOG" ]; then
      DIALOG=`which zenity`

      if [ ! -z "$DIALOG" ]; then
        DIALOG_TYPE=zenity
      fi
    fi
  fi

  if [ -z "$DIALOG" ]; then
    DIALOG=`which dialog`

    if [ ! -z "$DIALOG" ]; then
      DIALOG_TYPE=dialog
    fi
  fi

  if [ -z "$DIALOG" ]; then
    failure "You need kdialog, xenity or dialog application to run this script,\nplease install it using 'apt-get install packagename' where packagename is\n'kdebase-bin' for kdialog, 'xdialog' for dialog, 'dialog' for dialog.\nIf you are using text-mode, you need to install dialog."
  fi
}

function dialog_menu()
{
  DESCRIPTION="$1"
  shift

  declare -a PARAMS

  if [ "$DIALOG_TYPE" = "zenity" ]; then
    declare -i i=0
    for v; do
      PARAMS[$i]="$v"
      i+=1
    done
    $DIALOG --list --text "$DESCRIPTION" --column "" "${PARAMS[@]}" --width=500 --height=400
  else
    if [ "$DIALOG_TYPE" = "kdialog" ] ; then
      declare -i i=0
      for v; do
        PARAMS[$i]="$v"
        i+=1
        PARAMS[$i]="$v" #yes, 2 times as kdialog requires key and value
        i+=1
      done
      $DIALOG --menu "$DESCRIPTION" "${PARAMS[@]}"
    else
      declare -i i=0
      for v; do
        PARAMS[$i]="$v"
        i+=1
        PARAMS[$i]="Language"
        i+=1
      done
      $DIALOG --stdout --menu "$DESCRIPTION" 20 30 10 "${PARAMS[@]}"
    fi
  fi
}

function dialog_multi_choice()
{
  DESCRIPTION="$1"
  shift

  if [ "$DIALOG_TYPE" = "zenity" ]; then
    for i; do
      PARAMS="$PARAMS $i $i"
    done
    $DIALOG --separator $'\n' --list --checklist --multiple --text "$DESCRIPTION" --column "" --column ""  $PARAMS --width=500 --height=400
  else
    if [ "$DIALOG_TYPE" = "kdialog" ] ; then
      for i; do
        PARAMS="$PARAMS $i $i 0"
      done
      $DIALOG --separate-output --checklist "$DESCRIPTION" $PARAMS
    else
      for i; do
        PARAMS="$PARAMS $i Language 0"
      done
      $DIALOG --stdout --separate-output --checklist "$DESCRIPTION" 20 30 10 $PARAMS
    fi
  fi

  RESULT=$?
  return $RESULT
}

function dialog_line_input()
{
  DESCRIPTION="$1"
  INITIAL_VALUE="$2"

  if [ "$DIALOG_TYPE" = "zenity" ] ; then
    $DIALOG --entry --text "$DESCRIPTION" --entry-text "$INITIAL_VALUE"
  else
    if [ "$DIALOG_TYPE" = "kdialog" ] ; then
      $DIALOG --inputbox "$DESCRIPTION" "$INITIAL_VALUE"
    else
      $DIALOG --stdout --inputbox "$DESCRIPTION" 20 30 "$INITIAL_VALUE"
    fi
  fi

  RESULT=$?
  return $RESULT
}

function dialog_choose_file()
{
  TITLE="$1"

  if [ "$DIALOG_TYPE" = "zenity" ] ; then
    $DIALOG --title "$TITLE" --file-selection "`pwd`/"
  else
    if [ "$DIALOG_TYPE" = "kdialog" ] ; then
      $DIALOG --title "$TITLE" --getopenfilename "`pwd`/"
    else
      $DIALOG --stdout --title "$TITLE" --fselect "`pwd`/" 20 80
    fi
  fi
}

function dialog_msgbox()
{
  TITLE="$1"
  TEXT="$2"

  if [ "$DIALOG_TYPE" = "zenity" ]; then
    echo -n "$TEXT" | $DIALOG --title "$TITLE" --text-info --width=500 --height=400
  else
    $DIALOG --title "$TITLE" --msgbox "$TEXT" 20 80
  fi
}

function dialog_question()
{
  TITLE="$1"
  TEXT="$2"

  if [ "$DIALOG_TYPE" = "zenity" ]; then
    $DIALOG --title "$TITLE" --question --text "$TEXT"
  else
    $DIALOG --title "$TITLE" --yesno "$TEXT" 20 80
  fi
}

#*******************************************************************************
# CREATE TEMPORARY FOLDER
#*******************************************************************************
function init_temp_dir()
{
  cd ~

  if [ -a ./post_install_tmp ]; then
    echo "Erasing existing post_install_tmp dir..."
    rm -rf ./post_install_tmp
  fi

  mkdir ./post_install_tmp
  cd post_install_tmp
}

#*******************************************************************************
# GET SECURITY UPDATES
#*******************************************************************************
function update_packages()
{
  sudo apt-get update
  sudo apt-get upgrade
}

#*******************************************************************************
# ESSENTIAL (NON-DEVELOPPER) TOOLS
#*******************************************************************************
function install_mandatories()
{
  $APTGETCMD -y install ssh
  $APTGETCMD -y install samba smbfs
}

#*******************************************************************************
# SOURCE CONTROL MANAGERS
#*******************************************************************************
function install_scm()
{
  for i in $SCM_PKG; do
    case $i in
    "subversion")
      $APTGETCMD -y install subversion;;
    "cvs")
      $APTGETCMD -y install cvs;;
    "mercurial")
      $APTGETCMD -y install mercurial qct;;
    "git")
      $APTGETCMD -y install git-core git-gui gitk;;
    esac
  done
}

#*******************************************************************************
# JAVA
#*******************************************************************************
function install_java()
{
  if [ "$JAVA_JDK" = "present" ]; then
    $APTGETCMD -y install default-jdk

    cat >> ~/.bash_profile <<"EOF"

#************************************************
# JAVA RELATED ENVIRONMENT VARIABLES
#************************************************
JAVA_HOME=/usr/lib/jvm/default-java
export ANT_OPTS="-Xms256m -Xmx256m" #Increase the heap size for Ant JVM
export PATH=$PATH:$JAVA_HOME/bin
EOF
  fi

  for i in $JAVA_PKG; do
    case $i in
    "ant")
      #Ant build tool
      $APTGETCMD -y install ant ant-doc ant-optional;;
    "junit")
      #JUnit unit testing
      $APTGETCMD -y install junit junit-doc;;
    "log4j")
      #Log4J Logging framework
      $APTGETCMD -y install liblog4j1.2-java liblog4j1.2-java-doc;;
    esac
  done

  for i in $DBMS_PKG; do
    case $i in
    "mysql")
      #JDBC connector for MySQL
      $APTGETCMD -y install libmysql-java;;
    "postgresql")
      #JDBC connector for PostgreSQL
      $APTGETCMD -y install libpg-java;;
    esac
  done
}

#*******************************************************************************
# NETBEANS IDE
#*******************************************************************************
function install_netbeans()
{
  $APTGETCMD -y install netbeans;;
}

#*******************************************************************************
# DATABASES
#*******************************************************************************
function install_dbms()
{
  for i in $DBMS_PKG; do
    case $i in
    "mysql")
      $APTGETCMD -y install mysql-server mysql-client mysql-admin;;
    "postgresql")
      $APTGETCMD -y install postgresql postgresql-client pgadmin3;;
    "sqlite3")
      $APTGETCMD -y install sqlite3;;
    esac
  done


  #Developer workstation : dbms should be started only when needed
	#TODO: make it optional
  #sudo update-rc.d -f mysql remove
  #sudo update-rc.d -f mysql-ndb remove
  #sudo update-rc.d -f mysql-ndb-mgm remove
  #sudo update-rc.d -f postgresql-8.2 remove
}

#*******************************************************************************
# C/C++
#*******************************************************************************
function install_cppenv()
{
  $APTGETCMD -y install autoconf automake gnu-standards build-essential libtool linux-source linux-headers-`uname -r`
  $APTGETCMD -y install distcc ccache distccmon-gnome
  $APTGETCMD -y install cppcheck valgrind
  $APTGETCMD -y install openmpi-bin openmpi-common openmpi-dbg openmpi-dev openmpi-libs0 libgomp1
  $APTGETCMD -y install swig
  
  $APTGETCMD -y install qtcreator

  #$APTGETCMD -y install libboost.*-dev libboost-doc libboost.*1.34.1

  #TODO: INTEL THREADING BUILDING BLOCKS
  #wget http://threadingbuildingblocks.org/uploads/77/84/2.0/tbb20_20070927oss_src.tar.gz
  #tar -xzf ~/tbb20_20070927oss_src.tar.gz
  #wget http://threadingbuildingblocks.org/uploads/77/84/2.0/tbb20_20070927oss_lin.tar.gz
  #tar -xzf ~/tbb20_20070927oss_lin.tar.gz
  #mv ~/tbb20_20070927oss_lin/* ~/tbb20_20070927oss_src
  #cd ~/tbb20_20070927oss_src
  #make arch=`uname -m`
  #sudo mkdir /opt/intel
  #sudo mkdir /opt/intel/tbb
  #sudo mkdir /opt/intel/tbb/2.0
  #cp src dir to /opt/intel/tbb/2.0
  #register lib vars
  #test...
}

#*******************************************************************************
# RUBY
#*******************************************************************************
function install_rubyenv()
{
  for i in $RUBYENV_PKG; do
    case $i in

    "ruby")
      $APTGETCMD -y install ruby-full;;

    "gem")
      wget http://production.cf.rubygems.org/rubygems/rubygems-1.3.7.tgz
      tar xzvf rubygems-1.3.7.tgz
      cd rubygems-1.3.7
      sudo ruby setup.rb
      sudo ln -s /usr/bin/gem1.8 /usr/bin/gem
      sudo gem update --system

      #To have RubyGems automatically loaded when you run ruby script.rb
      echo "export RUBYOPT=rubygems" >> ~/.bash_profile
      ;;
    "rails")
      sudo gem install rails;;
    "mongrel")
      sudo gem install mongrel;;
    "rubyzip")
      sudo gem install rubyzip;;
    "vim-rails")
      $APTGETCMD -y vim-rails;;
    "capistrano")
      sudo gem install capistrano;;
    "rspec")
      sudo gem install rspec;;
    "heroku")
      sudo gem install heroku;;
    "qtbindings")
      $APTGETCMD install libqt4-ruby;;
    esac
  done

  #Install Ruby drivers for installed DBMS
  for i in $DBMS_PKG; do
    case $i in
    "mysql")
      $APTGETCMD install libmysqlclient-dev
      sudo gem install mysql;;
    "postgresql")
      $APTGETCMD install postgresql-server-dev-8.4
      sudo gem install postgres;;
    "sqlite3")
      $APTGETCMD install sqlite3 libsqlite3-ruby libsqlite3-dev
      sudo gem install sqlite3-ruby;;
    esac
  done
}

#*******************************************************************************
# MATH TOOLS
#*******************************************************************************
function install_mathtools()
{
  for i in $MATHTOOLS_PKG; do
    case $i in
    "scilab")
      $APTGETCMD -y install scilab;;
    "octave")
      $APTGETCMD -y install qtoctave;;
    "gnuplot")
      $APTGETCMD -y install gnuplot;;
    esac
  done
}

#*******************************************************************************
# MISC DEVELOPMENT TOOLS
#*******************************************************************************
function install_misctools()
{
  for i in $MISCTOOLS_PKG; do
    case $i in
    "umbrello")
      $APTGETCMD -y install bouml;;
    "geany")
      $APTGETCMD -y install geany;;
    "scons")
      $APTGETCMD -y install scons;;
    "xclip")
      $APTGETCMD -y install xclip;;
    esac
  done
}

#*******************************************************************************
# CLEAN TEMPORARY FOLDER
#*******************************************************************************
function cleanup()
{
  rm -rf ~/post_install_tmp

  if [ -a ~/.bash_profile ]; then
    source ~/.bash_profile
  fi
}

#*******************************************************************************
# DISPLAY HELP
#*******************************************************************************
function show_usage()
{
  echo "Usage: $APPNAME [options]"
  echo "       $APPNAME [-l LOCAL_DEPOT]"
  echo ""
  echo "$APPNAME is a shell script that setup a development environment"
  echo "for Ubuntu and its derivatives (Kubuntu, Xubuntu, etc.) By default,"
  echo "it uses a GUI dialog, specify the -n option to force console dialogs."
  echo ""
  echo "Options:"
  echo "   -h This help text"
    echo "   -q Quiet mode - Less verbose than normal mode"
    echo "   -b Backup downloaded packages"
    echo "   -s No-act. Perform ordering simulation"
    echo "   -n No-GUI. Use only console dialog"
    echo "   -v Show version numbers"
    echo "   -l Install using local packages only. Depot location is provided as an argument"
}

function set_console_display
{
  CONSOLE_DIALOG=`which dialog`
  echo $CONSOLE_DIALOG

  if [ ! -z $CONSOLE_DIALOG ]; then
    DIALOG_TYPE=dialog
    DIALOG=$CONSOLE_DIALOG
  fi

  if [ -z $CONSOLE_DIALOG ]; then
    failure "You need at least dialog application to run this script,\nplease install it using: 'apt-get install dialog"
  fi
}

#*******************************************************************************
# SET SOME DEFAULT APT-GET OPTIONS ACCORDING TO COMMANDLINE SWITCHES
#*******************************************************************************
function init_aptget_options
{
  SIM_OPT=
  QUIET_OPT=

  if [ $SIM_MODE = y ]
  then
    SIM_OPT="-s"
  fi

  if [ $QUIET_MODE = y ]
  then
    QUIET_OPT="-q"
  fi

  APTGETCMD=`echo "sudo apt-get $QUIET_OPT $SIM_OPT"`
}

function show_version
{
  echo "$VERSION"
}

function show_welcome_msg
{
  dialog_msgbox "$APPNAME" \
  "$APPNAME is a shell script that setup a development environment \
for Ubuntu and its derivatives (Kubuntu, Xubuntu, etc.)  In the next windows, \
you will have to choose the applications you want installed in your environment."
}

function get_packages
{
  #Get SCM list
  SCM_PKG=`dialog_multi_choice "Please choose the source control manager you want to install." subversion cvs mercurial git`

  #Get DBMS List
  DBMS_PKG=`dialog_multi_choice "Please choose the databases you want to install." mysql postgresql sqlite3`

  #Get Java packages
  JAVA_PKG=`dialog_multi_choice "Please choose the Java packages you want to install." jdk ant junit log4j jdbc_mysql jdbc_postgresql`

  #Get Ruby environment
  RUBYENV_PKG=`dialog_multi_choice "Please choose the ruby and ruby related package you want to install." ruby gem rails mongrel rubyzip vim-rails capistrano rspec heroku`

  #Get Math tools choices
  MATHTOOLS_PKG=`dialog_multi_choice "Please choose the mathtools you want to install." scilab octave gnuplot`
  if [ "$MATHTOOLS_PKG" = "none" ]; then
    MATHTOOLS_PKG=""
  fi

  #Get Miscallenous tools choices
  MISCTOOLS_PKG=`dialog_multi_choice "Please choose the miscellanous tools you want to install." bouml geany scons xclip`

    #Check if user wants NetBeans and that JDK is selected (pre-requisite)
    JAVA_JDK=""
    for pkg in $JAVA_PKG; do
      if [ "$pkg" = "jdk" ]; then
        JAVA_JDK="present"
      fi
    done

  if [ "$JAVA_JDK" = "present" ]; then

    dialog_question "NetBeans IDE" "Do you want to install the NetBeans IDE?"
    case $? in
    0)
      NETBEANS_PKG="netbeans";;
    1)
      NETBEANS_PKG="";;
    esac
  fi

  #Check if user wants C++ build suite
  dialog_question "C++ Build Tools" "Do you want to install C++ Build Tools (several packages)?"
  case $? in
    0)
      CPPENV_PKG="cpp";;
    1)
      CPPENV_PKG="";;
  esac
}

#*******************************************************************************
# MAIN PROGRAM
#*******************************************************************************

#*** Initialization ***
#Set Dialog tool
DIALOG=
DIALOG_TYPE=
find_dialog

#Set application name & version
APPNAME=`basename $0`
VERSION="Version: 2.0_20100701"
APTGETCMD=

#Set Default option values
BACKUP=n
LOCAL_SOURCE=n
PACKAGE_PATH=
QUIET_MODE=n
GUI_MODE=y
SIM_MODE=n

#Parse command line options (if any)
while getopts bhl:nqsv OPTIONS
do
  case "$OPTIONS" in
      b)  echo "Option -$OPTIONS is not implemented yet."
        BACKUP=y;;

      h)  show_usage
        exit 0;;

      l)  echo "Option -$OPTIONS is not implemented yet.";;

      n)  GUI_MODE=n
        set_console_display;;

      q)  QUIET_MODE=y;;

      s)  SIM_MODE=y;;

      v)  show_version;;

      *)  echo "Unknown option. Please use -h option to display command usage."
        exit 1;;
  esac
done

init_temp_dir
init_aptget_options
show_welcome_msg

#Collect user choice of packages to install
SCM_PKG=
DBMS_PKG=
JAVA_PKG=
NETBEANS_PKG=
CPPENV_PKG=
RUBYENV_PKG=
MATHTOOLS_PKG=
MISCTOOLS_PKG=
JAVA_JDK=

get_packages

#--- DEBUG ---
#for scm in $SCM_PKG; do echo $scm; done
#for dbms in $DBMS_PKG; do echo $dbms; done
#for java in $JAVA_PKG; do echo $java; done
#for netbeans in $NETBEANS_PKG; do echo $netbeans; done
#for cppenv in $CPPENV_PKG; do echo $cppenv; done
#for rubyenv in $RUBYENV_PKG; do echo $rubyenv; done
#for mathtools in $MATHTOOLS_PKG; do echo $mathtools; done
#for misctools in $MISCTOOLS_PKG; do echo $misctools; done
# -----------------------------------------------------------------------------

#Ask for a confirmation before altering user's system
dialog_question "Confirmation" "Are you sure you want to proceed with the installation?"
case $? in
  0)
    echo "Proceed with the installation.";;
  1)
    echo "Installation aborted."
    exit 0;;
esac

#Proceed with mandatory installation procedures
update_packages
install_mandatories

#Process user choices
install_scm
install_dbms
install_java
if [ "$NETBEANS_PKG" = "netbeans" ]; then
  install_netbeans;
fi
if [ "$CPPENV_PKG" = "cpp" ]; then
  install_cppenv;
fi
install_rubyenv
install_mathtools
install_misctools

cleanup

echo "Installation completed."
exit 0
