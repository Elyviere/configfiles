return {
  "echasnovski/mini.indentscope",
  opts = {
    draw = {
      animation = require("mini.indentscope").gen_animation.quartic({
        easing = "in",
        duration = 150,
        unit = "total",
      }),
    },
  },
}
