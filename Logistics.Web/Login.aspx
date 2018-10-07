<%@ Page Language="C#" AutoEventWireup="true" Title="后台管理系统登录" Inherits="BasePageView<LoginViewData>" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta charset="utf-8">
    <title>后台管理系统登录</title>
    <%= BaseFrameWork.Tool.WebHelper.GetCSSLink("/Front/Css/login.css")%>
    <%= BaseFrameWork.Tool.WebHelper.WriteJSON(BaseFrameWork.Tool.WebHelper.GetQueryInfo())%>
</head>
<body class="loginBg">
    <div class="mainBg">
        <div class="loginHead">
            <a class="logoLogin"></a>
        </div>
        <div class="loginBody">
            <form id="formLogin" method="post" action="/AjaxUserLogin/Login.cspx">
            <input type="hidden" id="RedirectUrl" name="RedirectUrl" value="<%= this.Model.RedirectUrl %>" />
            <div class="loginForm">
                <h2 style="line-height: normal;">
                    后台管理系统</h2>
                <ul>
                    <label class="userName" for="UserCode" title="请输入用户名">
                        <i></i>
                    </label>
                    <input type="text" id="UserCode" name="UserCode" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')"
                        placeholder="输入用户名" />
                </ul>
                <ul>
                    <label class="passWord" for="Password" title="请输入密码">
                        <i></i>
                    </label>
                    <input type="password" id="Password" name="Password" placeholder="输入密码" />
                </ul>
                <a class="loginSubmit" title="点击登录" onclick="window.Utility.Login.login()"><i></i>
                </a>
            </div>
            </form>
        </div>
        <div id="divTxt"></div>
    </div>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/JQuery/jquery.min.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/JQuery/jquery.form.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Common/Utility.js")%>

    <script>
        var t = '                           <a data-fltter="J" data-customerguid="b123c2c8-057e-490b-8013-45841c4e5deb" data-shortname="继丰房产" data-fullname="广州继丰房产开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="继丰房产">继丰房产</a> ' +
'                           <a data-fltter="" data-customerguid="d067f192-c8df-4e66-89d1-d0783282b69c" data-shortname="14年7月18日上海成本公开课" data-fullname="14年7月18日上海成本公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年7月18日上海成本公开课">14年7月18日上海成本公开课</a> ' +
'                           <a data-fltter="" data-customerguid="984bf74b-6c44-4bf8-90c8-cd8d51abc433" data-shortname="14年5月23日北京营销创新公开课" data-fullname="14年5月23日北京营销创新公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年5月23日北京营销创新公开课">14年5月23日北京营销创新公开课</a> ' +
'                           <a data-fltter="" data-customerguid="d1b9ee6b-b8b8-4411-a838-12f149201b20" data-shortname="7月19日南宁运营公开课" data-fullname="7月19日南宁运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="7月19日南宁运营公开课">7月19日南宁运营公开课</a> ' +
'                           <a data-fltter="" data-customerguid="1ae96914-d320-4fdc-964c-302e24846331" data-shortname="14年12月6日广州轻量级成本策划公开课" data-fullname="14年12月6日广州轻量级成本策划公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年12月6日广州轻量级成本策划公开课">14年12月6日广州轻量级成本策划公开课</a> ' +

'                           <a data-fltter="" data-customerguid="06d255d8-cbeb-4270-b43f-af8b5b10c858" data-shortname="14年11月21日深圳绩效公开课" data-fullname="14年11月21日深圳绩效公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年11月21日深圳绩效公开课">14年11月21日深圳绩效公开课</a> ' +
'                           <a data-fltter="" data-customerguid="7c2fdc77-42fa-4a43-9aea-02b478972d9c" data-shortname="4月26日北京运营公开课" data-fullname="4月26日北京运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="4月26日北京运营公开课">4月26日北京运营公开课</a> ' +
'                           <a data-fltter="" data-customerguid="350ac834-6041-4638-85af-4db1f831e339" data-shortname="5月24日青岛运营公开课" data-fullname="5月24日青岛运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="5月24日青岛运营公开课">5月24日青岛运营公开课</a> ' +
'                           <a data-fltter="Z" data-customerguid="5b3aa5c4-d831-4616-8f26-423e29f3c7b9" data-shortname="卓信" data-fullname="绵阳市卓信实业有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="卓信">卓信</a> ' +
'                           <a data-fltter="" data-customerguid="3597c475-b0ff-4640-830d-952d8099f5c2" data-shortname="14年5月23日广州项目总公开课" data-fullname="14年5月23日广州项目总公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年5月23日广州项目总公开课">14年5月23日广州项目总公开课</a> ' +

