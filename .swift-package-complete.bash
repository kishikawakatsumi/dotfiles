#!/bin/bash

_swift()
{
    declare -a cur prev
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    COMPREPLY=()
    if [[ $COMP_CWORD == 1 ]]; then
        _swift_compiler
        COMPREPLY+=( $(compgen -W "build run package test" -- $cur) )
        return
    fi
    case ${COMP_WORDS[1]} in
        (build)
            _swift_build 2
            ;;
        (run)
            _swift_run 2
            ;;
        (package)
            _swift_package 2
            ;;
        (test)
            _swift_test 2
            ;;
        (*)
            _swift_compiler
            ;;
    esac
}
# Generates completions for swift build
#
# Parameters
# - the start position of this parser; set to 1 if unknown
function _swift_build
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --enable-prefetching --disable-prefetching --disable-sandbox --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib --build-tests --product --target --show-bin-path" -- $cur) )
        return
    fi
    case $prev in
        (-Xcc)
            return
        ;;
        (-Xswiftc)
            return
        ;;
        (-Xlinker)
            return
        ;;
        (-Xcxx)
            return
        ;;
        (--configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- $cur) )
            return
        ;;
        (--build-path)
            _filedir
            return
        ;;
        (--chdir|-C)
            _filedir
            return
        ;;
        (--package-path)
            _filedir
            return
        ;;
        (--enable-prefetching)
        ;;
        (--disable-prefetching)
        ;;
        (--disable-sandbox)
        ;;
        (--version)
        ;;
        (--destination)
            _filedir
            return
        ;;
        (--verbose|-v)
        ;;
        (--no-static-swift-stdlib)
        ;;
        (--static-swift-stdlib)
        ;;
        (--build-tests)
        ;;
        (--product)
            return
        ;;
        (--target)
            return
        ;;
        (--show-bin-path)
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --enable-prefetching --disable-prefetching --disable-sandbox --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib --build-tests --product --target --show-bin-path" -- $cur) )
}

# Generates completions for swift run
#
# Parameters
# - the start position of this parser; set to 1 if unknown
function _swift_run
{
    if [[ $COMP_CWORD == $(($1+0)) ]]; then
            return
    fi
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --enable-prefetching --disable-prefetching --disable-sandbox --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib --skip-build" -- $cur) )
        return
    fi
    case $prev in
        (-Xcc)
            return
        ;;
        (-Xswiftc)
            return
        ;;
        (-Xlinker)
            return
        ;;
        (-Xcxx)
            return
        ;;
        (--configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- $cur) )
            return
        ;;
        (--build-path)
            _filedir
            return
        ;;
        (--chdir|-C)
            _filedir
            return
        ;;
        (--package-path)
            _filedir
            return
        ;;
        (--enable-prefetching)
        ;;
        (--disable-prefetching)
        ;;
        (--disable-sandbox)
        ;;
        (--version)
        ;;
        (--destination)
            _filedir
            return
        ;;
        (--verbose|-v)
        ;;
        (--no-static-swift-stdlib)
        ;;
        (--static-swift-stdlib)
        ;;
        (--skip-build)
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --enable-prefetching --disable-prefetching --disable-sandbox --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib --skip-build" -- $cur) )
}

# Generates completions for swift package
#
# Parameters
# - the start position of this parser; set to 1 if unknown
function _swift_package
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "update show-dependencies resolve fetch edit tools-version describe clean generate-completion-script reset resolve-tool unedit init generate-xcodeproj dump-package -Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --enable-prefetching --disable-prefetching --disable-sandbox --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib" -- $cur) )
        return
    fi
    case $prev in
        (-Xcc)
            return
        ;;
        (-Xswiftc)
            return
        ;;
        (-Xlinker)
            return
        ;;
        (-Xcxx)
            return
        ;;
        (--configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- $cur) )
            return
        ;;
        (--build-path)
            _filedir
            return
        ;;
        (--chdir|-C)
            _filedir
            return
        ;;
        (--package-path)
            _filedir
            return
        ;;
        (--enable-prefetching)
        ;;
        (--disable-prefetching)
        ;;
        (--disable-sandbox)
        ;;
        (--version)
        ;;
        (--destination)
            _filedir
            return
        ;;
        (--verbose|-v)
        ;;
        (--no-static-swift-stdlib)
        ;;
        (--static-swift-stdlib)
        ;;
    esac
    case ${COMP_WORDS[$1]} in
        (update)
            _swift_package_update $(($1+1))
            return
        ;;
        (show-dependencies)
            _swift_package_show-dependencies $(($1+1))
            return
        ;;
        (resolve)
            _swift_package_resolve $(($1+1))
            return
        ;;
        (fetch)
            _swift_package_fetch $(($1+1))
            return
        ;;
        (edit)
            _swift_package_edit $(($1+1))
            return
        ;;
        (tools-version)
            _swift_package_tools-version $(($1+1))
            return
        ;;
        (describe)
            _swift_package_describe $(($1+1))
            return
        ;;
        (clean)
            _swift_package_clean $(($1+1))
            return
        ;;
        (generate-completion-script)
            _swift_package_generate-completion-script $(($1+1))
            return
        ;;
        (reset)
            _swift_package_reset $(($1+1))
            return
        ;;
        (resolve-tool)
            _swift_package_resolve-tool $(($1+1))
            return
        ;;
        (unedit)
            _swift_package_unedit $(($1+1))
            return
        ;;
        (init)
            _swift_package_init $(($1+1))
            return
        ;;
        (generate-xcodeproj)
            _swift_package_generate-xcodeproj $(($1+1))
            return
        ;;
        (dump-package)
            _swift_package_dump-package $(($1+1))
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "update show-dependencies resolve fetch edit tools-version describe clean generate-completion-script reset resolve-tool unedit init generate-xcodeproj dump-package -Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --enable-prefetching --disable-prefetching --disable-sandbox --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib" -- $cur) )
}

