<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/static/calendarAbout/css/calendar.css">
    <style>
        @font-face {
            font-family: 'iconfont';
            src: url('/static/calendarAbout/css/font/iconfont.eot');
            src: url('/static/calendarAbout/css/font/iconfont.eot?#iefix') format('embedded-opentype'),
            url('/static/calendarAbout/css/font/iconfont.woff') format('woff'),
            url('/static/calendarAbout/css/font/iconfont.ttf') format('truetype'),
            url('/static/calendarAbout/css/font/iconfont.svg#iconfont') format('svg');
        }
        button{
            background: transparent;
            border: none;
            outline: none;
        }
        .calendarForm{
            width: 100%;
            height: 100%;
            overflow: hidden;
            overflow-y: auto;
        }
        .selectAll{
            width: 100%;
        }
        .select-item{
            width: 150px;
            height: 60px;
            float: left;
            padding-top: 15px;
            box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
        }
        .select-item select{
            border: none;
            border: 1px solid #ccc;
            padding: 0 5px;
            cursor: default;
        }
        .select-item select option{
            height: 20px;
            overflow-y: auto;
        }
        #selectMonth_{
            border: 1px solid #ccc;
            padding: 0 5px;
            cursor: default;
        }
        .select-item>div, .select-item select{
            height: 20px;
            line-height: 20px;
            outline: none;
            float: left;
        }
        .select-item>div{
            margin-right: 15px;
            font-size: 14px;
        }
        .addBtn{
            float: right;
            width: 100px;
            height: 60px;
        }
        .addBtn button{
            background: none;
            background-color: #009200;
            color: white;
            border: none;
            -webkit-appearance: none;
            outline: none;
            height: 20px;
            line-height: 20px;
            text-align: center;
            width: 65px;
            border-radius: 2px;
            margin-top: 15px;
            cursor: pointer;
        }
        .calendarForm-section{
            width: 100%;
            overflow: hidden;
            overflow-x: auto;
        }
        .calendarForm-table{
            border-color: #b7b7b7; border-collapse:collapse;
        }
        th,td {
            border: 1px solid #b7b7b7;
            text-align: center;
            font-size: 12px;
            line-height: 20px;
        }
        tbody td{
            padding: 10px 0px;
            cursor: default;
            user-select: none;
        }

        tbody td.normal,tbody td.abnormal{
            background-repeat: no-repeat;
            background-position: center;
            background-size: 30px;
            color: black;
        }
        tbody td.normal{
            /*background-image: url("img/ic_tick2.png");*/
            background-color: rgba(93, 228, 20, 0.65);
        }
        tbody td.abnormal{
            /*background-image: url("img/ic_tick1.png");*/
            background-color: rgba(244, 17, 62, 0.75);
        }
        tbody td.operationBtn{
            color: green;
            text-decoration: underline;
            cursor: pointer;
            user-select: none;
        }
        .lastCol{
            color:red; width: 100px;text-align: center;
        }
        .table-data-day{
            border-bottom: 1px solid #ccc;
        }
        .table-data-day,.table-data-ri{
            display: inline-block;
            width: 100%;
            height: 50%;
            box-sizing: border-box;
        }
        .calendarForm-btn{
            text-align: center;
            height: 40px;
            margin-top: 20px;
        }
        .calendarForm-btn button{
            height: 25px;
            padding: 0px 15px;
            background-color: #333333;
            color: white;
            line-height: 25px;
            border-radius: 2px;
            margin: 0px 20px;
        }
        .calendarForm-btn button:active{
            transition: all .1s;
            background-color: #9f9f9f;
        }
    </style>
