(set-default-font "Inconsolata-11")

(add-hook 'python-mode-hook '(lambda () (require 'virtualenv)))

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 100))
           (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist 
         (cons 'height (/ (- (x-display-pixel-height) 100)
                             (frame-char-height)))))))

(set-frame-size-according-to-resolution)

(add-to-list 'load-path (concat dotfiles-dir "weston/yasnippet-0.6.1c"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "weston/yasnippet-0.6.1c/snippets"))
