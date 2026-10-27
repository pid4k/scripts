type Easing__DARKLUA_TYPE_a=
|"linear"
|"instant"
|"smoothstep"
|"sineIn"
|"sineOut"
|"sineInOut"
|"backIn"
|"backOut"
|"backInOut"
|"quadIn"
|"quadOut"
|"quadInOut"
|"quartIn"
|"quartOut"
|"quartInOut"
|"quintIn"
|"quintOut"
|"quintInOut"
|"bounceIn"
|"bounceOut"
|"bounceInOut"
|"elasticIn"
|"elasticOut"
|"elasticInOut"
|"expoIn"
|"expoOut"
|"expoInOut"
|"circIn"
|"circOut"
|"circInOut"
|"cubicIn"
|"cubicOut"
|"cubicInOut"

type AnimatablePrimitive__DARKLUA_TYPE_b=number|vector|Vector3

type AnimatableType__DARKLUA_TYPE_c=AnimatablePrimitive__DARKLUA_TYPE_b|Vector2|CFrame|Color3|UDim|UDim2|Rect

type Animatable__DARKLUA_TYPE_d=AnimatableType__DARKLUA_TYPE_c|{[any]:AnimatablePrimitive__DARKLUA_TYPE_b}

type Animatable__DARKLUA_TYPE_e=Animatable__DARKLUA_TYPE_d
type Scheduler__DARKLUA_TYPE_f<State> ={
states:{State},
update:(state:State,time:number)->any,
step:(deltaTime:number)->(),
add:(state:State)->(),
remove:(state:State)->(),
clear:()->(),
}

type FireSignal__DARKLUA_TYPE_g<T...> =(T...)->()

type SubscribeSignal__DARKLUA_TYPE_h<T...> =(callback:FireSignal__DARKLUA_TYPE_g<T...>)->()->()

type Animatable__DARKLUA_TYPE_i=Animatable__DARKLUA_TYPE_d
type Easing__DARKLUA_TYPE_j=Easing__DARKLUA_TYPE_a
type TweenState__DARKLUA_TYPE_k<Value=any> ={
position:Value,
from:Value,
goal:Value,
easingFunction:(number)->number,
duration:number,
repeats:number,
reverses:boolean,
elapsed:number,
started:boolean,
complete:boolean,
onChange:SubscribeSignal__DARKLUA_TYPE_h<(Value,number)>,
fireChange:FireSignal__DARKLUA_TYPE_g<(Value,number)>,
onComplete:SubscribeSignal__DARKLUA_TYPE_h<Value>,
fireComplete:FireSignal__DARKLUA_TYPE_g<Value>,
}

type TweenOptions__DARKLUA_TYPE_l<Value=any> ={
start:boolean?,
easing:Easing__DARKLUA_TYPE_j?,
duration:number?,
repeats:number?,
reverses:boolean?,
position:Value?,
}

type Tween__DARKLUA_TYPE_m<Value=any> ={
state:TweenState__DARKLUA_TYPE_k<Value>,

setPosition:(self:Tween__DARKLUA_TYPE_m<Value>,value:Value)->(),
setGoal:(self:Tween__DARKLUA_TYPE_m<Value>,value:Value,options:TweenOptions__DARKLUA_TYPE_l<Value>?)->(),

getPosition:(self:Tween__DARKLUA_TYPE_m<Value>)->Value,
getFrom:(self:Tween__DARKLUA_TYPE_m<Value>)->Value,
getGoal:(self:Tween__DARKLUA_TYPE_m<Value>)->Value,

onChange:(self:Tween__DARKLUA_TYPE_m<Value>,callback:(value:Value,deltaTime:number)->())->()->(),
onComplete:(self:Tween__DARKLUA_TYPE_m<Value>,callback:(value:Value)->())->()->(),

step:(self:Tween__DARKLUA_TYPE_m<Value>,deltaTime:number)->Value,
idle:(self:Tween__DARKLUA_TYPE_m<Value>)->boolean,
configure:(self:Tween__DARKLUA_TYPE_m<Value>,options:TweenOptions__DARKLUA_TYPE_l<Value>)->(),

start:(self:Tween__DARKLUA_TYPE_m<Value>)->(),
stop:(self:Tween__DARKLUA_TYPE_m<Value>)->(),
destroy:(self:Tween__DARKLUA_TYPE_m<Value>)->(),

resumeFromCurrentPosition:(self:Tween__DARKLUA_TYPE_m<Value>)->(),
}

type Components__DARKLUA_TYPE_n={number|vector|Vector3}

type Intermediate__DARKLUA_TYPE_o<T=any> ={
components:Components__DARKLUA_TYPE_n,
value:T,
dirty:boolean?,
encode:(components:Components__DARKLUA_TYPE_n,value:T)->(),
decode:(components:Components__DARKLUA_TYPE_n)->T,
}

type Animatable__DARKLUA_TYPE_p=Animatable__DARKLUA_TYPE_d
type Intermediate__DARKLUA_TYPE_q<Value> =Intermediate__DARKLUA_TYPE_o<Value>

type SpringState__DARKLUA_TYPE_r<Value=any> ={
position:Intermediate__DARKLUA_TYPE_o<Value>,
velocity:Intermediate__DARKLUA_TYPE_o<Value>,
goal:Intermediate__DARKLUA_TYPE_o<Value>,
dampingRatio:number,
frequency:number,
restPosition:number,
restVelocity:number,
started:boolean,
complete:boolean,
onChange:SubscribeSignal__DARKLUA_TYPE_h<(Value,number)>,
fireChange:FireSignal__DARKLUA_TYPE_g<(Value,number)>,
onComplete:SubscribeSignal__DARKLUA_TYPE_h<Value>,
fireComplete:FireSignal__DARKLUA_TYPE_g<Value>,
}

type SpringOptions__DARKLUA_TYPE_s<Value=any> ={
start:boolean?,
tension:number?,
friction:number?,
mass:number?,
dampingRatio:number?,
frequency:number?,
precision:number?,
restVelocity:number?,
position:Value?,
velocity:Value?,
impulse:Value?,
}

type Spring__DARKLUA_TYPE_t<Value=any> ={
state:SpringState__DARKLUA_TYPE_r<Value>,

setPosition:(self:Spring__DARKLUA_TYPE_t<Value>,value:Value)->(),
setVelocity:(self:Spring__DARKLUA_TYPE_t<Value>,value:Value)->(),
setGoal:(self:Spring__DARKLUA_TYPE_t<Value>,value:Value,options:SpringOptions__DARKLUA_TYPE_s<Value>?)->(),

getPosition:(self:Spring__DARKLUA_TYPE_t<Value>)->Value,
getVelocity:(self:Spring__DARKLUA_TYPE_t<Value>)->Value,
getGoal:(self:Spring__DARKLUA_TYPE_t<Value>)->Value,

onChange:(self:Spring__DARKLUA_TYPE_t<Value>,callback:(value:Value,deltaTime:number)->())->()->(),
onComplete:(self:Spring__DARKLUA_TYPE_t<Value>,callback:(value:Value)->())->()->(),

step:(self:Spring__DARKLUA_TYPE_t<Value>,deltaTime:number)->Value,
impulse:(self:Spring__DARKLUA_TYPE_t<Value>,amount:Value)->(),
halt:(self:Spring__DARKLUA_TYPE_t<Value>)->(),
idle:(self:Spring__DARKLUA_TYPE_t<Value>)->boolean,
configure:(self:Spring__DARKLUA_TYPE_t<Value>,options:SpringOptions__DARKLUA_TYPE_s<Value>)->(),

start:(self:Spring__DARKLUA_TYPE_t<Value>)->(),
stop:(self:Spring__DARKLUA_TYPE_t<Value>)->(),
destroy:(self:Spring__DARKLUA_TYPE_t<Value>)->(),

scheduleUpdate:(self:Spring__DARKLUA_TYPE_t<Value>)->(),
}

type SpringOptions__DARKLUA_TYPE_u=SpringOptions__DARKLUA_TYPE_s
type SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_v<T> ={
cache:T,
[number]:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>
}

type Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T> ={
cache:T,
effect:((T)->T)|false,
cleanups:{()->()}|false,

context:{[number]:unknown}|false,

owned:{Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>}|false,
owner:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>|false,

parents:{SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_v<T>},
[number]:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>
}

type Node__DARKLUA_TYPE_c__DARKLUA_TYPE_x<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>

type Node__DARKLUA_TYPE_d__DARKLUA_TYPE_y<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>

type userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z={__USERDATA:true}

type ProxyMT__DARKLUA_TYPE_f__DARKLUA_TYPE_A={
proxy:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z,
data:Data__DARKLUA_TYPE_g__DARKLUA_TYPE_B,
__index:any,
__newindex:any
}

type Data__DARKLUA_TYPE_g__DARKLUA_TYPE_B={
name:string,
parent:Data__DARKLUA_TYPE_g__DARKLUA_TYPE_B?,
children:{Data__DARKLUA_TYPE_g__DARKLUA_TYPE_B},
changed:{[string]:RBXScriptSignal},
properties:{[string]:unknown},
destroying:RBXScriptSignal,
class:string,
type:"Instance"
}

type Node__DARKLUA_TYPE_h__DARKLUA_TYPE_C<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>

type Action__DARKLUA_TYPE_i__DARKLUA_TYPE_D={
priority:number,
callback:(Instance)->()
}

type Node__DARKLUA_TYPE_j__DARKLUA_TYPE_E<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>

type Array__DARKLUA_TYPE_k__DARKLUA_TYPE_F<V> ={V}

type ArrayOrV__DARKLUA_TYPE_l__DARKLUA_TYPE_G<V> ={ArrayOrV__DARKLUA_TYPE_l__DARKLUA_TYPE_G<V>}|V

type Map__DARKLUA_TYPE_m__DARKLUA_TYPE_H<K,V> ={[K]:V}

type Cache__DARKLUA_TYPE_n__DARKLUA_TYPE_I={

events:Array__DARKLUA_TYPE_k__DARKLUA_TYPE_F<
|string
|(()->())
>,


actions:Map__DARKLUA_TYPE_m__DARKLUA_TYPE_H<
number,
Array__DARKLUA_TYPE_k__DARKLUA_TYPE_F<(Instance)->()>
>,


parent:unknown,


nested_debug:Map__DARKLUA_TYPE_m__DARKLUA_TYPE_H<
number,
Map__DARKLUA_TYPE_m__DARKLUA_TYPE_H<string,true>
>,



nested_stack:{{}|number}
}

