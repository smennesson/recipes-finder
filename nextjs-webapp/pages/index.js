import { Inter } from "next/font/google";
import { useForm } from "react-hook-form"
import React, { useState } from 'react'

const inter = Inter({ subsets: ["latin"] });
const axios = require('axios');

export function Recipe({ recipe }) {
  return (
    <div className="container mx-auto my-5">
      <h1 className="text-xl font-bold">{recipe.name}</h1>
      <h2 className="text-l font-medium">Nombre de personnes: {recipe.people_quantity}</h2>
      <h2 className="text-l font-medium">Temps de préparation: {recipe.prep_time}</h2>
      <h2 className="text-l font-medium">Temps de cuisson: {recipe.cook_time}</h2>
      <h2 className="text-l font-medium">Budget: {recipe.budget}</h2>
      <h2 className="text-l font-medium">Note: {recipe.rate ? recipe.rate : 'Aucune'}</h2>
      <h2 className="text-l font-medium">Ingrédients</h2>
      <ul className="list-disc list-inside">
        {recipe.ingredients.map((ingredient, index) => (
            <li key={recipe.name + ingredient + index}>{ingredient}</li>
          ))}
      </ul>
    </div>
  )
}

export default function Home() {
  const {
    register,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm()

  const [recipes, setRecipes] = React.useState([]);
  const onSubmit = (data) => {
    axios.get('http://localhost:3001/recipes',  { params: { ingredients: data.ingredients.split(' ') } })
      .then(function (response) {
        setRecipes(response.data.recipes);
      })
      .catch(function (error) {
      })
      .finally(function () {
      });
  }

  return (
    <main
      className={`flex min-h-screen flex-col items-center justify-between p-24 ${inter.className}`}
    >
      <form className="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" onSubmit={handleSubmit(onSubmit)}>
        <p><span>Cherche des recettes à partir d'ingrédients</span></p>
        <div className="mb-4">
        <label className="block text-gray-700 text-sm font-bold mb-2">
        Ingredients
        </label>
        <input className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" defaultValue="noix" {...register("ingredients", { required: true })} />
        {errors.ingredients && <span>This field is required</span>}
        </div>

        <input className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit"/>
      </form>
      <div>
        {recipes.map((recipe) => (
          <Recipe key={recipe.id} recipe={recipe} />
        ))}
      </div>
    </main>
  );
}
