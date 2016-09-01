 var page = require('webpage').create();
 page.open('http://localhost:8080/integration', function(status) {
   console.log(status);
   if(status === "success") {
   	 console.log('taking screenshot');
     page.render('./phantomjs/screenshots/one.png');
   }
   phantom.exit();
 }); 
