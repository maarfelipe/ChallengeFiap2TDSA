import axios from "axios";
import React, { useEffect, useState } from "react";
import { FlatList, Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";
import ListItem from "./ListItem";

const List = ({ navigation }) => {

    const [lista, setLista] = useState([]);

    const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlbWFpbDFAZ21haWwuY29tIiwiaXNzIjoiQUlTaG9wcGluZ0J1ZGR5IiwiZXhwIjoxNjk0MTU5ODExfQ.TESTt-DG4tOykKW0v4YE8GXIpcyhItFTFNsugc9l1qI"

    const fetchData = () => {
        axios.request({
            headers: {
                Authorization: `Bearer ${token}`
            },
            method: "GET",
            url: `http://10.0.2.2:8080/aishoppingbuddy/api/recomendacao`
        }).then(response => {
            setLista(response.data.content);
        });
    }

    useEffect(() => {
        fetchData();
    }, []);

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
                data={lista}
                renderItem={props => <ListItem navigation={navigation} {...props} />}
                keyExtractor={item => item.id}
            />
        </View>
    );
};

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

export {List};