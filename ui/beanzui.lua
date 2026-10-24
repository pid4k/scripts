type SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_a<T> ={
cache:T,
[number]:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>
}

type Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T> ={
cache:T,
effect:((T)->T)|false,
cleanups:{()->()}|false,

context:{[number]:unknown}|false,

owned:{Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>}|false,
owner:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>|false,

parents:{SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_a<T>},
[number]:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>
}

type Node__DARKLUA_TYPE_c__DARKLUA_TYPE_c<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>

type Node__DARKLUA_TYPE_d__DARKLUA_TYPE_d<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>

type userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e={__USERDATA:true}

type ProxyMT__DARKLUA_TYPE_f__DARKLUA_TYPE_f={
proxy:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e,
data:Data__DARKLUA_TYPE_g__DARKLUA_TYPE_g,
__index:any,
__newindex:any
}

type Data__DARKLUA_TYPE_g__DARKLUA_TYPE_g={
name:string,
parent:Data__DARKLUA_TYPE_g__DARKLUA_TYPE_g?,
children:{Data__DARKLUA_TYPE_g__DARKLUA_TYPE_g},
changed:{[string]:RBXScriptSignal},
properties:{[string]:unknown},
destroying:RBXScriptSignal,
class:string,
type:"Instance"
}

type Node__DARKLUA_TYPE_h__DARKLUA_TYPE_h<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>

type Action__DARKLUA_TYPE_i__DARKLUA_TYPE_i={
priority:number,
callback:(Instance)->()
}

type Node__DARKLUA_TYPE_j__DARKLUA_TYPE_j<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>

type Array__DARKLUA_TYPE_k__DARKLUA_TYPE_k<V> ={V}

type ArrayOrV__DARKLUA_TYPE_l__DARKLUA_TYPE_l<V> ={ArrayOrV__DARKLUA_TYPE_l__DARKLUA_TYPE_l<V>}|V

type Map__DARKLUA_TYPE_m__DARKLUA_TYPE_m<K,V> ={[K]:V}

type Cache__DARKLUA_TYPE_n__DARKLUA_TYPE_n={

events:Array__DARKLUA_TYPE_k__DARKLUA_TYPE_k<
|string
|(()->())
>,


actions:Map__DARKLUA_TYPE_m__DARKLUA_TYPE_m<
number,
Array__DARKLUA_TYPE_k__DARKLUA_TYPE_k<(Instance)->()>
>,


parent:unknown,


nested_debug:Map__DARKLUA_TYPE_m__DARKLUA_TYPE_m<
number,
Map__DARKLUA_TYPE_m__DARKLUA_TYPE_m<string,true>
>,



nested_stack:{{}|number}
}

type Instances__DARKLUA_TYPE_o__DARKLUA_TYPE_o={
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

type function Properties__DARKLUA_TYPE_p__DARKLUA_TYPE_p(instance:type?)
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

type Create__DARKLUA_TYPE_q__DARKLUA_TYPE_q=<Name>(Name|keyof<Instances__DARKLUA_TYPE_o__DARKLUA_TYPE_o>|"")->(Properties__DARKLUA_TYPE_p__DARKLUA_TYPE_p<index<Instances__DARKLUA_TYPE_o__DARKLUA_TYPE_o,Name>>)->index<Instances__DARKLUA_TYPE_o__DARKLUA_TYPE_o,Name>

type Node__DARKLUA_TYPE_r__DARKLUA_TYPE_r<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>

type Source__DARKLUA_TYPE_s__DARKLUA_TYPE_s<T> =(()->T)&((value:T)->T)

type Destroyable__DARKLUA_TYPE_t__DARKLUA_TYPE_t={destroy:(any)->()}|{Destroy:(any)->()}

type Disconnectable__DARKLUA_TYPE_u__DARKLUA_TYPE_u={disconnect:(any)->()}|{Disconnect:(any)->()}

type Node__DARKLUA_TYPE_v__DARKLUA_TYPE_v<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>

type Node__DARKLUA_TYPE_w__DARKLUA_TYPE_w<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>

type Context__DARKLUA_TYPE_x__DARKLUA_TYPE_x<T> =(()->T)&(<U>(T,()->U)->U)

type Array__DARKLUA_TYPE_y__DARKLUA_TYPE_y<T> ={T}

type Map__DARKLUA_TYPE_z__DARKLUA_TYPE_z<K,V> ={[K]:V}

type Source__DARKLUA_TYPE_A__DARKLUA_TYPE_A<T> =()->T

type Component__DARKLUA_TYPE_B__DARKLUA_TYPE_B<T> =(Source__DARKLUA_TYPE_A__DARKLUA_TYPE_A<boolean>)->(T,...number)

type Array__DARKLUA_TYPE_C__DARKLUA_TYPE_C<T> ={T}

type Source__DARKLUA_TYPE_D__DARKLUA_TYPE_D<T> =()->T

type Array__DARKLUA_TYPE_E__DARKLUA_TYPE_E<T> ={T}

type Map__DARKLUA_TYPE_F__DARKLUA_TYPE_F<K,V> ={[K]:V}

type Source__DARKLUA_TYPE_G__DARKLUA_TYPE_G<T> =()->T

type Array__DARKLUA_TYPE_H__DARKLUA_TYPE_H<T> ={T}

type Map__DARKLUA_TYPE_I__DARKLUA_TYPE_I<K,V> ={[K]:V}

type Source__DARKLUA_TYPE_J__DARKLUA_TYPE_J<T> =()->T

type Node__DARKLUA_TYPE_K__DARKLUA_TYPE_K<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>

type SourceNode__DARKLUA_TYPE_L__DARKLUA_TYPE_L<T> =SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_a<T>

type Animatable__DARKLUA_TYPE_M__DARKLUA_TYPE_M=number|CFrame|Color3|UDim|UDim2|Vector2|Vector3

type SpringState__DARKLUA_TYPE_N__DARKLUA_TYPE_N<T> ={
k:number,
c:number,

x0_123:vector,x0_456:vector,
x_123:vector,x_456:vector,
x1_123:vector,x1_456:vector,
v_123:vector,v_456:vector,

source_value:T
}

type SpringSettings__DARKLUA_TYPE_O__DARKLUA_TYPE_O<T> =({
position:T?,
velocity:T?,
impulse:T?
})->()

type TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_P<T> =(T)->(vector,vector)

type Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_Q<T> =(vector,vector)->T

type Source__DARKLUA_TYPE_R__DARKLUA_TYPE_R<T> =Source__DARKLUA_TYPE_s__DARKLUA_TYPE_s<T>

type source__DARKLUA_TYPE_S__DARKLUA_TYPE_S<T> =Source__DARKLUA_TYPE_R__DARKLUA_TYPE_R<T>

type Context__DARKLUA_TYPE_T__DARKLUA_TYPE_T<T> =Context__DARKLUA_TYPE_x__DARKLUA_TYPE_x<T>

type context__DARKLUA_TYPE_U__DARKLUA_TYPE_U<T> =Context__DARKLUA_TYPE_T__DARKLUA_TYPE_T<T>
type source__DARKLUA_TYPE_V<T> =source__DARKLUA_TYPE_S__DARKLUA_TYPE_S<T>

type Source__DARKLUA_TYPE_W<T> =Source__DARKLUA_TYPE_R__DARKLUA_TYPE_R<T>

type context__DARKLUA_TYPE_X<T> =context__DARKLUA_TYPE_U__DARKLUA_TYPE_U<T>

type Context__DARKLUA_TYPE_Y<T> =Context__DARKLUA_TYPE_T__DARKLUA_TYPE_T<T>

type BannerType__DARKLUA_TYPE_Z="Warning"|"Info"|"Message"

type Theme__DARKLUA_TYPE__={
Name:string,
WindowBackground:Color3,
FrameBackground:Color3,
TopBarBackground:Color3,
SidebarBackground:Color3,
ElementBackground:Color3,
ElementHoverBackground:Color3,
ElementStroke:Color3,
DropdownItem:Color3,
DropdownItemHover:Color3,
AccentColor:Color3,
LineColor:Color3,
SeparatorColor:Color3,
TextPrimaryColor:Color3,
TextSecondaryColor:Color3,
TabButtonActive:Color3,
TabButtonInactive:Color3,
TabButtonBackground:Color3,
BoldFont:Font,
MainFont:Font,
}local a={cache={}::any}do do local function __modImpl()


















































































































































































































local b={cache={}::any}do do local function __modImpl()

local function inline_test():string
return debug.info(1,"n")
end

local c=inline_test()~="inline_test"

return{
strict=not c,
defaults=true,
defer_nested_properties=true,
batch=false,
}end function b.a():typeof(__modImpl())local c=b.cache.a if not c then c={c=__modImpl()}b.cache.a=c end return c.c end end do local function __modImpl()

local c=b.a()




















local d={n=0}::{[number]:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<any>,n:number}

local function efn(e:string)
local g=debug.traceback(e,2)

if string.find(e,"^effect error stacktrace")then
g=string.gsub("    "..g,"\n",function()
return"\n    "
end)
end

g..="\nsource update stacktrace:"
return g
end

local function ycall<T,U>(e:(T)->U,g:T):(boolean,string|U)

local h=coroutine.create(xpcall)

local i,j,k=coroutine.resume(h,e,efn,g)

assert(i)

if coroutine.status(h)~="dead"then
return false,debug.traceback(h,"attempt to yield in reactive scope")
end

return j,k
end

local function get_scope():Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<unknown>?
return d[d.n]
end

local function assert_stable_scope():Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<unknown>
local e=get_scope()

if not e then
local g=debug.info(2,"n")
return error(`cannot use {g}() outside a stable or reactive scope`,0)
elseif e.effect then
error("cannot create a new reactive scope inside another reactive scope",0)
end

return e
end

local function push_child<T>(e:SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_a<any>,g:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<any>)
table.insert(e,g)
table.insert(g.parents,e)
end

local function push_scope<T>(e:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>)
local g=d.n+1
d.n=g
d[g]=e
end

local function pop_scope()
local e=d.n
d.n=e-1
d[e]=nil
end

local function push_cleanup<T>(e:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>,g:()->())
if e.cleanups then
table.insert(e.cleanups,g)
else
e.cleanups={g}
end
end

local function flush_cleanups<T>(e:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>)
if e.cleanups then
for g,h in e.cleanups do
local i,j:string?=xpcall(h,debug.traceback)
if not i then error(`cleanup error: {j}`,0)end
end

table.clear(e.cleanups)
end
end

local function find_and_swap_pop<T>(e:{T},g:T)
local h=table.find(e,g)::number
local i=#e
e[h]=e[i]
e[i]=nil
end

local function unparent<T>(e:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>)
local g=e.parents

for h,i in g do
find_and_swap_pop(i,e)
g[h]=nil
end
end

local function destroy<T>(e:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>)
if c.strict and table.find(d,e)then
error("attempt to destroy an active scope",0)
end

flush_cleanups(e)
unparent(e)

if e.owner then
find_and_swap_pop(e.owner.owned::{Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>},e)
e.owner=false
end

if e.owned then
local g=e.owned
while g[1]do destroy(g[1])end
end
end

local function destroy_owned<T>(e:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>)
if e.owned then
local g=e.owned
while g[1]do destroy(g[1])end
end
end

local e={n=0}::{n:number,[number]:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<any>}

local function evaluate_node<T>(g:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>)
if c.strict then
if table.find(d,g)then
error("a scope, that should rerun due to the update of a source, is already active",0)
end

local h=g.cache

for i=1,2 do
local j=g.cache

flush_cleanups(g)
destroy_owned(g)

push_scope(g)
local k,l=ycall(g.effect::(T)->T,j)
pop_scope()

if not k then
table.clear(e)
e.n=0
error(`effect error stacktrace\n{l::string}`,0)
end

g.cache=l::T
end

return h~=g.cache
else
local h=g.cache

flush_cleanups(g)
destroy_owned(g)

push_scope(g)
local i,j=pcall(g.effect::(T)->T,g.cache)
pop_scope()

if not i then
table.clear(e)
e.n=0
error(`effect error:\n{j}\n`,0)
end

g.cache=j
return h~=j
end
end

local function queue_children_for_update<T>(g:SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_a<T>)
local h=e.n
while g[1]do
h+=1
e[h]=g[1]
unparent(g[1])
end
e.n=h
end

local function get_update_queue_length()
return e.n
end

local function flush_update_queue(g:number)
local h=g+1
while h<=e.n do
local i=e[h]


if i.owner and evaluate_node(i)then
queue_children_for_update(i)
end

e[h]=false::any
h+=1
end

e.n=g
end

local function update_descendants<T>(g:SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_a<T>)
local h=e.n
queue_children_for_update(g)

if c.batch then return end

local i=h+1
while i<=e.n do
local j=e[i]



if j.owner and evaluate_node(j)then
queue_children_for_update(j)
end

e[i]=false::any
i+=1
end

e.n=h
end

local function push_scope_as_child_of<T>(g:SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_a<T>)
local h=get_scope()
if h and h.effect then
push_child(g,h)
end
end

local function create_node<T>(g:false|Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<any>,h:false|((T)->T),i:T):Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>
local j:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T> ={
cache=i,
effect=h,
cleanups=false,

context=false,

owner=g,
owned=false,

parents={},
}

if g then
if g.owned then
table.insert(g.owned,j)
else
g.owned={j}
end
end

return j
end

local function create_source_node<T>(g:T):SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_a<T>
return{cache=g}
end

local function get_children<T>(g:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>):{Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<unknown>}
return{unpack(g)}::{Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<any>}
end

local function set_context<T>(g:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_b<T>,h:number,i:unknown)
if g.context then
g.context[h]=i
else
g.context={[h]=i}
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
scopes=d,

q=e
}end function b.b():typeof(__modImpl())local c=b.cache.b if not c then c={c=__modImpl()}b.cache.b=c end return c.c end end do local function __modImpl()

local c=b.b()

local d=c.create_node
local e=c.push_scope
local g=c.pop_scope
local h=c.destroy

local i={}

local function root<T...>(j:(destroy:()->())->T...):(()->(),T...)
local k=d(false,false,false)

i[k]=true

local l=function()
if not i[k]then error"root already destroyed"end
i[k]=nil
h(k)
end

e(k)

local m={xpcall(j,debug.traceback,l)}

g()

if not m[1]then
l()
error(`error while running root():\n\n{m[2]}`,0)
end

return l,unpack(m::any,2)
end

return root::<T...>(fn:(destroy:()->())->T...)->(()->(),T...)end function b.c():typeof(__modImpl())local c=b.cache.c if not c then c={c=__modImpl()}b.cache.c=c end return c.c end end do local function __modImpl()

local c=b.b()

local d=c.create_node
local e=c.push_scope
local g=c.pop_scope
local h=c.destroy
local i=c.get_scope

local function branch<T>(j:()->T):(()->(),T)
local k=i()
if not k then
error(`cannot use branch() outside a stable or reactive scope`,0)
end

local l=k.owner
if not l then
error(`current scope is not owned by a scope`,0)
end

local m=d(l,false,false)

local n=function()
h(m)
end

e(m)

local o,p=xpcall(j,debug.traceback)

g()

if not o then
n()
error(`error while running branch():\n\n{p}`,0)
end

return n,p
end