'                           <a data-fltter="" data-customerguid="7560482b-d52f-40f2-9ca8-bb09a0513c1d" data-shortname="8月30日杭州成本公开课" data-fullname="8月30日杭州成本公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="8月30日杭州成本公开课">8月30日杭州成本公开课</a> ' +
'                           <a data-fltter="" data-customerguid="1618012c-4294-47a2-a9cc-5e95c8f175ab" data-shortname="14年3月28日上海绩效公开课" data-fullname="14年3月28日上海绩效公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年3月28日上海绩效公开课">14年3月28日上海绩效公开课</a> ' +
'                           <a data-fltter="" data-customerguid="079114fb-c5dc-46e6-8354-a4fa6a25895d" data-shortname="8月16日大连运营公开课" data-fullname="8月16日大连运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="8月16日大连运营公开课">8月16日大连运营公开课</a> ' +
'                           <a data-fltter="F" data-customerguid="373bcebb-5e7f-48d3-b6e8-85bd73d56b54" data-shortname="非战略研发中心内部工作" data-fullname="研发中心所有内部工作非战略客户" data-parentshortname="" data-rootshortname="" href="javascript:;" title="非战略研发中心内部工作">非战略研发中心内部工作</a> ' +
'                           <a data-fltter="" data-customerguid="ac7880d3-b0e3-400b-b0d0-9af65f34f373" data-shortname=" （注销）广州市越秀区住宅建设公司" data-fullname=" （注销）广州市越秀区住宅建设公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title=" （注销）广州市越秀区住宅建设公司"> （注销）广州市越秀区住宅建设公司</a> ' +

'                           <a data-fltter="Z" data-customerguid="b0f7cc47-0be7-4bc1-b82e-1ed46918f54d" data-shortname="郑州新亚" data-fullname="1" data-parentshortname="" data-rootshortname="" href="javascript:;" title="郑州新亚">郑州新亚</a> ' +
'                           <a data-fltter="" data-customerguid="b4dc76f9-ebb6-423e-8831-2a659dc21c84" data-shortname="8月23日石家庄成本公开课" data-fullname="8月23日石家庄成本公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="8月23日石家庄成本公开课">8月23日石家庄成本公开课</a> ' +
'                           <a data-fltter="" data-customerguid="58ab7b36-448c-402e-94e6-6658df098b6a" data-shortname="14年4月25日上海采购公开课" data-fullname="14年4月25日上海采购公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年4月25日上海采购公开课">14年4月25日上海采购公开课</a> ' +
'                           <a data-fltter="" data-customerguid="7974b2bf-fff4-4a63-9b51-154e0cf53f73" data-shortname="14年5月16日成都合同与变更公开课" data-fullname="14年5月16日成都合同与变更公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年5月16日成都合同与变更公开课">14年5月16日成都合同与变更公开课</a> ' +
'                           <a data-fltter="" data-customerguid="832c6652-4616-435a-b130-74e27f037aa8" data-shortname="14年6月20日重庆运营公开课" data-fullname="14年6月20日重庆运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年6月20日重庆运营公开课">14年6月20日重庆运营公开课</a> ' +

'                           <a data-fltter="" data-customerguid="629d8be2-c491-4cff-91f6-ffcab05696c0" data-shortname="15年4月24日西安运营公开课" data-fullname="15年4月24日西安运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="15年4月24日西安运营公开课">15年4月24日西安运营公开课</a> ' +
'                           <a data-fltter="A|G" data-customerguid="fdea81a7-9bb2-4455-aaa5-0737d2db2cba" data-shortname="广信" data-fullname="惠州市广信投资有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="广信">广信</a> ' +
'                           <a data-fltter="" data-customerguid="b3ae0ebf-83b1-4b9e-81a4-df1622196e38" data-shortname="5月10日厦门运营公开课" data-fullname="5月10日厦门运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="5月10日厦门运营公开课">5月10日厦门运营公开课</a> ' +
'                           <a data-fltter="H" data-customerguid="be9a546c-7d29-4939-820b-99234dc36378" data-shortname="宏信达" data-fullname="惠州市宏信达房地产开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="宏信达">宏信达</a> ' +
'                           <a data-fltter="" data-customerguid="79b8a0ef-1afd-4271-9df8-5e4b613250f4" data-shortname="14年4月18日深圳绩效公开课" data-fullname="14年4月18日深圳绩效公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年4月18日深圳绩效公开课">14年4月18日深圳绩效公开课</a> ' +

