#!/bin/bash

BASE_DIR="/vagrant"
PACKAGE_DIR="${BASE_DIR}/package"
MAVEN_TARGET_VERSION="apache-maven-3.3.3"
MAVEN_FILE_NAME="${MAVEN_TARGET_VERSION}-bin"
ARCHIVED_MAVEN_FILE_NAME="${MAVEN_FILE_NAME}.tar.gz"
MAVEN_URL="http://ftp.jaist.ac.jp/pub/apache/maven/maven-3/3.3.3/binaries/${ARCHIVED_MAVEN_FILE_NAME}"

# create dir
if [ ! -d ${PACKAGE_DIR} ]
then
  mkdir -p ${PACKAGE_DIR}
else
  echo "${PACKAGE_DIR} Is Already Exists So Need Not Create"
fi

# if "archived tomcat file" is noting
if [ ! -f ${PACKAGE_DIR}/${ARCHIVED_MAVEN_FILE_NAME} ]
then
  echo "downloading maven file..."
  wget ${MAVEN_URL} -O ${PACKAGE_DIR}/${ARCHIVED_MAVEN_FILE_NAME}
else
  echo "${ARCHIVED_MAVEN_FILE_NAME} Is Already Exists So Need Not Wget"
fi

# gunzip "archived maven file"
if [ ! -d /usr/local/${MAVEN_TARGET_VERSION} ]
then
  echo "setup maven..."
  cp -p ${PACKAGE_DIR}/${ARCHIVED_MAVEN_FILE_NAME} /tmp/${ARCHIVED_MAVEN_FILE_NAME}
  tar -xvzf /tmp/${ARCHIVED_MAVEN_FILE_NAME} -C /tmp/
  sudo mv /tmp/${MAVEN_TARGET_VERSION} /usr/local/${MAVEN_TARGET_VERSION}
  sudo chown -R vagrant:vagrant /usr/local/${MAVE_FILE_NAME}
  sudo ln -s /usr/local/${MAVEN_TARGET_VERSION} /usr/local/maven
else
  echo "/usr/local/${MAVEN_TARGET_VERSION} Is Already Exists"
fi

sudo cat /etc/profile | grep "M2_HOME"
if [ "$?" -eq 1 ]
then
  echo "M2_HOME is noting So append /etc/profile"
  sudo echo 'export M2_HOME=/usr/local/maven' >> /etc/profile
  sudo echo 'export M2=$M2_HOME/bin' >> /etc/profile
  sudo echo 'export PATH=$M2:$PATH' >> /etc/profile
else
  echo "M2_HOME is Already Appended"
fi
