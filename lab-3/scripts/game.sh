#!/bin/bash

declare -a field
for ((i=0; i<20; i++))
do
    field[$i]=0
done

ship1=$((RANDOM % 20))
ship2=$((RANDOM % 19))
ship3a=$((RANDOM % 18))
ship3b=$((RANDOM % 18))
while [ $ship3b -eq $ship3a ]
do
    ship3b=$((RANDOM % 18))
done

field[$ship1]=1
field[$ship2]=1
field[$ship3a]=1
field[$((ship3a + 1))]=1
field[$ship3b]=1
field[$((ship3b + 1))]=1
field[$((ship3b + 2))]=1

check_hit() {
    if [ ${field[$1]} -eq 1 ]
then
        field[$1]=2
        echo "Попал!"
    else
        field[$1]=3
        echo "Мимо."
    fi
}

while true
do
    echo "Ваш ход! Введите номер клетки (от 1 до 20):"
    read shot
    check_hit $((shot - 1))

    remaining_ships=0 
    for cell in "${field[@]}"
do
        if [ $cell -eq 1 ]
then
            remaining_ships=$((remaining_ships + 1))
        fi
done

    if [ $remaining_ships -eq 0 ]
then
        echo "Игра окончена. Вы победили!"
        break
    fi

computer_shot=$((RANDOM % 20))
    echo "Ход компьютера: $((computer_shot + 1))"
    check_hit $computer_shot

    remaining_ships=0
    for cell in "${field[@]}"
do
        if [ $cell -eq 1 ]
then
          remaining_ships=$((remaining_ships + 1))
        fi
    done
    if [ $remaining_ships -eq 0 ]
then
        echo "Игра окончена. Компьютер победил!"
        break
    fi
done
