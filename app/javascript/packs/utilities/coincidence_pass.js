document.addEventListener("turbolinks:load", function () {
    var passConfirm = document.querySelector('.registration-fields');

    if (passConfirm) {
        passConfirm.addEventListener('input', verifyPassword)
        console.log(passConfirm)
    }
});

function verifyPassword() {
    var pass1 = document.getElementById("user_password");
    var pass2 = document.getElementById("user_password_confirmation");

    if (pass1.value != pass2.value) {
        pass1.classList.add('red-field');
        pass2.classList.add('red-field');
    } else {
        pass1.classList.add('green-field');
        pass2.classList.add('green-field');
    }
}