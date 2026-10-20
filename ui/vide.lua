type SourceNode__DARKLUA_TYPE_a<T> ={
cache:T,
[number]:Node__DARKLUA_TYPE_b<T>
}

type Node__DARKLUA_TYPE_b<T> ={
cache:T,
effect:((T)->T)|false,
cleanups:{()->()}|false,

context:{[number]:unknown}|false,

owned:{Node__DARKLUA_TYPE_b<T>}|false,
owner:Node__DARKLUA_TYPE_b<T>|false,

parents:{SourceNode__DARKLUA_TYPE_a<T>},
[number]:Node__DARKLUA_TYPE_b<T>
}

type Node__DARKLUA_TYPE_c<T> =Node__DARKLUA_TYPE_b<T>

type Node__DARKLUA_TYPE_d<T> =Node__DARKLUA_TYPE_b<T>

type userdata__DARKLUA_TYPE_e={__USERDATA:true}

type ProxyMT__DARKLUA_TYPE_f={
proxy:userdata__DARKLUA_TYPE_e,
data:Data__DARKLUA_TYPE_g,
__index:any,
__newindex:any
}

type Data__DARKLUA_TYPE_g={
name:string,
parent:Data__DARKLUA_TYPE_g?,
children:{Data__DARKLUA_TYPE_g},
changed:{[string]:RBXScriptSignal},
properties:{[string]:unknown},
destroying:RBXScriptSignal,
class:string,
type:"Instance"
}

type Node__DARKLUA_TYPE_h<T> =Node__DARKLUA_TYPE_b<T>

type Action__DARKLUA_TYPE_i={
priority:number,
callback:(Instance)->()
}

type Node__DARKLUA_TYPE_j<T> =Node__DARKLUA_TYPE_b<T>

type Array__DARKLUA_TYPE_k<V> ={V}

type ArrayOrV__DARKLUA_TYPE_l<V> ={ArrayOrV__DARKLUA_TYPE_l<V>}|V

type Map__DARKLUA_TYPE_m<K,V> ={[K]:V}

type Cache__DARKLUA_TYPE_n={

events:Array__DARKLUA_TYPE_k<
|string
|(()->())
>,


actions:Map__DARKLUA_TYPE_m<
number,
Array__DARKLUA_TYPE_k<(Instance)->()>
>,


parent:unknown,


nested_debug:Map__DARKLUA_TYPE_m<
number,
Map__DARKLUA_TYPE_m<string,true>
>,



nested_stack:{{}|number}
}

type Instances__DARKLUA_TYPE_o={
Folder:Folder,
BillboardGui:BillboardGui,
CanvasGroup:CanvasGroup,
Frame:Frame,
ImageButton:ImageButton,
ImageLabel:ImageLabel,
ScreenGui:ScreenGui,
ScrollingFrame:ScrollingFrame,
SurfaceGui:SurfaceGui,
TextBox:TextBox,
TextButton:TextButton,
TextLabel:TextLabel,
UIAspectRatioConstraint:UIAspectRatioConstraint,
UICorner:UICorner,
UIGradient:UIGradient,
UIGridLayout:UIGridLayout,
UIListLayout:UIListLayout,
Camera:Camera,
WorldModel:WorldModel,
}

type function Properties__DARKLUA_TYPE_p(instance:type?)
local a=types.newtable()

while instance do
for b,c in instance:properties()do
local d=c.read and c.read.tag=="table"and c.read:readproperty(types.singleton"Connect")
if d then
local e=d:parameters().head
if not e then continue end
local g=e[2]
if not g then continue end
a:setproperty(b,types.optional(g))
elseif c.write then
a:setproperty(b,types.optional(types.unionof(
c.write,
types.newfunction({},{head={c.write}})
)))
end
end

instance=instance:readparent()
end

a:setindexer(types.number,types.any)

return a
end

type Create__DARKLUA_TYPE_q=<Name>(Name|keyof<Instances__DARKLUA_TYPE_o>|"")->(Properties__DARKLUA_TYPE_p<index<Instances__DARKLUA_TYPE_o,Name>>)->index<Instances__DARKLUA_TYPE_o,Name>

type Node__DARKLUA_TYPE_r<T> =Node__DARKLUA_TYPE_b<T>

type Source__DARKLUA_TYPE_s<T> =(()->T)&((value:T)->T)

type Destroyable__DARKLUA_TYPE_t={destroy:(any)->()}|{Destroy:(any)->()}

type Disconnectable__DARKLUA_TYPE_u={disconnect:(any)->()}|{Disconnect:(any)->()}

type Node__DARKLUA_TYPE_v<T> =Node__DARKLUA_TYPE_b<T>

type Node__DARKLUA_TYPE_w<T> =Node__DARKLUA_TYPE_b<T>

type Context__DARKLUA_TYPE_x<T> =(()->T)&(<U>(T,()->U)->U)

type Array__DARKLUA_TYPE_y<T> ={T}

type Map__DARKLUA_TYPE_z<K,V> ={[K]:V}

type Source__DARKLUA_TYPE_A<T> =()->T

type Component__DARKLUA_TYPE_B<T> =(Source__DARKLUA_TYPE_A<boolean>)->(T,...number)

type Array__DARKLUA_TYPE_C<T> ={T}

type Source__DARKLUA_TYPE_D<T> =()->T

type Array__DARKLUA_TYPE_E<T> ={T}

type Map__DARKLUA_TYPE_F<K,V> ={[K]:V}

type Source__DARKLUA_TYPE_G<T> =()->T

type Array__DARKLUA_TYPE_H<T> ={T}

type Map__DARKLUA_TYPE_I<K,V> ={[K]:V}

type Source__DARKLUA_TYPE_J<T> =()->T

type Node__DARKLUA_TYPE_K<T> =Node__DARKLUA_TYPE_b<T>

type SourceNode__DARKLUA_TYPE_L<T> =SourceNode__DARKLUA_TYPE_a<T>

type Animatable__DARKLUA_TYPE_M=number|CFrame|Color3|UDim|UDim2|Vector2|Vector3

type SpringState__DARKLUA_TYPE_N<T> ={
k:number,
c:number,

x0_123:vector,x0_456:vector,
x_123:vector,x_456:vector,
x1_123:vector,x1_456:vector,
v_123:vector,v_456:vector,

source_value:T
}

type SpringSettings__DARKLUA_TYPE_O<T> =({
position:T?,
velocity:T?,
impulse:T?
})->()

type TypeToVec6__DARKLUA_TYPE_P<T> =(T)->(vector,vector)

type Vec6ToType__DARKLUA_TYPE_Q<T> =(vector,vector)->T

type Source__DARKLUA_TYPE_R<T> =Source__DARKLUA_TYPE_s<T>

type source__DARKLUA_TYPE_S<T> =Source__DARKLUA_TYPE_R<T>

type Context__DARKLUA_TYPE_T<T> =Context__DARKLUA_TYPE_x<T>

type context__DARKLUA_TYPE_U<T> =Context__DARKLUA_TYPE_T<T>local a={cache={}::any}do do local function __modImpl()

