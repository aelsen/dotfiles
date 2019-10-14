# # Install remark
# REMARK_TAR_DIR=regex-markup-0.10.0

# if [ ! -x "$(command -v remark)" ]; then
# 	echo -e "Installing remark";
#   REMARK_PWD=$PWD
#   wget -O /tmp/$REMARK_TAR_DIR.tar.gz http://savannah.nongnu.org/download/regex-markup/$REMARK_TAR_DIR.tar.gz
#   tar -xzvf /tmp/$REMARK_TAR_DIR.tar.gz -C /tmp/
#   cd /tmp/$REMARK_TAR_DIR/
#   ./configure
#   make
#   sudo make install
#   cd $REMARK_PWD
#   # rm -r /tmp/${REMARK_TAR_DIR}*
# else
# 	MACRO_DEBUG "remark already installed";
# fi;