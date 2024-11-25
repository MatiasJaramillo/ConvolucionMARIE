class ConvolucionComprobacion {

    public static void main(String[] args) {
        int[][] matrizK = {
          {-5, -6, -7},
          {-8, -9, -10},
          {-11, -12, -13}
        };
        
        //pegar desde aqui las matrices X y Y
        int[][] matrizX = {
             {1, 2, 3, 4},
             {1, 2, 3, 4},
             {1, 2, 3, 4},
             {1, 2, 3, 4}
         };
         
         int[][] matrizY = {
             {0, 0, 0, 0},
             {0, 0, 0, 0},
             {0, 0, 0, 0},
             {0, 0, 0, 0}
         };      
        //pegar hasta aqui las matrices X y Y

        printMatriz(matrizK);
        printMatriz(matrizX);

        // hacer convolucion
        for (int i = 0; i < matrizX.length; i++) {
            for (int j = 0; j < matrizX[0].length; j++) {
                matrizY[i][j] = calculateConvolucion(i, j, matrizK, matrizX);
            }
        }

        printMatriz(matrizY);
    }

    // calcular convolucion para una ubicacion especifica en la matriz
    public static int calculateConvolucion(int i, int j, int[][] matrizK, int[][] matrizX) {
        int sum = 0;
        int kCenter = matrizK.length / 2;

        for (int k = 0; k < matrizK.length; k++) {
            for (int m = 0; m < matrizK[0].length; m++) {
                int x = i + k - kCenter;
                int y = j + m - kCenter;

                // revisar que no se usen espacios nulos de array
                if (x >= 0 && x < matrizX.length && y >= 0 && y < matrizX[0].length) {
                    sum += matrizK[k][m] * matrizX[x][y];
                }
            }
        }
        return sum;
    }
    
    // Print matrix
    public static void printMatriz(int[][] matriz) {
        for (int[] row : matriz) {
            for (int value : row) {
                System.out.print(value + " ");
            }
            System.out.println();
        }
        System.out.println();
    }
}
