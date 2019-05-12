{:user
 {:plugins
  []

  :dependencies
  [[clj-stacktrace "0.2.8"]
   [pjstadig/humane-test-output "0.9.0" :exclusions  [[org.clojure/clojure]]]
   [org.clojure/tools.namespace "0.2.11"]]
  }

 :repl
 {:plugins
  [[refactor-nrepl "2.4.1-SNAPSHOT"]
   [cider/cider-nrepl "0.22.0-SNAPSHOT"]]

  :dependencies
  [[org.clojure/tools.nrepl "0.2.13" :exclusions [org.clojure/clojure]]]

  :injections
  [(require '[clojure.string :as string])
   (require '[clojure.pprint :refer [pprint]])] }}
