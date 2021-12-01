    
    function TimeVal() {
    var arr = document.getElementById("inputarrivalTime");
    var dep = document.getElementById("inputDepTime");

    if(arr > dep) {
        alert("Time Validation failed");
        returnToPreviousPage();
        return false;
    }
}