return branch end function b.d():typeof(__modImpl())local c=b.cache.d if not c then c={c=__modImpl()}b.cache.d=c end return c.c end end do local function __modImpl()







local c={}::any do
c.__index=c
c.__type="RBXScriptSignal"

local function new_connection(d,e)
return{
signal=d,
fn=e,

Disconnect=function(g)
local h=table.find(d.connections,g)
if not h then return end
table.remove(d.connections,h)
end
}
end

function c.new()
return setmetatable({
connections={}
},c)
end

function c.Connect(d,e)
local g=new_connection(d,e)
table.insert(d.connections,g)
return g
end

function c.fire(d,...)
for e=#d.connections,1,-1 do
d.connections[e].fn(...)
end
end
end

local d={}::any do






























local function deep_clone<T>(e:T&{}):T
local g=table.clone(e::{})::{}

for h,i in next,g do
if type(i)=="table"then
g[h]=deep_clone(i)
end
end

return g::T&{}
end

local e={}::{[Data__DARKLUA_TYPE_g__DARKLUA_TYPE_g]:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e?}
setmetatable(e::any,{__mode="v"})


local g,h

local function get_data(i:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e):Data__DARKLUA_TYPE_g__DARKLUA_TYPE_g
local function f(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e):ProxyMT__DARKLUA_TYPE_f__DARKLUA_TYPE_f
return getmetatable(j::any)
end

return f(i).data
end

local function get_proxy(i:Data__DARKLUA_TYPE_g__DARKLUA_TYPE_g):userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e
return e[i]or(function()
local j=newproxy(true)
local k=getmetatable(j)
k.proxy=j
k.data=i
k.__index=g
k.__newindex=h
e[i]=j
return j
end)()
end

local function is_instance(i:unknown):boolean
local j=getmetatable(i::any)
return j and j.data and j.data.type=="Instance"
end

local i={}

g=function(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e,k:string):()
local l=get_data(j)
return if i[k]then i[k]
elseif k=="Name"then l.name
elseif k=="Parent"then(l.parent and get_proxy(l.parent))
elseif k=="Destroying"then l.destroying
else l.properties[k]
end

h=function(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e,k:string,l:unknown)
local m=get_data(j)
if k=="Name"then
if type(l)~="string"then error("name must be a string",2)end
m.name=l::string
elseif k=="Parent"then
assert(l==nil or is_instance(l),"attempt to set non-instance as parent")
local n=m.parent
if n then
m.parent=nil
table.remove(n.children,table.find(n.children,m))
end
if l then
m.parent=get_data(l::userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e)
table.insert(get_data(l::userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e).children,m)
end
else
m.properties[k]=l
end

if m.changed[k]then
c.fire(m.changed[k])
end
end

function d.new(j:string):Instance
local k={
name="UNNAMED",
parent=nil,
children={},
changed={},
properties={},
class=j,
destroying=c.new()::any,
type="Instance"::"Instance"
}

return get_proxy(k)::any
end

function d.is_instance(j:unknown):boolean
return is_instance(j)
end

function i.Clone(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e):userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e
local k=get_data(j)
local l=(d.new""::any)::userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e
local m=get_data(l)

for n,o in next,deep_clone(k)do
m[n]=o
end

return l
end

function i.FindFirstChild(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e,k:string):userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e?
local l=get_data(j)
for m,n in l.children do
if n.name==k then
return get_proxy(n)
end
end
return nil
end

