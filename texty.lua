local args = {...}



if not args[1] then -- you need a file bozo
   error("No input file specified")
end


local code = {}


local stack = {}

-- VARIABLES
local input = "" -- Stores input
local accu = 0 -- Stores output of whatever the + or - command did



local PC = 1 -- fuck you lua for indexing tables at 1 but i also love it


--Reads the file line by line
for line in io.lines(args[1]) do
    table.insert(code,line)
end




-- MAIN LOOP

linern = code[PC]

while true do

        linern = code[PC]


        if linern == "+-" then -- +- reads input from the user
            input = io.read()
            if tonumber(input) == nil then else input = tonumber(input) end
            PC = PC + 1

        elseif linern == "+" then -- very complicated

            local n1 = stack[tonumber(code[PC + 1])] or 0 -- reads n1 as the first arg, being the item of the stack at index PC + 1

            if code[PC + 1] == "+/" then -- if its the accu, then sets it to accu
                n1 = accu

            elseif code[PC + 1] == "--" then -- same with input
                n1 = tonumber(input) or 0
            end

            local n2 = stack[tonumber(code[PC + 2])] or 0 -- same as above

            if code[PC + 2] == "+/" then
                n2 = accu
            elseif code[PC + 2] == "--" then
                n2 = tonumber(input) or 0
            end


            accu = n1 + n2 -- finally adds them together
            PC = PC + 3


            elseif linern == "-" then -- same as aboce but subtracts

                local n1 = stack[tonumber(code[PC + 1])] or 0 -- reads n1 as the first arg, being the item of the stack at index PC + 1

                if code[PC + 1] == "+/" then -- if its the accu, then sets it to accu
                    n1 = accu

                elseif code[PC + 1] == "--" then -- same with input
                    n1 = tonumber(input) or 0
                end

                local n2 = stack[tonumber(code[PC + 2])] or 0 -- same as above

                if code[PC + 2] == "+/" then
                    n2 = accu
                elseif code[PC + 2] == "--" then
                    n2 = tonumber(input) or 0
                end


                accu = n1 - n2
                PC = PC + 3


        elseif linern == "+/" then -- returns the accu, in this case it prints it
            print(accu)
            PC = PC + 1


        elseif linern == "--" then --same as above but with input
            print(input)
            PC = PC + 1

        elseif linern == "//" then -- pushes onto the stack
            local item = code[PC + 1]

            if item == "+/" then
                item = accu

            elseif item  == "--" then
                item = input
            end

            table.insert(stack, item)
            PC = PC + 2


        elseif tonumber(linern) then -- prints whatever is on the stack at the index of the code rn
            print(stack[tonumber(linern)])
            PC = PC + 1


        elseif linern == "**" then
            PC = tonumber(stack[tonumber(code[PC + 1])])
            if PC == nil then
               error("Not a valid number to jump to!!")
            end

        elseif linern == "*/" then
            if accu == 0 then
                PC = tonumber(stack[tonumber(code[PC + 1])])
                if PC == nil then
                    error("Not a valid number to jump to!!")
                end
            else
                PC = PC + 2

            end

        elseif linern == "++" then -- ++ terminates the program
            break

        else
            print(linern)
            PC = PC + 1
        end
end

