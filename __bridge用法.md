#### __bridge
###### Core Foundation.framework
是一套C语言框架，由于OC是C语言的基础上的提升，所以，保留了很多C的元素，在Core Text.framework中很多涉及C的语法和用法
###### Foundation.framework
是一套OC语言的框架，包含了对应Core Foundation中对应的数据类型和对象
##### __bridge作用
---
* 将Foundation框架（OC）中的对象，转化为Core Foundation中的类型，或者
* 将Core Foundation中的类型转化为Foundation中对象

示例代码如下：
<pre><code>// 将NSDictionary转化成CFDictionaryRef
NSDictionary *styleDict = @{};
CFDictionaryRef style = (__bridge CFDictionaryRef)(styleDict);

// 将CFDictionaryRef转化为NSDictionary
styleDict = (__bridge id)style;
// 与上面写发作用一致通常用id比较方便，不需要写具体的类型
styleDict = (__bridge NSDictionary *)style;

// 通用写法 
id obj = [[NSObject alloc] init];
void *p = (__bridge void *)(obj);// OC -> C

obj = (__bridge id)(p);// C -> OC
</code></pre>
\_\_bridge 还有两个衍生的兄弟**\_\_bridge_transfer**和**\_\_bridge_retained**

##### \_\_bridge_transfer 和 \_\_bridge_retained
<pre><code>CFDictionaryRef style;
NSDictionary *ocDict = (__bridge_transfer id)style;
CFDictionaryRef *dicttt = (__bridge_retained void *)ocDict;
</code></pre>
**\_\_bridge_transfer的作用是**：常用在将CF类型转换为OC对象，相比\_\_bridge，\_\_bridge_transfer会将CF类型的所有权交给OC对象，在ARC环境下，CF类型不在需要*CFRelease(CFTypeRef)*，OC对象释放，CF类型也释放了。作用等同：*CFBridgingRelease()*;

**\_\_bridge_retained的作用是**：（与\_\_bridge_transfer相反的）常用在将OC对象转换成CF类型，同时将OC对象的所有权交给CF对象来管理。作用等同：*CFBridgingRetain()*

* 在使用\_\_bridge_retained时，虽然OC对象的所有权交给了CF类型，同时CF类型的retainCount也增加了（*CFGetRetainCount()*可以得到retainCount），但是CF类型最后销毁时也只用调用一次*CFRelease(CFTypeRef)*

##### void * 与 void 区别
###### 含义
* void：是无类型
* void *：是无类型指针，void \*可以指向任何类型的数据

###### 用处
* void：对函数的返回值的限定
* void *：对函数参数的限定，传入参数可以是任何类型
<pre><code>void *p1;
int *p2
p1 = p2;
</code></pre>
上面的代码是正确的，任何类型的指针都可以给void \*赋值，但是void \*不能给任何确定的类型直接赋值，必须告诉void *需要赋值的类型。（Xcode编译器中都死正确的（跟编译器有关），只有在某些C开发的编译器中才会报错，但是需要了解）
<pre><code>void *p1;
int *p2
p2 = p1;
</code></pre>

<pre><code>void *p1;
int a = 10;
int *p2 = &a;
NSLog(@"%p", p1);
NSLog(@"%d", (int) *p2);
p1 = p2;
NSLog(@"%d", *(int *)p1);
NSLog(@"%d", (int)* p2);
</code></pre>
上面代码的输出值：<pre><code>0x7f953ad13970
10
10
10</code></pre>
解析：void *的初始化，有的编译器是直接指向0的内存地址，有的编译器是随机指向某个内存地址。