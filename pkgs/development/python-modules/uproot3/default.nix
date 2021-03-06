{ lib, fetchFromGitHub, buildPythonPackage, isPy27
, awkward0, backports_lzma, cachetools, lz4, pandas
, pytestCheckHook, pytestrunner, pkg-config, mock
, numpy, requests, uproot3-methods, xxhash, zstandard
}:

buildPythonPackage rec {
  pname = "uproot3";
  version = "3.14.2";

  src = fetchFromGitHub {
    owner = "scikit-hep";
    repo = "uproot3";
    rev = version;
    sha256 = "sha256-6/e+qMgwyFUo8MRRTAaGp9WLPxE2fqMEK4paq26Epzc=";
  };

  nativeBuildInputs = [ pytestrunner ];

  propagatedBuildInputs = [
    awkward0
    cachetools
    lz4
    numpy
    uproot3-methods
    xxhash
    zstandard
  ] ++ lib.optional isPy27 backports_lzma;

  checkInputs = [
    mock
    pandas
    pkg-config
    pytestCheckHook
    requests
  ] ++ lib.optional isPy27 backports_lzma;

  meta = with lib; {
    homepage = "https://github.com/scikit-hep/uproot3";
    description = "ROOT I/O in pure Python and Numpy";
    license = licenses.bsd3;
    maintainers = with maintainers; [ ktf SuperSandro2000 ];
  };
}