type Instances__DARKLUA_TYPE_o__DARKLUA_TYPE_J={
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

type function Properties__DARKLUA_TYPE_p__DARKLUA_TYPE_K(instance:type?)
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

type Create__DARKLUA_TYPE_q__DARKLUA_TYPE_L=<Name>(Name|keyof<Instances__DARKLUA_TYPE_o__DARKLUA_TYPE_J>|"")->(Properties__DARKLUA_TYPE_p__DARKLUA_TYPE_K<index<Instances__DARKLUA_TYPE_o__DARKLUA_TYPE_J,Name>>)->index<Instances__DARKLUA_TYPE_o__DARKLUA_TYPE_J,Name>

type Node__DARKLUA_TYPE_r__DARKLUA_TYPE_M<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>

type Source__DARKLUA_TYPE_s__DARKLUA_TYPE_N<T> =(()->T)&((value:T)->T)

type Destroyable__DARKLUA_TYPE_t__DARKLUA_TYPE_O={destroy:(any)->()}|{Destroy:(any)->()}

type Disconnectable__DARKLUA_TYPE_u__DARKLUA_TYPE_P={disconnect:(any)->()}|{Disconnect:(any)->()}

type Node__DARKLUA_TYPE_v__DARKLUA_TYPE_Q<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>

type Node__DARKLUA_TYPE_w__DARKLUA_TYPE_R<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>

type Context__DARKLUA_TYPE_x__DARKLUA_TYPE_S<T> =(()->T)&(<U>(T,()->U)->U)

type Array__DARKLUA_TYPE_y__DARKLUA_TYPE_T<T> ={T}

type Map__DARKLUA_TYPE_z__DARKLUA_TYPE_U<K,V> ={[K]:V}

type Source__DARKLUA_TYPE_A__DARKLUA_TYPE_V<T> =()->T

type Component__DARKLUA_TYPE_B__DARKLUA_TYPE_W<T> =(Source__DARKLUA_TYPE_A__DARKLUA_TYPE_V<boolean>)->(T,...number)

type Array__DARKLUA_TYPE_C__DARKLUA_TYPE_X<T> ={T}

type Source__DARKLUA_TYPE_D__DARKLUA_TYPE_Y<T> =()->T

type Array__DARKLUA_TYPE_E__DARKLUA_TYPE_Z<T> ={T}

type Map__DARKLUA_TYPE_F__DARKLUA_TYPE__<K,V> ={[K]:V}

type Source__DARKLUA_TYPE_G__DARKLUA_TYPE_0<T> =()->T

type Array__DARKLUA_TYPE_H__DARKLUA_TYPE_1<T> ={T}

type Map__DARKLUA_TYPE_I__DARKLUA_TYPE_2<K,V> ={[K]:V}

type Source__DARKLUA_TYPE_J__DARKLUA_TYPE_3<T> =()->T

type Node__DARKLUA_TYPE_K__DARKLUA_TYPE_4<T> =Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>

type SourceNode__DARKLUA_TYPE_L__DARKLUA_TYPE_5<T> =SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_v<T>

type Animatable__DARKLUA_TYPE_M__DARKLUA_TYPE_6=number|CFrame|Color3|UDim|UDim2|Vector2|Vector3

type SpringState__DARKLUA_TYPE_N__DARKLUA_TYPE_7<T> ={
k:number,
c:number,

x0_123:vector,x0_456:vector,
x_123:vector,x_456:vector,
x1_123:vector,x1_456:vector,
v_123:vector,v_456:vector,

source_value:T
}

type SpringSettings__DARKLUA_TYPE_O__DARKLUA_TYPE_8<T> =({
position:T?,
velocity:T?,
impulse:T?
})->()

type TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_9<T> =(T)->(vector,vector)

type Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_aa<T> =(vector,vector)->T

type Source__DARKLUA_TYPE_R__DARKLUA_TYPE_ab<T> =Source__DARKLUA_TYPE_s__DARKLUA_TYPE_N<T>

type source__DARKLUA_TYPE_S__DARKLUA_TYPE_ac<T> =Source__DARKLUA_TYPE_R__DARKLUA_TYPE_ab<T>

type Context__DARKLUA_TYPE_T__DARKLUA_TYPE_ad<T> =Context__DARKLUA_TYPE_x__DARKLUA_TYPE_S<T>

type context__DARKLUA_TYPE_U__DARKLUA_TYPE_ae<T> =Context__DARKLUA_TYPE_T__DARKLUA_TYPE_ad<T>
type source__DARKLUA_TYPE_af<T> =source__DARKLUA_TYPE_S__DARKLUA_TYPE_ac<T>

type Source__DARKLUA_TYPE_ag<T> =Source__DARKLUA_TYPE_R__DARKLUA_TYPE_ab<T>

type context__DARKLUA_TYPE_ah<T> =context__DARKLUA_TYPE_U__DARKLUA_TYPE_ae<T>

type Context__DARKLUA_TYPE_ai<T> =Context__DARKLUA_TYPE_T__DARKLUA_TYPE_ad<T>

type Theme__DARKLUA_TYPE_aj={
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







































local b=math.pi
local c=1.70158
local d=c*1.525
local e=c+1
local g=(2*b)/3
local h=(2*b)/4.5

local function linear(i:number):number
return i
end

local function instant(i:number):number
return if i==0 then 0 else 1
end

local function smoothstep(i:number):number
return i*i*(3-2*i)
end

local function quadIn(i:number):number
return i*i
end

local function quadOut(i:number):number
return 1-(1-i)*(1-i)
end

local function quadInOut(i:number):number
return if i<0.5 then 2*i*i else 1-((-2*i+2)^2)/2
end

local function cubicIn(i:number):number
return i*i*i
end

local function cubicOut(i:number):number
return 1-(1-i)^3
end

local function cubicInOut(i:number):number
return if i<0.5 then 4*i*i*i else 1-((-2*i+2)^3)/2
end

local function quartIn(i:number):number
return i*i*i*i
end

local function quartOut(i:number):number
return 1-(1-i)^4
end

local function quartInOut(i:number):number
return if i<0.5 then 8*i*i*i*i else 1-((-2*i+2)^4)/2
end

local function quintIn(i:number):number
return i*i*i*i*i
end

local function quintOut(i:number):number
return 1-(1-i)^5
end

local function quintInOut(i:number):number
return if i<0.5 then 16*i*i*i*i*i else 1-((-2*i+2)^5)/2
end

local function sineIn(i:number):number
return 1-math.cos((i*b)/2)
end

local function sineOut(i:number):number
return math.sin((i*b)/2)
end

local function sineInOut(i:number):number
return-(math.cos(b*i)-1)/2
end

local function expoIn(i:number):number
return if i==0 then 0 else 2^(10*i-10)
end

local function expoOut(i:number):number
return if i==1 then 1 else 1-2^(-10*i)
end

local function expoInOut(i:number):number
return if i==0
then 0
elseif i==1 then 1
elseif i<0.5 then(2^(20*i-10))/2
else(2-(2^(-20*i+10)))/2
end

local function circIn(i:number):number
return 1-(1-(i^2))^0.5
end

local function circOut(i:number):number
return(1-(i-1)^2)^0.5
end

local function circInOut(i:number):number
return if i<0.5 then(1-(1-((2*i)^2))^0.5)/2 else(((1-((-2*i+2)^2))^0.5)+1)/2
end

local function backIn(i:number):number
return e*i*i*i-c*i*i
end

local function backOut(i:number):number
return 1+e*((i-1)^3)+c*((i-1)^2)
end

local function backInOut(i:number):number
return if i<0.5
then(((2*i)^2)*((d+1)*2*i-d))/2
else(((2*i-2)^2)*((d+1)*(i*2-2)+d)+2)/2
end

local function elasticIn(i:number):number
return if i==0 then 0 elseif i==1 then 1 else-(2^(10*i-10))*math.sin((i*10-10.75)*g)
end

local function elasticOut(i:number):number
return if i==0 then 0 elseif i==1 then 1 else(2^(-10*i))*math.sin((i*10-0.75)*g)+1
end

local function elasticInOut(i:number):number
return if i==0
then 0
elseif i==1 then 1
elseif i<0.5 then-((2^(20*i-10))*math.sin((20*i-11.125)*h))/2
else((2^(-20*i+10))*math.sin((20*i-11.125)*h))/2+1
end

local function bounceOut(i:number):number
local j=7.5625
local k=2.75

if i<1/k then
return j*i*i
elseif i<2/k then
i-=1.5/k
return j*i*i+0.75
elseif i<2.5/k then
i-=2.25/k
return j*i*i+0.9375
else
i-=2.625/k
return j*i*i+0.984375
end
end

local function bounceIn(i:number):number
return 1-bounceOut(1-i)
end

local function bounceInOut(i:number):number
return if i<0.5 then(1-bounceOut(1-2*i))/2 else(1+bounceOut(2*i-1))/2
end

return{
linear=linear,
instant=instant,
smoothstep=smoothstep,
quadIn=quadIn,
quadOut=quadOut,
quadInOut=quadInOut,
cubicIn=cubicIn,
cubicOut=cubicOut,
cubicInOut=cubicInOut,
quartIn=quartIn,
quartOut=quartOut,
quartInOut=quartInOut,
quintIn=quintIn,
quintOut=quintOut,
quintInOut=quintInOut,
sineIn=sineIn,
sineOut=sineOut,
sineInOut=sineInOut,
expoIn=expoIn,
expoOut=expoOut,
expoInOut=expoInOut,
circIn=circIn,
circOut=circOut,
circInOut=circInOut,
backIn=backIn,
backOut=backOut,
backInOut=backInOut,
elasticIn=elasticIn,
elasticOut=elasticOut,
elasticInOut=elasticInOut,
bounceIn=bounceIn,
bounceOut=bounceOut,
bounceInOut=bounceInOut,
}end function a.a():typeof(__modImpl())local b=a.cache.a if not b then b={c=__modImpl()}a.cache.a=b end return b.c end end do local function __modImpl()






















local function f(b:number):number
return if b>=0.0031308 then 1.055*b^(0.4166666666666667)-0.055 else 12.92*b
end

local function fInv(b:number):number
return if b>=0.04045 then((b+0.055)/(1.055))^2.4 else b/12.92
end

local function cbrt(b:number):number
return if b>=0 then b^(0.3333333333333333)else-(-b)^(0.3333333333333333)
end

local function fromSRGB(b:vector):vector

local c=vector.create(fInv(b.x),fInv(b.y),fInv(b.z))

local d=vector.create(
cbrt(vector.dot(vector.create(0.4122214708,0.5363325363,0.0514459929),c)),
cbrt(vector.dot(vector.create(0.2119034982,0.6806995451,0.1073969566),c)),
cbrt(vector.dot(vector.create(0.0883024619,0.2817188376,0.6299787005),c))
)

return vector.create(
vector.dot(vector.create(0.2104542553,0.7936177850,-4.0720468E-3),d),
vector.dot(vector.create(1.9779984951,-2.428592205,0.4505937099),d),
vector.dot(vector.create(0.0259040371,0.7827717662,-0.808675766),d)
)
end

local function toSRGB(b:vector):vector
local c=vector.create(
vector.dot(vector.create(1,0.3963377774,0.2158037573),b),
vector.dot(vector.create(1,-0.1055613458,-6.3854172799999995E-2),b),
vector.dot(vector.create(1,-8.94841775E-2,-1.291485548),b)
)

local d=c*c*c

local e=vector.create(
vector.dot(vector.create(4.0767416621,-3.3077115913,0.2309699292),d),
vector.dot(vector.create(-1.2684380046,2.6097574011,-0.3413193965),d),
vector.dot(vector.create(-4.1960863E-3,-0.7034186147,1.7076147010),d)
)


return vector.create(f(e.x),f(e.y),f(e.z))
end

return{
fromSRGB=fromSRGB,
toSRGB=toSRGB,
}end function a.b():typeof(__modImpl())local b=a.cache.b if not b then b={c=__modImpl()}a.cache.b=b end return b.c end end do local function __modImpl()







return{}end function a.c():typeof(__modImpl())local b=a.cache.c if not b then b={c=__modImpl()}a.cache.c=b end return b.c end end do local function __modImpl()

local b=a.b()a.c()




local function interpolate<T>(c:any,d:any,e:number):any
local g=typeof(c)

if g=="number"or g=="vector"or g=="Vector3"or g=="Vector2"then
return c+(d-c)*e
elseif g=="Color3"then
local h=b.fromSRGB(vector.create(c.R,c.G,c.B))
local i=b.fromSRGB(vector.create(d.R,d.G,d.B))
local j=vector.max(b.toSRGB(h+(i-h)*e),vector.zero)

return Color3.new(j.x,j.y,j.z)
elseif g=="UDim2"or g=="CFrame"then
return c:Lerp(d,e)
elseif g=="UDim"then
return UDim.new(math.lerp(c.Scale,d.Scale,e),math.lerp(c.Offset,d.Offset,e))
elseif g=="Rect"then
return Rect.new(
math.lerp(c.Min.X,d.Min.X,e),
math.lerp(c.Min.Y,d.Min.Y,e),
math.lerp(c.Max.X,d.Max.X,e),
math.lerp(c.Max.Y,d.Max.Y,e)
)
elseif g=="table"then
local h:{number|vector}=c

for i,j in d do
local k=c[i]

if not k then
continue
end

local l=k+(j-k)*e

if h[i]~=l then
if h==c then
h=table.clone(c)
end
h[i]=l
end
end

return h
else
error(`Unsupported type for interpolation: {g}`)
end
end

return interpolate::<T>(from:T,to:T,alpha:number)->T end function a.d():typeof(__modImpl())local b=a.cache.d if not b then b={c=__modImpl()}a.cache.d=b end return b.c end end do local function __modImpl()

local function merge<T>(b:any,c:any):T
local d=b

for e,g in c do
if b[e]==g then
continue
end

if d==b then
d=table.clone(b)
end

d[e]=g
end

return d
end

return merge end function a.e():typeof(__modImpl())local b=a.cache.e if not b then b={c=__modImpl()}a.cache.e=b end return b.c end end do local function __modImpl()










local function scheduler<State>(
b:string,
c:(state:State,time:number,remove:(State)->())->any
):Scheduler__DARKLUA_TYPE_f<State>
local d:{State}={}
local e=0
local g:RBXScriptConnection?

local function remove(h:State)
local i=table.find(d,h)

if i then
d[i]=d[e]
d[e]=nil
e-=1
end
end

local function step(h:number)
for i=e,1,-1 do
c(d[i],h,remove)
end
end

local function update(h:State,i:number)
return c(h,i,remove)
end

local function add(h:State)
if table.find(d,h)then
return
end

table.insert(d,h)
e+=1

if not game or g then
return
end

g=game:GetService"RunService".Heartbeat:Connect(function(i)
debug.profilebegin(`Ripple{b}`)
step(i)
debug.profileend()

if g and e==0 then
g:Disconnect()
g=nil
end
end)
end

local function clear()
table.clear(d)
e=0
end

return{
states=d,
update=update,
step=step,
add=add,
remove=remove,
clear=clear,
}
end

return scheduler end function a.f():typeof(__modImpl())local b=a.cache.f if not b then b={c=__modImpl()}a.cache.f=b end return b.c end end do local function __modImpl()

local b:thread?

local function run<T...>(c:thread,d:(T...)->(),...:T...)
b=nil
d(...)
b=c
end

local function runner()
while true do
run(coroutine.yield())
end
end

local function spawn<T...>(c:(T...)->(),...:T...)
local d=b or task.spawn(runner)
task.spawn(d,d,c,...)
end

local function call<T...>(c:(T...)->(),...:T...)
c(...)
end

return(if task then spawn else call)::typeof(spawn)end function a.g():typeof(__modImpl())local b=a.cache.g if not b then b={c=__modImpl()}a.cache.g=b end return b.c end end do local function __modImpl()

local b=a.g()




local function signal<T...>():(SubscribeSignal__DARKLUA_TYPE_h<T...>,FireSignal__DARKLUA_TYPE_g<T...>)
local c:{(...any)->()}={}
local d=0

local function subscribe(e:(T...)->()):()->()
table.insert(c,e)
d+=1

return function()
local g=table.find(c,e)

if g then
c[g]=c[d]
c[d]=nil
d-=1
end
end
end

local function fire(...:T...)
for e=d,1,-1 do
b(c[e],...)
end
end

return subscribe,fire
end

return signal end function a.h():typeof(__modImpl())local b=a.cache.h if not b then b={c=__modImpl()}a.cache.h=b end return b.c end end do local function __modImpl()

local b=a.a()
local c=a.d()
local d=a.e()
local e=a.f()
local g=a.h()a.c()























































local h={}::Tween__DARKLUA_TYPE_m<Animatable__DARKLUA_TYPE_i>
(h::any).__index=h

local function getAlpha(i:number,j:number,k:boolean):number
if j<0 then
j=math.huge
end

if j>1 and i>=1 then
if k then
return math.abs((i-1)%2-1)
elseif i<j then
return i%1
end
return 1
end

return i
end

local i=e("Tween",function<T>(i:TweenState__DARKLUA_TYPE_k<T>,j,k):T
if i.complete then
k(i)
return i.position
end

i.elapsed+=j

local l=math.clamp(i.elapsed/i.duration,0,i.repeats)

if l~=l then
l=i.repeats
end

local m=getAlpha(l,i.repeats,i.reverses)
local n=if m>0 and m<1 then i.easingFunction(m)else m
local o=c(i.from,i.goal,n)

i.position=o
i.fireChange(o,j)

if l==i.repeats then
k(i)
i.complete=true
i.fireComplete(o)
end

return o
end)

local function createTween<Value>(j:Value,k:TweenOptions__DARKLUA_TYPE_l<Value>?):Tween__DARKLUA_TYPE_m<Value>
local l:TweenOptions__DARKLUA_TYPE_l<Value> =k or{}
local m=l.position or j

local n,o=g()
local p,q=g()

local r:TweenState__DARKLUA_TYPE_k<Value> ={
position=m,
from=m,
goal=m,
easingFunction=b.linear,
duration=1,
repeats=1,
reverses=false,
elapsed=0,
started=false,
complete=true,
onChange=n,
fireChange=o,
onComplete=p,
fireComplete=q,
}

local s:Tween__DARKLUA_TYPE_m<Value> =setmetatable({
state=r,
},h)::any

s:configure(l)

if l.start then
s:start()
end

return s
end

function h.resumeFromCurrentPosition(j)
local k=j.state

k.complete=false
k.elapsed=0
k.from=k.position

if k.started then
i.add(k)
end
end

function h.start(j)
j.state.started=true

if not j.state.complete then
i.add(j.state)
end
end

function h.stop(j)
j.state.started=false
i.remove(j.state)
end

function h.idle(j):boolean
return j.state.complete
end

function h.step(j,k:number):Animatable__DARKLUA_TYPE_i
return i.update(j.state,k)
end

function h.configure(j,k:TweenOptions__DARKLUA_TYPE_l)
local l=j.state

l.easingFunction=b[k.easing]or l.easingFunction
l.duration=k.duration or l.duration
l.repeats=k.repeats or l.repeats
l.reverses=k.reverses or l.reverses

if k.position then
j:setPosition(k.position)
end

if not l.complete and l.elapsed~=0 then
j:resumeFromCurrentPosition()
end
end

function h.getPosition(j):Animatable__DARKLUA_TYPE_i
return j.state.position
end

function h.getFrom(j):Animatable__DARKLUA_TYPE_i
return j.state.from
end

function h.getGoal(j):Animatable__DARKLUA_TYPE_i
return j.state.goal
end

function h.setPosition(j,k:Animatable__DARKLUA_TYPE_i)
local l=if type(k)=="table"then d(j.state.position,k)else k

if j.state.position~=l then
j.state.position=l
j:resumeFromCurrentPosition()
j.state.fireChange(l,0)
end
end

function h.setGoal(j,k:Animatable__DARKLUA_TYPE_i,l:TweenOptions__DARKLUA_TYPE_l?)
if l then
j:configure(l)
end

local m=if type(k)=="table"then d(j.state.goal,k)else k

if j.state.goal~=m then
j.state.goal=m
j:resumeFromCurrentPosition()
end
end

function h.onChange(j,k:(value:Animatable__DARKLUA_TYPE_i,deltaTime:number)->()):()->()
return j.state.onChange(k)
end

function h.onComplete(j,k:(value:Animatable__DARKLUA_TYPE_i)->()):()->()
return j.state.onComplete(k)
end

function h.destroy(j)
j:stop()
end

return{
scheduler=i,
createTween=createTween,
}end function a.i():typeof(__modImpl())local b=a.cache.i if not b then b={c=__modImpl()}a.cache.i=b end return b.c end end do local function __modImpl()

local b=a.e()
local c=a.b()











local d:{[string]:(Components__DARKLUA_TYPE_n,any)->()}={
number=function(d:Components__DARKLUA_TYPE_n,e:number)
d[1]=e
end,
vector=function(d:Components__DARKLUA_TYPE_n,e:vector)
d[1]=e
end,
Vector3=function(d:Components__DARKLUA_TYPE_n,e:Vector3)
d[1]=e
end,
table=function(d:Components__DARKLUA_TYPE_n,e:{[any]:any})
for g,h in e do
d[g]=h
end
end,
Vector2=function(d:Components__DARKLUA_TYPE_n,e:Vector2)
d[1]=vector.create(e.X,e.Y,0)
end,
CFrame=function(d:Components__DARKLUA_TYPE_n,e:CFrame)
d[1]=e.Position
d[2]=e.XVector
d[3]=e.YVector
d[4]=e.ZVector
end,
Color3=function(d:Components__DARKLUA_TYPE_n,e:Color3)
d[1]=c.fromSRGB(vector.create(e.R,e.G,e.B))
end,
UDim=function(d:Components__DARKLUA_TYPE_n,e:UDim)
d[1]=vector.create(e.Scale,e.Offset,0)
end,
UDim2=function(d:Components__DARKLUA_TYPE_n,e:UDim2)
d[1]=vector.create(e.X.Scale,e.X.Offset,e.Y.Scale)
d[2]=e.Y.Offset
end,
Rect=function(d:Components__DARKLUA_TYPE_n,e:Rect)
d[1]=vector.create(e.Min.X,e.Min.Y,e.Max.X)
d[2]=e.Max.Y
end,
}

local e:{[string]:(components:{any})->any}={
number=function(e:{number}):number
return e[1]
end,
vector=function(e:{vector}):vector
return e[1]
end,
Vector3=function(e:{Vector3}):Vector3
return e[1]
end,
table=function(e:Components__DARKLUA_TYPE_n):Components__DARKLUA_TYPE_n
return table.clone(e)
end,
Vector2=function(e:{vector}):Vector2
local g=e[1]
return Vector2.new(g.x,g.y)
end,
CFrame=function(e:{Vector3}):CFrame
return CFrame.fromMatrix(e[1],e[2],e[3],e[4]):Orthonormalize()
end,
Color3=function(e:{vector}):Color3
local g=vector.max(c.toSRGB(e[1]),vector.zero)
return Color3.new(g.x,g.y,g.z)
end,
UDim=function(e:{vector}):UDim
local g=e[1]
return UDim.new(g.x,math.round(g.y))
end,
UDim2=function(e:{vector|number}):UDim2
local g=e[1]::vector
local h=e[2]::number
return UDim2.new(g.x,math.round(g.y),g.z,math.round(h))
end,
Rect=function(e:{vector|number}):Rect
local g=e[1]::vector
local h=e[2]::number
return Rect.new(g.x,g.y,g.z,h)
end,
}

local function create<T>(g:T):Intermediate__DARKLUA_TYPE_o<T>
local h=typeof(g)
local i:Components__DARKLUA_TYPE_n={}
local j=d[h]
local k=e[h]

if not j or not k then
error(`Unsupported type {h} for Ripple animation value`)
end

j(i,g)

return{
components=i,
value=g,
encode=j,
decode=k,
}
end

local function copy<T>(g:Intermediate__DARKLUA_TYPE_o<T>):Intermediate__DARKLUA_TYPE_o<T>
return{
components=table.clone(g.components),
value=g.value,
encode=g.encode,
decode=g.decode,
}
end

local function zero<T>(g:Intermediate__DARKLUA_TYPE_o<T>):Intermediate__DARKLUA_TYPE_o<T>
local h=g.components

for i in h do
h[i]*=0::any
end

g.dirty=true

return g
end

local function recomputeValue<T>(g:Intermediate__DARKLUA_TYPE_o<T>):T
local h=g.decode(g.components)
g.value=h
g.dirty=nil
return h
end

local function getValue<T>(g:Intermediate__DARKLUA_TYPE_o<T>):T
return if g.dirty then recomputeValue(g)else g.value
end

local function setValue<T>(g:Intermediate__DARKLUA_TYPE_o<T>,h:T):boolean
local i=getValue(g)

if type(h)=="table"then
h=b(i,h)
end

if h==i then
return false
end

g.encode(g.components,h)
g.value=h
g.dirty=nil

return true
end

local function addValue<T>(g:Intermediate__DARKLUA_TYPE_o<T>,h:T)
local i:Components__DARKLUA_TYPE_n={}

g.encode(i,h)

for j,k in i do
g.components[j]+=k::any
end

g.dirty=true
end

local function assign<T>(g:Intermediate__DARKLUA_TYPE_o<T>,h:Intermediate__DARKLUA_TYPE_o<T>)
for i,j in h.components do
g.components[i]=j
end

g.value=getValue(h)
g.dirty=nil
end

local function lerp<T>(g:Intermediate__DARKLUA_TYPE_o<T>,h:Intermediate__DARKLUA_TYPE_o<T>,i:Intermediate__DARKLUA_TYPE_o<T>,j:number)
for k,l in i.components do
local m=h.components[k]::any
g.components[k]=m+(l-m)*j
end

g.dirty=true
end

return{
create=create,
copy=copy,
zero=zero,
setValue=setValue,
addValue=addValue,
getValue=getValue,
recomputeValue=recomputeValue,
assign=assign,
lerp=lerp,
}end function a.j():typeof(__modImpl())local b=a.cache.j if not b then b={c=__modImpl()}a.cache.j=b end return b.c end end do local function __modImpl()

local b=a.j()
local c=a.f()
local d=a.h()a.c()





local e=b.getValue
local g=b.recomputeValue


























































local h=1e-3
local i=62.5

local j={}::Spring__DARKLUA_TYPE_t<Animatable__DARKLUA_TYPE_p>
(j::any).__index=j

local function belowThreshold(k:number|vector,l:number):boolean
if type(k)=="number"then
return math.abs(k)<=l
else
local m=vector.abs(k)
return math.max(m.x,m.y,m.z)<=l
end
end

local k=c("Spring",function<T>(k:SpringState__DARKLUA_TYPE_r<T>,l,m):T
if k.complete then
m(k)
return e(k.position)
end

local n=k.position
local o=k.velocity
local p=k.goal
local q=k.restPosition
local r=k.restVelocity
local s=k.dampingRatio
local t=k.frequency*2*math.pi
local u=math.exp(-l*s*t)
local v=true

local w=n.components::{vector}
local x=o.components::{vector}
local y=p.components::{vector}



if s==1 then
for z,A in w do
local B=x[z]
local C=y[z]
local D=A-C

local E=(B*l+D*(t*l+1))*u+C
local F=(B-t*l*(D*t+B))*u

if v then
v=belowThreshold(E-C,q)and belowThreshold(F,r)
end

w[z]=E
x[z]=F
end
elseif s<1 then
local z=(1-s*s)^0.5

local A=math.cos(t*z*l)
local B=math.sin(t*z*l)

local C
if z>1e-4 then
C=B/z
else
local D=l*t
C=D+((D*D)*(z*z)*(z*z)/20-z*z)*(D*D*D)/6
end

local D
if t*z>1e-4 then
D=B/(t*z)
else
local E=t*z
D=l+((l*l)*(E*E)*(E*E)/20-E*E)*(l*l*l)/6
end

for E,F in w do
local G=x[E]
local H=y[E]
local I=F-H

local J=(I*(A+s*C)+G*D)*u+H
local K=(G*(A-C*s)-I*(C*t))*u

if v then
v=belowThreshold(J-H,q)and belowThreshold(K,r)
end

w[E]=J
x[E]=K
end
else
local z=math.sqrt(s*s-1)

local A=-t*(s-z)
local B=-t*(s+z)

local C=math.exp(A*l)
local D=math.exp(B*l)

for E,F in w do
local G=x[E]
local H=y[E]
local I=F-H

local J=(G-I*A)/(2*t*z)
local K=C*(I-J)

local L=K+J*D+H
local M=K*A+J*D*B

if v then
v=belowThreshold(L-H,q)and belowThreshold(M,r)
end

w[E]=L
x[E]=M
end
end

local z=if not v then g(n)else e(p)

o.dirty=true
k.complete=v
k.fireChange(z,l)

if v then
m(k)
b.assign(n,p)
b.zero(o)
k.fireComplete(z)
end

return z
end)

local function createSpring<Value>(l:Value,m:SpringOptions__DARKLUA_TYPE_s<Value>?):Spring__DARKLUA_TYPE_t<Value>
local n:SpringOptions__DARKLUA_TYPE_s<Value> =m or{}
local o=b.create(n.position or l)

local p,q=d()
local r,s=d()

local t:SpringState__DARKLUA_TYPE_r<Value> ={
position=o,
velocity=b.zero(b.copy(o)),
goal=b.copy(o),
dampingRatio=1,
frequency=1,
restPosition=h,
restVelocity=h*i,
started=false,
complete=true,
onChange=p,
fireChange=q,
onComplete=r,
fireComplete=s,
}

local u:Spring__DARKLUA_TYPE_t<Value> =setmetatable({
state=t,
},j)::any

u:configure(n)

if n.start then
u:start()
end

return u
end

function j.scheduleUpdate(l)
l.state.complete=false

if l.state.started then
k.add(l.state)
end
end

function j.start(l)
l.state.started=true

if not l.state.complete then
k.add(l.state)
end
end

function j.stop(l)
l.state.started=false
k.remove(l.state)
end

function j.idle(l):boolean
return l.state.complete
end

function j.step(l,m:number):Animatable__DARKLUA_TYPE_p
return k.update(l.state,m)
end

function j.configure(l,m:SpringOptions__DARKLUA_TYPE_s)
local n=l.state

n.restPosition=m.precision or n.restPosition
n.restVelocity=m.restVelocity or n.restPosition*i

if m.dampingRatio or m.frequency then
n.dampingRatio=m.dampingRatio or n.dampingRatio
n.frequency=m.frequency or n.frequency
else
local o=m.tension or 170
local p=m.friction or 26
local q=m.mass or 1

n.dampingRatio=p/(2*(q*o)^0.5)
n.frequency=(o/q)^0.5/2/math.pi
end

if m.velocity then
l:setVelocity(m.velocity)
end

if m.impulse then
l:impulse(m.impulse)
end

if m.position then
l:setPosition(m.position)
end
end

function j.getPosition(l):Animatable__DARKLUA_TYPE_p
return b.getValue(l.state.position)
end

function j.getVelocity(l):Animatable__DARKLUA_TYPE_p
return b.getValue(l.state.velocity)
end

function j.getGoal(l):Animatable__DARKLUA_TYPE_p
return b.getValue(l.state.goal)
end

function j.setPosition(l,m:Animatable__DARKLUA_TYPE_p)
if b.setValue(l.state.position,m)then
l:scheduleUpdate()
l.state.fireChange(b.getValue(l.state.position),0)
end
end

function j.setVelocity(l,m:Animatable__DARKLUA_TYPE_p)
if b.setValue(l.state.velocity,m)then
l:scheduleUpdate()
end
end

function j.setGoal(l,m:Animatable__DARKLUA_TYPE_p,n:SpringOptions__DARKLUA_TYPE_s?)
if n then
l:configure(n)
end

if b.setValue(l.state.goal,m)then
l:scheduleUpdate()
end
end

function j.impulse(l,m:Animatable__DARKLUA_TYPE_p)
b.addValue(l.state.velocity,m)
l:scheduleUpdate()
end

function j.halt(l)
b.zero(l.state.velocity)
end

function j.onChange(l,m:(value:Animatable__DARKLUA_TYPE_p,deltaTime:number)->()):()->()
return l.state.onChange(m)
end

function j.onComplete(l,m:(value:Animatable__DARKLUA_TYPE_p)->()):()->()
return l.state.onComplete(m)
end

function j.destroy(l)
l:stop()
end

return{
scheduler=k,
createSpring=createSpring,
}end function a.k():typeof(__modImpl())local b=a.cache.k if not b then b={c=__modImpl()}a.cache.k=b end return b.c end end do local function __modImpl()a.k()





return{
default={tension=170,friction=26}::SpringOptions__DARKLUA_TYPE_u,
gentle={tension=120,friction=14}::SpringOptions__DARKLUA_TYPE_u,
wobbly={tension=180,friction=12}::SpringOptions__DARKLUA_TYPE_u,
stiff={tension=210,friction=20}::SpringOptions__DARKLUA_TYPE_u,
slow={tension=280,friction=60}::SpringOptions__DARKLUA_TYPE_u,
molasses={tension=280,friction=120}::SpringOptions__DARKLUA_TYPE_u,
figmaGentle={tension=100,friction=15}::SpringOptions__DARKLUA_TYPE_u,
figmaQuick={tension=300,friction=20}::SpringOptions__DARKLUA_TYPE_u,
figmaBouncy={tension=600,friction=15}::SpringOptions__DARKLUA_TYPE_u,
figmaSlow={tension=80,friction=20}::SpringOptions__DARKLUA_TYPE_u,
}end function a.l():typeof(__modImpl())local b=a.cache.l if not b then b={c=__modImpl()}a.cache.l=b end return b.c end end do local function __modImpl()

const b=a.i()
const c=a.k()
const d=a.l()

const e={
duration=0.18,
easing="quadOut",
}

const g={
createTween=b.createTween,
createSpring=c.createSpring,
config=d,
}

local function resolveOptions(h)
if h==nil then
return table.clone(e)
end

const i=table.clone(e)
for j,k in h do
i[j]=k
end
return i
end

function g.Tween(h,i,j,k)
const l=resolveOptions(j)
const m={}
const n={}
local o=0
local p=false
local q=false

local function release()
for r,s in n do
s()
end
table.clear(n)

for r,s in m do
s:destroy()
end
table.clear(m)
end

local function complete()
if p or q then
return
end
p=true
release()
if k then
k()
end
end

for r,s in i do
const t=h[r]
if t==s then
continue
end

const u=g.createTween(t,l)
table.insert(m,u)
o+=1

table.insert(n,u:onChange(function(v)
h[r]=v
end))
u:onComplete(function()
o-=1
if o==0 then
complete()
end
end)

u:setGoal(s)
end

if o==0 then
p=true
if k then
k()
end
return function()end
end

for r,s in m do
s:start()
end

return function()
if p or q then
return
end
q=true
release()
end
end

return g end function a.m():typeof(__modImpl())local b=a.cache.m if not b then b={c=__modImpl()}a.cache.m=b end return b.c end end do local function __modImpl()


















































































































































































































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




















local d={n=0}::{[number]:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<any>,n:number}

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

local function get_scope():Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<unknown>?
return d[d.n]
end

local function assert_stable_scope():Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<unknown>
local e=get_scope()

if not e then
local g=debug.info(2,"n")
return error(`cannot use {g}() outside a stable or reactive scope`,0)
elseif e.effect then
error("cannot create a new reactive scope inside another reactive scope",0)
end

return e
end

local function push_child<T>(e:SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_v<any>,g:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<any>)
table.insert(e,g)
table.insert(g.parents,e)
end

local function push_scope<T>(e:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>)
local g=d.n+1
d.n=g
d[g]=e
end

local function pop_scope()
local e=d.n
d.n=e-1
d[e]=nil
end

local function push_cleanup<T>(e:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>,g:()->())
if e.cleanups then
table.insert(e.cleanups,g)
else
e.cleanups={g}
end
end

local function flush_cleanups<T>(e:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>)
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

local function unparent<T>(e:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>)
local g=e.parents

for h,i in g do
find_and_swap_pop(i,e)
g[h]=nil
end
end

local function destroy<T>(e:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>)
if c.strict and table.find(d,e)then
error("attempt to destroy an active scope",0)
end

flush_cleanups(e)
unparent(e)

if e.owner then
find_and_swap_pop(e.owner.owned::{Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>},e)
e.owner=false
end

if e.owned then
local g=e.owned
while g[1]do destroy(g[1])end
end
end

local function destroy_owned<T>(e:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>)
if e.owned then
local g=e.owned
while g[1]do destroy(g[1])end
end
end

local e={n=0}::{n:number,[number]:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<any>}

local function evaluate_node<T>(g:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>)
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

local function queue_children_for_update<T>(g:SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_v<T>)
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

local function update_descendants<T>(g:SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_v<T>)
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

local function push_scope_as_child_of<T>(g:SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_v<T>)
local h=get_scope()
if h and h.effect then
push_child(g,h)
end
end

local function create_node<T>(g:false|Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<any>,h:false|((T)->T),i:T):Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>
local j:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T> ={
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

local function create_source_node<T>(g:T):SourceNode__DARKLUA_TYPE_a__DARKLUA_TYPE_v<T>
return{cache=g}
end

local function get_children<T>(g:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>):{Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<unknown>}
return{unpack(g)}::{Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<any>}
end

local function set_context<T>(g:Node__DARKLUA_TYPE_b__DARKLUA_TYPE_w<T>,h:number,i:unknown)
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

local e={}::{[Data__DARKLUA_TYPE_g__DARKLUA_TYPE_B]:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z?}
setmetatable(e::any,{__mode="v"})


local g,h

local function get_data(i:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z):Data__DARKLUA_TYPE_g__DARKLUA_TYPE_B
local function f(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z):ProxyMT__DARKLUA_TYPE_f__DARKLUA_TYPE_A
return getmetatable(j::any)
end

return f(i).data
end

local function get_proxy(i:Data__DARKLUA_TYPE_g__DARKLUA_TYPE_B):userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z
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

g=function(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z,k:string):()
local l=get_data(j)
return if i[k]then i[k]
elseif k=="Name"then l.name
elseif k=="Parent"then(l.parent and get_proxy(l.parent))
elseif k=="Destroying"then l.destroying
else l.properties[k]
end

h=function(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z,k:string,l:unknown)
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
m.parent=get_data(l::userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z)
table.insert(get_data(l::userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z).children,m)
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

function i.Clone(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z):userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z
local k=get_data(j)
local l=(d.new""::any)::userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z
local m=get_data(l)

for n,o in next,deep_clone(k)do
m[n]=o
end

return l
end

function i.FindFirstChild(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z,k:string):userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z?
local l=get_data(j)
for m,n in l.children do
if n.name==k then
return get_proxy(n)
end
end
return nil
end

function i.GetChildren(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z):{userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z}
local k=get_data(j).children
local l=table.create(#k)

for m,n in next,k do
l[m]=get_proxy(n)
end

return l
end

function i.GetPropertyChangedSignal(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z,k:string):RBXScriptSignal
local l=get_data(j)
if not l.changed[k]then
l.changed[k]=c.new()::any
end
return l.changed[k]
end

function i.Destroy(j:userdata__DARKLUA_TYPE_e__DARKLUA_TYPE_z)
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

local function action(d:(Instance)->(),e:number?):Action__DARKLUA_TYPE_i__DARKLUA_TYPE_D
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


































local i:Cache__DARKLUA_TYPE_n__DARKLUA_TYPE_I?

local function borrow_cache():Cache__DARKLUA_TYPE_n__DARKLUA_TYPE_I
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

local function return_cache(j:Cache__DARKLUA_TYPE_n__DARKLUA_TYPE_I)
i=j
end

local function process_properties(j:Map__DARKLUA_TYPE_m__DARKLUA_TYPE_H<unknown,unknown>,k:Instance,l:Cache__DARKLUA_TYPE_n__DARKLUA_TYPE_I,m:number)
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
e.children(k,o::()->ArrayOrV__DARKLUA_TYPE_l__DARKLUA_TYPE_G<Instance>)
elseif type(o)=="table"then
if h(o)then
table.insert(l.actions[(o::any).priority],(o::any).callback::()->())
elseif d.defer_nested_properties then
table.insert(l.nested_stack,o::{})
table.insert(l.nested_stack,m+1)
else
process_properties(o::Map__DARKLUA_TYPE_m__DARKLUA_TYPE_H<unknown,unknown>,k,l,m+1)
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





















































return create::Create__DARKLUA_TYPE_q__DARKLUA_TYPE_L end function b.k():typeof(__modImpl())local c=b.cache.k if not c then c={c=__modImpl()}b.cache.k=c end return c.c end end do local function __modImpl()

local c=b.b()

local d=c.create_source_node
local e=c.push_scope_as_child_of
local g=c.update_descendants



local function source<T>(h:T):Source__DARKLUA_TYPE_s__DARKLUA_TYPE_N<T>
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

return source::(<T>(initial_value:T)->Source__DARKLUA_TYPE_s__DARKLUA_TYPE_N<T>)&(<T>()->Source__DARKLUA_TYPE_s__DARKLUA_TYPE_N<T>)end function b.l():typeof(__modImpl())local c=b.cache.l if not c then c={c=__modImpl()}b.cache.l=c end return c.c end end do local function __modImpl()

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
((instance:Destroyable__DARKLUA_TYPE_t__DARKLUA_TYPE_O)->())&
((connection:Disconnectable__DARKLUA_TYPE_u__DARKLUA_TYPE_P)->())&
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

local function context<T>(...:T):Context__DARKLUA_TYPE_x__DARKLUA_TYPE_S<T>
k+=1
local l=k

local m=select("#",...)>0
local n=...

return function<T>(...):any
local o:(Node__DARKLUA_TYPE_w__DARKLUA_TYPE_R<unknown>?)|false=e()

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
h:Source__DARKLUA_TYPE_A__DARKLUA_TYPE_V<K>,
i:Map__DARKLUA_TYPE_z__DARKLUA_TYPE_U<K,Component__DARKLUA_TYPE_B__DARKLUA_TYPE_W<Obj>>
):Source__DARKLUA_TYPE_A__DARKLUA_TYPE_V<nil|Obj|Array__DARKLUA_TYPE_y__DARKLUA_TYPE_T<Obj>>
local j={}::Map__DARKLUA_TYPE_z__DARKLUA_TYPE_U<K,{
destroy:()->(),
object:Obj,
delay:number,
present:(boolean?)->boolean,
timeout:{cancel:boolean}?
}>

local k=d(nil::nil|Obj|Array__DARKLUA_TYPE_y__DARKLUA_TYPE_T<Obj>)
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

local function switch<K,Obj>(h:Source__DARKLUA_TYPE_A__DARKLUA_TYPE_V<K>):(map:Map__DARKLUA_TYPE_z__DARKLUA_TYPE_U<K,Component__DARKLUA_TYPE_B__DARKLUA_TYPE_W<Obj>>)->Source__DARKLUA_TYPE_A__DARKLUA_TYPE_V<nil|Obj|Array__DARKLUA_TYPE_y__DARKLUA_TYPE_T<Obj>>
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
h:Source__DARKLUA_TYPE_D__DARKLUA_TYPE_Y<T?>,
i:(Source__DARKLUA_TYPE_D__DARKLUA_TYPE_Y<T>,Source__DARKLUA_TYPE_D__DARKLUA_TYPE_Y<boolean>)->(Obj,...number),
j:((Source__DARKLUA_TYPE_D__DARKLUA_TYPE_Y<boolean>)->(Obj,...number))?
):Source__DARKLUA_TYPE_D__DARKLUA_TYPE_Y<nil|Obj|Array__DARKLUA_TYPE_C__DARKLUA_TYPE_X<Obj>>
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
h:Source__DARKLUA_TYPE_G__DARKLUA_TYPE_0<Map__DARKLUA_TYPE_F__DARKLUA_TYPE__<K,V>>,
i:(Source__DARKLUA_TYPE_G__DARKLUA_TYPE_0<V>,K,Source__DARKLUA_TYPE_G__DARKLUA_TYPE_0<boolean>)->(Obj,...number)
):Source__DARKLUA_TYPE_G__DARKLUA_TYPE_0<Array__DARKLUA_TYPE_E__DARKLUA_TYPE_Z<Obj>>
local j=0
local k={}::Map__DARKLUA_TYPE_F__DARKLUA_TYPE__<K,{
destroy:()->(),
object:Obj,
value:V?,
value_source:(V?)->V,
count:number,
delay:number,
present:(boolean?)->boolean,
timeout:{cancel:boolean}?,
}>

local l=d({}::Array__DARKLUA_TYPE_E__DARKLUA_TYPE_Z<Obj>)
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
i:Source__DARKLUA_TYPE_J__DARKLUA_TYPE_3<Map__DARKLUA_TYPE_I__DARKLUA_TYPE_2<K,V>>,
j:(V,Source__DARKLUA_TYPE_J__DARKLUA_TYPE_3<K>,Source__DARKLUA_TYPE_J__DARKLUA_TYPE_3<boolean>)->(Obj,...number)
):Source__DARKLUA_TYPE_J__DARKLUA_TYPE_3<Array__DARKLUA_TYPE_H__DARKLUA_TYPE_1<Obj>>
local k=0
local l={}::Map__DARKLUA_TYPE_I__DARKLUA_TYPE_2<V,{
destroy:()->(),
object:Obj,
index:K?,
index_source:(K?)->K,
count:number,
delay:number,
present:(boolean?)->boolean,
timeout:{cancel:boolean}?,
}>

