# platform detection
ifeq ($(platform),)
  ifeq ($(OS),Windows_NT)
    platform := windows
	 build := ../tools/win/bass.exe
  endif
endif

ifeq ($(platform),)
  uname := $(shell uname)
  ifeq ($(uname),)
    platform := windows
	 build := ../tools/win/bass.exe
  else ifneq ($(findstring Windows,$(uname)),)
    platform := windows
  else ifneq ($(findstring NT,$(uname)),)
    platform := windows
  else ifneq ($(findstring Darwin,$(uname)),)
    platform := macos
	 build := ../tools/osx/bass
  else ifneq ($(findstring Linux,$(uname)),)
    platform := linux
  else ifneq ($(findstring BSD,$(uname)),)
    platform := bsd
  else
    $(error unknown platform, please specify manually.)
  endif
endif

test: release
	$(build) -m credits.sfc test_credits.asm

release:
	@cp ../tools/SuperMetroid.sfc credits.sfc
	$(build) -m credits.sfc credits.asm