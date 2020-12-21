import $ from "jquery";
import { EntryEditor } from "../EntryEditor";
import { formatISO, parseISO } from "date-fns";

$(document).on("click", ".js-time-entry .js-group-btn", function () {
  $(this).closest(".js-time-entry").next().slideToggle("fast");
});

function parseEntry(entry) {
  return {
    start: parseISO(entry.start),
    title: entry.title,
    id: entry.id,
  };
}

!(async function () {
  const defaultTask = await fetch(`/time_entries/active.json`).then((resp) =>
    resp.json()
  );

  const editor = new EntryEditor(
    $(".js-entry-editor"),
    defaultTask ? parseEntry(defaultTask) : null
  );
  if (defaultTask) editor.startTimer();

  $(document).on("click", ".js-time-entry .js-replay-btn", async function () {
    const start = new Date();

    await editor.stop();

    const { title } = $(this).closest(".js-time-entry").data("entry");
    const newEntry = await fetch(`/time_entries.json`, {
      method: "POST",
      body: JSON.stringify({ title, start: formatISO(start) }),
      headers: new Headers({
        "Content-Type": "application/json",
      }),
    })
      .then((resp) => resp.json())
      .then(parseEntry);

    editor.setEntry(newEntry);
    editor.startTimer();
  });
})();
