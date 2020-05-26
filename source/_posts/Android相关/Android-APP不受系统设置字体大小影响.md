---
title: Android-APP不受系统设置字体大小影响
date: 2020-05-26 10:55:48
categories:
- Android相关
---

activity回调
```
public class ActivityResourceLifecycleCallback implements Application.ActivityLifecycleCallbacks {

    @Override
    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        getResources( activity );
        //注册fragment
        registerFragmentCallbacks(activity);
    }

    /**
     * 设置标准字体
     */
    public Resources getResources(Activity activity) {
        Resources res = activity.getResources();
        Configuration newConfig = new Configuration();
        newConfig.setToDefaults();//设置默认
        res.updateConfiguration(newConfig, res.getDisplayMetrics());
        return res;
    }

    @Override
    public void onActivityStarted(Activity activity) {
    }

    @Override
    public void onActivityResumed(Activity activity) {
    }

    @Override
    public void onActivityPaused(Activity activity) {
    }

    @Override
    public void onActivityStopped(Activity activity) {
    }

    @Override
    public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
    }

    @Override
    public void onActivityDestroyed(Activity activity) {
    }
}
```
