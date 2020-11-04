# Project:   PingModule


# Toolflags:
CCflags = -c -depend !Depend -IC: -throwback -zM -w  
Linkflags = -m -o $@ 
ObjAsmflags = -depend !Depend -Stamp -quit -CloseExec
CMHGflags = 
LibFileflags = -c -o $@
Squeezeflags = -o $@


# Final targets:
@.PingModule:   @.o.CModuleHdr @.o.cmodule C:o.Stubs 
        Link $(Linkflags) @.o.CModuleHdr @.o.cmodule C:o.Stubs 


# User-editable dependencies:
clean:
	remove h.ModHdr
	remove o.CModuleHdr
	remove o.cmodule
	remove PingModule

# Static dependencies:
@.o.CModuleHdr:   @.cmhg.CModuleHdr
        cmhg @.cmhg.CModuleHdr -o @.o.CModuleHdr
@.o.cmodule:   @.c.cmodule
        cc $(ccflags) -o @.o.cmodule @.c.cmodule 


# Dynamic dependencies:
o.cmodule: c.cmodule C:h.kernel ^.h.mbuf_c
o.cmodule: c.cmodule C:h.kernel ^.h.mbuf_c
o.cmodule: c.cmodule C:h.kernel ^.h.mbuf_c