local m=e({}::Array__DARKLUA_TYPE_H__DARKLUA_TYPE_1<Obj>)
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
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_9<number>,

CFrame=function(m)
return m.Position,vector.create(m:ToEulerAnglesXYZ())
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_9<CFrame>,

Color3=function(m)

return vector.create(m.R,m.G,m.B),vector.zero
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_9<Color3>,

UDim=function(m)
return vector.create(m.Scale,m.Offset,0),vector.zero
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_9<UDim>,

UDim2=function(m)
return vector.create(m.X.Scale,m.X.Offset,m.Y.Scale),vector.create(m.Y.Offset,0,0)
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_9<UDim2>,

Vector2=function(m)
return vector.create(m.X,m.Y,0),vector.zero
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_9<Vector2>,

Vector3=function(m)
return m,vector.zero
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_9<Vector3>,

Rect=function(m)
return vector.create(m.Min.X,m.Min.Y,m.Max.X),vector.create(m.Max.Y,0,0)
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_9<Rect>,

table=function(m)
return vector.create(m[1]or 0,m[2]or 0,m[3]or 0),vector.create(m[4]or 0,0,0)
end::TypeToVec6__DARKLUA_TYPE_P__DARKLUA_TYPE_9<{number}>
}

local n={
number=function(n,o)
return n.X
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_aa<number>,

CFrame=function(n,o)
return CFrame.new(n)*CFrame.fromEulerAnglesXYZ(o.X,o.Y,o.Z)
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_aa<CFrame>,

Color3=function(n)
return Color3.new(math.clamp(n.X,0,1),math.clamp(n.Y,0,1),math.clamp(n.Z,0,1))
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_aa<Color3>,

UDim=function(n)
return UDim.new(n.X,math.round(n.Y))
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_aa<UDim>,

UDim2=function(n,o)
return UDim2.new(n.X,math.round(n.Y),n.Z,math.round(o.X))
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_aa<UDim2>,

Vector2=function(n)
return Vector2.new(n.X,n.Y)
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_aa<Vector2>,

Vector3=function(n)
return n
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_aa<Vector3>,

Rect=function(n,o)
return Rect.new(n.X,n.Y,n.Z,o.X)
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_aa<Rect>,

table=function(n,o)
return{n.X,n.Y,n.Z,o.X}
end::Vec6ToType__DARKLUA_TYPE_Q__DARKLUA_TYPE_aa<{number}>
}