local function inline_test():string
return debug.info(1,"n")
end

local b=inline_test()~="inline_test"

return{
strict=not b,
defaults=true,
defer_nested_properties=true,
batch=false,
}end function a.a():typeof(__modImpl())local b=a.cache.a if not b then b={c=__modImpl()}a.cache.a=b end return b.c end end do local function __modImpl()

local b=a.a()




















local c={n=0}::{[number]:Node__DARKLUA_TYPE_b<any>,n:number}

local function efn(d:string)
local e=debug.traceback(d,2)

if string.find(d,"^effect error stacktrace")then
e=string.gsub("    "..e,"\n",function()
return"\n    "
end)
end

e..="\nsource update stacktrace:"
return e
end

local function ycall<T,U>(d:(T)->U,e:T):(boolean,string|U)

local g=coroutine.create(xpcall)

local h,i,j=coroutine.resume(g,d,efn,e)

assert(h)

if coroutine.status(g)~="dead"then
return false,debug.traceback(g,"attempt to yield in reactive scope")
end

return i,j
end

local function get_scope():Node__DARKLUA_TYPE_b<unknown>?
return c[c.n]
end

local function assert_stable_scope():Node__DARKLUA_TYPE_b<unknown>
local d=get_scope()

if not d then
local e=debug.info(2,"n")
return error(`cannot use {e}() outside a stable or reactive scope`,0)
elseif d.effect then
error("cannot create a new reactive scope inside another reactive scope",0)
end

return d
end

local function push_child<T>(d:SourceNode__DARKLUA_TYPE_a<any>,e:Node__DARKLUA_TYPE_b<any>)
table.insert(d,e)
table.insert(e.parents,d)
end

local function push_scope<T>(d:Node__DARKLUA_TYPE_b<T>)
local e=c.n+1
c.n=e
c[e]=d
end

local function pop_scope()
local d=c.n
c.n=d-1
c[d]=nil
end

local function push_cleanup<T>(d:Node__DARKLUA_TYPE_b<T>,e:()->())
if d.cleanups then
table.insert(d.cleanups,e)
else
d.cleanups={e}
end
end

local function flush_cleanups<T>(d:Node__DARKLUA_TYPE_b<T>)
if d.cleanups then
for e,g in d.cleanups do
local h,i:string?=xpcall(g,debug.traceback)
if not h then error(`cleanup error: {i}`,0)end
end

table.clear(d.cleanups)
end
end

local function find_and_swap_pop<T>(d:{T},e:T)
local g=table.find(d,e)::number
local h=#d
d[g]=d[h]
d[h]=nil
end

local function unparent<T>(d:Node__DARKLUA_TYPE_b<T>)
local e=d.parents

for g,h in e do
find_and_swap_pop(h,d)
e[g]=nil
end
end

local function destroy<T>(d:Node__DARKLUA_TYPE_b<T>)
if b.strict and table.find(c,d)then
error("attempt to destroy an active scope",0)
end

flush_cleanups(d)
unparent(d)

if d.owner then
find_and_swap_pop(d.owner.owned::{Node__DARKLUA_TYPE_b<T>},d)
d.owner=false
end

if d.owned then
local e=d.owned
while e[1]do destroy(e[1])end
end
end

local function destroy_owned<T>(d:Node__DARKLUA_TYPE_b<T>)
if d.owned then
local e=d.owned
while e[1]do destroy(e[1])end
end
end

local d={n=0}::{n:number,[number]:Node__DARKLUA_TYPE_b<any>}

local function evaluate_node<T>(e:Node__DARKLUA_TYPE_b<T>)
if b.strict then
if table.find(c,e)then
error("a scope, that should rerun due to the update of a source, is already active",0)
end

local g=e.cache

for h=1,2 do
local i=e.cache

flush_cleanups(e)
destroy_owned(e)

push_scope(e)
local j,k=ycall(e.effect::(T)->T,i)
pop_scope()

if not j then
table.clear(d)
d.n=0
error(`effect error stacktrace\n{k::string}`,0)
end

e.cache=k::T
end

return g~=e.cache
else
local g=e.cache

flush_cleanups(e)
destroy_owned(e)

push_scope(e)
local h,i=pcall(e.effect::(T)->T,e.cache)
pop_scope()

if not h then
table.clear(d)
d.n=0
error(`effect error:\n{i}\n`,0)
end

e.cache=i
return g~=i
end
end

local function queue_children_for_update<T>(e:SourceNode__DARKLUA_TYPE_a<T>)
local g=d.n
while e[1]do
g+=1
d[g]=e[1]
unparent(e[1])
end
d.n=g
end

local function get_update_queue_length()
return d.n
end

local function flush_update_queue(e:number)
local g=e+1
while g<=d.n do
local h=d[g]


if h.owner and evaluate_node(h)then
queue_children_for_update(h)
end

d[g]=false::any
g+=1
end

d.n=e
end

local function update_descendants<T>(e:SourceNode__DARKLUA_TYPE_a<T>)
local g=d.n
queue_children_for_update(e)

if b.batch then return end

local h=g+1
while h<=d.n do
local i=d[h]



if i.owner and evaluate_node(i)then
queue_children_for_update(i)
end

d[h]=false::any
h+=1
end

d.n=g
end

local function push_scope_as_child_of<T>(e:SourceNode__DARKLUA_TYPE_a<T>)
local g=get_scope()
if g and g.effect then
push_child(e,g)
end
end

local function create_node<T>(e:false|Node__DARKLUA_TYPE_b<any>,g:false|((T)->T),h:T):Node__DARKLUA_TYPE_b<T>
local i:Node__DARKLUA_TYPE_b<T> ={
cache=h,
effect=g,
cleanups=false,

context=false,

owner=e,
owned=false,

parents={},
}

if e then
if e.owned then
table.insert(e.owned,i)
else
e.owned={i}
end
end

return i
end

local function create_source_node<T>(e:T):SourceNode__DARKLUA_TYPE_a<T>
return{cache=e}
end

local function get_children<T>(e:Node__DARKLUA_TYPE_b<T>):{Node__DARKLUA_TYPE_b<unknown>}
return{unpack(e)}::{Node__DARKLUA_TYPE_b<any>}
end

local function set_context<T>(e:Node__DARKLUA_TYPE_b<T>,g:number,h:unknown)
if e.context then
e.context[g]=h
else
e.context={[g]=h}
end
end

return table.freeze{
push_scope=push_scope,
pop_scope=pop_scope,
evaluate_node=evaluate_node,
get_scope=get_scope,
assert_stable_scope=assert_stable_scope,
push_cleanup=push_cleanup,
destroy=destroy,
flush_cleanups=flush_cleanups,
push_scope_as_child_of=push_scope_as_child_of,
update_descendants=update_descendants,
push_child=push_child,
create_node=create_node,
create_source_node=create_source_node,
get_children=get_children,
flush_update_queue=flush_update_queue,
get_update_queue_length=get_update_queue_length,
set_context=set_context,
scopes=c,

q=d
}end function a.b():typeof(__modImpl())local b=a.cache.b if not b then b={c=__modImpl()}a.cache.b=b end return b.c end end do local function __modImpl()

