import { Inter } from "next/font/google";
import { useForm } from "react-hook-form"

const inter = Inter({ subsets: ["latin"] });
const axios = require('axios');

export default function Home() {
  const {
    register,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm()

  const onSubmit = (data) => {
    axios.get('http://localhost:3001/recipes')
      .then(function (response) {
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      })
      .finally(function () {
      });
  }

  return (
    <main
      className={`flex min-h-screen flex-col items-center justify-between p-24 ${inter.className}`}
    >
      <form onSubmit={handleSubmit(onSubmit)}>
        <input defaultValue="Ingredients" {...register("ingredients", { required: true })} />
        {errors.ingredients && <span>This field is required</span>}
        <input type="submit" />
      </form>
      <div>
        
      </div>
    </main>
  );
}
