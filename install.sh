#!/bin/bash
VERSION=0.1.0

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo "Downloading debian client."
  curl -LO https://github.com/TheMindCompany/kubelog/releases/download/${VERSION}/debian
  echo "Installing KubeLOG ${VERSION}"
  chmod +x debian
  mv debian /usr/local/bin/kubelog
elif [[ "$OSTYPE" == "cygwin" ]]; then
  echo "Downloading debian client."
  curl -LO https://github.com/TheMindCompany/kubelog/releases/download/${VERSION}/debian
  echo "Installing KubeLOG ${VERSION}"
  chmod +x debian
  mv debian /usr/local/bin/kubelog
elif [[ "$OSTYPE" == "debian"* ]]; then
  echo "Downloading debian client."
  curl -LO https://github.com/TheMindCompany/kubelog/releases/download/${VERSION}/debian
  echo "Installing KubeLOG ${VERSION}"
  chmod +x debian
  mv debian /usr/local/bin/kubelog
elif [[ "$OSTYPE" == "msys" ]]; then
  echo "Downloading debian client."
  curl -LO https://github.com/TheMindCompany/kubelog/releases/download/${VERSION}/debian
  echo "Installing KubeLOG ${VERSION}"
  chmod +x debian
  mv debian /usr/local/bin/kubelog
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  echo "Downloading debian client."
  curl -LO https://github.com/TheMindCompany/kubelog/releases/download/${VERSION}/debian
  echo "Installing KubeLOG ${VERSION}"
  chmod +x debian
  mv debian /usr/local/bin/kubelog
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Downloading darwin client."
  curl -LO https://github.com/TheMindCompany/kubelog/releases/download/${VERSION}/darwin
  echo "Installing KubeLOG ${VERSION}"
  chmod +x darwin
  mv darwin /usr/local/bin/kubelog
else
  printf "System not supported. Attempting to build from source. You must have rust installed."
  curl -LO https://github.com/TheMindCompany/kubelog/archive/${VERSION}.tar.gz
  tar -xvzf ${VERSION}.tar.gz
  cd ${VERSION}
  cargo build --release
  chmod +x target/release/kubelog
  mv target/release/kubelog /usr/local/bin/kubelog
  cd ..
  rm -rf kubelog-${VERSION}
fi

exit 0
