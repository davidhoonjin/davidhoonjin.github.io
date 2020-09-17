---
layout: post
title: <font size="7em"> <font style="color:Dodgerblue;">Projects      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <= Click </font></font>
date: 2020-02-03
---
<br>
<font size="6em" style="color:black;">●<u>BCI As an Emotional Assistant :</u></font><font size="6em" style="color:black;">A system that classifies the user's emotional state, and gives feedback when needed.</font><font size="5em">(Feb,2020)<br></font>
<img src="/images/fulls/09_1.jpg" class="image-img" width = "800"><br>
<font size="6em" style="color:black;">●<u>Sensing Soft Robot (Silicon Finger with PVDF sensor):</u></font><font size="6em" style="color:black;">Automated soft finger</font> <font size="5em">(Mar,2020 ~)<br></font>
<img src="/images/fingers/222.jpg" class="image-img" width = "800" ><br>
<br><font size="6em" style="color:black;">
●CAPTCHA PROJECT  
</font> <font size="5em"> (Aug,2020 - Aug,2020) </font>
<img src="/images/fulls/captcha2.jpg" class="image-img" width = "800" ><br>
<hr style="height:3px">


<!-- <p style="background-color:DodgerBlue;"><font size="2em">.</font></p>-->

<br>
<br>
<h1 style="background-color:LightCyan; text-align:center; color:black;"><font size="6em">
 Brain Computer Interface As an Emotional Assistant</font></h1>
 <div style="float:right;">
<h><font size="5em">Computational Neuro Engineering(CoNE) LAB</font><br>
<br></h></div><br>

<font size="5em" style="color:black;">
<br>
<font size="5em">
<u>Motivation & Idea:</u> These days more and more people are suffering from depression, stress and mental illness. Most of these symptoms are caused by continuously accumulated emotional stresses. If I could develop an intelligent system that can interact with human and help the user to bring unhealthy emotional state to normal state(or even desired state), it will make our life better. Also, people tend to spend more time with Electronic devices and less with human beings so it's about time for the computers to care our mental health too.<br><br></font>

<font size="5em">
<u>Solution:</u> Drawing from the "Valence-Arousal Model", we could build a system that measures bio-signals(EEG, PPG, GSR) to recognize the “inner” emotion (as humans could control their facial expressions). If it's classified as negative valence, positive stimuli such as music or colored lights could help bring the user's emotion back to the desired state. <br><br>
<u>Method:</u> Through experiment, collect EEG and GSR data and epoch it after signal processing. I extracted features from them and built a classification model with SVM. Out of "n" number of windows in a row, system counts how many windows(m) are classified as positive or negative valence. If the system returns negative valence, it controls surrounding environments to bring the user's emotion back. </font>
</font><br>
<br>

<img src="/images/fulls/bci1.jpg" class="image-img" width = "800"><br>
<img src="/images/fulls/bci2.jpg" class="image-img" width = "800"> <br>
<img src="/images/fulls/bci3.jpg" class="image-img" width = "800"> <br>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font size="5em" style="color:black;">
Currently accuracy of emotion classification is over 85%, and still working on improving the model. On-line experiment is planned to be held on September.
<br><br>
<br>

<u>Throughout the Project...</u> <br>
Developed Matlab function :<br>
1. <a href="/images/GSR_feature.m">Click here to download GSR feature extraction Matlab code</a><br><br>
Future project idea : &nbsp;&nbsp; "Removing Ocular(and emg) Artifact from EEG through Machine Learning"<br>
-> Motivation - Previous thesis only used ICA-based feature. If PCA and Regression based features are considered, accuracy can be improved.
</font>
<hr style="height:3px">










<br>
<br>
<h1 style="background-color:LightCyan; text-align:center; color:black;"><font size="6em">
 Sensing Soft Robot (Silicon Finger with PVDF sensor)</font></h1>
