function checkDate() {
    var selectedText = document.getElementById('datepicker').value;
    var selectedDate = new Date(selectedText);
    var now = new Date();
    if (selectedDate > now) {
        swal({
            title: "Date Invalid",
            text: "Please select a date in the past.",
            icon: "warning",
            button: "Reset!",
          });
          
     document.getElementById('datepicker').value = null;
    }
  }

  function checkTime() {

     var arrivalTime = document.getElementById('arrivalTime').value;
     var depTime = document.getElementById('DepTime').value;
     var depTimeLen = document.getElementById('DepTime').value.length;

     console.log(arrivalTime);
     console.log(depTime);

     if(arrivalTime > depTime) {
         if(depTimeLen != 0) {

            swal({
                title: "Time Invalid",
                text: "Please enter a departure time greater than the arrival time.",
                icon: "warning",
                button: "Reset!",
              });

              document.getElementById('DepTime').value = null; 

         } else {
             
         }

     }

   }

//   function checkTime() {

//     var arrivalTime = document.getElementsByClassName('arrivalTime').value;
//     var depTime = document.getElementsByClassName('DepTime').value;
//     var depTimeLen = document.getElementsByClassName('DepTime').value.length;

//     console.log(arrivalTime);
//     console.log(depTime);

//     if(arrivalTime > depTime) {
//         if(depTimeLen != 0) {

//            swal({
//                title: "Time Invalid",
//                text: "Please enter a departure time greater than the arrival time.",
//                icon: "warning",
//                button: "Reset!",
//              });

//              document.getElementById('DepTime').value = null; 

//         } else {
            
//         }

//     }

//  }