'                           <a data-fltter="" data-customerguid="588f150e-8825-4049-9e6d-19ee9b6cc23a" data-shortname="14年9月12日深圳运营公开课" data-fullname="14年9月12日深圳运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年9月12日深圳运营公开课">14年9月12日深圳运营公开课</a> ' +
'                           <a data-fltter="" data-customerguid="adc9c382-1b21-41f3-b2a8-cdf64d2384eb" data-shortname="7月5日重庆成本公开课" data-fullname="7月5日重庆成本公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="7月5日重庆成本公开课">7月5日重庆成本公开课</a> ' +
'                           <a data-fltter="" data-customerguid="3414747b-5da3-4428-be55-5fbf844a51f8" data-shortname="1111" data-fullname="112121" data-parentshortname="" data-rootshortname="" href="javascript:;" title="1111">1111</a> ' +
'                           <a data-fltter="" data-customerguid="7161092c-f72e-415f-99c8-d3f1904a06d1" data-shortname="10月18日三亚绩效公开课" data-fullname="10月18日三亚绩效公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="10月18日三亚绩效公开课">10月18日三亚绩效公开课</a> ' +
'                           <a data-fltter="L" data-customerguid="632ce037-49bc-41e1-bc8f-98e6720ed98a" data-shortname="丽日" data-fullname="惠州市丽日房地产开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="丽日">丽日</a> ' +

'                           <a data-fltter="J|Q" data-customerguid="22c524be-fe21-4eee-9078-4c65d82c9349" data-shortname="强兴" data-fullname="惠州市强兴房地产开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="强兴">强兴</a> ' +
'                           <a data-fltter="J" data-customerguid="f7aff4ff-7509-40b2-af0e-f6ab772fc189" data-shortname="金中恒" data-fullname="惠州市金中恒房地产有限公司辛宰练" data-parentshortname="" data-rootshortname="" href="javascript:;" title="金中恒">金中恒</a> ' +
'                           <a data-fltter="" data-customerguid="2c1044d0-34b4-4c6d-bde7-7e265238923d" data-shortname="5月17日深圳绩效公开课" data-fullname="5月17日深圳绩效公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="5月17日深圳绩效公开课">5月17日深圳绩效公开课</a> ' +
'                           <a data-fltter="M" data-customerguid="3b8ae07e-2bf3-4020-8b7f-0fb83de7e770" data-shortname="美力" data-fullname="惠州市美力房地产开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="美力">美力</a> ' +
'                           <a data-fltter="S" data-customerguid="d9a8d2d8-ced1-46a1-9ac3-5cb1c1e5f600" data-shortname="深圳市嘉葆润房地产有限公司" data-fullname="嘉葆润" data-parentshortname="" data-rootshortname="" href="javascript:;" title="深圳市嘉葆润房地产有限公司">深圳市嘉葆润房地产有限公司</a> ' +

'                           <a data-fltter="T" data-customerguid="2cb31994-d97d-47e9-82f0-bf9b555d9d51" data-shortname="泰乐地产" data-fullname="北京泰乐房地产开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="泰乐地产">泰乐地产</a> ' +
'                           <a data-fltter="S" data-customerguid="2c2de934-b3a1-48b0-b4e4-9aef6ff8c5b6" data-shortname="世贸广场" data-fullname="惠州市世贸广场有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="世贸广场">世贸广场</a> ' +
'                           <a data-fltter="Y" data-customerguid="1fc0ac87-0084-4e51-b6ee-4b220da39dfe" data-shortname="烟台海信瀚海" data-fullname="烟台海信瀚海置业有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="烟台海信瀚海">烟台海信瀚海</a> ' +
'                           <a data-fltter="Y" data-customerguid="4afb934b-5659-43bf-965d-485ab8a91d9c" data-shortname="永和" data-fullname="惠州市永和房地产开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="永和">永和</a> ' +
'                           <a data-fltter="M" data-customerguid="0407640e-909c-44dd-a87e-e037412108d6" data-shortname="妈庙港" data-fullname="惠州市妈庙港房地产开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="妈庙港">妈庙港</a> ' +

