function x()
{
    # Extracteur universel v1.3
    # (C) 2008-2009 Arkanosis
    # arkanosis@gmail.com
    for arg; do
	case $arg in
	    *.(tar.bz2|tbz2))
                if ((`tar tvjf $arg | sed 's@.*[ \t]\\([^ \t/]\+\\)\\(/.*\\)\?$@\1@' | sort -u | wc -l` > 1)); then
		    echo 'No root directory. Create one?'
		    read y
		    if [[ $y = (y|Y) ]]; then
			dir=`echo $arg | sed 's/\.\(tbz2\|tar\.bz2\)$//'`
			mkdir $dir
			pushd $dir
			echo 'n' | x ../$arg
			popd
			continue
		    fi
		fi

		print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1mBZip2\e[0;32m compressed archive)...\e[0m"
		tar xvjf $arg
	    ;;
	    *.(tar.gz|tgz))
                if ((`tar tvzf $arg | sed 's@.*[ \t]\\([^ \t/]\+\\)\\(/.*\\)\?$@\1@' | sort -u | wc -l` > 1)); then
		    echo 'No root directory. Create one?'
		    read y
		    if [[ $y = (y|Y) ]]; then
			dir=`echo $arg | sed 's/\.\(tgz\|tar\.gz\)$//'`
			mkdir $dir
			pushd $dir
			echo 'n' | x ../$arg
			popd
			continue
		    fi
		fi

		print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1mGZip\e[0;32m compressed archive)...\e[0m"
		tar xvzf $arg
	    ;;
	    *.(tar.xz|txz))
	        print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1mXz\e[0;32m compressed archive)...\e[0m"
		7za x $arg

		tarball=`echo $arg | sed 's/\.xz$//'`

                if ((`tar tvf $tarball | sed 's@.*[ \t]\\([^ \t/]\+\\)\\(/.*\\)\?$@\1@' | sort -u | wc -l` > 1)); then
		    echo 'No root directory. Create one?'
		    read y
		    if [[ $y = (y|Y) ]]; then
			dir=`echo $tarball | sed 's/\.tar$//'`
			mkdir $dir
			pushd $dir
			echo 'n' | x ../$tarball
			popd
			continue
		    fi
		fi
		tar xvf $tarball
		rm $tarball
	    ;;
	    *.7z)
	        print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1m7-Zip\e[0;32m compressed archive)...\e[0m"
		7za x $arg
	    ;;
	    *.xz)
	        print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1mXz\e[0;32m compressed file)...\e[0m"
		7za x $arg
	    ;;
	    *.bz2)
	        print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1mBZip2\e[0;32m compressed file)...\e[0m"
		bunzip2 $arg
	    ;;
	    *.gz)
	        print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1mGZip\e[0;32m compressed file)...\e[0m"
		gunzip $arg
	    ;;
	    *.(zip|jar))
                if ((`unzip -l $arg | tail -n +4 | head -n -2 | sed 's@[ \t]*[0-9]\+[ \t]\+[0-1][0-9]-[0-3][0-9]-[0-9][0-9][ \t]\+[0-2][0-9]:[0-6][0-9][ \t]\+\\([^ \t]\+\\)@\1@' | sort -u | wc -l` > 1)); then
		    echo 'No root directory. Create one?'
		    read y
		    if [[ $y = (y|Y) ]]; then
			dir=`echo $arg | sed 's/\.\(zip\|jar\)$//'`
			mkdir $dir
			pushd $dir
			echo 'n' | x ../$arg
			popd
			continue
		    fi
		fi

	        print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1mZip\e[0;32m compressed archive)...\e[0m"
		unzip $arg
	    ;;
	    *.Z)
	        print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1mZ\e[0;32m compressed file)...\e[0m"
		uncompress $arg
	    ;;
	    *.docx)
	        print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1mOpenXML\e[0;32m text document)...\e[0m"
		unzip $arg
	    ;;
	    *.tar)
                if ((`tar tvf $arg | sed 's@.*[ \t]\\([^ \t/]\+\\)\\(/.*\\)\?$@\1@' | sort -u | wc -l` > 1)); then
		    echo 'No root directory. Create one?'
		    read y
		    if [[ $y = (y|Y) ]]; then
			dir=`echo $arg | sed 's/\.tar$//'`
			mkdir $dir
			pushd $dir
			echo 'n' | x ../$arg
			popd
			continue
		    fi
		fi

		print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1mNon-compressed\e[0;32m archive)...\e[0m"
		tar xvf $arg
	    ;;
	    *.deb)
	        print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1mDebian\e[0;32m package)...\e[0m"
		dpkg-deb -x $arg `echo $arg | sed 's/\.deb$//'`
	    ;;
	    *.xpi)
	        print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1mxpi\e[0;32m plugin)...\e[0m"
		unzip $arg
	    ;;
	    *.rar)
	        print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1mRar\e[0;32m compressed archive)...\e[0m"
		unrar e $arg
	    ;;
	    *)
	        print "\e[91mCannot extract \e[1m$arg\e[0;31m (\e[1mUnknown\e[0;31m archive type)...\e[0m"
	    ;;
        esac
    done
}