</head>
<body>
    <div class="calendarForm">
    <div class="selectAll">
    <div class="select-item" style="display: none">
    <div>楼栋:  </div>
    <select name="" id="selectFloor">
    </select>
    </div>
    <div class="select-item" style="display: none">
    <div>部门: </div>
    <select name="" id="selectProject">
    </select>
    </div>
    <div class="select-item" style="display: none">
    <div>月份: </div>
    <select name="" id="selectMonth">
    <option value="4">2018年4月</option>
    <option value="6">2018年6月</option>
    <option value="7">2018年7月</option>
    <option value="8">2018年8月</option>
    </select>
    </div>
    <div class="select-item">
    <div>月份: </div>
    <div id="selectMonth_">2018年8月</div>
    </div>
    <!-- <div class="addBtn">
    <button onclick="addTableItem()">+新增</button>
    </div>-->
    </div>
    <section class="calendarForm-section">
    <table class="calendarForm-table" border="1" cellpadding="0" cellspacing="0" width="100%">
    <colgroup id="calendarForm-table-colgroup">
    <col span="1"  style="width: 100px">
    <col span="3"  style="width: 100px">
    <col span="30"  style="width: 50px">
    <col span="1" valign="middle" class="lastCol">
    </colgroup>
    <thead id="calendarForm-table-thead">
    <tr>
    <th>序号</th>
    <th>部门</th>
    <th>人员</th>
    <th>职务</th>
    <th>
    <span class="table-data-day">1</span><br/>
    <span class="table-data-ri">日</span>
    </th>
    <th>
    <span class="table-data-day">2</span><br/>
    <span class="table-data-ri">一</span>
    </th>
    <th>
    <span class="table-data-day">3</span><br/>
    <span class="table-data-ri">二</span>
    </th>
    <th>
    <span class="table-data-day">4</span><br/>
    <span class="table-data-ri">三</span>
    </th>
    <th>
    <span class="table-data-day">5</span><br/>
    <span class="table-data-ri">四</span>
    </th>
    <th>
    <span class="table-data-day">7</span><br/>
    <span class="table-data-ri">五</span>
    </th>
    <th>
    <span class="table-data-day">8</span><br/>
    <span class="table-data-ri">六</span>
    </th>
    <th>操作</th>
    </tr>
    </thead>
    <tbody id="calendarForm-table-tbody">
    <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td class=""></td>
    <td ></td>
    <td class=""></td>
    </tr>
    </tbody>
    </table>
    </section>
    <div class="calendarForm-btn">
    <button class="save">保存</button>
    <button class="cel">取消</button>
    </div>
    </div>
    <div class="calendarDiv">
    <header class="calendarDiv-header">
    <span class="calendarDiv-header-left">&#xe6b5;</span>
    <span class="year">2018</span>
    <span class="calendarDiv-header-right">&#xe6a8;</span>
    </header>
    <section class="calendarDiv-main">
    <div>一月</div>
    <div>二月</div>
    <div>三月</div>
    <div>四月</div>
    <div>五月</div>
    <div>六月</div>
    <div>七月</div>
    <div>八月</div>
    <div>九月</div>
    <div>十月</div>
    <div>十一月</div>
    <div>十二月</div>
    </section>
    </div>
    <!--<script src="js/calendar.js"></script>-->
    <script src="/static/calendarAbout/js/jquery-3.1.0.min.js"></script>
    <script src="/static/calendarAbout/js/calendar.js" ></script>
    <script>
    (function (window) {
    var departmentId = '${departmentId}';
    var objData={
    workShift: [
    {
    timeSettingId: "c2ea9b7430e44b8dae987bcd3685fe2d",
    timeSettingName: "晚班"
    },
    {
    timeSettingId: "cac60808792b480483625a7d2470c12b",
    timeSettingName: "白班"
    },
    {
    timeSettingId: "f34345ae79064981a6f416046b1105c8",
    timeSettingName: "夜班"
    }
    ],
    workPlanList: [
    {
    dutyId: "A0340d3a5e2ab7ad4f8ea4a7e1edd1a4a52c",
    workPlan: {
    "2018-06-25": {
    workPlanId: "fbdd69d268824a1a9f7c4ee0591998ca",
    workTimeName: "白班",
    workTimeId: "cac60808792b480483625a7d2470c12b",
    type: 0,
    planDate: "2018-06-25"
    }
    },
    departmentName:'',
    userName: "工程部门员工1",
    userId: "A4699654bf8ec46b4354847d23eee4c19e0f",
    dutyName: "普通员工"
    },
    {
    dutyId: "A0340d3a5e2ab7ad4f8ea4a7e1edd1a4a52c",
    workPlan:{
    "2018-06-25":{
    workPlanId: "bfffaf933f424bd8b4ddced9dd13836c",
    workTimeName:"夜班",
    workTimeId:"cac60808792b480483625a7d2470c12b",
    type:0,
    planDate:"2018-06-25"
    }
    },
    departmentName:'',
    userName: "工程部门员工2",
    userId: "A469b44942dc6bf24c428846acc265512758",
    dutyName: "普通员工"
    }
    ]
    }//json对象数据
    var objParamsArr= []
    var objParamsObj={}
    var objParamsObj_={}
    var selectMonth_ = document.getElementById('selectMonth_')
    var calendarObj = new createdCalendar(selectMonth_)
    calendarObj.getDate(getDates)

    //表格渲染
    var selectProject =document.getElementById('selectProject');//部门选择器
    var selectFloor = document.getElementById('selectFloor');//楼栋选择器
    var selectMonth = document.getElementById('selectMonth');//月份选择器
    var calendarFormTableThead= document.getElementById('calendarForm-table-thead');
    var colgroup=document.getElementById('calendarForm-table-colgroup');
    var calendarFormTableTbody=document.getElementById('calendarForm-table-tbody');
    var saveBtn = document.querySelector('.calendarForm-btn .save')//保存按钮
    var saveCel = document.querySelector('.calendarForm-btn .cel')//取消按钮
    var activeDate=''
    var workShift= [{
    timeSettingId: "",
    timeSettingName: ""
    }].concat(objData.workShift)
    var checkWork=[
    '',
    'normal',//正常上班
    'abnormal'//迟到请假早退等
    ]
    var months=[];//月份数组
    var projects=[
    {value:'1',label:'工程部'},
    {value:'2',label:'客服部'},
    {value:'3',label:'项目部'},
    {value:'4',label:'人力部'},
    {value:'5',label:'治理部'},
    {value:'6',label:'部门2'},
    ];//部门数组
    var Floors=[
    {value:'A1',label:'A1栋'},
    {value:'B1',label:'B1栋'},
    ];//楼栋数组
    var currentDateObj = new Date()
    var currentMonth = currentDateObj.getMonth()+1
    var currentYear= currentDateObj.getFullYear()
    var yearNum = 3
    for (var i = 0; i<yearNum; i++ ){
    if(i==0){
    for(var i_=12;i_>0;i_--){
    if(i_<=currentMonth){
    months.push({
    value:currentYear+'-'+i_,
    label:currentYear+'年'+i_+'月'
    })
    }
    }
    }else {
    var year_ = currentYear-i
    for(var i_=12;i_>0;i_--){
    months.push({
    value:year_+'-'+i_,
    label:year_+'年'+i_+'月'
    })
    }
    }

    }
    selectProject.onchange=function (){
    console.log(selectProject.value)
    }
    selectMonth.onchange=function (){
    console.log(selectMonth.value)
    getDates(selectMonth.value)
    }
    selectMonth.onclick=function (e){
    console.log(e.target.offsetLeft,'点击月份')
    }
    selectFloor.onchange=function (){
    console.log(selectFloor.value)
    }
    selectMonth_.onclick=function (e){
    console.log(e.target.offsetLeft,'点击月份')
    calendarObj.showCalendar(e)
    }

    //点击保存按钮
    saveBtn.onclick=function () {
    var dateList=[]
    var dutyIdList={}
    for(var key_1 in objParamsObj_){
    dateList.push(key_1)
    for(var key_2 in objParamsObj_[key_1]){
    if(dutyIdList[key_1]){
    dutyIdList[key_1].push(key_2)
    }else {
    dutyIdList[key_1]=[key_2]
    }
    }
    }
    var obj={
    departmentId:"${departmentId}",
    dateList:dateList,
    }
    for(var key_3 in dutyIdList){
    obj[key_3]=objParamsObj_[key_3]
    obj[key_3]['dutyIdList']=dutyIdList[key_3]
    }
    // console.log(obj)
    if(dateList.length==0){return}
    $.ajax({
    type : "POST", //提交方式
    url : "${fullControllerPath}saveOrUpdateData",//路径
    data : {"jsonObject":JSON.stringify({workPlanList:obj})},
    success : function(result) {//返回数据根据结果进行相应的处理
    objParamsObj_={}
    console.log(result,'保存数据')
    if(result.error.err_code==1){
    alert(result.error.err_msg)
    }
    getDates(activeDate)
    },
    error:function () {
    objParamsObj_={}
    calendarFormTableTbody.innerHTML=''
    getDates(activeDate)
    }
    });
    }

    //取消保存
    saveCel.onclick=function () {
    console.log('取消',activeDate)
    getDates(activeDate)
    objParamsObj_={}
    }

    select_init(selectProject,projects)
    select_init(selectFloor,Floors)
    select_init(selectMonth,months)
    getDates(currentYear+'-'+currentMonth)

    //表格单元格点击
    function cellClick() {
    var tds = document.querySelectorAll('#calendarForm-table-tbody tr td.workDate')
    for(var k=0;k<tds.length;k++){
    var tdsItem = tds[k]
    tdsItem.addEventListener('click',function (e) {
    let type =e.target.innerHTML
    if(new Date(e.target.dataset.date).getTime()<=(new Date().getTime())){
    return
    }
    for(var k_=0;k_<workShift.length;k_++){
    if(type==workShift[k_]['timeSettingName']){
    if(k_==(workShift.length-1)){
    e.target.innerHTML=workShift[0]['timeSettingName']
    }else{
    e.target.innerHTML=workShift[k_+1]['timeSettingName']
    }

    }
    }
    objData.workPlanList[e.target.dataset.index]['workPlan'][e.target.dataset.date]['workTimeName']=e.target.innerHTML
    var timeSettingId=''
    for(var p=0;p<workShift.length;p++){
    if(workShift[p]['timeSettingName']==e.target.innerHTML){
    timeSettingId=workShift[p]['timeSettingId']
    }
    }
    var key =objData.workPlanList[e.target.dataset.index]['userId']+e.target.dataset.date
    var objItem={
    userId: objData.workPlanList[e.target.dataset.index]['userId'],
    timeSettingId:timeSettingId,
    isChange: true,
    workPlanId: objData.workPlanList[e.target.dataset.index]['workPlan'][e.target.dataset.date]['workPlanId'],
    planDate:e.target.dataset.date,
    departId: departmentId,
    }
    objParamsObj[key]=objItem
    console.log(objData.workPlanList[e.target.dataset.index]['workPlan'][e.target.dataset.date]['workPlanId'])
    var obj_=null,flag=true
    if(objParamsObj_[e.target.dataset.date]){
    if(objParamsObj_[e.target.dataset.date][objData.workPlanList[e.target.dataset.index]['dutyId']]){

    obj_=objParamsObj_[e.target.dataset.date][objData.workPlanList[e.target.dataset.index]['dutyId']]
    flag=true
    for(var i=0;i<obj_.length;i++){
    if(obj_[i].userId==objItem.userId&&obj_[i].planDate==objItem.planDate){
    obj_[i]=objItem
    flag=false
    }
    }
    if(flag){
    objParamsObj_[e.target.dataset.date][objData.workPlanList[e.target.dataset.index]['dutyId']].push(objItem)
    }

    }else {
    objParamsObj_[e.target.dataset.date][objData.workPlanList[e.target.dataset.index]['dutyId']]=[objItem]
    }

    }else {
    objParamsObj_[e.target.dataset.date]={}
    if(objParamsObj_[e.target.dataset.date][objData.workPlanList[e.target.dataset.index]['dutyId']]){
    obj_=objParamsObj_[e.target.dataset.date][objData.workPlanList[e.target.dataset.index]['dutyId']]
    flag=true
    for(var i=0;i<obj_.length;i++){
    if(obj_[i].userId==objItem.userId&&obj_[i].planDate==objItem.planDate){
    obj_[i]=objItem
    flag=false
    }
    }
    if(flag){
    objParamsObj_[e.target.dataset.date][objData.workPlanList[e.target.dataset.index]['dutyId']].push(objItem)
    }

    }else {
    objParamsObj_[e.target.dataset.date][objData.workPlanList[e.target.dataset.index]['dutyId']]=[objItem]
    }
    }
    console.log(objParamsObj_)
    })
    }
    }
    //根据日期获取数据
    function getDates(month){
    activeDate=month
    objParamsObj={}
    objParamsObj_={}
    calendarFormTableThead.innerHTML=''
    colgroup.innerHTML=''
    var getDates_dates=[],
    weeks=['日','一','二','三','四','五','六'],
    str='<tr><th>序号</th><th>部门</th><th>姓名</th><th>职务</th>';//表头字符串
    var getDates_year = month.split('-')[0],getDates_month= month.split('-')[1],dayNumber=31;
    dayNumber=new Date(getDates_year,getDates_month,0).getDate();
    var activeDay;
    if(getDates_month<10){
    activeDay=getDates_year+'-0'+getDates_month
    }else {
    activeDay=getDates_year+'-'+getDates_month
    }
    for(var i=1;i<=dayNumber;i++){
    var obj_={
    date:i,
    week:weeks[new Date(getDates_year+'/'+getDates_month+'/'+i).getDay()]
    }
    getDates_dates.push(obj_)
    str+='<th> <span class="table-data-day">'+obj_.week+'</span><br/> <span class="table-data-ri">'+obj_.date+'</span> </th>'
    }
    str+='</tr>'
    colgroup.innerHTML='<col span="1"  style="width: 40px"> <col span="3"  style="width: 80px"> <col span="'+dayNumber+'"  style="width: 40px">'
    calendarFormTableThead.innerHTML=str//添加表头
    $.ajax({
    type : "POST", //提交方式
    url : "${fullControllerPath}workPlanList",//路径
    data : {
    "month" : activeDate,
    "departmentId":departmentId
    },//数据，这里使用的是Json格式进行传输
    success : function(result) {//返回数据根据结果进行相应的处理
    calendarFormTableTbody.innerHTML=''
    console.log(result,'ajax数据请求')
    objData=result.obj
    //表格body字符串
    var str_='<tr>'
    for(var j=0;j<objData.workPlanList.length;j++){
    str_+='<tr>'
    var dataListItem=objData.workPlanList[j]
    str_+='<td>'+(j+1)+'</td>'
    str_+='<td>'+dataListItem['departmentName']+'</td>'
    str_+='<td>'+dataListItem['userName']+'</td>'
    str_+='<td>'+dataListItem['dutyName']+'</td>'

    for(var i=1;i<=dayNumber;i++){
    var key
    if(i<10){
    key=activeDay+'-0'+i
    }else{
    key=activeDay+'-'+i
    }
    if(dataListItem['workPlan'][key]){
    str_+='<td data-date="'+key+'" data-index="'+j+'" class="workDate '+checkWork[dataListItem['workPlan'][key]['type']]+'">'+dataListItem['workPlan'][key]['workTimeName']+'</td>'
    }
    else {
    dataListItem['workPlan'][key]={
    workPlanId: "",
    workTimeName:"",
    workTimeId:"",
    type:0,
    planDate:key
    }
    str_+='<td data-date="'+key+'" data-index="'+j+'" class="workDate"></td>'
    }
    }
    str_+='</tr>'
    }
    calendarFormTableTbody.innerHTML=str_
    cellClick()
    },
    error:function () {
    calendarFormTableTbody.innerHTML=''
    }
    });

    }
    //初始化
    function select_init(Ele,options){
    var optionsStr='';
    for(var i=0; i<options.length;i++){
    var optionsObj=options[i]
    optionsStr+='<option value="'+optionsObj.value+'">'+optionsObj.label+'</option>'
    }
    Ele.innerHTML=optionsStr
    }
    }(window))

    </script>


    </body>
</html>