'                           <a data-fltter="" data-customerguid="32e8f449-0a3a-4ebc-bbe3-ebc46da09457" data-shortname="11月29日沈阳成本公开课" data-fullname="11月29日沈阳成本公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="11月29日沈阳成本公开课">11月29日沈阳成本公开课</a> ' +
'                           <a data-fltter="" data-customerguid="c7bed111-2726-48bc-8d06-92e60f188b05" data-shortname="15年4月10日深圳营改增公开课" data-fullname="15年4月10日深圳营改增公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="15年4月10日深圳营改增公开课">15年4月10日深圳营改增公开课</a> ' +
'                           <a data-fltter="L" data-customerguid="bc94abf8-d4b3-446d-a531-4ecac268ad9f" data-shortname="立润" data-fullname="深圳市立润投资（集团）有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="立润">立润</a> ' +
'                           <a data-fltter="" data-customerguid="f5c54230-bf56-45d6-badb-c1575f12d018" data-shortname="6月21日福州成本公开课" data-fullname="6月21日福州成本公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="6月21日福州成本公开课">6月21日福州成本公开课</a> ' +
'                           <a data-fltter="J" data-customerguid="67d02557-5f4e-4a33-b366-f1cceafea1cc" data-shortname="江北" data-fullname="惠州市江北房地产开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="江北">江北</a> ' +

'                           <a data-fltter="" data-customerguid="8a117a15-3a3d-468c-b7c6-10516a0245f9" data-shortname="1121221" data-fullname="112122121" data-parentshortname="" data-rootshortname="" href="javascript:;" title="1121221">1121221</a> ' +
'                           <a data-fltter="" data-customerguid="041e65da-85d0-4e51-9f97-6946c491d3e5" data-shortname="5月24日广州成本公开课" data-fullname="5月24日广州成本公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="5月24日广州成本公开课">5月24日广州成本公开课</a> ' +
'                           <a data-fltter="J" data-customerguid="4fa902dd-21d1-4d2e-a73a-eb93557ee3c4" data-shortname="济南海悦" data-fullname="济南海悦置业有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="济南海悦">济南海悦</a> ' +
'                           <a data-fltter="" data-customerguid="a51cc2f0-d68e-40e4-b2b7-995fe55fa919" data-shortname="9月6日广州运营公开课" data-fullname="9月6日广州运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="9月6日广州运营公开课">9月6日广州运营公开课</a> ' +
'                           <a data-fltter="" data-customerguid="10a39b44-da19-4239-aa54-96f7bef36b77" data-shortname="14年4月25日北京绩效公开课" data-fullname="14年4月25日北京绩效公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年4月25日北京绩效公开课">14年4月25日北京绩效公开课</a> ' +

'                           <a data-fltter="" data-customerguid="d0e3515f-6591-4f75-95dc-0130e0f92d81" data-shortname="8月30日重庆绩效公开课" data-fullname="8月30日重庆绩效公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="8月30日重庆绩效公开课">8月30日重庆绩效公开课</a> ' +
'                           <a data-fltter="" data-customerguid="c16fa016-5969-4a0b-9952-8509c84432a5" data-shortname="15年4月17日成都运营公开课" data-fullname="15年4月17日成都运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="15年4月17日成都运营公开课">15年4月17日成都运营公开课</a> ' +
'                           <a data-fltter="" data-customerguid="f6d31e20-e015-4bc6-b8cf-ee7677842595" data-shortname="4月26日成都公开课" data-fullname="4月26日成都公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="4月26日成都公开课">4月26日成都公开课</a> ' +
'                           <a data-fltter="H" data-customerguid="fb3174c3-b05f-4ae7-802b-2571e987d82d" data-shortname="华达" data-fullname="惠州大亚湾华达实业有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="华达">华达</a> ' +
'                           <a data-fltter="" data-customerguid="055c2074-8d14-4201-890e-47f80a0d7fb6" data-shortname="5月24日大连客服公开课" data-fullname="5月24日大连客服公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="5月24日大连客服公开课">5月24日大连客服公开课</a> ' +

