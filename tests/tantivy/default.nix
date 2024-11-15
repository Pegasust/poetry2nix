{poetry2nix, python311, runCommand}:
let
  env = poetry2nix.mkPoetryEnv {
    python = python311;
    pyproject = ./pyproject.toml;
    poetrylock = ./poetry.lock;
  };
in runCommand "tantivy-test" {} ''
  ${env}/bin/python -c 'import tantivy'
  touch $out
''
