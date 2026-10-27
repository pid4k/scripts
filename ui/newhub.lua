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

type RichTextFont__DARKLUA_TYPE_Z={
color:Color3?,
size:number?,
face:string?,
family:string?,
weight:number?,
transparency:number?,
}

type RichTextStroke__DARKLUA_TYPE__={
color:Color3?,
thickness:number?,
transparency:number?,
joins:Enum.LineJoinMode?,

}

type RichTextProps__DARKLUA_TYPE_0={
font:RichTextFont__DARKLUA_TYPE_Z?,
stroke:RichTextStroke__DARKLUA_TYPE__?,

bold:boolean?,
italic:boolean?,
underline:boolean?,
strikethrough:boolean?,
uppercase:boolean?,
smallcaps:boolean?,
comment:string?,
}

type RichTextString__DARKLUA_TYPE_1=setmetatable<{
props:RichTextProps__DARKLUA_TYPE_0
},typeof(RichTextStr)>local a={cache={}::any}do do local function __modImpl()


















































































































































































































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
const b=a.a()
const c=b.create

return function(d:Frame&{Children:{any}?})
const e=d.Children
d.Children=nil
return c"Frame"{
d,
e,
}
end end function a.b():typeof(__modImpl())local b=a.cache.b if not b then b={c=__modImpl()}a.cache.b=b end return b.c end end do local function __modImpl()
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
end end function a.c():typeof(__modImpl())local b=a.cache.c if not b then b={c=__modImpl()}a.cache.c=b end return b.c end end do local function __modImpl()
const b=a.a()
const c=b.create

return function(d:ScrollingFrame&{Children:{any}?})
const e=d.Children
d.Children=nil
return c"ScrollingFrame"{
d,
e,
}
end end function a.d():typeof(__modImpl())local b=a.cache.d if not b then b={c=__modImpl()}a.cache.d=b end return b.c end end do local function __modImpl()
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
}end function a.e():typeof(__modImpl())local b=a.cache.e if not b then b={c=__modImpl()}a.cache.e=b end return b.c end end do local function __modImpl()
const b=a.e()

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
AccentColor=Color3.fromRGB(154,154,154),
LineColor=Color3.fromRGB(151,151,151),
SeparatorColor=Color3.fromRGB(204,204,204),
TextPrimaryColor=Color3.fromRGB(255,255,255),
TextSecondaryColor=Color3.fromRGB(180,180,180),
TabButtonActive=Color3.fromRGB(255,255,255),
TabButtonInactive=Color3.fromRGB(200,200,200),
TabButtonBackground=Color3.fromRGB(255,255,255),
BoldFont=b.GothamBold,
MainFont=b.Gotham,
}end function a.f():typeof(__modImpl())local b=a.cache.f if not b then b={c=__modImpl()}a.cache.f=b end return b.c end end do local function __modImpl()
const b=a.a()
const c=a.f()
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
end end function a.g():typeof(__modImpl())local b=a.cache.g if not b then b={c=__modImpl()}a.cache.g=b end return b.c end end do local function __modImpl()

const b=a.a()
const c=a.f()
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
end end function a.h():typeof(__modImpl())local b=a.cache.h if not b then b={c=__modImpl()}a.cache.h=b end return b.c end end do local function __modImpl()
const b=a.a()
const c=a.f()
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
end end function a.i():typeof(__modImpl())local b=a.cache.i if not b then b={c=__modImpl()}a.cache.i=b end return b.c end end do local function __modImpl()
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
end end function a.j():typeof(__modImpl())local b=a.cache.j if not b then b={c=__modImpl()}a.cache.j=b end return b.c end end do local function __modImpl()
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
end end function a.k():typeof(__modImpl())local b=a.cache.k if not b then b={c=__modImpl()}a.cache.k=b end return b.c end end do local function __modImpl()
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

return makeDraggable end function a.l():typeof(__modImpl())local b=a.cache.l if not b then b={c=__modImpl()}a.cache.l=b end return b.c end end do local function __modImpl()


local b={}

































