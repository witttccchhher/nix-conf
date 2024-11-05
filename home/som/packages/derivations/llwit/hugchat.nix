{ lib, fetchPypi, python3Packages }: python3Packages.buildPythonApplication rec {
  pname = "hugchat";
  version = "0.4.11";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-9UG//wJH8tE4dC2+WdhCTTgbQB8YI3Ee9M1wQzZRboA=";
  };

  dependencies = with python3Packages; [
    requests
    requests-toolbelt
  ];

  meta = with lib; {
    description = "HuggingChat Python API";
    homepage = "https://github.com/Soulter/hugging-chat-api";
    license = with licenses; [ agpl3Only ];
    maintainers = with maintainers; [ somokill ];
  };
}
