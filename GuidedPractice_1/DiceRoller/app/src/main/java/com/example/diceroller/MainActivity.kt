package com.example.diceroller

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.ImageView

/**
 * Esta es la función principal del programa,
 * encargada de lanzar las vistas iniciales de la app
 */
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val rollButton: Button = findViewById(R.id.button)
        rollButton.setOnClickListener { rollDice() }

        //Hacer que al iniciar lance el dado
        rollDice()
    }
/**
 *Función encargada de la lógico del lanzamiento del dado
*/
    private fun rollDice() {
        //Creación de una instancia del dado con 6 lados
        val dice = Dice(6)
        val diceRoll = dice.roll()

        //Condicional que determina que recurso utilizar en función del resultado
        val diceImage: ImageView = findViewById(R.id.imageView)
        val drawableResource = when (diceRoll) {
            1 -> R.drawable.dice_1
            2 -> R.drawable.dice_2
            3 -> R.drawable.dice_3
            4 -> R.drawable.dice_4
            5 -> R.drawable.dice_5
            else -> R.drawable.dice_6
        }

        //Actualiza la imagen con el recurso correcto
        diceImage.setImageResource(drawableResource)
        //Actualiza el contenido de la descripción
        diceImage.contentDescription = diceRoll.toString()
    }
}

class Dice(private val numSides: Int) {

    fun roll(): Int {
        return (1..numSides).random()
    }
}