-- crear un ejemplo de composicion de funciones
{-# OPTIONS_GHC -Wno-deferred-out-of-scope-variables #-}

type Artista = (String, String, Int)
--type Artista = (nombre, genero, cantidad de albums)

artistas :: [Artista]
artistas = [("Lali", "Pop", 5),
            ("Maria Becerra", "Reggaeton", 3),
            ("Daddy Yanquee", "Reggaeton", 6),
            ("Abel Pintos", "Folcklore", 7),
            ("Los Palmeras", "Cumbia", 10) ]

filtrarPorGenero :: String -> [Artista] -> [Artista]
filtrarPorGenero genero = filter (\(_, genero, _) -> genero == genero)

contarAlbumesTotal :: [Artista] -> Int
contarAlbumesTotal = sum . map (\(_, _, cantAlbumes) -> cantAlbumes)

albumesReggaeton :: [Artista] -> Int
albumesReggaeton = contarAlbumesTotal . filtrarPorGenero "Reggaeton"

-- modifico funciones para no usar expresiones lambda

genero :: Artista -> String
genero (_, g, _) = g 

albums :: Artista -> Int
albums (_, _, albumes) = albumes

filtrarPorGenero2 :: String -> [Artista] -> [Artista]
filtrarPorGenero2 generoBuscado = filter ((== generoBuscado) . genero)

contarAlbumesTotal2 :: [Artista] -> Int
contarAlbumesTotal2 = sum . map albums 

-- modifico funcion para que sea genericas

albumesTotalesPorGenero ::  String -> [Artista] -> Int
albumesTotalesPorGenero genero = contarAlbumesTotal . filtrarPorGenero genero

-- funcion que me diga que artistas pertenecen a un genero

nombreDelArtista :: Artista -> String
nombreDelArtista (nombre, _, _) = nombre

nombresPorGenero :: String -> [Artista] -> [String]
nombresPorGenero genero = map nombreDelArtista . filtrarPorGenero genero
 
