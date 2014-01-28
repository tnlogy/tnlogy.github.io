---
layout: post
title:  "Events in Lua"
date:   2014-01-28 19:00:00
categories: events, lua
---

My recent hobby language is [Lua][lua], to be more specific using [Codea][codea]. I'm using the Codea [class][class] system. 

{% highlight lua%}
Item = class()

function Item:on(names, f)
    for name in string.gmatch(names, "%S+") do
        if not self.events then self.events = {} end
        if not self.events[name] then self.events[name] = {} end
        table.insert(self.events[name], f)
    end
    return self
end

function Item:trigger(name, ...)
    self.lastTrigger = name
    local evs = (self.events and self.events[name]) or {}
    for i,f in ipairs(evs) do f(...) end
end

function Item:off(nameOrFn, fn)
    local name = nameOrFn
    if type(nameOrFn) == "function" then
        name,fn = nil,nameOrFn
    end
    if not fn then
        self.events[name] = nil
    else
        local evs = self.events
        if name then evs = {evs[name]} end
        for k,fns in pairs(evs) do
            for i,f in ipairs(fns) do
                if f == fn then table.remove(fns,i) end
            end
        end
    end
    return self
end
{% endhighlight %}

_Todays Link_ is to help you write, a nice site called [Written? Kitten!][writtenkitten].

