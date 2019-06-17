//
//  URLMacros.h
//  ZLUniversalAPP
//
//  Created by 周利 on 2019/6/12.
//  Copyright © 2019 周利. All rights reserved.
//

#ifndef URLMacros_h
#define URLMacros_h
/*

 将项目中所有的接口写在这里,方便统一管理,降低耦合
 
 这里通过宏定义来切换你当前的服务器类型,
 将你要切换的服务器类型宏后面置为真(即>0即可),其余为假(置为0)
 如下:现在的状态为测试服务器
 这样做切换方便,不用来回每个网络请求修改请求域名,降低出错事件
 */
#define TestSever       0
#define ProductSever    1

#if TestSever
/**测试服务器*/
#define BaseUrl @"http://jww.vyeahcorp.com/index.php/"
#define ImageBaseUrl @"http://jww.vyeahcorp.com/"
#define ShareBaseUrl @"http://jww.vyeahcorp.com"
#define VIPShareBaseUrl @"http://47.92.210.184"
#define ChaodaShareBaseUrl @"http://47.92.210.184/css_share/"

#elif ProductSever

/**生产服务器*/
#define BaseUrl @"http://121.196.214.146/css/public/index.php/"
#define ImageBaseUrl @"http://121.196.214.146/css/public/"
#define ShareBaseUrl @"http://121.196.214.146/css"
#define VIPShareBaseUrl @"http://share.supersg.cn"
#define ChaodaShareBaseUrl @"http://47.92.210.184/css_share/"

#endif


