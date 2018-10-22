{ mkDerivation, aeson, base, bytestring, Cabal, containers, deepseq
, directory, filepath, http-io-streams, io-streams, lens, mtl
, netrc, optparse-applicative, pretty, semigroups, split, stdenv
, stringsearch, tagsoup, tar, text, time, unordered-containers
, zlib
}:
mkDerivation {
  pname = "hackage-cli";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    aeson base bytestring Cabal containers deepseq directory filepath
    http-io-streams io-streams lens mtl netrc optparse-applicative
    pretty semigroups split stringsearch tagsoup tar text time
    unordered-containers zlib
  ];
  homepage = "https://github.com/hvr/hackage-cli";
  description = "CLI tool for Hackage";
  license = stdenv.lib.licenses.gpl3;
}