local function getAttributeString(c:string,d:any):string
if typeof(d)=="Color3"then
return string.format(' %s="#%s"',c,d:ToHex())
elseif typeof(d)=="EnumItem"then
return string.format(' %s="%s"',c,d.Name)
elseif d~=nil then
return string.format(' %s="%s"',c,tostring(d))
end
return""
end


function b.Apply(c,d:string,e:RichTextProps__DARKLUA_TYPE_0):string
local g=""
local h=""



if e.stroke then
local i=""
i..=getAttributeString("color",e.stroke.color)
i..=getAttributeString("thickness",e.stroke.thickness)
i..=getAttributeString("transparency",e.stroke.transparency)
i..=getAttributeString("joins",e.stroke.joins)
i..=getAttributeString("cap",e.stroke.cap)

g..=`<stroke{i}>`
h=`</stroke>`..h
end


if e.font then
local i=""
i..=getAttributeString("color",e.font.color)
i..=getAttributeString("size",e.font.size)
i..=getAttributeString("face",e.font.face)
i..=getAttributeString("family",e.font.family)
i..=getAttributeString("weight",e.font.weight)
i..=getAttributeString("transparency",e.font.transparency)

g..=`<font{i}>`
h=`</font>`..h
end



local i={
bold="b",
italic="i",
underline="u",
strikethrough="s",
uppercase="uc",
smallcaps="sc"
}

for j,k in pairs(i)do
if e[j]==true then
g..=`<{k}>`
h=`</{k}>`..h
end
end


if e.comment then
g=`<!-- {e.comment} -->`..g
end

return g..d..h
end


function b.Color(c,d:string,e:Color3)
return c:Apply(d,{font={color=e}})
end

function b.Size(c,d:string,e:number)
return c:Apply(d,{font={size=e}})
end

function b.Underline(c,d:string)
return c:Apply(d,{underline=true})
end


function b.Clean(c,d:string)
return(d:gsub("<[^<>]->",""))
end
local c={}




c.__index=c

function b.newString(d:string,e:RichTextProps__DARKLUA_TYPE_0):RichTextString__DARKLUA_TYPE_1
assert(e,"missing argument #2 'props'")
local g=setmetatable({},c)
g.props=e
g.text=d
return g
end

c.__tostring=function(d)
return b:Apply(d.text,d.props)
end

return b end function a.m():typeof(__modImpl())local b=a.cache.m if not b then b={c=__modImpl()}a.cache.m=b end return b.c end end end
local b=game:GetService"TweenService"
local c=a.b()
local d=a.c()
local e=a.d()
local g=a.g()
local h=a.h()
local i=a.i()
local j=a.j()
local k=a.k()
const l=a.l()
const m=a.m()
const n=a.a()
const function sandbox()
local o=setmetatable({},{
__index=function(o,p)
return o
end,
__call=function(o,...)
return o
end
})
return o
end
const o=getgenv and loadstring(game:HttpGet"https://raw.githubusercontent.com/pid4k/scripts/main/configsystem.lua")()or sandbox()
const p=UDim2.fromScale(1,6.761)
const q=UDim2.fromScale(0.45,0.082)
const r=UDim2.fromScale(0.5,0.324)
const s=0
const t=1
const u=2

const v=getgenv and loadstring(game:HttpGet"https://raw.githubusercontent.com/pid4k/scripts/main/allscripts.lua")()or sandbox()

local w=n.source(nil)
const x=n.source"Beanz"

local y=function()
setclipboard(`loadstring(game:HttpGet("{w().Loadstring}"))()`)
end
local z=function()
loadstring(game:HttpGet(w().Loadstring))()
end

local function popupButton(A)
local B=A.Children
A.Children=nil
return h{
Size=UDim2.fromScale(.5,.1),
Bold=true,
n.create"UICorner"{},
j{
PaddingHorizontal=UDim.new(.1,0),
},
Children=B,
A,
}
end


