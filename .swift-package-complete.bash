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

_swift_dependency() {
    COMPREPLY=( $(compgen -W "$(swift package completion-tool list-dependencies)" -- $cur) )
}

_swift_executable() {
    COMPREPLY=( $(compgen -W "$(swift package completion-tool list-executables)" -- $cur) )
}

# Generates completions for swift build
#
# Parameters
# - the start position of this parser; set to 1 if unknown
function _swift_build
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --multiroot-data-file --sanitize --disable-prefetching --skip-update --disable-sandbox --disable-package-manifest-caching --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib --force-resolved-versions --disable-automatic-resolution --enable-index-store --disable-index-store --enable-pubgrub-resolver --use-legacy-resolver --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-test-discovery --enable-build-manifest-caching --emit-swift-module-separately --build-tests --product --target --show-bin-path" -- $cur) )
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
        (--multiroot-data-file)
            _filedir
            return
        ;;
        (--sanitize)
            COMPREPLY=( $(compgen -W "address thread undefined" -- $cur) )
            return
        ;;
        (--disable-prefetching)
        ;;
        (--skip-update)
        ;;
        (--disable-sandbox)
        ;;
        (--disable-package-manifest-caching)
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
        (--force-resolved-versions)
        ;;
        (--disable-automatic-resolution)
        ;;
        (--enable-index-store)
        ;;
        (--disable-index-store)
        ;;
        (--enable-pubgrub-resolver)
        ;;
        (--use-legacy-resolver)
        ;;
        (--enable-parseable-module-interfaces)
        ;;
        (--trace-resolver)
        ;;
        (--jobs|-j)
            return
        ;;
        (--enable-test-discovery)
        ;;
        (--enable-build-manifest-caching)
        ;;
        (--emit-swift-module-separately)
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
    COMPREPLY=( $(compgen -W "-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --multiroot-data-file --sanitize --disable-prefetching --skip-update --disable-sandbox --disable-package-manifest-caching --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib --force-resolved-versions --disable-automatic-resolution --enable-index-store --disable-index-store --enable-pubgrub-resolver --use-legacy-resolver --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-test-discovery --enable-build-manifest-caching --emit-swift-module-separately --build-tests --product --target --show-bin-path" -- $cur) )
}

# Generates completions for swift run
#
# Parameters
# - the start position of this parser; set to 1 if unknown
function _swift_run
{
    if [[ $COMP_CWORD == $(($1+0)) ]]; then
            _swift_executable
            return
    fi
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --multiroot-data-file --sanitize --disable-prefetching --skip-update --disable-sandbox --disable-package-manifest-caching --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib --force-resolved-versions --disable-automatic-resolution --enable-index-store --disable-index-store --enable-pubgrub-resolver --use-legacy-resolver --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-test-discovery --enable-build-manifest-caching --emit-swift-module-separately --skip-build --build-tests --repl" -- $cur) )
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
        (--multiroot-data-file)
            _filedir
            return
        ;;
        (--sanitize)
            COMPREPLY=( $(compgen -W "address thread undefined" -- $cur) )
            return
        ;;
        (--disable-prefetching)
        ;;
        (--skip-update)
        ;;
        (--disable-sandbox)
        ;;
        (--disable-package-manifest-caching)
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
        (--force-resolved-versions)
        ;;
        (--disable-automatic-resolution)
        ;;
        (--enable-index-store)
        ;;
        (--disable-index-store)
        ;;
        (--enable-pubgrub-resolver)
        ;;
        (--use-legacy-resolver)
        ;;
        (--enable-parseable-module-interfaces)
        ;;
        (--trace-resolver)
        ;;
        (--jobs|-j)
            return
        ;;
        (--enable-test-discovery)
        ;;
        (--enable-build-manifest-caching)
        ;;
        (--emit-swift-module-separately)
        ;;
        (--skip-build)
        ;;
        (--build-tests)
        ;;
        (--repl)
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --multiroot-data-file --sanitize --disable-prefetching --skip-update --disable-sandbox --disable-package-manifest-caching --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib --force-resolved-versions --disable-automatic-resolution --enable-index-store --disable-index-store --enable-pubgrub-resolver --use-legacy-resolver --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-test-discovery --enable-build-manifest-caching --emit-swift-module-separately --skip-build --build-tests --repl" -- $cur) )
}

