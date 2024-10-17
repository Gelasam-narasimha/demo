$(document).ready(function() {
    $('#password').on('keyup', function() {
        var password = $(this).val();
        var strength = calculatePasswordStrength(password);

        $('#password-strength-status').removeClass();
        $('#password-strength-status').addClass('strength-' + strength.type);
        $('#password-strength-status').text(strength.message);
    });

    function calculatePasswordStrength(password) {
        var strength = {
            type: 'weak',
            message: 'Weak'
        };

        var lengthCriteria = password.length >= 8;
        var numberCriteria = /[0-9]/.test(password);
        var lowercaseCriteria = /[a-z]/.test(password);
        var uppercaseCriteria = /[A-Z]/.test(password);
        var specialCharCriteria = /[!@#$%^&*(),.?":{}|<>]/.test(password);

        var score = 0;
        
        if (lengthCriteria) score++;
        if (numberCriteria) score++;
        if (lowercaseCriteria) score++;
        if (uppercaseCriteria) score++;
        if (specialCharCriteria) score++;

        if (score <= 1) {
            strength.type = 'weak';
            strength.message = 'Weak';
        } else if (score == 2) {
            strength.type = 'moderate';
            strength.message = 'Moderate';
        } else if (score >= 3) {
            strength.type = 'strong';
            strength.message = 'Strong';
        }

        return strength;
    }
});
