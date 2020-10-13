import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:meta/meta.dart';

abstract class NetworkInfoContract {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfoContract {
  final DataConnectionChecker dataConnectionChecker;
  NetworkInfoImpl({@required this.dataConnectionChecker});

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
