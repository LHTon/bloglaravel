<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', 'ArticleController@lists');

//登陆的页面显示
Route::get('/login', 'LoginController@login');
Route::post('/login','LoginController@dologin');
Route::get('/logout', 'LoginController@logout');

//文章的详情显示页面
Route::get('/article/{id}.html', [
	'uses'=>'ArticleController@show',
	'as'=>'detail'
	]);
//Route::get('/article/{id}.html', 'ArticleController@show');

Route::get('/articles', 'ArticleController@lists');

//后台路由组
Route::group(['middleware'=>'login'], function(){
	//后台路由规则
	Route::get('/admin', 'AdminController@index');

	//用户管理
	Route::get('/user/add', 'UserController@add');
	Route::post('/user/insert', 'UserController@insert');
	Route::get('/user', 'UserController@index');
	Route::get('/user/edit/{id}', 'UserController@edit');
	Route::post('/user/update', 'UserController@update');
	Route::get('/user/delete/{id}', 'UserController@delete');

	//resful 控制器  一条规则顶七条
	Route::resource('cate', 'CatesController');

	//标签管理
	Route::resource('tag', 'TagController');

	//文章管理
	Route::resource('article', 'ArticleController');

});





