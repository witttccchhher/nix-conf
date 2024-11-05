{ lib, fetchPypi, python3Packages }: python3Packages.buildPythonApplication rec {
  pname = "rich";
  version = "13.9.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Q5WUl4pJoJUwz/frxLXHED71e69I1eoxhPIdmivvoJg=";
  };

  build-system = with python3Packages; [ poetry-core ];
  dependencies = with python3Packages; [
    markdown-it-py
    pygments
  ];

  meta = with lib; {
    description = "Rich is a Python library for rich text and beautiful formatting in the terminal.";
    homepage = "https://github.com/Textualize/rich";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ somokill ];
  };
}