function i.GetChildren(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e):{userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e}
local k=get_data(j).children
local l=table.create(#k)

for m,n in next,k do
l[m]=get_proxy(n)
end

return l
end

function i.GetPropertyChangedSignal(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e,k:string):RBXScriptSignal
local l=get_data(j)
if not l.changed[k]then
l.changed[k]=c.new()::any
end
return l.changed[k]
end

function i.Destroy(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_e)
local k=get_data(j);
c.fire(k.destroying)
k.parent=nil
if k.changed.Parent then
c.fire(k.changed.Parent)
end
end
end

local function table_to_proxy(e:any)
local g=newproxy(true)
local h=getmetatable(g)

for i,j in getmetatable(e)do
h[i]=j
end

function h.__index(i,j)
return e[j]
end

function h.__newindex(i,j,k)
e[j]=k
end

return g
end

local e={__type="Color3"}::any do
function e.new(g,h,i)
return table_to_proxy(setmetatable({r=g,g=h,b=i},e))
end

function e.__eq(g,h)
return g.r==h.r and g.g==h.g and g.b==h.b
end
end

local g={__type="Vector2"}::any do
function g.new(h,i)
return table_to_proxy(setmetatable({x=h,y=i},g))
end

function g.__eq(h,i)
return h.x==i.x and h.y==i.y
end
end

local h={__type="UDim2"}::any do
function h.new(i,j,k,l)
return table_to_proxy(setmetatable({x={scale=i,offset=j},y={scale=k,offset=l}},h))
end

function h.fromScale(i,j)
return table_to_proxy(setmetatable({x={scale=i,offset=0},y={scale=j,offset=0}},h))
end

function h.__eq(i,j)
return i.x.scale==j.x.scale and
j.x.offset==j.x.offset and
i.y.scale==j.y.scale and
i.y.offset==j.y.offset
end
end

local i={}::any do
setmetatable(i,{__index=function(j,k)
local l=setmetatable({},{__index=function(l,m)
l[m]=true
return true
end})
j[k]=l
return l
end})
end

local j=function(j)
return if d.is_instance(j)then"Instance"
elseif getmetatable(j)and getmetatable(j).__type then getmetatable(j).__type
else type(j)
end::any

return{
Signal=c,
Instance=d::typeof(d),
Color3=e::typeof(e),
Vector2=g::typeof(g),
UDim2=h::typeof(h),
Enum=i::typeof(i),
typeof=j::typeof(j)
}end function b.e():typeof(__modImpl())local c=b.cache.e if not c then c={c=__modImpl()}b.cache.e=c end return c.c end end do local function __modImpl()

local c=b.b()

local d=c.create_node
local e=c.assert_stable_scope
local g=c.get_scope
local h=c.evaluate_node
local i=c.push_cleanup

local function update_property_effect(j:{
instance:Instance,
property:string,
source:()->unknown
})
(j.instance::any)[j.property]=j.source()
return j
end

local function update_parent_effect(j:{
instance:Instance,
source:()->Instance
})
j.instance.Parent=j.source()
return j
end


local function update_children_effect(j:{
instance:Instance,
cur_children_set:{[Instance]:true},
new_children_set:{[Instance]:true},
source:()->Instance|{Instance}
})
local k:{[Instance]:true}=j.cur_children_set
local l:{[Instance]:true}=j.new_children_set

local m=j.source()

local function process_child(n:Instance|{Instance})
if type(n)=="userdata"then
if l[n]then return end

l[n]=true

if not k[n]then
n.Parent=j.instance
else
k[n]=nil
end
elseif type(n)=="table"then
for o,p in n do
process_child(p)
end
elseif type(n)=="function"then
local o=d(assert(g()),update_children_effect,{
instance=j.instance,
cur_children_set={},
new_children_set={},
source=n
})

h(o)

i(assert(g()),function()
for p in o.cache.cur_children_set do
p.Parent=nil
end
end)
end
end

process_child(m)

for n in k do
n.Parent=nil
end

table.clear(k)
j.cur_children_set,j.new_children_set=l,k

return j
end

return{
property=function(j,k,l)
local m=d(e(),update_property_effect,{
instance=j,
property=k,
source=l
})

h(m)

return m
end,

parent=function(j,k)
local l=d(e(),update_parent_effect,{
instance=j,
source=k
})

h(l)

return l
end,

children=function(j,k)
local l=d(e(),update_children_effect,{
instance=j,
cur_children_set={},
new_children_set={},
source=k
})

h(l)

i(e(),function()
for m in l.cache.cur_children_set do
m.Parent=nil
end
end)

return l
end
}end function b.f():typeof(__modImpl())local c=b.cache.f if not c then c={c=__modImpl()}b.cache.f=c end return c.c end end do local function __modImpl()






local c=table.freeze{}

local function is_action(d:any)
return getmetatable(d)==c
end

local function action(d:(Instance)->(),e:number?):Action__DARKLUA_TYPE_i__DARKLUA_TYPE_i
local g={
priority=e or 1,
callback=d
}

setmetatable(g::any,c)

return table.freeze(g)
end

return function()
return action,is_action
end end function b.g():typeof(__modImpl())local c=b.cache.g if not c then c={c=__modImpl()}b.cache.g=c end return c.c end end do local function __modImpl()

local c=game and typeof or b.e().typeof::never

local d=b.a()
local e=b.f()local
g, h=b.g()()b.b()


































local i:Cache__DARKLUA_TYPE_n__DARKLUA_TYPE_n?

local function borrow_cache():Cache__DARKLUA_TYPE_n__DARKLUA_TYPE_n
if i then
local j=i
i=nil
return j
else
return{
events={},
actions=setmetatable({}::any,{
__index=function(j,k)j[k]={};return j[k]end
}),
parent=nil,
nested_debug=setmetatable({}::any,{
__index=function(j,k:number)j[k]={};return j[k]end
}),
nested_stack={}
}
end
end

local function return_cache(j:Cache__DARKLUA_TYPE_n__DARKLUA_TYPE_n)
i=j
end

local function process_properties(j:Map__DARKLUA_TYPE_m__DARKLUA_TYPE_m<unknown,unknown>,k:Instance,l:Cache__DARKLUA_TYPE_n__DARKLUA_TYPE_n,m:number)
for n,o in j do
if type(n)=="string"then
if d.strict then
if l.nested_debug[m][n]then
error(`duplicate property {n} at depth {m}`,0)
end
l.nested_debug[m][n]=true
end

if n=="Parent"then
l.parent=o
continue
end

if type(o)=="function"then
if c((k::any)[n])=="RBXScriptSignal"then
table.insert(l.events,n)
table.insert(l.events,o::()->())
else
e.property(k,n,o::()->())
end
else
(k::any)[n]=o
end
elseif type(n)=="number"then
if type(o)=="function"then
e.children(k,o::()->ArrayOrV__DARKLUA_TYPE_l__DARKLUA_TYPE_l<Instance>)
elseif type(o)=="table"then
if h(o)then
table.insert(l.actions[(o::any).priority],(o::any).callback::()->())
elseif d.defer_nested_properties then
table.insert(l.nested_stack,o::{})
table.insert(l.nested_stack,m+1)
else
process_properties(o::Map__DARKLUA_TYPE_m__DARKLUA_TYPE_m<unknown,unknown>,k,l,m+1)
end
elseif type(o)=="userdata"then
(o::Instance).Parent=k
end
end
end
end


local function apply<T>(j:T&Instance,k:{[unknown]:unknown}):T
if not k then
error"attempt to call a constructor returned by create() with no properties"
end

local l=borrow_cache()
local m=l.events
local n=l.actions
local o=l.nested_debug
local p=l.nested_stack


local q=1
repeat
process_properties(k,j,l,q)
q=table.remove(p)::number
k=table.remove(p)::{}
until not k

for r=1,#m,2 do
local s=m[r]
local t=m[r+1]
;(j::any)[s]:Connect(t)
end

for r,s in n do
for t,u in s do
u(j)
end
end

local r=l.parent
if r then
if type(r)=="function"then
e.parent(j,r::()->Instance)
else
j.Parent=r::Instance
end
end

table.clear(m)
for s,t in n do table.clear(t)end
l.parent=nil
if d.strict then table.clear(o)end
table.clear(p)

return_cache(l)

return j
end

return apply end function b.h():typeof(__modImpl())local c=b.cache.h if not c then c={c=__modImpl()}b.cache.h=c end return c.c end end do local function __modImpl()

local c=b.c()
local d=b.h()

local function mount<T>(e:()->T,g:Instance?):()->()
return c(function()
local h=e()
if g then d(g,{h})end
end)
end

return mount::(<T>(component:()->T,target:Instance)->()->())&((component:()->())->()->())end function b.i():typeof(__modImpl())local c=b.cache.i if not c then c={c=__modImpl()}b.cache.i=c end return c.c end end do local function __modImpl()

local c=game and Enum or b.e().Enum::never
local d=game and Color3 or b.e().Color3::never

return{
Part={
Material=c.Material.SmoothPlastic,
Size=vector.create(1,1,1),
Anchored=true
},

BillboardGui={
ResetOnSpawn=false,
ZIndexBehavior=c.ZIndexBehavior.Sibling
},

CanvasGroup=nil,

Frame={
BackgroundColor3=d.new(1,1,1),
BorderColor3=d.new(0,0,0),
BorderSizePixel=0
},

ImageButton={
BackgroundColor3=d.new(1,1,1),
BorderColor3=d.new(0,0,0),
BorderSizePixel=0,
AutoButtonColor=false
},

ImageLabel={
BackgroundColor3=d.new(1,1,1),
BorderColor3=d.new(0,0,0),
BorderSizePixel=0,
},

ScreenGui={
ResetOnSpawn=false,
ZIndexBehavior=c.ZIndexBehavior.Sibling
},

ScrollingFrame={
BackgroundColor3=d.new(1,1,1),
BorderColor3=d.new(0,0,0),
BorderSizePixel=0,
ScrollBarImageColor3=d.new(0,0,0)
},

SurfaceGui={
ResetOnSpawn=false,
ZIndexBehavior=c.ZIndexBehavior.Sibling,

PixelsPerStud=50,
SizingMode=c.SurfaceGuiSizingMode.PixelsPerStud
},

TextBox={
BackgroundColor3=d.new(1,1,1),
BorderColor3=d.new(0,0,0),
BorderSizePixel=0,
ClearTextOnFocus=false,
Font=c.Font.SourceSans,
Text="",
TextColor3=d.new(0,0,0)
},

TextButton={
BackgroundColor3=d.new(1,1,1),
BorderColor3=d.new(0,0,0),
BorderSizePixel=0,
AutoButtonColor=false,
Font=c.Font.SourceSans,
Text="",
TextColor3=d.new(0,0,0)
},

TextLabel={
BackgroundColor3=d.new(1,1,1),
BorderColor3=d.new(0,0,0),
BorderSizePixel=0,
Font=c.Font.SourceSans,
Text="",
TextColor3=d.new(0,0,0)
},

UIListLayout={
SortOrder=c.SortOrder.LayoutOrder
},

UIGridLayout={
SortOrder=c.SortOrder.LayoutOrder
},

UITableLayout={
SortOrder=c.SortOrder.LayoutOrder
},

UIPageLayout={
SortOrder=c.SortOrder.LayoutOrder
},

VideoFrame={
BackgroundColor3=d.new(1,1,1),
BorderColor3=d.new(0,0,0),
BorderSizePixel=0
},

ViewportFrame={
BackgroundColor3=d.new(1,1,1),
BorderColor3=d.new(0,0,0),
BorderSizePixel=0
}
}::{[string]:{[string]:unknown}}end function b.j():typeof(__modImpl())local c=b.cache.j if not c then c={c=__modImpl()}b.cache.j=c end return c.c end end do local function __modImpl()

local c=game and typeof or b.e().typeof::never
local d=game and Instance or b.e().Instance::never

local e=b.j()
local g=b.h()
local h=b.a()

local function create_constructor_for_class(i:string):({[unknown]:unknown})->Instance
local function constructor(j:{[unknown]:unknown}):Instance
local k,l:Instance=pcall(d.new,i::any)
if not k then error(`invalid class name {i}`,0)end

if h.defaults then
local m:{[string]:unknown}?=e[i]
if m then
for n,o in m do
(l::any)[n]=o
end
end
end

return g(l,j)
end

return constructor
end

local i={}::{[string]:({[unknown]:unknown})->Instance}


local function create(j:string|Instance,k:{[unknown]:unknown}?):unknown
if type(j)~="string"and c(j)~="Instance"then
error("bad argument #1, expected string or instance, got "..c(j),0)
end

local l:({[unknown]:unknown})->Instance
if type(j)=="string"then
l=i[j]
if not l then
l=create_constructor_for_class(j)
i[j]=l
end
else
l=function(m)
local n=assert(j:Clone(),"attempt to clone a non-archivable instance")
return g(n,m)
end
end

return if k
then l(k)
else l
end





















































return create::Create__DARKLUA_TYPE_q__DARKLUA_TYPE_q end function b.k():typeof(__modImpl())local c=b.cache.k if not c then c={c=__modImpl()}b.cache.k=c end return c.c end end do local function __modImpl()

local c=b.b()

local d=c.create_source_node
local e=c.push_scope_as_child_of
local g=c.update_descendants



local function source<T>(h:T):Source__DARKLUA_TYPE_s__DARKLUA_TYPE_s<T>
local i=d(h)

local function update_source(...):T
if select("#",...)==0 then
e(i)
return i.cache
end

local j=...::T
if i.cache==j and(type(j)~="table"or table.isfrozen(j))then
return j
end

i.cache=j
g(i)
return j
end

return update_source
end

return source::(<T>(initial_value:T)->Source__DARKLUA_TYPE_s__DARKLUA_TYPE_s<T>)&(<T>()->Source__DARKLUA_TYPE_s__DARKLUA_TYPE_s<T>)end function b.l():typeof(__modImpl())local c=b.cache.l if not c then c={c=__modImpl()}b.cache.l=c end return c.c end end do local function __modImpl()

local c=b.b()
local d=c.create_node
local e=c.assert_stable_scope
local g=c.evaluate_node

local function effect<T>(h:(T)->T,i:T)
local j=d(e(),h,i)

g(j)
end

return effect::(<T>(callback:(T)->T,initial_value:T)->())&((callback:()->())->())end function b.m():typeof(__modImpl())local c=b.cache.m if not c then c={c=__modImpl()}b.cache.m=c end return c.c end end do local function __modImpl()

local c=b.b()
local d=c.create_node
local e=c.push_scope_as_child_of
local g=c.assert_stable_scope
local h=c.evaluate_node

local function derive<T>(i:()->T):()->T
local j=d(g(),i,false::any)

h(j)

return function()
e(j)
return j.cache
end
end

return derive end function b.n():typeof(__modImpl())local c=b.cache.n if not c then c={c=__modImpl()}b.cache.n=c end return c.c end end do local function __modImpl()

local c=game and typeof or b.e().typeof::never

local d=b.b()
local e=d.get_scope
local g=d.push_cleanup

local function helper(h:any)
return
if c(h)=="RBXScriptConnection"then function()h:Disconnect()end
elseif type(h)=="thread"then function()task.cancel(h)end
elseif c(h)=="Instance"then function()h:Destroy()end
elseif h.destroy then function()h:destroy()end
elseif h.disconnect then function()h:disconnect()end
elseif h.Destroy then function()h:Destroy()end
elseif h.Disconnect then function()h:Disconnect()end
else error"cannot cleanup given object"
end

local function cleanup(h:unknown)
local i=e()

if not i then
error"cannot cleanup outside a stable or reactive scope"
end;assert(i)

if type(h)=="function"then
g(i,h::()->())
else
g(i,helper(h))
end
end




return cleanup::
((callback:()->())->())&
((thread:thread)->())&
((instance:Destroyable__DARKLUA_TYPE_t__DARKLUA_TYPE_t)->())&
((connection:Disconnectable__DARKLUA_TYPE_u__DARKLUA_TYPE_u)->())&
((instance:Instance)->())&
((connection:RBXScriptConnection)->())end function b.o():typeof(__modImpl())local c=b.cache.o if not c then c={c=__modImpl()}b.cache.o=c end return c.c end end do local function __modImpl()


local c=b.b()

local d=c.get_scope

local function untrack<T>(e:()->T):T
local g=d()

if g then

local h=g.effect
g.effect=false

local i,j=xpcall(e,debug.traceback)

g.effect=h::()->()

if not i then error(j,0)end

return j::T
else
return e()
end
end

return untrack::(<T>(fn:()->T)->T)&((fn:()->())->())end function b.p():typeof(__modImpl())local c=b.cache.p if not c then c={c=__modImpl()}b.cache.p=c end return c.c end end do local function __modImpl()

local function read<T>(c:T|(()->T)):T
return if type(c)=="function"then c()else c
end

return read end function b.q():typeof(__modImpl())local c=b.cache.q if not c then c={c=__modImpl()}b.cache.q=c end return c.c end end do local function __modImpl()

local c=b.a()
local d=b.b()

local function batch(e:()->())
local g=c.batch
local h

if not g then
c.batch=true
h=d.get_update_queue_length()
end

local i,j:string?=xpcall(e,debug.traceback)

if not g then
c.batch=false
d.flush_update_queue(h)
end

if not i then error(`error occured while batching updates: {j}`,0)end
end

return batch end function b.r():typeof(__modImpl())local c=b.cache.r if not c then c={c=__modImpl()}b.cache.r=c end return c.c end end do local function __modImpl()

local c=b.b()

local d=c.create_node
local e=c.get_scope
local g=c.push_scope
local h=c.pop_scope
local i=c.set_context



local j=newproxy()
local k=0

local function context<T>(...:T):Context__DARKLUA_TYPE_x__DARKLUA_TYPE_x<T>
k+=1
local l=k

local m=select("#",...)>0
local n=...

return function<T>(...):any
local o:(Node__DARKLUA_TYPE_w__DARKLUA_TYPE_w<unknown>?)|false=e()

if select("#",...)==0 then
while o do
local p=o.context

if not p then
o=o.owner
continue
end

local q=(p::{unknown})[l]

if q==nil then
o=o.owner
continue
end

return(if q~=j then q else nil)::T
end

if m~=nil then
return n
else
error("attempt to get context when no context is set and no default context is set",0)
end
else
if not o then return error("attempt to set context outside of a vide scope",0)end

local p,q=...

local r=d(o,false,false)
i(r,l,if p==nil then j else p)

g(r)

local function efn(s:string)return debug.traceback(s,3)end
local s,t=xpcall(q,efn)

h()

if not s then
error(`error while running context:\n\n{t}`,0)
end

return t
end

return nil::any
end
end

return context end function b.s():typeof(__modImpl())local c=b.cache.s if not c then c={c=__modImpl()}b.cache.s=c end return c.c end end do local function __modImpl()

local c={}::{
{t:number,fn:()->(),cancel:boolean}
}

local function timeout(d:number,e:()->())
local g={t=d,fn=e,cancel=false}
table.insert(c,g)
return g
end

local function update_timeouts(d:number)
for e=#c,1,-1 do
local g=c[e]
g.t-=d

if g.cancel or g.t<=0 then
c[e]=c[#c]
c[#c]=nil

if not g.cancel then
g.fn()
end
end
end
end

return function()return timeout,update_timeouts end end function b.t():typeof(__modImpl())local c=b.cache.t if not c then c={c=__modImpl()}b.cache.t=c end return c.c end end do local function __modImpl()

local c=b.d()
local d=b.l()
local e=b.m()
local g=b.t()()






local function switch_map<K,Obj>(
h:Source__DARKLUA_TYPE_A__DARKLUA_TYPE_A<K>,
i:Map__DARKLUA_TYPE_z__DARKLUA_TYPE_z<K,Component__DARKLUA_TYPE_B__DARKLUA_TYPE_B<Obj>>
):Source__DARKLUA_TYPE_A__DARKLUA_TYPE_A<nil|Obj|Array__DARKLUA_TYPE_y__DARKLUA_TYPE_y<Obj>>
local j={}::Map__DARKLUA_TYPE_z__DARKLUA_TYPE_z<K,{
destroy:()->(),
object:Obj,
delay:number,
present:(boolean?)->boolean,
timeout:{cancel:boolean}?
}>

local k=d(nil::nil|Obj|Array__DARKLUA_TYPE_y__DARKLUA_TYPE_y<Obj>)
local function update_output()
local l={}

for m,n in j do
table.insert(l,n.object)
end

k(
if l[2]then l
elseif l[1]then l[1]
else nil
)
end

e(function()
local l:K?=h()


for m,n in j do
if m==l then continue end

n.present(false)

if n.delay==0 then
n.destroy()
j[m]=nil
else
if n.timeout==nil then
n.timeout=g(n.delay,function()
n.destroy()
j[m]=nil
update_output()
end)
end
end
end


if l~=nil then
local m=j[l]

if m then
m.present(true)

if m.timeout then
m.timeout.cancel=true
m.timeout=nil
end
else
local n=i[l]

if n~=nil then
if type(n)~="function"then
error("map must map a value to a function",0)
end

local o=d(false)

local p=nil::number?
local q,r=c(function()
local q,r=n(o)
p=r
return q
end)

o(true)

j[l]={
destroy=q,
object=r,
delay=p or 0,
present=o,
timeout=nil
}
end
end
end

update_output()
end)

return k
end

local function switch<K,Obj>(h:Source__DARKLUA_TYPE_A__DARKLUA_TYPE_A<K>):(map:Map__DARKLUA_TYPE_z__DARKLUA_TYPE_z<K,Component__DARKLUA_TYPE_B__DARKLUA_TYPE_B<Obj>>)->Source__DARKLUA_TYPE_A__DARKLUA_TYPE_A<nil|Obj|Array__DARKLUA_TYPE_y__DARKLUA_TYPE_y<Obj>>
return function(i)
return switch_map(h,i)
end
end

return switch end function b.u():typeof(__modImpl())local c=b.cache.u if not c then c={c=__modImpl()}b.cache.u=c end return c.c end end do local function __modImpl()

local c=b.l()
local d=b.n()
local e=b.m()b.p()

local g=b.u()




local function show<T,Obj>(
h:Source__DARKLUA_TYPE_D__DARKLUA_TYPE_D<T?>,
i:(Source__DARKLUA_TYPE_D__DARKLUA_TYPE_D<T>,Source__DARKLUA_TYPE_D__DARKLUA_TYPE_D<boolean>)->(Obj,...number),
j:((Source__DARKLUA_TYPE_D__DARKLUA_TYPE_D<boolean>)->(Obj,...number))?
):Source__DARKLUA_TYPE_D__DARKLUA_TYPE_D<nil|Obj|Array__DARKLUA_TYPE_C__DARKLUA_TYPE_C<Obj>>
local k=c()

e(function()
local l=h()
if l then
k(l)
end
end)

local l=d(function()
return not not h()
end)

return g(l){
[true]=function(m)
return i(k,m)
end,
[false]=j
}
end

return show end function b.v():typeof(__modImpl())local c=b.cache.v if not c then c={c=__modImpl()}b.cache.v=c end return c.c end end do local function __modImpl()b.a()


local c=b.d()
local d=b.l()
local e=b.m()
local g=b.t()()





local function indexes<K,V,Obj>(
h:Source__DARKLUA_TYPE_G__DARKLUA_TYPE_G<Map__DARKLUA_TYPE_F__DARKLUA_TYPE_F<K,V>>,
i:(Source__DARKLUA_TYPE_G__DARKLUA_TYPE_G<V>,K,Source__DARKLUA_TYPE_G__DARKLUA_TYPE_G<boolean>)->(Obj,...number)
):Source__DARKLUA_TYPE_G__DARKLUA_TYPE_G<Array__DARKLUA_TYPE_E__DARKLUA_TYPE_E<Obj>>
local j=0
local k={}::Map__DARKLUA_TYPE_F__DARKLUA_TYPE_F<K,{
destroy:()->(),
object:Obj,
value:V?,
value_source:(V?)->V,
count:number,
delay:number,
present:(boolean?)->boolean,
timeout:{cancel:boolean}?,
}>

local l=d({}::Array__DARKLUA_TYPE_E__DARKLUA_TYPE_E<Obj>)
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


for p,q in m do
local r=k[p]

if r==nil then
local s=d(q)
local t=d(false)

local u=nil::number?
local v,w=c(function()
local v,w=i(s,p,t)
u=w
return v
end)

t(true)

o=true

k[p]={
destroy=v,
object=w,
value=q,
value_source=s,
count=n,
delay=u or 0,
present=t,
timeout=nil,
}
else
r.count=n

if r.value~=q then
if r.timeout then
r.timeout.cancel=true
r.timeout=nil
r.present(true)
end

r.value=q
r.value_source(q)
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
q.value=nil
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

return indexes end function b.w():typeof(__modImpl())local c=b.cache.w if not c then c={c=__modImpl()}b.cache.w=c end return c.c end end do local function __modImpl()

local c=b.a()
local d=b.d()
local e=b.l()
local g=b.m()
local h=b.t()()





local function values<K,V,Obj>(
i:Source__DARKLUA_TYPE_J__DARKLUA_TYPE_J<Map__DARKLUA_TYPE_I__DARKLUA_TYPE_I<K,V>>,
j:(V,Source__DARKLUA_TYPE_J__DARKLUA_TYPE_J<K>,Source__DARKLUA_TYPE_J__DARKLUA_TYPE_J<boolean>)->(Obj,...number)
):Source__DARKLUA_TYPE_J__DARKLUA_TYPE_J<Array__DARKLUA_TYPE_H__DARKLUA_TYPE_H<Obj>>
local k=0
local l={}::Map__DARKLUA_TYPE_I__DARKLUA_TYPE_I<V,{
destroy:()->(),
object:Obj,
index:K?,
index_source:(K?)->K,
count:number,
delay:number,
present:(boolean?)->boolean,
timeout:{cancel:boolean}?,
}>

local m=e({}::Array__DARKLUA_TYPE_H__DARKLUA_TYPE_H<Obj>)
local function update_output()
local n=table.create(4)

for o,p in l do
table.insert(n,p.object)
end

m(n)
end

g(function()
local n=i()

local o=k
k+=1

local p=false

if c.strict then
local q={}
for r,s in n do
if q[s]then
error("table source passed to `values()` contains duplicate values",0)
end
q[s]=true
end
end


for q,r in n do
local s=l[r]

if s==nil then
local t=e(q)
local u=e(false)

local v=nil::number?
local w,x=d(function()
local w,x=j(r,t,u)
v=x
return w
end)

u(true)

p=true

l[r]={
destroy=w,
object=x,
index=q,
index_source=t,
count=o,
delay=v or 0,
present=u,
timeout=nil,
}
else
s.count=o

if s.index~=q then
if s.timeout then
s.timeout.cancel=true
s.timeout=nil
s.present(true)
end

s.index=q
s.index_source(q)
end
end
end


for q,r in l do
if r.count<o then
r.present(false)

if r.delay==0 then
r.destroy()
l[q]=nil
p=true
else
r.index=nil
if r.timeout==nil then
r.timeout=h(r.delay,function()
r.destroy()
l[q]=nil
update_output()
end)
end
end
end
end

if p then
update_output()
end
end)

return m
end

return values end function b.x():typeof(__modImpl())local c=b.cache.x if not c then c={c=__modImpl()}b.cache.x=c end return c.c end end do local function __modImpl()

local c=b.b()


local d=c.create_node
local e=c.create_source_node
local g=c.assert_stable_scope
local h=c.evaluate_node
local i=c.update_descendants
local j=c.push_scope_as_child_of

local k=120
local l=10_000
































local m={
number=function(m)
return vector.create(m,0,0),vector.zero
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_P<number>,

CFrame=function(m)
return m.Position,vector.create(m:ToEulerAnglesXYZ())
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_P<CFrame>,

Color3=function(m)

return vector.create(m.R,m.G,m.B),vector.zero
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_P<Color3>,

UDim=function(m)
return vector.create(m.Scale,m.Offset,0),vector.zero
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_P<UDim>,

UDim2=function(m)
return vector.create(m.X.Scale,m.X.Offset,m.Y.Scale),vector.create(m.Y.Offset,0,0)
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_P<UDim2>,

Vector2=function(m)
return vector.create(m.X,m.Y,0),vector.zero
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_P<Vector2>,

Vector3=function(m)
return m,vector.zero
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_P<Vector3>,

Rect=function(m)
return vector.create(m.Min.X,m.Min.Y,m.Max.X),vector.create(m.Max.Y,0,0)
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_P<Rect>,

table=function(m)
return vector.create(m[1]or 0,m[2]or 0,m[3]or 0),vector.create(m[4]or 0,0,0)
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_P<{number}>
}

local n={
number=function(n,o)
return n.X
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_Q<number>,

CFrame=function(n,o)
return CFrame.new(n)*CFrame.fromEulerAnglesXYZ(o.X,o.Y,o.Z)
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_Q<CFrame>,

Color3=function(n)
return Color3.new(math.clamp(n.X,0,1),math.clamp(n.Y,0,1),math.clamp(n.Z,0,1))
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_Q<Color3>,

UDim=function(n)
return UDim.new(n.X,math.round(n.Y))
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_Q<UDim>,

UDim2=function(n,o)
return UDim2.new(n.X,math.round(n.Y),n.Z,math.round(o.X))
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_Q<UDim2>,

Vector2=function(n)
return Vector2.new(n.X,n.Y)
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_Q<Vector2>,

Vector3=function(n)
return n
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_Q<Vector3>,

Rect=function(n,o)
return Rect.new(n.X,n.Y,n.Z,o.X)
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_Q<Rect>,

table=function(n,o)
return{n.X,n.Y,n.Z,o.X}
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_Q<{number}>
}

local o={
__index=function(o,p:string)
error(`cannot spring type {p}`,0)
end
}

setmetatable(m,o)
setmetatable(n,o)



local p:{[SpringState__DARKLUA_TYPE_N__DARKLUA_TYPE_N<unknown>]:SourceNode__DARKLUA_TYPE_L__DARKLUA_TYPE_L<unknown>}={}
setmetatable(p::any,{__mode="v"})

local function spring<T>(q:()->T,r:number?,s:number?):(()->T,SpringSettings__DARKLUA_TYPE_O__DARKLUA_TYPE_O<T>)
local t=g()


local u=2*math.pi/(r or 1)
local v=s or 1
local w=u^2
local x=2*u
local y=v*x



if y>k*2 then
error("spring damping too high, consider reducing damping or increasing period",0)
end

local z:SpringState__DARKLUA_TYPE_N__DARKLUA_TYPE_N<T> ={
k=w,
c=y,

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

local A=e(false::any)

local function updater_effect()
local B=q()
z.x1_123,z.x1_456=m[typeof(B)](B)
z.source_value=B
p[z]=A
return B
end

local B=d(t,updater_effect,false::any)
h(B)


z.x_123,z.x_456=z.x1_123,z.x1_456


A.cache=z.source_value

local C=function(C)
local D=C.position
local E=C.velocity
local F=C.impulse

if D then
local G,H=m[typeof(D)](D)
z.x_123,z.x_456=G,H
z.x0_123,z.x0_456=G,H
end

if E then
z.v_123,z.v_456=m[typeof(E)](E)
end

if F then
local G,H=m[typeof(F)](F)
z.v_123+=G
z.v_456+=H
end


p[z]=A
end::SpringSettings__DARKLUA_TYPE_O__DARKLUA_TYPE_O<T>

return function(...)
if select("#",...)==0 then
j(A)
return A.cache
end


local D=...::T
z.x_123,z.x_456=m[typeof(D)](D)


z.v_123=vector.zero
z.v_456=vector.zero


p[z]=A


A.cache=D

return D
end,C
end


local function get_min_step(q:number):number
return q/l
end
local function get_min_vector_step(q:vector):vector
return vector.create(
get_min_step(q.x),
get_min_step(q.y),
get_min_step(q.z)
)
end

local function step_springs(q:number)
for r in p do
local s=r.k
local t=r.c
local u,v=r.x_123,r.x_456
local w,x=r.x1_123,r.x1_456
local y,z=r.v_123,r.v_456


local A=u-w
local B=v-x


local C=A*-s
local D=B*-s


local E=y*-t
local F=z*-t


local G=(C+E)
local H=(D+F)


local I=y+G*q
local J=z+H*q


local K=u+I*q
local L=v+J*q

r.x_123,r.x_456=K,L
r.v_123,r.v_456=I,J
end
end

local function update_spring_sources()
for q,r in p do
local s,t=q.x0_123,q.x0_456
local u,v=q.x_123,q.x_456
local w,x=q.x1_123,q.x1_456
local y,z=q.v_123,q.v_456

local A=vector.abs(get_min_vector_step(s-w))
local B=vector.abs(get_min_vector_step(t-x))

if

vector.max(vector.abs(u-w),A)==A
and vector.max(vector.abs(v-x),B)==B


and vector.max(vector.abs(y/10),A)==A
and vector.max(vector.abs(z/10),B)==B
then
p[q]=nil
r.cache=q.source_value
else
r.cache=n[typeof(q.source_value)](u,v)
end

i(r)
end
end

return function()
local q=0

return spring,function(r:number)
q+=r

while q>1/k do
q-=1/k
step_springs(1/k)
end

update_spring_sources()
end
end end function b.y():typeof(__modImpl())local c=b.cache.y if not c then c={c=__modImpl()}b.cache.y=c end return c.c end end do local function __modImpl()

local c=b.g()()
local d=b.o()

local function changed<T>(e:string,g:(T)->())
return c(function(h)
local i=h:GetPropertyChangedSignal(e):Connect(function()
g((h::any)[e])
end)

d(function()
i:Disconnect()
end)

g((h::any)[e])
end)
end

return changed end function b.z():typeof(__modImpl())local c=b.cache.z if not c then c={c=__modImpl()}b.cache.z=c end return c.c end end do local function __modImpl()

local c={major=0,minor=4,patch=1}

local d=b.c()b.d()

local e=b.i()
local g=b.k()
local h=b.h()
local i=b.l()
local j=b.m()
local k=b.n()
local l=b.o()
local m=b.p()
local n=b.q()
local o=b.r()
local p=b.s()
local q=b.u()
local r=b.v()
local s=b.w()
local t=b.x()
local u,v=b.y()()
local w=b.g()()
local x=b.z()local
y, z=b.t()()
local A=b.a()






local function step(B:number)
if game then debug.profilebegin"VIDE STEP"end

if game then debug.profilebegin"VIDE SPRING"end
v(B)
if game then debug.profileend()end

if game then debug.profilebegin"VIDE SCHEDULER"end
z(B)
if game then debug.profileend()end

if game then debug.profileend()end
end

local B=game and game:GetService"RunService".Heartbeat:Connect(function(B:number)
task.defer(step,B)
end)

local C={
version=c,


root=d,

mount=e,
create=g,
source=i,
effect=j,
derive=k,
switch=q,
show=r,
indexes=s,
values=t,


cleanup=l,
untrack=m,
read=n,
batch=o,
context=p,


spring=u,


action=w,
changed=x,


strict=(nil::any)::boolean,
defaults=(nil::any)::boolean,
defer_nested_properties=(nil::any)::boolean,


apply=function(C:Instance)
return function(D:{[any]:any})
h(C,D)
return C
end
end,


step=function(C:number)
if B then
B:Disconnect()
B=nil
end
step(C)
end
}

setmetatable(C::any,{
__index=function(D,E:unknown):()
if A[E]==nil then
error(`{tostring(E)} is not a valid member of vide`,0)
else
return A[E]
end
end,

__newindex=function(D,E:unknown,F:unknown)
if A[E]==nil then
error(`{tostring(E)} is not a valid member of vide, 0`)
else
A[E]=F
end
end
})

return C end function b.A():typeof(__modImpl())local c=b.cache.A if not c then c={c=__modImpl()}b.cache.A=c end return c.c end end end

local c=b.A()






return c end function a.a():typeof(__modImpl())local b=a.cache.a if not b then b={c=__modImpl()}a.cache.a=b end return b.c end end do local function __modImpl()
return{
GothamBold=Font.fromEnum(Enum.Font.GothamBold),
Gotham=Font.fromEnum(Enum.Font.Gotham),
GothamMedium=Font.fromEnum(Enum.Font.GothamMedium),
Roboto=Font.fromEnum(Enum.Font.Roboto),
RobotoBold=Font.fromEnum(Enum.Font.RobotoCondensed),
RobotoMono=Font.fromEnum(Enum.Font.RobotoMono),
SourceSans=Font.fromEnum(Enum.Font.SourceSans),
SourceSansBold=Font.fromEnum(Enum.Font.SourceSansBold),
Ubuntu=Font.fromEnum(Enum.Font.Ubuntu),
UbuntuBold=Font.fromEnum(Enum.Font.Ubuntu),
}end function a.b():typeof(__modImpl())local b=a.cache.b if not b then b={c=__modImpl()}a.cache.b=b end return b.c end end do local function __modImpl()
const b=a.b()

return{
Name="Default",
WindowBackground=Color3.fromRGB(46,46,46),
FrameBackground=Color3.fromRGB(46,46,46),
TopBarBackground=Color3.fromRGB(0,0,0),
SidebarBackground=Color3.fromRGB(35,35,35),
ElementBackground=Color3.fromRGB(0,0,0),
ElementHoverBackground=Color3.fromRGB(20,20,20),
ElementStroke=Color3.fromRGB(154,154,154),
DropdownItem=Color3.fromRGB(55,55,55),
DropdownItemHover=Color3.fromRGB(75,75,75),
AccentColor=Color3.fromRGB(20,255,8),
LineColor=Color3.fromRGB(151,151,151),
SeparatorColor=Color3.fromRGB(204,204,204),
TextPrimaryColor=Color3.fromRGB(255,255,255),
TextSecondaryColor=Color3.fromRGB(180,180,180),
TabButtonActive=Color3.fromRGB(255,255,255),
TabButtonInactive=Color3.fromRGB(200,200,200),
TabButtonBackground=Color3.fromRGB(255,255,255),
BoldFont=b.GothamBold,
MainFont=b.Gotham,
}end function a.c():typeof(__modImpl())local b=a.cache.c if not b then b={c=__modImpl()}a.cache.c=b end return b.c end end do local function __modImpl()
const b=a.a()
const c=a.c()
const d=b.create

return function(e:TextButton&{Bold:boolean?,Children:{any}?})
const g=e.Bold
e.Bold=nil
const h=e.Children
e.Children=nil
return d"TextButton"{
TextScaled=true,
RichText=true,
TextColor3=Color3.fromRGB(255,255,255),
BackgroundColor3=Color3.fromRGB(0,0,0),
FontFace=g and c.BoldFont or c.MainFont,
Size=e.Size,
e,
h,
}
end end function a.d():typeof(__modImpl())local b=a.cache.d if not b then b={c=__modImpl()}a.cache.d=b end return b.c end end do local function __modImpl()
const b=a.a()
const c=b.create

return function(d:ScrollingFrame&{Children:{any}?})
const e=d.Children
d.Children=nil
return c"ScrollingFrame"{
d,
e,
}
end end function a.e():typeof(__modImpl())local b=a.cache.e if not b then b={c=__modImpl()}a.cache.e=b end return b.c end end do local function __modImpl()
const b=a.a()
const c=b.create

return function(d:UIPadding&{Padding:UDim?,PaddingHorizontal:UDim?,PaddingVertical:UDim?,Children:{any}?})
const e=d.Children
d.Children=nil
const g=d.Padding
d.Padding=nil
const h=d.PaddingHorizontal
d.PaddingHorizontal=nil
const i=d.PaddingVertical
d.PaddingVertical=nil
d.PaddingTop=d.PaddingTop or i or g
d.PaddingBottom=d.PaddingBottom or i or g
d.PaddingLeft=d.PaddingLeft or h or g
d.PaddingRight=d.PaddingRight or h or g
return c"UIPadding"{
d,
e,
}
end end function a.f():typeof(__modImpl())local b=a.cache.f if not b then b={c=__modImpl()}a.cache.f=b end return b.c end end do local function __modImpl()
const b=a.a()
const c=b.create

return function(d:Frame&{Children:{any}?})
const e=d.Children
d.Children=nil
return c"Frame"{
d,
e,
}
end end function a.g():typeof(__modImpl())local b=a.cache.g if not b then b={c=__modImpl()}a.cache.g=b end return b.c end end do local function __modImpl()
const b=a.a()
const c=a.c()
const d=b.create

return function(e:TextLabel&{Bold:boolean?,Children:{any}?})
const g=e.Bold
e.Bold=nil
const h=e.Children
e.Children=nil
return d"TextLabel"{
TextScaled=true,
TextColor3=Color3.fromRGB(255,255,255),
BackgroundColor3=Color3.fromRGB(0,0,0),
RichText=true,
Text="Hello World!",
FontFace=g and c.BoldFont or c.MainFont,
e,
h,
}
end end function a.h():typeof(__modImpl())local b=a.cache.h if not b then b={c=__modImpl()}a.cache.h=b end return b.c end end do local function __modImpl()
const b=a.a()
const c=b.create

return function(d:ImageLabel&{Children:{any}?})
const e=d.Children
d.Children=nil
return c"ImageLabel"{
BackgroundTransparency=1,
ScaleType=Enum.ScaleType.Fit,
d,
e,
}
end end function a.i():typeof(__modImpl())local b=a.cache.i if not b then b={c=__modImpl()}a.cache.i=b end return b.c end end do local function __modImpl()
const b=a.a()
const c=b.create

return function(d:UIStroke&{Children:{any}?})
const e=d.Children
d.Children=nil
return c"UIStroke"{
StrokeSizingMode=Enum.StrokeSizingMode.ScaledSize,
Thickness=.02,
d,
e,
}
end end function a.j():typeof(__modImpl())local b=a.cache.j if not b then b={c=__modImpl()}a.cache.j=b end return b.c end end do local function __modImpl()
local b={}
b.__index=b a.a()a.c()


function b.new(c,d:string)
c=c or{}
local e=c.Flag or c.Name or c.Text

local g={
Type=d,
Name=c.Name or c.Text or d,
Flag=e,
Save=if c.Save~=nil then(c.Save==true)else true,
Instance=nil,
Tab=nil,
Window=nil,
}

return setmetatable(g,b)
end

function b.GetFlag(c):string?
return c.Flag
end

function b.SetFlag(c,d:string)
c.Flag=d
end

function b.SetSave(c,d:boolean)
c.Save=d==true
end

function b.CanSave(c):boolean
return c.Save==true and c.Flag~=nil
end

function b.GetValue(c):any
return nil
end

function b.SetValue(c,d:any)

end

function b.Export(c):any
if not c:CanSave()then
return nil
end
return c:GetValue()
end

function b.Import(c,d:any)
if d~=nil then
c:SetValue(d)
end
end

return b end function a.k():typeof(__modImpl())local b=a.cache.k if not b then b={c=__modImpl()}a.cache.k=b end return b.c end end do local function __modImpl()

const b=a.a()a.g()

const c=a.h()
const d=a.d()
const e=a.i()
const g=a.f()
const h=a.j()
const i=a.k()

return function(j:Instance,k,l)
k=k or{}
local m=l.Theme

const n=b.source(k.Text or"Button")
const o=b.source(true)
const p=b.source(false)
const q=b.source(false)

const r=(k.Mini and UDim2.new(0.9,0,0.04,0))
or(k.Small and UDim2.new(0.9,0,0.05,0))
or UDim2.new(0.9,0,0.06,0)

const s=d{
Parent=j,
Name=k.Name or"Button",
Text="",
BorderSizePixel=0,
BackgroundColor3=function()
if k.Color then
return k.Color
end
if q()then
return m().ElementHoverBackground or m().ElementBackground
end
return m().ElementBackground
end,
Size=r,
Position=UDim2.new(0,0,0.0101,0),
BorderColor3=Color3.fromRGB(0,0,0),
Visible=function()
return o()
end,
MouseEnter=function()
q(true)
end,
MouseLeave=function()
q(false)
end,
MouseButton1Click=function()
if k.Callback then
k.Callback()
end
end,
Children={
b.create"UICorner"{},

c{
Name="Title",
Text=function()
return n()
end,
TextWrapped=true,
BorderSizePixel=0,
TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,
BackgroundColor3=Color3.fromRGB(255,255,255),
TextColor3=function()
return m().TextPrimaryColor
end,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0.7,0),
Position=UDim2.new(0,0,0.15,0),
Children={
g{
PaddingLeft=UDim.new(0.05,0),
PaddingRight=UDim.new(0.1,0),
},
},
},

e{
Name="Icon",
Image="rbxassetid://91052455220714",
ImageColor3=function()
return m().TextSecondaryColor or m().TextPrimaryColor
end,
ScaleType=Enum.ScaleType.Fit,
Size=UDim2.new(0.07635,0,0.71069,0),
Position=UDim2.new(0.87516,0,0.13931,0),
BackgroundTransparency=1,
BorderSizePixel=0,
},

h{
Color=function()
if p()then
return Color3.fromRGB(0,170,0)
end
return m().ElementStroke
end,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
},
},
}

local t=i.new(k,"Button")
t.Save=if k.Save~=nil then k.Save==true else false
t.Instance=s
t.Window=l
t.Enabled=false

function t.SetText(u,v:string)
n(v)
end

function t.IsToggled(u):boolean
return p()
end

function t.Toggle(u,v:boolean?)
local w:boolean
if v==nil then
w=not p()
else
w=v==true
end
p(w)
t.Enabled=w
end

function t.ToggleVisible(u,v:boolean?)
if v==true then
o(true)
elseif v==false then
o(false)
else
o(not o())
end
end

function t.SetCallback(u,v:()->())
k.Callback=v
end

return t
end end function a.l():typeof(__modImpl())local b=a.cache.l if not b then b={c=__modImpl()}a.cache.l=b end return b.c end end do local function __modImpl()

const b=a.a()
const c=a.g()
const d=a.h()
const e=a.f()
const g=a.j()
const h=a.k()



local i={
Warning={
Background=Color3.fromRGB(118,103,2),
Stroke=Color3.fromRGB(198,198,0),
MinTextSize=14,
MaxTextSize=16,
},
Info={
Background=Color3.fromRGB(0,88,132),
Stroke=Color3.fromRGB(0,145,217),
MinTextSize=10,
MaxTextSize=16,
},
Message={
Background=Color3.fromRGB(37,37,37),
Stroke=Color3.fromRGB(154,154,154),
MinTextSize=10,
MaxTextSize=16,
},
}

return function(j:Instance,k:BannerType__DARKLUA_TYPE_Z,l)
l=l or{}
const m=i[k]or i.Message

const n=b.source(l.Text or"")
const o=b.source(true)

const p=c{
Parent=j,
Name=k,
BorderSizePixel=0,
BackgroundColor3=m.Background,
AutomaticSize=Enum.AutomaticSize.Y,
Size=UDim2.new(0.9,0,0.05534,0),
Position=UDim2.new(0,0,0.08296,0),
BorderColor3=Color3.fromRGB(0,0,0),
Visible=function()
return o()
end,
Children={
b.create"UICorner"{},

d{
Name="Title",
TextWrapped=true,
BorderSizePixel=0,
TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,
BackgroundColor3=Color3.fromRGB(255,255,255),
TextColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
Size=UDim2.new(1,0,0.7,0),
Position=UDim2.new(0,0,0.13174,0),
AutomaticSize=Enum.AutomaticSize.Y,
Text=function()
return n()
end,
Children={
e{
PaddingLeft=UDim.new(0.05,0),
PaddingRight=UDim.new(0.05,0),
},
b.create"UITextSizeConstraint"{
MaxTextSize=m.MaxTextSize,
MinTextSize=m.MinTextSize,
},
},
},

g{
Color=m.Stroke,
},
},
}

local q=h.new(l,k)
q.Save=if l.Save~=nil then l.Save==true else false
q.Instance=p

function q.SetText(r,s:string)
n(s)
end

function q.Toggle(r,s:boolean?)
if s~=nil then
o(s)
else
o(not o())
end
end

return q
end end function a.m():typeof(__modImpl())local b=a.cache.m if not b then b={c=__modImpl()}a.cache.m=b end return b.c end end do local function __modImpl()

const b=a.a()
const c=a.c()
const d=b.create

return function(e:TextBox&{Bold:boolean?,Children:{any}?})
const g=e.Bold
e.Bold=nil
const h=e.Children
e.Children=nil
return d"TextBox"{
TextScaled=true,
TextColor3=Color3.fromRGB(0,0,0),
BackgroundColor3=Color3.fromRGB(255,255,255),
ClearTextOnFocus=false,
FontFace=g and c.BoldFont or c.MainFont,
e,
h,
}
end end function a.n():typeof(__modImpl())local b=a.cache.n if not b then b={c=__modImpl()}a.cache.n=b end return b.c end end do local function __modImpl()

const b=a.a()
const c=a.g()
const d=a.h()
const e=a.d()
const g=a.n()
const h=a.f()
const i=a.j()
const j=a.k()

const k=game:GetService"UserInputService"
const l=game:GetService"Players"

return function(m:Instance,n,o:any?)
n=n or{}

const p=n.Min or 0
const q=n.Max or 100
const r=math.max(q-p,1e-4)
local s=10^(n.Decimals or 0)

const t=b.source(n.Default or p)
const u=b.source(math.clamp(((n.Default or p)-p)/r,0,1))
const v=b.source(tostring(t()))

local w:GuiObject?
local x=false

local y=j.new(n,"Slider")
y.Decimals=s
y.Callback=n.Callback
y.Window=o
local z=o.Theme

function y.SetValue(A,B:number?,C:boolean?)
local D:number
local E:number
if B==nil then
if not w then return end
local F=l.LocalPlayer and l.LocalPlayer:GetMouse()
local G=(F and F.X)or k:GetMouseLocation().X
D=math.clamp((G-w.AbsolutePosition.X)/w.AbsoluteSize.X,0,1)
E=math.floor((((q-p)*D)+p)*y.Decimals)/y.Decimals
else
E=math.clamp(B,p,q)
D=math.clamp((E-p)/r,0,1)
end

E=math.clamp(E,p,q)
D=math.clamp(D,0,1)

t(E)
u(D)
v(tostring(E))

if B~=nil and C~=false and y.Callback then
y.Callback(E)
end
end

function y.GetValue(A):number
return tonumber(t())or p
end

function y.SetCallback(A,B:(number)->(),C:number?)
y.Callback=B
n.Callback=B
if C then
y.Decimals=10^C
end
end

const A=c{
Parent=m,
Name=n.Name or n.Text or"Slider",
BorderSizePixel=0,
BackgroundColor3=function()
return n.Color or z().ElementBackground
end,
Size=UDim2.new(0.9,0,0.08,0),
Position=UDim2.new(0,0,0.41186,0),
BorderColor3=Color3.fromRGB(0,0,0),
Children={
b.create"UICorner"{},

d{
Name="Title",
TextWrapped=true,
BorderSizePixel=0,
TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,
BackgroundColor3=Color3.fromRGB(255,255,255),
TextColor3=function()
return z().TextPrimaryColor
end,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0.45282,0),
Position=UDim2.new(0,0,0.15,0),
Text=n.Text or"Slider",
Children={
h{
PaddingLeft=UDim.new(0.05,0),
},
},
},

g{
Name="Number",
TextWrapped=true,
BorderSizePixel=0,
TextScaled=true,
BackgroundColor3=Color3.fromRGB(255,255,255),
TextColor3=function()
return z().TextPrimaryColor
end,
BackgroundTransparency=1,
Size=UDim2.new(0.12762,0,0.48197,0),
Position=UDim2.new(0.85101,0,0.12085,0),
Text=function()
return v()
end,
FocusLost=function()
local A=tonumber(v())or 0
y:SetValue(A)
if y.Callback then
y.Callback(y:GetValue())
end
end,
},

e{
Name="SliderBackground",
AutoButtonColor=false,
Text="",
BorderSizePixel=0,
BackgroundColor3=Color3.fromRGB(255,255,255),
Size=UDim2.new(0.92981,0,0.2,0),
Position=UDim2.new(0.03509,0,0.7,0),
BackgroundTransparency=1,
MouseButton1Down=function()
x=true
y:SetValue()
end,
MouseButton1Up=function()
if x then
x=false
if y.Callback then
y.Callback(y:GetValue())
end
end
end,
Children={
b.create"UICorner"{
CornerRadius=UDim.new(1,0),
},
i{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Color=function()
return z().ElementStroke
end,
},
c{
Name="Bar",
BorderSizePixel=0,
BackgroundColor3=function()
return n.FillColor or z().AccentColor
end,
Size=function()
return UDim2.new(u(),0,1,0)
end,
Children={
b.create"UICorner"{
CornerRadius=UDim.new(1,0),
},
},
},
},
},

i{
Color=function()
return z().ElementStroke
end,
},
},
}

w=A:FindFirstChild"SliderBackground"::GuiObject

A.MouseMoved:Connect(function()
if not x then return end
y:SetValue()
end)

A.MouseLeave:Connect(function()
if x then
x=false
if y.Callback then
y.Callback(y:GetValue())
end
end
end)

k.InputEnded:Connect(function(B)
if B.UserInputType==Enum.UserInputType.MouseButton1 or B.UserInputType==Enum.UserInputType.Touch then
if x then
x=false
if y.Callback then
y.Callback(y:GetValue())
end
end
end
end)

y.Instance=A
y:SetValue(n.Default or p)
return y
end end function a.o():typeof(__modImpl())local b=a.cache.o if not b then b={c=__modImpl()}a.cache.o=b end return b.c end end do local function __modImpl()

const b=game:GetService"TweenService"
const c=a.a()
const d=a.h()
const e=a.d()
const g=a.i()
const h=a.e()
const i=a.f()
const j=a.j()
const k=a.k()

local l=TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)

local function tween(m:Instance,n:{[string]:any},o:TweenInfo?,p:(()->())?)
local q=b:Create(m,o or l,n)
if p then
q.Completed:Once(p)
end
q:Play()
return q
end

return function(m:Instance,n,o)
n=n or{}
local p=o.Theme

const q=c.source""

local r=UDim2.fromScale(0.9,0.09326)
local s=UDim2.fromScale(1,0.4)
local t=UDim2.fromScale(0.5,0.3)
local u=UDim2.fromScale(0.07881,1.18696)
local v=UDim2.fromScale(0.87213,-0.3)

local w=UDim2.fromScale(0.9,0.2376)
local x=UDim2.fromScale(1,0.18954)
local y=UDim2.fromScale(0.5,0.15762)
local z=UDim2.fromScale(0.07635,0.18778)
local A=UDim2.fromScale(0.87516,0.05838)

local B=false
local C:any

local D=k.new(n,"Dropdown")
D.Closed=true
D.Selected=nil
D.Options={}
D.Window=o

const E=h{
Name="Options",
BorderSizePixel=0,
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticCanvasSize=Enum.AutomaticSize.Y,
CanvasSize=UDim2.new(0,0,0,0),
ScrollingDirection=Enum.ScrollingDirection.Y,
Size=UDim2.new(0.95,0,0.7,0),
Position=UDim2.new(0.5,0,0.6005,0),
Visible=false,
Children={
c.create"UIListLayout"{
Padding=UDim.new(0.05,0),
SortOrder=Enum.SortOrder.LayoutOrder,
},
i{
PaddingTop=UDim.new(0.1,0),
},
},
}

const F=d{
Name="Title",
TextWrapped=true,
BorderSizePixel=0,
TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,
BackgroundColor3=Color3.fromRGB(255,255,255),
TextColor3=function()
return p().TextPrimaryColor
end,
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Text=n.Name or n.Text or"Dropdown",
Size=s,
Position=t,
Children={
i{
PaddingLeft=UDim.new(0.05,0),
},
},
}

const G=g{
Name="Icon",
BorderSizePixel=0,
BackgroundTransparency=1,
ScaleType=Enum.ScaleType.Fit,
Image="rbxassetid://107003984522008",
Rotation=90,
Size=u,
Position=v,
}

const H=d{
Name="TextBox",
TextWrapped=true,
BorderSizePixel=0,
TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,
BackgroundColor3=Color3.fromRGB(186,186,186),
TextColor3=Color3.fromRGB(0,0,0),
Size=UDim2.new(0.90372,0,0.37501,0),
Position=UDim2.new(0.05,0,0.55,0),
Text=function()
return q()
end,
Visible=true,
Active=false,
Children={
c.create"UICorner"{},
i{
PaddingLeft=UDim.new(0.05,0),
},
j{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Color=Color3.fromRGB(255,255,255),
},
},
}

local function toggleDropdown()
if B then return end
B=true

if not D.Closed then

E.Visible=false
H.Visible=true

tween(C,{Size=r},nil,function()
D.Closed=true
B=false
end)
tween(F,{Size=s,Position=t})
tween(G,{Size=u,Position=v,Rotation=90})
else

H.Visible=false

tween(C,{Size=w},nil,function()
E.Visible=true
D.Closed=false
B=false
end)
tween(F,{Size=x,Position=y})
tween(G,{Size=z,Position=A,Rotation=-90})
end
end

C=e{
Parent=m,
Name="Dropdown",
Text="",
AutoButtonColor=false,
BorderSizePixel=0,
BackgroundColor3=function()
return n.Color or p().ElementBackground
end,
ClipsDescendants=true,
BorderColor3=Color3.fromRGB(0,0,0),
Size=r,
Position=UDim2.new(0,0,0.24976,0),
MouseButton1Click=toggleDropdown,
Children={
c.create"UICorner"{},
F,
G,
j{
Color=function()
return p().ElementStroke
end,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
},
H,
E,
},
}

function D.Select(I,J)
local K:Instance?
local L

if typeof(J)=="string"then
for M,N in D.Options do
if N.Name==J or(N.Instance and N.Instance.Name==J)then
L=N
K=N.Instance
break
end
end
elseif typeof(J)=="table"and J.Instance then
L=J
K=J.Instance
elseif typeof(J)=="Instance"then
K=J
for M,N in D.Options do
if N.Instance==J then
L=N
break
end
end
end

if not K then return end

for M,N in D.Options do
local O=N.Instance:FindFirstChildOfClass"UIStroke"
if O then
O.Enabled=(N.Instance==K)
end
end

D.Selected=L or K
q(K.Name)

if L and L.Callback then
L.Callback(K.Name)
end

if not D.Closed then
toggleDropdown()
end
end

function D.Default(I,J)
D:Select(J)
end

function D.GetOption(I):string?
if D.Selected then
if typeof(D.Selected)=="table"and D.Selected.Instance then
return D.Selected.Instance.Name
elseif typeof(D.Selected)=="Instance"then
return D.Selected.Name
end
end
return nil
end

function D.GetValue(I):string?
return I:GetOption()
end

function D.SetValue(I,J:any)
I:Select(J)
end

function D.Option(I,J)
J=J or{}
const K=J.Name or"Option"

local L={}

const M=e{
Name=K,
Text=K,
TextWrapped=true,
BorderSizePixel=0,
TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,
BackgroundColor3=function()
return p().DropdownItem
end,
TextColor3=function()
return p().TextPrimaryColor
end,
AnchorPoint=Vector2.new(0.5,0.5),
Size=UDim2.new(0.9,0,0.24645,0),
Position=UDim2.new(0.5,0,0.12323,0),
MouseButton1Click=function()
D:Select(L)
end,
Children={
c.create"UICorner"{
CornerRadius=UDim.new(1,0),
},
i{
PaddingLeft=UDim.new(0.05,0),
},
c.create"UIStroke"{
Enabled=false,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Thickness=2,
Color=function()
return p().AccentColor
end,
},
},
}

M.Parent=E
L.Instance=M
L.Name=K
L.Callback=J.Callback

function L.GetButton(N)
return M
end
function L.GetName(N)
return K
end

table.insert(D.Options,L)
return L
end

D.Instance=C
return D
end end function a.p():typeof(__modImpl())local b=a.cache.p if not b then b={c=__modImpl()}a.cache.p=b end return b.c end end do local function __modImpl()

const b=a.a()
const c=a.g()
const d=a.h()
const e=a.d()
const g=a.f()
const h=a.j()
const i=a.k()

return function(j:Instance,k,l:any?)
k=k or{}

const m=b.source(k.Toggled==true)
local n=false

const o=(k.Mini and UDim2.new(0.9,0,0.04,0))
or(k.Small and UDim2.new(0.9,0,0.05,0))
or UDim2.new(0.9,0,0.06,0)

local p=i.new(k,"Toggle")
p.Locked=false
p.Callback=k.Callback
p.Window=l
local q=l.Theme

function p.SetCallback(r,s:(boolean)->())
p.Callback=s
end

function p.IsToggled(r):boolean
return m()
end

function p.GetValue(r):boolean
return r:IsToggled()
end

function p.SetValue(r,s:boolean)
r:Toggle(s)
end

function p.Toggle(r,s:boolean?)
if n then return end
local t:boolean
if s~=nil then
t=s
else
t=not m()
end
m(t)
if p.Callback then
p.Callback(t)
end
end

function p.Lock(r)
n=true
p.Locked=true
end

function p.Unlock(r)
n=false
p.Locked=false
end

function p.IsLocked(r):boolean
return n
end

const r=e{
Parent=j,
Name="Toggle",
Text="",
BorderSizePixel=0,
BackgroundColor3=function()
return k.Color or q().ElementBackground
end,
Size=o,
Position=UDim2.new(0,0,0.0101,0),
BorderColor3=Color3.fromRGB(0,0,0),
MouseButton1Click=function()
p:Toggle()
end,
Children={
b.create"UICorner"{},

d{
Name="Title",
TextWrapped=true,
BorderSizePixel=0,
TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,
BackgroundColor3=Color3.fromRGB(255,255,255),
TextColor3=function()
return q().TextPrimaryColor
end,
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Size=UDim2.new(1,0,0.7,0),
Position=UDim2.new(0.5,0,0.5,0),
Text=k.Text or"Toggle",
Children={
g{
PaddingLeft=UDim.new(0.05,0),
},
},
},

h{
Color=function()
return q().ElementStroke
end,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
},

c{
Name="Bool",
BorderSizePixel=0,
BackgroundColor3=function()
return k.IndicatorColor or q().AccentColor
end,
Size=UDim2.new(0.05914,0,0.61915,0),
Position=UDim2.new(0.88391,0,0.18468,0),
BorderColor3=Color3.fromRGB(0,0,0),
BackgroundTransparency=function()
return if m()then 0 else 1
end,
Children={
b.create"UICorner"{
CornerRadius=UDim.new(0.2,0),
},
b.create"UIStroke"{
Color=Color3.fromRGB(255,255,255),
},
b.create"UIAspectRatioConstraint"{},
},
},
},
}

p.Instance=r
return p
end end function a.q():typeof(__modImpl())local b=a.cache.q if not b then b={c=__modImpl()}a.cache.q=b end return b.c end end do local function __modImpl()

const b=a.a()
const c=a.g()
const d=a.h()
const e=a.n()
const g=a.f()
const h=a.j()
const i=a.k()

return function(j:Instance,k,l)
k=k or{}
local m=l.Theme

const n=b.source(k.DefaultText or"")
const o=b.source(true)
local p=k.Callback

local q=i.new(k,"TextBox")
q.Callback=p
q.Window=l

function q.ToggleVisible(r,s:boolean?)
if s==true then
o(true)
elseif s==false then
o(false)
else
o(not o())
end
end

function q.GetText(r):string
return n()
end

function q.SetText(r,s:string)
n(s)
end

function q.GetValue(r):string
return r:GetText()
end

function q.SetValue(r,s:string)
r:SetText(tostring(s))
if r.Callback then
r.Callback(tostring(s))
end
end

function q.SetCallback(r,s:(string)->())
p=s
q.Callback=s
end

const r=c{
Parent=j,
Name="TextBox",
BorderSizePixel=0,
BackgroundColor3=function()
return k.Color or m().ElementBackground
end,
Size=UDim2.new(0.9,0,0.06377,0),
Position=UDim2.new(0,0,0.51186,0),
BorderColor3=Color3.fromRGB(0,0,0),
Visible=function()
return o()
end,
Children={
b.create"UICorner"{},

d{
Name="Title",
TextWrapped=true,
BorderSizePixel=0,
TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,
BackgroundColor3=Color3.fromRGB(255,255,255),
TextColor3=function()
return m().TextPrimaryColor
end,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0.5,0),
Position=UDim2.new(0,0,0.26446,0),
Text=k.Text or"Textbox",
Children={
g{
PaddingLeft=UDim.new(0.05,0),
},
},
},

h{
Color=function()
return m().ElementStroke
end,
},

e{
Name="Input",
TextColor3=function()
return m().TextPrimaryColor
end,
BorderSizePixel=0,
TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,
TextScaled=true,
PlaceholderText=k.PlaceholderText or"Placeholder",
PlaceholderColor3=function()
return m().TextSecondaryColor or Color3.fromRGB(113,113,113)
end,
ClearTextOnFocus=false,
BackgroundColor3=function()
return m().DropdownItem or Color3.fromRGB(185,185,185)
end,
Size=UDim2.new(0.52197,0,0.71728,0),
Position=UDim2.new(0.45527,0,0.13354,0),
Text=function()
return n()
end,
FocusLost=function(r)
if q.Callback then
q.Callback(n(),r)
elseif p then
p(n(),r)
end
end,
Children={
h{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Color=Color3.fromRGB(255,255,255),
},
b.create"UICorner"{},
g{
PaddingLeft=UDim.new(0.05,0),
},
},
},
},
}

