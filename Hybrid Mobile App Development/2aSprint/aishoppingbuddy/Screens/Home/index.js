import React from "react";
import { Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";

const Home = () => {

    const style = StyleSheet.create({
        layer: {
            flexDirection:'row',
            justifyContent:'space-between'
        },
        button: {
            width:'46%',
            height:130,
            backgroundColor:'#F00',
            margin:'2%',
            borderRadius:10,
            padding:10,
        },
        buttonLarge: {
            width:'96%',
            backgroundColor:'#29F',
            padding:16,
            flexDirection:'row',
            justifyContent:'space-between'
        },
        image: {
            width:60,
            height:60,
        },
        logo: {
            width:100,
            height:100,
        },
        label: {
            color:'#FFF',
            fontSize:18,
            fontWeight:'500'
        },
        desc: {
            marginTop:5,
            color:'#FFF',
            fontSize:16,
            fontWeight:'200'
        },
        b1: {
            backgroundColor:'#83F'
        },
        b2: {
            backgroundColor:'#4CF'
        },
        b3: {
            backgroundColor:'#444'
        },
        b4: {
            backgroundColor:'#44F'
        },
    });

    return (
        <View>
            <View style={style.layer}>
                <TouchableOpacity style={[style.button,style.buttonLarge]}>
                    <View>
                        <Text style={style.label}>{'Make better\nshop carts'}</Text>
                        <Text style={style.desc}>{'Confira as\nrecomendações enviadas'}</Text>
                    </View>
                    <Image style={style.logo} source={require('.../Assets/logo.png')} />
                </TouchableOpacity>
            </View>
            <View style={style.layer}>
                <TouchableOpacity style={[style.button,style.b1]}>
                    <Image style={style.image} source={require('.../Assets/icon1.png')} />
                    <Text style={style.label}>{'Todas as\nRecomendações'}</Text>
                </TouchableOpacity>
                <TouchableOpacity style={[style.button,style.b2]}>
                    <Image style={style.image} source={require('.../Assets/icon2.png')} />
                    <Text style={style.label}>{'Buscar por\nID'}</Text>
                </TouchableOpacity>
            </View>
            <View style={style.layer}>
                <TouchableOpacity style={[style.button,style.b3]}>
                    <Image style={style.image} source={require('.../Assets/icon3.png')} />
                    <Text style={style.label}>{'Buscar por\ndata'}</Text>
                </TouchableOpacity>
                <TouchableOpacity style={[style.button,style.b4]}>
                    <Image style={style.image} source={require('.../Assets/icon4.png')} />
                    <Text style={style.label}>{'Buscar por\nusuário'}</Text>
                </TouchableOpacity>
            </View>
        </View>
    )
}

export {Home};