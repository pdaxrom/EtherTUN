# Project:   EtherRPCEm


# Toolflags:
CCflags = -c -depend !Depend -IC: -throwback -zM -Wp
C++flags = -c -depend !Depend -IC: -throwback -zM 
Linkflags = -rmf -c++ -o $@ 
ObjAsmflags = -throwback -NoCache -depend !Depend 
CMHGflags = -d h.ModHdr  -throwback 
LibFileflags = -c -o $@
Squeezeflags = -o $@


# Final targets:
EtherRPCEm: @.o.Module @.o.intveneer @.o.ModHdr
        Link $(Linkflags) @.o.Module @.o.intveneer @.o.ModHdr C:o.stubs


# User-editable dependencies:
clean:
	remove c.AutoSense
	remove h.ModHdr
	remove o.intveneer
	remove o.ModHdr
	remove o.Module
	remove EtherRPCEm

c.AutoSense: AutoSense.EtherRPCEm
	bin2c -t "const unsigned char" -n autosense_file $? $@

# Static dependencies:
@.o.Module:   @.c.Module
        cc $(ccflags) -o @.o.Module @.c.Module 
@.o.intveneer:   @.s.intveneer
        objasm $(objasmflags) -from @.s.intveneer -to @.o.intveneer

# A dependency with dummy action, because the cmhg file produces two
# outputs (h.ModHdr and o.ModHdr)
h.ModHdr: cmhg.ModHdr
	|echo

@.o.ModHdr:   @.cmhg.ModHdr
        cmhg $(cmhgflags)  @.cmhg.ModHdr -o @.o.ModHdr 


# Dynamic dependencies:
o.Module:	c.Module
o.Module:	C:h.kernel
o.Module:	C:h.swis
o.Module:	h.ModHdr
o.Module:	h.Defines
o.Module:	h.Structs
o.Module:	h.mbuf_c
o.Module:	h.DCI
o.Module:	h.Module
o.Module:	h.DCI
o.Module:	c.AutoSense
o.intveneer: s.intveneer h.Equates
