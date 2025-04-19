-- CreateTable
CREATE TABLE "Usuario" (
    "usuario_ID" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("usuario_ID")
);

-- CreateTable
CREATE TABLE "Categoria" (
    "categoria_ID" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "Categoria_pkey" PRIMARY KEY ("categoria_ID")
);

-- CreateTable
CREATE TABLE "Item" (
    "item_ID" SERIAL NOT NULL,
    "nome_objeto" TEXT NOT NULL,
    "dataEvento" TIMESTAMP(3) NOT NULL,
    "localizacao" TEXT NOT NULL,
    "foto" TEXT,
    "status" INTEGER NOT NULL,
    "codigoAcesso" TEXT NOT NULL,
    "categoria_ID" INTEGER NOT NULL,
    "usuario_ID" INTEGER,

    CONSTRAINT "Item_pkey" PRIMARY KEY ("item_ID")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Item_codigoAcesso_key" ON "Item"("codigoAcesso");

-- AddForeignKey
ALTER TABLE "Item" ADD CONSTRAINT "Item_usuario_ID_fkey" FOREIGN KEY ("usuario_ID") REFERENCES "Usuario"("usuario_ID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Item" ADD CONSTRAINT "Item_categoria_ID_fkey" FOREIGN KEY ("categoria_ID") REFERENCES "Categoria"("categoria_ID") ON DELETE RESTRICT ON UPDATE CASCADE;
