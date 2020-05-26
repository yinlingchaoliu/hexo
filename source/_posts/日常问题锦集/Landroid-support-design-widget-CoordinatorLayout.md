---
title: Landroid-support-design-widget-CoordinatorLayout
date: 2020-05-26 10:55:48
categories:
- 日常问题锦集
---
将support库 强行设置
```
configurations.all {
    resolutionStrategy {
        force 'com.android.support:support-v4:28.0.0'
        force 'com.android.support:design:28.0.0'
    }
}
```

参考
https://stackoverflow.com/questions/49043551/multiple-dex-files-define-landroid-support-design-widget-coordinatorlayout1
