

boolean internalloads = true;

void setInternalLoads(Obj zone) {
  
  if (internalloads) {
  
    // define standard internal loads
    EnergyPlus.setPeople(zone);
    EnergyPlus.setElectricEquipment(zone);
    EnergyPlus.setLights(zone);
    EnergyPlus.setDaylightControlled(zone);            
  
  }
  
}


void initInternalLoads() {
 
    EnergyPlus.people = true;
    EnergyPlus.electricEquipment = true;
    EnergyPlus.lights = true;
    EnergyPlus.daylightControl = true;

}
