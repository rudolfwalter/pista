ENTRY(boot_start)

SECTIONS
{
	. = 0x80000; /*Address at which 64-bit kernel is loaded on the RasPi*/
	kernel_begin = .;

	PROVIDE(seg_text_begin = .);
	.text :
	{
		KEEP(*(.text.boot))
		*(.text)
	}
	. = ALIGN(4096);
	PROVIDE(seg_text_end = .);

	PROVIDE(seg_rodata_begin = .);
	.rodata :
	{
		*(.rodata)
	}
	. = ALIGN(4096);
	PROVIDE(seg_rodata_end = .);

	PROVIDE(seg_data_begin = .);
	.data :
	{
		*(.data)
	}
	. = ALIGN(4096);
	PROVIDE(seg_data_end = .);

	PROVIDE(seg_bss_begin = .);
	.bss :
	{
		*(.bss)
	}
	. = ALIGN(4096);
	PROVIDE(seg_bss_end = .);

	kernel_end = .;
}
