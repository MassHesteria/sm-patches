# platform detection
ifeq ($(platform),)
  ifeq ($(OS),Windows_NT)
    platform := windows
	 build := ../tools/win/xkas.exe
  endif
endif

ifeq ($(platform),)
  uname := $(shell uname)
  ifeq ($(uname),)
    platform := windows
	 build := ../tools/win/xkas.exe
  else ifneq ($(findstring Windows,$(uname)),)
    platform := windows
  else ifneq ($(findstring NT,$(uname)),)
    platform := windows
  else ifneq ($(findstring Darwin,$(uname)),)
    platform := macos
	 build := ../tools/osx/xkas
  else ifneq ($(findstring Linux,$(uname)),)
    platform := linux
  else ifneq ($(findstring BSD,$(uname)),)
    platform := bsd
  else
    $(error unknown platform, please specify manually.)
  endif
endif

test: release

release:
	@cp ../tools/SuperMetroid.sfc quickmet.sfc
	$(build) quickmet.asm quickmet.sfc
