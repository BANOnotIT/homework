import $ from 'jquery'

function handleResult(event) {
    const [data] = event.detail

    const result = $('#result');
    result.empty()

    $('<table></table>')
        .append('<tr><th>X</th><th>X<sup>2</sup></th></tr>')
        .append(data.map(a => `<tr><td>${a[0]}</td><td>${a[1]}</td></tr>`))
        .appendTo(result)

    result.append(`<p>Count: <strong>${data.length}</strong></p>`)
}

document.addEventListener('turbolinks:load', () => {
    document.getElementById('form')
        .addEventListener('ajax:success', handleResult)
})
