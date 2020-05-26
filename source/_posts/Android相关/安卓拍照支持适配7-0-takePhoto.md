---
title: 安卓拍照支持适配7-0-takePhoto
date: 2020-05-26 10:55:48
categories:
- Android相关
---
####webview input说明
安卓webview禁用input，网上查看各种方案，都存在弊端。
经过实践，完整可用调研了支持拍照和图片选择上传。

[1、webview支持input标签](https://www.jianshu.com/p/19084bbc0747)
[2、安卓拍照支持适配7.0 takePhoto](https://www.jianshu.com/p/40670b459e56)

####1、快速解决BUG:  exposed beyond app through ClipData.Item.getUri()

第一种方法：拷贝application
```
  // android 7.0系统解决拍照的问题
   StrictMode.VmPolicy.Builder builder = new StrictMode.VmPolicy.Builder();
   StrictMode.setVmPolicy(builder.build());
   builder.detectFileUriExposure();
```

第二种方法：针对sdk 24加入兼容性方案FileProvider

```
    private void takePhoto() {
        String fileName = "IMG_" + DateFormat.format( "yyyyMMdd_hhmmss", Calendar.getInstance( Locale.CHINA ) ) + ".jpg";
        // 步骤一：创建存储照片的文件
        String imagePath = activity.getFilesDir() + File.separator + "images" + File.separator + fileName;
        File file = new File( imagePath );
        //创建文件夹
        if (!file.getParentFile().exists())
            file.getParentFile().mkdirs();

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            //步骤二：Android 7.0及以上获取文件 Uri
            imageUri = FileProvider.getUriForFile( activity, activity.getPackageName() + ".fileprovider", file );
        } else {
            //步骤三：获取文件Uri
            imageUri = Uri.fromFile( file );
        }

        Intent intent = new Intent();
        intent.addFlags( Intent.FLAG_GRANT_READ_URI_PERMISSION );
        intent.setAction( MediaStore.ACTION_IMAGE_CAPTURE );//设置Action为拍照
        intent.putExtra( MediaStore.EXTRA_OUTPUT, imageUri );//将拍取的照片保存到指定URI
        activity.startActivityForResult( intent, FILE_CHOOSER_RESULT_CODE );
    }
```

AndroidManifest.xml 配置FileProvider
```
<provider
    android:name="android.support.v4.content.FileProvider"
    android:authorities="${applicationId}.fileprovider"
    android:exported="false"
    android:grantUriPermissions="true">
    <meta-data
        android:name="android.support.FILE_PROVIDER_PATHS"
        android:resource="@xml/provider_paths" />
</provider>
```

provider_paths.xml 路径转换规则

```
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <external-files-path path="/download" name="download"/>
    <external-path name="external_files" path="."/>
    <files-path  path="images/" name="my_images" />
</resources>
```
<paths>中可以定义以下子节点

| 子节点 | 对应路径方法 |实际路径|
| --- | --- | --- |
| files-path | Context.getFilesDir() |/data/data/com.xxx.xxx/files|
| cache-path | Context.getCacheDir() |/data/data/com.xxx.xxx/cache|
| external-path | Environment.getExternalStorageDirectory() |/storage/emulated/0|
| external-files-path | Context.getExternalFilesDir(null) |/storage/emulated/0/Android/data/com.xxx.xxx/files|
| external-cache-path | Context.getExternalCacheDir() |/storage/emulated/0/Android/data/com.xxx.xxx/cache|

比如路径方法：
String imagePath = activity.getFilesDir() + File.separator + "images" + File.separator + fileName;

配置 path 是真实相对路径 ，name是路径别名
```
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <files-path  path="images/" name="my_images" />
</resources>
```

####相关扩展：apk安装

```
public static void installApk(Context context,String apkName) {
    String apkPath = context.getExternalCacheDir().getPath()+ File.separator+"app"+File.separator +apkName;

    if (TextUtils.isEmpty(apkPath)){
        Toast.makeText(context,"更新失败！未找到安装包", Toast.LENGTH_SHORT).show();
        return;
    }

    File apkFile = new File(apkPath);

    Intent intent = new Intent(Intent.ACTION_VIEW);
    Uri apkUri = null ;
    //Android 7.0 系统共享文件需要通过 FileProvider 添加临时权限，否则系统会抛出 FileUriExposedException .
    if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.N){
       apkUri = FileProvider.getUriForFile(context, (Activity)context.getPackageName()+".fileprovider",apkFile);     intent.setFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
    }else {
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        apkUri = Uri.fromFile(apkFile);
    }
    intent.setDataAndType(apkUri,"application/vnd.android.package-archive");
    context.startActivity(intent);
}


//调用，apkPath 入参就是 xml 中共享的路径
installApk(context,"test.apk");
```

对应的file_paths.xml
```
<?xml version="1.0" encoding="utf-8"?>
<paths xmlns:android="http://schemas.android.com/apk/res/android">
    <external-cache-path path="app/" name="apk"/>
</paths>
```
