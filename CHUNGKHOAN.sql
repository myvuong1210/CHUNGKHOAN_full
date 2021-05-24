USE [master]
GO
/****** Object:  Database [CHUNGKHOAN]    Script Date: 21-May-21 11:40:04 ******/
CREATE DATABASE [CHUNGKHOAN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CHUNGKHOAN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CHUNGKHOAN.mdf' , SIZE = 96448KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CHUNGKHOAN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CHUNGKHOAN_log.ldf' , SIZE = 11456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CHUNGKHOAN] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CHUNGKHOAN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ARITHABORT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CHUNGKHOAN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CHUNGKHOAN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CHUNGKHOAN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET RECOVERY FULL 
GO
ALTER DATABASE [CHUNGKHOAN] SET  MULTI_USER 
GO
ALTER DATABASE [CHUNGKHOAN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CHUNGKHOAN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CHUNGKHOAN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CHUNGKHOAN] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CHUNGKHOAN', N'ON'
GO
USE [CHUNGKHOAN]
GO
/****** Object:  Table [dbo].[BANGGIATRUCTUYEN]    Script Date: 21-May-21 11:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANGGIATRUCTUYEN](
	[MACP] [nchar](7) NOT NULL,
	[GIAMUA_3] [float] NULL,
	[GIAMUA_KL3] [int] NULL,
	[GIAMUA_2] [float] NULL,
	[GIAMUA_KL2] [int] NULL,
	[GIAMUA_1] [float] NULL,
	[GIAMUA_KL1] [int] NULL,
	[KHOPLENH_GIA] [float] NULL,
	[KHOPLENH_KL] [int] NULL,
	[GIABAN_1] [float] NULL,
	[GIABAN_KL1] [int] NULL,
	[GIABAN_2] [float] NULL,
	[GIABAN_KL2] [int] NULL,
	[GIABAN_3] [float] NULL,
	[GIABAN_KL3] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LENHDAT]    Script Date: 21-May-21 11:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LENHDAT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MACP] [nchar](7) NOT NULL,
	[NGAYDAT] [datetime] NOT NULL CONSTRAINT [DF__LENHDAT_NGAYDAT]  DEFAULT (getdate()),
	[LOAIGD] [nchar](1) NOT NULL,
	[LOAILENH] [nchar](10) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[GIADAT] [float] NOT NULL,
	[TRANGTHAILENH] [nvarchar](30) NULL,
 CONSTRAINT [PK_LENHDAT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LENHKHOP]    Script Date: 21-May-21 11:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LENHKHOP](
	[IDKHOP] [int] IDENTITY(1,1) NOT NULL,
	[NGAYKHOP] [datetime] NOT NULL,
	[SOLUONGKHOP] [int] NOT NULL,
	[GIAKHOP] [float] NOT NULL,
	[IDLENHDAT] [int] NULL,
 CONSTRAINT [PK__LENHKHOP__F336C59879AC3042] PRIMARY KEY CLUSTERED 
(
	[IDKHOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_MACP]    Script Date: 21-May-21 11:40:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_MACP] ON [dbo].[BANGGIATRUCTUYEN]
(
	[MACP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LENHKHOP]  WITH CHECK ADD  CONSTRAINT [FK_LENHKHOP_LENHDAT] FOREIGN KEY([IDLENHDAT])
REFERENCES [dbo].[LENHDAT] ([ID])
GO
ALTER TABLE [dbo].[LENHKHOP] CHECK CONSTRAINT [FK_LENHKHOP_LENHDAT]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_GIADAT] CHECK  (([GIADAT]>(0)))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_GIADAT]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_LOAIGD] CHECK  (([LOAIGD]='M' OR [LOAIGD]='B'))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_LOAIGD]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_LOAILENH] CHECK  (([LOAILENH]='LO'))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_LOAILENH]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_SOLUONG] CHECK  (([SOLUONG]>=(0)))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_SOLUONG]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH CHECK ADD  CONSTRAINT [CK_LENHDAT_TRANGTHAILENH] CHECK  (([TRANGTHAILENH]=N'Chờ khớp' OR [TRANGTHAILENH]=N'Khớp lệnh 1 phần' OR [TRANGTHAILENH]=N'Khớp hết'))
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [CK_LENHDAT_TRANGTHAILENH]
GO
/****** Object:  StoredProcedure [dbo].[CursorLoaiGD]    Script Date: 21-May-21 11:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CursorLoaiGD]
  @OutCrsr CURSOR VARYING OUTPUT, 
  @MACP NVARCHAR( 10), @Ngay NVARCHAR( 50),  @LoaiGD NCHAR(1)
AS
SET DATEFORMAT DMY 
IF (@LoaiGD='M') 
  SET @OutCrsr=CURSOR KEYSET FOR 
  SELECT ID, NGAYDAT, SOLUONG, GIADAT FROM LENHDAT 
  WHERE MACP=@MACP 
    AND DAY(NGAYDAT)=DAY(@Ngay)AND MONTH(NGAYDAT)= MONTH(@Ngay) AND YEAR(NGAYDAT)=YEAR(@Ngay)  
    AND LOAIGD=@LoaiGD AND SOLUONG >0  
    ORDER BY GIADAT DESC, NGAYDAT 
ELSE
  SET @OutCrsr=CURSOR KEYSET FOR 
  SELECT ID,NGAYDAT, SOLUONG, GIADAT FROM LENHDAT 
  WHERE MACP=@MACP 
    AND DAY(NGAYDAT)=DAY(@Ngay)AND MONTH(NGAYDAT)= MONTH(@Ngay) AND YEAR(NGAYDAT)=YEAR(@Ngay)  
    AND LOAIGD=@LoaiGD AND SOLUONG >0  
    ORDER BY GIADAT, NGAYDAT 
OPEN @OutCrsr



GO
/****** Object:  StoredProcedure [dbo].[SP_BANGGIATRUCTUYEN]    Script Date: 21-May-21 11:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BANGGIATRUCTUYEN] 
 @LoaiGD NCHAR(1), 
    @MACP NCHAR(7),   @NGAYDAT DATETIME ,    @GIADAT FLOAT 
AS
   --KIEM TRA XOA BANG AO
        IF EXISTS ( SELECT  *
                    FROM    tempdb.sys.tables
                    WHERE   name like '#TMP_LenhDat%' AND name like '#TMP_LenhMua%' AND name like '#TMP_LenhBan%')
            DROP TABLE #TMP_LenhDat,#TMP_LenhBan,#TMP_LenhMua

	   
		-- LAY RA DANH SACH LENH DAT VAO BANG TAM
        SELECT  MACP ,
                GIADAT ,
                Sum(ISNULL(SOLUONG, 0)) AS KL
        INTO    #TMP_LenhDat
        FROM    dbo.LENHDAT
        WHERE   MACP = @MACP
                AND DAY(NGAYDAT) = DAY(@NGAYDAT)
                AND MONTH(NGAYDAT) = MONTH(@NGAYDAT)
                AND YEAR(NGAYDAT) = YEAR(@NGAYDAT)
                AND LOAIGD = @LoaiGD
                AND SOLUONG > 0
        GROUP BY MACP ,  GIADAT

        IF ( @LoaiGD = 'M' )
            BEGIN
               
			    SELECT  *
                INTO    #TMP_LenhMua
                FROM    ( SELECT    * ,
                                    ROW_NUMBER() OVER ( ORDER BY GIADAT DESC) AS Row_Number
                          FROM      #TMP_LenhDat
                        ) Temp
                WHERE   Row_Number <= 3


				--CAP NHAT GIA MUA KHI XOA DU LIEU
				UPDATE  dbo.BANGGIATRUCTUYEN
				SET     GIAMUA_3 = NULL, GIAMUA_2 = NULL, GIAMUA_1 = NULL, GIAMUA_KL3 = NULL,
						GIAMUA_KL2 = NULL, GIAMUA_KL1 = NULL
				WHERE   MACP = @MACP

					--CAP NHAT GIA BAN KHI XOA DU LIEU
				UPDATE  dbo.BANGGIATRUCTUYEN
				SET     GIABAN_3 = NULL,GIABAN_2 = NULL, GIABAN_1 = NULL,  GIABAN_KL1 = NULL,
						GIABAN_KL2 = NULL, GIABAN_KL3 = NULL
				WHERE   MACP = @MACP
				
    IF EXISTS (SELECT * FROM #TMP_LenhMua WHERE Row_Number = 1)
                 BEGIN  -- merge operation
                        IF EXISTS ( SELECT  *
                                    FROM    dbo.BANGGIATRUCTUYEN
                                    WHERE   MACP = @MACP )
                            BEGIN
                                UPDATE  dbo.BANGGIATRUCTUYEN
                                SET     GIAMUA_1 = ( SELECT  GIADAT
                                                    FROM    #TMP_LenhMua
                                                    WHERE   Row_Number = 1
                                                  ) ,
                                        GIAMUA_KL1 = ( SELECT   KL
                                                   FROM     #TMP_LenhMua
                                                   WHERE     Row_Number = 1
                                                 )
                                WHERE   MACP = @MACP

                            END
                        ELSE
                            BEGIN
                                INSERT  INTO dbo.BANGGIATRUCTUYEN
                                        ( MACP ,
                                          GIAMUA_1 ,
                                          GIAMUA_KL1
                                        )
                                        SELECT  MACP ,
                                                GIADAT ,
                                                KL
                                        FROM    #TMP_LenhMua
                                        WHERE   Row_Number = 1
                            END
                 END 
                IF EXISTS (SELECT * FROM #TMP_LenhMua WHERE Row_Number = 2)
                        BEGIN
						
								UPDATE  dbo.BANGGIATRUCTUYEN
                                SET     GIAMUA_2 = ( SELECT  GIADAT
                                                    FROM    #TMP_LenhMua
                                                    WHERE   Row_Number = 2
                                                  ) ,
                                        GIAMUA_KL2 = ( SELECT   KL
                                                   FROM     #TMP_LenhMua
                                                   WHERE   Row_Number = 2
                                                 )
                                WHERE   MACP = @MACP
						END
						  

			   IF EXISTS (SELECT * FROM #TMP_LenhMua WHERE Row_Number = 3)
                        BEGIN
						
								UPDATE  dbo.BANGGIATRUCTUYEN
                                SET     GIAMUA_3 = ( SELECT  GIADAT
                                                    FROM    #TMP_LenhMua
                                                    WHERE   Row_Number = 3
                                                  ) ,
                                        GIAMUA_KL3 = ( SELECT   KL
                                                   FROM     #TMP_LenhMua
                                                   WHERE   Row_Number = 3
                                                 )
                                WHERE   MACP = @MACP
						END
					
					END
       
	ELSE 
	BEGIN
				 SELECT  *
                    INTO    #TMP_LenhBan
                    FROM    ( SELECT    * , ROW_NUMBER() OVER ( ORDER BY GIADAT ASC) AS Row_Number
                              FROM      #TMP_LenhDat
                            ) Temp
                    WHERE   Row_Number <= 3
				

			
            
                 IF EXISTS (SELECT * FROM #TMP_LenhBan WHERE Row_Number = 1)
                    BEGIN  -- merge operation
                        IF EXISTS ( SELECT  *
                                    FROM    dbo.BANGGIATRUCTUYEN
                                    WHERE   MACP = @MACP )
                            BEGIN
                                UPDATE  dbo.BANGGIATRUCTUYEN
                                SET     GIABAN_1 = ( SELECT  GIADAT
                                                    FROM    #TMP_LenhBan
                                                   WHERE   Row_Number = 1
                                                  ) ,
										GIABAN_KL1 = ( SELECT   KL
                                                   FROM     #TMP_LenhBan
                                                   WHERE   Row_Number = 1
                                                 )
                                WHERE   MACP = @MACP

                            END
                        ELSE
                            BEGIN
                                INSERT  INTO dbo.BANGGIATRUCTUYEN
                                        ( MACP ,
                                          GIABAN_1 ,
										  GIABAN_KL1
                                        )
                                        SELECT  MACP ,
                                                GIADAT ,
                                                KL
                                        FROM    #TMP_LenhBan
                                        WHERE   Row_Number = 1
                            END
                    END 
             IF EXISTS (SELECT * FROM #TMP_LenhBan WHERE Row_Number = 2)
                        BEGIN
						
								UPDATE  dbo.BANGGIATRUCTUYEN
                                SET     GIABAN_2 = ( SELECT  GIADAT
                                                    FROM    #TMP_LenhBan
                                                    WHERE  Row_Number = 2
                                                  ) ,
                                        GIABAN_KL2 = ( SELECT   KL
                                                   FROM     #TMP_LenhBan
                                                   WHERE  Row_Number = 2
                                                 )
                                WHERE   MACP = @MACP
						END

			IF EXISTS (SELECT * FROM #TMP_LenhBan WHERE Row_Number = 3)
                        BEGIN
						
								UPDATE  dbo.BANGGIATRUCTUYEN
                                SET     GIABAN_3 = ( SELECT  GIADAT
                                                    FROM    #TMP_LenhBan
                                                    WHERE  Row_Number = 3
                                                  ) ,
                                        GIABAN_KL3 = ( SELECT   KL
                                                   FROM     #TMP_LenhBan
                                                   WHERE  Row_Number = 3
                                                 )
                                WHERE   MACP = @MACP
						END

							END
						--XOA CO PHIEU NEU MAT LENH DAT

						 DECLARE @TongSL BIGINT
		  
		  SELECT    @TongSL = SUM(ISNULL(GIAMUA_KL3, 0) + ISNULL(GIAMUA_KL2, 0) +   ISNULL(GIAMUA_KL1, 0) +  ISNULL(GIABAN_KL1, 0) + ISNULL(GIABAN_KL2, 0) + + ISNULL(GIABAN_KL3, 0))
		  FROM dbo.BANGGIATRUCTUYEN
		  WHERE MACP = @MACP

		  IF (@TongSL = 0)
		  BEGIN
		  	
			DELETE FROM dbo.BANGGIATRUCTUYEN WHERE MACP = @MACP

		
	END
					
		 

		




GO
/****** Object:  StoredProcedure [dbo].[SP_KHOPLENH_LO]    Script Date: 21-May-21 11:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_KHOPLENH_LO]
    @macp NCHAR(7) ,
    @Ngay NVARCHAR(50) ,
    @LoaiGD NCHAR(1),
    @soluongMB INT ,
    @giadatMB FLOAT
AS
	 SET DATEFORMAT DMY
    DECLARE @CrsrVar CURSOR ,
        @ngaydat NVARCHAR(50) ,
        @soluong INT ,
        @giadat FLOAT ,
        @soluongkhop INT ,
        @giakhop FLOAT ,
        @IDLENHDAT INT ,
        @soluongkhopALL INT

    SET @soluongkhopALL = 0
    IF ( @LoaiGD = 'B' )
        EXEC CursorLoaiGD @CrsrVar OUTPUT, @macp, @Ngay, 'M'
    ELSE
        EXEC CursorLoaiGD @CrsrVar OUTPUT, @macp, @Ngay, 'B'
  
    FETCH NEXT FROM @CrsrVar  INTO @IDLENHDAT, @ngaydat, @soluong, @giadat
 
    WHILE ( @@FETCH_STATUS <> -1
            AND @soluongMB > 0
          )
        BEGIN
    --  Trường hợp lệnh gởi vào là lệnh bán
            IF ( @LoaiGD = 'B' )
                IF ( @giadatMB <= @giadat )
                    BEGIN
                       IF @soluongMB >= @soluong
                        BEGIN
                                SET @soluongkhop = @soluong
                                SET @giakhop = @giadat
                                SET @soluongMB = @soluongMB - @soluong

                                UPDATE  dbo.LENHDAT
                                SET     SOLUONG = 0, TRANGTHAILENH = N'Khớp hết'
                                WHERE CURRENT OF @CrsrVar
                            END
                        ELSE
                            BEGIN
                                SET @soluongkhop = @soluongMB
                                SET @giakhop = @giadat
       
                                UPDATE  dbo.LENHDAT
                                SET     SOLUONG = SOLUONG - @soluongMB , TRANGTHAILENH = N'Khớp lệnh 1 phần'
                                WHERE CURRENT OF @CrsrVar
                                SET @soluongMB = 0
                            END

	   		 -- cập nhật tổng số lượng khớp của lệnh gưi vào
                       SET @soluongkhopALL = @soluongkhopALL + @soluongkhop
                              
                       
			 -- Cập nhật table LENHKHOP
                        INSERT  INTO dbo.LENHKHOP
                                ( NGAYKHOP ,
                                  SOLUONGKHOP ,
                                  GIAKHOP ,
                                  IDLENHDAT
	                            )
                        VALUES  ( GETDATE() , 
                                  @soluongkhop ,
                                  @giakhop , 
                                  @IDLENHDAT 
	                            )
			-- Câp nhật thông tin vào 	[dbo].[BANGGIATRUCTUYEN]
						IF EXISTS(SELECT * FROM dbo.BANGGIATRUCTUYEN WHERE MACP = @macp)
						BEGIN
							UPDATE dbo.BANGGIATRUCTUYEN
							SET KHOPLENH_GIA = @giakhop, KHOPLENH_KL = @soluongkhop
							WHERE MACP = @macp
						END
						ELSE
                        BEGIN
                        	INSERT INTO dbo.BANGGIATRUCTUYEN( MACP ,  KHOPLENH_GIA , KHOPLENH_KL )
                        	VALUES  ( @macp, @giakhop, @soluongkhop )	       
                        END

                    END
                ELSE
                    GOTO THOAT
		 -- Còn Trường hợp lệnh gởi vào là lệnh mua
            IF ( @LoaiGD = 'M' )
                IF ( @giadatMB >= @giadat )
                    BEGIN
                        IF @soluongMB >= @soluong
                            BEGIN
                                SET @soluongkhop = @soluong
                                SET @giakhop = @giadat
                                SET @soluongMB = @soluongMB - @soluong
							    UPDATE  dbo.LENHDAT
                                SET     SOLUONG = 0, TRANGTHAILENH = N'Khớp hết'
                                WHERE CURRENT OF @CrsrVar
                            END
                        ELSE
                            BEGIN
                                SET @soluongkhop = @soluongMB
                                SET @giakhop = @giadat
                                UPDATE  dbo.LENHDAT
                                SET     SOLUONG = SOLUONG - @soluongMB, TRANGTHAILENH = N'Khớp lệnh 1 phần'
                                WHERE CURRENT OF @CrsrVar
                                SET @soluongMB = 0
                            END
					  -- cập nhật tổng số lượng khớp của lệnh gưi vào
                        SET @soluongkhopALL = @soluongkhopALL + @soluongkhop   
			 -- Cập nhật table LENHKHOP
                        INSERT  INTO dbo.LENHKHOP
                                ( NGAYKHOP ,
                                  SOLUONGKHOP ,
                                  GIAKHOP ,
                                  IDLENHDAT
	                            )
                        VALUES  ( GETDATE() ,
                                  @soluongkhop , 
                                  @giakhop , 
                                  @IDLENHDAT 
	                            )
			--Câp nhật thông tin vào 	[dbo].[BANGGIATRUCTUYEN]
						IF EXISTS(SELECT * FROM dbo.BANGGIATRUCTUYEN WHERE MACP = @macp)
						BEGIN
							UPDATE dbo.BANGGIATRUCTUYEN
							SET KHOPLENH_GIA = @giakhop, KHOPLENH_KL = @soluongkhop
							WHERE MACP = @macp
						END
						ELSE
                        BEGIN
                        	INSERT INTO dbo.BANGGIATRUCTUYEN( MACP ,  KHOPLENH_GIA , KHOPLENH_KL )
                        	VALUES  ( @macp, @giakhop, @soluongkhop )                  	       
                        END
          END
                ELSE
                    GOTO THOAT
  FETCH NEXT FROM @CrsrVar INTO @IDLENHDAT, @ngaydat, @soluong, @giadat    
        END
    THOAT:
    IF ( @soluongMB > 0  AND @soluongkhopALL > 0)
        BEGIN
            INSERT  INTO LENHDAT
                    ( MACP ,
                      NGAYDAT ,
                      LOAIGD ,
                      LOAILENH ,
                      SOLUONG ,
                      GIADAT ,
                      TRANGTHAILENH
                    )
            VALUES  ( @macp ,
                      @ngaydat ,
                      @LoaiGD ,
                      N'LO' ,
                      @soluongMB ,
                      @giadatMB ,
                      N'Khớp lệnh 1 phần'
                    )
        END
	ELSE IF ( @soluongMB > 0  AND @soluongkhopALL = 0)
		BEGIN
		INSERT  INTO LENHDAT
                    ( MACP ,
                      NGAYDAT ,
                      LOAIGD ,
                      LOAILENH ,
                      SOLUONG ,
                      GIADAT ,
                      TRANGTHAILENH
                    )
            VALUES  ( @macp ,
                      @Ngay ,
                      @LoaiGD ,
                      N'LO' ,
                      @soluongMB ,
                      @giadatMB ,
                      N'Chờ khớp'
                    )
		END
	 CLOSE @CrsrVar
    DEALLOCATE @CrsrVar


GO
/****** Object:  Trigger [dbo].[TRIGGER_Delete_LENHDAT]    Script Date: 21-May-21 11:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TRIGGER_Delete_LENHDAT] ON [dbo].[LENHDAT]
    AFTER DELETE
AS
BEGIN
		DECLARE @LoaiGD_Deleted NCHAR(1) ,
            @MACP_Deleted NCHAR(7) ,
            @NGAYDAT_Deleted DATETIME ,
            @GIADAT_Deleted FLOAT,
			@SoLuong_Deleted INT	 
		-- GÁN CÁC GIÁ TRỊ ĐỂ XÓA
		SELECT  @LoaiGD_Deleted = Deleted.LOAIGD,
                @MACP_Deleted = Deleted.MACP ,
                @NGAYDAT_Deleted= Deleted.NGAYDAT,
				@GIADAT_Deleted = Deleted.GIADAT ,
				@SoLuong_Deleted = Deleted.SOLUONG
        FROM   Deleted		
	BEGIN
		EXEC [dbo].[SP_BANGGIATRUCTUYEN] @LoaiGD_Deleted , @MACP_Deleted , 	@NGAYDAT_Deleted,  @GIADAT_Deleted		
	END
  
END 



GO
/****** Object:  Trigger [dbo].[TRIGGER_Insert_LENHDAT]    Script Date: 21-May-21 11:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TRIGGER_Insert_LENHDAT] ON [dbo].[LENHDAT]
    AFTER INSERT 
AS
BEGIN
	  DECLARE @LoaiGD_InSerted NCHAR(1) ,
            @MACP_Inserted NCHAR(7) ,
            @NGAYDAT_Inserted DATETIME ,
            @GIADAT_Inserted FLOAT
--GAN GIA TRI DE INSERT
    SELECT  @LoaiGD_InSerted = Inserted.LOAIGD ,
                @MACP_Inserted = Inserted.MACP ,
                @GIADAT_Inserted = Inserted.GIADAT,
				@NGAYDAT_Inserted = Inserted.NGAYDAT
        FROM    Inserted
	  EXEC [dbo].[SP_BANGGIATRUCTUYEN] @LoaiGD_InSerted, @MACP_Inserted, @NGAYDAT_Inserted, @GIADAT_Inserted
END 



GO
/****** Object:  Trigger [dbo].[TRIGGER_Update_LENHDAT]    Script Date: 21-May-21 11:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TRIGGER_Update_LENHDAT] ON [dbo].[LENHDAT]
    AFTER UPDATE 
AS
BEGIN
		DECLARE @LoaiGD_Updated NCHAR(1) ,
            @MACP_Updated NCHAR(7) ,
            @NGAYDAT_Updated DATETIME ,
            @GIADAT_Updated FLOAT
	 IF UPDATE(SOLUONG)
	 BEGIN
		-- GAN CAC GIA TRI DE UPDATE
		SELECT  @LoaiGD_Updated =  Inserted.LOAIGD,
                @MACP_Updated = Inserted.MACP ,
                @GIADAT_Updated= Inserted.GIADAT,
				@NGAYDAT_Updated = Inserted.NGAYDAT
        FROM   Inserted
		
		EXEC [dbo].[SP_BANGGIATRUCTUYEN] @LoaiGD_Updated , @MACP_Updated , 	@NGAYDAT_Updated,  @GIADAT_Updated
	END 
END 



GO
/****** Object:  Trigger [dbo].[TRIGGER_After_LENHKHOP]    Script Date: 21-May-21 11:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER  [dbo].[TRIGGER_After_LENHKHOP] 
   ON  [dbo].[LENHKHOP] 
   AFTER INSERT, UPDATE, DELETE 
AS 
BEGIN
	DECLARE 
		@CrsrVar CURSOR,
		@MACP Nchar(7),
		@GIAKHOP FLOAT, 
		@KLKHOP INT
	SET @CrsrVar = CURSOR KEYSET FOR (SELECT DISTINCT MACP FROM LENHDAT)
	OPEN @CrsrVar 
	FETCH NEXT FROM @CrsrVar INTO @MACP
	WHILE(@@FETCH_STATUS <>-1)
	BEGIN
		WITH temp2 AS
		(
		SELECT TOP 1  ROW_NUMBER() OVER(ORDER BY IDKHOP ASC) AS RowNumber, * 
			FROM LENHKHOP LK INNER JOIN LENHDAT LD ON LK.IDLENHDAT = LD.ID
					WHERE LD.MACP = @MACP AND CAST(NGAYKHOP AS DATE) = CAST(GETDATE() AS DATE) 
		) 
		SELECT @GIAKHOP = GIAKHOP, @KLKHOP = SOLUONGKHOP
		FROM temp2
		WHERE RowNumber = 1

		UPDATE BANGGIATRUCTUYEN
	 	SET KHOPLENH_GIA = @GIAKHOP,
			KHOPLENH_KL = @KLKHOP
		WHERE MACP = @MACP
		FETCH NEXT FROM @CrsrVar INTO @MACP
	END
END
CLOSE @CrsrVar 
DEALLOCATE @CrsrVar

GO
USE [master]
GO
ALTER DATABASE [CHUNGKHOAN] SET  READ_WRITE 
GO
