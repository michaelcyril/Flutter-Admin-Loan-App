// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:loan_admin_app/constants/app_constants.dart';
import 'package:loan_admin_app/helper/api/api_client_http.dart';

class LoanManagementProvider with ChangeNotifier {
  var _pendingLoanList;
  var _rejectedLoanList;
  var _acceptedLoanList;

  get getPendingLoanList => _pendingLoanList;
  get getRejectedLoanList => _rejectedLoanList;
  get getAcceptedLoanList => _acceptedLoanList;

 Future<bool> getPendLoanList() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest("${AppConstants.getLoanUrl}?q=a&status=PENDING");
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body["error"] == false) {
          _pendingLoanList = body['data'];
          notifyListeners();
          return true;
        }
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

 Future<bool> getRejectLoanList() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest("${AppConstants.getLoanUrl}?q=a&status=REJECTED");
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body["error"] == false) {
          _rejectedLoanList = body['data'];
          notifyListeners();
          return true;
        }
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

 Future<bool> getAcceptLoanList() async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).getRequest("${AppConstants.getLoanUrl}?q=a&status=ACCEPTED");
      if (res == null) {
        return false;
      } else {
        var body = res;
        if (body["error"] == false) {
          _acceptedLoanList = body['data'];
          notifyListeners();
          return true;
        }
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> changeStatus(ctx, data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-Type': 'application/json',
      }).postRequest(AppConstants.changeLoanStatusUrl, data);
      if (res == null) {
        return false;
      } else {
        var body = res;
        print(body['chenge']);
        if (body['chenge']) {
          getAcceptLoanList();
          getPendLoanList();
          return true;
        }
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
