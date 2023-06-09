import React from 'react';
import { Home } from './Screens/Home';

import { NavigationContainer } from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import { Image, View } from 'react-native';
import { List } from './Screens/List';

const Stack = createNativeStackNavigator();

const Logo = () => {
  return (
      <View style={{ flex: 1, alignItems: 'center'}}>
          <Image style={{width:175, height:25, marginLeft:-50}} source={require('./assets/logo_title.png')} />
      </View>
  )
}

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="home" component={Home} options={{ headerTitle: () =>  <Logo />}} />
        <Stack.Screen name="list" component={List} options={{ headerTitle: 'Todas as Recomendações'}} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;