const s=r:FindFirstChild"Input"::TextBox?
if s then
s:GetPropertyChangedSignal"Text":Connect(function()
n(s.Text)
end)
end

q.Instance=r
return q
end end function a.r():typeof(__modImpl())local b=a.cache.r if not b then b={c=__modImpl()}a.cache.r=b end return b.c end end do local function __modImpl()

const b=game:GetService"UserInputService"

local function makeDraggable(c:GuiObject,d:GuiObject?)
local e:GuiObject=d or c
local g=false
local h=Vector3.zero
local i=e.Position

local j=c.InputBegan:Connect(function(j)
if j.UserInputType==Enum.UserInputType.MouseButton1 or j.UserInputType==Enum.UserInputType.Touch then
g=true
h=j.Position
i=e.Position

local k:RBXScriptConnection?
k=j.Changed:Connect(function()
if j.UserInputState==Enum.UserInputState.End then
g=false
if k then
k:Disconnect()
k=nil
end
end
end)
end
end)

local k=b.InputChanged:Connect(function(k)
if g and(k.UserInputType==Enum.UserInputType.MouseMovement or k.UserInputType==Enum.UserInputType.Touch)then
local l=k.Position-h
e.Position=UDim2.new(
i.X.Scale,
i.X.Offset+l.X,
i.Y.Scale,
i.Y.Offset+l.Y
)
end
end)

