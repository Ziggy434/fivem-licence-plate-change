const template = document.querySelector("#notification-template");
const imageTemplate = document.querySelector("#notification-image-template");
const container = document.querySelector("#container");
const audio = document.createElement("audio");

const icons = {
    "info": "fa-info-circle",
    "warn": "fa-exclamation-triangle",
    "error": "fa-biohazard"
}
const titles = {
    "info": "Info",
    "warn": "Warning",
    "error": "Error"
}

container.setAttribute("style", "top: 200px;")

window.addEventListener("message", (e) => {
    const action = e.data.action
    switch (action) {
        case "notification": {
            const options = e.data.options || {};
            const message = e.data.message || "Null content";

            AddNotification(message, options);
            break;
        }
        case "offset": {
            container.setAttribute("style", `top: ${e.data.offset || "0"};`);
            break;
        }
    }
});

function AddNotification(message, options) {
    const timeout = options.timeout || 2000;
    const type = options.type || "info";
    const useAudio = options.audio || false;

    const node = options.image ? 
        CreateImageNotificationNode(message, type, options.image) : 
        CreateNotificationNode(message, type);
    container.prepend(node);
    node.classList.add(`--${type}`);

    if (useAudio && audio.paused) {
        audio.setAttribute("src", `sounds/${type}.mp3`);
        audio.volume = 0.2;
        audio.currentTime = 0;
        audio.play();
    }

    setTimeout(() => {
        node.classList.add("slide-out");
        setTimeout(() => {
            container.removeChild(node);
        }, 500);
    }, timeout);
}

function CreateNotificationNode(message, type) {
    var clone = template.content.firstElementChild.cloneNode(true);
    var p = clone.querySelector("p");
    p.textContent = message;
    const icon = clone.querySelector("i");
    icon.classList.add(icons[type]);
    const title = clone.querySelector("h1");
    title.textContent = titles[type]
    return clone;
}

function CreateImageNotificationNode(message, type, b64Image) {
    var clone = imageTemplate.content.firstElementChild.cloneNode(true);
    var p = clone.querySelector("p");
    p.textContent = message;
    const img = clone.querySelector("img");
    img.setAttribute("src", b64Image);
    const title = clone.querySelector("h1");
    title.textContent = titles[type]
    return clone;
}