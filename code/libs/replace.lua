local pattern = ' {(.-)}'
local gsub = string.gsub

-- This function replaces '{}' patterns in a string with a replacment string
local replace = function(str, repl)
  if type(repl) == 'string' then
    return gsub(str, pattern, repl ~= '' and ' '..repl or '')  
  elseif type(repl) == 'table' then
    if repl.class then 
      return gsub(str, pattern, tostring(repl))
    else -- just a regular table 
      return gsub(str, pattern, function(s) return repl[s] and (repl[s] ~= '' and ' '..repl[s]) or '' end)
    end
  end
end

return replace