return function()
g=false
if j then
j:Disconnect()
j=nil
end
if k then
k:Disconnect()
k=nil
end
end
end

return makeDraggable end function a.s():typeof(__modImpl())local b=a.cache.s if not b then b={c=__modImpl()}a.cache.s=b end return b.c end end do local function __modImpl()

const b=a.a()
const c=a.g()
const d=a.h()
const e=a.d()
const g=a.f()
const h=a.j()
const i=a.k()
const j=a.s()
return function(k:Instance,l:Instance,m,n)
m=m or{}
local o=n.Theme

const p=b.source(false)
const q=b.source(m.Visible~=false)
local r:(()->())?


const s=e{
Parent=l,
Name="MobileLock",
TextWrapped=true,
BorderSizePixel=0,
TextSize=14,
TextColor3=Color3.fromRGB(0,0,0),
TextScaled=true,
BackgroundColor3=Color3.fromRGB(255,255,255),
Size=UDim2.new(0.05,0,0.08961,0),
Position=UDim2.new(0.66912,0,0.67579,0),
Text=m.Text or"Lock",
Visible=function()
return q()
end,
Children={
b.create"UICorner"{
CornerRadius=UDim.new(1,0),
},
b.create"UIAspectRatioConstraint"{
AspectRatio=0.99777,
},
},
}


