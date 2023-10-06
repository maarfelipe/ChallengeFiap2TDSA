import React from 'react';

export default function InputText({ label, id, ...props }) {
    return (
        <div className='flex flex-col gap-1 my-2'>
            <label htmlFor={id} className='text-white'>{label}</label>
            <input
                id={id}
                type="text"
                {...props}
                className='bg-green-500 px-2 py-2 rounded outline-none focus: ring-1 focus:ring-black placeholder:text-green-800'
            />
        </div>
    );
}