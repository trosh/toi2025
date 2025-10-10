#import "@preview/typslides:1.2.6": *

// Project configuration
#show: typslides.with(
  ratio: "16-9",
  theme: "bluey",
  font: "Fira Sans",
  link-style: "color",
)

#set text(lang: "fr")

// The front slide is the first slide of your presentation
#front-slide(
  title: "Techniques et outils d'ingénierie logicielle",
  subtitle: [Cours 1 --- bases],
  authors: [John Gliksberg --- Bull],
)

#slide(title: "Objet du cours")[
  - Maîtriser un _shell_ et ses automatisations
  - Avoir un environnement de développement productif
  - Savoir compiler un programme
  - Appréhender le cycle de vie d'un programme
  - Gestion de code source
  - Déboguer un programme
  - Profiler un programme
]

#table-of-contents()

#title-slide[ Règles du jeu ]
#slide[ #align(center)[ Matière *pratique* \ TP *notés* ] ]
#slide[ #align(center)[ Matière *pratique* \ PC *à chaque séance* ] ]
#slide[ #align(center)[ Environnement type *UNIX* \ (Linux, BSD, Max, WSL) ] ]
#slide[ #align(center)[ Accès facile *à tout moment* au terminal ] ]
#slide[ #align(center)[ *Participez* \ mais lisez les manuels ] ]
#slide[ #align(center)[ Pas de magie, explications *spécifiques* ] ]
#slide[ #align(center)[ *Testez* ce que vous dites ] ]
#slide[ #align(center)[ *Testez* ce que vous pensez ] ]
#slide[ #align(center)[ *Montrez* que vous avez compris ] ]
#slide[ #align(center)[ « Pas le temps de corriger ma config » *interdit* ] ]
#slide[ #align(center)[ _La peur n'évite pas le danger_ \ \
                        _La peur est la petite mort_ ] ]

#title-slide[ Les outils de l'ingénieur·e informaticien·ne ]
#slide[ #align(center)[ Le terminal, l'éditeur de texte, le VCS \
                        le compilateur, le débogueur, le profileur ] ]
#slide[ #align(center)[ L'invite de commande, les commandes, les raccourcis ] ]
#slide[ #align(center)[ Le système d'exploitation, l'environnement de bureau ] ]
#slide[ #align(center)[ Le PC, le clavier ] ]
#slide[ #align(center)[ Les mains, la dextérité ] ]
#slide[ #align(center)[ La tête, le sens critique, la curiosité, la parole \
                        la lecture, la mémoire, la capacité d'abstraction ] ]
#slide[ #align(center)[ Les manuels \ (et StackOverflow, Wikipédia, LLM) ] ]

#title-slide[ Le système d'exploitation ]

#slide[
  #grid(columns: (1fr, 1fr), gutter: 1em)[
    - Un noyau, des drivers, des systèmes de fichier
    - un environnement graphique
      - KDE, Gnome, Sway, XFCE
    - des programmes inclus
    - un gestionnaire de paquets
    - un ecosystème
    - des choix, par des gens
  ][
    - C'est votre maison, prenez-en soin
    - Modifiez le, testez en plusieurs
    - Soyez prêt·e à perdre tous les fichiers
  ]
]

#slide[
  Tous les fichiers sont dans un grand arbre de dossiers

  #align(right)[qui commence à la racine « / »]

  Il y a des chemins absolus `/home/`_`john`_`/.config/nvim/init.lua`

  #align(right)[et des chemins relatifs `Téléchargements/meme.gif`]
  #align(right)[`../../img/../src` \ `./.zshrc`]

  Il peut y avoir \~ n'importe quel caractère

  #align(right)[Les _dotfiles_ sont « cachés »]
]

#title-slide[ L'invite de commande ]

#slide[
  Il vous invite (_prompt_) à écrire des commandes
  #line(length: 100%)
  #text(font: "Fira mono")[
    #highlight[john]\@#highlight[superbecane]:#highlight[\~]\$
  ]
]

#slide[
  Les commandes sont une list de chaînes de caractères

  Les commandes sont structurées selon des conventions
  #line(length: 100%)
  #text(font: "Fira mono")[
    john\@superbecane:\~\$
    #highlight[find]
    #highlight[src]
    #highlight[-name]
    #highlight[\'\*.h\']
  ]
]

#slide[
  Les commandes sont sensibles à la casse
  #line(length: 100%)
  #text(font: "Fira mono")[
    john\@superbecane:\~\$ Find src -name '\*.h'

    -bash: Find: command not found

    john\@superbecane:\~\$ cd téléchargements

    -bash: cd: téléchargements: No such file or directory
  ]
]

#slide[
  Les commandes peuvent fournir des interfaces utilisateur :
  - en « ligne de commande » (CLI)
  - « textuelles » (TUI)
  - « graphiques » (GUI)
  - plusieurs à la fois ?
  - autres interfaces utilisateurs ?
  - autres interfaces ?
]

#title-slide[ Le grand bazaar ]