'                           <a data-fltter="H" data-customerguid="f6066f03-0ef1-498c-9e76-df75755e0bd8" data-shortname="惠恺" data-fullname="惠州市惠恺房地产开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="惠恺">惠恺</a> ' +
'                           <a data-fltter="" data-customerguid="ead5690d-0dee-4abe-8270-4665fe713820" data-shortname="8月2日西安运营公开课" data-fullname="8月2日西安运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="8月2日西安运营公开课">8月2日西安运营公开课</a> ' +
'                           <a data-fltter="" data-customerguid="56cbcd61-361e-4c1b-90ec-a02ed5bee53d" data-shortname="7月19日上海运营公开课" data-fullname="7月19日上海运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="7月19日上海运营公开课">7月19日上海运营公开课</a> ' +
'                           <a data-fltter="W" data-customerguid="cbdce287-a29b-4548-bc09-f397aa88196c" data-shortname="武汉人信新城" data-fullname="武汉人信新城房地产开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="武汉人信新城">武汉人信新城</a> ' +
'                           <a data-fltter="S" data-customerguid="6a18c3f6-e908-4011-8c30-4a41dda72560" data-shortname="陕西广晖" data-fullname="陕西广晖置业有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="陕西广晖">陕西广晖</a> ' +

'                           <a data-fltter="" data-customerguid="8cb8739d-e22d-473a-bc11-baa65a8f2e71" data-shortname="14年9月26日北京成本公开课" data-fullname="14年9月26日北京成本公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年9月26日北京成本公开课">14年9月26日北京成本公开课</a> ' +
'                           <a data-fltter="" data-customerguid="9b9a91b9-556c-487a-8313-aa0e74752a87" data-shortname="14年4月18日成都成本公开课" data-fullname="14年4月18日成都成本公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年4月18日成都成本公开课">14年4月18日成都成本公开课</a> ' +
'                           <a data-fltter="J" data-customerguid="4cf4a72e-9113-44bb-beb6-1bbd9dbeae6b" data-shortname="坚基" data-fullname="广东坚基实业集团有限公司?" data-parentshortname="" data-rootshortname="" href="javascript:;" title="坚基">坚基</a> ' +
'                           <a data-fltter="T" data-customerguid="fba9f1be-9ecc-4586-bf11-879a3c20676e" data-shortname="天津市津房" data-fullname="天津市津房置换有限责任公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="天津市津房">天津市津房</a> ' +
'                           <a data-fltter="" data-customerguid="227996e9-ceaa-4778-a502-8f19c1f64020" data-shortname="6月20日广州走进标杆" data-fullname="6月20日广州走进标杆" data-parentshortname="" data-rootshortname="" href="javascript:;" title="6月20日广州走进标杆">6月20日广州走进标杆</a> ' +

'                           <a data-fltter="S" data-customerguid="a3dd98e3-7a83-4462-9bb6-5478033d693a" data-shortname="昇立" data-fullname="昇立房地产开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="昇立">昇立</a> ' +
'                           <a data-fltter="Q" data-customerguid="4e505508-6d00-49aa-a1c1-1e530beee7aa" data-shortname="青岛地华" data-fullname="青岛地华房地产开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="青岛地华">青岛地华</a> ' +
'                           <a data-fltter="X" data-customerguid="9cd098d3-4760-4513-91ec-91b7ba3928d9" data-shortname="新晟" data-fullname="莘县新晟房地产开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="新晟">新晟</a> ' +
'                           <a data-fltter="Y" data-customerguid="5a37cbe9-8dd0-46b2-b7b5-ed3ca9669915" data-shortname="永富源" data-fullname="惠州市永富源投资有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="永富源">永富源</a> ' +
'                           <a data-fltter="B" data-customerguid="4ad65e9d-8467-4595-b5b9-f735234436e8" data-shortname="宝缘" data-fullname="惠州宝缘投资有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="宝缘">宝缘</a> ' +