local o={
__index=function(o,p:string)
error(`cannot spring type {p}`,0)
end
}

setmetatable(m,o)
setmetatable(n,o)



local p:{[SpringState__DARKLUA_TYPE_N__DARKLUA_TYPE_7<unknown>]:SourceNode__DARKLUA_TYPE_L__DARKLUA_TYPE_5<unknown>}={}
setmetatable(p::any,{__mode="v"})

local function spring<T>(q:()->T,r:number?,s:number?):(()->T,SpringSettings__DARKLUA_TYPE_O__DARKLUA_TYPE_8<T>)
local t=g()


local u=2*math.pi/(r or 1)
local v=s or 1
local w=u^2
local x=2*u
local y=v*x



if y>k*2 then
error("spring damping too high, consider reducing damping or increasing period",0)
end

local z:SpringState__DARKLUA_TYPE_N__DARKLUA_TYPE_7<T> ={
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
end::SpringSettings__DARKLUA_TYPE_O__DARKLUA_TYPE_8<T>

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






return c end function a.n():typeof(__modImpl())local b=a.cache.n if not b then b={c=__modImpl()}a.cache.n=b end return b.c end end do local function __modImpl()
const b=a.n()

return function(c)
const d,e=b.root(c)
return d,e
end end function a.o():typeof(__modImpl())local b=a.cache.o if not b then b={c=__modImpl()}a.cache.o=b end return b.c end end do local function __modImpl()

const b=a.n()
const c=b.create

return function(d:Frame&{Children:{any}?})
const e=d.Children
d.Children=nil
return c"Frame"{
d,
e,
}
end end function a.p():typeof(__modImpl())local b=a.cache.p if not b then b={c=__modImpl()}a.cache.p=b end return b.c end end do local function __modImpl()
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
}end function a.q():typeof(__modImpl())local b=a.cache.q if not b then b={c=__modImpl()}a.cache.q=b end return b.c end end do local function __modImpl()
const b=a.q()

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
}end function a.r():typeof(__modImpl())local b=a.cache.r if not b then b={c=__modImpl()}a.cache.r=b end return b.c end end do local function __modImpl()
const b=a.n()
const c=a.r()
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
end end function a.s():typeof(__modImpl())local b=a.cache.s if not b then b={c=__modImpl()}a.cache.s=b end return b.c end end do local function __modImpl()
const b=a.n()
const c=a.r()
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
end end function a.t():typeof(__modImpl())local b=a.cache.t if not b then b={c=__modImpl()}a.cache.t=b end return b.c end end do local function __modImpl()
const b=a.n()
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
end end function a.u():typeof(__modImpl())local b=a.cache.u if not b then b={c=__modImpl()}a.cache.u=b end return b.c end end do local function __modImpl()
const b=a.n()
const c=b.create

return function(d:ScrollingFrame&{Children:{any}?})
const e=d.Children
d.Children=nil
return c"ScrollingFrame"{
d,
e,
}
end end function a.v():typeof(__modImpl())local b=a.cache.v if not b then b={c=__modImpl()}a.cache.v=b end return b.c end end do local function __modImpl()
const b=a.n()
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
end end function a.w():typeof(__modImpl())local b=a.cache.w if not b then b={c=__modImpl()}a.cache.w=b end return b.c end end do local function __modImpl()
const b=a.n()
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
end end function a.x():typeof(__modImpl())local b=a.cache.x if not b then b={c=__modImpl()}a.cache.x=b end return b.c end end do local function __modImpl()
const b={}
b.__index=b

function b.new(c,d)
c=c or{}

const e=setmetatable({
Type=d,
Name=c.Name or c.Text or d,
Flag=c.Flag or c.Name or c.Text,
Save=c.Save~=false,
Instance=nil,
Label=nil,
Tab=nil,
Window=nil,
Destroyed=false,
},b)

e._connections={}
e._cleanups={}

return e
end

function b.AddConnection(c,d:RBXScriptConnection):RBXScriptConnection
table.insert(c._connections,d)
return d
end

function b.AddCleanup(c,d:()->())
table.insert(c._cleanups,d)
end

function b.GetFlag(c):string?
return c.Flag
end

function b.SetFlag(c,d:string?)
if c.Flag==d then
return
end
if c.Window and c.Flag and c.Window.Elements[c.Flag]==c then
c.Window.Elements[c.Flag]=nil
end
c.Flag=d
if c.Window and d then
c.Window.Elements[d]=c
end
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

function b.SetText(c,d:string)
c.Label.Text=d
end

function b.SetVisible(c,d:boolean)
c.Instance.Visible=d
end

function b.IsVisible(c):boolean
return c.Instance.Visible
end

function b.ToggleVisible(c)
c:SetVisible(not c:IsVisible())
end

function b.Destroy(c)
if c.Destroyed then
return
end
c.Destroyed=true

for d,e in c._connections do
e:Disconnect()
end
table.clear(c._connections)

for d,e in c._cleanups do
e()
end
table.clear(c._cleanups)

if c.Window and c.Flag and c.Window.Elements[c.Flag]==c then
c.Window.Elements[c.Flag]=nil
end

if c.Instance then
c.Instance:Destroy()
c.Instance=nil
end
end

return b end function a.y():typeof(__modImpl())local b=a.cache.y if not b then b={c=__modImpl()}a.cache.y=b end return b.c end end do local function __modImpl()

const b=a.n()
const c=a.o()
const d=a.s()
const e=a.t()
const g=a.x()
const h=a.y()

const i=40

return function(j,k,l)
k=k or{}

const m=h.new(k,"Button")
m.Callback=k.Callback
m.Window=l

const n=b.source(false)
const o=b.source(k.Active==true)

const p,q=c(function()
const p=k.Height or i

const q=d{
Parent=j,
AutoButtonColor=false,
Name=m.Name,
Size=UDim2.new(1,0,0,p),
BackgroundColor3=function()
if k.Color then
return k.Color
end
const q=l:GetTheme()
return if n()
then(q.ElementHoverBackground or q.ElementBackground)
else q.ElementBackground
end,
BackgroundTransparency=0,
BorderSizePixel=0,
Text="",
TextScaled=false,
ClipsDescendants=true,
ZIndex=1,
}

b.create"UICorner"{
Parent=q,
CornerRadius=UDim.new(0,6),
}

const r=e{
Parent=q,
BackgroundTransparency=1,
Name="Title",
Text=k.Text or k.Name or"Button",
TextSize=14,
TextScaled=false,
FontFace=function()
return l:GetTheme().MainFont
end,
TextColor3=function()
return l:GetTheme().TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,
Size=UDim2.new(1,-44,1,0),
Position=UDim2.fromOffset(12,0),
ZIndex=2,
}

e{
Parent=q,
BackgroundTransparency=1,
Name="Icon",
Text=">",
TextSize=14,
TextScaled=false,
FontFace=function()
return l:GetTheme().MainFont
end,
TextColor3=function()
const s=l:GetTheme()
return s.TextSecondaryColor or s.TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Center,
Size=UDim2.fromOffset(24,p),
Position=UDim2.new(1,-32,0,0),
ZIndex=2,
}

const s=g{
Parent=q,
Color=function()
const s=l:GetTheme()
return if o()then s.AccentColor else s.ElementStroke
end,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}

return{
Row=q,
Title=r,
Stroke=s,
}
end)

function m.SetCallback(r,s)
m.Callback=s
end

function m.IsActive(r):boolean
return o()
end

function m.SetActive(r,s:boolean)
o(s==true)
end

function m.Toggle(r)
m:SetActive(not o())
end

m:AddConnection(q.Row.MouseEnter:Connect(function()
n(true)
end))
m:AddConnection(q.Row.MouseLeave:Connect(function()
n(false)
end))
m:AddConnection(q.Row.MouseButton1Click:Connect(function()
if m.Callback then
m.Callback()
end
end))
m:AddCleanup(p)

m.Label=q.Title
m.Instance=q.Row
return m
end end function a.z():typeof(__modImpl())local b=a.cache.z if not b then b={c=__modImpl()}a.cache.z=b end return b.c end end do local function __modImpl()

const b=a.n()
const c=a.m()
const d=a.o()
const e=a.p()
const g=a.s()
const h=a.t()
const i=a.x()
const j=a.y()

const k=40
const l=UDim2.fromOffset(18,2)
const m=UDim2.fromOffset(2,2)

return function(n,o,p)
o=o or{}

const q=j.new(o,"Toggle")
q.Callback=o.Callback
q.Locked=o.Locked==true
q.Window=p

