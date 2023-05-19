import React from 'react';
import { Home } from './Screens/Home';

import { NavigationContainer } from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import { Image, View } from 'react-native';

const Stack = createNativeStackNavigator();

const Logo = () => {
  return (
      <View style={{ flex: 1, alignItems: 'center'}}>
          <Image style={{width:150, height:37.5, marginLeft:-50}} source={require('./Assets/logo_poggers.png')} />
      </View>
  )
}

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="home" component={Home} options={{ headerTitle: () =>  <Logo />}} />
        <Stack.Screen name="list" component={Home} options={{ headerTitle: "Todas as Recomendações"}} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;
