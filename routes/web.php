<?php

// ************************************ ADMIN SECTION **********************************************
Route::get('/', 'Admin\DashboardController@index')->name('admin.dashboard');

Route::prefix('admin')->group(function() {
  //------------ ADMIN LOGIN SECTION ------------
  Route::get('/login', 'Admin\LoginController@showLoginForm')->name('admin.login');
  Route::post('/login', 'Admin\LoginController@login')->name('admin.login.submit');
  Route::get('/forgot', 'Admin\LoginController@showForgotForm')->name('admin.forgot');
  Route::post('/forgot', 'Admin\LoginController@forgot')->name('admin.forgot.submit');
  Route::get('/logout', 'Admin\LoginController@logout')->name('admin.logout');
  //------------ ADMIN LOGIN SECTION ENDS ------------

  //------------ ADMIN DASHBOARD & PROFILE SECTION ------------
  Route::get('/', 'Admin\DashboardController@index')->name('admin.dashboard');
  Route::get('/profile', 'Admin\DashboardController@profile')->name('admin.profile');
  Route::post('/profile/update', 'Admin\DashboardController@profileupdate')->name('admin.profile.update');
  Route::get('/password', 'Admin\DashboardController@passwordreset')->name('admin.password');
  Route::post('/password/update', 'Admin\DashboardController@changepass')->name('admin.password.update');
  //------------ ADMIN DASHBOARD & PROFILE SECTION ENDS ------------

  Route::get('/options', 'Admin\OptionController@index')->name('admin-option-index');
  Route::get('/options/datatables', 'Admin\OptionController@datatables')->name('admin-option-datatables');
  Route::get('/option/create', 'Admin\OptionController@create')->name('admin-option-create');    
  Route::post('/option/create', 'Admin\OptionController@store')->name('admin-option-store');
  Route::get('/option/edit/{id}', 'Admin\OptionController@edit')->name('admin-option-edit');
  Route::post('/option/update/{id}', 'Admin\OptionController@update')->name('admin-option-update');
  Route::get('/option/show/{id}', 'Admin\OptionController@show')->name('admin-option-show');
  Route::get('/option/delete/{id}', 'Admin\OptionController@destroy')->name('admin-option-delete');

  Route::get('/weeks', 'Admin\WeekController@index')->name('admin-week-index');
  Route::get('/weeks/datatables', 'Admin\WeekController@datatables')->name('admin-week-datatables');
  Route::get('/week/create', 'Admin\WeekController@create')->name('admin-week-create');    
  Route::post('/week/create', 'Admin\WeekController@store')->name('admin-week-store');
  Route::get('/week/edit/{id}', 'Admin\WeekController@edit')->name('admin-week-edit');
  Route::post('/week/update/{id}', 'Admin\WeekController@update')->name('admin-week-update');
  Route::get('/week/show/{id}', 'Admin\WeekController@show')->name('admin-week-show');
  Route::get('/week/delete/{id}', 'Admin\WeekController@destroy')->name('admin-week-delete');

  Route::get('/zones', 'Admin\ZoneController@index')->name('admin-zone-index');
  Route::get('/zones/datatables', 'Admin\ZoneController@datatables')->name('admin-zone-datatables');
  Route::get('/zone/create', 'Admin\ZoneController@create')->name('admin-zone-create');    
  Route::post('/zone/create', 'Admin\ZoneController@store')->name('admin-zone-store');
  Route::get('/zone/edit/{id}', 'Admin\ZoneController@edit')->name('admin-zone-edit');
  Route::post('/zone/update/{id}', 'Admin\ZoneController@update')->name('admin-zone-update');
  Route::get('/zone/show/{id}', 'Admin\ZoneController@show')->name('admin-zone-show');
  Route::get('/zone/delete/{id}', 'Admin\ZoneController@destroy')->name('admin-zone-delete');

  Route::get('/agents', 'Admin\AgentController@index')->name('admin-agent-index');
  Route::get('/agents/datatables', 'Admin\AgentController@datatables')->name('admin-agent-datatables');
  Route::get('/agent/create', 'Admin\AgentController@create')->name('admin-agent-create');    
  Route::post('/agent/create', 'Admin\AgentController@store')->name('admin-agent-store');
  Route::get('/agent/edit/{id}', 'Admin\AgentController@edit')->name('admin-agent-edit');
  Route::post('/agent/update/{id}', 'Admin\AgentController@update')->name('admin-agent-update');
  Route::get('/agent/show/{id}', 'Admin\AgentController@show')->name('admin-agent-show');
  Route::get('/agent/delete/{id}', 'Admin\AgentController@destroy')->name('admin-agent-delete');

  Route::get('/sales', 'Admin\SaleController@index')->name('admin-sale-index');
  Route::get('/sales/datatables', 'Admin\SaleController@datatables')->name('admin-sale-datatables');
  Route::get('/sale/create', 'Admin\SaleController@create')->name('admin-sale-create');
  Route::get('/sale/create/{zone_id}', 'Admin\SaleController@createAgent')->name('admin-sale-agent');
  Route::get('/sale/create/{zone_id}/{agent_id}', 'Admin\SaleController@createOption')->name('admin-sale-option');
  Route::post('/sale/create', 'Admin\SaleController@store')->name('admin-sale-store');
  Route::get('/sale/edit/{id}', 'Admin\SaleController@edit')->name('admin-sale-edit');
  Route::post('/sale/update/{id}', 'Admin\SaleController@update')->name('admin-sale-update');
  Route::get('/sale/show/{id}', 'Admin\SaleController@show')->name('admin-sale-show');
  Route::get('/sale/delete/{id}', 'Admin\SaleController@destroy')->name('admin-sale-delete');

  Route::get('/banks', 'Admin\BankController@index')->name('admin-bank-index');
  Route::get('/banks/datatables', 'Admin\BankController@datatables')->name('admin-bank-datatables');
  Route::get('/bank/create', 'Admin\BankController@create')->name('admin-bank-create');    
  Route::post('/bank/create', 'Admin\BankController@store')->name('admin-bank-store');
  Route::get('/bank/edit/{id}', 'Admin\BankController@edit')->name('admin-bank-edit');
  Route::post('/bank/update/{id}', 'Admin\BankController@update')->name('admin-bank-update');
  Route::get('/bank/show/{id}', 'Admin\BankController@show')->name('admin-bank-show');
  Route::get('/bank/delete/{id}', 'Admin\BankController@destroy')->name('admin-bank-delete');

  Route::get('/terminals', 'Admin\TerminalController@index')->name('admin-terminal-index');
  Route::get('/terminals/datatables', 'Admin\TerminalController@datatables')->name('admin-terminal-datatables');
  Route::get('/terminal/create', 'Admin\TerminalController@create')->name('admin-terminal-create');    
  Route::post('/terminal/create', 'Admin\TerminalController@store')->name('admin-terminal-store');
  Route::get('/terminal/edit/{id}', 'Admin\TerminalController@edit')->name('admin-terminal-edit');
  Route::post('/terminal/update/{id}', 'Admin\TerminalController@update')->name('admin-terminal-update');
  Route::get('/terminal/show/{id}', 'Admin\TerminalController@show')->name('admin-terminal-show');
  Route::get('/terminal/delete/{id}', 'Admin\TerminalController@destroy')->name('admin-terminal-delete');
  
  Route::get('/photos/datatables', 'Admin\PhotoController@datatables')->name('admin-photo-datatables');
  Route::get('/photos', 'Admin\PhotoController@index')->name('admin-photo-index');
  Route::get('/photo/create', 'Admin\PhotoController@create')->name('admin-photo-create');
  Route::get('/photo/edit/{id}', 'Admin\PhotoController@edit')->name('admin-photo-edit');
  Route::post('/photo/edit/{id}', 'Admin\PhotoController@update')->name('admin-photo-update');
  Route::get('/photo/delete/{id}', 'Admin\PhotoController@delete')->name('admin-photo-delete');
  Route::post('/photo/create', 'Admin\PhotoController@store')->name('admin-photo-store');

  Route::get('/role/datatables', 'Admin\RoleController@datatables')->name('admin-role-datatables');
  Route::get('/role', 'Admin\RoleController@index')->name('admin-role-index');
  Route::get('/role/create', 'Admin\RoleController@create')->name('admin-role-create');
  Route::post('/role/create', 'Admin\RoleController@store')->name('admin-role-store');
  Route::get('/role/edit/{id}', 'Admin\RoleController@edit')->name('admin-role-edit');
  Route::post('/role/edit/{id}', 'Admin\RoleController@update')->name('admin-role-update');
  Route::get('/role/delete/{id}', 'Admin\RoleController@destroy')->name('admin-role-delete');
// ************************************ ADMIN SECTION ENDS**********************************************



});