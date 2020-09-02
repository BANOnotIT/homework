/**
 * @param {Node} src
 * @param {HTMLElement} destination
 * @param {number} indent=0
 */
function resolve(src, destination, indent = 0) {
    console.log(src)

    const NBSP = '\u00a0'
    let repr = NBSP.repeat(indent)

    if (src instanceof HTMLElement) {
        repr += src.nodeName.toLowerCase()

        if (src.id) repr += '#' + src.id

        if (src.classList.length)
            repr += '.' + Array.from(src.classList.values()).join('.')
    } else {
        repr += src.nodeName
    }

    destination.innerText += repr + '\n'

    Array.from(src.childNodes)
        .forEach((node) => resolve(node, destination, indent + 1))
}
