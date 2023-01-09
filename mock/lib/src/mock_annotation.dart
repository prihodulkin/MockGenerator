class Mock {
  final String? name;
  const Mock({this.name});
}

class ExternalMocks {
  const ExternalMocks();
}

const externalMocks = ExternalMocks();

const mock = Mock();
