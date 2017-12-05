REBAR ?= ./rebar3

.PHONY: all clean distclean doc shell test

all: $(REBAR)
	$(REBAR) compile

clean: $(REBAR)
	$(REBAR) clean

doc: $(REBAR)
	$(REBAR) edoc

shell: $(REBAR)
	$(REBAR) shell

test: $(REBAR)
	$(REBAR) dialyzer
	$(REBAR) eunit
	$(REBAR) cover

./rebar3:
	wget "https://github.com/erlang/rebar3/releases/download/3.3.5/rebar3" -O $@-part
	chmod +x $@-part
	mv $@-part $@