const r=b.source(o.Default==true)
const s=b.source(false)
local t=q.Locked

const u,v=d(function()
const u=g{
Parent=n,
AutoButtonColor=false,
Name=q.Name,
Size=UDim2.new(1,0,0,k),
BackgroundColor3=function()
if o.Color then
return o.Color
end
const u=p:GetTheme()
return if s()
then(u.ElementHoverBackground or u.ElementBackground)
else u.ElementBackground
end,
BackgroundTransparency=0,
BorderSizePixel=0,
Text="",
TextScaled=false,
ZIndex=1,
}

b.create"UICorner"{
Parent=u,
CornerRadius=UDim.new(0,6),
}

const v=h{
Parent=u,
BackgroundTransparency=1,
Name="Title",
Text=o.Text or o.Name or"Toggle",
TextSize=14,
TextScaled=false,
FontFace=function()
return p:GetTheme().MainFont
end,
TextColor3=function()
return p:GetTheme().TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,
Size=UDim2.new(1,-70,1,0),
Position=UDim2.fromOffset(12,0),
ZIndex=2,
}

const w=e{
Parent=u,
Name="Track",
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(1,-48,0.5,0),
Size=UDim2.fromOffset(36,20),
BackgroundColor3=function()
const w=p:GetTheme()
return if r()
then(o.IndicatorColor or w.AccentColor)
else w.DropdownItem
end,
BorderSizePixel=0,
ZIndex=2,
}

b.create"UICorner"{
Parent=w,
CornerRadius=UDim.new(1,0),
}

i{
Parent=w,
Color=function()
const x=p:GetTheme()
return if r()then x.AccentColor else x.ElementStroke
end,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}

const x=e{
Parent=w,
Name="Knob",
Position=if r()then l else m,
Size=UDim2.fromOffset(16,16),
BackgroundColor3=function()
return p:GetTheme().TextPrimaryColor
end,
BorderSizePixel=0,
ZIndex=3,
}

b.create"UICorner"{
Parent=x,
CornerRadius=UDim.new(1,0),
}

i{
Parent=u,
Color=function()
return p:GetTheme().ElementStroke
end,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}

return{
Row=u,
Title=v,
Knob=x,
}
end)

const w=c.createSpring(v.Knob.Position,c.config.figmaQuick)
const x=w:onChange(function(x)
v.Knob.Position=x
end)
w:start()

local function updateKnob(y:boolean)
const z=if r()then l else m
if y then
w:setGoal(z)
else
w:stop()
w:setPosition(z)
w:start()
end
end

function q.GetValue(y):boolean
return r()
end

function q.SetValue(y,z:boolean,A:boolean?)
q:Toggle(z,A==true)
end

function q.SetCallback(y,z)
q.Callback=z
end

function q.Toggle(y,z:boolean?,A:boolean?)
if t then
return
end

const B=if z~=nil then z==true else not r()
r(B)
updateKnob(true)

if A~=false and q.Callback then
q.Callback(B)
end
end

function q.SetLocked(y,z:boolean)
t=z
q.Locked=z
end

function q.IsLocked(y):boolean
return t
end

q:AddConnection(v.Row.MouseEnter:Connect(function()
s(true)
end))
q:AddConnection(v.Row.MouseLeave:Connect(function()
s(false)
end))
q:AddConnection(v.Row.MouseButton1Click:Connect(function()
q:Toggle()
end))
q:AddCleanup(u)
q:AddCleanup(function()
x()
w:destroy()
end)

q.Label=v.Title
q.Instance=v.Row
return q
end end function a.A():typeof(__modImpl())local b=a.cache.A if not b then b={c=__modImpl()}a.cache.A=b end return b.c end end do local function __modImpl()

const b=a.n()
const c=a.r()
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
end end function a.B():typeof(__modImpl())local b=a.cache.B if not b then b={c=__modImpl()}a.cache.B=b end return b.c end end do local function __modImpl()

const b=a.n()
const c=a.o()
const d=a.p()
const e=a.s()
const g=a.t()
const h=a.B()
const i=a.x()
const j=a.y()

local function formatNumber(k:number,l:number):string
if l<=0 then
return tostring(math.round(k))
end
return string.format("%."..tostring(l).."f",k)
end

return function(k,l,m)
l=l or{}

const n=b.source(l.Min or 0)
const o=b.source(l.Max or 100)
if o()<=n()then
error"Slider Max must be greater than Min"
end

const p=b.source(math.max(0,math.floor(l.Decimals or 0)))
const q=b.source(math.clamp(l.Default or n(),n(),o()))

const r=j.new(l,"Slider")
r.Callback=l.Callback
r.Decimals=p()
r.Min=n()
r.Max=o()
r.Window=m

local s=false

const t,u=c(function()
const t=d{
Parent=k,
Name=r.Name,
Size=UDim2.new(1,0,0,54),
BackgroundColor3=function()
return l.Color or m:GetTheme().ElementBackground
end,
BorderSizePixel=0,
ZIndex=1,
}

b.create"UICorner"{
Parent=t,
CornerRadius=UDim.new(0,6),
}

const u=g{
Parent=t,
BackgroundTransparency=1,
Name="Title",
Text=l.Text or l.Name or"Slider",
TextSize=14,
TextScaled=false,
FontFace=function()
return m:GetTheme().MainFont
end,
TextColor3=function()
return m:GetTheme().TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,
Size=UDim2.new(1,-80,0,22),
Position=UDim2.fromOffset(12,6),
ZIndex=2,
}

const v=h{
Parent=t,
Name="Number",
Size=UDim2.fromOffset(58,22),
Position=UDim2.new(1,-70,0,6),
BackgroundTransparency=1,
BorderSizePixel=0,
Text=function()
return formatNumber(q(),p())
end,
TextSize=13,
TextScaled=false,
FontFace=function()
return m:GetTheme().MainFont
end,
TextColor3=function()
return m:GetTheme().TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Right,
ClearTextOnFocus=false,
ZIndex=2,
}

const w=e{
Parent=t,
AutoButtonColor=false,
Name="Track",
Size=UDim2.new(1,-24,0,6),
Position=UDim2.fromOffset(12,38),
BackgroundColor3=function()
return m:GetTheme().DropdownItem
end,
BackgroundTransparency=0,
BorderSizePixel=0,
Text="",
TextScaled=false,
ClipsDescendants=false,
ZIndex=2,
}

b.create"UICorner"{
Parent=w,
CornerRadius=UDim.new(1,0),
}
i{
Parent=w,
Color=function()
return m:GetTheme().ElementStroke
end,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}

const x=d{
Parent=w,
Name="Fill",
Size=function()
const x=math.clamp(
(q()-n())/(o()-n()),
0,
1
)
return UDim2.new(x,0,1,0)
end,
BackgroundColor3=function()
return l.FillColor or m:GetTheme().AccentColor
end,
BorderSizePixel=0,
ZIndex=2,
}

b.create"UICorner"{
Parent=x,
CornerRadius=UDim.new(1,0),
}

const y=d{
Parent=w,
Name="Knob",
AnchorPoint=Vector2.new(0.5,0.5),
Position=function()
const y=math.clamp(
(q()-n())/(o()-n()),
0,
1
)
return UDim2.new(y,0,0.5,0)
end,
Size=UDim2.fromOffset(14,14),
BackgroundColor3=function()
return m:GetTheme().TextPrimaryColor
end,
BorderSizePixel=0,
ZIndex=3,
}

b.create"UICorner"{
Parent=y,
CornerRadius=UDim.new(1,0),
}

i{
Parent=t,
Color=function()
return m:GetTheme().ElementStroke
end,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}

return{
Row=t,
Title=u,
Number=v,
Track=w,
}
end)

function r.SetValue(v,w:number,x:boolean?)
if typeof(w)~="number"then
error"Slider value must be a number"
end

const y=10^p()
const z=math.round(w*y)/y
q(math.clamp(z,n(),o()))

if x==true and r.Callback then
r.Callback(q())
end
end

function r.GetValue(v):number
return q()
end

function r.GetMin(v):number
return n()
end

function r.GetMax(v):number
return o()
end

function r.SetRange(v,w:number,x:number)
if x<=w then
error"Slider Max must be greater than Min"
end
n(w)
o(x)
r.Min=w
r.Max=x
r:SetValue(q(),false)
end

function r.SetCallback(v,w)
r.Callback=w
end

function r.SetDecimals(v,w:number)
const x=math.max(0,math.floor(w))
p(x)
r.Decimals=x
r:SetValue(q(),false)
end

local function setFromPointer(v:number)
const w=math.clamp(
(v-u.Track.AbsolutePosition.X)/u.Track.AbsoluteSize.X,
0,
1
)
r:SetValue(n()+(o()-n())*w,true)
end

r:AddConnection(u.Track.InputBegan:Connect(function(v)
if v.UserInputType~=Enum.UserInputType.MouseButton1
and v.UserInputType~=Enum.UserInputType.Touch
then
return
end
s=true
setFromPointer(v.Position.X)
end))
r:AddConnection(game:GetService"UserInputService".InputChanged:Connect(function(v)
if not s then
return
end
if v.UserInputType~=Enum.UserInputType.MouseMovement
and v.UserInputType~=Enum.UserInputType.Touch
then
return
end
setFromPointer(v.Position.X)
end))
r:AddConnection(game:GetService"UserInputService".InputEnded:Connect(function(v)
if v.UserInputType~=Enum.UserInputType.MouseButton1
and v.UserInputType~=Enum.UserInputType.Touch
then
return
end
s=false
end))
r:AddConnection(u.Number.FocusLost:Connect(function()
const v=tonumber(u.Number.Text)
if v then
r:SetValue(v,true)
else
u.Number.Text=formatNumber(q(),p())
end
end))
r:AddCleanup(t)
r:AddCleanup(function()
s=false
end)

r.Label=u.Title
r.Instance=u.Row
return r
end end function a.C():typeof(__modImpl())local b=a.cache.C if not b then b={c=__modImpl()}a.cache.C=b end return b.c end end do local function __modImpl()

const b=game:GetService"UserInputService"
const c=a.n()
const d=a.o()
const e=a.p()
const g=a.s()
const h=a.t()
const i=a.v()
const j=a.w()
const k=a.x()
const l=a.y()

const m=40
const n=30
const o=4
const p=6

local function containsPoint(q:GuiObject,r:Vector3):boolean
const s=q.AbsolutePosition
const t=q.AbsoluteSize
return r.X>=s.X
and r.X<=s.X+t.X
and r.Y>=s.Y
and r.Y<=s.Y+t.Y
end

return function(q,r,s)
r=r or{}

const t=l.new(r,"Dropdown")
t.Callback=r.Callback
t.Selected=nil
t.Options={}
t.Window=s

const u=r.Placeholder or"Select..."
const v=c.source(false)
const w=c.source(false)
const x=c.source(nil)

local y={}
local z

const A,B=d(function()
const A=g{
Parent=q,
AutoButtonColor=false,
Name=t.Name,
Size=UDim2.new(1,0,0,m),
BackgroundColor3=function()
if r.Color then
return r.Color
end
const A=s:GetTheme()
return if v()
then(A.ElementHoverBackground or A.ElementBackground)
else A.ElementBackground
end,
BackgroundTransparency=0,
BorderSizePixel=0,
Text="",
TextScaled=false,
ZIndex=1,
}

c.create"UICorner"{
Parent=A,
CornerRadius=UDim.new(0,6),
}

const B=h{
Parent=A,
BackgroundTransparency=1,
Name="Title",
Text=r.Text or r.Name or"Dropdown",
TextSize=14,
TextScaled=false,
FontFace=function()
return s:GetTheme().MainFont
end,
TextColor3=function()
return s:GetTheme().TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,
Size=UDim2.new(1,-188,1,0),
Position=UDim2.fromOffset(12,0),
ZIndex=2,
}

const C=h{
Parent=A,
BackgroundTransparency=1,
Name="Value",
Text=function()
const C=x()
return if C then C.Name else u
end,
TextSize=13,
TextScaled=false,
FontFace=function()
return s:GetTheme().MainFont
end,
TextColor3=function()
const C=s:GetTheme()
if x()then
return C.TextPrimaryColor
end
return C.TextSecondaryColor or C.TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Right,
TextTruncate=Enum.TextTruncate.AtEnd,
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,-38,0,0),
Size=UDim2.new(0,130,1,0),
ZIndex=2,
}

const D=h{
Parent=A,
BackgroundTransparency=1,
Name="Icon",
Text=function()
return if w()then"^"else"v"
end,
TextSize=12,
TextScaled=false,
FontFace=function()
return s:GetTheme().MainFont
end,
TextColor3=function()
const D=s:GetTheme()
return D.TextSecondaryColor or D.TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Center,
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(1,-26,0.5,0),
Size=UDim2.fromOffset(18,18),
ZIndex=2,
}

k{
Parent=A,
Color=function()
return s:GetTheme().ElementStroke
end,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}

const E=e{
Parent=s.DropdownLayer,
Name="DropdownOptions",
Size=UDim2.fromOffset(180,0),
BackgroundColor3=function()
const E=s:GetTheme()
return E.FrameBackground or E.WindowBackground
end,
BorderSizePixel=0,
ClipsDescendants=true,
Visible=function()
return w()
end,
ZIndex=120,
}

c.create"UICorner"{
Parent=E,
CornerRadius=UDim.new(0,8),
}
k{
Parent=E,
Color=function()
return s:GetTheme().ElementStroke
end,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}

const F=i{
Parent=E,
Name="Options",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
BorderSizePixel=0,
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollBarThickness=3,
ScrollBarImageColor3=function()
const F=s:GetTheme()
return F.TextSecondaryColor or F.TextPrimaryColor
end,
ZIndex=121,
}

j{
Parent=F,
PaddingTop=UDim.new(0,p),
PaddingBottom=UDim.new(0,p),
PaddingLeft=UDim.new(0,p),
PaddingRight=UDim.new(0,p),
}
c.create"UIListLayout"{
Parent=F,
Padding=UDim.new(0,o),
SortOrder=Enum.SortOrder.LayoutOrder,
}

return{
Row=A,
Title=B,
ValueLabel=C,
Chevron=D,
Popup=E,
Scroll=F,
}
end)

local function createOption(C)
if typeof(C)=="string"then
C={Name=C}
end

const D=C.Name or C.Text
if not D then
error"Dropdown options require a Name or Text"
end
const E=tostring(D)

const F={
Name=E,
Value=if C.Value~=nil then C.Value else E,
Callback=C.Callback,
Dropdown=t,
Button=nil,
Stroke=nil,
Hovered=c.source(false),
}
table.insert(t.Options,F)
return F
end

local function findOption(C)
if typeof(C)=="table"then
if C.Dropdown==t then
return C
end
C=if C.Value~=nil then C.Value else C.Name
elseif typeof(C)=="Instance"then
C=C.Name
end

for D,E in t.Options do
if E.Value==C or E.Name==C then
return E
end
end
return nil
end

local function selectOption(C,D,E)
t.Selected=C
x(C)

if D then
t:Close()
end
if E then
if C.Callback then
C.Callback(C.Value,C)
end
if t.Callback then
t.Callback(C.Value,C)
end
end
end

function t.Refresh(C)
if w()then
t:Close()
end

for D,E in y do
E:Disconnect()
end
table.clear(y)

if z then
z()
z=nil
end

for D,E in B.Scroll:GetChildren()do
if E:IsA"GuiButton"or E.Name=="Empty"then
E:Destroy()
end
end

z=d(function()
for D,E in t.Options do
E.Button=nil
E.Stroke=nil
E.Hovered(false)

const F=g{
Parent=B.Scroll,
AutoButtonColor=false,
Name=E.Name,
Text=E.Name,
Size=UDim2.new(1,0,0,n),
LayoutOrder=D,
BackgroundColor3=function()
const F=s:GetTheme()
return if E.Hovered()
then(F.DropdownItemHover or F.DropdownItem)
else F.DropdownItem
end,
BackgroundTransparency=0,
BorderSizePixel=0,
TextSize=13,
TextScaled=false,
FontFace=function()
return s:GetTheme().MainFont
end,
TextColor3=function()
const F=s:GetTheme()
return if x()==E then F.AccentColor else F.TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,
ZIndex=122,
}

c.create"UICorner"{
Parent=F,
CornerRadius=UDim.new(0,5),
}
j{
Parent=F,
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
}

const G=k{
Parent=F,
Color=function()
return s:GetTheme().AccentColor
end,
Thickness=1.5,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Enabled=function()
return x()==E
end,
}

E.Button=F
E.Stroke=G

table.insert(y,F.MouseEnter:Connect(function()
E.Hovered(true)
end))
table.insert(y,F.MouseLeave:Connect(function()
E.Hovered(false)
end))
table.insert(y,F.MouseButton1Click:Connect(function()
t:Select(E.Value)
end))
end

if#t.Options==0 then
h{
Parent=B.Scroll,
BackgroundTransparency=1,
Name="Empty",
Text="No options",
Size=UDim2.new(1,0,0,24),
TextSize=13,
TextScaled=false,
FontFace=function()
return s:GetTheme().MainFont
end,
TextColor3=function()
const D=s:GetTheme()
return D.TextSecondaryColor or D.TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Center,
ZIndex=122,
}
end
end)
end