local function searchBox(A)
const B=g{
PlaceholderText="Search...",
Text="",
Size=UDim2.fromScale(0.59573,0.09866),
Position=UDim2.fromScale(0.38645,0.02309),
Children={
n.create"UICorner"{},
k{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Thickness=.05,
},
},
A,
}
B:GetPropertyChangedSignal"Text":Connect(function()
local C=string.lower(B.Text)
for D,E in B.Parent.Scroll:GetChildren()do
if E:IsA"TextButton"then
E.Visible=string.find(string.lower(E.Text),C,1,true)~=nil
end
end
end)
return B
end


local function scrollList(A)
local B=A.Children
A.Children=nil
return e{
Name="Scroll",
BackgroundTransparency=1,
Size=UDim2.fromScale(0.54752,0.78291),
Position=UDim2.fromScale(0.43466,0.1612),
ScrollBarImageColor3=Color3.fromRGB(0,0,0),
n.create"UIListLayout"{
HorizontalAlignment=Enum.HorizontalAlignment.Center,
Wraps=true,
Padding=UDim.new(0.007,0),
SortOrder=Enum.SortOrder.LayoutOrder,
},
j{
PaddingTop=UDim.new(0.01,0),
},
Children=B,
A,

}
end

local A
n.mount(function()



local B=d{
ZIndex=3,
Image="http://www.roblox.com/asset/?id=18187292776",
Size=UDim2.fromScale(1,1),
}


local C=i{
Size=UDim2.fromScale(1,1),
Text=x,
BackgroundTransparency=1,
TextColor3=Color3.fromRGB(0,0,0),
ClipsDescendants=true,
Position=UDim2.fromScale(-0.789,0),
Visible=false,
j{
PaddingLeft=UDim.new(.05,0)
}
}


local D=h{
Name="Delete",
Text="X",
ZIndex=3,
Size=UDim2.fromScale(0.06157,0.597),
Position=UDim2.fromScale(0.928,0.2),
BackgroundTransparency=0.95,
Visible=false,
}


local E=c{
Name="Title",
BackgroundTransparency=1,
ClipsDescendants=true,
Size=UDim2.fromScale(1,1),
Children={
B,
C,

c{
Name="Nackground",
Active=true,
ZIndex=2,
BackgroundColor3=Color3.fromRGB(100,100,100),
Size=UDim2.fromScale(0.15,1),
},
D,
},
}


local F=h{
Font=Enum.Font.FredokaOne,
Text=">",
ZIndex=3,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(1.072,0.5),
Rotation=180,
Size=UDim2.fromScale(0.23653,0.1),
BackgroundTransparency=1,
}


local G=c{
Name="Popup",
ZIndex=5,
BackgroundColor3=Color3.fromRGB(67,67,67),
Size=UDim2.fromScale(0.36,1),
Position=UDim2.fromScale(-0.36,0.00185),
Children={
F,


i{
Name="Description",
ZIndex=5,
BackgroundTransparency=0.8,
Size=UDim2.fromScale(0.71053,0.18607),
Position=UDim2.fromScale(0.14208,0.32532),
Text=function()
return w()and w().Description or""
end,
TextColor3=Color3.fromRGB(255,255,255),
Children={
j{
Padding=UDim.new(0.1,0),
},
},
},


i{
Name="Status",
ZIndex=5,
Text=function()
const G={
[s]=m:Color("WORKING",Color3.fromRGB(0,255,0)),
[u]=m:Color("OUTDATED",Color3.fromRGB(255,255,0)),
[t]=m:Color("NOT WORKING",Color3.fromRGB(255,0,0))
}
return w()and G[w().Status]or""
end,
Bold=true,
TextColor3=Color3.fromRGB(0,255,0),
BackgroundTransparency=1,
Size=UDim2.fromScale(0.59292,0.05907),
Position=UDim2.fromScale(0.20334,0.51299),
},


i{
Name="Title",
ZIndex=5,
Text=function()
return w()and w().Title or""
end,
Bold=true,
BackgroundTransparency=1,
Size=UDim2.fromScale(0.81409,0.15697),
Position=UDim2.fromScale(0.09296,0.11951),
},


popupButton{
Name="CopyScript",
Text="Copy Script",
ZIndex=5,
Position=UDim2.fromScale(0.25563,0.76031),
Size=UDim2.fromScale(0.48584,0.09407),
BackgroundColor3=Color3.fromRGB(86,171,0),
TextColor3=Color3.fromRGB(0,0,0),
MouseButton1Click=y,
},


popupButton{
Name="RunScript",
Text="Run",
ZIndex=5,
Position=UDim2.fromScale(0.25563,0.63067),
Size=UDim2.fromScale(0.48584,0.09407),
BackgroundColor3=Color3.fromRGB(43,71,255),
TextColor3=Color3.fromRGB(0,0,0),
Children={
n.create"UICorner"{},
j{
PaddingHorizontal=UDim.new(0.3,0),
},
},
MouseButton1Click=z,
},
},
}

local H=b:Create(G,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),{
Position=UDim2.fromScale(0,0),
})
local I=b:Create(F,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),{
Position=UDim2.fromScale(1.072,0.5),
Rotation=180,
})
const J=Color3.fromRGB(56,172,108)
local K=G.Position
local L=F.Position

