import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["messages", "input", "form"]

    connect() {
        console.log("Chat controller connected")
        this.scrollToBottom()
        this.focusInput()
    }

    quickReply(event) {
        const replyText = event.currentTarget.dataset.reply
        this.inputTarget.value = replyText
        this.focusInput()
    }

    giveFeedback(event) {
        const feedback = event.currentTarget.dataset.feedback

        // Alle feedback buttons deaktivieren
        this.element.querySelectorAll('.feedback-btn').forEach(btn => {
            btn.classList.remove('active')
        })

        // Aktuellen Button aktivieren
        event.currentTarget.classList.add('active')

        console.log('Feedback:', feedback)
    }

    scrollToBottom() {
        if (this.hasMessagesTarget) {
            this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
        }
    }

    focusInput() {
        if (this.hasInputTarget) {
            this.inputTarget.focus()
        }
    }
}