import React from 'react';
import { Home } from './Screens/Home';

import { NavigationContainer } from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import { Image, View } from 'react-native';
import Recomendacao from './Screens/Recomendacao';
import Acesso from './Screens/Acesso';

const Stack = createNativeStackNavigator();

const Logo = () => {
  return (
      <View style={{ flex: 1, alignItems: 'center'}}>
          <Image style={{width:175, height:25, marginLeft:-50}} source={require('./Assets/logo_title.png')} />
      </View>
  )
}

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="acesso" component={Acesso} options={{headerShown: false}} />
        <Stack.Screen name="home" component={Home} options={{ headerTitle: () =>  <Logo />, headerBackVisible: false}} />
        <Stack.Screen name="recomendacao" component={Recomendacao} options={{ headerTitle: 'Recomendações'}} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;
