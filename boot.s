//Initialization part of the AArch64 kernel.
//Will be loaded starting at address 0x80000.

.section ".text.boot"

.global boot_start


//Entry point
//Registers x0, x1, x2 should be preserved for kernel_main()
boot_start:
	//grow stack downwards from kernel base address
	mov sp, #0x80000
	
	//zero-init the bss	
	ldr x3, =seg_bss_begin
	ldr x4, =seg_bss_end
	mov x5, #0
loop:
	cmp x3, x4
	b.hs loop_end
	stp x5, x5, [x3]
	b loop
loop_end:
	ldr x3, =kernel_main
	blr x3

	//kernel returned, stop
halt:
	wfe
	b halt
