function get_java_home {
  # get the platform name
  local platform=`uname -s`

  if [[ $platform = "Darwin" ]]; then
    echo "/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"
  else # print blank
    echo ""
  fi
}

# If JAVA_HOME has length eq to zero
# we start with initialization, otherwise
# we skip
if [ -z $JAVA_HOME ]
then
  JAVA_HOME=`get_java_home`
  export JAVA_HOME
fi
