local frame_num = 0

local function process_frame()
        frame_num = frame_num + 1

        if frame_num == 1 then
            emu.keypost("*CAT\n")
        elseif frame_num == 200 then
            emu.keypost("*EXEC !BOOT\n")
        end
end

emu.register_frame_done(process_frame)