local b=a.b()

local c=b.create_node
local d=b.push_scope
local e=b.pop_scope
local g=b.destroy

local h={}

local function root<T...>(i:(destroy:()->())->T...):(()->(),T...)
local j=c(false,false,false)

h[j]=true

local k=function()
if not h[j]then error"root already destroyed"end
h[j]=nil
g(j)
end

d(j)

local l={xpcall(i,debug.traceback,k)}

e()

if not l[1]then
k()
error(`error while running root():\n\n{l[2]}`,0)
end

return k,unpack(l::any,2)
end

return root::<T...>(fn:(destroy:()->())->T...)->(()->(),T...)end function a.c():typeof(__modImpl())local b=a.cache.c if not b then b={c=__modImpl()}a.cache.c=b end return b.c end end do local function __modImpl()

local b=a.b()

local c=b.create_node
local d=b.push_scope
local e=b.pop_scope
local g=b.destroy
local h=b.get_scope

local function branch<T>(i:()->T):(()->(),T)
local j=h()
if not j then
error(`cannot use branch() outside a stable or reactive scope`,0)
end

local k=j.owner
if not k then
error(`current scope is not owned by a scope`,0)
end

local l=c(k,false,false)

local m=function()
g(l)
end

d(l)

local n,o=xpcall(i,debug.traceback)

e()

if not n then
m()
error(`error while running branch():\n\n{o}`,0)
end

return m,o
end

return branch end function a.d():typeof(__modImpl())local b=a.cache.d if not b then b={c=__modImpl()}a.cache.d=b end return b.c end end do local function __modImpl()







local b={}::any do
b.__index=b
b.__type="RBXScriptSignal"

local function new_connection(c,d)
return{
signal=c,
fn=d,

Disconnect=function(e)
local g=table.find(c.connections,e)
if not g then return end
table.remove(c.connections,g)
end
}
end

function b.new()
return setmetatable({
connections={}
},b)
end

function b.Connect(c,d)
local e=new_connection(c,d)
table.insert(c.connections,e)
return e
end

function b.fire(c,...)
for d=#c.connections,1,-1 do
c.connections[d].fn(...)
end
end
end

local c={}::any do






























local function deep_clone<T>(d:T&{}):T
local e=table.clone(d::{})::{}

for g,h in next,e do
if type(h)=="table"then
e[g]=deep_clone(h)
end
end

return e::T&{}
end

local d={}::{[Data__DARKLUA_TYPE_g]:userdata__DARKLUA_TYPE_e?}
setmetatable(d::any,{__mode="v"})


local e,g

local function get_data(h:userdata__DARKLUA_TYPE_e):Data__DARKLUA_TYPE_g
local function f(i:userdata__DARKLUA_TYPE_e):ProxyMT__DARKLUA_TYPE_f
return getmetatable(i::any)
end

return f(h).data
end

local function get_proxy(h:Data__DARKLUA_TYPE_g):userdata__DARKLUA_TYPE_e
return d[h]or(function()
local i=newproxy(true)
local j=getmetatable(i)
j.proxy=i
j.data=h
j.__index=e
j.__newindex=g
d[h]=i
return i
end)()
end

local function is_instance(h:unknown):boolean
local i=getmetatable(h::any)
return i and i.data and i.data.type=="Instance"
end

local h={}

e=function(i:userdata__DARKLUA_TYPE_e,j:string):()
local k=get_data(i)
return if h[j]then h[j]
elseif j=="Name"then k.name
elseif j=="Parent"then(k.parent and get_proxy(k.parent))
elseif j=="Destroying"then k.destroying
else k.properties[j]
end

g=function(i:userdata__DARKLUA_TYPE_e,j:string,k:unknown)
local l=get_data(i)
if j=="Name"then
if type(k)~="string"then error("name must be a string",2)end
l.name=k::string
elseif j=="Parent"then
assert(k==nil or is_instance(k),"attempt to set non-instance as parent")
local m=l.parent
if m then
l.parent=nil
table.remove(m.children,table.find(m.children,l))
end
if k then
l.parent=get_data(k::userdata__DARKLUA_TYPE_e)
table.insert(get_data(k::userdata__DARKLUA_TYPE_e).children,l)
end
else
l.properties[j]=k
end

if l.changed[j]then
b.fire(l.changed[j])
end
end

function c.new(i:string):Instance
local j={
name="UNNAMED",
parent=nil,
children={},
changed={},
properties={},
class=i,
destroying=b.new()::any,
type="Instance"::"Instance"
}

return get_proxy(j)::any
end

function c.is_instance(i:unknown):boolean
return is_instance(i)
end

function h.Clone(i:userdata__DARKLUA_TYPE_e):userdata__DARKLUA_TYPE_e
local j=get_data(i)
local k=(c.new""::any)::userdata__DARKLUA_TYPE_e
local l=get_data(k)

for m,n in next,deep_clone(j)do
l[m]=n
end

return k
end

function h.FindFirstChild(i:userdata__DARKLUA_TYPE_e,j:string):userdata__DARKLUA_TYPE_e?
local k=get_data(i)
for l,m in k.children do
if m.name==j then
return get_proxy(m)
end
end
return nil
end

