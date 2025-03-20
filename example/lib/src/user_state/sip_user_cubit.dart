import 'package:bloc/bloc.dart';
import 'package:dart_sip_ua_example/src/user_state/sip_user.dart';
import 'package:sip_ua/sip_ua.dart';

class SipUserCubit extends Cubit<SipUser?> {
  final SIPUAHelper sipHelper;

  SipUserCubit({required this.sipHelper}) : super(null);

  void register(SipUser user) {
    UaSettings settings = UaSettings();
    //settings.port = user.port;
    settings.webSocketSettings.extraHeaders = user.wsExtraHeaders ?? {};
    settings.webSocketSettings.allowBadCertificate = true;
    //settings.webSocketSettings.userAgent = 'Dart/2.8 (dart:io) for OpenSIPS.';
    //settings.tcpSocketSettings.allowBadCertificate = true;
    settings.transportType = TransportType.WS;
    settings.uri = "001-001KrunalDoshi1196@wrtc1.adit.com";//user.sipUri;
    settings.webSocketUrl = "wss://wrtc1.adit.com:65089/ws"; //user.wsUrl;
    //settings.host = user.sipUri?.split('@')[1];
    settings.authorizationUser = "001-001KrunalDoshi1196";//user.authUser;
    settings.password = "9tqs58EVszcNmvS2";//user.password;
    //settings.displayName = user.displayName;
    settings.userAgent = 'sip-mobile-sdk-android';
    settings.dtmfMode = DtmfMode.RFC2833;
    settings.register_expires = 86400;
    // settings.contact_uri = 'sip:${user.sipUri}';

    emit(user);
    sipHelper.start(settings);
  }
}