'                           <a data-fltter="" data-customerguid="cc69253f-ff0d-46c5-b945-e6286b430579" data-shortname="5月17日西安成本公开课" data-fullname="5月17日西安成本公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="5月17日西安成本公开课">5月17日西安成本公开课</a> ' +
'                           <a data-fltter="M" data-customerguid="631dcf46-a0f6-450b-bf49-a01d3aba5d54" data-shortname="铭诚" data-fullname="铭诚房地产发展有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="铭诚">铭诚</a> ' +
'                           <a data-fltter="" data-customerguid="f0c9f0cc-b088-4eee-8885-2fed5bb80944" data-shortname="5月17日郑州运营公开课" data-fullname="5月17日郑州运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="5月17日郑州运营公开课">5月17日郑州运营公开课</a> ' +
'                           <a data-fltter="" data-customerguid="f7906025-8b93-423a-a29a-c3d2155b62d4" data-shortname="14年6月20日深圳成本公开课" data-fullname="14年6月20日深圳成本公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年6月20日深圳成本公开课">14年6月20日深圳成本公开课</a> ' +
'                           <a data-fltter="" data-customerguid="bda330f2-4d49-4989-9504-92a160ed3f08" data-shortname="6月28日武汉成本公开课" data-fullname="6月28日武汉成本公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="6月28日武汉成本公开课">6月28日武汉成本公开课</a> ' +

'                           <a data-fltter="" data-customerguid="feb64bed-0e5d-4454-8632-c0260380117b" data-shortname="15年4月25日重庆轻量级成本系列一公开课" data-fullname="15年4月25日重庆轻量级成本系列一公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="15年4月25日重庆轻量级成本系列一公开课">15年4月25日重庆轻量级成本系列一公开课</a> ' +
'                           <a data-fltter="" data-customerguid="eed34cd0-b556-42d6-ba76-5b9b716b8b52" data-shortname="14年7月25日北京运营公开课" data-fullname="14年7月25日北京运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年7月25日北京运营公开课">14年7月25日北京运营公开课</a> ' +
'                           <a data-fltter="S" data-customerguid="2a4a7424-04d3-45a2-91c2-e53d2c700423" data-shortname="深圳房多多" data-fullname="深圳市房多多网络科技有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="深圳房多多">深圳房多多</a> ' +
'                           <a data-fltter="S" data-customerguid="57fafb0a-f539-4e5e-9430-10ae7922f0ad" data-shortname="售前咨询评估" data-fullname="售前咨询评估" data-parentshortname="" data-rootshortname="" href="javascript:;" title="售前咨询评估">售前咨询评估</a> ' +
'                           <a data-fltter="Z" data-customerguid="e7882425-839d-4751-adcc-a6f0e4e3f075" data-shortname="战略研发中心内部工作" data-fullname="研发中心所有内部工作战略客户" data-parentshortname="" data-rootshortname="" href="javascript:;" title="战略研发中心内部工作">战略研发中心内部工作</a> ' +

'                           <a data-fltter="" data-customerguid="4dce8cdd-0cc2-4582-b71f-5678df4bc765" data-shortname="8月2日成都客服公开课" data-fullname="8月2日成都客服公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="8月2日成都客服公开课">8月2日成都客服公开课</a> ' +
'                           <a data-fltter="" data-customerguid="c6d04132-8e3d-426c-9547-6f65951dd02f" data-shortname="7月12日天津运营公开课" data-fullname="7月12日天津运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="7月12日天津运营公开课">7月12日天津运营公开课</a> ' +
'                           <a data-fltter="" data-customerguid="e3329fe3-a4f6-4342-b355-9bd137af031a" data-shortname="4月19日重庆运营公开课" data-fullname="4月19日重庆运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="4月19日重庆运营公开课">4月19日重庆运营公开课</a> ' +
'                           <a data-fltter="T" data-customerguid="861e01e7-3089-4385-99c3-5778cfd2c092" data-shortname="天津泰达" data-fullname="天津泰达建设集团有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="天津泰达">天津泰达</a> ' +
'                           <a data-fltter="C" data-customerguid="f5e6235a-e9f9-4df7-b52c-01a512285f65" data-shortname="创城" data-fullname="惠州市创城水电安装有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="创城">创城</a> ' +

