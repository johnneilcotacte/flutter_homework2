import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/api/graphql_api.dart';

final initialgraphqlProvider = Provider<GraphqlAPI>((ref) {
  return GraphqlAPI();
});

class GraphqlAPI {
  final characters = CharactersGraphQL();
}
