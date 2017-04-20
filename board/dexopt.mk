# Use dmalloc() for such low memory devices like us
MALLOC_SVELTE := true
BOARD_USES_LEGACY_MMAP := true

# Enable dex-preoptimization to speed up the first boot sequence
#WITH_DEXPREOPT := true
#WITH_DEXPREOPT_PIC := true
#WITH_DEXPREOPT_COMP := false