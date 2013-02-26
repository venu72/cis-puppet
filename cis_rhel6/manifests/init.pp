# CIS Control-puppet module by Arild Jensen <ajensen@counter-attack.com>
# Latest version is available from https://github.com/arildjensen/

# Based on CIS_Red_Hat_Enterprise_Linux_6_Benchmark_v1.1.0 available from
# cisecurity.org. Only scorable controls have been translated to puppet code.
# The specific controls from the benchmark are listed as comments in front of
# the puppet code covering those controls.

#-----------------------------------------------------------------------------

# DISCLAIMER OF WARRANTIES

# Licensor disclaims to the fullest extent authorized by law any and all other
# warranties, whether express or implied, including, without limitation, any
# implied warranties of title, non-infringement, quiet enjoyment, integration,
# merchantability or fitness for a particular purpose.

# You assume responsibility for selecting the software to achieve your
# intended results, and for the results obtained from your use of the software.
# You shall bear the entire risk as to the quality and the performance of the
# software.

#-----------------------------------------------------------------------------

class cis_rhel6 {

# CIS Control 1.1.1
# CIS Control 1.1.2
# CIS Control 1.1.3
# CIS Control 1.1.4
# CIS Control 1.1.5
# CIS Control 1.1.6
# CIS Control 1.1.7
# CIS Control 1.1.8
# CIS Control 1.1.9
# CIS Control 1.1.10
# CIS Control 1.1.14
# CIS Control 1.1.15
# CIS Control 1.1.16
file {'/etc/fstab':
	content => template("cis_rhel6/etc/fstab"),
	owner   => root,
	group   => root,
	mode    => 0600
	}

# CIS Control 1.1.17
file {'/tmp':
	mode => 1777
	}

# CIS Control 1.2.2
package {'gpg-pubkey':
	ensure => installed
	}

# CIS Control 1.2.3
file {'/etc/yum.conf':
	content => template("cis_rhel6/etc/yum.conf")
	}

# CIS Control 1.3.1
package {'aide':
	ensure => installed
	}

# CIS Control 1.3.2
cron { aide-check:
	command => "/usr/sbin/aide --check",
	user    => root,
	hour    => 5,
	minute  => 0
} # Note: The command can be run at any time as long as it is regular

# CIS Control 1.4.1
# CIS Control 5.2.3
file{'/etc/default/grub':
	content => template("cis_rhel6/etc/default/grub")
	}

# CIS Control 1.4.2
# CIS Control 1.4.3
file {'/etc/selinux/config':
	content => template("cis_rhel6/etc/selinux/config")
	}

# CIS Control 1.4.4
package {'setroubleshoot':
	ensure => absent
	}

# CIS Control 1.4.5
package {'mcstrans':
	ensure => absent
	}

# CIS Control 1.4.6 -- Not configurable via puppet

# CIS Control 1.5.1
file {'/etc/grub.conf':
	owner: root,
	group: root,
	mode:  0600
	}

# CIS Control 1.5.3 -- Not configurable via puppet

# CIS Control 1.5.4
# CIS Control 1.5.5
# CIS Control 3.1
file {'/etc/sysconfig/init':
	template("cis_rhel6/etc/sysconfig/init")
	}

# CIS Control 1.6.1
file {'/etc/security/limits.conf':
	template("cis_rhel6/etc/security/limits.conf")
	}

# CIS Control 1.6.1
# CIS Control 1.6.2
# CIS Control 1.6.3
# CIS Control 4.1.1
# CIS Control 4.1.2
# CIS Control 4.2.1
# CIS Control 4.2.2
# CIS Control 4.2.3
# CIS Control 4.2.4
# CIS Control 4.2.5
# CIS Control 4.2.6
# CIS Control 4.2.7
# CIS Control 4.2.8
file {'/etc/sysctl.conf':
	template("cis_rhel6/etc/sysctl.conf")
	}
	
# CIS Control 2.1.1
package {'telnet-server':
	ensure => absent
	}

# CIS Control 2.1.2
package {'telnet':
	ensure => absent
	}

# CIS Control 2.1.3
package {'rsh-server':
	ensure => absent
	}

# CIS Control 2.1.4
package {'rsh':
	ensure => absent
	}

# CIS Control 2.1.5
package {'ypbind':
	ensure => absent
	}

# CIS Control 2.1.6
package {'ypserv':
	ensure => absent
	}

# CIS Control 2.1.7
package {'tftp':
	ensure => absent
	}

# CIS Control 2.1.8
package {'tftp-server':
	ensure => absent
	}

# CIS Control 2.1.9
package {'talk':
	ensure => absent
	}

# CIS Control 2.1.10
package {'talk-server':
	ensure => absent
	}

# CIS Control 2.1.11
package {'xinetd':
	ensure => absent
	}

# CIS Control 2.1.12
package {'chargen-dgram':
	ensure => absent
	}

# CIS Control 2.1.13
package {'chargen-stream':
	ensure => absent
	}

# CIS Control 2.1.14
package {'daytime-dgram':
	ensure => absent
	}

# CIS Control 2.1.15
package {'daytime-stream':
	ensure => absent
	}

# CIS Control 2.1.16
package {'echo-dgram':
	ensure => absent
	}

# CIS Control 2.1.17
package {'echo-stream':
	ensure => absent
	}

# CIS Control 2.1.18
package {'tcpmux-server':
	ensure => absent
	}

# CIS Control 3.2
package {'xorg-x11-libs':
	ensure => absent
	}

# CIS Control 3.3
package {'avahi-daemon':
	ensure => absent
	}

# CIS Control 3.5
package {'dhcp':
	ensure => absent
	}

# CIS Control 3.6
package {'ntp':
	ensure => installed
	}
file {'/etc/ntp.conf':
	template("cis_rhel6/etc/ntp.conf"),
	owner => root,
	group => root,
	mode  => 0640
	}
file {'/etc/sysconfig/ntpd':
	template("cis_rhel6/etc/sysconfig/ntpd"),
	owner => root,
	group => root,
	mode  => 0640
	}

# CIS Control 3.16
file {'/etc/postfix/main.cf':
	template("cis_rhel6/etc/postfix/main.cf"),
	owner => root,
	group => root,
	mode  => 0640
	}

# CIS Control 4.5.3
file {'/etc/hosts.allow':
	owner => root,
	group => root,
	mode  => 0644
	}

# CIS Control 4.5.5
file {'/etc/hosts.deny':
	owner => root,
	group => root,
	mode  => 0644
	}	

# CIS Control 4.7
package {'iptables':
	ensure => installed
	}
service {'iptables':
	enable => true
	}

# CIS Control 5.1.1
package {'rsyslog':
	ensure => installed
	}

# CIS Control 5.1.2
service {'rsyslog':
	enable => true
	}

# CIS Control 5.1.4
file {'/var/log/messages':
	owner => root,
	group => root,
	mode  => 0600
	}
file {'/var/log/secure':
	owner => root,
	group => root,
	mode  => 0600
	}
file {'/var/log/maillog':
	owner => root,
	group => root,
	mode  => 0600
	}
file {'/var/log/cron':
	owner => root,
	group => root,
	mode  => 0600
	}
file {'/var/log/spooler':
	owner => root,
	group => root,
	mode  => 0600
	}
file {'/var/log/boot.log':
	owner => root,
	group => root,
	mode  => 0600
	}

# CIS Control 5.1.5
file {'/etc/rsyslog.conf':
	content => template("cis_rhel6/etc/rsyslog.conf")
	}

# CIS Control 5.2.1.3
file {'/etc/rsyslog.conf':
	content => template("cis_rhel6/etc/audit/auditd.conf")
	}

# CIS Control 5.2.2
service {'auditd':
	enable => true
	}

# CIS Control 5.2.4
# CIS Control 5.2.5
# CIS Control 5.2.6
# CIS Control 5.2.7
# CIS Control 5.2.8
# CIS Control 5.2.9
# CIS Control 5.2.10
# CIS Control 5.2.11
# CIS Control 5.2.13
# CIS Control 5.2.14
# CIS Control 5.2.15
# CIS Control 5.2.16
file {'/etc/rsyslog.conf':
	content => template("cis_rhel6/etc/audit/audit.rules")
	}

# CIS Control 5.2.12 -- Not doable with Puppet

} # End class definition
