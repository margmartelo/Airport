# Airport Challenge #
*Makers Academy - Week 1 End of Unit Challenge*

<p>&nbsp;</p>

## 🛩️ **Brief:**
<p>&nbsp;</p>

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

<p>&nbsp;</p>

## 🛩️ **User Stories** that we worked out in collaboration with the client:
<p>&nbsp;</p>

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
```
As an air traffic controller
So that I can effectively keep track of traffic 
I want to ensure planes can only take off from airports they are in
```

<p>&nbsp;</p>

## 🛩️ **Class Diagram that supports our User Stories implementation:** 
<p>&nbsp;</p>

<img width="648" alt="ClassDiagramAirport" src="https://user-images.githubusercontent.com/65411964/121790979-e7f88680-cbdc-11eb-91cf-4ecf0915e136.png">

<p>&nbsp;</p>

## 🛩️ **Tech used:**
This project is being written in Ruby. Testing is being run by RSpec - examples, failures.

<p>&nbsp;</p>

## 🛩️ **How to run the app:**
```bash
$ git clone git@github.com:margmartelo/Airport.git
$ cd Airport
$ gem install rspec
$ bundle 
$ irb
```

<p>&nbsp;</p>

* **To load the airport:**
```bash
$ require './lib/airport.rb'
```

<p>&nbsp;</p>

* **To create a new instance of Airport class**(with a default capacity of 20 planes):
```bash
$ airport = Airport.new(Weather.new)
```
*Please note that, by passing a new instance of Weather, we will obtain a random weather_status, that can be either 'good' or 'stormy'.*

<p>&nbsp;</p>

* **To land a plane at an airport:**
```bash
$ plane = Plane.new
$ airport.land(plane)
```
*If the weather is stormy, landing won't be possible and an error will be raised.*

<p>&nbsp;</p>

* **To take off a plane from the airport:**
```bash
$ airport.take_off(plane)
```

*If the weather is stormy, taking off won't be possible and an error will be raised.*

<p>&nbsp;</p>

## 🛩️ **How to run the tests:**
```bash
$ rspec
```
<p>&nbsp;</p>
