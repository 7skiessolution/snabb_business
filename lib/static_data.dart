class StaticValues {
  static String token = "";
  static const imageUrl = "https://snabbbusniess.7skiessolutions.net";
  static const registerUser = 'UserApi/RegsiterUser';
  static const loginUser = 'UserApi/UserLogin';
  static const forgotpassword = "UserApi/ForgotPassword?email=";
  static const addCategory = 'Categories/AddCategory';
  static const getCategories = 'Categories/GetCategories/';
  static const deleteCategories = 'Categories/DeleteCategory/';
  static const addTransaction = 'Transaction/AddTransaction';
  static const getAllTransaction = 'Transaction/GetAllTransactions';
  static const getBudgets = 'Budget/GetBudgets';
  static const addBudgets = 'Budget/Add';
  static const deleteBudgets = 'Budget/Delete';
  static const payBudgets = 'Budget/Pay';
  static const getWalletDetails = 'Wallet/GetCurrentStats';
  static const getProfileDetails = 'UserApi/UserProfile';
  static const updateProfileDetails = 'UserApi/UpdateProfile';
  static const getWalletList = 'Wallet/Get';
  static const addWalletData = 'Wallet/Add';
  static const deleteWalletData = 'Wallet/Delete/';
  static const getIncomeGraph = 'Wallet/GetMonthWiseIncome/';
  // static const getIncomeExpenceGraph = 'Wallet/GetMonthWiseIncomeExpense/';
  static const changePassword = 'UserApi/ChangeUserPassword';
  static const getDailyTrasaction = 'Transaction/GetDayWiseTransactions';
  static const getMonthTrasaction = 'Transaction/GetMonthWiseTransactions';
  static const getYearTrasaction = 'Transaction/GetYearWiseTransactions';
  static const deleteTrasaction = 'Transaction/Delete/';
  //static const getAllRecycleTrasaction = 'Transaction/GetDeletedTransactions';
  static const getTransactionstype = "Transaction/GetTransactions";
  static const recoverTrasaction = 'Transaction/Recover/';

  static const adddebitcredit = 'DebitCredit/Add';
  static const getdebitcredit = "DebitCredit/GetDebitCredit";
  static const paydebitcredit = "DebitCredit/Pay";
  static const updatedebitcredit = "DebitCredit/Update";
  static const deletedebitcredit = "DebitCredit/Delete";
  static const addcscheduleTransaction = "Transaction/AddSceduleTransaction";
  static const getSalePurchaseType =
      "Transaction/GetMonthWiseSalePurchaseExpense/";
  // static const getSaledatatype = "Transaction/GetYearTransactions/";
  static const getscheduleTransaction =
      "Transaction/GetAllScheduleTransactions";
  static const getCalanderTransaction = "Transaction/GetCalenderTransactions";
  static const gettransaction = "Transaction/GetTransactions/";
  ///////////////////////////////Company//////////////////////////////////
  static const addCompany = "Company/AddCompany";
  static const getCompanyList = "Company/GetCompanies";
  static const deleteCompany = "Company/DeleteCompany/";
  static const updateCompany = "Company/UpdateCompany/";
  ///////////////////////////////Suppliers//////////////////////////////////
  static const addSupplier = "Supplier/AddSupplier";
  static const getSupplierList = "Supplier/GetSuppliers";
  static const deleteSupplier = "Supplier/DeleteSupplier/";
  static const updateSuplier = "Supplier/UpdateSupplier/";
  ///////////////////////////////sale//////////////////////////////////////
  static const addSale = "Transaction/AddSale";
  ///////////////////////////////Expense//////////////////////////////////////
  static const addExpence = "Transaction/AddExpense";
  ///////////////////////////////Purchase//////////////////////////////////////
  static const addPurchase = "Transaction/AddPurchase";
  ////////////////////////////// summary///////////////////////////////////
  static const getSummary = "Transaction/GetSummary?Date=";
  static const searchSummary = 'Transaction/SearchSummary?Type=';
  ///////////////////////////// currency //////////////////////
  static const changeCurrency = 'UserApi/ChangeCurrency?Currency=';
  ////////////////////////////// REPORTS ///////////////////////
  static const getdailySaleReport = "Transaction/DailySaleReport";
  static const getcompanySaleReport = "Transaction/CompanySaleReport";
  static const getpurchaseReport = "Transaction/PurchaseReport";
  static const getsuppliersReport = "Transaction/SupplierReport";
  static const getexpenseReport = "Transaction/ExpenseReport";
  static const getcashflowReport = "Transaction/CashFlow";
  ////////////// expense and purchase

  static const getexpensePurchaseyearType = "Transaction/GetYearTransactions/";
//////////////// delete transaction /////////////////////

  static const deletepurchase = "Transaction/DeletePurchase/";
  static const deleteSale = "Transaction/DeleteSale/";
  static const deleteExpense = "Transaction/DeleteExpense/";
  static const getDeleted = "Transaction/GetDeletedTransactions";
  ///////////// Recover transaction ///////////////////

  static const recoverExpense = "Transaction/RecoverExpense/";
  static const recoverPurchase = "Transaction/RecoverPurchase/";
  static const recoverSale = "Transaction/RecoverSale/";

  /// day wise graph
  static const getdayWiseGraph = "Transaction/GetDayWiseSalePurchaseExpense/";

  static String apikey =
      "G8I8cS9Uyncyl0GIXHZfPIosrXnqyTwBZa4Z0utvWG5FrnTGdvxD482MFcDSJLjb8JAjZsqpt4SYyjj3VimcQXTKxcyXsQTjvTJVhRQ9rUDHVzIds2x88oLfFwDtpudS";
}