//1.获取用户信息
#define user_user_getUserInfo  @"user/user/getUserInfo"
//2.banner列表
#define user_index_bannerList  @"user/index/bannerList"
//3.获取城市数据-热门城市-首字母排序
#define user_index_getCityData  @"user/index/getCityData"
//4.推荐房源列表-长租
#define user_house_recommendHouseList  @"user/house/recommendHouseList"
//5.房源详情-长租
#define user_house_houseDetail  @"user/house/houseDetail"
//6.获取区域数据
#define user_index_getAreaData  @"user/index/getAreaData"
//7.获取地铁数据
#define user_index_getSubwayData @"user/index/getSubwayData"
//8.获取交通与位置标签-短租
#define user_index_getTrafficTagData @"user/index/getTrafficTagData"
//9.房源列表-条件筛选-长租
#define user_house_houseList @"user/house/houseList"
//10.地图看房1  地图看房2  地图看房3
#define user_house_mapHouse @"user/house/mapHouse"
//11.手机号登录
#define user_user_login @"user/user/login"
//12.获取验证码
#define user_user_getVerifyCode @"user/user/getVerifyCode"
//13.修改密码
#define user_user_modifyPassword @"user/user/modifyPassword"
//14.忘记密码
#define user_user_forgetPassword @"user/user/forgetPassword"
//15.手机号注册
#define user_user_register @"user/user/register"
//16.修改用户信息
#define user_user_modifyUserInfo @"user/user/modifyUserInfo"
//17.关于我们&联系客服
#define user_index_aboutUs @"user/index/aboutUs"
//18.收货地址列表
#define user_user_addressList @"user/user/addressList"
//19.添加收货地址
#define user_user_addaddress @"user/user/addaddress"
//20.修改收货地址
#define user_user_modifyAddress @"user/user/modifyAddress"
//21.删除收货地址
#define user_user_deleteAddress @"user/user/deleteAddress"
//22.意见反馈
#define user_user_feedback @"user/user/feedback"
//23.用户收藏列表-长租  用户收藏列表-短租
#define user_user_collectionList @"user/user/collectionList"
//24.收藏房源-长租
#define user_house_collection @"user/house/collection"
//25.取消收藏-长租
#define user_house_cancelCollection @"user/house/cancelCollection"
//26.房屋委托
#define user_house_houseEntrust @"user/house/houseEntrust"
//27.获取商品分类
#define user_goods_getGoodsClass @"user/goods/getGoodsClass"
//28.商品列表
#define user_goods_goodslist @"user/goods/goodslist"
//29.获取省市区三级列表
#define user_index_getProvinceData @"user/index/getProvinceData"
//30.商品详情
#define user_goods_goodsDetail @"user/goods/goodsDetail"
//31.加入购物车
#define user_shopping_cart_addShoppingCart @"user/shopping_cart/addShoppingCart"
//32.购物车列表
#define user_shopping_cart_shoppingCartList @"user/shopping_cart/shoppingCartList"
//33.商品评论列表
#define user_goods_goodsCommentList @"user/goods/goodsCommentList"
//34.提交订单
#define user_order_submit @"user/order/submit"
//35.删除购物车商品
#define user_shopping_cart_deleteShoppingCartGoods @"user/shopping_cart/deleteShoppingCartGoods"
//36.订单列表
#define user_order_orderList @"user/order/orderList"
//37.订单详情
#define user_order_orderDetail @"user/order/orderDetail"
//38.取消订单
#define user_order_cancel @"user/order/cancel"
//39.删除订单
#define user_order_deleteOrder @"user/order/deleteOrder"
//40.订单确认收货
#define user_order_confirm @"user/order/confirm"
//41.获取订单支付信息
#define user_order_getPayInfo @"user/order/getPayInfo"
//42.预定租房-长租
#define user_house_reserveRenting @"user/house/reserveRenting"
//43.获取订单支付信息-长租订单
#define user_house_getPayInfo @"user/house/getPayInfo"
//44.获取订单支付信息-短租订单
#define user_houseShort_getPayInfo @"user/house_short/getPayInfo"
//45.订单列表-长租
#define user_house_orderList @"user/house/orderList"
//46.订单列表-短租
#define user_house_short_orderList @"user/house_short/orderList"
//47.取消订单-长租
#define user_house_cancelOrder @"user/house/cancelOrder"
//48.删除订单-长租
#define user_house_deleteOrder @"user/house/deleteOrder"
//49.订单详情-长租
#define user_house_orderDetail @"user/house/orderDetail"
//50.获取房屋类型数据
#define user_index_getHouseTypeData @"user/index/getHouseTypeData"
//51.房源列表-短租
#define user_house_short_houseList @"user/house_short/houseList"
//52.房源详情-短租
#define user_house_short_houseDetail @"user/house_short/houseDetail"
//53.入住须知
#define user_house_short_shortRule @"user/house_short/shortRule"
//54.收藏房源-短租
#define user_house_short_collection @"user/house_short/collection"
//55.取消收藏-短租
#define user_house_short_cancelCollection @"user/house_short/cancelCollection"
//56.评论列表-短租
#define user_house_short_commentList @"user/house_short/commentList"
//57.入住人列表
#define user_house_short_peopleList @"user/house_short/peopleList"
//58.添加入住人
#define user_house_short_addPeople @"user/house_short/addPeople"
//59.短租预订
#define user_house_short_reserve @"user/house_short/reserve"
//60.订单详情 -短租
#define user_house_short_orderDetail @"user/house_short/orderDetail"
//61.取消订单-短租 （待支付和已支付取消）
#define user_house_short_cancelOrder @"user/house_short/cancelOrder"
//62.删除订单-短租
#define user_house_short_deleteOrder @"user/house_short/deleteOrder"
//63.搜索地址-短租
#define user_house_short_searchAddress @"user/house_short/searchAddress"
//64.获取房源标签数据
#define user_index_getHouseTagData @"user/index/getHouseTagData"
//65.评论订单
#define user_order_comment @"user/order/comment"
//66.获取房源配置数据
#define user_index_getHouseConfigData @"user/index/getHouseConfigData"
//67.订单评论-短租
#define user_house_short_comment @"user/house_short/comment"
//68.按小区/街道搜索房源-长租
#define user_house_searchHouse @"user/house/searchHouse"
//69.购物车数量加减
#define user_shopping_cart_shoppingCartEdit @"user/shopping_cart/shoppingCartEdit"
//70.删除入住人
#define user_house_short_deletePeople @"user/house_short/deletePeople"
//71.城市搜索
#define user_index_citySearch @"user/index/citySearch"