function _swift_package_update
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "" -- $cur) )
        return
    fi
    case $prev in
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "" -- $cur) )
}

function _swift_package_show-dependencies
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--format" -- $cur) )
        return
    fi
    case $prev in
        (--format)
            COMPREPLY=( $(compgen -W "text dot json" -- $cur) )
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--format" -- $cur) )
}

function _swift_package_resolve
{
    if [[ $COMP_CWORD == $(($1+0)) ]]; then
            return
    fi
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--version --branch --revision" -- $cur) )
        return
    fi
    case $prev in
        (--version)
            return
        ;;
        (--branch)
            return
        ;;
        (--revision)
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--version --branch --revision" -- $cur) )
}

function _swift_package_fetch
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "" -- $cur) )
        return
    fi
    case $prev in
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "" -- $cur) )
}

function _swift_package_edit
{
    if [[ $COMP_CWORD == $(($1+0)) ]]; then
            return
    fi
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--revision --branch --path" -- $cur) )
        return
    fi
    case $prev in
        (--revision)
            return
        ;;
        (--branch)
            return
        ;;
        (--path)
            _filedir
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--revision --branch --path" -- $cur) )
}

function _swift_package_tools-version
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--set --set-current" -- $cur) )
        return
    fi
    case $prev in
        (--set)
            return
        ;;
        (--set-current)
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--set --set-current" -- $cur) )
}

function _swift_package_describe
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--type" -- $cur) )
        return
    fi
    case $prev in
        (--type)
            COMPREPLY=( $(compgen -W "text json" -- $cur) )
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--type" -- $cur) )
}

function _swift_package_clean
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "" -- $cur) )
        return
    fi
    case $prev in
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "" -- $cur) )
}

function _swift_package_generate-completion-script
{
    if [[ $COMP_CWORD == $(($1+0)) ]]; then
            COMPREPLY=( $(compgen -W "bash zsh" -- $cur) )
            return
    fi
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "" -- $cur) )
        return
    fi
    case $prev in
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "" -- $cur) )
}

function _swift_package_reset
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "" -- $cur) )
        return
    fi
    case $prev in
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "" -- $cur) )
}

function _swift_package_resolve-tool
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--type" -- $cur) )
        return
    fi
    case $prev in
        (--type)
            COMPREPLY=( $(compgen -W "text json" -- $cur) )
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--type" -- $cur) )
}

function _swift_package_unedit
{
    if [[ $COMP_CWORD == $(($1+0)) ]]; then
            return
    fi
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--force" -- $cur) )
        return
    fi
    case $prev in
        (--force)
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--force" -- $cur) )
}

function _swift_package_init
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--type" -- $cur) )
        return
    fi
    case $prev in
        (--type)
            COMPREPLY=( $(compgen -W "empty library executable system-module" -- $cur) )
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--type" -- $cur) )
}

function _swift_package_generate-xcodeproj
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--xcconfig-overrides --enable-code-coverage --output" -- $cur) )
        return
    fi
    case $prev in
        (--xcconfig-overrides)
            _filedir
            return
        ;;
        (--enable-code-coverage)
        ;;
        (--output)
            _filedir
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--xcconfig-overrides --enable-code-coverage --output" -- $cur) )
}

function _swift_package_dump-package
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "" -- $cur) )
        return
    fi
    case $prev in
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "" -- $cur) )
}

# Generates completions for swift test
#
# Parameters
# - the start position of this parser; set to 1 if unknown
function _swift_test
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --enable-prefetching --disable-prefetching --disable-sandbox --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib --skip-build --list-tests -l --parallel --specifier -s --filter" -- $cur) )
        return
    fi
    case $prev in
        (-Xcc)
            return
        ;;
        (-Xswiftc)
            return
        ;;
        (-Xlinker)
            return
        ;;
        (-Xcxx)
            return
        ;;
        (--configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- $cur) )
            return
        ;;
        (--build-path)
            _filedir
            return
        ;;
        (--chdir|-C)
            _filedir
            return
        ;;
        (--package-path)
            _filedir
            return
        ;;
        (--enable-prefetching)
        ;;
        (--disable-prefetching)
        ;;
        (--disable-sandbox)
        ;;
        (--version)
        ;;
        (--destination)
            _filedir
            return
        ;;
        (--verbose|-v)
        ;;
        (--no-static-swift-stdlib)
        ;;
        (--static-swift-stdlib)
        ;;
        (--skip-build)
        ;;
        (--list-tests|-l)
        ;;
        (--parallel)
        ;;
        (--specifier|-s)
            return
        ;;
        (--filter)
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --enable-prefetching --disable-prefetching --disable-sandbox --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib --skip-build --list-tests -l --parallel --specifier -s --filter" -- $cur) )
}

_swift_compiler()
{
    if [[ `type -t _swift_complete`"" == 'function' ]]; then
        _swift_complete
    fi
}

complete -F _swift swift
