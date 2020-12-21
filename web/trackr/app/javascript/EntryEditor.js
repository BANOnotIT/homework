import $ from "jquery";
import { formatISO, parseISO } from "date-fns";
import debounce from "lodash/debounce";

const headers = new Headers({
  "Content-Type": "application/json",
  Accept: "application/json",
});

export class EntryEditor {
  current = null;
  interval = null;
  editing = false;

  constructor(elem, defaultEntry = null) {
    this.$root = $(elem);
    const $root = this.$root;
    this.$title = $root.find(".js-title-input");
    this.$display = $root.find(".js-time-display");
    this.$startBtn = this.$root.find(".js-start-btn");
    this.$stopBtn = this.$root.find(".js-stop-btn");

    this.$title.change(debounce(this.updateTitle, 250));
    this.$startBtn.click(this.start);
    this.$stopBtn.click(this.stop.bind(this, true));

    this.$title.val("");

    if (defaultEntry) {
      this.setEntry(defaultEntry);
      this.startTimer();
    }
  }

  updateTitle = async () => {
    await fetch(`/time_entries/${this.current.id}.json`, {
      method: "PATCH",
      body: JSON.stringify({ title: this.current.title }),
    });
  };

  start = async () => {
    const title = this.$title.val();
    const newEntry = await fetch("/time_entries.json", {
      body: JSON.stringify({ title }),
      method: "POST",
      headers: headers,
    }).then((resp) => resp.json());
    this.setEntry({
      title: newEntry.title,
      start: parseISO(newEntry.start),
      id: newEntry.id,
    });
    this.startTimer();
  };

  stop = async (reload = false) => {
    if (!this.current) return;

    const stopped = new Date();
    await fetch(`/time_entries/${this.current.id}`, {
      body: JSON.stringify({ end: formatISO(stopped) }),
      headers,
      method: "PATCH",
      credentials: "include",
    });
    if (reload) window.location.reload();
  };

  setEntry(task) {
    this.current = task;
    this.$title.val(task.title);
  }

  startTimer() {
    this.$startBtn.hide();
    this.$stopBtn.show();
    clearInterval(this.interval);
    this.interval = setInterval(this.tick, 500);
  }

  tick = () => {
    const duration = ((Date.now() - +this.current.start) / 1000) | 0;
    const seconds = (duration % 60).toString().padStart(2, "0");
    const minutes = (((duration / 60) | 0) % 60).toString().padStart(2, "0");
    const hours = (duration / 3600) | 0;
    const formattedDuration = `${hours}:${minutes}:${seconds}`;
    this.$display.text(formattedDuration);
  };

  async check() {
    const newTask = await fetch("/time_entries/current").then((resp) =>
      resp.json()
    );

    this.current = {
      id: newTask.id,
      start: parseISO(newTask.start),
      title: newTask.title,
    };
  }
}