/*         商城2.0         */
//1.获取普通店铺分类
#define user_product_getStoreCategory @"user/product/getStoreCategory"
//2.首页店铺列表
#define user_product_storeList @"user/product/storeList"
//3.附近店铺
#define user_product_nearbyStore @"user/product/nearbyStore"
//4.获取会员店铺分类列表
#define user_product_getMemberCategory @"user/product/getMemberCategory"
//5.会员店铺列表
#define user_product_memberStoreList @"user/product/memberStoreList"
//6.店铺详情
#define user_product_storeDetail @"user/product/storeDetail"
//7.获取店铺内产品分类
#define user_product_getProductCategory @"user/product/getProductCategory"
//7.普通商城商品列表
#define user_product_productList @"user/product/productList"
//8.普通商城商品列表
#define user_product_productDetail @"user/product/productDetail"
//9.商品评论列表
#define user_product_productCommentList @"user/product/productCommentList"
//10.商品评论列表
#define user_user_couponList @"user/user/couponList"
//11.提交订单
#define user_order_submitOrder @"user/order/submitOrder"
//12.店铺正在拼团列表
#define user_product_storePtList @"user/product/storePtList"
//13.重新生成订单号
#define user_order_editOrderNo @"user/order/editOrderNo"
//14.会员商品列表
#define user_product_memberProductList @"user/product/memberProductList"
//15.商品售后
#define user_order_shouhou @"user/order/shouhou"
//16.收藏商品
#define user_product_collection @"user/product/collection"
//17.取消收藏
#define user_product_cancelCollection @"user/product/cancelCollection"
//18.用户收藏列表
#define user_product_collectionList @"user/product/collectionList"
//19.用户消息列表
#define user_user_msgList @"user/user/msgList"
//20.代购记录
#define user_user_dgRecord @"user/user/dgRecord"
//21.代购记录
#define user_user_tixian @"user/user/tixian"
//22.验证支付密码
#define user_user_payPwdVerify @"user/user/payPwdVerify"
//23.用户设置支付密码
#define user_user_setPayPassword @"user/user/setPayPassword"
//24.用户收支记录
#define user_user_userMoneyRecord @"user/user/userMoneyRecord"
//25.搜索店铺
#define user_product_searchStore @"user/product/searchStore"
//26.热门搜索
#define user_product_hotSearch @"user/product/hotSearch"
//27.删除订单
#define user_order_delete @"user/order/delete"
//28.分享商品
#define user_product_share @"user/product/share"
//29.获取版本号
#define user_index_getVersion @"user/index/getVersion"
//30.会员店铺banner
#define user_product_member_store_banner @"user/product/memberStoreBanner"
//31.店铺评论列表
#define user_product_storeCommentList @"user/product/storeCommentList"
//32.店铺评论列表
#define user_product_storeDianzan @"user/product/storeDianzan"
//33.店铺评论点赞
#define user_product_storeCommentDianzan @"user/product/storeCommentDianzan"
//34.店铺评论
#define user_product_storeComment @"user/product/storeComment"
//35.添加收货地址
#define user_order_addShouhuoAddress @"user/order/addShouhuoAddress"
//36.增加活跃
#define user_user_addActive @"user/user/addActive"
//37.品牌列表
#define user_product_brandList @"user/product/brandList"

//zl
//38.礼包列表
#define user_product_gifpacklist @"user/product/giftpacklist"

//39.礼包详情
#define user_product_giftpackDetail @"user/product/giftpackDetail"

//40、会员价格
#define user_product_memberPrice @"user/product/memberPrice"

//41.卡券列表
#define user_user_cardList @"user/user/cardList"

//42、大礼包订单支付信息
#define user_product_giftpackPayInfo @"user/product/giftpackPayInfo"

//443、苹果内购（验证收据）
#define user_appstore_apple_pay @"user/appstore/apple_pay"

//44、苹果支付信息(产品ID请求数据)
#define user_product_applePayInfo @"user/product/applePayInfo"

//45、提交订 单购买大礼包
#define user_product_submitGiftpackOrder @"user/product/submitGiftpackOrder"

//46.1提交订单 购买会员
#define user_product_submitMemberOrder @"user/product/submitMemberOrder"


//==================================================================潮搭相关
//关注列表
#define  user_user_storeFollowList @"user/user/storeFollowList"
//潮搭列表
#define user_chaoda_chaodaList @"user/chaoda/chaodaList"
//潮搭拼团列表
#define user_chaoda_chaodaPtList @"user/chaoda/chaodaPtList"
//潮搭评论列表
#define user_chaoda_chaodaCommentList @"user/chaoda/chaodaCommentList"
//推荐商品
#define user_product_recommendProduct @"/user/product/recommendProduct"
//取消关注店铺
#define user_chaoda_cancelFollow @"user/chaoda/cancelFollow"
//关注店铺
#define user_chaoda_followStore @"user/chaoda/followStore"
//潮搭取消收藏
#define user_chaoda_cancelCollection @"user/chaoda/cancelCollection"
//潮搭取消点赞
#define user_chaoda_cancelDianzan @"user/chaoda/cancelDianzan"
//潮搭评论
#define user_chaoda_comment @"user/chaoda/comment"
//潮搭收藏
#define user_chaoda_collection @"user/chaoda/collection"
//风格列表
#define user_chaoda_styleList @"user/chaoda/styleList"
//潮搭点赞
#define user_chaoda_dianzan @"user/chaoda/dianzan"
//收藏的潮搭列表
#define user_chaoda_collectionChaodaList @"user/chaoda/collectionChaodaList"
//潮搭分享计数
#define user_chaoda_shareCount @"user/chaoda/shareCount"
//潮搭详情
#define user_chaoda_chaodaShare @"user/chaoda/chaodaShare"

#endif /* URLMacros_h */