#slide[
  ls mv cp rm ln mkdir chmod chown touch wc sort cat tac tee pwd test du df dd
  \[ time date cal rename which whereis file more less sed grep awk tr head tail
  cut find tree mc ed vi em nano python perl lua go cargo m4 lex git jq gpg xargs
  dot tput su sudo sudoedit visudo w whoami ssh scp ftp tmux screen nc strace ping
  rsync ip ps top htop btop vmstat iostat free lsof nice dmesg lsusb lsblk fdisk
  mount mkfs cc as ar ld nm ldd gcc clang make cmake automake gdb valgrind perf lp
  tar zip curl wget zcat convert ffmpeg man info apt dpkg dnf yum rpm pacman
  emerge npm patch diff kill mkfifo mktemp fsck swapon swapoff watch cron reboot
  shutdown sqlite systemctl usermod timeout uptime chroot lscpu lstopo rg fd fzf
  bat nu neofetch
  #line(length: 100%)
  help cd echo printf test \[ \[\[ (( time if case while for break continue return
  exit kill sleep set export unset alias function source pushd pwd read shift trap
  \& > >> < << \$ \$\$ \$? \$0 \$( \${ \!\! !\$ { ( && || fg bg disown jobs clear
  reset ulimit
]

#slide[
  #cols(columns: (1fr, 1fr, 1fr))[
    #image("views.jpg", height: 100%)
  ][
    #image("magic.jpg", height: 100%)
  ][
    #image("feuds.jpg", height: 100%)
  ]
]

#slide[
  Commandes de base

  #align(center)[ pwd cd mkdir ls cat touch du df grep ]
]

#title-slide[ À l'aide ]

#slide[
  Le manuel

  #text(font: "Fira mono")[
    \$ #highlight[man] #highlight[\[\<section\>\]] #highlight[\<page\>]
  ]

  ```sh
  man ls
  man pwd
  man man
  man man-pages
  man firefox
  man 1 ls
  man 7 signal
  ```

  See also *ls*(*1*), *signal*(*7*).
]

#slide[
  Le manuel s'ouvre avec *less*(*1*) (TUI) par défaut

  - Flèches, PageDown/PageUp, `d`/`u`, `g`/`G`
  - `q`
  - `h`
  - `/ -d`
]

#slide[
  Les pages de manuel sont structurées

  #align(center)[ #text(size: 0.38em)[
    ```
    STANDARDS
           POSIX.1, except as noted.

    NOTES
           For a discussion of async-signal-safe functions, see signal-safety(7).

           The /proc/pid/task/tid/status file contains various fields that show
           the signals that a thread is blocking (SigBlk), catching (SigCgt), or
           ignoring (SigIgn).  (The set of signals that are caught or ignored will
           be the same across all threads in a process.)  Other fields show the
           set of pending signals that are directed to the thread (SigPnd) as well
           as the set of pending signals that are directed to the process as a
           whole (ShdPnd).  The corresponding fields in /proc/pid/status show the
           information for the main thread.  See proc(5) for further details.

    BUGS
           There are six signals that can be delivered as a consequence of a
           hardware exception: SIGBUS, SIGEMT, SIGFPE, SIGILL, SIGSEGV, and
           SIGTRAP.  Which of these signals is delivered, for any given hardware
           exception, is not documented and does not always make sense.

           For example, an invalid memory access that causes delivery of SIGSEGV
           on one CPU architecture may cause delivery of SIGBUS on another
           architecture, or vice versa.

           For another example, using the x86 int instruction with a forbidden
           argument (any number other than 3 or 128) causes delivery of SIGSEGV,
           even though SIGILL would make more sense, because of how the CPU
           reports the forbidden operation to the kernel.

    SEE ALSO
           kill(1), clone(2), getrlimit(2), kill(2), pidfd_send_signal(2),
           restart_syscall(2), rt_sigqueueinfo(2), setitimer(2), setrlimit(2),
           sgetmask(2), sigaction(2), sigaltstack(2), signal(2), signalfd(2),
           sigpending(2), sigprocmask(2), sigreturn(2), sigsuspend(2),
           sigwaitinfo(2), abort(3), bsd_signal(3), killpg(3), longjmp(3),
           pthread_sigqueue(3), raise(3), sigqueue(3), sigset(3), sigsetops(3),
           sigvec(3), sigwait(3), strsignal(3), swapcontext(3), sysv_signal(3),
           core(5), proc(5), nptl(7), pthreads(7), sigevent(3type)

    Linux man-pages 6.15              2025-05-17                         signal(7)
    ```
  ] ]
]

#slide[
  - manpages-fr
  - manpages-fr-dev
  - manpages-fr-extra
]

#slide[ `cat --help` ]

#title-slide[ Au secours ]
#slide[
  - CTRL + C → SIGINT
  - CTRL + S → TTY XOFF
  - CTRL + Q → TTY XON
]

#title-slide[ Automatisations dans l'invite de commande ]
#slide[
  ```sh
  test -f README.md
  echo $?
  ```
]

#slide[
  ```sh
  if ! test -f README.md
  then
    echo "Missing read me file" >&2
  fi
  ```
]

#slide[
  ```sh
  read_me () {
    if ! test -f README.md
    then
      echo "Missing read me file" >&2
      return 1
    fi
    less README.md
  }
  ```
]

#slide[
  ```sh
  n=1
  while valgrind --error-exitcode=123 test_injection_stress
  do
    ((++n))
  done
  echo $n
  ```
]

#slide[
  ```sh
  n=1 ; while valgrind --error-exitcode=123 test_injection_stress ; do
  ((++n)) ; done ; echo $n
  ```
]
