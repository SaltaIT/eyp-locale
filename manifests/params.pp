class locale::params {

	case $::osfamily
	{
		'Debian':
		{
		}

		#http://unix.stackexchange.com/questions/140299/locale-gen-command-in-centos6

		default: { fail("Unsupported OS!")  }
	}
}
