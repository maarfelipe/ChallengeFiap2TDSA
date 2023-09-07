import React from 'react';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { List } from "./List";

const Stack = createNativeStackNavigator();

const Recomendacao = ({ navigation, route }) => {

  return (
      <Stack.Navigator>
        <Stack.Screen name="list" component={List} options={{headerShown: false}} navigation={navigation}/>
      </Stack.Navigator>
  );
};

export default Recomendacao;