function t.AddOption(C,D)
const E=createOption(D or{})
t:Refresh()
return E
end

function t.GetOption(C)
return x()
end

function t.GetValue(C)
const D=x()
if D then
return D.Value
end
return nil
end

function t.SetValue(C,D,E:boolean?)
const F=findOption(D)
if not F then
error("Unknown dropdown option: "..tostring(D))
end
selectOption(F,false,E==true)
end

function t.Select(C,D)
const E=findOption(D)
if not E then
error("Unknown dropdown option: "..tostring(D))
end
selectOption(E,true,true)
end

function t.SetCallback(C,D)
t.Callback=D
end

function t.Open(C)
if w()or#t.Options==0 then
return
end

s:ClosePopups(t)
w(true)

const D=s.DropdownLayer
const E=D.AbsoluteSize
const F=B.Row.AbsolutePosition-D.AbsolutePosition
const G=B.Row.AbsoluteSize

local H=#t.Options*n
+(#t.Options-1)*o
+p*2
H=math.min(H,220)

const I=math.min(math.max(G.X,160),E.X-16)
const J=math.clamp(F.X,8,math.max(8,E.X-I-8))
local K=F.Y+G.Y+4
if K+H>E.Y-8 then
K=math.max(8,F.Y-H-4)
end

B.Popup.Position=UDim2.fromOffset(J,K)
B.Popup.Size=UDim2.fromOffset(I,H)

t._outside=b.InputBegan:Connect(function(L)
if L.UserInputType~=Enum.UserInputType.MouseButton1
and L.UserInputType~=Enum.UserInputType.Touch
then
return
end
if containsPoint(B.Row,L.Position)or containsPoint(B.Popup,L.Position)then
return
end
t:Close()
end)
end

function t.Close(C)
if not w()then
return
end

w(false)
if t._outside then
t._outside:Disconnect()
t._outside=nil
end
end

function t.Toggle(C)
if w()then
t:Close()
else
t:Open()
end
end

function t.IsOpen(C):boolean
return w()
end

const C=t.SetVisible
function t.SetVisible(D,E:boolean)
C(D,E)
if not E then
D:Close()
end
end

if r.Options then
for D,E in r.Options do
createOption(E)
end
end
t:Refresh()

if r.Default~=nil then
t:SetValue(r.Default)
end

t:AddConnection(B.Row.MouseEnter:Connect(function()
v(true)
end))
t:AddConnection(B.Row.MouseLeave:Connect(function()
v(false)
end))
t:AddConnection(B.Row.MouseButton1Click:Connect(function()
t:Toggle()
end))
t:AddCleanup(function()
for D,E in y do
E:Disconnect()
end
table.clear(y)
if z then
z()
z=nil
end
t:Close()
s:UnregisterPopup(t)
B.Popup:Destroy()
end)
t:AddCleanup(A)

s:RegisterPopup(t)
t.Label=B.Title
t.Instance=B.Row
return t
end end function a.D():typeof(__modImpl())local b=a.cache.D if not b then b={c=__modImpl()}a.cache.D=b end return b.c end end do local function __modImpl()

const b=a.n()
const c=a.o()
const d=a.p()
const e=a.t()
const g=a.B()
const h=a.w()
const i=a.x()
const j=a.y()

const k=40

return function(l,m,n)
m=m or{}

const o=j.new(m,"TextBox")
o.Callback=m.Callback
o.Window=n

const p=m.Placeholder or"Enter text..."
local q=""
if m.Default~=nil then
q=tostring(m.Default)
end

const r,s=c(function()
const r=d{
Parent=l,
Name=o.Name,
Size=UDim2.new(1,0,0,k),
BackgroundColor3=function()
return m.Color or n:GetTheme().ElementBackground
end,
BorderSizePixel=0,
ZIndex=1,
}

b.create"UICorner"{
Parent=r,
CornerRadius=UDim.new(0,6),
}

const s=e{
Parent=r,
BackgroundTransparency=1,
Name="Title",
Text=m.Text or m.Name or"Textbox",
TextSize=14,
TextScaled=false,
FontFace=function()
return n:GetTheme().MainFont
end,
TextColor3=function()
return n:GetTheme().TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,
Size=UDim2.new(0.38,-12,1,0),
Position=UDim2.fromOffset(12,0),
ZIndex=2,
}

const t=g{
Parent=r,
Name="Input",
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0.4,0,0.5,0),
Size=UDim2.new(0.6,-24,0,28),
BackgroundColor3=function()
return n:GetTheme().DropdownItem
end,
BorderSizePixel=0,
Text=tostring(q),
PlaceholderText=p,
PlaceholderColor3=function()
const t=n:GetTheme()
return t.TextSecondaryColor or t.TextPrimaryColor
end,
TextSize=13,
TextScaled=false,
FontFace=function()
return n:GetTheme().MainFont
end,
TextColor3=function()
return n:GetTheme().TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Left,
ClearTextOnFocus=false,
ZIndex=2,
}

b.create"UICorner"{
Parent=t,
CornerRadius=UDim.new(0,5),
}
h{
Parent=t,
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
}
i{
Parent=t,
Color=function()
return n:GetTheme().ElementStroke
end,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}
i{
Parent=r,
Color=function()
return n:GetTheme().ElementStroke
end,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}

return{
Row=r,
Title=s,
Input=t,
}
end)

function o.GetValue(t):string
return s.Input.Text
end

function o.SetValue(t,u:string)
s.Input.Text=tostring(u)
end

function o.SetPlaceholder(t,u:string)
s.Input.PlaceholderText=u
end

function o.SetCallback(t,u)
o.Callback=u
end

o:AddConnection(s.Input.FocusLost:Connect(function(t)
if o.Callback then
o.Callback(s.Input.Text,t)
end
end))
o:AddCleanup(r)

o.Input=s.Input
o.Label=s.Title
o.Instance=s.Row
return o
end end function a.E():typeof(__modImpl())local b=a.cache.E if not b then b={c=__modImpl()}a.cache.E=b end return b.c end end do local function __modImpl()

const b=game:GetService"UserInputService"
const c=a.n()
const d=a.o()
const e=a.p()
const g=a.s()
const h=a.t()
const i=a.x()
const j=a.y()

const k=40

const l={
MouseButton1=true,
MouseButton2=true,
MouseButton3=true,
LMB=true,
RMB=true,
MMB=true,
}

const m={
LMB="MouseButton1",
RMB="MouseButton2",
MMB="MouseButton3",
}

const n={
MouseButton1="LMB",
MouseButton2="RMB",
MouseButton3="MMB",
}

local function containsPoint(o:GuiObject,p:Vector3):boolean
const q=o.AbsolutePosition
const r=o.AbsoluteSize
return p.X>=q.X
and p.X<=q.X+r.X
and p.Y>=q.Y
and p.Y<=q.Y+r.Y
end

return function(o,p,q)
p=p or{}

const r=j.new(p,"Keybind")
r.Callback=p.Callback
r.Processed=p.Processed==true
r.Window=q

const s=p.Placeholder or"Bind"
const t=c.source(false)
const u=c.source(false)
const v=c.source(nil)
const w=c.source(false)

local x=r.Processed
local y=false

const z,A=d(function()
const z=e{
Parent=o,
Name=r.Name,
Size=UDim2.new(1,0,0,k),
BackgroundColor3=function()
if p.Color then
return p.Color
end
const z=q:GetTheme()
return if t()
then(z.ElementHoverBackground or z.ElementBackground)
else z.ElementBackground
end,
BorderSizePixel=0,
ZIndex=1,
}

c.create"UICorner"{
Parent=z,
CornerRadius=UDim.new(0,6),
}

const A=h{
Parent=z,
BackgroundTransparency=1,
Name="Title",
Text=p.Text or p.Name or"Keybind",
TextSize=14,
TextScaled=false,
FontFace=function()
return q:GetTheme().MainFont
end,
TextColor3=function()
return q:GetTheme().TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,
Size=UDim2.new(1,-116,1,0),
Position=UDim2.fromOffset(12,0),
ZIndex=2,
}

const B=g{
Parent=z,
AutoButtonColor=false,
Name="Bind",
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(1,-102,0.5,0),
Size=UDim2.fromOffset(90,28),
BackgroundColor3=function()
const B=q:GetTheme()
return if u()then B.AccentColor else B.DropdownItem
end,
BackgroundTransparency=0,
BorderSizePixel=0,
Text=function()
if u()then
return"..."
end
const B=v()
if B==nil then
return s
end
return if w()then B else(n[B]or B)
end,
TextSize=12,
TextScaled=false,
FontFace=function()
return q:GetTheme().MainFont
end,
TextColor3=function()
const B=q:GetTheme()
return if u()then Color3.fromRGB(255,255,255)else B.TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Center,
ZIndex=2,
}

c.create"UICorner"{
Parent=B,
CornerRadius=UDim.new(0,5),
}
i{
Parent=z,
Color=function()
return q:GetTheme().ElementStroke
end,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}
i{
Parent=B,
Color=function()
const C=q:GetTheme()
return if u()then C.AccentColor else C.ElementStroke
end,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}

return{
Row=z,
Title=A,
BindButton=B,
}
end)

local function setBind(B:string?,C:boolean)
v(B)
w(C)
r.Bind=B
r.IsKey=C
end

function r.GetValue(B):string?
return v()
end

function r.SetValue(B,C:string|EnumItem|nil)
if C==nil or C==""then
setBind(nil,false)
return
end

if typeof(C)=="EnumItem"then
if C.EnumType==Enum.KeyCode then
setBind(C.Name,true)
elseif C.EnumType==Enum.UserInputType and l[C.Name]==true then
setBind(m[C.Name]or C.Name,false)
else
error"Keybind value must be a KeyCode or mouse button"
end
return
end

if typeof(C)~="string"then
error"Keybind value must be a string or EnumItem"
end

if m[C]then
setBind(m[C],false)
elseif l[C]then
setBind(C,false)
elseif Enum.KeyCode[C]then
setBind(C,true)
else
error("Unknown keybind: "..C)
end
end

function r.SetCallback(B,C)
r.Callback=C
end

function r.SetProcessed(B,C:boolean)
x=C
r.Processed=C
end

r:AddConnection(A.Row.MouseEnter:Connect(function()
t(true)
end))
r:AddConnection(A.Row.MouseLeave:Connect(function()
t(false)
end))
r:AddConnection(A.BindButton.Activated:Connect(function()
if y then
y=false
return
end
u(not u())
end))
r:AddConnection(b.InputBegan:Connect(function(B,C)
if u()then
if B.UserInputType==Enum.UserInputType.Keyboard then
if B.KeyCode~=Enum.KeyCode.Escape then
setBind(B.KeyCode.Name,true)
end
u(false)
elseif B.UserInputType==Enum.UserInputType.MouseButton1 then
setBind("MouseButton1",false)
u(false)
if containsPoint(A.BindButton,B.Position)then
y=true
end
elseif B.UserInputType==Enum.UserInputType.MouseButton2 then
setBind("MouseButton2",false)
u(false)
elseif B.UserInputType==Enum.UserInputType.MouseButton3 then
setBind("MouseButton3",false)
u(false)
end
return
end

if C and not x then
return
end
if not v()then
return
end

local D=false
if w()then
D=B.UserInputType==Enum.UserInputType.Keyboard and B.KeyCode.Name==v()
else
D=B.UserInputType.Name==v()
end

if D and r.Callback then
r.Callback(v())
end
end))
r:AddCleanup(z)
r:AddCleanup(function()
u(false)
end)

r:SetValue(p.Default)
r.Label=A.Title
r.Instance=A.Row
return r
end end function a.F():typeof(__modImpl())local b=a.cache.F if not b then b={c=__modImpl()}a.cache.F=b end return b.c end end do local function __modImpl()

const b=game:GetService"UserInputService"
const c=a.n()
const d=a.o()
const e=a.p()
const g=a.s()
const h=a.t()
const i=a.x()
const j=a.y()

const k=40

local function makeDraggable(l:GuiObject,m:GuiObject):()->()
local n=false
local o=Vector3.zero
local p=Vector2.zero

const q=l.InputBegan:Connect(function(q)
if q.UserInputType~=Enum.UserInputType.MouseButton1
and q.UserInputType~=Enum.UserInputType.Touch
then
return
end

n=true
o=q.Position

const r=m.AbsolutePosition
const s=m.AbsoluteSize
const t=m.AnchorPoint
p=Vector2.new(
r.X+s.X*t.X,
r.Y+s.Y*t.Y
)

local u
u=q.Changed:Connect(function()
if q.UserInputState==Enum.UserInputState.End then
n=false
u:Disconnect()
end
end)
end)

const r=b.InputChanged:Connect(function(r)
if not n then
return
end
if r.UserInputType~=Enum.UserInputType.MouseMovement
and r.UserInputType~=Enum.UserInputType.Touch
then
return
end

const s=r.Position-o
m.Position=UDim2.fromOffset(
p.X+s.X,
p.Y+s.Y
)
end)

return function()
n=false
q:Disconnect()
r:Disconnect()
end
end

return function(l,m,n)
m=m or{}

const o=j.new(m,"BindButton")
o.Window=n

const p=c.source(false)
const q=c.source(false)
const r=c.source(m.Visible~=false)
const s=c.source(m.ButtonText or"Lock")

local t

const u,v=d(function()
const u=e{
Parent=l,
Name=o.Name,
Size=UDim2.new(1,0,0,k),
BackgroundColor3=function()
if m.Color then
return m.Color
end
const u=n:GetTheme()
return if p()
then(u.ElementHoverBackground or u.ElementBackground)
else u.ElementBackground
end,
BorderSizePixel=0,
ZIndex=1,
}

c.create"UICorner"{
Parent=u,
CornerRadius=UDim.new(0,6),
}

const v=h{
Parent=u,
BackgroundTransparency=1,
Name="Title",
Text=m.Text or m.Name or"Bind Button",
TextSize=14,
TextScaled=false,
FontFace=function()
return n:GetTheme().MainFont
end,
TextColor3=function()
return n:GetTheme().TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,
Size=UDim2.new(1,-108,1,0),
Position=UDim2.fromOffset(12,0),
ZIndex=2,
}

const w=g{
Parent=u,
AutoButtonColor=false,
Name="Move",
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(1,-86,0.5,0),
Size=UDim2.fromOffset(74,28),
BackgroundColor3=function()
const w=n:GetTheme()
return if q()then w.AccentColor else w.DropdownItem
end,
BackgroundTransparency=0,
BorderSizePixel=0,
Text=function()
return if q()then"Stop"else"Move"
end,
TextSize=12,
TextScaled=false,
FontFace=function()
return n:GetTheme().MainFont
end,
TextColor3=function()
const w=n:GetTheme()
return if q()then Color3.fromRGB(255,255,255)else w.TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Center,
ZIndex=2,
}

c.create"UICorner"{
Parent=w,
CornerRadius=UDim.new(0,5),
}
i{
Parent=u,
Color=function()
return n:GetTheme().ElementStroke
end,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}
i{
Parent=w,
Color=function()
return n:GetTheme().AccentColor
end,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}

const x=g{
Parent=n.ScreenGui,
AutoButtonColor=false,
Name=o.Name,
AnchorPoint=Vector2.new(0.5,0.5),
Position=m.Position or UDim2.fromScale(0.75,0.75),
Size=UDim2.fromOffset(52,52),
BackgroundColor3=function()
const x=n:GetTheme()
return x.FrameBackground or x.WindowBackground
end,
BackgroundTransparency=0,
BorderSizePixel=0,
Text=function()
return s()
end,
TextSize=13,
TextScaled=false,
FontFace=function()
return n:GetTheme().BoldFont
end,
TextColor3=function()
return n:GetTheme().TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Center,
TextWrapped=true,
Visible=function()
return r()
end,
ZIndex=150,
}

c.create"UICorner"{
Parent=x,
CornerRadius=UDim.new(1,0),
}
i{
Parent=x,
Color=function()
return n:GetTheme().AccentColor
end,
Thickness=1.5,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}
c.create"UIAspectRatioConstraint"{
Parent=x,
AspectRatio=1,
}

return{
Row=u,
Title=v,
MoveButton=w,
Floating=x,
}
end)

local function stopDragging()
if t then
t()
t=nil
end
end

function o.GetButton(w):TextButton
return v.Floating
end

function o.SetVisible(w,x:boolean)
r(x==true)
end

