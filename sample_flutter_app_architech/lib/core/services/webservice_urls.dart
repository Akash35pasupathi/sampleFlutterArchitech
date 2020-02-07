const String SERVICE_VERSION = '5.4';
const endpoint = 'http://10.100.103.127:8080';

Future<String> getURL(String suffix) async {
  String prefix = await getBaseURL();
  String url = prefix == null ? endpoint : prefix;
  return '$url$suffix';
}

Future<String> getBaseURL() async {
  String prefix = "http://10.100.103.127:9000";
  return prefix == null ? endpoint : prefix;
}


const GET_USER =
    '/get_user';
const ADD =
    '/add';
const ALL = '/all';
const DELETE = '/delete';




