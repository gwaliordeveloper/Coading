checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    int timeout = 5;
    try {
      http.Response response = await http.get(Uri.parse('https://ubiattendance.ubihrm.com/')).
      timeout(Duration(seconds: timeout));
      if (response.statusCode == 200) {
        print(response.statusCode);
        print('do something');
        return true;
      } else {
        print('handle it');
        return false;
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
      return false;
    } on SocketException catch (e) {
      print('Socket Error: $e');
      return false;
    } on Error catch (e) {
      print('General Error: $e');
      return false;
    }
  } else {
    return false;
  }
}