# Static Library Build Report

## 1. Makefile Comparison: Part 2 vs Part 3
- Part 2 (Multifile Build): All .c files compiled together.
- Part 3 (Static Library Build): Utility functions compiled into a static library (lib/libmyutils.a) and main program linked against it.
- Key difference: Part 3 uses `ar` to bundle object files and links main program against the static library.

## 2. Purpose of ar and ranlib
- **ar**: Creates a static library from object files.
- **ranlib**: Generates an index inside the library, which helps the linker find symbols efficiently.

## 3. Using nm on client_static
- Running `nm bin/client_static` shows symbols like `mystrlen`.
- This confirms that functions from the static library are **statically linked** into the executable.
