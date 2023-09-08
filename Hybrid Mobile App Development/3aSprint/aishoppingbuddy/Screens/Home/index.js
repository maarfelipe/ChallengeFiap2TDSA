import React from "react";
import { Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";

import LinearGradient from 'react-native-linear-gradient';

const Home = (props) => {
    const { navigation } = props;

    return (
        <View>
            <View style={style.layer}>
                <LinearGradient
                    colors={['#881AFF','#32C7F1']}
                    useAngle={true}
                    angle={135}
                    style={[style.button,style.buttonLarge]}>
                    <TouchableOpacity style={style.touchLarge}>
                        <View>
                            <Text style={style.title}>{'Make better\nshop carts'}</Text>
                            <Text style={style.desc}>{'Confira as\nrecomendações enviadas'}</Text>
                        </View>
                        <Image style={style.shadow} source={require('../../Assets/shadow.png')} />
                        <Image style={style.logo} source={require('../../Assets/logo_white.png')} />
                    </TouchableOpacity>
                </LinearGradient>
            </View>
            <View style={style.layer}>
                <LinearGradient
                    colors={['#A34FFF','#8515FF']}
                    useAngle={true}
                    angle={243}
                    style={[style.button]}>
                    <TouchableOpacity style={style.touch} onPress={() => navigation.push('recomendacao', {id: Math.random()})}>
                        <Image style={style.image} source={require('../../Assets/icon1.png')} />
                        <Text style={style.label}>{'Todas as\nRecomendações'}</Text>
                    </TouchableOpacity>
                </LinearGradient>
                <LinearGradient
                    colors={['#63D4F4','#2FC6F1']}
                    useAngle={true}
                    angle={243}
                    style={[style.button]}>
                    <TouchableOpacity style={style.touch}>
                        <Image style={style.image} source={require('../../Assets/icon2.png')} />
                        <Text style={style.label}>{'Buscar por\nID'}</Text>
                    </TouchableOpacity>
                </LinearGradient>
            </View>
            <View style={style.layer}>
                <LinearGradient
                    colors={['#5A5757','#231F20']}
                    useAngle={true}
                    angle={243}
                    style={[style.button]}>
                    <TouchableOpacity style={style.touch}>
                        <Image style={style.image} source={require('../../Assets/icon3.png')} />
                        <Text style={style.label}>{'Buscar por\ndata'}</Text>
                    </TouchableOpacity>
                </LinearGradient>
                <LinearGradient
                    colors={['#6369F4','#2F37F1']}
                    useAngle={true}
                    angle={243}
                    style={[style.button]}>
                    <TouchableOpacity style={style.touch}>
                        <Image style={style.image} source={require('../../Assets/icon4.png')} />
                        <Text style={style.label}>{'Buscar por\nusuário'}</Text>
                    </TouchableOpacity>
                </LinearGradient>
                
            </View>
        </View>
    )
}

const style = StyleSheet.create({
    layer: {
        flexDirection:'row',
        justifyContent:'space-between'
    },
    button: {
        width:'46%',
        height:140,
        margin:'2%',
        borderRadius:10,
    },
    buttonLarge: {
        width:'96%',
    },
    touchLarge: {
        flexDirection:'row',
        justifyContent:'space-between',
        padding:16,
    },
    touch: {
        flexDirection:'column',
        justifyContent:'space-between',
        padding:12,
    },
    image: {
        width:50,
        height:50,
        marginBottom:5,
    },
    logo: {
        width:80,
        height:88.25,
        marginTop:8,
        marginRight:12,
    },
    shadow: {
        width:148,
        height:23.75,
        position:'absolute',
        top:115,
        left:246,
        borderBottomRightRadius:10,
    },
    label: {
        color:'#FFF',
        fontSize:18,
        fontWeight:'bold',
        fontFamily:'Poppins',
    },
    title: {
        color:'#FFF',
        fontSize:20,
        fontWeight:'bold',
        fontFamily:'Poppins',
    },
    desc: {
        marginTop:5,
        color:'#FFF',
        fontSize:16,
        fontFamily:'Poppins',
    },
});

export {Home};