# Introduction 
Use this command to build the image
<pre>
docker build -t jupyter:1.0 .
</pre><br><br>

Use this command to run the image
<pre>
docker run -itd -p 8888:8888 jupyter:1.0
</pre><br><br>
Login with: http://127.0.0.1:8888/tree