'                           <a data-fltter="" data-customerguid="9d3da4a9-ea94-4292-acd5-dc5346cddbb2" data-shortname="9月13日北京绩效公开课" data-fullname="9月13日北京绩效公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="9月13日北京绩效公开课">9月13日北京绩效公开课</a> ' +
'                           <a data-fltter="" data-customerguid="39d833eb-f763-4d2d-8ca0-5844f40c5abc" data-shortname="7月19日广州客服公开课" data-fullname="7月19日广州客服公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="7月19日广州客服公开课">7月19日广州客服公开课</a> ' +
'                           <a data-fltter="" data-customerguid="923f93ba-85ef-47b7-976d-f6af351163dc" data-shortname="2013年公开课遗留客户" data-fullname="2013年公开课遗留客户" data-parentshortname="" data-rootshortname="" href="javascript:;" title="2013年公开课遗留客户">2013年公开课遗留客户</a> ' +
'                           <a data-fltter="O" data-customerguid="0778c754-c4a8-44f3-8975-a44e487f181d" data-shortname="欧之尚" data-fullname="惠州市欧之尚实业发展有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="欧之尚">欧之尚</a> ' +
'                           <a data-fltter="" data-customerguid="af5eca97-3fdc-41df-82ad-99cbe9a8be4d" data-shortname="11月8日广州绩效公开课" data-fullname="11月8日广州绩效公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="11月8日广州绩效公开课">11月8日广州绩效公开课</a> ' +

'                           <a data-fltter="" data-customerguid="494c4895-0dba-4d99-b4f6-a7485d659d5e" data-shortname="4月20日上海成本公开课" data-fullname="4月20日上海成本公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="4月20日上海成本公开课">4月20日上海成本公开课</a> ' +
'                           <a data-fltter="" data-customerguid="54392c7a-bce7-4628-baf3-9d89d7a1988a" data-shortname="14年7月18日上海合同与变更公开课" data-fullname="14年7月18日上海合同与变更公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年7月18日上海合同与变更公开课">14年7月18日上海合同与变更公开课</a> ' +
'                           <a data-fltter="" data-customerguid="52588d2d-a5c9-47ae-9ec8-9944e978bf35" data-shortname="14年5月23日上海运营公开课" data-fullname="14年5月23日上海运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年5月23日上海运营公开课">14年5月23日上海运营公开课</a> ' +
'                           <a data-fltter="" data-customerguid="969d85ed-bc34-44ce-b22d-4f056f781abe" data-shortname="10月18日南宁客服公开课" data-fullname="10月18日南宁客服公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="10月18日南宁客服公开课">10月18日南宁客服公开课</a> ' +
'                           <a data-fltter="D" data-customerguid="f728eed2-dda3-4fe3-b61f-e14c79793efa" data-shortname="东鸿" data-fullname="惠州市东鸿基实业有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="东鸿">东鸿</a> ' +

'                           <a data-fltter="" data-customerguid="4396e394-3fa1-43d9-b230-3f97000fd7a5" data-shortname="14年11月14日成都绩效公开课" data-fullname="14年11月14日成都绩效公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年11月14日成都绩效公开课">14年11月14日成都绩效公开课</a> ' +
'                           <a data-fltter="" data-customerguid="f005590a-5a1e-4082-9e3d-352b80291c09" data-shortname="6月28日长沙运营公开课" data-fullname="6月28日长沙运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="6月28日长沙运营公开课">6月28日长沙运营公开课</a> ' +
'                           <a data-fltter="" data-customerguid="b8ab597d-8fe0-4ce2-a22b-ce0ddbd0b7ac" data-shortname="4月19日深圳运营公开课" data-fullname="4月19日深圳运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="4月19日深圳运营公开课">4月19日深圳运营公开课</a> ' +
'                           <a data-fltter="J" data-customerguid="d3f1c02a-a579-44e3-a3a0-39f754a138a3" data-shortname="嘉隆泰" data-fullname="惠州市嘉隆泰房地产投资开发有限公司" data-parentshortname="" data-rootshortname="" href="javascript:;" title="嘉隆泰">嘉隆泰</a> ' +
'                           <a data-fltter="" data-customerguid="51629841-2aad-4b4a-baee-a58f473eccfb" data-shortname="14年8月2日广州运营沙盘公开课" data-fullname="14年8月2日广州运营沙盘公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="14年8月2日广州运营沙盘公开课">14年8月2日广州运营沙盘公开课</a> ' +

