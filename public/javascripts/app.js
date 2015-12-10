//JAVASCRIPT CODE GOES HERE
// $(document).ready(function(){
//   $("form").on("submit", function(event){
//     event.preventDefault();
//     var meetup_name = $('#meetup_name').val();
//     var meetup_description = $('#meetup_description').val();
//     var meetup_location = $('#meetup_location').val();
//     if (meetup_name && meetup_description && meetup_location) {
//       submitMeetupViaAjax(meetup_name, meetup_description, meetup_location);
//     }
//
//   });
//   
// });
//
// var submitMeetupViaAjax = function(name, description, location) {
//   var request = $.ajax({
//     method: "POST",
//     url: "/new",
//     data: { name: name
//             description: description,
//             location: location
//           }
//   });
// }
