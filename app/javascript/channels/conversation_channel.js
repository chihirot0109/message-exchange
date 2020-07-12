import consumer from "./consumer";

const initConversationCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.conversationId;
    consumer.subscriptions.create({ channel: "ConversationChannel", id: id }, {
      received(data) {
        console.log(data);
        if (data.message) {
          messagesContainer.insertAdjacentHTML('beforeend', data.message);
        }
      }
    });
  }
}

export { initConversationCable };