const t=c{
Parent=k,
Name="ButtonBind",
BorderSizePixel=0,
BackgroundColor3=function()
return m.Color or o().ElementBackground
end,
Size=UDim2.new(0.9,0,0.07,0),
Position=UDim2.new(0,0,0.51186,0),
BorderColor3=Color3.fromRGB(0,0,0),
Children={
b.create"UICorner"{},

d{
Name="Title",
TextWrapped=true,
BorderSizePixel=0,
TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,
BackgroundColor3=Color3.fromRGB(255,255,255),
TextColor3=function()
return o().TextPrimaryColor
end,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0.45282,0),
Position=UDim2.new(0,0,0.26446,0),
Text=m.Name or"CustomBind",
Children={
g{
PaddingLeft=UDim.new(0.05,0),
},
},
},

h{
Color=function()
return o().ElementStroke
end,
},

e{
Name="TextBox",
TextWrapped=true,
BorderSizePixel=0,
TextScaled=true,
Size=UDim2.new(0.17467,0,0.71728,0),
Position=UDim2.new(0.80257,0,0.13354,0),
Text="Move",
TextColor3=Color3.fromRGB(255,255,255),
BackgroundColor3=function()
return if p()then Color3.fromRGB(0,0,127)else Color3.fromRGB(0,0,255)
end,
MouseButton1Click=function()
if not p()then
p(true)
s.Position=UDim2.new(0.66912,0,0.67579,0)
if r then
r()
end
r=j(s,s)
else
p(false)
if r then
r()
r=nil
end
end
end,
Children={
h{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Color=Color3.fromRGB(255,255,255),
},
b.create"UICorner"{},
g{
PaddingLeft=UDim.new(0.05,0),
},
},
},
},
}

local u=i.new(m,"BindButton")
u.Save=if m.Save~=nil then m.Save==true else false
u.Instance=t
u.Button=s
u.Window=n

function u.GetButton(v):GuiObject
return s
end

function u.ToggleVisible(v,w:boolean?)
if w~=nil then
q(w)
else
q(not q())
end
end

function u.SetDraggable(v,w:boolean)
if w then
p(true)
if r then
r()
end
r=j(s,s)
else
p(false)
if r then
r()
r=nil
end
end
end

if m.Draggable==true then
r=j(s,s)
end

return u
end end function a.t():typeof(__modImpl())local b=a.cache.t if not b then b={c=__modImpl()}a.cache.t=b end return b.c end end do local function __modImpl()

const b=a.a()
const c=a.g()
const d=a.h()
const e=a.d()
const g=a.f()
const h=a.j()
const i=a.k()

const j=game:GetService"UserInputService"

return function(k:Instance,l,m)
l=l or{}
local n=m.Theme

const o=b.source(l.Bind or"")
const p=b.source(l.Bind and#l.Bind==1 or false)
local q=false

local r=i.new(l,"KeyBind")
r.Bind=l.Bind
r.IsKey=p()
r.UseProc=false
r.Callback=nil
r.Window=m

function r.SetCallback(s,t:()->(),u:boolean?)
r.UseProc=u==true
r.Callback=t
end

function r.GetBind(s):string?
return r.Bind
end

function r.GetValue(s):string?
return s:GetBind()
end

function r.SetValue(s,t:string)
r.Bind=tostring(t)
r.IsKey=#tostring(t)==1
o(tostring(t))
p(r.IsKey)
if r.Callback then
r.Callback(tostring(t))
end
end

const s=c{
Parent=k,
Name=l.Name or"Keybind",
BorderSizePixel=0,
BackgroundColor3=function()
return l.Color or n().ElementBackground
end,
Size=UDim2.new(0.9,0,0.07,0),
Position=UDim2.new(0,0,0.51186,0),
BorderColor3=Color3.fromRGB(0,0,0),
Children={
b.create"UICorner"{},

d{
Name="Title",
TextWrapped=true,
BorderSizePixel=0,
TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,
BackgroundColor3=Color3.fromRGB(255,255,255),
TextColor3=function()
return n().TextPrimaryColor
end,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0.45282,0),
Position=UDim2.new(0,0,0.26446,0),
Text=l.Name or"Keybind",
Children={
g{
PaddingLeft=UDim.new(0.05,0),
},
},
},

h{
Color=function()
return n().ElementStroke
end,
},

e{
Name="TextBox",
TextWrapped=true,
BorderSizePixel=0,
TextScaled=true,
BackgroundColor3=Color3.fromRGB(185,185,185),
TextColor3=Color3.fromRGB(0,0,0),
Size=UDim2.new(0.17467,0,0.71728,0),
Position=UDim2.new(0.80257,0,0.13354,0),
Text=function()
const s=o()
return if s and#s>0 then s else(l.Placeholder or"Bind")
end,
MouseButton1Click=function()
q=true
o"..."
end,
Children={
h{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Color=Color3.fromRGB(255,255,255),
},
b.create"UICorner"{},
g{
PaddingLeft=UDim.new(0.05,0),
},
},
},
},
}

