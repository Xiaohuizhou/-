//
//  Alldefined.h
//  雨露健康助手
//
//  Created by 周凯辉 on 15/9/27.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#define _______Alldefined_h
#define _______Alldefined_h
//屏幕尺寸
#define screenRect  [[UIScreen mainScreen] bounds]
#define  WIDTH ([UIScreen mainScreen].bounds.size.width)

#define HEIGHT ([UIScreen mainScreen].bounds.size.height)

//字体大小
#define UIFont(x) [UIFont systemFontOfSize:x]
//加粗
#define UIBoldFont(x) [UIFont boldSystemFontOfSize:x]

//滚动视图
#define Scrch_URL @"http://api.m.xywy.com/api/?m=Public&act=bannerImage&module=ask&version=3.6&app=ask&sign=0d452b651f011950d9f58a14fe0501d2"

//预约挂号
//http://api.wws.xywy.com/index.php?act=zhuanjia&fun=Doctor&tag=app&sign=9b7da964e54e330952501c8b44c86f74&source=xywy_app&is_plus=1&type=speciality&level=2&pagesize=20&PageNum=1
#define WEIGH_URL @"http://api.wws.xywy.com/index.php?act=zhuanjia&fun=Doctor&tag=app&sign=9b7da964e54e330952501c8b44c86f74&source=xywy_app&is_plus=1&type=speciality&level=2&pagesize=20"

//专家详情 ?act=app&fun=doctor&source=xywy_app&id=22903&tag=app&sign=9b7da964e54e330952501c8b44c86f74
#define ZHUANJIA_URL @"http://api.wws.xywy.com/index.php"

//电话医生
//http://api.wws.xywy.com/index.php?act=zhuanjia&fun=PhoneDoctor&tag=app&sign=9b7da964e54e330952501c8b44c86f74&page=1&page_size=20

#define IPOHE_URL @"http://api.wws.xywy.com/index.php?act=zhuanjia&fun=PhoneDoctor&tag=app&sign=9b7da964e54e330952501c8b44c86f74&province_name=%E5%8C%97%E4%BA%AC%E5%B8%82"

//电话医生详情
//http://api.wws.xywy.com/index.php?act=zhuanjia&fun=PhoneDoctorDetalis&tag=app&sign=9b7da964e54e330952501c8b44c86f74&did=22903
//http://api.wws.xywy.com/index.php?act=zhuanjia&pagesize=20&page=0&fun=FamilyDoctor&province=0&tag=zj&sign=2e0d0887581be1c35794ee4c13b00cae

//家庭医生
#define JIATING_URL @"http://api.wws.xywy.com/index.php?act=zhuanjia&pagesize=20&page=0&fun=FamilyDoctor&province=0&tag=zj&sign=2e0d0887581be1c35794ee4c13b00cae"


#define JIATINGXQ_URL @"http://api.wws.xywy.com/index.php?act=zhuanjia"


//http://api.club.xywy.com/mobile_app_article.php?act=category_list
//分类
#define FENLEI_URL @"http://api.club.xywy.com/mobile_app_article.php?act=category_list"

//http://api.club.xywy.com/mobile_app_article.php?act=article_list&first=1&page=1&pagesize=10&sign=a943ddda6830cba5907ec7c8170645f3
//咨询1
#define HEADER_URL @"http://api.club.xywy.com/mobile_app_article.php?act=article_list&first=1&page=%d&pagesize=10&sign=a943ddda6830cba5907ec7c8170645f3"


//两
#define TWO_URL @"http://api.club.xywy.com/mobile_app_article.php?act=article_list&categoryid=29&page=%d&pagesize=10&sign=4d70837f334f5bfa01b9546be5fa7d77"
//母婴

#define THREE_URL @"http://api.club.xywy.com/mobile_app_article.php?act=article_list&categoryid=30&page=%d&pagesize=10&sign=0e5ed7fe8444c678c8ad311e87e07059"

//减肥
#define FOUR_URL @"http://api.club.xywy.com/mobile_app_article.php?act=article_list&categoryid=33&page=%d&pagesize=10&sign=0270c6d8bcb0ccb0b27231aec3a43adc"
//美容
#define FIVE_URL @"http://api.club.xywy.com/mobile_app_article.php?act=article_list&categoryid=34&page=%d&pagesize=10&sign=32db8de759de66d86d9ee1c645e517e1"

//儿科
#define ERKE_URL @"http://api.zhuanjia.xywy.com/zj_app_api.php?&action=get_speciality1_expert&speciality_id=28&page=%d&size=20&sign=fa9a2a7d03a62c093c56a4a340438087"