function o.IsVisible(w):boolean
return r()
end

function o.SetDraggable(w,x:boolean)
q(x==true)
stopDragging()
if x then
t=makeDraggable(v.Floating,v.Floating)
end
end

function o.IsDraggable(w):boolean
return q()
end

function o.SetPosition(w,x:UDim2)
v.Floating.Position=x
end

function o.GetPosition(w):UDim2
return v.Floating.Position
end

function o.SetButtonText(w,x:string)
s(x)
end

o:AddConnection(v.Row.MouseEnter:Connect(function()
p(true)
end))
o:AddConnection(v.Row.MouseLeave:Connect(function()
p(false)
end))
o:AddConnection(v.MoveButton.Activated:Connect(function()
o:SetDraggable(not q())
end))
o:AddCleanup(u)
o:AddCleanup(function()
stopDragging()
v.Floating:Destroy()
end)

if m.Draggable==true then
o:SetDraggable(true)
end

o.Label=v.Title
o.Instance=v.Row
return o
end end function a.G():typeof(__modImpl())local b=a.cache.G if not b then b={c=__modImpl()}a.cache.G=b end return b.c end end do local function __modImpl()

const b=a.n()
const c=a.o()
const d=a.p()
const e=a.t()
const g=a.w()
const h=a.x()
const i=a.y()

const j={
Warning={
Background=Color3.fromRGB(118,103,2),
Stroke=Color3.fromRGB(198,198,0),
},
Info={
Background=Color3.fromRGB(0,88,132),
Stroke=Color3.fromRGB(0,145,217),
},
Message={
Background=Color3.fromRGB(37,37,37),
Stroke=Color3.fromRGB(154,154,154),
},
}

return function(k,l,m,n)
m=m or{}

const o=j[l]
const p=i.new(m,l)
p.Save=m.Save==true
p.Window=n

const q,r=c(function()
const q=d{
Parent=k,
Name=l,
Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundColor3=o.Background,
BorderSizePixel=0,
Visible=m.Visible~=false,
ZIndex=1,
}

b.create"UICorner"{
Parent=q,
CornerRadius=UDim.new(0,6),
}
h{
Parent=q,
Color=o.Stroke,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}

g{
Parent=q,
PaddingTop=UDim.new(0,8),
PaddingBottom=UDim.new(0,8),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}

const r=e{
Parent=q,
BackgroundTransparency=1,
Name="Title",
Text=m.Text or"",
Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
TextWrapped=true,
TextSize=13,
TextScaled=false,
FontFace=function()
return n:GetTheme().MainFont
end,
TextColor3=Color3.fromRGB(255,255,255),
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,
ZIndex=2,
}

return{
Frame=q,
Label=r,
}
end)

p:AddCleanup(q)

p.Label=r.Label
p.Instance=r.Frame
return p
end end function a.H():typeof(__modImpl())local b=a.cache.H if not b then b={c=__modImpl()}a.cache.H=b end return b.c end end do local function __modImpl()

const b=a.n()
const c=a.o()
const d=a.p()
const e=a.s()
const g=a.t()
const h=a.v()
const i=a.w()
const j=a.z()
const k=a.A()
const l=a.C()
const m=a.D()
const n=a.E()
const o=a.F()
const p=a.G()
const q=a.H()

const r=8

const s={}
s.__index=s

function s.new(t,u)
if typeof(u)=="string"then
u={Name=u}
end
u=u or{}

const v=u.Name or"Tab"
const w=b.source(false)
const x=b.source(false)

const y,z=c(function()
const y=h{
Parent=t.TabContent,
Name=v,
Size=UDim2.new(1,0,1,0),
Visible=w,
BorderSizePixel=0,
BackgroundTransparency=1,
ScrollBarImageColor3=function()
const y=t:GetTheme()
return y.TextSecondaryColor or y.TextPrimaryColor
end,
ScrollBarImageTransparency=0.4,
ScrollingDirection=Enum.ScrollingDirection.Y,
ScrollBarThickness=3,
ZIndex=1,
}

i{
Parent=y,
PaddingTop=UDim.new(0,12),
PaddingBottom=UDim.new(0,12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}
b.create"UIListLayout"{
Parent=y,
Padding=UDim.new(0,r),
SortOrder=if u.Alphabetical==true then Enum.SortOrder.Name else Enum.SortOrder.LayoutOrder,
}

const z=e{
Parent=t.TabButtonHolder,
AutoButtonColor=false,
Name=v,
Size=UDim2.new(1,0,0,34),
BackgroundColor3=function()
return t:GetTheme().TabButtonBackground
end,
BackgroundTransparency=function()
if w()then
return 0.82
elseif x()then
return 0.92
end
return 1
end,
BorderSizePixel=0,
Text="",
TextScaled=false,
ClipsDescendants=true,
ZIndex=1,
}

b.create"UICorner"{
Parent=z,
CornerRadius=UDim.new(0,6),
}

const A=d{
Parent=z,
Name="Accent",
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
Size=UDim2.fromOffset(3,14),
BackgroundColor3=function()
return t:GetTheme().AccentColor
end,
BorderSizePixel=0,
Visible=w,
ZIndex=2,
}

b.create"UICorner"{
Parent=A,
CornerRadius=UDim.new(1,0),
}

const B=g{
Parent=z,
BackgroundTransparency=1,
Name="Title",
Text=v,
Size=UDim2.new(1,-20,1,0),
Position=UDim2.fromOffset(14,0),
TextSize=13,
TextScaled=false,
FontFace=function()
return t:GetTheme().MainFont
end,
TextColor3=function()
const B=t:GetTheme()
return if w()or x()
then(B.TabButtonActive or B.TextPrimaryColor)
else B.TabButtonInactive
end,
TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,
ZIndex=2,
}

return{
Content=y,
TabButton=z,
Title=B,
}
end)

const A=setmetatable({
Window=t,
Name=v,
Content=z.Content,
TabButton=z.TabButton,
Elements={},
Destroyed=false,
_videDestroy=y,
},s)

A._connections={}

function s.RegisterElement(B,C)
C.Tab=B
C.Window=B.Window
table.insert(B.Elements,C)
if C.Flag then
B.Window.Elements[C.Flag]=C
end
return C
end

function s.Activate(B)
if w()then
return
end

for C,D in B.Window.Tabs do
if D~=B then
D:Deactivate()
end
end

w(true)
B.Window.CurrentTab=B
B.Window:ClosePopups()
end

function s.Deactivate(B)
if not w()then
return
end

w(false)
x(false)
if B.Window.CurrentTab==B then
B.Window.CurrentTab=nil
end
B.Window:ClosePopups()
end

function s.IsActive(B):boolean
return w()
end

function s.SetText(B,C:string)
B.Name=C
z.Title.Text=C
B.TabButton.Name=C
B.Content.Name=C
end

function s.Button(B,C)
return B:RegisterElement(j(B.Content,C,B.Window))
end

function s.Toggle(B,C)
return B:RegisterElement(k(B.Content,C,B.Window))
end

function s.Slider(B,C)
return B:RegisterElement(l(B.Content,C,B.Window))
end

function s.Dropdown(B,C)
return B:RegisterElement(m(B.Content,C,B.Window))
end

function s.TextBox(B,C)
return B:RegisterElement(n(B.Content,C,B.Window))
end

function s.BindKey(B,C)
return B:RegisterElement(o(B.Content,C,B.Window))
end

function s.BindButton(B,C)
return B:RegisterElement(p(B.Content,C,B.Window))
end

function s.Warning(B,C)
return B:RegisterElement(q(B.Content,"Warning",C,B.Window))
end

function s.Info(B,C)
return B:RegisterElement(q(B.Content,"Info",C,B.Window))
end

function s.Message(B,C)
return B:RegisterElement(q(B.Content,"Message",C,B.Window))
end

function s.Export(B)
const C={}
for D,E in B.Elements do
if E:CanSave()then
const F=E:Export()
if F~=nil then
C[E.Flag]=F
end
end
end
return C
end

function s.Import(B,C)
if not C then
return
end
for D,E in B.Elements do
if E:CanSave()and C[E.Flag]~=nil then
E:Import(C[E.Flag])
end
end
end

function s.Destroy(B)
if B.Destroyed then
return
end
B.Destroyed=true
w(false)
x(false)

for C,D in B._connections do
D:Disconnect()
end
table.clear(B._connections)

if B._videDestroy then
B._videDestroy()
B._videDestroy=nil
end

for C,D in B.Elements do
if D.Flag and B.Window.Elements[D.Flag]==D then
B.Window.Elements[D.Flag]=nil
end
D:Destroy()
end
table.clear(B.Elements)

const C=table.find(B.Window.Tabs,B)
if C then
table.remove(B.Window.Tabs,C)
end
if B.Window.CurrentTab==B then
B.Window.CurrentTab=nil
end

B.TabButton:Destroy()
B.Content:Destroy()

if B.Window.CurrentTab==nil and B.Window.Tabs[1]and not B.Window.Destroying then
B.Window.Tabs[1]:Activate()
end
end

table.insert(A._connections,A.TabButton.MouseEnter:Connect(function()
x(true)
end))
table.insert(A._connections,A.TabButton.MouseLeave:Connect(function()
x(false)
end))
table.insert(A._connections,A.TabButton.MouseButton1Click:Connect(function()
A:Activate()
end))

return A
end

return s end function a.I():typeof(__modImpl())local b=a.cache.I if not b then b={c=__modImpl()}a.cache.I=b end return b.c end end do local function __modImpl()

const b=a.n()
const c=a.m()
const d=a.o()
const e=a.p()
const g=a.s()
const h=a.t()
const i=a.w()
const j=a.x()

const k={
duration=0.15,
easing="quadOut",
}
const l={
duration=0.12,
easing="quadOut",
}

return function(m)
const n=e{
Parent=m.ScreenGui,
Name="Notifications",
AnchorPoint=Vector2.new(1,1),
Position=UDim2.new(1,-16,1,-16),
Size=UDim2.new(0,300,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
BorderSizePixel=0,
ZIndex=200,
}

b.create"UIListLayout"{
Parent=n,
Padding=UDim.new(0,8),
SortOrder=Enum.SortOrder.LayoutOrder,
HorizontalAlignment=Enum.HorizontalAlignment.Right,
VerticalAlignment=Enum.VerticalAlignment.Bottom,
}

const o={}
local p=0
local q={}

local function disconnectRecord(r)
for s,t in r.Connections do
t:Disconnect()
end
table.clear(r.Connections)
end

local function destroyRecord(r)
disconnectRecord(r)
if r.DestroyScope then
r.DestroyScope()
r.DestroyScope=nil
end
r.Group:Destroy()
end

function o.Notify(r,s,t)
local u
if typeof(s)=="table"then
u=s
else
u={
Text=s,
Duration=t,
}
end

const v=tostring(u.Text or"")
const w=if u.Duration~=nil then u.Duration else 4
const x=b.source(false)

const y,z=d(function()
const y=b.create"CanvasGroup"{
Parent=n,
Name="Notification",
Size=UDim2.new(0,300,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
BorderSizePixel=0,
GroupTransparency=1,
LayoutOrder=p,
}

const z=e{
Parent=y,
Name="Card",
Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundColor3=function()
const z=m:GetTheme()
return z.FrameBackground or z.WindowBackground
end,
BorderSizePixel=0,
ZIndex=1,
}

b.create"UICorner"{
Parent=z,
CornerRadius=UDim.new(0,8),
}
j{
Parent=z,
Color=function()
return m:GetTheme().ElementStroke
end,
Thickness=1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}

const A=e{
Parent=z,
Name="Accent",
Size=UDim2.new(0,3,1,0),
BackgroundColor3=function()
return u.Color or m:GetTheme().AccentColor
end,
BorderSizePixel=0,
ZIndex=2,
}
b.create"UICorner"{
Parent=A,
CornerRadius=UDim.new(1,0),
}

const B=e{
Parent=z,
Name="Content",
Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
BorderSizePixel=0,
ZIndex=2,
}

i{
Parent=B,
PaddingTop=UDim.new(0,12),
PaddingBottom=UDim.new(0,12),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,36),
}
b.create"UIListLayout"{
Parent=B,
Padding=UDim.new(0,4),
SortOrder=Enum.SortOrder.LayoutOrder,
}

local C
if u.Title then
C=h{
Parent=B,
BackgroundTransparency=1,
Name="Title",
Text=tostring(u.Title),
Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
TextWrapped=true,
TextSize=14,
TextScaled=false,
FontFace=function()
return m:GetTheme().BoldFont
end,
TextColor3=function()
return m:GetTheme().TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,
ZIndex=3,
}
end

const D=h{
Parent=B,
BackgroundTransparency=1,
Name="Message",
Text=v,
Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
TextWrapped=true,
TextSize=13,
TextScaled=false,
FontFace=function()
return m:GetTheme().MainFont
end,
TextColor3=function()
const D=m:GetTheme()
return D.TextSecondaryColor or D.TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,
ZIndex=3,
}

const E=g{
Parent=z,
AutoButtonColor=false,
Name="Close",
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,-8,0,8),
Size=UDim2.fromOffset(24,24),
BackgroundTransparency=1,
BorderSizePixel=0,
Text="X",
TextSize=12,
TextScaled=false,
FontFace=function()
return m:GetTheme().MainFont
end,
TextColor3=function()
const E=m:GetTheme()
return if x()
then E.TextPrimaryColor
else(E.TextSecondaryColor or E.TextPrimaryColor)
end,
ZIndex=4,
}

return{
Group=y,
Title=C,
Message=D,
CloseButton=E,
}
end)

p+=1

const A={
Group=z.Group,
Title=z.Title,
Message=z.Message,
CloseButton=z.CloseButton,
DestroyScope=y,
Connections={},
Timeout=nil,
FadeCleanup=nil,
Dismissed=false,
}

local function dismiss()
if A.Dismissed then
return
end
A.Dismissed=true

if A.Timeout then
task.cancel(A.Timeout)
A.Timeout=nil
end
disconnectRecord(A)
if A.FadeCleanup then
A.FadeCleanup()
A.FadeCleanup=nil
end

A.FadeCleanup=c.Tween(z.Group,{GroupTransparency=1},l,function()
A.FadeCleanup=nil
destroyRecord(A)
const B=table.find(q,A)
if B then
table.remove(q,B)
end
end)
end

A.Dismiss=dismiss
table.insert(q,A)

table.insert(A.Connections,z.CloseButton.Activated:Connect(dismiss))
table.insert(A.Connections,z.CloseButton.MouseEnter:Connect(function()
x(true)
end))
table.insert(A.Connections,z.CloseButton.MouseLeave:Connect(function()
x(false)
end))

A.FadeCleanup=c.Tween(z.Group,{GroupTransparency=0},k,function()
A.FadeCleanup=nil
end)

if w>0 then
A.Timeout=task.delay(w,function()
A.Timeout=nil
dismiss()
end)
end

return A
end

function o.Clear(r)
for s,t in table.clone(q)do
t.Dismiss()
end
end

function o.Destroy(r)
for s,t in table.clone(q)do
t.Dismissed=true
if t.Timeout then
task.cancel(t.Timeout)
t.Timeout=nil
end
if t.FadeCleanup then
t.FadeCleanup()
end
destroyRecord(t)
end
table.clear(q)
n:Destroy()
end

return o
end end function a.J():typeof(__modImpl())local b=a.cache.J if not b then b={c=__modImpl()}a.cache.J=b end return b.c end end do local function __modImpl()

const b=a.n()
const c=a.p()
const d=a.x()
const e=a.y()

return function(g,h)
h=h or{}

local i=h.Size or 200

const j=e.new(h,"Drawing")
j.Size=i

const k=c{
Parent=g,
Name="Drawing",
AnchorPoint=Vector2.new(0.5,0.5),
Position=h.Position or UDim2.fromScale(0.5,0.5),
Size=UDim2.fromOffset(i,i),
BackgroundTransparency=1,
BorderSizePixel=0,
Visible=h.Visible==true,
ZIndex=5,
}

b.create"UICorner"{
Parent=k,
CornerRadius=UDim.new(1,0),
}
b.create"UIAspectRatioConstraint"{
Parent=k,
AspectRatio=1,
}

const l=d{
Parent=k,
Color=h.Color or Color3.fromRGB(255,255,255),
Thickness=h.Thickness or 1,
StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
}

function j.SetSize(m,n:number)
i=n
j.Size=n
k.Size=UDim2.fromOffset(n,n)
end

function j.GetSize(m):number
return i
end

function j.SetColor(m,n:Color3)
l.Color=n
end

function j.SetThickness(m,n:number)
l.Thickness=n
end

function j.SetPosition(m,n:UDim2)
k.Position=n
end

function j.GetPosition(m):UDim2
return k.Position
end

j.Instance=k
return j
end end function a.K():typeof(__modImpl())local b=a.cache.K if not b then b={c=__modImpl()}a.cache.K=b end return b.c end end do local function __modImpl()

const b=a.q()

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
}end function a.L():typeof(__modImpl())local b=a.cache.L if not b then b={c=__modImpl()}a.cache.L=b end return b.c end end do local function __modImpl()

