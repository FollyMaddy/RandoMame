local button = {}
for i, j in  ipairs(manager.machine.ioport.ports) do
 for field_name, field in pairs(j.fields) do
  print("")
  print(field_name)
  --print("  tag", field.port.tag)
  --print("  mask", field.mask)
  --print("  type", field.type)
  id = field.port.tag .. ',' .. field.mask .. ',' .. field.type
  print("id:", id)
  button[id] = field
 end
end

local boot_end_frame = 700
local frame_num = 0
local previous_throttled = manager.machine.video.throttled
local previous_frameskip = manager.machine.video.frameskip

local function process_frame()
        frame_num = frame_num + 1

        if frame_num == 1 then
		    manager.machine.video.throttled = false
		    manager.machine.video.frameskip = 12
	end

	if frame_num == boot_end_frame then
 		    manager.machine.video.throttled = previous_throttled
    		    manager.machine.video.frameskip = previous_frameskip

                    button[":MOUSEBTN,1,64"]:set_value(1)
	end

        if frame_num == boot_end_frame + 20 then
	            button["MOUSEBTN,1,64"]:set_value(0)
        end
end

emu.register_frame_done(process_frame)


