# Project:   PingModule


# Toolflags:
CCflags = -c -depend !Depend -IC: -throwback -zM -w  
Linkflags = -m -o $@ 
ObjAsmflags = -depend !Depend -Stamp -quit -CloseExec
CMHGflags = 
LibFileflags = -c -o $@
Squeezeflags = -o $@


# Final targets:
@.PingModule:   @.o.CModuleHdr @.o.CModule @.o.intveneer C:o.Stubs
        Link $(Linkflags) @.o.CModuleHdr @.o.CModule @.o.intveneer C:o.Stubs


# User-editable dependencies:
clean:
	remove h.ModHdr
	remove o.CModuleHdr
	remove o.CModule
	remove o.intveneer
	remove PingModule

# Static dependencies:
@.o.CModuleHdr:   @.cmhg.CModuleHdr
        cmhg @.cmhg.CModuleHdr -o @.o.CModuleHdr
@.o.CModule:   @.c.CModule
        cc $(ccflags) -o @.o.CModule @.c.CModule 
@.o.intveneer:   @.s.intveneer
        objasm $(objasmflags) -from @.s.intveneer -to @.o.intveneer


# Dynamic dependencies:
o.CModule: c.CModule C:h.kernel ^.h.mbuf_c
o.CModule: c.CModule C:h.kernel ^.h.mbuf_c
