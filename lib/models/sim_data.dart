
class SimData {
  final String carrierName;
  final String countyCode;
  final String mcc;
  final String mnc;
  final int callState;
  final int dataActivity;
  final int networkType;
  final int phoneType;
  final int simState;
  final int phoneCount;
  final int activeSubscriptionInfoCountMax;
  final int activeSubscriptionInfoCount;
  final String phoneNumber;
  final String deviceId;
  final String deviceSoftwareVersion;
  final String simSerialNumber;
  final String subscriberId;
  final bool isNetworkingRoaming;
  final bool isDataRoaming;
  final int simSlutIndex;
  final List<SimCard> cards;
  SimData(
      this.carrierName,
      this.countyCode,
      this.mcc,
      this.mnc,
      this.callState,
      this.dataActivity,
      this.networkType,
      this.phoneType,
      this.simState,
      this.phoneCount,
      this.activeSubscriptionInfoCountMax,
      this.activeSubscriptionInfoCount,
      this.phoneNumber,
      this.deviceId,
      this.deviceSoftwareVersion,
      this.simSerialNumber,
      this.subscriberId,
      this.isNetworkingRoaming,
      this.isDataRoaming,
      this.simSlutIndex,
      this.cards);

      static SimData fromJson(data) {
        return new SimData(
        data['carrierName'],
        data['countyCode'],
        data['mcc'],
        data['mnc'],
        data['callState'],
        data['dataActivity'],
        data['networkType'],
        data['phoneType'],
        data['simState'],
        data['phoneCount'],
        data['activeSubscriptionInfoCountMax'],
        data['activeSubscriptionInfoCount'],
        data['phoneNumber'],
        data['deviceId'],
        data['deviceSoftwareVersion'],
        data['simSerialNumber'],
        data['subscriberId'],
        data['isNetworkingRoaming'],
        data['isDataRoaming'],
        data['isDataRoaming'],
        data['cards'] != null && data['cards'] is List ?
          data['cards'].map<SimCard>((_card) => SimCard.fromJson(_card)).toList() : 
          []
        );
      }
}

class SimCard {
  final String carrierName;
  final String displayName;

  final String countryCode;
  final int mcc;
  final int mnc;
  final bool isNetworkRoaming;
  final bool isDataRoaming;
  final int simSlotIndex;
  final String deviceId;
  final String simSerialNumber;
  final int subscriptionId;
  SimCard(
      this.carrierName,
      this.displayName,
      this.countryCode,
      this.mcc,
      this.mnc,
      this.isNetworkRoaming,
      this.isDataRoaming,
      this.simSlotIndex,
      this.deviceId,
      this.simSerialNumber,
      this.subscriptionId);

  static SimCard fromJson(dynamic card) {
    return SimCard(
          card['carrierName'],
          card['displayName'],
          card['countryCode'],
          card['mcc'],
          card['mnc'],
          card['isNetworkRoaming'],
          card['isDataRoaming'],
          card['simSlotIndex'],
          card['deviceId'],
          card['simSerialNumber'],
          card['subscriptionId']);
  }
}
