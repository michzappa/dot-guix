HOST = $(shell hostname)

all: home-config system-config

%-config:
	echo "(use-modules (mz machines $(HOST))) $@" > $@

build-%: %-config $(PWD)/mz/machines/$(HOST).scm
	guix $* -L $(PWD) build $<

reconfigure-%: %-config $(PWD)/mz/machines/$(HOST).scm
	guix $* -L $(PWD) reconfigure $<

clean:
	rm -f home-config
	rm -f system-config