<div style="float:right;"><font size="5em" >
 Nanoelectronics Device LAB(NDL)</font></div>
 <br>
 <br>

 <br><font size="5em" style="color:black;">
 <u>Motivation & Idea:</u> Human-Friendly Flexible Finger can be advantageous in many fields that robots interacts with human body. When applied to Medical Robots or Medical catheters, minimum incision with soft movement will be possible.<br></font>
 <br>
 <font size="6em" style="color:black;">Therefore, Currently developing pneumatic silicon fingers with piezoelectric deflection sensor as a Tactile sensor inside(on the side where they meet). With the sensors, precise control is possible and can fully atomize the control.</font>
 <br><br>
<hr style="height:3px">
<h1 style="color:black;"><font size="6em"><u>First Model(Without PVDF Sensor), ditch outside only</u></font></h1>
<img src="/images/fingers/simul1.jpg" class="image-img" width="800"><br>
<br>
<img src="/images/fingers/simul2.jpg" class="image-img" width="800"><br>
<font size="5em" style="color:black;">↑ Simulation result shows, difference in thickness near the air channel brings different strain rate <br>             </font>
<br>
<img src="/images/fingers/1st.jpg" class="image-img" width="800"><br>

<div class="w3-content" style="max-width:400px">
  <img class="mySlides" src="/images/fingers/finger1.jpg" style="width:100%">
  <img class="mySlides" src="/images/fingers/finger2.jpg" style="width:100%">
  <img class="mySlides" src="/images/fingers/finger3.jpg" style="width:100%">
  <img class="mySlides" src="/images/fingers/finger4.jpg" style="width:100%">
</div>
<hr style="height:3px">
<script>
var slideIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > x.length) {slideIndex = 1}
  x[slideIndex-1].style.display = "block";
  setTimeout(carousel, 500);
}
</script>

<h1 style="color:black;"><font size="6em"><u> Second Model(Without PVDF Sensor) with ditch both inside and outside</u></font></h1><br>
<img src="/images/fingers/2.jpg" class="image-img" width="800"><br>
<font size="5em" style="color:black;">In order to enhance strain rate difference between upper and lower layer, also added ditch inside<br>             </font>
<img src="/images/fingers/2nd.jpg" class="image-img" width="800"><br>
<h1 style="color:black;"><font size="6em">Operation Comparison Between First and Second Model<br>             </font></h1>
<img src="/images/fingers/comp.jpg" class="image-img" width="800"><br>
<hr style="height:3px"><br>
<h1 style="color:black;"><font size="6em"> <u>Third Model to Attatch PVDF Sensor</u></font></h1><br>
<img src="/images/fingers/3d2.jpg" class="image-img" width="800"><br>
<font size="5em" style="color:black;">↑ 3D mold image to make a pocket to attach PVDF prezo electric sensor<br>             </font>
<img src="/images/fingers/222.jpg" class="image-img" width="800"><br>

<img src="/images/fingers/with bumps and sensor holder_2_2.jpg" class="image-img" width="300" height="200">
<img src="/images/fingers/with_sensor.jpg" class="image-img" width="300" height="200"><br>
<hr style="height:3px"><br>
<h1 style="color:black;"><font size="6em"><u> Fourth Model Fully Automized by PVDF Sensor</u></font></h1><br>
<font size="5em" style="color:black;">
Comming soon</font>
<br>
<br><br>
<br>
<br>
<br>
<hr style="height:3px">










