
import '../exports.dart';



(bool,Map<String,dynamic>) isFromService(Response e){
  if(e.data is Map){
    final map = e.data as Map<String,dynamic>;
    return (map.containsKey('code')&&map.containsKey('data'), map);
  }else{
    return const (false, {});
  }
}
