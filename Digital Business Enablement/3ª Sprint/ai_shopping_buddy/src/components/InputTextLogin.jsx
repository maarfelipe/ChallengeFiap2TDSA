import React from 'react';

export default function InputTextLogin({ label, id, name, register=()=>{},...props }) {
    return (
        <div className='flex flex-col gap-1 my-2'>
            <label htmlFor={id} className='text-black'>{label}</label>
            <input
                {...register(name)}
                id={id}
                type="text"
                {...props}
                className='bg-lightgray-900 px-2 py-2 rounded outline-none focus: ring-1 focus:ring-black placeholder:text-black-100'
            />
        </div>
    );
}