# Generates completions for swift package
#
# Parameters
# - the start position of this parser; set to 1 if unknown
function _swift_package
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "dump-package update tools-version show-dependencies unedit clean init edit describe generate-xcodeproj reset resolve experimental-api-diff _format config fetch completion-tool -Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --multiroot-data-file --sanitize --disable-prefetching --skip-update --disable-sandbox --disable-package-manifest-caching --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib --force-resolved-versions --disable-automatic-resolution --enable-index-store --disable-index-store --enable-pubgrub-resolver --use-legacy-resolver --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-test-discovery --enable-build-manifest-caching --emit-swift-module-separately" -- $cur) )
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
        (--multiroot-data-file)
            _filedir
            return
        ;;
        (--sanitize)
            COMPREPLY=( $(compgen -W "address thread undefined" -- $cur) )
            return
        ;;
        (--disable-prefetching)
        ;;
        (--skip-update)
        ;;
        (--disable-sandbox)
        ;;
        (--disable-package-manifest-caching)
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
        (--force-resolved-versions)
        ;;
        (--disable-automatic-resolution)
        ;;
        (--enable-index-store)
        ;;
        (--disable-index-store)
        ;;
        (--enable-pubgrub-resolver)
        ;;
        (--use-legacy-resolver)
        ;;
        (--enable-parseable-module-interfaces)
        ;;
        (--trace-resolver)
        ;;
        (--jobs|-j)
            return
        ;;
        (--enable-test-discovery)
        ;;
        (--enable-build-manifest-caching)
        ;;
        (--emit-swift-module-separately)
        ;;
    esac
    case ${COMP_WORDS[$1]} in
        (dump-package)
            _swift_package_dump-package $(($1+1))
            return
        ;;
        (update)
            _swift_package_update $(($1+1))
            return
        ;;
        (tools-version)
            _swift_package_tools-version $(($1+1))
            return
        ;;
        (show-dependencies)
            _swift_package_show-dependencies $(($1+1))
            return
        ;;
        (unedit)
            _swift_package_unedit $(($1+1))
            return
        ;;
        (clean)
            _swift_package_clean $(($1+1))
            return
        ;;
        (init)
            _swift_package_init $(($1+1))
            return
        ;;
        (edit)
            _swift_package_edit $(($1+1))
            return
        ;;
        (describe)
            _swift_package_describe $(($1+1))
            return
        ;;
        (generate-xcodeproj)
            _swift_package_generate-xcodeproj $(($1+1))
            return
        ;;
        (reset)
            _swift_package_reset $(($1+1))
            return
        ;;
        (resolve)
            _swift_package_resolve $(($1+1))
            return
        ;;
        (experimental-api-diff)
            _swift_package_experimental-api-diff $(($1+1))
            return
        ;;
        (_format)
            _swift_package__format $(($1+1))
            return
        ;;
        (config)
            _swift_package_config $(($1+1))
            return
        ;;
        (fetch)
            _swift_package_fetch $(($1+1))
            return
        ;;
        (completion-tool)
            _swift_package_completion-tool $(($1+1))
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "dump-package update tools-version show-dependencies unedit clean init edit describe generate-xcodeproj reset resolve experimental-api-diff _format config fetch completion-tool -Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --multiroot-data-file --sanitize --disable-prefetching --skip-update --disable-sandbox --disable-package-manifest-caching --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib --force-resolved-versions --disable-automatic-resolution --enable-index-store --disable-index-store --enable-pubgrub-resolver --use-legacy-resolver --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-test-discovery --enable-build-manifest-caching --emit-swift-module-separately" -- $cur) )
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

function _swift_package_update
{
    if [[ $COMP_CWORD == $(($1+0)) ]]; then
            return
    fi
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--dry-run -n" -- $cur) )
        return
    fi
    case $prev in
        (--dry-run|-n)
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--dry-run -n" -- $cur) )
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

function _swift_package_unedit
{
    if [[ $COMP_CWORD == $(($1+0)) ]]; then
            _swift_dependency
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

function _swift_package_init
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--type --name" -- $cur) )
        return
    fi
    case $prev in
        (--type)
            COMPREPLY=( $(compgen -W "empty library executable system-module" -- $cur) )
            return
        ;;
        (--name)
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--type --name" -- $cur) )
}

function _swift_package_edit
{
    if [[ $COMP_CWORD == $(($1+0)) ]]; then
            _swift_dependency
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

function _swift_package_generate-xcodeproj
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--xcconfig-overrides --enable-code-coverage --output --legacy-scheme-generator --watch --skip-extra-files" -- $cur) )
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
        (--legacy-scheme-generator)
        ;;
        (--watch)
        ;;
        (--skip-extra-files)
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--xcconfig-overrides --enable-code-coverage --output --legacy-scheme-generator --watch --skip-extra-files" -- $cur) )
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

function _swift_package_resolve
{
    if [[ $COMP_CWORD == $(($1+0)) ]]; then
            _swift_dependency
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

function _swift_package_experimental-api-diff
{
    if [[ $COMP_CWORD == $(($1+0)) ]]; then
            return
    fi
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--invert-baseline" -- $cur) )
        return
    fi
    case $prev in
        (--invert-baseline)
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--invert-baseline" -- $cur) )
}

function _swift_package__format
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--" -- $cur) )
        return
    fi
    case $prev in
        (--)
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--" -- $cur) )
}

function _swift_package_config
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "get-mirror set-mirror unset-mirror" -- $cur) )
        return
    fi
    case $prev in
    esac
    case ${COMP_WORDS[$1]} in
        (get-mirror)
            _swift_package_config_get-mirror $(($1+1))
            return
        ;;
        (set-mirror)
            _swift_package_config_set-mirror $(($1+1))
            return
        ;;
        (unset-mirror)
            _swift_package_config_unset-mirror $(($1+1))
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "get-mirror set-mirror unset-mirror" -- $cur) )
}