j.InputBegan:Connect(function(t,u)
if q then
if t.UserInputType==Enum.UserInputType.Keyboard then
if t.KeyCode~=Enum.KeyCode.Escape then
const v=t.KeyCode.Name
o(v)
r.Bind=v
r.IsKey=true
else
o(r.Bind or"")
end
elseif t.UserInputType==Enum.UserInputType.MouseButton1 then
o"LMB"
r.Bind="MouseButton1"
r.IsKey=false
elseif t.UserInputType==Enum.UserInputType.MouseButton2 then
o"RMB"
r.Bind="MouseButton2"
r.IsKey=false
elseif t.UserInputType==Enum.UserInputType.MouseButton3 then
o"MMB"
r.Bind="MouseButton3"
r.IsKey=false
end
q=false
else
if u and not r.UseProc then return end
if not r.Bind then return end

if r.IsKey then
if t.KeyCode.Name==r.Bind then
if r.Callback then
r.Callback()
end
end
else
if t.UserInputType.Name==r.Bind then
if r.Callback then
r.Callback()
end
end
end
end
end)

r.Instance=s
return r
end end function a.u():typeof(__modImpl())local b=a.cache.u if not b then b={c=__modImpl()}a.cache.u=b end return b.c end end do local function __modImpl()

const b=a.a()
const c=a.d()
const d=a.e()
const e=a.f()

const g=a.l()
const h=a.m()
const i=a.o()
const j=a.p()
const k=a.q()
const l=a.r()
const m=a.t()
const n=a.u()

const o={}
o.__index=o

function o.new(p,q)
q=q or{}
const r=q.Name or"Tab"

const s=b.source(false)
const t=b.source(false)
const u=b.source(r)


const v=d{
Parent=p.TabContainer,
Name=r,
BorderSizePixel=0,
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
ScrollBarImageColor3=Color3.fromRGB(0,0,0),
ScrollingDirection=Enum.ScrollingDirection.Y,
Visible=function()
return s()
end,
Children={
b.create"UIListLayout"{
Padding=UDim.new(0.01,0),
SortOrder=if q.Alphabetical==true then Enum.SortOrder.Name else Enum.SortOrder.LayoutOrder,
},
e{
PaddingTop=UDim.new(0.01,0),
PaddingLeft=UDim.new(0.01,0),
},
},
}


const w=c{
Parent=p.TabButtonHolder,
Name=r,
AutoButtonColor=false,
BorderSizePixel=0,
TextXAlignment=Enum.TextXAlignment.Left,
TextScaled=true,
Size=UDim2.new(1,0,0.1,0),
Position=UDim2.new(0,0,0.188,0),
Text=function()
return u()
end,
TextColor3=function()
return if s()or t()
then Color3.fromRGB(255,255,255)
else Color3.fromRGB(200,200,200)
end,
BackgroundTransparency=function()
return if s()then 0.8 else 1
end,
BackgroundColor3=Color3.fromRGB(255,255,255),
MouseEnter=function()
t(true)
end,
MouseLeave=function()
t(false)
end,
Children={
e{
PaddingTop=UDim.new(0.05,0),
PaddingLeft=UDim.new(0.05,0),
},
},
}

const x=setmetatable({
Window=p,
Name=r,
Hover=false,
Active=false,
Instance=v,
TabFrame=v,
TabButton=w,
ScrollingFrame=v,
IsActiveSource=s,
IsHoverSource=t,
TextSource=u,
Elements={},
},o)

w.MouseButton1Click:Connect(function()
x:Activate()
if p.Tabs then
for y,z in p.Tabs do
if z~=x then
z:Deactivate()
end
end
end
end)

return x
end

function o.RegisterElement(p,q)
q.Tab=p
q.Window=p.Window
table.insert(p.Elements,q)
if p.Window and p.Window.Elements and q.Flag then
p.Window.Elements[q.Flag]=q
end
return q
end

function o.Activate(p)
if not p.Active then
p.Active=true
p.IsActiveSource(true)
p.Window.CurrentTab=p
end
end

function o.Deactivate(p)
if p.Active then
p.Active=false
p.IsActiveSource(false)
p.Hover=false
p.IsHoverSource(false)
end
end

function o.SetText(p,q:string)
p.Name=q
p.TextSource(q)
if p.TabButton then
p.TabButton.Name=q
end
if p.ScrollingFrame then
p.ScrollingFrame.Name=q
end
end

function o.Button(p,q)
return p:RegisterElement(g(p.ScrollingFrame,q,p.Window))
end

function o.Warning(p,q)
return p:RegisterElement(h(p.ScrollingFrame,"Warning",q,p.Window))
end

function o.Info(p,q)
return p:RegisterElement(h(p.ScrollingFrame,"Info",q,p.Window))
end

function o.Message(p,q)
return p:RegisterElement(h(p.ScrollingFrame,"Message",q,p.Window))
end

function o.Slider(p,q)
return p:RegisterElement(i(p.ScrollingFrame,q,p.Window))
end

function o.Dropdown(p,q)
return p:RegisterElement(j(p.ScrollingFrame,q,p.Window))
end

function o.Toggle(p,q)
return p:RegisterElement(k(p.ScrollingFrame,q,p.Window))
end

function o.TextBox(p,q)
return p:RegisterElement(l(p.ScrollingFrame,q,p.Window))
end

function o.BindButton(p,q)
return p:RegisterElement(m(p.ScrollingFrame,p.Window.ScreenGui,q,p.Window))
end

function o.BindKey(p,q)
return p:RegisterElement(n(p.ScrollingFrame,q,p.Window))
end

function o.Export(p):{[string]:any}
local q={}
for r,s in p.Elements do
if s.CanSave and s:CanSave()then
local t=s:Export()
if t~=nil then
q[s.Flag]=t
end
end
end
return q
end

function o.Import(p,q:{[string]:any})
if not q then return end
for r,s in p.Elements do
if s.CanSave and s:CanSave()and q[s.Flag]~=nil then
s:Import(q[s.Flag])
end
end
end

function o.Destroy(p)
if p.TabButton then
p.TabButton:Destroy()
end
if p.ScrollingFrame then
p.ScrollingFrame:Destroy()
end
end

return o end function a.v():typeof(__modImpl())local b=a.cache.v if not b then b={c=__modImpl()}a.cache.v=b end return b.c end end do local function __modImpl()
const b=a.b()

return{
Name="Dark",
WindowBackground=Color3.fromRGB(18,18,18),
FrameBackground=Color3.fromRGB(18,18,18),
TopBarBackground=Color3.fromRGB(10,10,10),
SidebarBackground=Color3.fromRGB(14,14,14),
ElementBackground=Color3.fromRGB(25,25,25),
ElementHoverBackground=Color3.fromRGB(35,35,35),
ElementStroke=Color3.fromRGB(55,55,55),
DropdownItem=Color3.fromRGB(30,30,30),
DropdownItemHover=Color3.fromRGB(45,45,45),
AccentColor=Color3.fromRGB(59,130,246),
LineColor=Color3.fromRGB(45,45,45),
SeparatorColor=Color3.fromRGB(45,45,45),
TextPrimaryColor=Color3.fromRGB(245,245,245),
TextSecondaryColor=Color3.fromRGB(150,150,150),
TabButtonActive=Color3.fromRGB(255,255,255),
TabButtonInactive=Color3.fromRGB(130,130,130),
TabButtonBackground=Color3.fromRGB(255,255,255),
BoldFont=b.GothamBold,
MainFont=b.Gotham,
}end function a.w():typeof(__modImpl())local b=a.cache.w if not b then b={c=__modImpl()}a.cache.w=b end return b.c end end do local function __modImpl()

const b=a.b()

return{
Name="Midnight",
WindowBackground=Color3.fromRGB(15,23,42),
FrameBackground=Color3.fromRGB(15,23,42),
TopBarBackground=Color3.fromRGB(10,15,29),
SidebarBackground=Color3.fromRGB(12,19,36),
ElementBackground=Color3.fromRGB(22,33,58),
ElementHoverBackground=Color3.fromRGB(30,45,78),
ElementStroke=Color3.fromRGB(51,65,85),
DropdownItem=Color3.fromRGB(26,40,70),
DropdownItemHover=Color3.fromRGB(38,56,95),
AccentColor=Color3.fromRGB(14,165,233),
LineColor=Color3.fromRGB(30,41,59),
SeparatorColor=Color3.fromRGB(51,65,85),
TextPrimaryColor=Color3.fromRGB(241,245,249),
TextSecondaryColor=Color3.fromRGB(148,163,184),
TabButtonActive=Color3.fromRGB(56,189,248),
TabButtonInactive=Color3.fromRGB(148,163,184),
TabButtonBackground=Color3.fromRGB(56,189,248),
BoldFont=b.GothamBold,
MainFont=b.Gotham,
}end function a.x():typeof(__modImpl())local b=a.cache.x if not b then b={c=__modImpl()}a.cache.x=b end return b.c end end do local function __modImpl()

const b=a.b()

return{
Name="Dracula",
WindowBackground=Color3.fromRGB(40,42,54),
FrameBackground=Color3.fromRGB(40,42,54),
TopBarBackground=Color3.fromRGB(28,29,38),
SidebarBackground=Color3.fromRGB(33,34,44),
ElementBackground=Color3.fromRGB(50,52,68),
ElementHoverBackground=Color3.fromRGB(68,71,90),
ElementStroke=Color3.fromRGB(98,114,164),
DropdownItem=Color3.fromRGB(55,58,75),
DropdownItemHover=Color3.fromRGB(72,76,99),
AccentColor=Color3.fromRGB(189,147,249),
LineColor=Color3.fromRGB(68,71,90),
SeparatorColor=Color3.fromRGB(98,114,164),
TextPrimaryColor=Color3.fromRGB(248,248,242),
TextSecondaryColor=Color3.fromRGB(160,165,185),
TabButtonActive=Color3.fromRGB(255,121,198),
TabButtonInactive=Color3.fromRGB(130,140,170),
TabButtonBackground=Color3.fromRGB(189,147,249),
BoldFont=b.GothamBold,
MainFont=b.Gotham,
}end function a.y():typeof(__modImpl())local b=a.cache.y if not b then b={c=__modImpl()}a.cache.y=b end return b.c end end do local function __modImpl()

const b=a.b()

return{
Name="Nord",
WindowBackground=Color3.fromRGB(46,52,64),
FrameBackground=Color3.fromRGB(46,52,64),
TopBarBackground=Color3.fromRGB(36,41,51),
SidebarBackground=Color3.fromRGB(40,46,57),
ElementBackground=Color3.fromRGB(59,66,82),
ElementHoverBackground=Color3.fromRGB(67,76,94),
ElementStroke=Color3.fromRGB(76,86,106),
DropdownItem=Color3.fromRGB(67,76,94),
DropdownItemHover=Color3.fromRGB(76,86,106),
AccentColor=Color3.fromRGB(136,192,208),
LineColor=Color3.fromRGB(67,76,94),
SeparatorColor=Color3.fromRGB(76,86,106),
TextPrimaryColor=Color3.fromRGB(236,239,244),
TextSecondaryColor=Color3.fromRGB(216,222,233),
TabButtonActive=Color3.fromRGB(136,192,208),
TabButtonInactive=Color3.fromRGB(160,170,185),
TabButtonBackground=Color3.fromRGB(136,192,208),
BoldFont=b.GothamBold,
MainFont=b.Gotham,
}end function a.z():typeof(__modImpl())local b=a.cache.z if not b then b={c=__modImpl()}a.cache.z=b end return b.c end end do local function __modImpl()

const b=a.b()

return{
Name="Catppuccin",
WindowBackground=Color3.fromRGB(30,30,46),
FrameBackground=Color3.fromRGB(30,30,46),
TopBarBackground=Color3.fromRGB(24,24,37),
SidebarBackground=Color3.fromRGB(27,27,41),
ElementBackground=Color3.fromRGB(49,50,68),
ElementHoverBackground=Color3.fromRGB(69,71,90),
ElementStroke=Color3.fromRGB(88,91,112),
DropdownItem=Color3.fromRGB(49,50,68),
DropdownItemHover=Color3.fromRGB(69,71,90),
AccentColor=Color3.fromRGB(203,166,247),
LineColor=Color3.fromRGB(69,71,90),
SeparatorColor=Color3.fromRGB(88,91,112),
TextPrimaryColor=Color3.fromRGB(205,214,244),
TextSecondaryColor=Color3.fromRGB(166,173,200),
TabButtonActive=Color3.fromRGB(203,166,247),
TabButtonInactive=Color3.fromRGB(147,154,183),
TabButtonBackground=Color3.fromRGB(203,166,247),
BoldFont=b.GothamBold,
MainFont=b.Gotham,
}end function a.A():typeof(__modImpl())local b=a.cache.A if not b then b={c=__modImpl()}a.cache.A=b end return b.c end end do local function __modImpl()

const b=a.b()

return{
Name="Emerald",
WindowBackground=Color3.fromRGB(16,28,22),
FrameBackground=Color3.fromRGB(16,28,22),
TopBarBackground=Color3.fromRGB(10,18,14),
SidebarBackground=Color3.fromRGB(13,23,18),
ElementBackground=Color3.fromRGB(23,40,31),
ElementHoverBackground=Color3.fromRGB(32,56,44),
ElementStroke=Color3.fromRGB(45,80,62),
DropdownItem=Color3.fromRGB(25,45,35),
DropdownItemHover=Color3.fromRGB(36,64,50),
AccentColor=Color3.fromRGB(46,204,113),
LineColor=Color3.fromRGB(35,62,48),
SeparatorColor=Color3.fromRGB(45,80,62),
TextPrimaryColor=Color3.fromRGB(235,247,240),
TextSecondaryColor=Color3.fromRGB(150,185,165),
TabButtonActive=Color3.fromRGB(82,222,140),
TabButtonInactive=Color3.fromRGB(140,175,155),
TabButtonBackground=Color3.fromRGB(46,204,113),
BoldFont=b.GothamBold,
MainFont=b.Gotham,
}end function a.B():typeof(__modImpl())local b=a.cache.B if not b then b={c=__modImpl()}a.cache.B=b end return b.c end end do local function __modImpl()

const b=a.b()