'                           <a data-fltter="" data-customerguid="b63d9699-ee8e-4fbe-a78b-633d6235cff2" data-shortname="6月7日成都运营公开课" data-fullname="6月7日成都运营公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="6月7日成都运营公开课">6月7日成都运营公开课</a> ' +
'                           <a data-fltter="" data-customerguid="bea7e24a-a20a-4fa3-9c2f-99742527a4fd" data-shortname="10月25日长沙成本公开课" data-fullname="10月25日长沙成本公开课" data-parentshortname="" data-rootshortname="" href="javascript:;" title="10月25日长沙成本公开课">10月25日长沙成本公开课</a>';

        document.getElementById("divTxt").innerHTML = t;
        var arr = [];
        $("#divTxt a").each(function() {
            arr.push($(this).data("customerguid"));
        });
        var s = "'" + arr.join("', '") + "'";
    </script>

    <script type="text/javascript">
        window.Utility.registerNameSpace('window.Utility.Login');
        (function(ns) {
            // 函数名称： login
            // 函数功能： 外部客户登录
            // 函数参数： 无
            // 返 回 值： 无
            // 创 建 人： zengjy01
            // 创建日期： 2014-03-25 10:19:27
            ns.login = function() {
                $("#formLogin").ajaxSubmit({
                    dataType: "json",
                    beforeSubmit: function(arr, $form, options) {
                        var userName = $("#UserCode");
                        var password = $("#Password");

                        if ($.trim(userName.val()) == "") {
                            //Mysoft.IT.MyUI.PopWin.showMessage("请填写账号！", function () {
                            //    userName.select();
                            //}, true);
                            //alert("请填写账号！");
                            window.Utility.Login.showErrorMsg([{ name: "UserCode", msg: "请输入用户名!"}]);
                            return false;
                        }
                        if ($.trim(password.val()) == "") {
                            window.Utility.Login.showErrorMsg([{ name: "Password", msg: "请输入密码!"}]);
                            return false;
                        }
                    },
                    success: function(data) {
                        if (data.Status == Constant.ResultStatus.OK) {
                            var url = $("#RedirectUrl").val();
                            url = url ? url : "/Login1.aspx";
                            window.location = url;
                        } else if (data.Status == Constant.ResultStatus.NO) {
                            alert(data.Message);
                        }
                    }
                });
            }
            //显示错误信息
            ns.showErrorMsg = function(message, event) {
                $(".input_error").removeClass("input_error");
                $(".showError_ico,.k-invalid-msg-back").remove();
                if (typeof (message) == "string") {
                    var messArr = message.split("|");
                    if (messArr.length > 1) {
                        var errorName = messArr[0];
                        var errorText = messArr[1];
                        var showError = '<span class="k-widget k-tooltip k-tooltip-validation k-invalid-msg k-invalid-msg-back" data-for="' + errorName + '" role="alert">' +
                    '<span class="k-icon k-warning"> </span> ' + errorText + '<span class="k-close"></span></span>';
                        //$("[name=" + errorName + "]").after(showError);
                        ns.showMessage(errorText);
                    } else {
                        ns.showMessage(message);
                    }
                } else {
                    var showError = $('<i class="showError_ico"></i>');
                    if (message) {
                        if (message.length > 0) {
                            for (var i = 0; i < message.length; i++) {
                                showError.attr("title", message[i].msg);
                                $('form [name=' + message[i].name + ']').addClass("input_error").after(showError);
                            }
                        } else {
                            showError.attr("title", message.msg);
                            $('form [name=' + message.name + ']').addClass("input_error").after(showError);
                        }
                    }
                };
            }

            document.onkeydown = function(e) {
                var ev = document.all ? window.event : e;
                switch (ev.keyCode) {
                    case 13: //回车事件
                        //登录
                        ns.login();
                        break;
                    case 27: //Esc事件
                        //关掉警告框
                        $(".myUI_popCloseBtn").click();
                        break;
                    default:

                }
            };

            $(function() {
                $("#UserCode").focus();
                $("#UserCode").select();
            });
        })(window.Utility.Login);
    </script>

</body>
</html>
