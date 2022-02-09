/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-01-30 21:46:56
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-02-09 19:40:34
 */
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>?> spGetColorData() async {
  try {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getStringList("colorData");
  } catch (e, s) {
    debugPrint(e.toString());
    debugPrint(s.toString());
    return null;
  }
}

Future<void> spSaveColorData(List<String> ls) async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  await _preferences.setStringList("colorData", ls);
}

Future<List<String>?> spGetEmojiData() async {
  try {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getStringList("emoji");
  } catch (e, s) {
    debugPrint(e.toString());
    debugPrint(s.toString());
    return null;
  }
}

Future<void> spAppendColorData(String emoji) async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  var res = await spGetEmojiData();
  if (null == res) {
    await _preferences.setStringList("emoji", []);
    res = [];
  }
  if (!res.contains(emoji)) {
    if (res.length == 30) {
      res.removeAt(0);
    }
    res.add(emoji);
  }

  _preferences.setStringList("emoji", res);
}

Future<String> spGetFolderStructure() async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  var res = _preferences.getString("fileStructure");
  if (res == null) {
    return "";
  } else {
    return res;
  }
}

Future<List<String>> spGetFolderFlattenStructure() async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  var res = _preferences.getStringList("flatten");
  if (res == null) {
    return [];
  } else {
    return res;
  }
}

Future<void> spSetFolderStructure(String s) async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  await _preferences.setString("fileStructure", s);
}

Future<void> spSetFolderFlattenStructure(List<String> s) async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  await _preferences.setStringList("flatten", s);
}
