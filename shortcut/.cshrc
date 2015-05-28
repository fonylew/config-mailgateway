# $FreeBSD: releng/10.1/etc/root/dot.cshrc 243893 2012-12-05 13:56:39Z eadler $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

alias h		history 25
alias j		jobs -l
alias la	ls -aF
alias lf	ls -FA
alias ll	ls -lAF
alias dmail	~/testmail.sh
alias pmail	~/promptmail.sh
alias tmail	~/touser3mail.sh
alias cdm	cd /var/mail
alias cd..	cd ..
alias cdgit	cd ~/config-mailgateway
alias mlog	vim /var/log/maillog
alias alog	cat /var/log/maillog|grep amavisd
alias plog	cat /var/log/maillog|grep postfix
alias lo0	vim /var/log/local0
alias ulocal	cd /usr/local/etc
alias saconf	vim /usr/local/etc/mail/spamassassin/local.cf
alias aconf	vim /usr/local/etc/amavisd.conf
alias tdir	cd /home/user3/Maildir

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)

	setenv	EDITOR	vi
	setenv	PAGER	more
	setenv	BLOCKSIZE	K

	if ($?prompt) then
# An interactive shell -- set some stuff up
	set prompt = "%N@%m:%~ %# "
	set promptchars = "%#"

	set filec
	set history = 1000
set savehist = (1000 merge)
	set autolist = ambiguous
# Use history to aid expansion
	set autoexpand
	set autorehash
set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
	bindkey "^W" backward-delete-word
	bindkey -k up history-search-backward
	bindkey -k down history-search-forward
	endif

	endif
