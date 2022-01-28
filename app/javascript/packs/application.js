import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "jquery"
import "@popperjs/core"
import 'bootstrap'
import "../packs/utilities/sorting"
import "../packs/utilities/coincidence_pass"