function t()
{
    # Listeur universel v1.3
    # (C) 2008-2009 Arkanosis
    # arkanosis@gmail.com
    for arg; do
	case $arg in
	    *.(tar.bz2|tbz2))
                print "\e[32mListing \e[1m$arg\e[0;32m (\e[1mBZip2\e[0;32m compressed archive)...\e[0m"
		tar tvjf $arg
	    ;;
	    *.(tar.gz|tgz))
	        print "\e[32mListing \e[1m$arg\e[0;32m (\e[1mGZip\e[0;32m compressed archive)...\e[0m"
		tar tvzf $arg
	    ;;
	    *.(tar.xz|txz))
	        print "\e[32mExtracting \e[1m$arg\e[0;32m (\e[1mXz\e[0;32m compressed archive)...\e[0m"
		7za x $arg
		tarball=`echo $arg | sed 's/\.xz$//'`
		tar tvf $tarball
		rm $tarball
	    ;;
	    *.7z)
	        print "\e[32mListing \e[1m$arg\e[0;32m (\e[1m7-Zip\e[0;32m compressed archive)...\e[0m"
		7za l $arg
	    ;;
	    *.bz2)
	        print "\e[32mListing \e[1m$arg\e[0;32m (\e[1mBZip2\e[0;32m compressed file)...\e[0m"
		echo $arg | sed -e 's/.bz2$//'
	    ;;
	    *.gz)
	        print "\e[32mListing \e[1m$arg\e[0;32m (\e[1mGZip\e[0;32m compressed file)...\e[0m"
		echo $arg | sed -e 's/.gz$//'
	    ;;
	    *.(zip|jar))
	        print "\e[32mListing \e[1m$arg\e[0;32m (\e[1mZip\e[0;32m compressed archive)...\e[0m"
		unzip -l $arg
	    ;;
	    *.docx)
	        print "\e[32mListing \e[1m$arg\e[0;32m (\e[1mOpenXML\e[0;32m text document)...\e[0m"
		unzip -l $arg
	    ;;
	    *.tar)
	        print "\e[32mListing \e[1m$arg\e[0;32m (\e[1mNon-compressed\e[0;32m archive)...\e[0m"
		tar tvf $arg
	    ;;
	    *.deb)
	        print "\e[32mListing \e[1m$arg\e[0;32m (\e[1mDebian\e[0;32m package)...\e[0m"
		dpkg -c $arg
	    ;;
	    *.xpi)
	        print "\e[32mListing \e[1m$arg\e[0;32m (\e[1mxpi\e[0;32m plugin)...\e[0m"
		unzip -l $arg
	    ;;
	    *.rar)
	        print "\e[32mListing \e[1m$arg\e[0;32m (\e[1mRar\e[0;32m compressed archive)...\e[0m"
		unrar l $arg
	    ;;
	    *)
	        print "\e[91mCannot list \e[1m$arg\e[0;31m (\e[1mUnknown\e[0;31m archive type)...\e[0m"
	    ;;
	esac
    done
}