<br>
<h1 style="background-color:LightCyan; text-align:center; color:black;"><font size="6em">
CAPTCHA PROJECT - Personal Project
</font></h1>
<div style="float:right;"><font size="5em"> AUG,2020 </font></div>
<br>
<font style="color:black;">
<font size="6em">Developed a system that can read distorted text with Machine Learning</font><br>
Used the same images that "Keras (OCR model for reading Captchas))" used<br>
<font size="5em">
<u>Motivation:</u> Understanding Machine Learning theoretically and implementing the idea through python to acquire practical machine learning techniques.<br><br>
<u>Promblem:</u> Small amount of data sets that caused over fitting and low accuracy.<br><br>
<u>Idea & Solution:</u> In order to use this model in every other CAPTCHA images, I thought of slicing the image into single characters and train each of them into 36(number of alphabets + 0~9 numbers) classes. Also, through data augmentation, I multiplied training data to prevent over fitting and improve accuracy to <font size="6em"><u>95%</u></font>. <br>
</font></font>
<br>
<br>
<img src="/images/fulls/captcha1_1.jpg" class="image-img" width="800"><br>
<img src="/images/fulls/captcha1_2.jpg" class="image-img" width="800"><br>
<hr style="height:3px"><br>
<img src="/images/fulls/captcha2.jpg" class="image-img" width="800"><br>
<hr style="height:3px"><br>
<h1 style="color:black;"><font size="6em">Result</font></h1>
<img src="/images/fulls/captcha3.jpg" class="image-img" width="800" height="600"><br>
<hr style="height:3px">
<br>









<br>
<h1 style="background-color:LightCyan; text-align:center; color:black;"><font size="6em">
VLSI (EE 460R)Course Project </font></h1>
<div style="float:right;"><font size="5em"> University of Texas at Austin (Aug,2019 – Dec,2019)
</font></div>
<br><br>

<font size="5em" style="color:black;">
<u>"SSP(Synchronous Serial Port) Design” with Verilog</u><br></font>
<br>
<img src="/images/fulls/VLSI4.jpg" class="image-img" width="500" height="300"><br>
Sketch ↑ <br>
<img src="/images/fulls/Transmiter_part.jpg" class="image-img" width="800" height="100"><br>
Transmit Works ↑<br>
<img src="/images/fulls/FIFO.jpg" class="image-img" width="800" height="300"><br>
FIFO Works ↑<br>
<img src="/images/fulls/Transmiter_Reciever_connection.jpg" class="image-img" width="800" height="300"><br>
Receiver Works and Connected to Transmitter ↑<br>
<img src="/images/fulls/SSP.jpg" class="image-img" width="800" height="800"><br>
SSP Works (Data out at the top, Data in at the bottom) ↑<br>
<a href="/images/Hoonjin_Jung_lab3A/RxFIFO.v">Click here for the RxFIFO Verilog code</a><br>
<a href="/images/Hoonjin_Jung_lab3A/RxLogic.v">Click here for the RxLogic Verilog code</a><br>
<a href="/images/Hoonjin_Jung_lab3A/SSP.v">Click here for the SSP Verilog code</a><br>
<a href="/images/Hoonjin_Jung_lab3A/TxFIFO.v">Click here for the TxFIFO Verilog code</a><br>
<a href="/images/Hoonjin_Jung_lab3A/TxLogic.v">Click here for the TxLogic Verilog code</a><br>
<br><br>
<font size="5em" style="color:black;">
<u>"SSP with ARM using WISHBONE Design” with Verilog</u><br></font><br>
<img src="/images/fulls/ARM.jpg" class="image-img" width="500" height="300">
<img src="/images/fulls/ARM2.jpg" class="image-img" width="500" height="300"><br>
Sketch ↑ <br>
<a href="/images/Hoonjin_Jung_lab3B/WISHB_MASTER.v">Click here for the WISHB_MASTER Verilog code</a><br>
<a href="/images/Hoonjin_Jung_lab3B/WISHB_SLAVE.v">Click here for the WISHB_SLAVE Verilog code</a><br>
<br>
<br>
<font size="5em" style="color:black;"><u>"16-bit Adder Design” with Virtuoso</u><br>
Kogge-Stone Adder</font><br>
<img src="/images/fulls/Kogge.jpg" class="image-img" width="500" height="300"><br>
<a href="/images/jung_hoonjin_2a.tar.gz.zip">Click here to Download the .tar(Virtuoso) file</a><br>
<br>
<br>
<font size="5em" style="color:black;">
<u>"1-bit Memory Design” with Virtuoso</u><br></font>
<br>
<img src="/images/fulls/VLSI1.jpg" class="image-img" width="500" height="300">
<br>
Schematic ↑ <br>


<hr style="height:3px">
<br>
