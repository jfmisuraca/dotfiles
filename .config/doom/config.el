;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Juan Francisco"
      user-mail-address "jfmisuraca@hotmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Fira Code" :size 16)
      doom-variable-pitch-font (font-spec :family "Atkinson Hyperlegible" :size 17))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-acario-dark)
;; (setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative
      auto-save-default t
      make-backup-files t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/Documentos/Obsidian/Orgs/")

;; (after! doom-themes
;; (load-theme 'doom-nano-dark t))
;; 
;; (use-package! doom-nano-modeline
;; :config
;; (doom-nano-modeline-mode 1)
;; (global-hide-mode-line-mode 1))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(require 'mu4e)

;; list of your email adresses:
(setq mu4e-personal-addresses '("jfmisuraca@hotmail.com"
                                "juannf14@gmail.com"
                                "jfmisuraca@gmail.com"))

;; (setq mu4e-contexts
;;       `(,(make-mu4e-context
;;           :name "Hotmail" ;; Give it a unique name. I recommend they start with a different letter than the second one.
;;           :enter-func (lambda () (mu4e-message "Entrando a Hotmail"))
;;           :leave-func (lambda () (mu4e-message "Saliendo de Hotmail"))
;;           :match-func (lambda (msg)
;;                         (when msg
;;                           (string= (mu4e-message-field msg :maildir) "/jfmisuraca@hotmail")))
;;           :vars '((user-mail-address . "jfmisuraca@hotmail.com")
;;                   (user-full-name . "Juan Francisco")
;;                   (mu4e-drafts-folder . "/address1@gmail/[Gmail].Drafts")
;;                   (mu4e-refile-folder . "/address1@gmail/[Gmail].All Mail")
;;                   (mu4e-sent-folder . "/address1@gmail/[Gmail].Sent Mail")
;;                   (mu4e-trash-folder . "/address1@gmail/[Gmail].Trash")
;;                   ;; SMTP configuration
;;                   (starttls-use-gnutls . t)
;;                   (smtpmail-starttls-credentials . '(("smtp.gmail.com" 587 nil nil)))
;;                   (smtpmail-smtp-user . "address1@gmail.com")
;;                   (smtpmail-auth-credentials .
;;                                              '(("smtp.gmail.com" 587 "address1@gmail.com" nil)))
;;                   (smtpmail-default-smtp-server . "smtp.gmail.com")
;;                   (smtpmail-smtp-server . "smtp.gmail.com")
;;                   (smtpmail-smtp-service . 587)))
;;         ,(make-mu4e-context
;;           :name "Business Address" ;; Or any other name you like.
;;           :enter-func (lambda () (mu4e-message "Entering cablecar context"))
;;           :leave-func (lambda () (mu4e-message "Leaving cablecar context"))

;;           :match-func (lambda (msg)
;;                         (when msg
;;                           (string= (mu4e-message-field msg :maildir) "/address2@gmail")))
;;           :vars '((user-mail-address . "address2@gmail.com")
;;                   (user-full-name . "Your Name Here")
;;                   (mu4e-drafts-folder . "/address2@gmail/[Gmail].Drafts")
;;                   (mu4e-refile-folder . "/address2@gmail/[Gmail].All Mail")
;;                   (mu4e-sent-folder . "/address2@gmail/[Gmail].Sent Mail")
;;                   (mu4e-trash-folder . "/address2@gmail/[Gmail].Trash")
;;                   ;; SMTP configuration
;;                   (starttls-use-gnutls . t)
;;                   (smtpmail-startt
;;                   (smtpmail-smtp-user . "address2@gmail.com")
;;                   (smtpmail-auth-credentials .
;;                                              '(("smtp.gmail.com" 587 "address2@gmail.com" nil)))
;;                   (smtpmail-default-smtp-server . "smtp.gmail.com")
;;                   (smtpmail-smtp-server . "smtp.gmail.com")
;;                   (smtpmail-smtp-service . 587)))
;;         ))

;; (setq mu4e-maildir-shortcuts  '((:maildir "/address2@gmail/INBOX"               :key ?i)
;;                                 (:maildir "/address2@gmail/[Gmail].Sent Mail"   :key ?s)
;;                                 (:maildir "/address2@gmail/[Gmail].Drafts"      :key ?d)
;;                                 (:maildir "/address2@gmail/[Gmail].Trash"       :key ?t)
;;                                 (:maildir "/address2@gmail/[Gmail].All Mail"    :key ?a)
;;                                 (:maildir "/address1@gmail/INBOX"               :key ?I)
;;                                 (:maildir "/address1@gmail/[Gmail].Sent Mail"   :key ?S)
;;                                 (:maildir "/address1@gmail/[Gmail].Drafts"      :key ?D)
;;                                 (:maildir "/address1@gmail/[Gmail].Trash"       :key ?T)
;;                                 (:maildir "/address1@gmail/[Gmail].All Mail"    :key ?A)))
