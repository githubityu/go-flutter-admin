import 'package:gin_vue_admin_web/router/router.dart';
import 'package:go_router/go_router.dart';
import 'package:gin_vue_admin_web/exports.dart';


T useDisposable<T>(T Function() cb, List<Object?> keys) {
  final obj = useMemoized(cb, keys);

  assert((obj as dynamic).dispose is void Function(),
      '$T does not have a `void dispose()` method');

  useEffect(() {
    dynamic disposable = obj;
    return disposable.dispose;
  }, keys);
  return obj;
}

GoRouter userAppRouter() {
  return goRouter;
}
