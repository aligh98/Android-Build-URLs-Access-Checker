# Google / Android / Flutter Access Check

این اسکریپت برای بررسی سریع و قابل‌اعتماد دسترسی به سرویس‌های حیاتی توسعه اندروید و فلاتر نوشته شده.

در ایران به دلیل محدودیت‌های IP، تحریم‌ها و کیفیت متفاوت VPNها، دسترسی به ابزارهای توسعه رسمی اندروید با محدودیت شدید مواجه هست.
- Gradle
- Android SDK
- Firebase یا Google APIs ناپایدار

این ابزار چک میکنه که دسترسی لازم به منابع اصلی برقرار هست یا بنا به هر دلیلی (مثل IP کثیف) این دسترسی برقرار نیست.

---

## چه چیزهایی بررسی میشه؟

- Android SDK repositories (`dl.google.com`)
- Google Maven repository
- Gradle Plugin Portal
- Google OAuth / OpenID endpoints
- Google APIs certificates

---

## چه زمانی استفاده کنیم؟

- قبل از اجرای `flutter build` یا `gradle build`
- هنگام تست VPN یا تغییر IP
- وقتی build بدون دلیل مشخص fail می‌شود
- برای اطمینان از اینکه مشکل از کد نیست، از دسترسی شبکه است

---

## خروجی

- `PASS +` یعنی دسترسی برقرار است
- `FAIL -` یعنی دسترسی وجود ندارد یا قابل استفاده نیست

---

## اجرا

روی ویندوز 10 یا 11:
اجرای اسکریپت با Double-click

یا از طریق خط فرمان
```bat
check-google-android.bat
