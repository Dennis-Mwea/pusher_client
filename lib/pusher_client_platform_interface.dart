import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pusher_client_method_channel.dart';

abstract class PusherClientPlatform extends PlatformInterface {
  /// Constructs a PusherClientPlatform.
  PusherClientPlatform() : super(token: _token);

  static final Object _token = Object();

  static PusherClientPlatform _instance = MethodChannelPusherClient();

  /// The default instance of [PusherClientPlatform] to use.
  ///
  /// Defaults to [MethodChannelPusherClient].
  static PusherClientPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PusherClientPlatform] when
  /// they register themselves.
  static set instance(PusherClientPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