local M
local N=false
local function listItem(O)
const P=O.Details.GameId and O.Details.GameId==game.GameId
local Q=h{
Bold=true,
Name=O.Name,
Text=O.Details.Text,
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundColor3=Color3.fromRGB(255,255,255),
TextColor3=Color3.fromRGB(0,0,0),
FontFace=Font.new("rbxasset://fonts/families/RobotoCondensed.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal),
Size=UDim2.fromScale(0.802,0.04627),
Children={
j{
PaddingTop=UDim.new(0.3,0),
PaddingBottom=UDim.new(0.3,0),
PaddingLeft=UDim.new(0.04,0),
PaddingRight=UDim.new(0.3,0),
},
n.create"UICorner"{},
k{
Thickness=.05,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border
}
},
}
if P then
Q.LayoutOrder=-1
Q.BackgroundColor3=J
end
Q.MouseButton1Click:Connect(function()
if w()==O.Details then return end
F.Rotation=0
w(O.Details)

F.Visible=true
local R=0.4
local S={
BackgroundColor3=Color3.fromRGB(42,70,255),
BackgroundTransparency=0.4,
}
local T={
BackgroundColor3=N and J or Color3.fromRGB(255,255,255),
BackgroundTransparency=0,
}

local U=b:Create(Q,TweenInfo.new(R,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),S)
local V
if M then
V=b:Create(M,TweenInfo.new(R,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),T)
end
task.delay(R,function()
U:Destroy()
if V then V:Destroy()end
end)
M=Q
N=P
if H.PlaybackState==Enum.PlaybackState.Playing or H.PlaybackState==Enum.PlaybackState.Completed then
U:Cancel()
if V then V:Cancel()end
H:Cancel()
G.Position=K
U:Play()
if V then V:Play()end
H:Play()
Q.Rotation=0
I:Play()
else
H:Play()
I:Play()
U:Play()
if V then V:Play()end
end
end)
return Q
end

local O=c{
Name="Selector",
BackgroundColor3=Color3.fromRGB(76,76,76),
BorderSizePixel=3,
BorderMode=Enum.BorderMode.Inset,
Size=UDim2.fromScale(0.895,0.048),
}


local P=e{
Name="Main",
Active=true,
ZIndex=3,
BackgroundTransparency=1,
ScrollingEnabled=false,
ScrollBarImageTransparency=1,
Size=UDim2.fromScale(0.32222,0.9746),
Position=UDim2.fromScale(0.02645,0.0254),
ScrollBarThickness=8,
Children={
O,

c{
Name="Buttons",
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Children={
n.create"UIListLayout"{
Padding=UDim.new(0.02,0),
SortOrder=Enum.SortOrder.LayoutOrder,
},
h{
Name="Scripts",
Bold=true,ZIndex=4,
Text="Scripts",
BackgroundColor3=Color3.fromRGB(76,76,76),
BackgroundTransparency=1,
Size=UDim2.fromScale(0.89506,0.04818),
},
h{
Name="Tools",
Bold=true,ZIndex=4,
Text="Tools",
BackgroundColor3=Color3.fromRGB(76,76,76),
BackgroundTransparency=1,
Size=UDim2.fromScale(0.89506,0.04818),
},
h{
Name="Settings",
Bold=true,ZIndex=4,
Text="Settings",
BackgroundColor3=Color3.fromRGB(76,76,76),
BackgroundTransparency=1,
Size=UDim2.fromScale(0.89506,0.04818),
},
h{
Name="Moresoon",
Bold=true,ZIndex=4,
Text="More coming soon",
BackgroundColor3=Color3.fromRGB(76,76,76),
BackgroundTransparency=1,
Size=UDim2.fromScale(0.89506,0.04818),
},
},
},
},
}


local Q=searchBox{Visible=false}


local R=n.create"Folder"{
Name="Tools",
Q,
scrollList{
Visible=false,
Children=(function()
local R={}
for S,T in v.Tools do
table.insert(R,listItem{
Name=S,
Details=T,
})
end
return R
end)(),
},
}


local S=searchBox{}


local T=n.create"Folder"{
Name="Scripts",
S,
scrollList{
Children=(function()
local T={}
for U,V in v.Scripts do
table.insert(T,listItem{
Name=U,
Details=V,
})
end
return T
end)(),
},
}


local U=n.create"Folder"{
Name="Settings",
c{
Name="Scroll",
Visible=false,
ZIndex=4,
Size=UDim2.fromScale(0.4441,0.13943),
Position=UDim2.fromScale(0.43515,0.17286),
Children={
i{
Name="Skip",
ZIndex=4,
Text="Fast Intro",
TextColor3=Color3.fromRGB(0,0,0),
Size=UDim2.fromScale(0.49731,0.52097),
Position=UDim2.fromScale(0.03317,0.18866),
BackgroundColor3=Color3.fromRGB(255,255,255),
},
h{
Name="SkipButton",
ZIndex=4,
Text="",
TextColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(33,116,152),
Size=UDim2.fromScale(0.3,0.6),
Position=UDim2.fromScale(0.62772,0.16171),
Children={
k{
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
},
},
},
},
},
}


local V=c{
Name="Background",
ZIndex=3,
BackgroundColor3=Color3.fromRGB(131,131,131),
ClipsDescendants=true,
Size=UDim2.fromScale(1,0),
Position=UDim2.fromScale(0.5,1),
AnchorPoint=Vector2.new(0.5,0),
Children={
G,

c{
Name="OtherBackground",
ZIndex=3,
BackgroundColor3=Color3.fromRGB(0,0,0),
BackgroundTransparency=0.9,
Size=UDim2.fromScale(0.36,1),
Children={
k{Thickness=.01},
},
},
P,

c{
Name="dontusethis",
ZIndex=4,
BackgroundTransparency=0.9,
Size=UDim2.fromScale(0.59355,0.79593),
Position=UDim2.fromScale(0.38895,0.14791),
Children={
k{
Enabled=false,
Thickness=.02,
},
},
},
k{Thickness=.005},
R,
T,
U,
},
}


local W=c{
Name="MainFrame",
Active=true,
BackgroundColor3=Color3.fromRGB(100,100,100),
Size=UDim2.fromScale(0.06,0.00163),
Position=UDim2.fromScale(0.5,0.65),
AnchorPoint=Vector2.new(0.5,1),
Children={
E,
k{Thickness=.02},
V,
},
}

A=n.create"ScreenGui"{
IgnoreGuiInset=true,
ResetOnSpawn=false,
Name="BeanzHub",
W,
}


local X="BeanzHub/"
local Y="Main.json"
local Z=o:new(X..Y,
{
FastIntro=true
})

local _=1
if Z.loadedConfig.FastIntro then
_=0
U.Scroll.SkipButton.BackgroundTransparency=0
end
E.TextLabel.Visible=false
V.UIStroke.Enabled=false

local function introAnim()
local aa=TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false)
local ab=b:Create(W,aa,{Size=UDim2.fromScale(W.Size.X.Scale,0.103)})
ab:Play()
ab:GetPropertyChangedSignal"PlaybackState":Connect(function()
if ab.PlaybackState==Enum.PlaybackState.Completed then
task.wait(0.4*_)
b:Create(W,aa,{Size=UDim2.fromScale(0.34,0.103)}):Play()
b:Create(E.ImageLabel,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),{
Position=UDim2.fromScale(-0.4,0),
Rotation=-360,
}):Play()
task.wait(0.4*_)
E.TextLabel.Visible=true
b:Create(E.TextLabel,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),{
Position=UDim2.fromScale(0,0),
}):Play()
task.wait(0.8*_)
local ac=Color3.fromRGB(255,0,0)
local ad=Color3.fromRGB(42,70,255)
task.wait(0.4*_)
x("Beanz"..m:Color("z",ac))
task.wait(0.4*_)
x("Beanz"..m:Color("zz",ac))
task.wait(0.2*_)
x("Beanz"..m:Color("zz",ac))
task.wait(0.2*_)
x("Beanz"..m:Color("z",ac))
task.wait(0.2*_)
x"Beanz"
task.wait(0.4*_)
x("Beanz"..m:Color("H",ad))
task.wait(0.2*_)
x("Beanz"..m:Color("HU",ad))
task.wait(0.2*_)
x("Beanz"..m:Color("HUB",ad))
task.wait(0.3*_)
b:Create(W,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),{
Position=r,
Size=q,
}):Play()
task.wait(0.4*_)
b:Create(V,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),{
Size=p,
}):Play()
V.UIStroke.Enabled=true
task.wait(0.4*_)

