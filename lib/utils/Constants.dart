class Constants {
  // InstaBug Token
  static const String INSTA_BUG_TOKEN = 'e7381c8b73cd7f8a2539cae56918e6ed';

  // Base URLs
  static const String BASE_URL_SAP =
      'https://integrationapistg.etec.gov.sa/sap.api';
  static const String BASE_URL_ETEC = 'https://beta.etec.gov.sa:1443';

  // Endpoints
  static const String GET_LISTS_ITEMS_FILTERED =
      '/api/List/GetListsItemsFilterd';
  static const String GET_LISTS_ITEMS = '/api/List/GetListsItems';
  static const String GET_ITEM_BY_ID = '/api/List/GetItemById';

  static const String EMPLOYEE_SUMMARY = '/EmployeeSummary';
  static const String EMPLOYEE_ATTENDANCE_RECORDS =
      '/employeeAttendanceRecords';
  static const String EMPLOYEE_LEAVE_HISTORY = '/employeeLeaveHistory';
  static const String EMPLOYEE_EXCUSE_HISTORY = '/employeeExcuseHistory';

  static const String EMPLOYEE_DEPENDANTS = '/employeeDependants';
  static const String EMPLOYEE_EMPLOYMENT = '/employeeEmployment';
  static const String EMPLOYEE_FINANCIAL_INFORMATION =
      '/employeeFinancialInformation';
  static const String EMPLOYEE_COMPENSATIONS = '/employeeCompensations';

  static const String LOGIN_AUTH_BIOMETRICS = '/api/Login/Authenticate';
  static const String END_POINT_TOKEN = '/TokenAuth';

  // List Media Files
  static const String LIST_MEDIA_FILES = 'MediaFiles';
  static const int COUNT = 100;
  static const bool IS_ASC = false;
  static const String FILTER_NAME = 'MediaFileCategory';
  static const String SITE_NAME = 'internalportal';

  // Route Names
  static const String TUTORIAL = '/tutorial';
  static const String HOME = '/home';
  static const String LOGIN = '/login';

  // Other constants
  static const String VALUE_IS_LOGGED_IN = 'loggedin';
  static const String FORGET_PASSWORD_URL = 'https://selfservice.etec.gov.sa/';
}
