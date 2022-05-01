<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware'=>'api_route'],function(){
    Route::get('/test', 'Api\TestController@index')->name('api.test');
    Route::get('/insert/{id1}/{id2}', 'Api\TestController@insertIncon')->name('api.insertIncon');

    Route::get('/csrf/documents', 'Api\CsrfController@documents')->name('api.csrf.documents');
    Route::get('/csrf/metrics', 'Api\CsrfController@metrics')->name('api.csrf.metrics');
    Route::get('/csrf/search', 'Api\CsrfController@search')->name('api.csrf.search');
    Route::get('/csrf/billing', 'Api\CsrfController@billing')->name('api.csrf.billing');
    Route::get('/csrf/_export', 'Api\CsrfController@_export')->name('api.csrf._export');
    Route::get('/csrf/notifications', 'Api\CsrfController@notifications')->name('api.csrf.notifications');
    Route::get('/csrf/folders', 'Api\CsrfController@folders')->name('api.csrf.folders');
    Route::get('/csrf/social', 'Api\CsrfController@social')->name('api.csrf.social');
    Route::get('/csrf/comments', 'Api\CsrfController@social')->name('api.csrf.comments');
    Route::get('/csrf/profile', 'Api\CsrfController@social')->name('api.csrf.comments');
    Route::get('/csrf/media', 'Api\CsrfController@social')->name('api.csrf.comments');
    
    Route::get('/alerts/active', 'Api\AlertController@active')->name('api.alert.active');
    
    Route::group(['middleware'=>'auth:api'],function(){
        Route::post('/metrics', 'Api\MetricsController@index')->name('api.metrics.index');

        /////////////////// DOCUMENT SECTION ////////////////
        Route::get('/documents', 'Api\DocumentController@get')->name('api.documents.get');
        Route::get('/documents/search', 'Api\DocumentController@search')->name('api.document.search');
        Route::get('/documents/{id}', 'Api\DocumentController@getdocument')->name('api.document.get');
        Route::post('/documents/{id}', 'Api\DocumentController@postdocument')->name('api.document.post');

        Route::get('/documents/{id}/media', 'Api\DocumentController@getmedia')->name('api.document.get.media');

        Route::post('/documents', 'Api\DocumentController@duplicate')->name('api.document.duplicate');
        Route::get('/doctypes', 'Api\DocumentController@doctypes')->name('api.document.doctypes');

        Route::post('/documents/{id}/content', 'Api\DocumentController@savecontent')->name('api.document.save.content');
        Route::post('/documents/{id}/content/pages/{page_id}', 'Api\DocumentController@savepagecontent')->name('api.document.save.pagecontent');
        Route::post('/documents/{id}/content/title', 'Api\DocumentController@savetitle')->name('api.document.save.title');
        Route::get('/documentcreationoption/expanded', 'Api\DocumentController@expanded')->name('api.document.expanded');

        /////////////////// DOCUMENT SECTION ////////////////
        
        //my designs
        Route::get('/vfolders/brands/{brandId}/users/{userId}/designs/all', 'Api\DesignController@getAllDesigns')->name('api.designs.all');
        Route::get('/vfolders/brands/{brandId}/users/{userId}/designs/trash', 'Api\DesignController@getTrashedDesigns')->name('api.designs.trash');
        
        /////////////////// PROFILE SECTION ////////////////
        Route::get('/profile/user/uiinfo', 'Api\ProfileController@uiinfo')->name('api.profile.uiinfo');
        Route::get('/profile/users/{userId}', 'Api\ProfileController@userInfo')->name('api.profile.userInfo');
        Route::get('/profile/users', 'Api\ProfileController@userInfos')->name('api.profile.userInfos');
        Route::get('/profile/brands/{brandId}', 'Api\ProfileController@getbrand')->name('api.profile.getbrand');
        Route::get('/profile/brands/{brandId}/members', 'Api\ProfileController@getbrandmembers')->name('api.profile.getbrandmembers');
        /////////////////// PROFILE SECTION ////////////////

        Route::get('/search', 'Api\SearchController@search')->name('api.search');
        Route::post('/search/click', 'Api\SearchController@click')->name('api.search.click');

        Route::get('/vfolders/brands/{brandId}/designs/layouts', 'Api\TemplateController@get')->name('api.template');

        Route::get('/licenses', 'Api\LicenseController@licenses')->name('api.licenses');
        
        /////////////////// MEDIA SECTION ////////////////
        Route::get('/media', 'Api\MediaController@medias')->name('api.medias');
        Route::get('/media/{mediaId}', 'Api\MediaController@media')->name('api.media');
        Route::post('/media', 'Api\MediaController@uploadMedia')->name('api.media.upload');
        Route::get('/media/{mediaId}/{versionId}', 'Api\MediaController@getMedia')->name('api.media.get');
        Route::post('/media/{mediaId}/aws/upload', 'Api\MediaController@uploadAWSMedia')->name('api.media.aws.upload');
        Route::post('/media/{mediaId}/{versionId}', 'Api\MediaController@uploadMediaImport')->name('api.media.upload.import');
        /////////////////// MEDIA SECTION ////////////////
        
        
        Route::post('/billing/invoice', 'Api\BillingController@invoice')->name('api.billing.invoice');
        Route::post('/billing/invoice/{code}', 'Api\BillingController@invoicesync')->name('api.billing.invoicesync');

        Route::post('/_export', 'Api\ExportController@export')->name('api.export');
        Route::get('/_export/{id}', 'Api\ExportController@exportVersion')->name('api.export');

        Route::get('/notifications/user', 'Api\NotificationController@getUserNotfs')->name('api.notification.user.get');
        Route::post('/notifications/user', 'Api\NotificationController@postUserNotfs')->name('api.notification.user.post');
        
        Route::get('/folders/{id}', 'Api\FolderController@get')->name('api.folders');
        Route::post('/folders/~', 'Api\FolderController@create')->name('api.folder.create');
        Route::post('/folders/{id}', 'Api\FolderController@setFolderSetting')->name('api.folder.set.setting');

        //comments
        Route::get('/comments/{docId}', 'Api\CommentController@docComments')->name('api.comment.doc');
        Route::post('/comments/{docId}', 'Api\CommentController@saveDocComments')->name('api.comment.save.doc');
        //comments

        Route::get('/social/documents/{docId}/profile', 'Api\SocialController@docProfile')->name('api.social.doc.profile');
        
    });

});



