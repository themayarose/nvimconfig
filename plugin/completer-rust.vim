if executable("rustc")
    let s:sysroot = substitute(system("rustc --print sysroot"), '\n\+$', '', '')
    let $RUST_SRC_PATH = s:sysroot . "/lib/rustlib/src/rust/src"
endif