E.Delete.Visible=true
end
end)
end


for aa,ab in game:GetService"CoreGui":GetChildren()do
if A.Name==ab.Name then
if A==ab then continue end
ab:Destroy()
end
end


l(W)


introAnim()


E.Delete.MouseButton1Click:Connect(function()
A:Destroy()
end)


local aa="Scripts"
F.Visible=false


local ab=b:Create(G,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),{
Position=K,
})
local ac=b:Create(F,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),{
Position=L,
Rotation=-180,
})

ac:GetPropertyChangedSignal"PlaybackState":Connect(function()
if ac.PlaybackState==Enum.PlaybackState.Completed then
F.Rotation=0
end
end)


local ad=0.068

local function sendselector(ae,af)
local ag={Position=af}
local ah=b:Create(ae,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),ag)
ah:Play()
task.wait(0.2)
ah:Destroy()
end

for ae,af in ipairs(P.Buttons:GetChildren())do
if af:IsA"TextButton"then
af.MouseButton1Up:Connect(function()
if aa==af.Name then return end
aa=af.Name
local ag=ae-2
local ah=UDim2.fromScale(0,ad*ag)
sendselector(O,ah)
for ai,aj in V:GetChildren()do
if aj:IsA"Folder"then
local ak=aj:FindFirstChild"TextBox"~=nil
aj.Scroll.Visible=false
if ak then
aj.TextBox.Visible=false
end
if aa==aj.Name then
aj.Scroll.Visible=true
if ak then
aj.TextBox.Visible=true
end
end
end
end
end)
end
end


F.MouseButton1Click:Connect(function()
ab:Play()
ac:Play()
w(nil)
if M then
local ae=b:Create(M,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false),{
BackgroundColor3=N and J or Color3.fromRGB(255,255,255),
BackgroundTransparency=0,
})
ae:Play()
end
M=nil
task.wait(0.2)
F.Visible=false
end)


U.Scroll.SkipButton.MouseButton1Click:Connect(function()
if U.Scroll.SkipButton.BackgroundTransparency==0 then
Z:AppendConfig{FastIntro=false}
U.Scroll.SkipButton.BackgroundTransparency=1
else
Z:AppendConfig{FastIntro=true}
U.Scroll.SkipButton.BackgroundTransparency=0
end
end)

return A
end,game:GetService"CoreGui")

return A.MainFrame