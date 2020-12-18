import $ from 'jquery'
import {EntryEditor} from "../EntryEditor";

$(document).on('click', '.js-time-entry .js-group-btn', function () {
    $(this).closest('.js-time-entry').next().slideToggle('fast')
})

new EntryEditor($('.js-entry-editor'))
