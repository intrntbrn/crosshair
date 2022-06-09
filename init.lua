local wibox = require("wibox")
local awful = require("awful")

local module = {}

local function toggle()
	module.popup.visible = not module.popup.visible
end

local function new(args)
	args = args or {}

	-- defaults
	local s = args.screen or screen.primary
	local border = args.outline or args.border or 0
	local color = args.color or "#00FF00FF"
	local size = args.size or 12
	local thickness = args.thickness or 6
	local gap = args.gap or 4
	local dot = args.dot or 0
	local visible = args.visible

	-- limits
	gap = math.max(0, gap)
	size = math.max(0, size)
	thickness = math.max(0, thickness)
	local width = ((size + gap) * 2)

	if gap > 0 then
		gap = gap + (thickness / 2) - 1 - border
		width = ((size + gap) * 2)
	else
		gap = nil
	end

	-- no gap
	local function cross(cr, w, h)
		local xpadding = (w - thickness) / 2
		local ypadding = (h - thickness) / 2
		cr:move_to(xpadding, 0)
		cr:line_to(w - xpadding, 0)
		cr:line_to(w - xpadding, ypadding)
		cr:line_to(w, ypadding)
		cr:line_to(w, h - ypadding)
		cr:line_to(w - xpadding, h - ypadding)
		cr:line_to(w - xpadding, h)
		cr:line_to(xpadding, h)
		cr:line_to(xpadding, h - ypadding)
		cr:line_to(0, h - ypadding)
		cr:line_to(0, ypadding)
		cr:line_to(xpadding, ypadding)
		cr:close_path()
	end

	-- gap
	local function gapcross(cr, w, h)
		local start_x, start_y

		-- left
		start_x = 0
		start_y = gap + size - (thickness / 2) + border
		cr:move_to(start_x, start_y)
		cr:line_to(start_x + size, start_y)
		cr:line_to(start_x + size, start_y + thickness)
		cr:line_to(start_x, start_y + thickness)
		cr:line_to(start_x, start_y)

		-- right
		start_x = size + gap + gap + (border * 2)
		start_y = gap + size - (thickness / 2) + border
		cr:move_to(start_x, start_y)
		cr:line_to(start_x + size, start_y)
		cr:line_to(start_x + size, start_y + thickness)
		cr:line_to(start_x, start_y + thickness)
		cr:line_to(start_x, start_y)

		-- top
		start_x = gap + size + (thickness / 2) + border
		start_y = 0
		cr:move_to(start_x, start_y)
		cr:line_to(start_x, start_y + size)
		cr:line_to(start_x - thickness, start_y + size)
		cr:line_to(start_x - thickness, start_y)
		cr:line_to(start_x, start_y)

		-- -- bottom
		start_x = gap + size + (thickness / 2) + border
		start_y = size + gap + gap + (border * 2)
		cr:move_to(start_x, start_y)
		cr:line_to(start_x, start_y + size)
		cr:line_to(start_x - thickness, start_y + size)
		cr:line_to(start_x - thickness, start_y)
		cr:line_to(start_x, start_y)

		if dot > 0 then
			local radius = dot
			cr:move_to(w / 2 + radius, h / 2)
			cr:arc(w / 2, h / 2, radius, 0, 2 * math.pi)
			cr:close_path()
		end
	end

	-- popup
	module.popup = awful.popup({
		screen = s,
		placement = awful.placement.centered,
		ontop = true,
		border_width = border,
		minimum_height = width,
		maximum_height = width,
		minimum_width = width,
		maximum_width = width,
		bg = color,
		shape = gap and gapcross or cross,
		widget = wibox.container.background,
		visible = visible,
	})

	awesome.connect_signal("crosshair::toggle", toggle)
end

return setmetatable(module, {
	__call = function(_, ...)
		return new(...)
	end,
})
