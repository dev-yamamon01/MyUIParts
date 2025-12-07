
///Flavorごとに変数や実行したい処理を定義するためのクラス
class F {
  static const flavor = String.fromEnvironment('FLAVOR');
  static String get appName {
    switch (flavor) {
      case 'dev':
        return 'MyUIParts-Dev';
      case 'staging':
        return 'MyUIParts-Staging';
      case 'production':
        return 'MyUIParts';
      default:
        return 'MyUIParts';
    }
  }

  static String get apiBaseUrl {
    switch (flavor) {
      case 'dev':
        return 'https://dev-api.example.com';
      case 'staging':
        return 'https://staging-api.example.com';
      case 'production':
        return 'https://api.example.com';
      default:
        return 'https://dev-api.example.com';
    }
  }

  static bool get isProduction => flavor == 'production';

  static bool get isDevelopment => (flavor == 'dev' || flavor == 'staging');

  ///firebaseの初期化などに使用する
  Future<void> initByFlavor() async{
    switch (flavor) {
      case "dev":
        print('dev初期化完了');
        break;
      case "staging":
        print('staging初期化完了');
        break;
      case "production":
        print('production初期化完了');
        break;
      default:
        print('対象外のflavorを指定しています');
        break;
    }
  }

}

