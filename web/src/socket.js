import {Socket, Presence} from "phoenix"

let socket = new Socket("/socket", {
  params: { user_id: window.location.search.split("=")[1] }
})

function renderOnlineUsers(presences) {
  let response = ""

  Presence.list(presences, (id, {metas: [first, ...rest]}) => {
    let count = rest.length + 1
    response += `<br>${id} (count: ${count})</br>`
  })

  console.log(response)
}

socket.connect()

let presences = {}

let channel = socket.channel("room:lobby", {})

channel.on("presence_state", state => {
  presences = Presence.syncState(presences, state)
  renderOnlineUsers(presences)
})

channel.on("presence_diff", diff => {
  presences = Presence.syncDiff(presences, diff)
  renderOnlineUsers(presences)
})

channel.join()
