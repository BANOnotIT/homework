const $ = document.getElementById.bind(document);

document.forms.goods.onsubmit = function onSubmit(e) {
  e.preventDefault();

  const titleV = e.target.elements.title.value;
  const costV = e.target.elements.cost.value;

  const id = `${titleV}--@@--${costV}`;

  if (document.querySelector(`[data-a="${id}"]`)) return;

  const row = document.createElement("tr");
  row.dataset.a = id;

  const title = document.createElement("td");
  title.innerText = titleV;

  const cost = document.createElement("td");
  cost.innerText = costV;

  const btnCell = document.createElement("td");
  const btn = document.createElement("button");
  btn.innerText = "В корзину";
  btn.onclick = addToCart(row);
  btnCell.appendChild(btn);

  row.appendChild(title);
  row.appendChild(cost);
  row.appendChild(btnCell);

  $("output").appendChild(row);
};

function sumup() {
  $("sum").innerText =
    "Общая цена: " +
    Array.from(document.querySelectorAll("#cart td:last-child"))
      .map((a) => parseInt(a.innerText))
      .reduce((s, a) => s + a, 0);
}

function addToCart(elm) {
  return () => {
    const row = elm.cloneNode(true);
    row.removeChild(row.lastChild);

    $("cart").appendChild(row);
  };
}