function h.GetChildren(i:userdata__DARKLUA_TYPE_e):{userdata__DARKLUA_TYPE_e}
local j=get_data(i).children
local k=table.create(#j)

for l,m in next,j do
k[l]=get_proxy(m)
end

return k
end

function h.GetPropertyChangedSignal(i:userdata__DARKLUA_TYPE_e,j:string):RBXScriptSignal
local k=get_data(i)
if not k.changed[j]then
k.changed[j]=b.new()::any
end
return k.changed[j]
end

function h.Destroy(i:userdata__DARKLUA_TYPE_e)
local j=get_data(i);
b.fire(j.destroying)
j.parent=nil
if j.changed.Parent then
b.fire(j.changed.Parent)
end
end
end

local function table_to_proxy(d:any)
local e=newproxy(true)
local g=getmetatable(e)

for h,i in getmetatable(d)do
g[h]=i
end

function g.__index(h,i)
return d[i]
end

function g.__newindex(h,i,j)
d[i]=j
end

return e
end

local d={__type="Color3"}::any do
function d.new(e,g,h)
return table_to_proxy(setmetatable({r=e,g=g,b=h},d))
end

function d.__eq(e,g)
return e.r==g.r and e.g==g.g and e.b==g.b
end
end

local e={__type="Vector2"}::any do
function e.new(g,h)
return table_to_proxy(setmetatable({x=g,y=h},e))
end

function e.__eq(g,h)
return g.x==h.x and g.y==h.y
end
end

local g={__type="UDim2"}::any do
function g.new(h,i,j,k)
return table_to_proxy(setmetatable({x={scale=h,offset=i},y={scale=j,offset=k}},g))
end

function g.fromScale(h,i)
return table_to_proxy(setmetatable({x={scale=h,offset=0},y={scale=i,offset=0}},g))
end

function g.__eq(h,i)
return h.x.scale==i.x.scale and
i.x.offset==i.x.offset and
h.y.scale==i.y.scale and
h.y.offset==i.y.offset
end
end

local h={}::any do
setmetatable(h,{__index=function(i,j)
local k=setmetatable({},{__index=function(k,l)
k[l]=true
return true
end})
i[j]=k
return k
end})
end

local i=function(i)
return if c.is_instance(i)then"Instance"
elseif getmetatable(i)and getmetatable(i).__type then getmetatable(i).__type
else type(i)
end::any

return{
Signal=b,
Instance=c::typeof(c),
Color3=d::typeof(d),
Vector2=e::typeof(e),
UDim2=g::typeof(g),
Enum=h::typeof(h),
typeof=i::typeof(i)
}end function a.e():typeof(__modImpl())local b=a.cache.e if not b then b={c=__modImpl()}a.cache.e=b end return b.c end end do local function __modImpl()

local b=a.b()

local c=b.create_node
local d=b.assert_stable_scope
local e=b.get_scope
local g=b.evaluate_node
local h=b.push_cleanup

local function update_property_effect(i:{
instance:Instance,
property:string,
source:()->unknown
})
(i.instance::any)[i.property]=i.source()
return i
end

local function update_parent_effect(i:{
instance:Instance,
source:()->Instance
})
i.instance.Parent=i.source()
return i
end


local function update_children_effect(i:{
instance:Instance,
cur_children_set:{[Instance]:true},
new_children_set:{[Instance]:true},
source:()->Instance|{Instance}
})
local j:{[Instance]:true}=i.cur_children_set
local k:{[Instance]:true}=i.new_children_set

local l=i.source()

local function process_child(m:Instance|{Instance})
if type(m)=="userdata"then
if k[m]then return end

k[m]=true

if not j[m]then
m.Parent=i.instance
else
j[m]=nil
end
elseif type(m)=="table"then
for n,o in m do
process_child(o)
end
elseif type(m)=="function"then
local n=c(assert(e()),update_children_effect,{
instance=i.instance,
cur_children_set={},
new_children_set={},
source=m
})

g(n)

h(assert(e()),function()
for o in n.cache.cur_children_set do
o.Parent=nil
end
end)
end
end

process_child(l)

for m in j do
m.Parent=nil
end

table.clear(j)
i.cur_children_set,i.new_children_set=k,j

return i
end

return{
property=function(i,j,k)
local l=c(d(),update_property_effect,{
instance=i,
property=j,
source=k
})

g(l)

return l
end,

parent=function(i,j)
local k=c(d(),update_parent_effect,{
instance=i,
source=j
})

g(k)

return k
end,

children=function(i,j)
local k=c(d(),update_children_effect,{
instance=i,
cur_children_set={},
new_children_set={},
source=j
})

g(k)

h(d(),function()
for l in k.cache.cur_children_set do
l.Parent=nil
end
end)

return k
end
}end function a.f():typeof(__modImpl())local b=a.cache.f if not b then b={c=__modImpl()}a.cache.f=b end return b.c end end do local function __modImpl()






local b=table.freeze{}

local function is_action(c:any)
return getmetatable(c)==b
end

local function action(c:(Instance)->(),d:number?):Action__DARKLUA_TYPE_i
local e={
priority=d or 1,
callback=c
}

setmetatable(e::any,b)

return table.freeze(e)
end

return function()
return action,is_action
end end function a.g():typeof(__modImpl())local b=a.cache.g if not b then b={c=__modImpl()}a.cache.g=b end return b.c end end do local function __modImpl()

local b=game and typeof or a.e().typeof::never

local c=a.a()
local d=a.f()local
e, g=a.g()()a.b()


































local h:Cache__DARKLUA_TYPE_n?

local function borrow_cache():Cache__DARKLUA_TYPE_n
if h then
local i=h
h=nil
return i
else
return{
events={},
actions=setmetatable({}::any,{
__index=function(i,j)i[j]={};return i[j]end
}),
parent=nil,
nested_debug=setmetatable({}::any,{
__index=function(i,j:number)i[j]={};return i[j]end
}),
nested_stack={}
}
end
end

local function return_cache(i:Cache__DARKLUA_TYPE_n)
h=i
end

local function process_properties(i:Map__DARKLUA_TYPE_m<unknown,unknown>,j:Instance,k:Cache__DARKLUA_TYPE_n,l:number)
for m,n in i do
if type(m)=="string"then
if c.strict then
if k.nested_debug[l][m]then
error(`duplicate property {m} at depth {l}`,0)
end
k.nested_debug[l][m]=true
end

if m=="Parent"then
k.parent=n
continue
end

if type(n)=="function"then
if b((j::any)[m])=="RBXScriptSignal"then
table.insert(k.events,m)
table.insert(k.events,n::()->())
else
d.property(j,m,n::()->())
end
else
(j::any)[m]=n
end
elseif type(m)=="number"then
if type(n)=="function"then
d.children(j,n::()->ArrayOrV__DARKLUA_TYPE_l<Instance>)
elseif type(n)=="table"then
if g(n)then
table.insert(k.actions[(n::any).priority],(n::any).callback::()->())
elseif c.defer_nested_properties then
table.insert(k.nested_stack,n::{})
table.insert(k.nested_stack,l+1)
else
process_properties(n::Map__DARKLUA_TYPE_m<unknown,unknown>,j,k,l+1)
end
elseif type(n)=="userdata"then
(n::Instance).Parent=j
end
end
end
end


local function apply<T>(i:T&Instance,j:{[unknown]:unknown}):T
if not j then
error"attempt to call a constructor returned by create() with no properties"
end

local k=borrow_cache()
local l=k.events
local m=k.actions
local n=k.nested_debug
local o=k.nested_stack


local p=1
repeat
process_properties(j,i,k,p)
p=table.remove(o)::number
j=table.remove(o)::{}
until not j

for q=1,#l,2 do
local r=l[q]
local s=l[q+1]
;(i::any)[r]:Connect(s)
end

for q,r in m do
for s,t in r do
t(i)
end
end

local q=k.parent
if q then
if type(q)=="function"then
d.parent(i,q::()->Instance)
else
i.Parent=q::Instance
end
end

table.clear(l)
for r,s in m do table.clear(s)end
k.parent=nil
if c.strict then table.clear(n)end
table.clear(o)

return_cache(k)

return i
end

return apply end function a.h():typeof(__modImpl())local b=a.cache.h if not b then b={c=__modImpl()}a.cache.h=b end return b.c end end do local function __modImpl()

local b=a.c()
local c=a.h()

local function mount<T>(d:()->T,e:Instance?):()->()
return b(function()
local g=d()
if e then c(e,{g})end
end)
end

return mount::(<T>(component:()->T,target:Instance)->()->())&((component:()->())->()->())end function a.i():typeof(__modImpl())local b=a.cache.i if not b then b={c=__modImpl()}a.cache.i=b end return b.c end end do local function __modImpl()

local b=game and Enum or a.e().Enum::never
local c=game and Color3 or a.e().Color3::never

return{
Part={
Material=b.Material.SmoothPlastic,
Size=vector.create(1,1,1),
Anchored=true
},

BillboardGui={
ResetOnSpawn=false,
ZIndexBehavior=b.ZIndexBehavior.Sibling
},

CanvasGroup=nil,

Frame={
BackgroundColor3=c.new(1,1,1),
BorderColor3=c.new(0,0,0),
BorderSizePixel=0
},

ImageButton={
BackgroundColor3=c.new(1,1,1),
BorderColor3=c.new(0,0,0),
BorderSizePixel=0,
AutoButtonColor=false
},

ImageLabel={
BackgroundColor3=c.new(1,1,1),
BorderColor3=c.new(0,0,0),
BorderSizePixel=0,
},

ScreenGui={
ResetOnSpawn=false,
ZIndexBehavior=b.ZIndexBehavior.Sibling
},

ScrollingFrame={
BackgroundColor3=c.new(1,1,1),
BorderColor3=c.new(0,0,0),
BorderSizePixel=0,
ScrollBarImageColor3=c.new(0,0,0)
},

SurfaceGui={
ResetOnSpawn=false,
ZIndexBehavior=b.ZIndexBehavior.Sibling,

PixelsPerStud=50,
SizingMode=b.SurfaceGuiSizingMode.PixelsPerStud
},

TextBox={
BackgroundColor3=c.new(1,1,1),
BorderColor3=c.new(0,0,0),
BorderSizePixel=0,
ClearTextOnFocus=false,
Font=b.Font.SourceSans,
Text="",
TextColor3=c.new(0,0,0)
},

TextButton={
BackgroundColor3=c.new(1,1,1),
BorderColor3=c.new(0,0,0),
BorderSizePixel=0,
AutoButtonColor=false,
Font=b.Font.SourceSans,
Text="",
TextColor3=c.new(0,0,0)
},

TextLabel={
BackgroundColor3=c.new(1,1,1),
BorderColor3=c.new(0,0,0),
BorderSizePixel=0,
Font=b.Font.SourceSans,
Text="",
TextColor3=c.new(0,0,0)
},

UIListLayout={
SortOrder=b.SortOrder.LayoutOrder
},

UIGridLayout={
SortOrder=b.SortOrder.LayoutOrder
},

UITableLayout={
SortOrder=b.SortOrder.LayoutOrder
},

UIPageLayout={
SortOrder=b.SortOrder.LayoutOrder
},

VideoFrame={
BackgroundColor3=c.new(1,1,1),
BorderColor3=c.new(0,0,0),
BorderSizePixel=0
},

ViewportFrame={
BackgroundColor3=c.new(1,1,1),
BorderColor3=c.new(0,0,0),
BorderSizePixel=0
}
}::{[string]:{[string]:unknown}}end function a.j():typeof(__modImpl())local b=a.cache.j if not b then b={c=__modImpl()}a.cache.j=b end return b.c end end do local function __modImpl()

local b=game and typeof or a.e().typeof::never
local c=game and Instance or a.e().Instance::never

local d=a.j()
local e=a.h()
local g=a.a()

local function create_constructor_for_class(h:string):({[unknown]:unknown})->Instance
local function constructor(i:{[unknown]:unknown}):Instance
local j,k:Instance=pcall(c.new,h::any)
if not j then error(`invalid class name {h}`,0)end

if g.defaults then
local l:{[string]:unknown}?=d[h]
if l then
for m,n in l do
(k::any)[m]=n
end
end
end

return e(k,i)
end

return constructor
end

local h={}::{[string]:({[unknown]:unknown})->Instance}


local function create(i:string|Instance,j:{[unknown]:unknown}?):unknown
if type(i)~="string"and b(i)~="Instance"then
error("bad argument #1, expected string or instance, got "..b(i),0)
end

local k:({[unknown]:unknown})->Instance
if type(i)=="string"then
k=h[i]
if not k then
k=create_constructor_for_class(i)
h[i]=k
end
else
k=function(l)
local m=assert(i:Clone(),"attempt to clone a non-archivable instance")
return e(m,l)
end
end

return if j
then k(j)
else k
end





















































return create::Create__DARKLUA_TYPE_q end function a.k():typeof(__modImpl())local b=a.cache.k if not b then b={c=__modImpl()}a.cache.k=b end return b.c end end do local function __modImpl()

local b=a.b()

local c=b.create_source_node
local d=b.push_scope_as_child_of
local e=b.update_descendants



local function source<T>(g:T):Source__DARKLUA_TYPE_s<T>
local h=c(g)

local function update_source(...):T
if select("#",...)==0 then
d(h)
return h.cache
end

local i=...::T
if h.cache==i and(type(i)~="table"or table.isfrozen(i))then
return i
end

h.cache=i
e(h)
return i
end

return update_source
end

return source::(<T>(initial_value:T)->Source__DARKLUA_TYPE_s<T>)&(<T>()->Source__DARKLUA_TYPE_s<T>)end function a.l():typeof(__modImpl())local b=a.cache.l if not b then b={c=__modImpl()}a.cache.l=b end return b.c end end do local function __modImpl()

local b=a.b()
local c=b.create_node
local d=b.assert_stable_scope
local e=b.evaluate_node

local function effect<T>(g:(T)->T,h:T)
local i=c(d(),g,h)

e(i)
end

return effect::(<T>(callback:(T)->T,initial_value:T)->())&((callback:()->())->())end function a.m():typeof(__modImpl())local b=a.cache.m if not b then b={c=__modImpl()}a.cache.m=b end return b.c end end do local function __modImpl()

local b=a.b()
local c=b.create_node
local d=b.push_scope_as_child_of
local e=b.assert_stable_scope
local g=b.evaluate_node

local function derive<T>(h:()->T):()->T
local i=c(e(),h,false::any)

g(i)

return function()
d(i)
return i.cache
end
end

return derive end function a.n():typeof(__modImpl())local b=a.cache.n if not b then b={c=__modImpl()}a.cache.n=b end return b.c end end do local function __modImpl()

local b=game and typeof or a.e().typeof::never

local c=a.b()
local d=c.get_scope
local e=c.push_cleanup

local function helper(g:any)
return
if b(g)=="RBXScriptConnection"then function()g:Disconnect()end
elseif type(g)=="thread"then function()task.cancel(g)end
elseif b(g)=="Instance"then function()g:Destroy()end
elseif g.destroy then function()g:destroy()end
elseif g.disconnect then function()g:disconnect()end
elseif g.Destroy then function()g:Destroy()end
elseif g.Disconnect then function()g:Disconnect()end
else error"cannot cleanup given object"
end

local function cleanup(g:unknown)
local h=d()

if not h then
error"cannot cleanup outside a stable or reactive scope"
end;assert(h)

if type(g)=="function"then
e(h,g::()->())
else
e(h,helper(g))
end
end




return cleanup::
((callback:()->())->())&
((thread:thread)->())&
((instance:Destroyable__DARKLUA_TYPE_t)->())&
((connection:Disconnectable__DARKLUA_TYPE_u)->())&
((instance:Instance)->())&
((connection:RBXScriptConnection)->())end function a.o():typeof(__modImpl())local b=a.cache.o if not b then b={c=__modImpl()}a.cache.o=b end return b.c end end do local function __modImpl()


local b=a.b()

local c=b.get_scope

local function untrack<T>(d:()->T):T
local e=c()

if e then

local g=e.effect
e.effect=false

local h,i=xpcall(d,debug.traceback)

e.effect=g::()->()

if not h then error(i,0)end

return i::T
else
return d()
end
end

return untrack::(<T>(fn:()->T)->T)&((fn:()->())->())end function a.p():typeof(__modImpl())local b=a.cache.p if not b then b={c=__modImpl()}a.cache.p=b end return b.c end end do local function __modImpl()

local function read<T>(b:T|(()->T)):T
return if type(b)=="function"then b()else b
end

return read end function a.q():typeof(__modImpl())local b=a.cache.q if not b then b={c=__modImpl()}a.cache.q=b end return b.c end end do local function __modImpl()

local b=a.a()
local c=a.b()

local function batch(d:()->())
local e=b.batch
local g

if not e then
b.batch=true
g=c.get_update_queue_length()
end

local h,i:string?=xpcall(d,debug.traceback)

if not e then
b.batch=false
c.flush_update_queue(g)
end

if not h then error(`error occured while batching updates: {i}`,0)end
end

return batch end function a.r():typeof(__modImpl())local b=a.cache.r if not b then b={c=__modImpl()}a.cache.r=b end return b.c end end do local function __modImpl()

local b=a.b()

local c=b.create_node
local d=b.get_scope
local e=b.push_scope
local g=b.pop_scope
local h=b.set_context



local i=newproxy()
local j=0

local function context<T>(...:T):Context__DARKLUA_TYPE_x<T>
j+=1
local k=j

local l=select("#",...)>0
local m=...

return function<T>(...):any
local n:(Node__DARKLUA_TYPE_w<unknown>?)|false=d()

if select("#",...)==0 then
while n do
local o=n.context

if not o then
n=n.owner
continue
end

local p=(o::{unknown})[k]

if p==nil then
n=n.owner
continue
end

return(if p~=i then p else nil)::T
end

if l~=nil then
return m
else
error("attempt to get context when no context is set and no default context is set",0)
end
else
if not n then return error("attempt to set context outside of a vide scope",0)end

local o,p=...

local q=c(n,false,false)
h(q,k,if o==nil then i else o)

e(q)

local function efn(r:string)return debug.traceback(r,3)end
local r,s=xpcall(p,efn)

g()

if not r then
error(`error while running context:\n\n{s}`,0)
end

return s
end

return nil::any
end
end

return context end function a.s():typeof(__modImpl())local b=a.cache.s if not b then b={c=__modImpl()}a.cache.s=b end return b.c end end do local function __modImpl()

local b={}::{
{t:number,fn:()->(),cancel:boolean}
}

local function timeout(c:number,d:()->())
local e={t=c,fn=d,cancel=false}
table.insert(b,e)
return e
end

local function update_timeouts(c:number)
for d=#b,1,-1 do
local e=b[d]
e.t-=c

if e.cancel or e.t<=0 then
b[d]=b[#b]
b[#b]=nil

if not e.cancel then
e.fn()
end
end
end
end

return function()return timeout,update_timeouts end end function a.t():typeof(__modImpl())local b=a.cache.t if not b then b={c=__modImpl()}a.cache.t=b end return b.c end end do local function __modImpl()

local b=a.d()
local c=a.l()
local d=a.m()
local e=a.t()()






local function switch_map<K,Obj>(
g:Source__DARKLUA_TYPE_A<K>,
h:Map__DARKLUA_TYPE_z<K,Component__DARKLUA_TYPE_B<Obj>>
):Source__DARKLUA_TYPE_A<nil|Obj|Array__DARKLUA_TYPE_y<Obj>>
local i={}::Map__DARKLUA_TYPE_z<K,{
destroy:()->(),
object:Obj,
delay:number,
present:(boolean?)->boolean,
timeout:{cancel:boolean}?
}>

local j=c(nil::nil|Obj|Array__DARKLUA_TYPE_y<Obj>)
local function update_output()
local k={}

for l,m in i do
table.insert(k,m.object)
end

j(
if k[2]then k
elseif k[1]then k[1]
else nil
)
end

d(function()
local k:K?=g()


for l,m in i do
if l==k then continue end

m.present(false)

if m.delay==0 then
m.destroy()
i[l]=nil
else
if m.timeout==nil then
m.timeout=e(m.delay,function()
m.destroy()
i[l]=nil
update_output()
end)
end
end
end


if k~=nil then
local l=i[k]

if l then
l.present(true)

if l.timeout then
l.timeout.cancel=true
l.timeout=nil
end
else
local m=h[k]

if m~=nil then
if type(m)~="function"then
error("map must map a value to a function",0)
end

local n=c(false)

local o=nil::number?
local p,q=b(function()
local p,q=m(n)
o=q
return p
end)

n(true)

i[k]={
destroy=p,
object=q,
delay=o or 0,
present=n,
timeout=nil
}
end
end
end

update_output()
end)

return j
end

local function switch<K,Obj>(g:Source__DARKLUA_TYPE_A<K>):(map:Map__DARKLUA_TYPE_z<K,Component__DARKLUA_TYPE_B<Obj>>)->Source__DARKLUA_TYPE_A<nil|Obj|Array__DARKLUA_TYPE_y<Obj>>
return function(h)
return switch_map(g,h)
end
end

return switch end function a.u():typeof(__modImpl())local b=a.cache.u if not b then b={c=__modImpl()}a.cache.u=b end return b.c end end do local function __modImpl()

local b=a.l()
local c=a.n()
local d=a.m()a.p()

local e=a.u()




local function show<T,Obj>(
g:Source__DARKLUA_TYPE_D<T?>,
h:(Source__DARKLUA_TYPE_D<T>,Source__DARKLUA_TYPE_D<boolean>)->(Obj,...number),
i:((Source__DARKLUA_TYPE_D<boolean>)->(Obj,...number))?
):Source__DARKLUA_TYPE_D<nil|Obj|Array__DARKLUA_TYPE_C<Obj>>
local j=b()

d(function()
local k=g()
if k then
j(k)
end
end)

local k=c(function()
return not not g()
end)

return e(k){
[true]=function(l)
return h(j,l)
end,
[false]=i
}
end

return show end function a.v():typeof(__modImpl())local b=a.cache.v if not b then b={c=__modImpl()}a.cache.v=b end return b.c end end do local function __modImpl()a.a()


local b=a.d()
local c=a.l()
local d=a.m()
local e=a.t()()





local function indexes<K,V,Obj>(
g:Source__DARKLUA_TYPE_G<Map__DARKLUA_TYPE_F<K,V>>,
h:(Source__DARKLUA_TYPE_G<V>,K,Source__DARKLUA_TYPE_G<boolean>)->(Obj,...number)
):Source__DARKLUA_TYPE_G<Array__DARKLUA_TYPE_E<Obj>>
local i=0
local j={}::Map__DARKLUA_TYPE_F<K,{
destroy:()->(),
object:Obj,
value:V?,
value_source:(V?)->V,
count:number,
delay:number,
present:(boolean?)->boolean,
timeout:{cancel:boolean}?,
}>

local k=c({}::Array__DARKLUA_TYPE_E<Obj>)
local function update_output()
local l=table.create(4)

for m,n in j do
table.insert(l,n.object)
end

k(l)
end

d(function()
local l=g()

local m=i
i+=1

local n=false


for o,p in l do
local q=j[o]

if q==nil then
local r=c(p)
local s=c(false)

local t=nil::number?
local u,v=b(function()
local u,v=h(r,o,s)
t=v
return u
end)

s(true)

n=true

j[o]={
destroy=u,
object=v,
value=p,
value_source=r,
count=m,
delay=t or 0,
present=s,
timeout=nil,
}
else
q.count=m

if q.value~=p then
if q.timeout then
q.timeout.cancel=true
q.timeout=nil
q.present(true)
end

q.value=p
q.value_source(p)
end
end
end


for o,p in j do
if p.count<m then
p.present(false)

if p.delay==0 then
p.destroy()
j[o]=nil
n=true
else
p.value=nil
if p.timeout==nil then
p.timeout=e(p.delay,function()
p.destroy()
j[o]=nil
update_output()
end)
end
end
end
end

if n then
update_output()
end
end)

return k
end

return indexes end function a.w():typeof(__modImpl())local b=a.cache.w if not b then b={c=__modImpl()}a.cache.w=b end return b.c end end do local function __modImpl()

local b=a.a()
local c=a.d()
local d=a.l()
local e=a.m()
local g=a.t()()





local function values<K,V,Obj>(
h:Source__DARKLUA_TYPE_J<Map__DARKLUA_TYPE_I<K,V>>,
i:(V,Source__DARKLUA_TYPE_J<K>,Source__DARKLUA_TYPE_J<boolean>)->(Obj,...number)
):Source__DARKLUA_TYPE_J<Array__DARKLUA_TYPE_H<Obj>>
local j=0
local k={}::Map__DARKLUA_TYPE_I<V,{
destroy:()->(),
object:Obj,
index:K?,
index_source:(K?)->K,
count:number,
delay:number,
present:(boolean?)->boolean,
timeout:{cancel:boolean}?,
}>

local l=d({}::Array__DARKLUA_TYPE_H<Obj>)
local function update_output()
local m=table.create(4)

for n,o in k do
table.insert(m,o.object)
end

l(m)
end

e(function()
local m=h()

local n=j
j+=1

local o=false

if b.strict then
local p={}
for q,r in m do
if p[r]then
error("table source passed to `values()` contains duplicate values",0)
end
p[r]=true
end
end


for p,q in m do
local r=k[q]

if r==nil then
local s=d(p)
local t=d(false)

local u=nil::number?
local v,w=c(function()
local v,w=i(q,s,t)
u=w
return v
end)

t(true)

o=true

k[q]={
destroy=v,
object=w,
index=p,
index_source=s,
count=n,
delay=u or 0,
present=t,
timeout=nil,
}
else
r.count=n

if r.index~=p then
if r.timeout then
r.timeout.cancel=true
r.timeout=nil
r.present(true)
end

r.index=p
r.index_source(p)
end
end
end


for p,q in k do
if q.count<n then
q.present(false)

if q.delay==0 then
q.destroy()
k[p]=nil
o=true
else
q.index=nil
if q.timeout==nil then
q.timeout=g(q.delay,function()
q.destroy()
k[p]=nil
update_output()
end)
end
end
end
end

if o then
update_output()
end
end)

return l
end

return values end function a.x():typeof(__modImpl())local b=a.cache.x if not b then b={c=__modImpl()}a.cache.x=b end return b.c end end do local function __modImpl()

local b=a.b()


local c=b.create_node
local d=b.create_source_node
local e=b.assert_stable_scope
local g=b.evaluate_node
local h=b.update_descendants
local i=b.push_scope_as_child_of

local j=120
local k=10_000
































local l={
number=function(l)
return vector.create(l,0,0),vector.zero
end::TypeToVec6__DARKLUA_TYPE_P<number>,

CFrame=function(l)
return l.Position,vector.create(l:ToEulerAnglesXYZ())
end::TypeToVec6__DARKLUA_TYPE_P<CFrame>,

Color3=function(l)

return vector.create(l.R,l.G,l.B),vector.zero
end::TypeToVec6__DARKLUA_TYPE_P<Color3>,

UDim=function(l)
return vector.create(l.Scale,l.Offset,0),vector.zero
end::TypeToVec6__DARKLUA_TYPE_P<UDim>,

UDim2=function(l)
return vector.create(l.X.Scale,l.X.Offset,l.Y.Scale),vector.create(l.Y.Offset,0,0)
end::TypeToVec6__DARKLUA_TYPE_P<UDim2>,

Vector2=function(l)
return vector.create(l.X,l.Y,0),vector.zero
end::TypeToVec6__DARKLUA_TYPE_P<Vector2>,

Vector3=function(l)
return l,vector.zero
end::TypeToVec6__DARKLUA_TYPE_P<Vector3>,

Rect=function(l)
return vector.create(l.Min.X,l.Min.Y,l.Max.X),vector.create(l.Max.Y,0,0)
end::TypeToVec6__DARKLUA_TYPE_P<Rect>,

table=function(l)
return vector.create(l[1]or 0,l[2]or 0,l[3]or 0),vector.create(l[4]or 0,0,0)
end::TypeToVec6__DARKLUA_TYPE_P<{number}>
}

local m={
number=function(m,n)
return m.X
end::Vec6ToType__DARKLUA_TYPE_Q<number>,

CFrame=function(m,n)
return CFrame.new(m)*CFrame.fromEulerAnglesXYZ(n.X,n.Y,n.Z)
end::Vec6ToType__DARKLUA_TYPE_Q<CFrame>,

Color3=function(m)
return Color3.new(math.clamp(m.X,0,1),math.clamp(m.Y,0,1),math.clamp(m.Z,0,1))
end::Vec6ToType__DARKLUA_TYPE_Q<Color3>,

UDim=function(m)
return UDim.new(m.X,math.round(m.Y))
end::Vec6ToType__DARKLUA_TYPE_Q<UDim>,

UDim2=function(m,n)
return UDim2.new(m.X,math.round(m.Y),m.Z,math.round(n.X))
end::Vec6ToType__DARKLUA_TYPE_Q<UDim2>,

Vector2=function(m)
return Vector2.new(m.X,m.Y)
end::Vec6ToType__DARKLUA_TYPE_Q<Vector2>,

Vector3=function(m)
return m
end::Vec6ToType__DARKLUA_TYPE_Q<Vector3>,

Rect=function(m,n)
return Rect.new(m.X,m.Y,m.Z,n.X)
end::Vec6ToType__DARKLUA_TYPE_Q<Rect>,

table=function(m,n)
return{m.X,m.Y,m.Z,n.X}
end::Vec6ToType__DARKLUA_TYPE_Q<{number}>
}

local n={
__index=function(n,o:string)
error(`cannot spring type {o}`,0)
end
}

setmetatable(l,n)
setmetatable(m,n)



local o:{[SpringState__DARKLUA_TYPE_N<unknown>]:SourceNode__DARKLUA_TYPE_L<unknown>}={}
setmetatable(o::any,{__mode="v"})

local function spring<T>(p:()->T,q:number?,r:number?):(()->T,SpringSettings__DARKLUA_TYPE_O<T>)
local s=e()


local t=2*math.pi/(q or 1)
local u=r or 1
local v=t^2
local w=2*t
local x=u*w



if x>j*2 then
error("spring damping too high, consider reducing damping or increasing period",0)
end

local y:SpringState__DARKLUA_TYPE_N<T> ={
k=v,
c=x,

x0_123=vector.zero,
x_123=vector.zero,
x1_123=vector.zero,
v_123=vector.zero,

x0_456=vector.zero,
x_456=vector.zero,
x1_456=vector.zero,
v_456=vector.zero,

source_value=false::any,
}

local z=d(false::any)

local function updater_effect()
local A=p()
y.x1_123,y.x1_456=l[typeof(A)](A)
y.source_value=A
o[y]=z
return A
end

local A=c(s,updater_effect,false::any)
g(A)


y.x_123,y.x_456=y.x1_123,y.x1_456


z.cache=y.source_value

local B=function(B)
local C=B.position
local D=B.velocity
local E=B.impulse

if C then
local F,G=l[typeof(C)](C)
y.x_123,y.x_456=F,G
y.x0_123,y.x0_456=F,G
end

if D then
y.v_123,y.v_456=l[typeof(D)](D)
end

if E then
local F,G=l[typeof(E)](E)
y.v_123+=F
y.v_456+=G
end


o[y]=z
end::SpringSettings__DARKLUA_TYPE_O<T>

return function(...)
if select("#",...)==0 then
i(z)
return z.cache
end


local C=...::T
y.x_123,y.x_456=l[typeof(C)](C)


y.v_123=vector.zero
y.v_456=vector.zero


o[y]=z


z.cache=C

return C
end,B
end


local function get_min_step(p:number):number
return p/k
end
local function get_min_vector_step(p:vector):vector
return vector.create(
get_min_step(p.x),
get_min_step(p.y),
get_min_step(p.z)
)
end

local function step_springs(p:number)
for q in o do
local r=q.k
local s=q.c
local t,u=q.x_123,q.x_456
local v,w=q.x1_123,q.x1_456
local x,y=q.v_123,q.v_456


local z=t-v
local A=u-w


local B=z*-r
local C=A*-r


local D=x*-s
local E=y*-s


local F=(B+D)
local G=(C+E)


local H=x+F*p
local I=y+G*p


local J=t+H*p
local K=u+I*p

q.x_123,q.x_456=J,K
q.v_123,q.v_456=H,I
end
end

local function update_spring_sources()
for p,q in o do
local r,s=p.x0_123,p.x0_456
local t,u=p.x_123,p.x_456
local v,w=p.x1_123,p.x1_456
local x,y=p.v_123,p.v_456

local z=vector.abs(get_min_vector_step(r-v))
local A=vector.abs(get_min_vector_step(s-w))

if

vector.max(vector.abs(t-v),z)==z
and vector.max(vector.abs(u-w),A)==A


and vector.max(vector.abs(x/10),z)==z
and vector.max(vector.abs(y/10),A)==A
then
o[p]=nil
q.cache=p.source_value
else
q.cache=m[typeof(p.source_value)](t,u)
end

h(q)
end
end

return function()
local p=0

return spring,function(q:number)
p+=q

while p>1/j do
p-=1/j
step_springs(1/j)
end

update_spring_sources()
end
end end function a.y():typeof(__modImpl())local b=a.cache.y if not b then b={c=__modImpl()}a.cache.y=b end return b.c end end do local function __modImpl()

local b=a.g()()
local c=a.o()

local function changed<T>(d:string,e:(T)->())
return b(function(g)
local h=g:GetPropertyChangedSignal(d):Connect(function()
e((g::any)[d])
end)

c(function()
h:Disconnect()
end)

e((g::any)[d])
end)
end

return changed end function a.z():typeof(__modImpl())local b=a.cache.z if not b then b={c=__modImpl()}a.cache.z=b end return b.c end end do local function __modImpl()

local b={major=0,minor=4,patch=1}

local c=a.c()a.d()

local d=a.i()
local e=a.k()
local g=a.h()
local h=a.l()
local i=a.m()
local j=a.n()
local k=a.o()
local l=a.p()
local m=a.q()
local n=a.r()
local o=a.s()
local p=a.u()
local q=a.v()
local r=a.w()
local s=a.x()
local t,u=a.y()()
local v=a.g()()
local w=a.z()local
x, y=a.t()()
local z=a.a()






local function step(A:number)
if game then debug.profilebegin"VIDE STEP"end

if game then debug.profilebegin"VIDE SPRING"end
u(A)
if game then debug.profileend()end

if game then debug.profilebegin"VIDE SCHEDULER"end
y(A)
if game then debug.profileend()end

if game then debug.profileend()end
end

local A=game and game:GetService"RunService".Heartbeat:Connect(function(A:number)
task.defer(step,A)
end)

local B={
version=b,


root=c,

mount=d,
create=e,
source=h,
effect=i,
derive=j,
switch=p,
show=q,
indexes=r,
values=s,


cleanup=k,
untrack=l,
read=m,
batch=n,
context=o,


spring=t,


action=v,
changed=w,


strict=(nil::any)::boolean,
defaults=(nil::any)::boolean,
defer_nested_properties=(nil::any)::boolean,


apply=function(B:Instance)
return function(C:{[any]:any})
g(B,C)
return B
end
end,


step=function(B:number)
if A then
A:Disconnect()
A=nil
end
step(B)
end
}

setmetatable(B::any,{
__index=function(C,D:unknown):()
if z[D]==nil then
error(`{tostring(D)} is not a valid member of vide`,0)
else
return z[D]
end
end,

__newindex=function(C,D:unknown,E:unknown)
if z[D]==nil then
error(`{tostring(D)} is not a valid member of vide, 0`)
else
z[D]=E
end
end
})

return B end function a.A():typeof(__modImpl())local b=a.cache.A if not b then b={c=__modImpl()}a.cache.A=b end return b.c end end end

local b=a.A()

export type source<T> =source__DARKLUA_TYPE_S<T>
export type Source<T> =Source__DARKLUA_TYPE_R<T>
export type context<T> =context__DARKLUA_TYPE_U<T>
export type Context<T> =Context__DARKLUA_TYPE_T<T>

return b