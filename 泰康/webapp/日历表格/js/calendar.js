function createdCalendar(element) {
    this.element =element
    let self = this;
    var calendarDiv = document.getElementsByClassName('calendarDiv')[0];
    var monthDivs = document.querySelectorAll('.calendarDiv section div');
    var leftArrow =  document.querySelectorAll('.calendarDiv-header-left')[0];
    var rightArrow =  document.querySelectorAll('.calendarDiv-header-right')[0];
    var yearDiv = document.querySelector('.calendarDiv header .year');
    var textMonths ={'一月':1,'二月':2,'三月':3,'四月':4,'五月':5,'六月':6,'七月':7,'八月':8,'九月':9,'十月':10,'十一月':11,'十二月':12};
    var yearactive = new Date().getFullYear();
    var monthactive = new Date().getMonth()+1;
    monthDivs[new Date().getMonth()].classList.add("active");
    console.log( monthDivs[new Date().getMonth()],'日历样式')
    var activeYearMonth=yearactive+'-'+monthactive;
    yearDiv.innerHTML=yearactive;
    this.element.innerHTML=yearactive+'年'+monthactive+'月'
    leftArrow.addEventListener('click',function () {
        yearactive--;
        yearDiv.innerHTML=yearactive;
        self.element.innerHTML=yearactive+'年'+monthactive+'月'
    })
    rightArrow.addEventListener('click',function () {
        yearactive++;
        yearDiv.innerHTML=yearactive;
        self.element.innerHTML=yearactive+'年'+monthactive+'月'
    })

   this.getDate=function(callback){
       let self = this;
       for(var i=0;i<monthDivs.length;i++){
           let monthDiv = monthDivs[i]
           monthDiv.addEventListener('click',function (e) {
               monthactive=textMonths[monthDiv.innerHTML]
               activeYearMonth=yearactive+'-'+monthactive
               self.element.innerHTML=yearactive+'年'+monthactive+'月'
               if(e.target.className=='active'){
                   return
               }
               setTimeout(function () {
                   for(var i_=0;i_<monthDivs.length;i_++){
                       if(monthDiv==monthDivs[i_]){
                           monthDivs[i_].setAttribute('class','active')
                       }else {
                           monthDivs[i_].setAttribute('class','')
                       }
                   }
               },20)
               if(callback){
                   callback(activeYearMonth)
               }

           })
       }
    }
    this.getDate()
    this.showCalendar=function() {
        let self = this;
        this.element.innerHTML=yearactive+'年'+monthactive+'月'
        calendarDiv.style.top= this.element.offsetTop+ this.element.offsetHeight+10+'px';
        calendarDiv.style.left= this.element.offsetLeft- this.element.offsetWidth/2+'px';
        calendarDiv.style.display='block';
        window.addEventListener('click',function (e) {
            var xarr=[calendarDiv.offsetLeft,calendarDiv.offsetLeft+calendarDiv.offsetWidth]
            var yarr = [calendarDiv.offsetTop,calendarDiv.offsetTop+calendarDiv.offsetHeight]
            var xarr_=[ self.element.offsetLeft, self.element.offsetLeft+ self.element.offsetWidth]
            var yarr_ = [ self.element.offsetTop, self.element.offsetTop+ self.element.offsetHeight]
            if(!((e.x>xarr_[0]&&e.x<xarr_[1]&&e.y>yarr_[0]&&e.y<yarr_[1])||(e.x>xarr[0]&&e.x<xarr[1]&&e.y>yarr[0]&&e.y<yarr[1]))){
                if(calendarDiv.style.display=='block'){
                    calendarDiv.style.display='none'
                }
            }
        })
    }

}