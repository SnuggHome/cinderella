echo "Ensuring we have the latest version of snuggie installed"
echo "A first time install takes about 45 minutes on a modern machine"

set -x

mkdir -p ~/.snuggie
echo "Run started `date`" >> ~/.snuggie/bootstrap.log 2>&1
which ruby >> ~/.snuggie/bootstrap.log 2>&1
which gem  >> ~/.snuggie/bootstrap.log 2>&1

if [ `gem --version` != "1.7.2" ]; then
  echo "You need to upgrade rubygems to 1.7.2"
fi

which gem | grep -q rvm
if [ $? -eq 0 ]; then
  gem uninstall snuggie -aIx              >> ~/.snuggie/bootstrap.log 2>&1
  gem install   snuggie --no-rdoc --no-ri --source http://gem-source.snugghome.com >> ~/.snuggie/bootstrap.log 2>&1
else
  sudo gem uninstall snuggie -aIx              >> ~/.snuggie/bootstrap.log 2>&1
  sudo gem install   snuggie --no-rdoc --no-ri --source http://gem-source.snugghome.com >> ~/.snuggie/bootstrap.log 2>&1
  sudo gem update                                 >> ~/.snuggie/bootstrap.log 2>&1
fi

echo "Snuggie installed successfully"

function run_snuggie {
  hash -r
  if [ -f ~/.snuggie.profile ]; then
    source ~/.snuggie.profile
  fi
  snuggie
  if [ "$?" -eq "0" ]; then
    exit 0
  fi
}

# try snuggie three times just in case shit gets weird
run_snuggie
run_snuggie
run_snuggie

cat ~/.snuggie/bootstrap.log
echo ""
echo "Something went wrong with the install. :("
echo "Dump this log into a gist and link to me to it"
echo "http://github.com/atmos/snuggie/issues"
echo "Sorry it failed. :("
