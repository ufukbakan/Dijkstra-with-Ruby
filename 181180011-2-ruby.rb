# Ufuk Bakan - Gazi Univeristy - 181180011 - 2020
#Noktalar kümesi :
noktalar = [0,1,2,3]
#Kenar gösterimi: " kaynak , hedef , ağırlık "
#Kenarlar yönlüdür !
kenarlar  = [[0,3,4] , [0,2,9] , [1,3,1] , [3,2,2], [2,1,8]]

def initialUzaklikGrafi (baslangic, n)
  #Diğer noktalara uzaklığı default olarak sonsuz :
  arr = [1.0/0]*n
  #Kendine uzaklığı sıfır :
  arr[baslangic] = 0
  return arr
end

def Dijkstra(noktalar,kenarlar,baslangic,alinanYol=0,uzaklikGrafi = (initialUzaklikGrafi(baslangic, noktalar.length)), ziyaretGrafi = [0]*noktalar.length)
  ziyaretGrafi[baslangic] = 1
  i=0
  while(i < kenarlar.length) do
    if(kenarlar[i][0] == baslangic) then
      yol = alinanYol + kenarlar[i][2]
      if(yol < uzaklikGrafi[kenarlar[i][1]]) then
        uzaklikGrafi[kenarlar[i][1]] = yol
      end
      if (ziyaretGrafi[kenarlar[i][1]] == 0) then
        Dijkstra(noktalar,kenarlar,kenarlar[i][1],yol,uzaklikGrafi,ziyaretGrafi)
      end
    end
    i+=1
  end

  return uzaklikGrafi
end

def enKisaYollariYaz(noktalar,kenarlar)
  for nokta in noktalar do
    enKisaYollarGrafi = Dijkstra(noktalar,kenarlar,nokta)
    i = 0
    while i < noktalar.length do
      print nokta.to_s + " noktasından " + i.to_s + " noktasına en kısa uzaklık : " + enKisaYollarGrafi[i].to_s + "\n"
      i += 1
    end
    print "============\n"
  end
end

print "Uyarı : graf yönlüdür\n"
print "Noktalar kümesi : "
print noktalar
print "\nKenarlar kümesi (kaynak,hedef,ağırlık) :\n"
print kenarlar
print "\n"
enKisaYollariYaz(noktalar,kenarlar)