class ConstRes {
<<<<<<< HEAD
  static final String base = 'https://shortz.everests.co.uk/';
=======
  static final String base = 'https://shortz.everests.co.uk/api/;
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
  static const String apiKey = 'dev123';
  static final String baseUrl = '${base}api/';

  static final String itemBaseUrl = 'https://d139xnf84yjx1z.cloudfront.net/bubbly/';

  // Agora Credential
<<<<<<< HEAD
  static final String customerId = 'c575b5922d4c4c7ab01561af71d39e96';
  static final String customerSecret = '39cfbd5e04134b2b98e7dd1404988aa1';
=======
  static final String customerId = '--------';
  static final String customerSecret = '---------';
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703

  // Starting screen open end_user_license_agreement sheet link
  static final String agreementUrl = "https://work.bubbletokapp.com/";

  static final String bubblyCamera = 'bubbly_camera';
  static final bool isDialog = false;
}

const String appName = 'Shortz';
<<<<<<< HEAD
const companyName = 'JIREH';
=======
const companyName = 'FM_Tech';
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
const defaultPlaceHolderText = 'S';
const byDefaultLanguage = 'en';

const int paginationLimit = 10;

// Live broadcast Video Quality : Resolution (Width×Height)
int liveWeight = 640;
int liveHeight = 480;
<<<<<<< HEAD
int liveFrameRate = 60; //Frame rate (fps）
=======
int liveFrameRate = 15; //Frame rate (fps）
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703

// Image Quality
double maxHeight = 720;
double maxWidth = 720;
int imageQuality = 100;

// max Video upload limit in MB
<<<<<<< HEAD
int maxUploadMB = 512;
=======
int maxUploadMB = 50;
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
// max Video upload second
int maxUploadSecond = 60;

//Strings
const List<String> paymentMethods = ['Paypal', 'Paytm', 'Other'];
const List<String> reportReasons = ['Sexual', 'Nudity', 'Religion', 'Other'];

// Video Moderation models  :- https://sightengine.com/docs/moderate-stored-video-asynchronously
String nudityModels = 'nudity,wad';