//内科
#define NEIKE_URL @"http://api.zhuanjia.xywy.com/zj_app_api.php?&action=get_speciality1_expert&speciality_id=2&page=%d&size=20&sign=6b419bd9a0b8919d3db7cde5ae57017c"

//妇产科
#define FUCHAN_URL @"http://api.zhuanjia.xywy.com/zj_app_api.php?&action=get_speciality1_expert&speciality_id=3&page=%d&size=20&sign=a3d67c37207c8c65d31f9ba1b08ef0e6"

//外科http://api.wws.xywy.com/index.php?act=zhuanjia&pagesize=10&page=1&fun=FamilyDoctor&id=299&province=0&tag=zj&sign=2e0d0887581be1c35794ee4c13b00cae
#define WAIKE_URL @"http://api.zhuanjia.xywy.com/zj_app_api.php?&action=get_speciality1_expert&speciality_id=1&page=%d&size=20&sign=c83e005624662d20179519a617208f08"

//附近药店
#define YAODIAN_URL @"http://a.wksc.xywy.com/StoreVirtuallocation/getStoreVirtual&lat=40.043433&lng=116.37672&dis=0.05&aflag=true"

//附近医院
#define YIYUAN_URL @"http://api.wws.xywy.com/index.php?act=zhuanjia&fun=nearHospital&source=xywy_app&distance=10000&longitude=116.376547&latitude=40.043568&pagesize=100&pagenum=1&tag=123&sign=d086f0c78ab6f34621791ba38adf8fde"

//附近医院详情路线
#define YIYUANXQ_URL @"http://api.map.baidu.com/direction?origin=latlng:40.043568,116.376547%7Cname:%E6%88%91%E7%9A%84%E4%BD%8D%E7%BD%AE&destination=name:%E8%88%AA%E7%A9%BA%E6%80%BB%E5%8C%BB%E9%99%A2%7"

//附近医院详情路线2
#define YIYUANXQ1_URL @"&mode=driving&region=%E5%8C%97%E4%BA%AC%E5%B8%82&output=html&src=%E5%AF%BB%E5%8C%BB%E9%97%AE%E8%8D%AF%E7%BD%91%7C%E9%97%AE%E5%8C%BB%E7%94%9F"


//附近药店详情路线
#define YAODIANXQ_URL @"http://map.baidu.com/?l=&s=nav%26sn%3D1%24%24%24%2412955116.13%2C4844523.4%24%24%E6%88%91%E7%9A%84%E4%BD%8D%E7%BD%AE%24%24%24%24%24%24%26en%3D1%24%24%24%2412955440.52%2C4843693.98%24%24%E5%8C%97%E4%BA%AC%E5%9B%BD%E5%A4%A7%E8%8D%AF%E6%88%BF%E8%BF%9E%E9%94%81%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8%E6%9E%97%E8%90%83%E8%B7%AF%E8%BF%9E%E9%94%81%E5%BA%97%24%24%24%24%24%24%26sc%3D131%26ec%3D131"
//http://map.baidu.com/?l=&s=nav%26sn%3D1%24%24%24%2412955116.13%2C4844523.4%24%24%E6%88%91%E7%9A%84%E4%BD%8D%E7%BD%AE%24%24%24%24%24%24%26en%3D1%24%24%24%2412953999.92%2C4844562.07%24%24%E5%8C%97%E4%BA%AC%E5%B8%82%E7%99%BE%E6%B5%8E%E5%A0%82%E8%8D%AF%E5%93%81%E8%B6%85%E5%B8%82%E6%9C%89%E9%99%90%E8%B4%A3%E4%BB%BB%E5%85%AC%E5%8F%B8%E6%B0%B8%E6%B3%B0%E5%BA%84%E5%8C%97%E8%B7%AF%E5%BA%97%24%24%24%24%24%24%26sc%3D131%26ec%3D131
//http://map.baidu.com/?l=&s=nav%26sn%3D1%24%24%24%2412955116.13%2C4844523.4%24%24%E6%88%91%E7%9A%84%E4%BD%8D%E7%BD%AE%24%24%24%24%24%24%26en%3D1%24%24%24%2412954642.02%2C4843741.04%24%24%E5%8C%97%E4%BA%AC%E5%9B%BD%E5%A4%A7%E8%8D%AF %E6%88%BF%E8%BF%9E%E9%94%81 %E6%9C%89%E9%99%90% E5%85%AC%E5%8F%B8%E5%AE%9D%E7%9B%9B%E9%87%8C%E8%BF%9E%E9%94%81 %E5%BA%97%24%24%24%24%24%24%26sc%3D131%26ec%3D131



//点击cell
#define YIYUANXQ2_URL @"http://api.wws.xywy.com/index.php?act=app&fun=hospital&source=xywy_app"

