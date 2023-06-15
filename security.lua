local allowedIPs = {
    "no ip for u",
    "no ip for u"
  }
  
  function isAuthorized(client)

    local username = "admin"
    local password = "password"
  
    local clientIP = client:getpeername()
  
    local isIPAllowed = false
    for _, allowedIP in ipairs(allowedIPs) do
      if allowedIP == clientIP then
        isIPAllowed = true
        break
      end
    end
  
    if username == "admin" and password == "password" and isIPAllowed then
      return true
    else
      return false
    end
  end
  
  function validateData(data)
  
    if tonumber(data) then
      return true
    else
      return false
    end
  end
  
  return {
    isAuthorized = isAuthorized,
    validateData = validateData
  }
  