function _swift_package_config_get-mirror
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--package-url" -- $cur) )
        return
    fi
    case $prev in
        (--package-url)
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--package-url" -- $cur) )
}

function _swift_package_config_set-mirror
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--package-url --mirror-url" -- $cur) )
        return
    fi
    case $prev in
        (--package-url)
            return
        ;;
        (--mirror-url)
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--package-url --mirror-url" -- $cur) )
}

function _swift_package_config_unset-mirror
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "--package-url --mirror-url" -- $cur) )
        return
    fi
    case $prev in
        (--package-url)
            return
        ;;
        (--mirror-url)
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "--package-url --mirror-url" -- $cur) )
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

function _swift_package_completion-tool
{
    if [[ $COMP_CWORD == $(($1+0)) ]]; then
            COMPREPLY=( $(compgen -W "generate-bash-script generate-zsh-script list-dependencies list-executables" -- $cur) )
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

# Generates completions for swift test
#
# Parameters
# - the start position of this parser; set to 1 if unknown
function _swift_test
{
    if [[ $COMP_CWORD == $1 ]]; then
        COMPREPLY=( $(compgen -W "-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --multiroot-data-file --sanitize --disable-prefetching --skip-update --disable-sandbox --disable-package-manifest-caching --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib --force-resolved-versions --disable-automatic-resolution --enable-index-store --disable-index-store --enable-pubgrub-resolver --use-legacy-resolver --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-test-discovery --enable-build-manifest-caching --emit-swift-module-separately --skip-build --list-tests -l --generate-linuxmain --parallel --num-workers --specifier -s --xunit-output --filter --enable-code-coverage --show-codecov-path --test-product" -- $cur) )
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
        (--multiroot-data-file)
            _filedir
            return
        ;;
        (--sanitize)
            COMPREPLY=( $(compgen -W "address thread undefined" -- $cur) )
            return
        ;;
        (--disable-prefetching)
        ;;
        (--skip-update)
        ;;
        (--disable-sandbox)
        ;;
        (--disable-package-manifest-caching)
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
        (--force-resolved-versions)
        ;;
        (--disable-automatic-resolution)
        ;;
        (--enable-index-store)
        ;;
        (--disable-index-store)
        ;;
        (--enable-pubgrub-resolver)
        ;;
        (--use-legacy-resolver)
        ;;
        (--enable-parseable-module-interfaces)
        ;;
        (--trace-resolver)
        ;;
        (--jobs|-j)
            return
        ;;
        (--enable-test-discovery)
        ;;
        (--enable-build-manifest-caching)
        ;;
        (--emit-swift-module-separately)
        ;;
        (--skip-build)
        ;;
        (--list-tests|-l)
        ;;
        (--generate-linuxmain)
        ;;
        (--parallel)
        ;;
        (--num-workers)
            return
        ;;
        (--specifier|-s)
            return
        ;;
        (--xunit-output)
            _filedir
            return
        ;;
        (--filter)
            return
        ;;
        (--enable-code-coverage)
        ;;
        (--show-codecov-path)
        ;;
        (--test-product)
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
    esac
    COMPREPLY=( $(compgen -W "-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --chdir -C --package-path --multiroot-data-file --sanitize --disable-prefetching --skip-update --disable-sandbox --disable-package-manifest-caching --version --destination --verbose -v --no-static-swift-stdlib --static-swift-stdlib --force-resolved-versions --disable-automatic-resolution --enable-index-store --disable-index-store --enable-pubgrub-resolver --use-legacy-resolver --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-test-discovery --enable-build-manifest-caching --emit-swift-module-separately --skip-build --list-tests -l --generate-linuxmain --parallel --num-workers --specifier -s --xunit-output --filter --enable-code-coverage --show-codecov-path --test-product" -- $cur) )
}

_swift_compiler()
{
    if [[ `type -t _swift_complete`"" == 'function' ]]; then
        _swift_complete
    fi
}

complete -F _swift swift