const b=a.q()

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
}end function a.M():typeof(__modImpl())local b=a.cache.M if not b then b={c=__modImpl()}a.cache.M=b end return b.c end end do local function __modImpl()

const b=a.q()

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
}end function a.N():typeof(__modImpl())local b=a.cache.N if not b then b={c=__modImpl()}a.cache.N=b end return b.c end end do local function __modImpl()

const b=a.q()

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
}end function a.O():typeof(__modImpl())local b=a.cache.O if not b then b={c=__modImpl()}a.cache.O=b end return b.c end end do local function __modImpl()

const b=a.q()

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
}end function a.P():typeof(__modImpl())local b=a.cache.P if not b then b={c=__modImpl()}a.cache.P=b end return b.c end end do local function __modImpl()

const b=a.q()

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
}end function a.Q():typeof(__modImpl())local b=a.cache.Q if not b then b={c=__modImpl()}a.cache.Q=b end return b.c end end do local function __modImpl()

const b=a.q()

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
}end function a.R():typeof(__modImpl())local b=a.cache.R if not b then b={c=__modImpl()}a.cache.R=b end return b.c end end do local function __modImpl()

const b=a.q()

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
}end function a.S():typeof(__modImpl())local b=a.cache.S if not b then b={c=__modImpl()}a.cache.S=b end return b.c end end do local function __modImpl()

const b=a.r()
const c=a.L()
const d=a.M()
const e=a.N()
const g=a.O()
const h=a.P()
const i=a.Q()
const j=a.R()
const k=a.S()
























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

function l.Get(m:(string|{[string]:any})?):Theme__DARKLUA_TYPE_aj
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

return l end function a.T():typeof(__modImpl())local b=a.cache.T if not b then b={c=__modImpl()}a.cache.T=b end return b.c end end do local function __modImpl()

const b=game:GetService"RunService"
const c=game:GetService"Players"
const d=game:GetService"UserInputService"
const e=game:GetService"HttpService"
const g=a.m()
const h=a.n()
const i=a.o()
const j=a.p()
const k=a.s()
const l=a.t()
const m=a.u()
const n=a.v()
const o=a.w()
const p=a.I()
const q=a.J()
const r=a.K()
const s=a.T()
const t=a.r()

const u=40
const v=132
const w=10
const x=Color3.fromRGB(190,52,52)
const y={
duration=0.18,
easing="quadOut",
}

local function getViewport():Vector2
return workspace.CurrentCamera.ViewportSize
end

local function getGuiParent():Instance
if typeof(gethui)=="function"then
return gethui()
end
if b:IsStudio()then
return c.LocalPlayer:WaitForChild"PlayerGui"
end
return game:GetService"CoreGui"
end

local function resolveSize(z:UDim2?,A:number,B:number):UDim2
const C=getViewport()
local D=A
local E=B

if z then
D=z.X.Scale*C.X+z.X.Offset
E=z.Y.Scale*C.Y+z.Y.Offset
end

D=math.min(math.max(D,360),C.X-24)
E=math.min(math.max(E,240),C.Y-24)

return UDim2.fromOffset(D,E)
end

local function makeDraggable(z:GuiObject,A:GuiObject):()->()
local B=false
local C=Vector3.zero
local D=Vector2.zero

const E=z.InputBegan:Connect(function(E)
if E.UserInputType~=Enum.UserInputType.MouseButton1
and E.UserInputType~=Enum.UserInputType.Touch
then
return
end

B=true
C=E.Position

const F=A.AbsolutePosition
const G=A.AbsoluteSize
const H=A.AnchorPoint
D=Vector2.new(
F.X+G.X*H.X,
F.Y+G.Y*H.Y
)

local I
I=E.Changed:Connect(function()
if E.UserInputState==Enum.UserInputState.End then
B=false
I:Disconnect()
end
end)
end)

const F=d.InputChanged:Connect(function(F)
if not B then
return
end
if F.UserInputType~=Enum.UserInputType.MouseMovement
and F.UserInputType~=Enum.UserInputType.Touch
then
return
end

const G=F.Position-C
A.Position=UDim2.fromOffset(
D.X+G.X,
D.Y+G.Y
)
end)

return function()
B=false
E:Disconnect()
F:Disconnect()
end
end

const z={}
z.__index=z

function z.new(A)
A=A or{}

const B=h.source(s.Get(A.Theme or t))
const C=h.source(false)

const D=getViewport()
const E=resolveSize(
A.Size,
math.clamp(D.X*0.42,520,620),
math.clamp(D.Y*0.56,340,500)
)

const F=UDim2.fromOffset(E.X.Offset,u)
const G=A.Position or UDim2.fromScale(0.5,0.5)
const H=A.AnchorPoint
or(if A.Position then Vector2.zero else Vector2.new(0.5,0.5))

const I=setmetatable({
Name=A.Title or"Beans",
Tabs={},
Elements={},
CurrentTab=nil,
OnDestroyed=A.OnDestroyed,
Destroyed=false,
Destroying=false,
Popups={},
ExpandedSize=E,
MinimizedSize=F,
_theme=B,
_minimized=C,
_connections={},
},z)

const J=A.Parent or getGuiParent()

const K,L=i(function()
const K=h.create"ScreenGui"{
Name="BeanzUI",
ResetOnSpawn=false,
IgnoreGuiInset=false,
DisplayOrder=A.DisplayOrder or 50,
Enabled=A.Visible~=false,
}
K.Parent=J

const L=j{
Parent=K,
Name="Root",
Size=E,
Position=G,
AnchorPoint=H,
BackgroundTransparency=1,
BorderSizePixel=0,
ZIndex=1,
}

m{
Parent=L,
Name="Shadow",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),
Size=UDim2.new(1,48,1,48),
BackgroundTransparency=1,
BorderSizePixel=0,
Image="rbxassetid://6014261993",
ImageColor3=Color3.fromRGB(0,0,0),
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Slice,
SliceCenter=Rect.new(49,49,450,450),
ZIndex=1,
}

const M=j{
Parent=L,
Name="Main",
Size=UDim2.new(1,0,1,0),
BackgroundColor3=function()
const M=B()
return M.WindowBackground or M.FrameBackground
end,
BorderSizePixel=0,
ClipsDescendants=true,
ZIndex=2,
}

h.create"UICorner"{
Parent=M,
CornerRadius=UDim.new(0,w),
}

const N=j{
Parent=M,
Name="TopBar",
Size=UDim2.new(1,0,0,u),
BackgroundColor3=function()
return B().TopBarBackground
end,
BorderSizePixel=0,
ZIndex=10,
}

h.create"UICorner"{
Parent=N,
CornerRadius=UDim.new(0,w),
}

j{
Parent=N,
Name="Fill",
Size=UDim2.new(1,0,0.5,0),
Position=UDim2.new(0,0,0.5,0),
BackgroundColor3=function()
return B().TopBarBackground
end,
BorderSizePixel=0,
ZIndex=1,
}

m{
Parent=N,
Name="Icon",
Position=UDim2.fromOffset(12,9),
Size=UDim2.fromOffset(22,22),
BackgroundTransparency=1,
BorderSizePixel=0,
Image=A.Icon or"rbxassetid://18187292776",
ScaleType=Enum.ScaleType.Fit,
ZIndex=3,
}

const O=l{
Parent=N,
BackgroundTransparency=1,
Name="Title",
Text=I.Name,
Position=UDim2.fromOffset(42,0),
Size=UDim2.new(1,-152,1,0),
TextSize=15,
TextScaled=false,
FontFace=function()
return B().BoldFont
end,
TextColor3=function()
return B().TextPrimaryColor
end,
TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,
ZIndex=3,
}

local function makeCaptionButton(P:string,Q:string,R:number,S:Color3?)
const T=h.source(false)

const U=k{
Parent=N,
AutoButtonColor=false,
Name=P,
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(1,R,0.5,0),
Size=UDim2.fromOffset(28,28),
BackgroundColor3=function()
if S then
return S
end
const U=B()
return U.ElementHoverBackground or U.ElementBackground
end,
BackgroundTransparency=function()
return if T()then 0 else 1
end,
BorderSizePixel=0,
Text=Q,
TextSize=15,
TextScaled=false,
FontFace=function()
return B().MainFont
end,
TextColor3=function()
return if T()then Color3.fromRGB(255,255,255)else B().TextPrimaryColor
end,
ZIndex=4,
}

h.create"UICorner"{
Parent=U,
CornerRadius=UDim.new(0,5),
}

table.insert(I._connections,U.MouseEnter:Connect(function()
T(true)
end))
table.insert(I._connections,U.MouseLeave:Connect(function()
T(false)
end))

return U
end

const P=makeCaptionButton("Minimize","-",-68)
const Q=makeCaptionButton("Close","X",-36,x)

const R=j{
Parent=M,
Name="TopBarLine",
Position=UDim2.fromOffset(0,u),
Size=UDim2.new(1,0,0,1),
BackgroundColor3=function()
const R=B()
return R.SeparatorColor or R.LineColor
end,
BorderSizePixel=0,
Visible=function()
return not C()
end,
ZIndex=11,
}

const S=j{
Parent=M,
Name="Sidebar",
Position=UDim2.fromOffset(0,u),
Size=UDim2.new(0,v,1,-u),
BackgroundColor3=function()
return B().SidebarBackground
end,
BorderSizePixel=0,
Visible=function()
return not C()
end,
ZIndex=5,
}

j{
Parent=S,
Name="Line",
Position=UDim2.new(1,-1,0,0),
Size=UDim2.new(0,1,1,0),
BackgroundColor3=function()
const T=B()
return T.LineColor or T.SeparatorColor
end,
BorderSizePixel=0,
ZIndex=1,
}

const T=n{
Parent=S,
Name="Tabs",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
BorderSizePixel=0,
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollBarThickness=0,
ScrollingDirection=Enum.ScrollingDirection.Y,
ZIndex=2,
}

o{
Parent=T,
PaddingTop=UDim.new(0,8),
PaddingBottom=UDim.new(0,8),
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
}
h.create"UIListLayout"{
Parent=T,
Padding=UDim.new(0,4),
SortOrder=Enum.SortOrder.LayoutOrder,
}

const U=j{
Parent=M,
Name="Content",
Position=UDim2.fromOffset(v,u),
Size=UDim2.new(1,-v,1,-u),
BackgroundTransparency=1,
BorderSizePixel=0,
Visible=function()
return not C()
end,
ZIndex=6,
}

const V=j{
Parent=K,
Name="DropdownLayer",
Size=UDim2.new(1,0,1,0),
Position=UDim2.fromOffset(0,0),
BackgroundTransparency=1,
BorderSizePixel=0,
ZIndex=100,
}

return{
ScreenGui=K,
Root=L,
Main=M,
TopBar=N,
TopBarLine=R,
Sidebar=S,
TabButtonHolder=T,
TabContent=U,
DropdownLayer=V,
TitleLabel=O,
MinimizeButton=P,
CloseButton=Q,
}
end)

I._videDestroy=K
I.ScreenGui=L.ScreenGui
I.Root=L.Root
I.Main=L.Main
I.TopBar=L.TopBar
I.TopBarLine=L.TopBarLine
I.Sidebar=L.Sidebar
I.TabButtonHolder=L.TabButtonHolder
I.TabContent=L.TabContent
I.DropdownLayer=L.DropdownLayer
I.TitleLabel=L.TitleLabel
I.Notifier=q(I)

table.insert(I._connections,L.MinimizeButton.Activated:Connect(function()
I:ToggleMinimized()
end))
table.insert(I._connections,L.CloseButton.Activated:Connect(function()
I:Destroy()
end))
table.insert(I._connections,I.TopBar.InputBegan:Connect(function(M)
if M.UserInputType==Enum.UserInputType.MouseButton1
or M.UserInputType==Enum.UserInputType.Touch
then
I:ClosePopups()
end
end))

I._dragCleanup=makeDraggable(I.TopBar,I.Root)

if A.ToggleKey then
const M=if typeof(A.ToggleKey)=="string"
then Enum.KeyCode[A.ToggleKey]
else A.ToggleKey
if M==nil then
error("Unknown window ToggleKey: "..tostring(A.ToggleKey))
end
table.insert(I._connections,d.InputBegan:Connect(function(N,O)
if O then
return
end
if N.KeyCode==M then
I:ToggleVisible()
end
end))
end

return I
end

function z.GetTheme(A):any
return A._theme()
end

function z.SetTheme(A,B:string|{[string]:any})
A._theme(s.Get(B))
end

function z.SetTitle(A,B:string)
A.Name=B
A.TitleLabel.Text=B
end

function z.RegisterPopup(A,B:any)
table.insert(A.Popups,B)
end

function z.UnregisterPopup(A,B:any)
const C=table.find(A.Popups,B)
if C then
table.remove(A.Popups,C)
end
end

function z.ClosePopups(A,B:any?)
for C,D in A.Popups do
if D~=B then
D:Close()
end
end
end

function z.SetMinimized(A,B:boolean)
B=B==true
if A._minimized()==B then
return
end

A._minimized(B)
if B then
A:ClosePopups()
end

if A._sizeCleanup then
A._sizeCleanup()
A._sizeCleanup=nil
end

const C=if B then A.MinimizedSize else A.ExpandedSize
A._sizeCleanup=g.Tween(A.Root,{Size=C},y,function()
A._sizeCleanup=nil
end)
end

function z.ToggleMinimized(A)
A:SetMinimized(not A._minimized())
end

function z.IsMinimized(A):boolean
return A._minimized()
end

function z.SetVisible(A,B:boolean)
A.ScreenGui.Enabled=B
if not B then
A:ClosePopups()
end
end

function z.IsVisible(A):boolean
return A.ScreenGui.Enabled
end

function z.ToggleVisible(A)
A:SetVisible(not A:IsVisible())
end

function z.SetSize(A,B:UDim2)
const C=resolveSize(B,A.ExpandedSize.X.Offset,A.ExpandedSize.Y.Offset)
A.ExpandedSize=C
A.MinimizedSize=UDim2.fromOffset(C.X.Offset,A.MinimizedSize.Y.Offset)

if A._sizeCleanup then
A._sizeCleanup()
A._sizeCleanup=nil
end

A.Root.Size=if A._minimized()then A.MinimizedSize else C
end

function z.Notify(A,B:any,C:number?)
return A.Notifier:Notify(B,C)
end

function z.Drawing(A,B)
return r(A.ScreenGui,B)
end

function z.CreateTab(A,B)
const C=p.new(A,B)
table.insert(A.Tabs,C)
if A.CurrentTab==nil then
C:Activate()
end
return C
end

function z.SelectTab(A,B:any)
B:Activate()
end

function z.GetElement(A,B:string)
return A.Elements[B]
end

function z.Export(A):{[string]:any}
const B={}
for C,D in A.Tabs do
const E=D:Export()
for F,G in E do
B[F]=G
end
end
return B
end

function z.Import(A,B:{[string]:any})
if not B then
return
end
for C,D in A.Tabs do
D:Import(B)
end
end

function z.ExportJSON(A):string
return e:JSONEncode(A:Export())
end

function z.ImportJSON(A,B:string):boolean
local C,D=pcall(function()
return e:JSONDecode(B)
end)
if C and typeof(D)=="table"then
A:Import(D)
return true
end
return false
end

function z.Destroy(A)
if A.Destroyed then
return
end
A.Destroyed=true
A.Destroying=true

if A.OnDestroyed then
A.OnDestroyed()
end

A:ClosePopups()

for B,C in table.clone(A.Tabs)do
C:Destroy()
end
table.clear(A.Tabs)
table.clear(A.Elements)

if A._dragCleanup then
A._dragCleanup()
A._dragCleanup=nil
end

if A._sizeCleanup then
A._sizeCleanup()
A._sizeCleanup=nil
end

if A.Notifier then
A.Notifier:Destroy()
A.Notifier=nil
end

for B,C in A._connections do
C:Disconnect()
end
table.clear(A._connections)

if A._videDestroy then
A._videDestroy()
A._videDestroy=nil
end

if A.ScreenGui then
A.ScreenGui:Destroy()
A.ScreenGui=nil
end
end

return z end function a.U():typeof(__modImpl())local b=a.cache.U if not b then b={c=__modImpl()}a.cache.U=b end return b.c end end end

const b=a.m()
const c=a.U()
const d=a.T()

const e={
Themes=d,
}

function e.CreateWindow(g)
return c.new(g)
end

function e.Tween(g,h,i,j)
return b.Tween(g,h,i,j)
end

return e