import 'package:mi_mall/app/services/sp_utils.dart';

class SearchService {
  static const String SEARCH_HISTORY = 'SEARCH_HISTORY_LIST';

  static void setHistory(dynamic value) async {
    List? list = await SPUtils.getData(SEARCH_HISTORY);
    if (list != null) {
      bool hasKey = list.any((element) => element == value);
      if (!hasKey) {
        list.add(value);
        await SPUtils.setData(SEARCH_HISTORY, list);
      }
    } else {
      List his = [];
      his.add(value);
      await SPUtils.setData(SEARCH_HISTORY, his);
    }
  }

  static Future<List> getHistory(String key) async {
    List? list = await SPUtils.getData(SEARCH_HISTORY);
    if (list != null) {
      return list;
    } else {
      return [];
    }
  }

  static  remove(String key) async {
    List? list = await SPUtils.getData(SEARCH_HISTORY);
    if (list != null) {
      list.remove(key);
      await SPUtils.setData(SEARCH_HISTORY, list);
    }
  }

  static clear() async {
    await SPUtils.clear(SEARCH_HISTORY);
  }
}
