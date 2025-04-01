# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

## -- ALIAS -- ##
alias cwd = pwd

## -- JAVA -- ##
def run-java [home: string, args: closure] {
    let classpath = ["." ($home | path join 'lib' | path join 'dt.jar') ($home | path join 'lib' | path join 'tools.jar')]| str join ";"
  with-env {
    JAVA_HOME: $home
    JAVA_BIN: ($home | path join 'bin' | path join 'java.exe')
    CLASSPATH: $classpath
    Path: ($env.Path | split row (char esep) | prepend $home | prepend ($home | path join 'bin') | str join (char esep))
  } {
    do $args
  }
}
def java8 [args: closure] {
    run-java "D:\\jdk\\jdk8" $args
}
def java11 [args: closure] {
    run-java "D:\\jdk\\jdk11" $args
}
def java17 [args: closure] {
    run-java "D:\\jdk\\jdk17" $args
}
def java21 [args: closure] {
    run-java "D:\\jdk\\jdk21" $args
}
def java23 [args: closure] {
    run-java "D:\\jdk\\jdk23" $args
}
def java24 [args: closure] {
    run-java "D:\\jdk\\jdk24" $args
}
