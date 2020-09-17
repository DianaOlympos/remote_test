{ pkgs ? import <nixpkgs> { } }:

with pkgs;
let 
  elixir = beam.packages.erlangR23.elixir_1_10;
  postgres = postgresql_12;

in mkShell {
  buildInputs = [
    elixir
    postgres
    pgcli
  ] ++ lib.lists.optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
    # For file_system on macO.S
    CoreFoundation
    CoreServices
    clang_8
  ]);

  # Fix GLIBC Locale
  LOCALE_ARCHIVE = stdenv.lib.optionalString stdenv.isLinux
    "${pkgs.glibcLocales}/lib/locale/locale-archive";
  LANG = "en_US.UTF-8";

  PGDATA = "./.db/postgres";

  ERL_INCLUDE_PATH = "${erlangR23}/lib/erlang/usr/include";
}
