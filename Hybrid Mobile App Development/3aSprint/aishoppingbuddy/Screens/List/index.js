import React from "react";
import { FlatList, Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";

const Item = ({item}) => {

    const style = StyleSheet.create({
        card: {
            margin:8,
            backgroundColor:'#FFF',
            borderRadius:10,
            padding:12,
        },
        titulo: {
            color:'#000',
            fontFamily:'Poppins',
            fontSize:20,
            fontWeight:'bold',
        },
        mensagem: {
            color:'#888',
            fontFamily:'Poppins',
            fontSize:16,
        },
        bar: {
            backgroundColor:'#DDD',
            height:1,
            width:'100%',
            marginTop:6,
            marginBottom:6,
        },
        buttonView: {
            width:'100%',
            flexDirection:'row',
            justifyContent:'flex-end'
        },
        button: {
            flexDirection:'row',
            alignItems:'center',
        },
        buttonLabel:{
            color:'#000',
            fontFamily:'Poppins',
            fontSize:16,
            fontWeight:'bold',
        },
        arrow: {
            width:20,
            height:20,
        }
    });

    const titulo = item.titulo;
    const mensagem = item.mensagem;

    return (
        <View style={style.card}>
            <Text style={style.titulo}>{titulo}</Text>
            <View style={style.bar}></View>
            <Text style={style.mensagem}>{mensagem}</Text>
            <View style={style.buttonView}>
                <TouchableOpacity style={style.button}>
                    <Text style={style.buttonLabel}>Saiba mais</Text>
                    <Image style={style.arrow} source={require('../../Assets/arrow.png')} />
                </TouchableOpacity>
            </View>
        </View>
    );
}

const List = ({ navigation, route }) => {

    const {id} = route.params;

    const style = StyleSheet.create({
        filter: {
            margin:12,
            flexDirection:'row',
        },
        button: {
            flexDirection:'row',
            alignItems:'center',
        },
        buttonLabel: {
            fontFamily:'Poppins',
            fontSize:18,
            color:'#000',
            marginRight:22,
        },
        icon: {
            width:30,
            height:30,
            marginRight:8,
        },
        bg0: {
            width:100,
            height:100,
            position:'absolute',
            left:320,
            top:-60,
        },
        bg1: {
            width:150,
            height:150,
            position:'absolute',
            left:-40,
            top:100,
        },
        bg2: {
            width:180,
            height:180,
            position:'absolute',
            left:320,
            top:300,
        },
        bg3: {
            width:120,
            height:120,
            position:'absolute',
            left:0,
            top:550,
        },
    });

    const DATA = [
        {
            id:1,
            titulo:'Tênis Nike Revolution Next nature',
            mensagem:'Fala João! Só passando aqui rapidinho pra te\nrecomendar o Tênis Nike... '
        },
        {
            id:2,
            titulo:'Tênis Nike Revolution Next nature',
            mensagem:'Fala João! Só passando aqui rapidinho pra te\nrecomendar o Tênis Nike... '
        },
        {
            id:3,
            titulo:'Tênis Nike Revolution Next nature',
            mensagem:'Fala João! Só passando aqui rapidinho pra te\nrecomendar o Tênis Nike... '
        },
        {
            id:4,
            titulo:'Tênis Nike Revolution Next nature',
            mensagem:'Fala João! Só passando aqui rapidinho pra te\nrecomendar o Tênis Nike... '
        },
        {
            id:5,
            titulo:'Tênis Nike Revolution Next nature',
            mensagem:'Fala João! Só passando aqui rapidinho pra te\nrecomendar o Tênis Nike... '
        },
        {
            id:6,
            titulo:'Tênis Nike Revolution Next nature',
            mensagem:'Fala João! Só passando aqui rapidinho pra te\nrecomendar o Tênis Nike... '
        },
    ]

    return (
        <View>
            <Image style={style.bg0} source={require('../../Assets/bg0.png')} />
            <Image style={style.bg1} source={require('../../Assets/bg1.png')} />
            <Image style={style.bg2} source={require('../../Assets/bg2.png')} />
            <Image style={style.bg3} source={require('../../Assets/bg3.png')} />
            <View style={style.filter}>
                <TouchableOpacity style={style.button}>
                    <Image style={style.icon} source={require('../../Assets/icon_sort.png')} />
                    <Text style={style.buttonLabel}>ordenar</Text>
                </TouchableOpacity>
                <TouchableOpacity style={style.button}>
                    <Image style={style.icon} source={require('../../Assets/icon_filter.png')} />
                    <Text style={style.buttonLabel}>filtrar</Text>
                </TouchableOpacity>
            </View>
            <FlatList
                data={DATA}
                renderItem={props => <Item navigation={navigation} {...props} />}
                keyExtractor={item => item.id}
            />
        </View>
    );
};

export {List};