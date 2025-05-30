{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  beautifulsoup4,
  deprecated,
  jmespath,
  lxml,
  oauthlib,
  requests,
  requests-kerberos,
  requests-oauthlib,
  six,
  pytestCheckHook,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "atlassian-python-api";
  version = "3.41.21";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "atlassian-api";
    repo = "atlassian-python-api";
    tag = version;
    hash = "sha256-m8B6t9tTlef8cdsh/wnsc0iyNLsB0RYjUhq/bA9MeII=";
  };

  propagatedBuildInputs = [
    beautifulsoup4
    deprecated
    jmespath
    lxml
    oauthlib
    requests
    requests-kerberos
    requests-oauthlib
    six
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "atlassian" ];

  meta = with lib; {
    description = "Python Atlassian REST API Wrapper";
    homepage = "https://github.com/atlassian-api/atlassian-python-api";
    changelog = "https://github.com/atlassian-api/atlassian-python-api/releases/tag/${src.tag}";
    license = licenses.asl20;
    maintainers = with maintainers; [ arnoldfarkas ];
  };
}
