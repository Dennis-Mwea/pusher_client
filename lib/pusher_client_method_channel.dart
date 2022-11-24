import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pusher_client_platform_interface.dart';

/// An implementation of [PusherClientPlatform] that uses method channels.
class MethodChannelPusherClient extends PusherClientPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pusher_client');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