return{
Name="Rose",
WindowBackground=Color3.fromRGB(28,16,20),
FrameBackground=Color3.fromRGB(28,16,20),
TopBarBackground=Color3.fromRGB(18,10,13),
SidebarBackground=Color3.fromRGB(23,13,16),
ElementBackground=Color3.fromRGB(42,24,30),
ElementHoverBackground=Color3.fromRGB(58,33,42),
ElementStroke=Color3.fromRGB(86,48,62),
DropdownItem=Color3.fromRGB(46,26,33),
DropdownItemHover=Color3.fromRGB(66,37,47),
AccentColor=Color3.fromRGB(244,63,94),
LineColor=Color3.fromRGB(68,38,49),
SeparatorColor=Color3.fromRGB(86,48,62),
TextPrimaryColor=Color3.fromRGB(254,242,244),
TextSecondaryColor=Color3.fromRGB(195,155,165),
TabButtonActive=Color3.fromRGB(251,113,133),
TabButtonInactive=Color3.fromRGB(165,125,135),
TabButtonBackground=Color3.fromRGB(244,63,94),
BoldFont=b.GothamBold,
MainFont=b.Gotham,
}end function a.C():typeof(__modImpl())local b=a.cache.C if not b then b={c=__modImpl()}a.cache.C=b end return b.c end end do local function __modImpl()

const b=a.b()

return{
Name="Light",
WindowBackground=Color3.fromRGB(245,247,250),
FrameBackground=Color3.fromRGB(245,247,250),
TopBarBackground=Color3.fromRGB(255,255,255),
SidebarBackground=Color3.fromRGB(238,241,246),
ElementBackground=Color3.fromRGB(255,255,255),
ElementHoverBackground=Color3.fromRGB(240,243,248),
ElementStroke=Color3.fromRGB(215,220,230),
DropdownItem=Color3.fromRGB(255,255,255),
DropdownItemHover=Color3.fromRGB(240,243,248),
AccentColor=Color3.fromRGB(37,99,235),
LineColor=Color3.fromRGB(215,220,230),
SeparatorColor=Color3.fromRGB(215,220,230),
TextPrimaryColor=Color3.fromRGB(20,25,35),
TextSecondaryColor=Color3.fromRGB(100,110,125),
TabButtonActive=Color3.fromRGB(37,99,235),
TabButtonInactive=Color3.fromRGB(110,120,135),
TabButtonBackground=Color3.fromRGB(37,99,235),
BoldFont=b.GothamBold,
MainFont=b.Gotham,
}end function a.D():typeof(__modImpl())local b=a.cache.D if not b then b={c=__modImpl()}a.cache.D=b end return b.c end end do local function __modImpl()

const b=a.c()
const c=a.w()
const d=a.x()
const e=a.y()
const g=a.z()
const h=a.A()
const i=a.B()
const j=a.C()
const k=a.D()
























local l={
Default=b,
Dark=c,
Midnight=d,
Dracula=e,
Nord=g,
Catppuccin=h,
Emerald=i,
Rose=j,
Light=k,
}

function l.Get(m:(string|{[string]:any})?):Theme__DARKLUA_TYPE__
if typeof(m)=="string"then
local n=string.lower(m)
for o,p in l do
if typeof(p)=="table"and string.lower(o)==n then
return p
end
end
return b
elseif typeof(m)=="table"then
local n=table.clone(b)
for o,p in m do
n[o]=p
end
return n
end
return b
end

return l end function a.E():typeof(__modImpl())local b=a.cache.E if not b then b={c=__modImpl()}a.cache.E=b end return b.c end end do local function __modImpl()

const b=a.a()
const c=a.g()
const d=a.h()
const e=a.d()
const g=a.j()

return function(h:Instance)
const i=UDim2.new(0.28899,0,1.1,0)
const j=UDim2.fromScale(0.289,0.786)

const k=b.source(i)
const l=b.spring(k,0.35,0.8)

const m=b.source""
local n:thread?

local function dismiss()
k(i)
if n then
task.cancel(n)
n=nil
end
end

const o=c{
Parent=h,
Name="Notifyframe",
ZIndex=5,
BorderSizePixel=0,
BackgroundColor3=Color3.fromRGB(0,0,0),
Size=UDim2.new(0.4213,0,0.21207,0),
Position=function()
return l()
end,
BorderColor3=Color3.fromRGB(0,0,0),
Children={
b.create"UICorner"{
CornerRadius=UDim.new(0.05,0),
},

d{
Name="TextLabel",
TextWrapped=true,
ZIndex=5,
BorderSizePixel=0,
TextScaled=true,
BackgroundColor3=Color3.fromRGB(255,255,255),
TextColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
Size=UDim2.new(1,0,0.65123,0),
Position=UDim2.new(0,0,0.16429,0),
Text=function()
return m()
end,
Children={
b.create"UITextSizeConstraint"{
MaxTextSize=35,
},
},
},

e{
Name="CloseButton",
TextWrapped=true,
BorderSizePixel=0,
TextScaled=true,
TextColor3=Color3.fromRGB(255,255,255),
BackgroundColor3=Color3.fromRGB(255,255,255),
ZIndex=5,
Size=UDim2.new(0.08817,0,0.34885,0),
BackgroundTransparency=1,
Text="X",
Position=UDim2.new(0.91179,0,-2E-5,0),
MouseButton1Click=dismiss,
},

g{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Color=Color3.fromRGB(255,255,255),
},
},
}

return{
Instance=o,
Notify=function(p,q:string)

local r=if q~=nil then q else tostring(p)
m(tostring(r))
k(j)

if n then
task.cancel(n)
end
n=task.delay(4,function()
k(i)
n=nil
end)
end,
Dismiss=dismiss,
}
end end function a.F():typeof(__modImpl())local b=a.cache.F if not b then b={c=__modImpl()}a.cache.F=b end return b.c end end do local function __modImpl()

const b=a.a()
const c=a.g()
const d=a.j()
const e=a.k()

return function(g:Instance,h)
h=h or{}

const i=tonumber(h.Size)or 0.1
const j=b.source(UDim2.new(i,0,i,0))
const k=b.source(UDim2.new(0.5,0,0.5,0))
const l=b.source(h.Color or Color3.fromRGB(0,0,0))
const m=b.source(h.Visible==true)

const n=c{
Parent=g,
Name="zirkul",
BorderSizePixel=0,
BackgroundColor3=Color3.fromRGB(0,0,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
BorderColor3=Color3.fromRGB(0,0,0),
Size=function()
return j()
end,
Position=function()
return k()
end,
Visible=function()
return m()
end,
Children={
b.create"UICorner"{
CornerRadius=UDim.new(1,0),
},
d{
Color=function()
return l()
end,
},
b.create"UIAspectRatioConstraint"{},
},
}

local o=e.new(h,"Drawing")
o.Save=if h.Save~=nil then h.Save==true else false
o.Instance=n

function o.ToggleVisible(p,q:boolean?)
if q~=nil then
m(q)
else
m(not m())
end
end

function o.SetRadius(p,q:number)
h.Size=q
j(UDim2.new(q,0,q,0))
end

function o.SetColor(p,q:Color3)
h.Color=q
l(q)
end

function o.GetPosition(p):Vector2
return n.AbsolutePosition
end

function o.SetPosition(p,q:UDim2)
k(q)
end

function o.GetRadius(p):number
return n.AbsoluteSize.X
end

return o
end end function a.G():typeof(__modImpl())local b=a.cache.G if not b then b={c=__modImpl()}a.cache.G=b end return b.c end end do local function __modImpl()

const b=a.a()
const c=a.v()
const d=a.g()
const e=a.h()
const g=a.d()
const h=a.i()
const i=a.f()
const j=a.c()
const k=a.E()
const l=a.F()
const m=a.G()

game:GetService"UserInputService"
game:GetService"RunService"
game:GetService"Players"
const n=a.s()

const o={}
o.__index=o
o.MakeDraggable=n

function o.new(p,q)
q=q or{}

const r=k.Get(q.Theme or j)

const s=setmetatable({
Name=q.Name or"yummy beans",
Tabs={},
Elements={},
CurrentTab=nil,
OnDestroyed=q.OnDestroyed,
Theme=b.source(r),
},o)

s.Minimized=b.source(false)

local t=q.Size or UDim2.new(0.3,0,0.3,0)
local u=q.MinimizedSize or UDim2.new(t.X.Scale,t.X.Offset,0.045,0)

local v=d{
Name="TopBar",
Size=function()
return s.Minimized()and UDim2.fromScale(1,1)or UDim2.fromScale(1,0.11424)
end,
Position=UDim2.new(0,0,-2.34E-3,0),
BackgroundColor3=function()
return s.Theme().TopBarBackground
end,
Children={
b.create"UICorner"{
CornerRadius=UDim.new(0.2,0),
},


d{
Name="Bottom",
Size=UDim2.new(1,0,0.85083,0),
Position=UDim2.new(0,0,0.14917,0),
BackgroundColor3=function()
return s.Theme().TopBarBackground
end,
},


h{
Name="Icon",
Image=q.Icon or"http://www.roblox.com/asset/?id=18187292776",
Size=UDim2.new(0.1023,0,1.055,0),
Position=UDim2.new(-1.47E-3,0,0,0),
},


d{
Name="Line",
Size=UDim2.new(0,1,.8,0),
Position=UDim2.new(0.1,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3=function()
return s.Theme().LineColor or Color3.fromRGB(151,151,151)
end,
},


e{
Name="Title",
Text=s.Name,
Size=UDim2.new(0.5,0,1,0),
Position=UDim2.new(0.12321,0,-2.193E-2,0),
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundTransparency=1,
TextColor3=function()
return s.Theme().TextPrimaryColor
end,
Children={
i{
PaddingVertical=UDim.new(0.1,0),
PaddingLeft=UDim.new(0.05,0),
},
},
},


g{
Name="Minimize",
Size=UDim2.new(0.1,0,1,0),
Position=UDim2.new(0.75,0,0,0),
BackgroundTransparency=1,
Text="-",
TextColor3=function()
return s.Theme().TextPrimaryColor
end,
MouseButton1Click=function()
s.Minimized(not s.Minimized())
end,
Children={
i{
PaddingVertical=UDim.new(0.1,0),
PaddingLeft=UDim.new(0.05,0),
},
},
},


g{
Name="Exit",
Size=UDim2.new(0.1,0,1,0),
Position=UDim2.new(0.89932,0,0,0),
BackgroundTransparency=1,
Text="X",
TextColor3=function()
return s.Theme().TextPrimaryColor
end,
MouseButton1Click=function()
s:Destroy()
end,
Children={
i{
PaddingVertical=UDim.new(0.1,0),
PaddingLeft=UDim.new(0.05,0),
},
},
},


d{
Name="Line",
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0,0,1,0),
BackgroundColor3=function()
return s.Theme().SeparatorColor or Color3.fromRGB(204,204,204)
end,
Visible=function()
return not s.Minimized()
end,
},
},
}


local w=d{
Name="Holder",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Children={
i{
PaddingTop=UDim.new(0.05,0),
},
b.create"UIListLayout"{
SortOrder=Enum.SortOrder.LayoutOrder,
},
},
}


local x=d{
Name="Sidebar",
Size=UDim2.new(0.2619,0,0.88598,0),
Position=UDim2.new(0.13061,0,0.55701,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3=function()
return s.Theme().SidebarBackground
end,
Visible=function()
return not s.Minimized()
end,
Children={
b.create"UICorner"{
CornerRadius=UDim.new(0.08,0),
},


d{
Name="Hide",
Size=UDim2.new(0.2,0,0.2,0),
Position=UDim2.new(0,0,0,0),
BackgroundColor3=function()
return s.Theme().SidebarBackground
end,
},
d{
Name="Hide",
Size=UDim2.new(0.2,0,0.2,0),
Position=UDim2.new(0.8,0,0.00271,0),
BackgroundColor3=function()
return s.Theme().SidebarBackground
end,
},
d{
Name="Hide",
Size=UDim2.new(0.2,0,0.2,0),
Position=UDim2.new(0.9974,0,0.99851,0),
AnchorPoint=Vector2.new(1,1),
BackgroundColor3=function()
return s.Theme().SidebarBackground
end,
},
d{
Name="Line",
BorderSizePixel=0,
BackgroundColor3=function()
return s.Theme().SeparatorColor or Color3.fromRGB(204,204,204)
end,
Size=UDim2.new(0,1,1,0),
Position=UDim2.new(0.99788,0,0.0047,0),
},

w,
},
}


local y=d{
Name="TabHolder",
Size=UDim2.new(0.69686,0,0.79967,0),
Position=UDim2.new(0.63331,0,0.57126,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Visible=function()
return not s.Minimized()
end,
}


local z=d{
Name="Main",
Size=function()
return s.Minimized()and u or t
end,
Position=q.Position or UDim2.new(0.3,0,0.3,0),
AnchorPoint=q.AnchorPoint or Vector2.zero,
BackgroundColor3=function()
return s.Theme().WindowBackground or s.Theme().FrameBackground
end,
ClipsDescendants=true,
Children={
b.create"UICorner"{
CornerRadius=UDim.new(0.03,0),
},
y,
x,
v,
},
}

n(v,z)
s.Instance=z
s.TopBar=v
s.Sidebar=x
s.TabButtonHolder=w
s.TabContainer=y

s.Notifier=l(z)

local A=q.Parent

s.ScreenGui=b.create"ScreenGui"{
Name="BeanzUI",
ResetOnSpawn=false,
IgnoreGuiInset=false,
z,
}

s.DestroyRoot=b.mount(function()
return s.ScreenGui
end,A)

return s
end

function o.Notify(p,q:string)
if p.Notifier then
p.Notifier:Notify(q)
end
end

function o.Drawing(p,q)
return m(p.ScreenGui,q)
end

function o.CreateTab(p,q)
const r=c.new(p,q)
table.insert(p.Tabs,r)
if p.CurrentTab==nil then
r:Activate()
end
return r
end

function o.GetElement(p,q:string)
return p.Elements[q]
end

function o.SetTheme(p,q:string|{[string]:any})
local r=k.Get(q)
p.Theme(r)
end

function o.GetTheme(p)
return p.Theme()
end

function o.Export(p):{[string]:any}
local q={}
for r,s in p.Tabs do
if s.Export then
local t=s:Export()
for u,v in t do
q[u]=v
end
end
end
return q
end

function o.Import(p,q:{[string]:any})
if not q then return end
for r,s in p.Tabs do
if s.Import then
s:Import(q)
end
end
end

function o.ExportJSON(p):string
local q=game:GetService"HttpService"
return q:JSONEncode(p:Export())
end

function o.ImportJSON(p,q:string):boolean
local r=game:GetService"HttpService"
local s,t=pcall(function()
return r:JSONDecode(q)
end)
if s and typeof(t)=="table"then
p:Import(t)
return true
end
return false
end

function o.Destroy(p)
if p.OnDestroyed then
p.OnDestroyed()
end
if p.ScreenGui then
p.ScreenGui:Destroy()
end
if p.DestroyRoot then
p.DestroyRoot()
end
end

return o end function a.H():typeof(__modImpl())local b=a.cache.H if not b then b={c=__modImpl()}a.cache.H=b end return b.c end end end
local b=game:GetService"Players"
local c=game:GetService"RunService"
local d=game:GetService"TweenService"

const e=a.H()
const g=a.E()

local h=TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)

local i={
Themes=g,
}

function i.CreateWindow(j,k)
k=k or{}
if not k.Parent and c:IsRunning()then
k.Parent=(c:IsStudio()and b.LocalPlayer and b.LocalPlayer:WaitForChild"PlayerGui")or game:GetService"CoreGui"
end
return e.new(i,k)
end

i.New=i.CreateWindow

function i.Tween(j,k,l,m,n)
local o=d:Create(k,l or h,m)
o.Completed:Once(n or function()end)
o:Play()
return o
end

return i