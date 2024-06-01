// ignore_for_file: non_constant_identifier_names

import 'package:project_home_iot/model/api_provider/http_provider.dart';
import 'package:project_home_iot/model/constants/http_constants.dart';

import '../objects/group_properties_object.dart';
import '../requests/feed_request.dart';

class GroupPropertiesRepository {
  HttpProvider httpProvider = HttpProvider(
      baseUrl: HttpConstants.adafruitBaseUrl,
      header: {'X-AIO-Key': HttpConstants.xAioKey});

  Future<GroupPropertiesObject?> getGroupProperties(String username, String group_key) async{
    String path = '/$username/groups/$group_key';
    final res = await httpProvider.get(path);
    if(res.isNotEmpty){
      GroupPropertiesObject groupPropertiesObject=GroupPropertiesObject.fromJson(res);
      return groupPropertiesObject;
    }
    return null;
  }

}

