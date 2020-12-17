import $ from 'jquery'

$(document).on('click', '.js-time-entry .js-group-btn', function () {
    $(this).closest('.js-time-entry').next().slideToggle('fast')
})
