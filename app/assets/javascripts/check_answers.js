// jQuery(document).ready(function() {

//   $("#submit-form").click(function(event) {
//         event.preventDefault();
//         if(form.answer)
//         return false;
//     })
// });

        var AnswersArray = document.getElementsByName("answer[2]");
        var checked = 0;
        for ( var i = 0; i < AnswersArray.length; i++ ) {

            if ( AnswersArray[i].checked ) {
                checked++;
            }
        }
        if (checked > 1) {
        }

