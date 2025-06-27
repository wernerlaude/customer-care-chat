import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["messages", "input", "form"]

    connect() {
        console.log("Chat controller connected")
        // Warten bis Inhalte geladen sind
        setTimeout(() => {
            this.scrollToBottom()
            this.focusInput()
        }, 100)

        // Auch bei Window resize scrollen
        this.resizeHandler = this.scrollToBottom.bind(this)
        window.addEventListener('resize', this.resizeHandler)
    }

    disconnect() {
        window.removeEventListener('resize', this.resizeHandler)
    }

    scrollToBottom() {
        if (this.hasMessagesTarget) {
            const container = this.messagesTarget
            container.scrollTop = container.scrollHeight
            console.log('Scrolled to:', container.scrollHeight, 'Current scroll:', container.scrollTop)
        }
    }

    focusInput() {
        if (this.hasInputTarget) {
            this.inputTarget.focus()
        }
    }
}