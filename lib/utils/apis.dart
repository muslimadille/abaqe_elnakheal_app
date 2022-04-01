class Apis{
  static String TOKEN_VALUE="";

  static const REQ_SUCCESS = "success";
  static const CODE_SUCCESS = '200';
  static const CODE_SHOW_MESSAGE = '400';
  static const CODE_ACTIVE_USER = '403';
  static const CODE_ERROR = '500';
  static const REQ_NOT_ALLOWED = "NotAllowed";
  static const REQ_DATA_RETURNED = "DataReturn";
  static const REQ_EMPTY_DATA = "EmptyData";
  static const REQ_FAILED = "failed";
  static const ExCEPTION = "Exception";

  static String BASE_URL="https://abak.topbits-tech.com/api/v1";
  static String REGISTER_API="${BASE_URL}/register";
  static String HOME_API="${BASE_URL}/home-page";
  static String LOGIN_API="${BASE_URL}/login";
  static String GET_AUTH_CODE_API="${BASE_URL}/get-code";
  static String SET_NEW_PASSWORD_API="${BASE_URL}/set-new-password";
  static String CHANGE_PASSWORD_API="${BASE_URL}/change-password";
  static String UPDATE_PROFILE_API="${BASE_URL}/update-profile";
  static String SOCIAL_LOGIN_API="${BASE_URL}/social-login";



  ///--------------------------------------------------------
  static String REGIONS_API="${BASE_URL}/regions";
  static String CHANGE_LANGUAGE_API="${BASE_URL}/change-lang";
  static String SEARCH_API="${BASE_URL}/search";
  ///-------------------CART---------------------------------
  static String ADD_TO_CART_API="${BASE_URL}/add-to-cart";
  static String GET_CART_ITEMS_API="${BASE_URL}/cart-items";
  static String GET_COUPON_API="${BASE_URL}/check-coupon";
  static String ADD_ADDRESS_API="${BASE_URL}/add-address";
  static String ADD_ORDER_API="${BASE_URL}/add-order";
  ///------------------my orders------------------------------
  static String MY_ORDERS_API="${BASE_URL}/my-orders";
  static String CANCEL_ORDER_API="${BASE_URL}/cancel-order";

  ///-----------------rates-----------------------------------
  static String PRODUCT_RATES="${BASE_URL}/product-rates";









}