{
  lib,
  python3Packages,
  fetchFromGitHub,
  ...
}:

python3Packages.buildPythonApplication rec {
  pname = "mltran";
  version = "unstable-2020-06-14";
  pyproject = false;

  src = fetchFromGitHub {
    owner = "bondarevts";
    repo = "mltran";
    rev = "2eb7dfc9e11a8723b9889fbf63eaf101e377eddc";
    hash = "sha256-fbp+Qvo+7pynJhRcfEg/Z6msfeYM+QAODwhmN+Dbgl0=";
  };

  dependencies = with python3Packages; [
    certifi
    chardet
    idna
    lxml
    requests
    urllib3
  ];

  meta = {
    description = "Command line interface to multitran.ru dictionary";
    homepage = "https://github.com/bondarevts/mltran";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ "witcher" ];
    mainProgram = "mltran";
    platforms = lib.platforms.all;
  };
}
