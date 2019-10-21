<h1 id="introduction-to-6.s083-and-the-julia-language">Introduction to 6.S083 and the Julia language</h1>
<h2 id="welcome">Welcome!</h2>
<ul>
<li><p>Welcome to 6.S083!</p></li>
<li><p>New, pilot alternative class to 6.0002: some overlap, some differences</p></li>
<li><p>Prerequisite: 6.0001 (intro to computer science and programming).</p></li>
<li><p>Corequisite: 18.02 (multivariable calculus), since many applications require <strong>derivatives</strong>.</p></li>
<li><p>Language: Julia instead of Python</p></li>
</ul>
<h2 id="goals-for-the-class">Goals for the class</h2>
<ul>
<li><p><strong>Computational thinking</strong>: applying computational techniques to solve problems.</p></li>
<li><p>Use computer as <em>tool</em> to investigate and solve problems.</p></li>
<li><p>Computation also <strong>helps</strong> to understand concepts (e.g. mathematical) intuitively and deeply.</p></li>
<li><p><strong>Performance</strong> (execution speed), e.g. <span class="math inline"><em>O</em>(<em>N</em>)</span> vs <span class="math inline"><em>O</em>(<em>N</em><sup>2</sup>)</span>, not just computational complexity (“polynomial”)</p></li>
</ul>
<h2 id="syllabus">Syllabus</h2>
<ul>
<li>https://github.com/dpsanders/6.S083</li>
</ul>
<h2 id="goals-for-today">Goals for today</h2>
<ul>
<li><p>See how to use Julia</p></li>
<li><p>Learn basic syntax of Julia</p></li>
<li><p>Revisit code fragments from 6.0001 and rewrite in idiomatic Julia</p></li>
<li><p>Hence start to learn “Julian style” (different from “Pythonic style”)</p></li>
</ul>
<h2 id="the-julia-language">The Julia language</h2>
<ul>
<li><p><a href="www.julialang.org">Julia language</a>: developed at MIT in Prof. Edelman’s group in math / CSAIL; released in 2012.</p></li>
<li><p>Syntax stable since version 1.0 (August 2018).</p></li>
<li><p>Current release is 1.2 (waiting for 1.3 in a few days)</p></li>
<li><p><strong>Modern, powerful</strong> language:</p></li>
<li><p><strong>Interactive</strong> but <strong>high performance</strong> (fast) – previously mutually exclusive.</p></li>
<li><p>Free, open source software. Developed by world-wide community <a href="https://github.com/JuliaLang/julia">on GitHub</a>.</p></li>
</ul>
<h2 id="julia-ii">Julia II</h2>
<ul>
<li><p>Syntax: similar to Python / MATLAB / R, but carefully designed for high-performance Computational Science &amp; Engineering applications</p></li>
<li><p>Design means that <strong>most of Julia is written in Julia itself</strong> (unlike Python).</p></li>
<li><p>Hence much easier to examine and modify algorithms.</p></li>
<li><p>Example: <code>@edit sin(3.1)</code></p></li>
</ul>
<h2 id="some-goals-of-julia">Some goals of Julia</h2>
<ul>
<li><p>Write code that:</p>
<ul>
<li><p>is more compact: better <strong>abstractions</strong> (e.g. broadcasting)</p></li>
<li><p><strong>looks like maths</strong> (Unicode variable and operator names)</p></li>
<li><p><strong>performant</strong> (specialization, compilation)</p></li>
<li><p><strong>generic</strong> (specialization, multiple dispatch)</p></li>
</ul></li>
<li><p>Enable <strong>code re-use</strong>: see <a href="https://www.youtube.com/watch?v=kc9HwsxE1OY">Stefan Karpinski’s talk at JuliaCon 2019</a></p></li>
</ul>
<h2 id="how-to-use-julia">How to use Julia:</h2>
<ul>
<li><p><strong>Juno IDE</strong> – install Atom editor and <code>uber-juno</code> Atom package</p></li>
<li><p>Jupyter notebook via <code>IJulia.jl</code> package</p></li>
<li><p>REPL (Read–Eval–Print–Loop) in the terminal</p></li>
</ul>
<h2 id="variables">Variables</h2>
<ul>
<li><p>Python:</p>
<div class="sourceCode" id="cb1"><pre class="sourceCode python"><code class="sourceCode python"><span id="cb1-1"><a href="#cb1-1"></a>pi <span class="op">=</span> <span class="dv">355</span><span class="op">/</span><span class="dv">113</span></span>
<span id="cb1-2"><a href="#cb1-2"></a>radius <span class="op">=</span> <span class="fl">2.2</span></span>
<span id="cb1-3"><a href="#cb1-3"></a>area <span class="op">=</span> pi<span class="op">*</span>(radius<span class="op">**</span><span class="dv">2</span>)</span>
<span id="cb1-4"><a href="#cb1-4"></a>circumference <span class="op">=</span> pi<span class="op">*</span>(radius<span class="op">*</span><span class="dv">2</span>)</span></code></pre></div></li>
<li><p>Julia:</p>
<div class="sourceCode" id="cb2"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb2-1"><a href="#cb2-1"></a>r = <span class="fl">2.2</span>   <span class="co"># \scrr&lt;TAB&gt; for italic `r`</span></span>
<span id="cb2-2"><a href="#cb2-2"></a>area = π * r^<span class="fl">2</span>   <span class="co"># \pi&lt;TAB&gt;   # ^ for powers</span></span>
<span id="cb2-3"><a href="#cb2-3"></a>circumference = π * (<span class="fl">2</span>r)   <span class="co"># implicit multiplication</span></span></code></pre></div></li>
<li><p>π (or <code>pi</code>) pre-defined as special value with special behaviour:</p>
<div class="sourceCode" id="cb3"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb3-1"><a href="#cb3-1"></a>@show π</span></code></pre></div></li>
</ul>
<h2 id="types">Types</h2>
<ul>
<li><p>Values like <code>3</code> stored as bits (<code>0</code> / <code>1</code>) in memory.</p></li>
<li><p>Julia associates <strong>types</strong> to values: specify <strong>behaviour</strong> of the bits under operations.</p></li>
<li><p>Some basic types:</p>
<div class="sourceCode" id="cb4"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb4-1"><a href="#cb4-1"></a>x = <span class="fl">3</span></span>
<span id="cb4-2"><a href="#cb4-2"></a>@show typeof(x)   <span class="co"># Int64</span></span>
<span id="cb4-3"><a href="#cb4-3"></a></span>
<span id="cb4-4"><a href="#cb4-4"></a>y = -<span class="fl">3.1</span>   <span class="co"># Float64</span></span>
<span id="cb4-5"><a href="#cb4-5"></a>@show typeof(y)</span>
<span id="cb4-6"><a href="#cb4-6"></a></span>
<span id="cb4-7"><a href="#cb4-7"></a>s = <span class="st">&quot;6.S083&quot;</span>  <span class="co"># String</span></span></code></pre></div></li>
</ul>
<h2 id="section"></h2>
<ul>
<li><p>Functions <em>behave differently</em> for different types: <code>julia   3 * 3</code></p>
<div class="sourceCode" id="cb5"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb5-1"><a href="#cb5-1"></a><span class="st">&quot;3&quot;</span> * <span class="st">&quot;3&quot;</span></span></code></pre></div></li>
<li><p>This is fundamental to how Julia works.</p></li>
</ul>
<h2 id="functions">Functions</h2>
<ul>
<li><p>Functions are <strong>most important constructs</strong> in any program, since they enable <strong>abstraction</strong> and <strong>code reuse</strong>.</p></li>
<li><p>Short syntax for simple mathematical functions</p>
<div class="sourceCode" id="cb6"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb6-1"><a href="#cb6-1"></a>area(r) = π * r^<span class="fl">2</span></span>
<span id="cb6-2"><a href="#cb6-2"></a></span>
<span id="cb6-3"><a href="#cb6-3"></a>A = area(<span class="fl">1.0</span>)</span></code></pre></div></li>
<li><p>Long syntax:</p>
<div class="sourceCode" id="cb7"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb7-1"><a href="#cb7-1"></a><span class="st">&quot;&quot;&quot;Calculate area of circle of radius `r`.&quot;&quot;&quot;</span></span>
<span id="cb7-2"><a href="#cb7-2"></a><span class="kw">function</span> area(r)</span>
<span id="cb7-3"><a href="#cb7-3"></a>    A = π * r^<span class="fl">2</span>    <span class="kw">function</span></span>
<span id="cb7-4"><a href="#cb7-4"></a>    <span class="kw">return</span> A</span>
<span id="cb7-5"><a href="#cb7-5"></a><span class="kw">end</span></span>
<span id="cb7-6"><a href="#cb7-6"></a></span>
<span id="cb7-7"><a href="#cb7-7"></a>r = <span class="fl">1.0</span></span>
<span id="cb7-8"><a href="#cb7-8"></a>A = area(r)  <span class="co">#</span></span></code></pre></div></li>
</ul>
<h2 id="functions-ii">Functions II</h2>
<ul>
<li><p>Docstring is written <em>above</em> function body in Julia.</p></li>
<li><p><code>A</code> is <strong>local variable</strong>: exists only inside functiojn</p></li>
<li><p><code>"""</code> denotes multiline string.</p></li>
<li><p>Use <code>?area</code> from REPL or notebook to see documentation.</p></li>
<li><p>Operations with <code>π</code> convert to <code>Float64</code>.</p></li>
<li><p>In Julia: <em>everything should be in a function</em>.</p></li>
</ul>
<h2 id="conditionals">Conditionals</h2>
<ul>
<li><p><code>if...then...else</code></p>
<div class="sourceCode" id="cb8"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb8-1"><a href="#cb8-1"></a>a = <span class="fl">5</span></span>
<span id="cb8-2"><a href="#cb8-2"></a></span>
<span id="cb8-3"><a href="#cb8-3"></a><span class="kw">if</span> a &lt; <span class="fl">4</span></span>
<span id="cb8-4"><a href="#cb8-4"></a>    s = <span class="st">&quot;small&quot;</span></span>
<span id="cb8-5"><a href="#cb8-5"></a></span>
<span id="cb8-6"><a href="#cb8-6"></a><span class="kw">elseif</span> a &lt; <span class="fl">6</span></span>
<span id="cb8-7"><a href="#cb8-7"></a>    s = <span class="st">&quot;medium&quot;</span></span>
<span id="cb8-8"><a href="#cb8-8"></a></span>
<span id="cb8-9"><a href="#cb8-9"></a><span class="kw">else</span></span>
<span id="cb8-10"><a href="#cb8-10"></a>    s = <span class="st">&quot;large&quot;</span></span>
<span id="cb8-11"><a href="#cb8-11"></a><span class="kw">end</span></span>
<span id="cb8-12"><a href="#cb8-12"></a></span>
<span id="cb8-13"><a href="#cb8-13"></a>s</span></code></pre></div></li>
</ul>
<h2 id="conditionals-ii">Conditionals II</h2>
<ul>
<li><p>No <code>:</code>; but needs <code>end</code></p></li>
<li><p>Using <code>end</code> means that indentation is <em>not</em> significant</p></li>
<li><p>That is, not significant <em>for the computer</em>, but still is <em>for us humans</em> – make sure to always indent correctly!</p></li>
</ul>
<h2 id="loops">Loops</h2>
<ul>
<li><p>Again replace <code>:</code> by <code>end</code></p></li>
<li><p>Use simple loop to find square root using “guess and check” / exhaustive enumeration:</p></li>
</ul>
<h2 id="loops-ii">Loops II</h2>
<div class="sourceCode" id="cb9"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb9-1"><a href="#cb9-1"></a><span class="kw">function</span> square_root(n)</span>
<span id="cb9-2"><a href="#cb9-2"></a>    found = <span class="fl">0</span></span>
<span id="cb9-3"><a href="#cb9-3"></a></span>
<span id="cb9-4"><a href="#cb9-4"></a>    <span class="kw">for</span> i <span class="kw">in</span> <span class="fl">1</span>:n</span>
<span id="cb9-5"><a href="#cb9-5"></a>        <span class="kw">if</span> i^<span class="fl">2</span> ≥ abs(n)   <span class="co"># \ge&lt;TAB&gt; or &gt;=</span></span>
<span id="cb9-6"><a href="#cb9-6"></a>            found = i    <span class="co"># i doesn&#39;t exist outside loop</span></span>
<span id="cb9-7"><a href="#cb9-7"></a>            <span class="kw">break</span></span>
<span id="cb9-8"><a href="#cb9-8"></a>        <span class="kw">end</span></span>
<span id="cb9-9"><a href="#cb9-9"></a>    <span class="kw">end</span></span>
<span id="cb9-10"><a href="#cb9-10"></a></span>
<span id="cb9-11"><a href="#cb9-11"></a>    <span class="kw">if</span> found^<span class="fl">2</span> == n</span>
<span id="cb9-12"><a href="#cb9-12"></a>        <span class="kw">return</span> (found, :exact)</span>
<span id="cb9-13"><a href="#cb9-13"></a>    <span class="kw">else</span></span>
<span id="cb9-14"><a href="#cb9-14"></a>        <span class="kw">return</span> (found, :not_exact)</span>
<span id="cb9-15"><a href="#cb9-15"></a>    <span class="kw">end</span></span>
<span id="cb9-16"><a href="#cb9-16"></a><span class="kw">end</span></span>
<span id="cb9-17"><a href="#cb9-17"></a></span>
<span id="cb9-18"><a href="#cb9-18"></a>square_root(<span class="fl">10</span>), square_root(<span class="fl">9</span>)</span></code></pre></div>
<h2 id="loops-iii">Loops III</h2>
<ul>
<li><p>Always prefer to <em>return information</em> instead of printing</p></li>
<li><p>Julia automatically <em>displays</em> last result</p></li>
<li><p><code>:a</code> is a <code>Symbol</code>, a type of optimized string</p></li>
<li><p><strong>Exercise</strong>: Does <code>square_root</code> work with <code>Float64</code>? Should it?</p></li>
</ul>
<h2 id="floating-point-arithmetic">Floating-point arithmetic</h2>
<ul>
<li><p>Recall: floating-point arithmetic gives <em>approximation</em> to real numbers:</p>
<div class="sourceCode" id="cb10"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb10-1"><a href="#cb10-1"></a>x = <span class="fl">0.0</span></span>
<span id="cb10-2"><a href="#cb10-2"></a></span>
<span id="cb10-3"><a href="#cb10-3"></a><span class="kw">for</span> i <span class="kw">in</span> <span class="fl">1</span>:<span class="fl">10</span></span>
<span id="cb10-4"><a href="#cb10-4"></a>    <span class="kw">global</span> x += <span class="fl">0.1</span>    <span class="co"># `global` not needed inside a function</span></span>
<span id="cb10-5"><a href="#cb10-5"></a>    @show x    <span class="co"># prefer @show instead of print</span></span>
<span id="cb10-6"><a href="#cb10-6"></a><span class="kw">end</span></span>
<span id="cb10-7"><a href="#cb10-7"></a></span>
<span id="cb10-8"><a href="#cb10-8"></a>x, (x == <span class="fl">1.0</span>)</span></code></pre></div></li>
</ul>
<h2 id="section-1"></h2>
<ul>
<li><p><code>@show</code> prints name <em>and</em> value of a variable; prefer it to <code>print</code> for debugging</p></li>
<li><p>Internal representation:</p></li>
</ul>
<div class="sourceCode" id="cb11"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb11-1"><a href="#cb11-1"></a>bitstring(<span class="fl">0.1</span>)</span></code></pre></div>
<h2 id="debugging">Debugging</h2>
<ul>
<li><p>Juno IDE contains <em>interactive debugger</em></p></li>
<li><p>Debug function with arguments by typing in Juno REPL pane: <code>Juno.@enter f(1, 2)</code></p></li>
<li><p>Demo</p></li>
</ul>
<h2 id="recursion">Recursion</h2>
<ul>
<li><p>Long form: ```julia function fact2(n) if n ≤ 1 return 1 end</p>
<pre><code>  return n * fact2(n-1)</code></pre>
<p>end ```</p></li>
</ul>
<h2 id="section-2"></h2>
<ul>
<li><p>Short form: <code>julia   fact(n) = (n ≤ 1) ? 1 : ( n * fact(n-1) )</code></p></li>
<li><p><strong>Ternary operator</strong> <code>a ? b : c</code> – “if a then b, else c”</p></li>
<li><p>Leads to short but less readable code</p>
<div class="sourceCode" id="cb13"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb13-1"><a href="#cb13-1"></a>fact(<span class="fl">10</span>), fact2(<span class="fl">10</span>)</span></code></pre></div></li>
</ul>
<h2 id="array-comprehensions">Array comprehensions</h2>
<ul>
<li><p>Build <strong>array</strong> of values by repeating calculation:</p>
<div class="sourceCode" id="cb14"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb14-1"><a href="#cb14-1"></a>factorials = [fact(n) <span class="kw">for</span> n <span class="kw">in</span> <span class="fl">1</span>:<span class="fl">21</span>]</span></code></pre></div></li>
<li><p>Goes wrong due to <strong>overflow</strong>: result &gt; max value storable in <code>Int64</code></p></li>
<li><p>NB: <em>Different</em> from Python; <em>silent</em> behaviour</p></li>
<li><p>(Slow) solution: <code>BigInt</code> type – arbitrarily large integers</p>
<div class="sourceCode" id="cb15"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb15-1"><a href="#cb15-1"></a>fact(big(<span class="fl">30</span>))</span></code></pre></div></li>
<li><p>Can catch overflow using <em>checked arithmetic</em>: <code>julia   # Base.checked_mul(10^20, 10^20)</code></p></li>
</ul>
<h2 id="towers-of-hanoi">Towers of Hanoi</h2>
<ul>
<li><p>Transfer tower of discs from one peg to another; discs must always be in order</p></li>
<li><p>Remember: Don’t print, return instead</p>
<div class="sourceCode" id="cb16"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb16-1"><a href="#cb16-1"></a><span class="kw">function</span> towers(n, from, to, spare)</span>
<span id="cb16-2"><a href="#cb16-2"></a>    n == <span class="fl">1</span> &amp;&amp; <span class="kw">return</span> [ (from, to) ]</span>
<span id="cb16-3"><a href="#cb16-3"></a></span>
<span id="cb16-4"><a href="#cb16-4"></a>    <span class="kw">return</span> vcat(towers(n-<span class="fl">1</span>, from, spare, to),</span>
<span id="cb16-5"><a href="#cb16-5"></a>                towers(<span class="fl">1</span>, from, to, spare),</span>
<span id="cb16-6"><a href="#cb16-6"></a>                towers(n-<span class="fl">1</span>, spare, to, from) )</span>
<span id="cb16-7"><a href="#cb16-7"></a><span class="kw">end</span></span>
<span id="cb16-8"><a href="#cb16-8"></a></span>
<span id="cb16-9"><a href="#cb16-9"></a>towers(<span class="fl">4</span>, <span class="fl">1</span>, <span class="fl">2</span>, <span class="fl">3</span>)</span></code></pre></div></li>
</ul>
<h2 id="section-3"></h2>
<ul>
<li><p><code>[ (1, 2) ]</code> creates a <code>Vector</code> containing a tuple</p></li>
<li><p><code>&amp;&amp;</code> is like “if-then” (but it “short-circuits”)</p></li>
<li><p><code>vcat</code> concatenates arrays</p></li>
</ul>
<h2 id="hanoi-ii">Hanoi II</h2>
<ul>
<li><p>Don’t want to write <code>(1, 2, 3)</code> each time.</p></li>
<li><p><em>Make new version of function</em> – called a <em>method</em>: ```julia</p>
<p>towers(n) = towers(n, 1, 2, 3) # defines a method</p>
<p>towers(3) ```</p></li>
<li><p>Same function name, different number of arguments.</p></li>
<li><p><em>Extremely common</em> to use this “pattern” in Julia.</p></li>
<li><p><em>No performance loss</em>!</p></li>
<li><p><strong>Exercise</strong>: Modify the code to track the number of each disc. Emit moves as <code>(i, j, k)</code> to represent “disc i moves from peg j to peg k”.</p></li>
</ul>
<h2 id="objects-composite-types">Objects: Composite types</h2>
<ul>
<li><p>Define <em>new types</em> of object by grouping data (“attributes” / “fields”) that belong together.</p></li>
<li><p>Unlike Python, <em>functions do not live inside objects</em> – one of key changes</p></li>
<li><p>Basic syntax for defining new type:</p>
<div class="sourceCode" id="cb17"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb17-1"><a href="#cb17-1"></a>struct CoordinatePair</span>
<span id="cb17-2"><a href="#cb17-2"></a>    x::<span class="dt">Float64</span></span>
<span id="cb17-3"><a href="#cb17-3"></a>    y::<span class="dt">Float64</span></span>
<span id="cb17-4"><a href="#cb17-4"></a><span class="kw">end</span></span></code></pre></div></li>
</ul>
<h2 id="constructors">Constructors</h2>
<ul>
<li><p>Create objects using <strong>constructor</strong> (function with same name):</p>
<div class="sourceCode" id="cb18"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb18-1"><a href="#cb18-1"></a>o = CoordinatePair(<span class="fl">0</span>, <span class="fl">0</span>)</span>
<span id="cb18-2"><a href="#cb18-2"></a>x = CoordinatePair(<span class="fl">1</span>, <span class="fl">2</span>)</span></code></pre></div></li>
<li><p>Julia <em>automatically</em> defines sensible constructor and display methods ()<code>show</code> methods.</p></li>
<li><p>Add constructor by adding new method <code>julia   CoordinatePair() = CoordinatePair(0, 0)</code></p></li>
</ul>
<h2 id="functions-on-types">Functions on types</h2>
<ul>
<li><p>Add function acting on type using <strong>type annotation</strong>, <code>::</code>:</p>
<div class="sourceCode" id="cb19"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb19-1"><a href="#cb19-1"></a>distance(a::CoordinatePair, b::CoordinatePair) = √ ( (a.x - b.x)^<span class="fl">2</span> + (a.y - b.y)^<span class="fl">2</span> )</span>
<span id="cb19-2"><a href="#cb19-2"></a></span>
<span id="cb19-3"><a href="#cb19-3"></a>distance(o, x)</span></code></pre></div></li>
<li><div class="sourceCode" id="cb20"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb20-1"><a href="#cb20-1"></a>origin() = CoordinatePair()</span>
<span id="cb20-2"><a href="#cb20-2"></a></span>
<span id="cb20-3"><a href="#cb20-3"></a>distance(a::CoordinatePair) = distance(origin(), a)</span>
<span id="cb20-4"><a href="#cb20-4"></a></span>
<span id="cb20-5"><a href="#cb20-5"></a>distance(x)</span></code></pre></div></li>
</ul>
<h2 id="new-types-of-number">New types of number</h2>
<ul>
<li><p>Julia is very well suited to defining new types of number:</p>
<div class="sourceCode" id="cb21"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb21-1"><a href="#cb21-1"></a>struct Fraction</span>
<span id="cb21-2"><a href="#cb21-2"></a>    num::<span class="dt">Int</span></span>
<span id="cb21-3"><a href="#cb21-3"></a>    denom::<span class="dt">Int</span></span>
<span id="cb21-4"><a href="#cb21-4"></a><span class="kw">end</span></span>
<span id="cb21-5"><a href="#cb21-5"></a></span>
<span id="cb21-6"><a href="#cb21-6"></a>Base.show(io::<span class="dt">IO</span>, x::Fraction) = print(io, x.num, <span class="st">&quot; // &quot;</span>, x.denom)</span>
<span id="cb21-7"><a href="#cb21-7"></a></span>
<span id="cb21-8"><a href="#cb21-8"></a>x = Fraction(<span class="fl">3</span>, <span class="fl">4</span>)</span></code></pre></div></li>
</ul>
<h2 id="arithmetic">Arithmetic</h2>
<ul>
<li><p>We will <em>extend</em> Julia’s arithmetic operations to work on our new type by <code>import</code>ing the relevant operations:</p>
<div class="sourceCode" id="cb22"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb22-1"><a href="#cb22-1"></a><span class="kw">import</span> Base: *</span>
<span id="cb22-2"><a href="#cb22-2"></a></span>
<span id="cb22-3"><a href="#cb22-3"></a>*(x::Fraction, y::Fraction) = Fraction(x.num * y.num, x.denom * y.denom)</span>
<span id="cb22-4"><a href="#cb22-4"></a></span>
<span id="cb22-5"><a href="#cb22-5"></a>x = Fraction(<span class="fl">3</span>, <span class="fl">4</span>)</span>
<span id="cb22-6"><a href="#cb22-6"></a>y = Fraction(<span class="fl">6</span>, <span class="fl">5</span>)</span>
<span id="cb22-7"><a href="#cb22-7"></a></span>
<span id="cb22-8"><a href="#cb22-8"></a>x * y   <span class="co"># result not in lowest terms</span></span></code></pre></div></li>
</ul>
<h2 id="methods">Methods</h2>
<ul>
<li><p>Alternate syntax:</p>
<div class="sourceCode" id="cb23"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb23-1"><a href="#cb23-1"></a>*(x, y)</span></code></pre></div></li>
<li><p>In Julia, <code>*</code> is <em>just a normal function</em></p></li>
<li><p>But has large number of <em>methods</em> for <strong>objects of different types</strong>:</p>
<div class="sourceCode" id="cb24"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb24-1"><a href="#cb24-1"></a>methods(*)</span></code></pre></div></li>
</ul>
<h2 id="section-4"></h2>
<ul>
<li><p>Have not yet defined multiplication of <code>Fraction</code> by <code>Int</code>, so it throws an error:</p>
<div class="sourceCode" id="cb25"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb25-1"><a href="#cb25-1"></a>Fraction(<span class="fl">3</span>, <span class="fl">4</span>) * <span class="fl">1</span></span></code></pre></div></li>
<li><p>So just <em>add another method</em>!</p></li>
<li><p>Implement in terms of functionality we already defined:</p>
<div class="sourceCode" id="cb26"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb26-1"><a href="#cb26-1"></a>*(x::Fraction, y::<span class="dt">Int</span>) = x * Fraction(y, <span class="fl">1</span>)</span>
<span id="cb26-2"><a href="#cb26-2"></a>Fraction(<span class="fl">3</span>, <span class="fl">4</span>) * <span class="fl">1</span></span></code></pre></div></li>
<li><p>Or make specialized version instead (may be more efficient):</p>
<div class="sourceCode" id="cb27"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb27-1"><a href="#cb27-1"></a>*(x::Fraction, y::<span class="dt">Int</span>) = Fraction(x.num * y, x.denom)</span></code></pre></div></li>
<li><p><strong>Exercise</strong>: Implement <code>+</code></p></li>
</ul>
<h2 id="introspection-asking-julia-what-it-is-thinking">Introspection: Asking Julia what it is thinking</h2>
<ul>
<li><p><code>@which</code>: find <em>which</em> method Julia will call for certain combination of types.</p></li>
<li><p><code>@edit</code>: view and edit source code of a method.</p>
<div class="sourceCode" id="cb28"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb28-1"><a href="#cb28-1"></a>@which sin(<span class="fl">3.1</span>)</span>
<span id="cb28-2"><a href="#cb28-2"></a></span>
<span id="cb28-3"><a href="#cb28-3"></a>@edit sin(<span class="fl">3.1</span>)</span></code></pre></div></li>
<li><p>May need to set <code>EDITOR</code> environment variable.</p></li>
</ul>
<h2 id="interpreters">Interpreters</h2>
<ul>
<li><p>Python is an <strong>interpreted</strong> language (as are R, MATLAB):</p>
<ul>
<li><p>A program (“CPython interpreter”) is constantly running.</p></li>
<li><p>Examines a version (“bytecode”) of Python source code over and over again as program is running</p></li>
<li><p>When sees <code>a + b</code>, examines “boxes” <code>a</code> and <code>b</code> to find what <em>types</em> of values they contain.</p></li>
<li><p>Then chooses correct version of <code>+</code> operator and executes it on copies of variables that “live inside” the interpreter.</p></li>
</ul></li>
</ul>
<h2 id="section-5"></h2>
<ul>
<li><p>It’s a program that “behaves as if it were a computer”.</p></li>
<li><p>Layer in between your code and the hardware.</p></li>
<li><p>Possible to <a href="https://www.aosabook.org/en/500L/a-python-interpreter-written-in-python.html">implement Python interpreter in 500 lines of Python</a>.</p></li>
<li><p>Python is slow because it does those operations <em>at every single step</em>, <em>over and over again</em>.</p></li>
</ul>
<h2 id="compilers">Compilers</h2>
<ul>
<li><p>Julia can be fast since it is a <strong>compiled</strong> language (as are C, C++):</p>
<ul>
<li>Tries to do lookups once before program runs</li>
<li>Turns whole program into machine code that controls hardware (CPU etc.) directly</li>
<li>No middle layer that gets in the way</li>
</ul></li>
</ul>
<h2 id="section-6"></h2>
<ul>
<li><p>More time spent compiling at start, but overall gain, provided prog ram runs for long enough.</p></li>
<li><p>Python can be quicker for <em>small enough</em> tasks.</p></li>
<li><p>Julia can be slow if has to fall back to Python-like behaviour when it can’t work everything out at start.</p></li>
</ul>
<h2 id="levels-of-compilation">Levels of compilation</h2>
<ul>
<li><p>Code passes through several levels in compilation process</p></li>
<li><p>We can inspect result at each level:</p></li>
<li><p>Lowered code – lower-level Julia code</p></li>
<li><p>Typed code – after type inference</p></li>
<li><p>LLVM code – translated into an “intermediate representation” (IR) for the LLVM compiler</p></li>
<li><p>Native code – machine code to run directly on CPU</p></li>
</ul>
<h2 id="section-7"></h2>
<div class="sourceCode" id="cb29"><pre class="sourceCode julia"><code class="sourceCode julia"><span id="cb29-1"><a href="#cb29-1"></a>f(x) = <span class="fl">3</span>x</span>
<span id="cb29-2"><a href="#cb29-2"></a></span>
<span id="cb29-3"><a href="#cb29-3"></a>@code_lowered f(<span class="fl">3</span>)</span>
<span id="cb29-4"><a href="#cb29-4"></a>@code_typed optimize=false f(<span class="fl">3</span>)</span>
<span id="cb29-5"><a href="#cb29-5"></a>@code_typed f(<span class="fl">3</span>)</span>
<span id="cb29-6"><a href="#cb29-6"></a>@code_llvm optimize=false f(<span class="fl">3</span>)</span>
<span id="cb29-7"><a href="#cb29-7"></a>@code_llvm f(<span class="fl">3</span>)</span>
<span id="cb29-8"><a href="#cb29-8"></a>@code_native f(<span class="fl">3</span>)</span></code></pre></div>
<h2 id="why-can-julia-be-fast">Why can Julia be fast?</h2>
<ul>
<li><code>@code_typed f(3)</code> and <code>@code_typed f(3.0)</code> give different results:</li>
</ul>
<blockquote>
<p>Julia <em>infers</em> types for all variables throughout function</p>
</blockquote>
<ul>
<li><code>@code_native f(3)</code> and <code>@code_native f(3.0)</code> give <em>different</em> code</li>
</ul>
<blockquote>
<p>Julia creates <em>specialized versions</em> of functions for different input argument <em>types</em></p>
</blockquote>
<h2 id="section-8"></h2>
<ul>
<li><p>Type inference + specialization are key mechanisms for Julia’s speed</p></li>
<li><p>If type inference fails, Julia reverts to Python-style mechanism and can be slow</p></li>
<li><p>Solution: Make sure type inference succeeds!</p></li>
<li><p>Tools: <code>@code_warntype</code>, <code>Traceur.jl</code> package</p></li>
</ul>
<h2 id="review">Review</h2>
<ul>
<li>Julia is similar to Python
<ul>
<li>Readable, compact</li>
<li>Compact</li>
<li>Fun</li>
</ul></li>
<li>Julia is <em>very different</em> from Python
<ul>
<li>Emphasis on <strong>performance</strong>: compiled</li>
<li>Code looks like math</li>
</ul></li>
</ul>
<h2 id="section-9"></h2>
<ul>
<li>Methods live <em>outside</em> objects</li>
<li>Not traditional OOP</li>
<li>New paradigm based around <strong>multiple dispatch</strong></li>
</ul>
