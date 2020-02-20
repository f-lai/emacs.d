;;; global-overridings-mode.el --- Configure keys specific to MGacOS -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(defvar overriding-map (make-keymap)
  "Personal keymap.")
;; editing


;; movement
(define-key overriding-map (kbd "C-S-v") 'cua-scroll-down)
(define-key overriding-map (kbd "M-<left>") 'backward-word)
(define-key overriding-map (kbd "M-<right>") 'forward-word)
(define-key overriding-map (kbd "s-<left>") 'move-beginning-of-line)
(define-key overriding-map (kbd "s-<right>") 'move-end-of-line)
(setq scroll-preserve-screen-position 1)
(define-key overriding-map (kbd "M-<down>") (kbd "C-u 1 C-v"))
(define-key overriding-map (kbd "M-<up>") (kbd "C-u 1 C-S-v"))

;; isearch navigation
(define-key overriding-map (kbd "s-G") 'isearch-repeat-backward)

;; counsel-M-x
(define-key overriding-map (kbd "C-<SPC>") 'counsel-M-x)

(define-key overriding-map (kbd "C-<return>") 'org-insert-heading-respect-content)

(define-key overriding-map (kbd "<backspace>") 'delete-backward-char)



;; global minor mode overriding everything else
(define-minor-mode global-overridings-mode
  "A minor mode so that my key settings override annoying major modes."
  ;; If init-value is not set to t, this mode does not get enabled in
  ;; `fundamental-mode' buffers even after doing \"(global-my-mode 1)\".
  ;; More info: http://emacs.stackexchange.com/q/16693/115
  :init-value t
  :lighter "global-overridings-mode"
  :keymap overriding-map)

(define-globalized-minor-mode global-global-overridings-mode global-overridings-mode global-overridings-mode)

(add-to-list 'emulation-mode-map-alists `((global-overridings-mode . ,overriding-map)))

(defun turn-off-global-overridings-mode ()
  "Turn off global-overridings-mode."
  (global-overridings-mode -1))
(add-hook 'minibuffer-setup-hook #'turn-off-my-mode)

;; writing a minor mode - https://emacs.stackexchange.com/questions/352/how-to-override-major-mode-bindings
(provide 'global-overridings-mode)
;;; global-overridings-mode.el ends here
