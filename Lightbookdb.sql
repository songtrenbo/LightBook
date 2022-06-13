USE master
IF EXISTS (SELECT *
FROM sysdatabases
WHERE name='Lightbookdb')
DROP DATABASE Lightbookdb
CREATE DATABASE Lightbookdb
GO
USE Lightbookdb

CREATE TABLE [Authors]
(
	[ID] INT IDENTITY(1,1) PRIMARY KEY,
	[Name]NVARCHAR(100),
)
GO

CREATE TABLE [Catalogs]
(
	[ID] INT IDENTITY(1,1) PRIMARY KEY,
	[Name]NVARCHAR(100),
)
GO

CREATE TABLE [Categories]
(
	[ID] INT IDENTITY(1,1) PRIMARY KEY,
	[Name]NVARCHAR(100),
)
GO

CREATE TABLE [Books]
(
	[ID] INT IDENTITY(1,1) PRIMARY KEY,
	[Name]NVARCHAR(100) NOT NULL,
	[Price] INT NOT NULL,
	[Review]NVARCHAR(max),
	[Picture]VARCHAR(500),
	[Chapter]nvarchar(max),
	[CategoryID]INT NOT NULL,
	[RatePoint] FLOAT,
	FOREIGN KEY(CategoryID) REFERENCES [Categories](ID),
)
GO

CREATE TABLE [AuthorBooks]
(
	[ID] INT IDENTITY(1,1) PRIMARY KEY,
	[AuthorID]INT NOT NULL,
	[BookID]INT NOT NULL,
	FOREIGN KEY(AuthorID) REFERENCES [Authors](ID),
	FOREIGN KEY(BookID) REFERENCES [Books](ID),
)
GO

CREATE TABLE [CatalogBooks]
(
	[ID] INT IDENTITY (1,1) PRIMARY KEY,
	[CatalogID]INT NOT NULL,
	[BookID]INT NOT NULL,
	FOREIGN KEY (CatalogID) REFERENCES [Catalogs](ID),
	FOREIGN KEY(BookID) REFERENCES [Books](ID),
)
GO

Create Table [Roles]
(
	[ID] Int IDENTITY(1,1) PRIMARY Key,
	[Name] Nvarchar(100) not null,
)
Go

CREATE TABLE [Users]
(
	[ID] INT IDENTITY(1,1) PRIMARY KEY,
	[Name]NVARCHAR(100) NOT NULL,
	[Avatar]VARCHAR(1000) NOT NULL,
	[Username]VARCHAR(100) NOT NULL,
	[Password]VARCHAR(100) NOT NULL,
	[PhoneNumber]VARCHAR(10),
	[RoleID] int not null,
	FOREIGN KEY (RoleID) REFERENCES [Roles](ID),
)
GO

CREATE TABLE [Favorites]
(
	[ID] INT IDENTITY(1,1) PRIMARY KEY,
	[UserID]INT NOT NULL,
	[BookID]INT NOT NULL,
	FOREIGN KEY (UserID) REFERENCES [Users](ID),
	FOREIGN KEY(BookID) REFERENCES [Books](ID),
)
GO

CREATE TABLE [Comments]
(
	[ID] INT IDENTITY(1,1) PRIMARY KEY,
	[Content] NTEXT NOT NULL,
	[UserID]INT NOT NULL,
	[BookID]INT NOT NULL,
	[RatePoint] FLOAT,
	[DateComment] DATETIME DEFAULT (getdate()) NOT NULL,
	FOREIGN KEY (UserID) REFERENCES [Users](ID),
	FOREIGN KEY(BookID) REFERENCES [Books](ID),
)
GO

CREATE TABLE [BookUsers]
(
	[ID] INT IDENTITY(1,1) PRIMARY KEY,
	[UserID]INT NOT NULL,
	[BookID]INT NOT NULL,
	FOREIGN KEY (UserID) REFERENCES [Users](ID),
	FOREIGN KEY(BookID) REFERENCES [Books](ID),
)
GO

CREATE TABLE [Carts]
(
	[ID] INT IDENTITY(1,1) PRIMARY KEY,
	[UserID]INT NOT NULL,
	[TotalPrice]INT NOT NULL,
	FOREIGN KEY (UserID) REFERENCES [Users](ID),
)
GO

CREATE TABLE [CartDetails]
(
	[ID] INT IDENTITY(1,1) PRIMARY KEY,
	[CartID]INT NOT NULL,
	[BookID]INT NOT NULL,
	[TotalPrice]INT NOT NULL,
	FOREIGN KEY(CartID) REFERENCES [Carts](ID),
	FOREIGN KEY(BookID) REFERENCES [Books](ID),
)
GO

Insert into Categories([Name]) Values (N'Văn học')
Insert into Categories([Name]) Values (N'Trinh thám')
Insert into Categories([Name]) Values (N'Kinh tế')
Insert into Categories([Name]) Values (N'Văn hóa')
Insert into Categories([Name]) Values (N'Lịch sử')

Insert into Authors([Name]) Values(N'Nguyễn Nhật Ánh')
Insert into Authors([Name]) Values(N'Nguyễn Dương')
Insert into Authors([Name]) Values(N'Chi Chan')
Insert into Authors([Name]) Values(N'Nguyễn Trương Thiên Lý')
Insert into Authors([Name]) Values(N'Thi Ngọc Thu Ân')
Insert into Authors([Name]) Values(N'Dương Thụy')
Insert into Authors([Name]) Values(N'Nguyễn Thu Thủy')
Insert into Authors([Name]) Values(N'Minhhoai')
Insert into Authors([Name]) Values(N'Ngọc Nữ Ngọc Nữ')
Insert into Authors([Name]) Values(N'Sparkling')
Insert into Authors([Name]) Values(N'NgoanSL')
Insert into Authors([Name]) Values(N'Kim Bính')
Insert into Authors([Name]) Values(N'Sinh Vật Đơn Bào')
Insert into Authors([Name]) Values(N'Quân Tử Tại Dã')
Insert into Authors([Name]) Values(N'Priest')
Insert into Authors([Name]) Values(N'Joseph Murphy')
Insert into Authors([Name]) Values(N'Walter Issacson')
Insert into Authors([Name]) Values(N'Tony Buổi Sáng')
Insert into Authors([Name]) Values(N'Og Mandino')
Insert into Authors([Name]) Values(N'Chin-ning Chu')
Insert into Authors([Name]) Values(N'David J.Schwartz. Ph.D')
Insert into Authors([Name]) Values(N'Dean Tjosvold')
Insert into Authors([Name]) Values(N'Mary M. Tjosvold')
Insert into Authors([Name]) Values(N'Tina Seelig')
Insert into Authors([Name]) Values(N'Napoleon Hill')
Insert into Authors([Name]) Values(N'BS. Ngô Đức Hùng')
Insert into Authors([Name]) Values(N'Jon Krakauer')
Insert into Authors([Name]) Values(N'Thích Nhất Hạnh')
Insert into Authors([Name]) Values(N'Nguyễn Ngọc Tiến')
Insert into Authors([Name]) Values(N'Lý Quang Diệu')
Insert into Authors([Name]) Values(N'Vũ Bằng')
Insert into Authors([Name]) Values(N'Nguyễn Vạn Lý')
Insert into Authors([Name]) Values(N'Peter Navarro')
Insert into Authors([Name]) Values(N'Hoài Thanh')
Insert into Authors([Name]) Values(N'Hoài Chân')
Insert into Authors([Name]) Values(N'Tiểu Thọ Tử')
Insert into Authors([Name]) Values(N'Quốc Huy')
Insert into Authors([Name]) Values(N'Lê Phùng Thi Uyên')
Insert into Authors([Name]) Values(N'Larry Berman')
Insert into Authors([Name]) Values(N'Bùi Mai Hạnh')
Insert into Authors([Name]) Values(N'Phạm Duy')
Insert into Authors([Name]) Values(N'Lưu Vệ Hoa')
Insert into Authors([Name]) Values(N'Trương Hán Vũ')
Insert into Authors([Name]) Values(N'Tư Mã Thiên')
Insert into Authors([Name]) Values(N'Tô Chẩn')
Insert into Authors([Name]) Values(N'Bảo Ninh')

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Mắt biếc',
	0,
	N'Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl',
	N'HỒI CÒN NHỎ, NHỎ XÍU, TÔI KHÔNG CÓ bạn gái. Suốt ngày tôi chỉ chơi với... mẹ tôi và bà nội tôi. Mẹ tôi rất thương tôi nhưng vìmẹ sợ ba nên ít khi mẹ che chở được tôi trước những trận đòn của ba tôi. Bà tôi thì lại khác. Bà sinh ra ba nên ba phải sợ bà. Điều đó thật may mắn đối với tôi.

Hồi nhỏ tôi rất nghịch, ăn đòn khá thường xuyên. Điềi đó buộc đầu óc non nớt của tôi phải tìm cách đối phó với những trận đòn trừng phạt của ba tôi. Mỗi lần phạm lỗi, hễ thấy ba tôi dợm rút cây roi mây ra khỏi vách là tôi vội vàng chạy qua nhà bà tôi. Bà tôi thường nằm trên cái sập gỗ lim đen bóng, bên dưới là những ngăn kéo đựng thuốc bắc của ông tôi. Bà nằm đó, miệng bỏm bẻm nhai trầu, tay phe phẩy chiếc quạt mo cau với một dáng điệu thong thả.

- Bà ơi, bà! - Tôi chạy đến bên chiếc sập, hổn hển kêu:

Bà tôi chỏi tay nhỏm dậy:

- Gì đó cháu?

- Ba đánh! - Tôi nói, miệng méo xệch.

- Cháu đừng lo! - Lên đây nằm với bà!

Bà tôi dịu dàng trấn an tôi và đưa tay kéo tôi lên sập, đặt tôi nằm khuất sau lưng bà, phía sát tường. Xong, bà tôi xoay người lại, nằm quay mặt ra ngoài.

Lát sau, ba tôi bước qua, tay vung vẩy cây roi, miệng hỏi:

- Mẹ có thâý thằng Ngạn chạy qua đây không?

- Không thấy.

Bà tôi thản nhiên đáp và tiếp tục nhai trầu. Tôi nằm sau lưng bà, tim thót lại vì lo âu. Tôi chỉ cảm thấy nhẹ nhõm khi nghe tiếng bước chân ba tôi xa dần.

Những lúc đó, tôi không dám về nhà ngay. Bao giờ tôi cũng nằm lại chơi với bà. Tôi nằm sấp người trên sập, nũng nịu:

- Bà ơi, bà gãi lưng cho cháu đi!

Bà tôi không bao giờ từ chối yêu cầu của tôi. Bà vừa gãi lưng cho tôi vừa thủ thỉ kể chuyện cho tôi nghe. Những câu chuyện đời xưa của bà tôi đã nghe đến thuộc lòng. Bà không có nhiều chuyện. Có bao nhiêu chuyện bà đã kể sạch sành sanh. Do đó, bà cứ kể đi kể lại mãi những câu chuyện cũ. Tuy vậy, mỗi khi bà kể chuyện, tôi luôn luôn nằm nghe với cảm giác hứng thú hệt như lần đầu tiên, có lẽ do giọng kể dịu dàng và âu yếm của bà, bao giờ nó cũng toát ra một tình cảm trìu mến đặc biệt dành cho tôi khiến trái tim tôi run lên trong nỗi xúc động hân hoan khó tả. Và tôi ngủ thiếp đi lúc nào không hay, với trái tim không ngừng thổn thức.

****

LỚN LÊN MỘT CHÚT, NGOÀI MẸ TÔI VÀ bà tôi, tôi có thêm ba người bạn gái. Đó là hai người chị con bác tôi. Chị Nhường lớn hơn tôi bốn tuổi, đầu nhiều ghẻ chốc nên lúc nào cũng cạo trọc. Chị Quyên bằng tuổi tôi, da đen nhẻm, quanh năm chỉ vận mỗi cái quần cộc, không bao giờ chịu mặc áo, mũi luôn luôn thò lò. Người thứ ba là cô Thịnh, con út của bà tôi. Cô Thịnh bằng tuổi với chị Nhường. Khi bác tôi sinh con gái đầu lòng thì bà tôi sinh con gái út. Đầu cô Thịnh cũng cạo trọc như đầu chị Nhường. Trẻ con quê tôi không có lắm trò chơi như trẻ con thành phố, suốt ngày chỉ nghịch đất nên đứa nào cũng lắm ghẻ.

Tôi cũng ghẻ đầy đầu nhưng may mắn không bị cạo trọc như chị Nhường và cô Thịnh. Mẹ tôi cho tôi hớt tóc "ca-rê", nhưng mẹ bảo lão Tứ hớt tóc húi đầu tôi tới tận ót, phô cái gáy trắng nhởn. Những mụn ghẻ trên đầu khi lành biến thành sẹo, thời gian không xóa nổi. Lớn lên tôi có thói quen để tóc dài phủ gáy là do vậy.

Dạo ấy, ông tôi định xây một dãy nhà ngang phía sau nên cho đổ một đống cát cao nghệu ngay trước sân. Suốt một thời gian dài, đống cát đó là sân chơi lý tưởng của bốn cô cháu chúng tôi. Chúng tôi suốt ngày bò lê trên cát, thi nhau đào những đường hầm sâu hút hoặc hoài công xây những tòa nhà cứ chốc chốc lại đổ sập. Xây nhà chán, chúng tôi lại vốc cát ném nhau. Tôi với chị Quyên một phe, chị Nhường với cô Thịnh một phe. Chúng tôi ném hăng đến nỗi cát bay mù trời và chui đầy cả hai tai, mũi, miệng. Tôi sợ cát bay mù mắt, cứ đứng xa xa, một tay che mặt, một tay vốc cát ném tới. Chị Quyên gan lì hơn tôi nhiều. Hai tay nắm cát, mắt nhắm tịt, chị xông lên phía trước ném liên hồi kỳ trận. Chị Nhường và cô Thịnh bị cát ném rát mặt liền kêu thét lên và bỏ chạy.

Sau những trò chơi ném cát thú vị đó, bao giờ tôi cũng bị ăn đòn. Ba tôi ban ngày đi làm không có nhà nhưng tối về nghe mẹ tôi kể tội tôi thế nào ba tôi cũng đem tôi ra xét xử. Thoạt đầu tôi phải đứng nghiêm, hai tay khoanh trước ngực và miệng lí nhí trả lời những câu hỏi đầy đe dọa của ba tôi. Tiếp theo, tôi lại phải nghểnh cổ nghe ba tôi luận tội. Thú thật, lúc đó tôi chẳng hề chú ý mảy may đến những lời răn dạy của ba tôi, đầu óc tôi mãi bận bịu vào việc đoán xem lát nữa đây tôi sẽ bị đánh mấy roi và thầm mong bà tôi đang đi chơi đâu đó trong làng sẽ kịp về trước khi xảy ra những chuyện đáng tiếc cho đứa cháu khốn khổ của bà. Nhưng khác xa với những ông Bụt trong câu chuyện bà kể, bà tôi chẳng bao giờ nghe được những mong mỏi thầm kín của tôi. Ít khi bà về đúng lúc. Bà chỉ về khi mông tôi đã hằn những vệt roi khiến lòng tôi thêm hờn tủi và tôi giận dỗi chẳng thèm trò chuyện với bà.

Không có bà tôi can thiệp, tôi đành phải buồn bã thực hiện nốt phần cuối cùng của phiên xét xử. Tôi lặng lẽ phủi chân leo lên bộ ván nằm sấp xuống, mặt áp vào phiến gỗ mát lạnh, quần kéo xuống khỏi mông. Tôi nằm im như thế, người căng ra, mắt nhắm nghiền. Không hiểu sao tôi luôn luôn tin rằng khi bị đòn, nhắm mắt lại sẽ ít đau hơn.

Ba tôi vừa đánh vừa đếm. Mặc dù đã chuẩn bị tinh thần, người tôi cứ bị giật nẩy mỗi khi ngọn roi quất xuống. Ba tôi không học được cách đánh nhẹ tay như mẹ tôi. Ba đánh đau thấu xương. Hai roi đầu, tôi nghiến chặt răng, cố không bật khóc. Nhưng đến roi thứ ba thì tôi không kềm giữ nổi. Bao giờ cũng vậy, đến roi thứ ba là tôi khóc òa.

Tôi vừa nức nở vừa leo xuống đất, chân sờ soạng tìm dép. Khi ngẩng mặt lên, tôi nhìn thấy một đôi mắt lấp ló ngoài khe cửa. Đó là đôi mắt cô Thịnh. Khi nãy, hẳn chị Nhường và chị Quyên cũng đứng rình phía ngoài, nhưng đến khi thấy tôi leo lên ván nằm úp mặt chuẩn bị thọ hình, chắc hai chị em khiếp đảm bỏ chạy về nhà.

******

LÀNG TÔI CÓ MỘT CÁI CHỢ TÊN LÀ CHỢ ĐO ĐO. Từ lâu, tên chợ đã thành tên làng. Lớn lên, tôi đi đâu xa, xưng là người làng Đo Đo, ai cũng biết. Người làng khác hay nói câu vè "chén Đo Đo là chó đen đen" để ghẹo người làng tôi. Mãi đến bây giờ, tôi vẫn không hiểu câu đó có ý nghĩa gì hay chỉ là một câu nói chơi, nhưng hồi nhỏ mỗi khi nghe ai nói như vậy, tôi tức lắm. Tôi cứ nghĩ người ta bảo mình là chó.

Chợ Đo Đo chỉ họp ban đêm. Ban ngày chợ vắng ngắt, chỉ còn trơ lại cây bàng già giữa chợ và nhừng căn lều trống trải, ọp ẹp nơi bọn trẻ con thường tụ tập chia phe đánh nhau.

Sau những lần bị đòn, tôi thường ra đứng một mình ở đầu hè, nhìn xuống chợ. Tôi đứng đó, buồn bã, cô đơn và rên rỉ như một con chó con. Tôi vừa xoa cặp mông bỏng rát vừa cảm thấy mình là đưá trẻ bất hạnh nhất trên đời và tôi cứ để mặc những giọt nước mắt lăn tròn trên má. Những lúc đó, tôi thường ao ước mình đột ngột chết đi để ba tôi phải hối hận vì đã đánh tôi, để mẹ tôi phải hối hận vì không dám can ba, và cả bà tôi nữa, bà sẽ vô cùng khổ tâm vì bà đã trót đi dạo trong một buổi tối quan trọng như vậy. Mọi người sẽ khóc sưng cả mắt. Nghĩ đến cảnh mẹ tôi và bà tôi khóc than vật vã, tóc xổ rối tung, aó quần xốc xếch, tự nhiên tôi thấy mủi lòng, không muốn chết nữa. Nhưng rồi tôi bất giác sờ tay xuống mông và kiên quyết giữ nguyên ý định trừng phạt mọi người bằng cái chết đáng thương của mình. Dĩ nhiên tôi không muốn chết hẳn. Chết hẳn như chú Hoan đám ma tháng trước, tôi sợ lắm. Vợ con chú khóc như ri nhưng chú thì chẳng nghe thấy gì. Chú ngủ, ngủ hoài và sẽ chẳng bao giờ dậy nữa. Mẹ tôi bảo vậy. Không, tôi không định chết như chú Hoan. Tôi chỉ chết chừng năm ngày thôi. Lúc ba mẹ tôi, ông bà tôi và những người thân khóc khô hết nước mắt thì tôi sẽ sống dậy trước sự hân hoan chào đón của mọi người. Lúc ấy, mọi người sẽ chen lấn giành giật nhau để được ôm lấy tôi. Ai tôi cũng cho ôm nhưng ba tôi thì không. Tôi sẽ lạnh lùng hất tay ba tôi ra, bất chấp vẻ đau khổ ánh lên trong đôi mắt ba. Nhưng dù sao, cuối cùng tôi cũng suy nghĩ lại và để cho ba tôi ôm tôi nhưng ba sẽ phải là người sau chót được đến gần tôi. Những ngày sau đó hẳn là những ngày rất tuyệt vời đối với tôi. Tôi sẽ tha hồ vấy bẩn áo quần, tha hồ nghịch cát, thậm chí chôn cả người trong cát, chỉ chừa hai lỗ muĩ, mà vẫn không sợ bị đòn. Mải chìm đắm trong viễn cảnh xán lạn đó, tôi quên béng cả khóc. Trong khi tôi đang nghĩ xem cần phải giở những trò nghịch ngợm gì nữa với sự tự do quá mức của mình thì tiếng cô Thịnh khẽ vang lên sau lưng:

- Ngạn đứng làm gì đó?

Giọng nói dịu dàng của cô Thịnh kéo tôi về với thực tại. Giấc mơ huy hoàng biến mất và tôi cay đắng hiểu rằng chẳng làm gì có chuyện nghịch cát mà không bị ăn đòn, rằng đời tôi sẽ còn đau khổ dài dài. Càng nghĩ tôi càng buồn tủi và bất giác tôi rơm rớm nước mắt.

Cô Thịnh nhẹ nhàng đặt tay lên vai tôi, hỏi:

- Ba Ngạn đánh Ngạn có đau không?

Tôi nức nở:

- Đau gần chết.

- Để cô xức dầu cho Ngạn nghen!

Tôi khụt khịt mũi và lặng lẽ gật đầu.

Cô Thịnh kéo quần tôi xuống và thoa dầu lên những lằn roi vắt ngang mông tôi. Hóa ra trước khi đi tìm tôi, cô Thịnh đã bỏ sẵn chai dầu trong túi áo.

Không hiểu do chai dầu hiệu nghiệm hay do tình thương của cô Thịnh mà tôi chẳng còn nghe đau đớn nữa. Những ngón tay của cô Thịnh lướt nhẹ trên da tôi như những cục bông gòn mềm mại.

Xức dầu cho tôi xong, cô Thịnh âu yếm hỏi:

- Ngạn đã hết đau chưa?

Tôi sụt sịt:

- Hết rồi.

- Hết sao Ngạn còn khóc?

Tôi chối:

- Ngạn đâu có khóc.

- Có. Cô thấy Ngạn khóc nè.

Tôi đưa tay quệt nước mắt:

- Đó là khi nãy. Bây giờ Ngạn đâu có khóc nữa.

Cô Thịnh không tin lời tôi. Cô nhìn tôi bằng ánh mắt nghi ngờ nhưng cô không hỏi nữa. Cô chỉ cầm tay tôi, rủ:

- Ngạn đi xuống chợ chơi với cô không?

Tôi biết cô Thịnh đi chợ chẳng để mua gì. Thấy tôi buồn, cô muốn dẫn tôi đi chơi vậy thôi. Dĩ nhiên là tôi gật đầu liền. Tôi rất thích xuống chợ. Bao giờ tôi cũng thích xuống chợ. Tôi có thể lượn lờ hàng tiếng đồng hồ không chán trước các sạp tạp hóa, mê mẩn nhìn ngắm những vòng xuyến xanh đỏ, những hộp chì màu luôn luôn có sức thu hút đối với tôi và những viên bi sặc sỡ nằm chen chúc trong các hộp giấy vuông vức với dáng vẻ hấy dẫn đặc biệt.

Tôi và cô Thịnh len lỏi qua những hàng cá tươi tanh nồng vị biển. Những người dân miền duyên hải da rám nắng phô hàm răng trắng ởn, mời chào. Sáng sớm thuyền về, những người buôn cá ở miệt biển thức dậy từ trước, vội vã xếp cá vào giỏ và thuê xe thồ đi suốt ngày không nghỉ để kịp đem cá đến phiên chợ đêm quê tôi. Làng tôi là làng núi nhưng ngày naò cũng có cá tươi là nhờ vậy.

Đi quanh quẩn một lát, tôi lại thấy mình đứng trước các sạp tạp hóa với những bà lão bán hàng giống hệt bà tôi, miệng lúc nào cũng móm mém nhai trầu. Tôi đứng đó, mắt dán chặt vào nhừng món hàng xinh xắn và lung linh đang bày biện trên sạp, lòng dậy lên một nỗi ao ước mơ hồ nhưng cháy bỏng. Suốt thời thơ ấu dài lâu, các sạp tạp hóa luôn luôn là một thế giới lộng lẫy và đầy bí ẩn đối với tâm hồn non nớt của tôi. Ấn tượng đó sâu sắc đễn nỗi mãi đến tận bây giờ, khi tôi đã bước qua tuổi ba mươi, cứ mỗi lần đi ngang qua một quầy tạp hóa bất chợt nào, tôi không làm sao kềm chế được ý định dừng chân lại và dán mắt vào tủ kiếng với một nỗi xao xuyến lạ lùng.

Trong khi tôi đang mê mải chìm đắm trong thế giới đầy màu sắc đó thì từ giữa chợ bỗng vọng lại những tiếng hò reo huyên náo.

Cô Thịnh lắc lắc tay tôi:

- Ngạn ơi, lại đằng kia xem xiếc đi!

Tôi theo cô Thịnh lần về phía tiếng ồn.

Chính giữa chợ, dưới gốc bàng già, giữa một vòng người hiếu kỳ chen chúc vây quanh, những tay sơn đông mãi võ đang làm trò. Cô cháu tôi phải loay hoay khá lâu mới vẹt được một khẽ hở chui vào.

Những người bán thuốc dạo cởi trần trùng trục và biểu diễn những trò lạ mắt. Họ gồng người lên và để cho những thanh mã tấu chém vào. Mặc dù biết chác rằng họ sẽ chẳng hề hấn gì, những thanh mã tấu chạm vào người họ sẽ dội ra như chạm vào một khối cao su, nhưng cứ mỗi lần thấy lưỡi thép bén ngót và lấp loáng ánh đuốc vung lên, tôi đều sợ hãi nhắm tịt mắt lại. Chỉ đến khi nghe những tiếng xuýt xoa và những tràng vỗ tay rầm rộ vang lên, tôi mới dám hé mắt nhìn, trống ngực vẫn còn đập thình thịch.

Tôi đã xem đám người mãi võ này làm trò nhiều lần. Họ không ngụ cư cố định ở một nơi nào. Quanh năm, suốt từ mùa hè đến mùa xuân năm sau, họ đi lang thang qua các làng mạc, các thôn xóm. Cứ khoảng vài tháng, họ lại đến vùng tôi một lần. Vẫn dựng lều dưới tán bàng già giữa chợ, vẫn những con người cũ với những tiết mục cũ nhưng kiểu cách sinh hoạt khác thường và những màn biểu diễn vừa quen thuộc vừa kỳ bí của họ bao giờ cũng toát ra một sức lôi cuốn mạnh mẽ khiến vòng tròn người chung quanh mỗi lúc một dày đặc và những người này, bị thôi miên bởi những phép gồng, những trò nuốt dao và phun lửa, đã háo hức tháo những cây kim băng cài ngang miệng túi để móc tiền ra mua những lọ cù là, những chai khuynh diệp, các thứ thuốc cao và thuốc chữa bệnh thời mạo khác.

Hồi đó, đối với tôi, màn biểu diễn cuối cùng của đám người phiêu bạt này bao giờ cũng là màn biểu diễn được trông chờ nhất. Sau khi bận rộn và vui vẻ thối tiền lẻ lại cho vô số người xem nhẹ dạ, một người trong đám mãi võ tiến về phía chiếc lồng sắt đặt dưới gốc bàng. Anh ta mở nắp lồng và từ trong đó, một con trăn đốm từ từ chui ra. Nó bò quanh một vòng, vừa trườn vừa uể oải lắc mình, khiến bọn trẻ con kêu thét lên. Tôi không khóc nhưng hồi hộp bước lui một bước, tay nắm chặt tay cô Thịnh. Trong lúc đó, người vừa mở nắp lồng đi lại gần con trăn. Anh ta chìa tay ra và con trăn lập tức trườn lên cánh tay anh ta. Rồi bằng những độg tác uốn éo, nó quấn quanh cánh tay nhiều vòng, sau đó nó tiếp tục nhoài tới quấn quanh bụng và cuối cùng nó cuộn tròn quanh cổ người biểu diễn bằng những cú lượn mềm mại nhưng vững chắc.

Tôi nhình sững cảnh tượng trươc mặt như bị thôi miên, lưng nổi đầy gai ốc, lòng pha trộn những cảm giác khó tả, vừa khiếp đảm lại vừa hân hoan.

Cô Thịnh đứng coi một lát rồi rùng mình bảo tôi:

- Về thôi, Ngạn ơi!

Cô sợ hả? - Tôi hỏi.

- Ừ, trông ghê quá!

Tôi nói:

- Ngạn cũng thấy ghê nhưng Ngạn không sợ. Ngạn đứng coi nữa!

Cô Thịnh kéo tay tôi:

- Thôi, về đi! Khuya rồi! Bộ Ngạn không sợ bị đòn hả?

Lời nhắc nhở của cô Thịnh khiến tôi giật thót và không chần chờ lấy một phút, tôi vội vã bước theo cô Thịnh lần ra khỏi đám người chen chúc, lòng đầy tiếc rẻ.

Khi ngước mắt lên, tôi nhận ra bầu trời đã đầy sao. Những vì sao chi chít chiếm hết mọi khoảng trống và mỗi lúc một tỏa sáng. Trong khi đó, dường như có ai đã tắt bớt những ngọn đèn dầu lung linh trong chợ. Một số hàng quán đã dọn về nhà, chỉ còn trơ lại những chiếc chõng tre đang sút dần những sợi mây buộc.

*****

LỚN LÊN MỘT CHÚT NỮA, TÔI ĐI HỌC.

Trước đó, tôi đã biết đọc chữ. Ba tôi sắm một quyển vở, thoạt đầu dạy tôi hai mươi bốn chữ cái, sau đó dạy tới vần xuôi, rồi vần ngược. Mỗi ngày tôi phải học thuộc một chữ. Tối ba tôi dò lại và dạy thêm chữ mới.

Nhiều hôm mải chơi quên cả học, tối đến tôi chỉ biết ngồi đực mặt ra trước trang vở. Hỏi năm lần bảy lượt, thấy tôi ấp úng đáp không xuôi, ba tôi biết ngay là tôi suốt ngày mê chơi, liền nổi dóa cốc cho tôi mấy cái vào đầu. Thấy tôi ngồi khóc rấm rức, nước mắt nước mũi sì sụt, mẹ tôi hẳn rất xót ruột nhưng không dám lên tiếng. Những lúc đó, ba tôi phạt tôi bằng cách không cho tôi đi ngủ. Tôi phải ngồi học tới học lui con chữ tôi đã quên đến tận khuya lơ khuya lắc.

Ban ngày tôi đã chạy nhảy mệt nhoài, vừa ăn cơm tối xong, hai mắt tôi đã muốn díp lại, vậy mà lúc này tôi phải ngồi tụng lấy tụng để những con chữ khúc khuỷu kia đến sái cả quai hàm.

Mắt nhắm mắt mở, tôi ngồi học khổ sở như một tội đồ, ngón tay trỏ đè vào con chữ đến thủng cả giấy, còn đầu thì gật gà gật gù. Đôi khi tôi thiếp đi, hồn phiêu diêu vào cõi mộng nhưng miệng vẫn đánh vần theo quán tính. Chỉ đến khi đầu tôi gục xuống, va phải mặt bàn đánh "cốp" một cái, tôi mới sực tỉnh và lại vội vã gào giọng đọc thật to.

Nghe tiếng đọc bài ê a giữa đêm khuya của tôi, bà tôi lẹp kẹp bước qua. Thấy tôi ngồi học một mình, hai mắt nhắm nghiền, đầu gục lên gục xuống... đánh nhịp, bà tôi giận run người. Bà bước vội lại bàn, cầm lấy quyển vở trước mặt tôi ném xoạch xuống đất rồi vừa ôm lấy tôi, bà vừa mắng ba tôi sa sả.

Bao giờ bà tôi mắng, ba tôi cũng im re. Ba lẳng lặng trên giường vờ đọc sách, không dám cãi lại nửa câu, mặc cho bà tôi bế tôi lê và nhẹ nhàng đặt tôi vào giường trong khi tôi đã ngoẻo cổ ngủ trên tay bà tự bao giờ.

Nhưng dẫu sao, chính nhờ những biện pháp giáo dục khắt khe của ba tôi mà trước khi bắt đâù đi học, tôi đã đọc thông các mặt chữ, điều mà không phải đứa trẻ nào cũng làm được.

*****

TRƯỜNG TIỂU HỌC LÀNG TÔI THUƠ ẤY CHỈ CÓ BỐN lớp, từ lớp hai đến lớp năm. Vì trường không có lớp một nên đa số trẻ con trong làng khi xin vào lớp hai đều học qua lớp vỡ lòng của thầy Phu.

Thầy Phu là một thầy giáo làng, mở lớp dạy học trò nổi tiếng, học trò thầy khi vào trường tiểu học bao giờ cũng đứng nhất. Thầy còn nổi tiếng là người nghiêm khắc, ưa phạt học trò nên học trò rất sợ thầy, không dám nghịch. Vì vậy, các bậc cha mẹ trong làng rất thích gởi con đến trường thầy Phu.

Nhà thầy Phu ở kế nhà tôi nên trước khi cho tôi đi học, ba tôi dẫn tôi qua ra mắt thầy.

Thoạt nhìn thấy thầy, tôi đã sợ. Mái tóc hoa râm chải lật ra phía sau, nụ cười lấp lánh nhưng chiếc răng bịt vàng và gọng kính lão xệ xuống trên mũi khiến đôi mắt nom như lồi ra, toàn bộ toát ra vẻ nghiêm nghị, mực thước và đe dọa.

Suốt buổi, tôi đứng khép nét nơi góc bàn, không dám thở mạnh và bằng một giọng lí nhí đến tôi cũng không nghe rõ, tôi lúng túng và rụt rè trả lời những câu hỏi của thầy, lòng chỉ mong cho buổi ra mắt chóng kết thúc.

Thầy Phu có hai người con. Chị Hạnh, khoảng mười lăm, mười sáu tuổi và thằng Hoà, trạc tuổi tôi. Đến hôm đi học chung lớp với tôi. Sau này tôi còn biết nó là một thằng bé hung hãn và ngang ngạnh. Tất cả bọn học trò chúng tôi thường xuyên bị nó bắt nạt. Những trò chơi của chúng tôi luôn luôn bị cắt đứt bởi sự xuất hiện của thằng Hòa. Nó tước đoạt thẳng tay những viên bi mù u, những nắp ken đã đổ đầy sáp của chúng tôi và những sợi thun của bọn con gái, thản nhiên cho vào túi và lững lững bỏ đi. Những nạn nhân chỉ biết ứa nước mắt nhìn theo.

Không phải bọn tôi không thể làm gì được nó. Bọn tôi thừa sức tóm cổ nó vật xuống đất và giã cho nó một trận nhớ đời. Nhưng không đứa nào dám đụng đến nó chỉ vì bởi một lẽ đơn giản, nó là con thầy Phu.

Có lần thằng Toản, một đứa mới vào học, chưa biết oai tha*`ng Hòa, bị thằng Hòa trấn lột. Toản thoi thằng Hòa một quả trúng quai hàm. Ngay lập tức, thằng Hòa nằm lăn xuống đất ăn vạ, chân giãy đành đạch. Tụi tôi đứng coi, sợ xanh mặt.

Thế là thằng Toản bị thầy Phu kêu lên. Thầy bắt nó chụm năm đầu ngón tay lại rồi dùng cạnh nhọn của cây thước kẻ đánh lên đó. Toản nghiến răng chịu đau, nước mắt chảy ròng ròng. Chưa hết, sau đó Toản còn bị phạt nhảy cóc ngoài sân. Trưa nắng chang chang, Toản ngồi chồm hổm, hai tay chống vào hông và nhảy quanh sân ba vòng y như con cóc.

Toản trợn mắt nhảy, lưỡi thè ra, miệng thở dốc. Đến khi vô chỗ ngồi, mặt mày nó còn đỏ lơ đỏ lưỡng, nói không ra hơi. Trong các hình phạt của thầy Phu, nhảy cóc là hình phạt bọn tôi sợ nhất. Thế mà vừa chân ướt chân ráo vào học, thằng Toản đã bị ngay.

Sau vụ đó, uy phong của thằng Hòa càng tăng gấp bội. Bọn tôi sợ nó một phép. Còn nó thì tiếp tục bóc lột và hiếp đáp bọn tôi không thương tiếc.

Trong những ngày gian khổ đó, tôi đã làm quen với Mắt Biếc, người bạn gái đầu tiên trong đời.
HỒI ĐÓ, TÔI CHƯA GỌI MẮT BIẾC LÀ MẮT BIẾC. Tôi gọi nó là Hà Lan, như mọi người vẫn gọi.

Trong lớp của thầy Phu, mỗi bàn ngồi ba đứa. Tôi ngồi ở bàn chót cùng, bên phải là Hà Lan, bên trái là thằng Ngọc. Bạn bè thường gọi Ngọc là Ngọc sẹo, vì nó có cái sẹo to bằng đít chén ở thái dương, tóc không che nổi.

Thoạt đầu, trật tự chỗ ngồi không phải như vậy. Hồi mới vào lớp, tôi ngồi ở ngoài rìa, kế tiếp là thằng Ngọc, rồi mới đến Hà Lan. Cho đến hôm thằng Ngọc ị trong quần thì chỗ ngồi đươc. sắp xếp lại.

Hôm đó, đang giờ tập viết, cả lớp đang yên lặng hí hoáy viết bỗng một cái mùi khủng khiếp tỏa ra cạnh chỗ tôi ngồi. Tôi nhăn mặt, nín thở liếc sang, thấy Hà Lan đang đưa tay bịt mũi còn thằng Ngọc thì đang ngọ nguậy với vẻ khổ sở, mặt tái xanh, mồ hôi lấm tấm trên trán.

Trước khi tôi kịp đoán ra chuyện gì thì tụi bàn trên xôn xao quay xuống, tay đứa nào cũng bịt mũi, còn mắt thì láo liên dò xét. Thấy vậy, mặt thằng Ngọc chuyển từ xanh qua đỏ và nócúi gầm mặt xuống bàn.

Ngay tức khắc, một đứa bàn trên đứng dậy tố cáo:

- Thưa thầy, trò Ngọc ị trong quần ạ!

Tin động trời đó khiến cả lớp nhốn nháo. Một số đứa che miệng cười khúc khích. Những đứa khác nhăn mặt vẻ ghê tởm và nhổ nước miếng luôn mồm. Còn thằng Ngọc thì nom thật tội nghiệp, đầu nó mỗi lúc một cúi chúi xuống như muốn chui tọt luôn vào gầm bàn.

Thầy Phu đập thước xuống bàn để vãn hồi trật tự, rồi thầy sai một đứa trong lớp chạy về nhà thằng Ngọc kêu mẹ nó lên.

Lát sau, mẹ thằng Ngọc tất tả chạy tới với thùng nước và miếng giẻ trên tay, nách còn kẹp chiếc thau nhôm. Sau khi bế nó ra khỏi lớp, mẹ nó quay vào chùi rửa, kỳ cọ thật sạch chỗ ngồi nơi nó gây ra tai họa.

Sau ngày xui xẻo đó, thằng Ngọc mắc cỡ nghỉ học liền tù tì ba buổi. Hôm nó đi học lại, cả lớp đều thấy mẹ nó cầm roi đi phiá sau. Không có cái roi đó, chắc nó bỏ học luôn.

Bữa đó, Ngọc đi vào lớp len lén như rắn mồng năm, mắt nhìn chăm chăm xuống đất, không dám ngó ngang ngó dọc. Biết nó chưa hết xấu hổ, bọn tôi không nỡ chọc. Phần khác, bọn tôi sợ thầy Phu. Thầy đe rồi, đứa nào hó hé về chuyện bữa trươc sẽ bị phạt nhảy cóc năm vòng sân. Nhảy ba vòng, mắt đã đổ hào quang, nhảy năm vòng chắc xỉu luôn tại chỗ. Nghĩ vậy, đứa nào cũng ớn.

Cũng như tôi, thấy thằng Ngọc vào, Hà Lan tảng lờ không nhắc gì chuyện cũ. Nhưng nó không cho Ngọc ngồi gần. Nó bảo tôi và thằng Ngọc đổi chỗ cho nhau. Tất nhiên thằng Ngọc không dám phản đối. Bây giờ nó chỉ mong đươc. yên thân.

Thoạt đầu tôi hơi ngần ngừ trước đề nghị của Hà Lan. Tôi sợ phải ngồi vào cái chỗ kinh hoàng kia. Nhưng trước lời van nài khẩn thiết của Hà Lan, nhất là trước đôi mắt long lanh lúc nào cũng mở to của nó, cuối cùng tôi đành phải xiêu lòng. Dù sao thì mẹ thằng Ngọc cũng đã chùi rửa kỹ lưỡng rồi, tôi tự trấn an như vậy và cảm thấy yên tâm hơn.

Từ đó, tôi ngồi cạnh Hà Lan.

*****

HÀ LAN LÀ MỘT CÔ BÉ DỄ THƯƠNG VÀ ĐẶC BIỆT DUYÊN dáng. Nét duyên dáng của Hà Lan hoàn toàn bẩm sinh, nó không hề ý thức về những cử chỉ mềm mại và kiểu cách của mình. Ngược lại, tôi luôn luôn tò mò và thích thú quan sát những động tác "dễ ghét" của nó. Hà Lan thường đưa tay vén tóc một cách đặc biệt, nó lắc đầu cho tóc hất qua vai cũng đặc biệt không kém và những cú liếc xéo của nó bao giờ cũng khiến tôi trố mắt nhìn.

Nhưng sức mạnh chủ yếu của Hà Lan nằm ở đôi mắt. Đôi mắt có hàng mi dài, lúc nào cũng mở to, hồn nhiên và ngơ ngác. Đôi mắt đó lúc bấy giờ đã khiến tôi buộc lòng đổi chỗ ngồi với thằng Ngọc và sau này cũng đôi mắt đó làm khổ tôi ghê gớm. Hồi nhỏ, tôi thích nhìn vào đôi mắt của Hà Lan, soi mình trong đó, và vẩn vơ so sánh chúng với những viên bi trong suốt, những viên bi "quí tộc" chỉ có bọn học trò trường thầy Phu chúng tôi - những đứa trẻ chỉ quen chơi với những viên bi làm từ trái mù u phơi khô thì đó chỉ là những ước mơ. Lớn lên, đôi mắt của Hà Lan lại gợi tôi nghĩ đến bầu trời và dòng sông, đến những ước mơ dịu dàng của tình yêu và khi đó tôi không còn đủ can đảm để nhìn lâu vào đôi mắt nó như ngày xưa thơ dại.

Dù vậy, Hà Lan không phải là cô bé hoàn toàn dịu dàng. Có lúc nó tỏ ra cực kỳ bướng bỉnh. Nhiều lần, sự ngang ngạnh vô lý của Hà Lan khiến tôi giận phát khóc, tôi nghỉ chơi với nó cả tuần nhưng rồi sau đó, buồn bã và nhớ nhung, tôi lại làm lành với nó. Số tôi thế, yếu đuối và dễ mềm lòng ngay từ nhỏ tôi đã biết thế nào là... khổ vì phụ nữ. Lớn lên, tình trạng càng tồi tệ hơn.

Nhưng bất chấp tính khí thất thường của Hà Lan, tôi vẫn yêu mến nó, người bạn gái đầu đời của tôi, bằng một tình cảm trong trẻo và ấm áp.

Trước trường thầy Phu, bên kia đường là nhà ông Cửu Hoành, một cơ ngơi rộng lớn với khoảnh sân rộng lát gạch, hồ nuôi cá và vườn tược bao quanh. Bọn học trò chúng tôi chẳng biết và cũng chẳng cần biết ông Cửu Hoành là ai. Chúng tôi chỉ biết trong vườn nhà ông, cách cổng vào làm bằng những cây hoa giấy uốn cong khoảng mười thước, có một cây thị xum xuê trái. Bọn tôi thường rủ nhau lẻn vào đó nhặt những trái thị rụng vương vãi dưới gốc cây. Cây thị già, cao to, khó trèo, nhà ông Cửu Hoành lại có hai con chó dữ sẵn sàng xồ ra bất cứ lúc nào, vì vậy chẳng đứa nào trong bọn tôi dám nghĩ đến chuyện trèo lên cây thị.

Có lần, thằng Ngọc đến trễ, những trái thị rụng đã bị bọn tôi vét sạch, nó đánh bạo bám cây trèo lên. Bọn tôi sợ hãi chạy dạt cả ra ngoài cổng, hồi hộp đứng nhìn vào. Ngọc vừa trèo lên tới chỗ chạc ba thấp nhất, đang bám cành cây nghỉ mệt, những con chó nghe động liền chạy túa ra bao vây gốc cây và đứng ngóc cổ sủa xối xả. Thằng Ngọc ở trên cây run như cầy sấy, mặt tái mét. Lần đó, ông Cửu Hoành đích thân dắt thằng Ngọc qua trường, méc với thầy Phu. Dĩ nhiên Ngọc lãnh hình phạt nặng nhất. Nó nhảy cóc ba vòng sân, tởn tới già.

Trước tấm gương của thằng Ngọc, chẳng đứa nào mơ tưởng đến chuyện leo trèo nữa. Chúng tôi chỉ nhặt thị rụng. Trưa nào tôi cũng đến lớp thật sớm. Hễ ăn cơm xong, vừa buông đũa, là tôi tót là khỏi nhà. Nhét dấm dúi chiếc cặp vào ngăn bàn, tôi chạy ù qua vườn ông Cửu Hoành, vừa lấm lét canh chừng mấy con chó vừa vội vã nhặt những trái thị nằm lăn lóc trên cỏ. Có khi tôi phải giành nhau, kể cả đấm đá, với những đứa cũng đến sớm như tôi. Nếu tôi nhặt thị cho tôi thì tôi chẳng cần tả xung hữu đột làm gì cho u đầu sứt trán. Đằng này, tôi nhặt thị về cho Hà Lan.

Hà Lan rất mê những trái thị nhưng nó lại sợ hai con chó nhà ông Cửu Hoành nên không dám bén mảng vào khu vườn như bọn con trai. Tôi phải đi nhặt thị về cho nó.

Hà Lan không bao giờ ăn ngay. Mỗi khi tôi đưa thị cho nó, nó đều đem bỏ vào cặp, trái nhỏ thì nó bỏ vào túi áo, chốc chốc lại lấy ra đưa lên mũi hít lấy hít để.

Tôi nhìn trái thị vàng lườm trên tay nó, nhỏ nước dãi, giục:

- Sao mày không lột ra ăn?

- Để ngửi cho thơm!

Nói xong, Hà Lan bỏ tọt trái thị vào túi áo như để trêu tức tôi. Nhưng thường thường, Hà Lan không nấn ná được lâu. Trước giờ ra về, bao giờ nó cũng bóc thị ra và hai đứa tôi cùng ăn. Ăn xong, chúng tôi không quên dán những mảnh vỏ thị lên bàn rồi ngoẹo cổ nhìn. Những mảnh vỏ thị được bóc khéo khi dán lên bàn hoặc lên tường trông giống hệt một bông hoa, có khi là hoa quì, có khi là hoa cúc đại đóa, có khi là một loài hoa không tên nào đó màu vàng.

Người lớn lẫn trẻ con làng tôi đều thích trò này. Mỗi năm, đến mùa thị chín, trên những bức vách và những cánh cửa của các ngôi nhà trong làng lại bỗng nhiên xuất hiện vô số những bông hoa vàng. Những bông hoa này hẳn nhiên do những tay nghịch ngợm nào đó lén dán lên vào tối hôm trước nhưng rồi người ta cứ để mãi, chẳng ai buồn gỡ xuống, kể cả chủ nhà, chỉ có thời gian và mưa gió mới làm chúng tróc đi. Trong thời gian đó, khách đến làng tôi có cảm giác như đi giữa một rừng hoa mênh mông và vàng rực. Ngay cả lũ bướm cũng bị lầm. Chúng cứ lượn quanh trước các ngôi nhà từ sáng đến chiều, mãi đến khi trời sụp tối, chợ Đo Đo đã lên đèn, bấy giờ đói meo và thất vọng, chúng mới buồn rầu đập cánh bay đi.

*****

Đằng sau nhà tôi là một khu vườn rộng, trồng toàn chuối. Giữa vườn lẻ loi một cái giếng đá mốc rêu. Nước giếng đục, chỉ dùng để tưới cây và rửa chân. Nấu nướng, tắm táp và giặt giũ phải dùng nước giếng làng.

Giếng làng nằm trên con đường đất đỏ chạy ngang cuối chợ, cách nhà tôi non một dặm đường. Mỗi ngày mẹ tôi phải đi gánh nước từ sớm tinh mợ. Sáng thức giấc, nằm day trở trên giường, hễ nghe tiếng va chạm leng keng, tôi biết ngay mẹ tôi đang quảy thùng ra đi.

Mẹ tôi lấy nước ở giếng Cây Duối. Làng tôi còn có một cái giếng khác nữa, ở xa hơn, là giếng Bổng. Sau này, hai giếng không đủ dùng cho cả làng, người ta đào thêm cái giếng thứ ba, tức giếng Mới. Giếng Mới tất nhiên phải mới hơn hai cái cũ, nó là cái giếng xi-măng duy nhất trong làng.

Nhưng nhà tôi trước sau vẫn lấy nước ở giếng Cây Duối. Đó là thói quen hay sự thủy chung, hơn ba mươi năm sau, nếm trải mọi ngọt bùi và cay đắng của cuộc đời, tôi vẫn bị ám ảnh bởi câu hỏi vớ vẩn này và không tìm ra câu trả lời.

Vào những đêm có trăng, tôi thường theo ba tôi xuống tắm ở giếng Cây Duối. Tôi đứng trên nền giếng trơn rêu, sát ngoài rìa, trần truồng và co ro, chờ ba tôi dội từng gàu nước. Hồi ấy tôi sợ nhất là màn xát xà phòng. Xà phòng trên tóc tôi bao giờ cũng chảy vào mắt, cay xè. Mỗi lần ba tôi áp cục xà phòng lên tóc tôi, tôi đều sợ hãi nhắm tịt mắt lại. Chỉ sau khi dội hàng chục gàu nước, tôi mới dám nhấp nháy mắt và he hé mở ra. Vậy mà mắt cứ cay. Lần nào tắm xong, mắt tôi cũng đỏ hoe.

Đi tắm ở giếng làng vào những đêm trăng không chỉ có tôi là trẻ con. Thỉnh thoảng Hà Lan cũng theo ba nó đi tắm.

Lần nào thấy tôi, nó cũng ngạc nhiên và mừng rỡ kêu lên:

- Ơ, Ngạn kìa!

Tiếng kêu của nó bao giờ cũng khiến tôi sung sướng đến đỏ mặt. Và tôi nhe răng cười.

Hà Lan cũng tắm trần truồng như tôi. Nó không tỏ vẻ gì xấu hổ gì về chuyện đó mặc dù nó cố tình không quay mặt về phía tôi. Tôi cũng vậy, tôi quay lưng về phía Hà Lan và nghe rõ tiếng chân nó đang nhảy loi choi trên nền giếng vì lạnh. Dù vậy thỉnh thoảng tôi vẫn nghiêng mặt liếc về phía nó, một lần rồi hai lần và hơn nữa. Tôi cảm thấy xấu hổ về hành động của mình nhưng tôi không cưỡng được sự thôi thúc mạnh mẽ của trí tò mò. HàLan đi tắm không giống Hà Lan đi học. Người nó đẫm nước và loáng ánh trăng, nom huyền hoặc và xa lạ. Tôi chảng thấy nó giống chút nào với cô bé vẫn thường ngồi cạnh trong lớp, thậm chí có lúc tôi chảng thấy đôi chân nó đâu. Dường như nó biến vào ánh trăng. Những lúc đó, nó không giống nó, nó giống một giấc mơ hơn.

Tôi mang cảm giác kỳ lạ đó về nhà và nói với bà tôi:

- Con gái cởi truồng khác với con gái mặc quần áo, bà ạ.

Bà tôi giật thót:

- Cháu nói con gái cởi truồng nào?

- Con Hà Lan học chung lớp với cháu ấy mà! - Tôi nghiêm trang đáp - Khi nãy đi tắm cháu gặp nó. Nó cũng tắm truồng như cháu. Cháu len lén dòm nó, thấy nó lạ ghê. Nó như đang bay lơ lửng, bà ạ.

Bà tôi hừ giọng:

- Cháu hư lắm! Lần sau không được như vậy nữa! Ai lại đi dòm con gái đang tắm!

Tôi ngơ ngác:

- Dòm thì sao hả bà? Cháu dòm hoài!

Bà tôi cốc nhẹ lên đầu tôi:

- Vậy là cháu bà hư quá!

Tôi có cảm giác bà tôi chưa hiểu điều tôi muốn nói và tôi cố gắng giải thích:

- Nhưng mà lúc đó nó bay lơ lửng...

Thấy tôi bướng bỉnh, bà tôi giận dỗi cắt ngang:

- Nó bay trên trời hay nó đứng dưới đất gì cũng vậy thôi, hễ con gái đang tắm là không được dòm, cháu hiểu không?

Thấy bà nổi giận, tôi đành gật đầu mặc dù tôi không hiểu gì cả. Sau đó, tôi đi tìm cô Thịnh. Tôi hy vọng vì rất thương tôi, cô sẽ chia sẻ cảm giác của tôi mà không mắng tôi. Nào ngờ nghe tôi kể xong, cô Thịnh nói :

- Ngạn hư lắm!

Cô Thịnh nói giống hệt bà tôi. Tôi chán nản, chẳng còn buồn giải thích. Tối đó, tôi đi ngủ sớm, với hy vọng sẽ gặp lại hình ảnh hư ảo và kỳ diệu của Hà Lan trong giấc mợ. Nhưng tôi chẳng thấy gì cả. Tôi ngủ một mạch từ tối đến sáng, không mộng mị.

Sau này, đã nhiều lần tôi muốn kể câu chuyện đó với Hà Lan và hỏi xem có phải nó thật đã bay lơ lửng tối hôm đó hay không. Nhưng tôi cứ lưỡng lự hoài và rốt cuộc tôi đã không nói gì. Tôi e rằng Hà Lan cũng sẽ bảo tôi "Ngạn hư lắm " như bà tôi và cô Thịnh đã từng bảo. Mà một viễn ảnh như vậy thì chẳng sáng sủa gì.

Vì thế, tôi đành ngậm tăm. Mãi cho đến bây giờ. Và cũng mãi cho đến bây giờ, tôi vẫn tin rằng tối hôm đó quả thật Hà Lan đã bay lơ lửng trong ánh trăng, và nếu như lúc đó tôi nhìn nó lâu thêm chút nữa, biết đâu nó sẽ tan luôn vào kỷ niệm. Và như vậy, câu chuyện này sẽ chẳng có dịp hồi sinh.

*****

Nhưng đó là câu chuyện ban đêm, những đêm trăng sáng trên đường làng. Còn ban ngày, Hà Lan vẫn đặt chân trên mặt đất, đi lại và chạy nhảy. Đôi bàn chân đó một hôm bỗng bầm tím. Tôi nhìn thấy điều đó khibắt gặp Hà Lan đang ngồi khóc rấm rức sau hè trong giờ chơi.

Tôi liền ngồi xuống cạnh nó, tròn mắt hỏi:

- Ai làm gì mày vậy?

Hà Lan mếu máo:

- Thằng Hòa.

- Nó làm gì?

- Nó giật dây thun của Hà Lan. Hà Lan giật lại, thế là nó dẫm lên chân Hà Lan.

Vừa nói, Hà Lan vừa duỗi chân cho tôi xem những vết bầm. Một nỗi phẫn nộ bất thần dâng lên trong lòng tôi khiến tôi muốn nghẹn cổ. Tôi hiểu, đó là sự chịu đựng và nhẫn nhục lâu ngày bị tích lũy lại, cồn cào và sôi bỏng, nhưng trước nỗi sợ bị trừng phạt, nó không dám phát lộ ra, chỉ biến dạng thành mối căm ghét sâu cay, chồng chất và thù địch. Nhưng bây giờ, xúc động và phẫn uất trước những giọt nước mắt của Hà Lan, tôi không cảm thấy sợ hãi nữa. Tôi nói với Hà Lan:

-Tao sẽ đánh nó.

Sau khi buông một câu gọn lỏn, tôi chạy đi tìm thằng Hòa. Tôi bắt gặp nó ở cạnh hàng rào. Nó đang uy hiếp bọn con trai chơi bi và chuẩn bị ra tay cướp đoạt một món gì đó.

Tôi bước lại cạnh Hòa và không nói không rằng, tôi dang tay tống cho nó một quả vào bụng. Hòa ngã bật gọng xuống đất và trước khi nó kịp giẫy nẩy và tru tréo theo thói quen, tôi nghiến răng đá vào đùi nó những cú đá đau điếng trước những cặp mắt hả hê thầm lặng của những đứa đứng xem.

Tôi trừng trị thằng Hòa thì ba nó trừng trị lại tôi. Sau sự bùng nổ đó, tôi phải chụm tay lại lãnh những cú quất khủng khiếp bằng thước kẻ của thầy Phu. Rồi tôi phải ra sân nhảy cóc mười vòng, một hình phạt chưa từng có kể từ khi thầy Phu mở lớp dạy học trò.

Nhưng tôi không thèm năn nỉ thầy Phu, cũng không thèm xin lỗi thằng Hòa. Tôi mím môi nhảy, tay chống vào hông, mồ hôi và nước mắt ướt đẫm trên má. Nhảy được bốn vòng, mắt tôi đã hoa, chập chờn quanh tôi vô số những ngôi sao nhấp nháy và vô số những gương mặt lo lắng và hãi hùng của tụi bạn. Giữa vòng thứ sáu, tôi té chúi đầu xuống đất và ngất xỉu giữa sân nắng.

Tôi tỉnh lại giữa mùi dầu cù là và mùi lá ngải cứu. Và gương mặt đầu tiên tôi nhìn thấy là gương mặt Hà Lan. Nó ngồi bên cạnh tôi, thút thít khóc và nhìn tôi bằng đôi mắt mở to, lo âu và đẹp lạ lùng - mắt biếc.

*****

Kể từ hôm đó, thằng Hòa đã bớt thói hung hăng. Nó không còn dám bắt nạt những đứa trong lớp một cách vô lối nữa. Nhưng điều tốt đẹp đó lại xảy đến quá muộn. Bởi vì đã đến lúc chúng tôi từ giã ngôi trường mái lá với những bàn ghế ọp ẹp của thầy Phu, từ giã sự dạy dỗ tận tụy và những hình phạt rùng rợn của thầy, từ giã những trưa nắng chang chang lẻn vào vườn ông Cửu Hoành nhặt thị rụng.

Vâng, từ giã lớp vỡ lòng thơ ấu đầy những kỷ niệm đắng cay và ngọt ngào, chúng tôi vào trường tiểu học, một thiên đường của tuổi nhỏ với những dãy lớp tường vôi ngói đỏ và một sân chơi rộng mênh mông.

Suốt những năm học tiểu học, Hà Lan vẫn ngồi cạnh tôi. Chỉ có thằng Ngọc là chuyển sang ngồi dãy bên kia. Dường như nó muốn chối bỏ và xóa nhòa trong ký ức cái vị trí gợi lại sự kiện đáng buồn hôm nào.

Dạy chúng tôi năm lớp hai là thầy Cải. Thầy Cải người cao to, mắt chột, tóc rễ tre, khác xa hình ảnh nghiêm trang và đạo mạo của thầy Phu.

Thầy Cải dạy học bữa đực bữa cái. Thầy mê câu quăng. Hôm nào bận đi câu trên suối Lá, thầy cho chúng tôi nghỉ. Thầy cho nghỉ học hoài nên hồi đó chúng tôi rất mến thầy. Những lúc đó, tôi và Hà Lan không về nhà ngay. Chúng tôi ra ngồi ngoài cột cờ xem các anh chị lớp lớn thi thả diều. Những cánh diều đủ kiểu, màu sắc sặc sỡ với những chiếc đuôi dài thậm thượt đang đua nhau uốn éo, chao liệng trên nền trời xanh khiến tôi và Hà Lan ngồi ngắm mê mẩn hàng giờ.

Trong số những người thi thả diều, có cả cô Thịnh và chị Nhường. Cô Thịnh và chị Nhường cùng học lớp năm, trên tôi ba lớp. Học cùng trường nhưng cô Thịnh và chị Nhường chỉ chơi với những bạn cùng lứa, chẳng bao giờ thèm chơi với tôi, thật khác xa với những lúc ở nhà. Tôi tiếc là bác tôi chưa cho chị Quyên đi học, mặc dù chị bằng tuổi tôi. Nếu chị Quyên đi học, hẳn chị sẽ chơi với tôi, và với Hà Lan.

*****

Mồi câu của thầy Cải là những con nháị Chúng tôi thường bắt gặp thầy lúi húi, sục sạo ngoài ruộng, bên các vệ cỏ hoặc dọc theo ven suối. Thầy bắt nhái, bỏ vào cái giỏ tre nhỏ cột bên hông. Thầy chỉ có một cái giỏ đó thôi, thầy không có giỏ cá. Cá câu được, thầy lấy cọng xâu qua mang, mắc vào cần trúc trên vai, về nhà. Thầy thích đi diễu qua trước mặt mọi người với những con cá lủng lẳng trên vai để nghe những tiếng trầm trồ thán phục.

- Hôm nay thầy Cải câu được con cá to quá cỡ, bà con ơi!

Những lúc như vậy, thầy tỏ ra sung sướng và dễ chịu đặc biệt. Đã thành lệ, hễ hôm nào thầy câu cá được cá to, ngày hôm sau chúng tôi tha hồ chạy nhảy và nghịch phá mà chẳng sợ bị phạt.

Nhưng không phải hôm nào thầy Cải cũng bắt được nhiều nhái như ý muốn. Những lúc đó, thầy bảo học trò đi bắt cho thầy, cứ một con là năm điểm tốt. Đối với bọn học trò chúng tôi hồi đó, điểm tốt rất quan trọng. Tháng nào được nhiều điểm tốt vị trí xếp hạng sẽ được nâng lên, dù điểm học tập có kém chăng nữa. Vì vậy những đứa học kém cứ suốt ngày lang thang ngoài ruộng tìm bắt nhái cho thầy để mong cải thiện tình hình. Những đứa học giỏi cũng thích bắt nhái vì được tự do đi chơi lông bông mà không sợ cha mẹ rầy. Vì vậy những ngày thầy Cải không kiếm đủ mồi câu, đành sai học trò đi bắt nhái về nộp, đối với chúng tôi là những ngày hội thực sự. Từng đám học trò chạy túa ra đồng, vừa chạy vừa hò hét inh tai, và sau một hồi bì bõm sục sạo dưới ruộng nước, quần aó và mặt mày chúng tôi nhem nhuốc còn hơn cả những người thợ cấy trong làng.

Bao giờ đi bắt nhái, tôi và Hà Lan cũng đi chung. Tất nhiên, bắt nhái là phần tôi. Còn Hà Lan chỉ có một việc là xách cái giỏ tre đi kè kè bên cạnh, hễ tôi tóm được con nhái nào, nó có nhiệm vụ mở nắp giỏ cho tôi bỏ vào, rồi đậy lại. Cuối buổi, chúng tôi chia đôi số nhái bắt được. Hôm nào có con lẻ, con đó thuộc phần Hà Lan.

Sự ưu tiên đó, mãi mãi sau này vẫn không thay đổi, chẳng hiểu vì sao.

*****

Chúng tôi lên lớp ba, xa thầy Cải, xa những ngày lội đồng bắt nhái. Chúng tôi học cô Thung. Cô Thung cử chỉ dịu dàng, giọng nói nhỏ nhẹ, âu yếm, chúng tôi rất yêu cô. Cô chỉ có mỗi cái tật hay khát nước. Hôm nào đang dạy, cô cũng than khát nước.

Mỗi lần cô Thung than như vậy, cả một rừng tay giơ tay lên:

- Em, cô!

- Em nè, cô!

- Nhà em gần, để em đi cho cô!

Cả lớp như một bầy ong, hò reo, giành giật. Đứa nào cũng muốn được cô sai đi rót nước. Được giúp đỡ và làm vui lòng thầy cô, dù là đi bắt nhái cho thầy Cải hay đi rót nước cho cô Thung, đối với bọn học trò chúng tôi là một hạnh phúc và là một vinh dự tột bậc. Vì vậy trong lúc giơ tay, đứa nào cũng nhìn cô bằng ánh mắt hồi hộp, miệng cố la thật to để hy vọng làm cô chú ý.

Thường thường cô Thung chỉ tôi, đơn giản vì cô hay qua nhà chơi với mẹ tôi. Còn tôi bao giờ được cô sai đi, tôi cũng xin cho Hà Lan đi theo với lý do đường xa, chúng tôi phải thay phiên nhau bưng nước, đỡ mỏi tay.

Mặt vênh lên, tôi và Hà Lan hớn hở bước ra khỏi lớp trước những ánh mắt ghen tị của tụi bạn. Và ngay khi vừa đặt chân ra khỏi cổng trường, hai đứa tôi lập tức chạy vù về nhà, miệng thở hồng hộc, áo đẫm mồ hôi, thỉnh thoảng té những cú đau điếng do vấp phải những mô đất hay những bụi cỏ mọc sát ven đường. Bao giờ đi lấy nước cho cô Thung, chúng tôi cũng chạy vắt giò lên cổ, không làm sao kềm lại được. Bởi vì, với một niềm vui rộng lớn trong lòng, làm sao tôi và Hà Lan hoặc một đứa trẻ nào khác có thể đi khoan thai, chậm rãi, lam` ra vẻ không có chuyện gì xảy ra.

Chỉ trừ khi đi từ nhà trở lại trường, với ly nước đầy tràn, lúc nào cũng sóng sánh chực đổ trên tay, tôi mới đếm bước một cách thận trọng, gần như rón rén. Hà Lan đi bên cạnh, mắt nhìn chằm chặp vào ly nước chông chênh trên tay tôi, cứ chốc chốc lại hỏi:

- Ngạn mỏi tay chưa?

Mặc cho nó hỏi, tôi mím chặt môi không đáp. Tôi biết, hễ tôi mở miệng, tay tôi sẽ run lên và nước tạt ra ngoài. Vì vậy, tôi cứ cắm cúi bước.

Đến khi Hà Lan hỏi đến lần thứ ba, biết nó đã nóng lòng thay thế tôi lắm rồi, tôi mới đứng lại trao ly nước lúc này chỉ còn độ hai phần ba cho nó.

Hà Lan mừng lắm, nó đón ly nước trên tay tôi như đón niềm hạnh phúc lớn lao, mắt sáng ngời. Niềm hạnh phúc đó, dọc đường Hà Lan còn làm đổ thêm một ít xuống đất, tiếp theo sự phung phí của tôi, trước khi đặt nó lên bàn của cô Thung.

Nhưng cô Thung chẳng phàn nàn gì về điều đó. Cô cảm động bưng ly nước chỉ còn một phân nửa đưa lên miệng uống một mạch. Khi cô đặt cái ly rỗng xuống bàn cũng là lúc tiếng trống tan trường vang lên.

Bao giờ tôi và Hà Lan quay trở lại trường cũng đúng vào giờ tan học. Điều đó luôn luôn khiến tôi đặc biệt thích thú.
',
	1
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Tùng Hoa',
	0,
	N'Thuở xa xưa, Thần Tộc ở vùng đất Đại Vân Đình xinh đẹp phải cách ly khỏi Vùng Đất Mới - nơi sinh ra Nhân Tộc - sau khi chiến thắng cuộc Đại Phân Tranh lần thứ hai. Thần Nhân được truyền dạy rằng vì Nhân Tộc muốn chiến thắng Thần Tộc nên đã tạo ra một Lời Nguyền Huyền Lực để chuyển sinh Độc Tôn Đại Đế mang trong người sức mạnh từ Năng Lượng Tối. Độc Tôn Đại Đế có sứ mệnh mở ra cuộc Đại Phân Tranah một lần nữa nhầm thôn tính Đại Vân Đình và cướp đi cây Trường Sinh - cung cấp Năng Lượng Sáng giúp Thần Tộc mạnh mẽ từ thuở khai nguyên. Để ngăn chặn điều đó xảy ra, Thần Tộc đã lập nên một Lời Nguyền Thần Lực để chuyển sinh Vệ Nữ. Vệ Nữ mang sứ mệnh tìm ra Đại Đế thông qua Ấn Ký, từ đó Bát Thần Bộ - tập hợp tám Thần Nhân mạnh mẽ nhất - sẽ loại trừ Lời Nguyền Huyền Lực mãi mãi.\nThời gian trôi qua, mọi chuyện đã lùi dần vào quá khứ xa xôi. Vùng Đất Mới đã bị Nhân Tộc chia cắt thành những quốc gia riêng biệt và đắm chìm trong những cuộc chiến tranh, càng không còn ký ức về sự tồn tại của Thần Tộc. Thần Tộc vẫn sống yên bình phía sau dãy Thiên Cổ Vân Sơn nhưng luôn luôn cảnh giác với mối nguy ở đất Nhân Tộc.\nCả hai lời nguyền đã không bao giờ thức tỉnh, cho đến mùa đông của một vạn năm sau...',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/f3dfff9c-1661-4a27-91ea-bef79d0a0643.jpeg?itok=S-G1BR6f',
	N'Đôi nam nữ đi dọc bờ biển bên cạnh nhau trong một buổi chiều tà. Ánh mặt trời đỏ ửng ở phía cuối chân trời, tiếng sóng vỗ rì rầm vào bờ cát mịn, cảnh vật vẫn thanh bình dù thế giới đã có bao biến động. Cô bé gái chừng bốn năm tuổi chạy tung tăng gần mép nước chơi đùa, chốc chốc lại cúi xuống nhặt nhạnh thứ gì đó như là những chiếc vỏ ốc lẫn trong cát bị sóng đánh bật lên. Được một lúc thì họ dừng lại, đứng nhìn cảnh hoàng hôn trước mặt, tư lự chẳng nói gì nhiều.
- Dạo gần đây ta suy nghĩ rất nhiều về những chuyện đã qua, những điều kỳ lạ mà chưa ai hiểu hết được. Chúng ta đứng giữa thế gian này thật bé nhỏ. Trong khi chúng ta đang mải miết tranh đấu thì Tạo Hóa vẫn đang làm việc của riêng mình, định đoạt mọi thứ tồn tại xung quanh. Rồi một lúc nào đó, Tạo Hóa lại đưa tay chạm vào thế giới này lần nữa, lúc đấy mọi thứ sẽ ra sao? Những tòa thành này có tan thành cát bụi? Chúng ta có biến mất như thể chưa từng tồn tại? Thế giới này rồi sẽ trở thành như thế nào? Những chuyện như thế rõ là chúng ta không thể nào điều khiển được…
Chàng trai nhìn sang cô gái, nàng đang mỉm cười nhìn đứa trẻ đang chơi đùa gần đó. Cô gái thở dài, mắt không rời cô bé gái, nhẹ cười rồi nói:
- Chuyện của Tạo Hóa hãy cứ để yên cho Tạo Hóa. Chúng ta hãy sống cuộc sống của chúng ta tại thời đại của chúng ta cho thật tốt, dù mãi về sao thế gian có biến đổi thế nào thì khi ấy chúng ta không cần phải hối tiếc điều gì cả.
Cô gái quay sang nhìn chàng trai, nói tiếp:
- Nếu không vì Tạo Hóa, chúng ta cũng đã chẳng thể gặp được nhau và đi đến thời điểm này. Chúng ta nên trân trọng những gì đang có, trân trọng cuộc sống.
- Nàng nói phải! Hoàng hôn hôm nay thật đẹp, ta ở Hoa Nam bận rộn triều chính chẳng mấy khi có cơ hội thảnh thơi, cũng đã rất lâu rồi chúng ta mới lại có dịp thanh thản cùng nhau nhìn ngắm hoàng hôn ở biển như thế này.
Chàng trai gật gù, hướng ánh mắt về phía chân trời nơi mặt trời đã lặn một nửa xuống đại dương xa thẳm.
“Đúng là nếu không có Tạo Hóa, ta đã chẳng thể gặp được nàng... Mộc Ang à!”

CHƯƠNG 1​

“Thuở xa xưa, Thần Tộc mang trong người Thần Lực chuyển hoá từ nguồn Năng Lượng Sáng của dòng Thiêng Linh Tuyền thông qua Tùng Hoa đã thống trị toàn thế giới. Năng Lượng Tối sinh ra từ những ý niệm tiêu cực cũng thông qua Tùng Hoa được giải phóng. Với Thần Lực mạnh mẽ và tuổi thọ năm trăm năm, Thần Tộc đã dựng lên Đại Vân Đình trù phú, xinh đẹp trên vùng thảo nguyên rộng lớn. Cả Thần Tộc được lãnh đạo bởi Hội Đồng Lớn sống trong tòa Chính Điện hùng vĩ phía trên một dãy cao những bậc thang đá trắng.
Cuộc sống yên bình và hạnh phúc ở nơi đây tưởng chừng sẽ kéo dài bất tận cho đến khi Vùng Đất Mới hình thành phía bên kia dãy Thiên Cổ Vân Sơn. Thần Tộc đã xẻ núi xây lên cánh cổng Vạn Dặm Vân Quan và đưa những nhóm Thần Nhân đến Vùng Đất Mới để tìm hiểu với mục đích mở rộng vùng cư trú cho Thần Tộc. Rất nhiều lần những nhóm Thần Nhân được cử đi nhưng không một ai trở về. Hội Đồng Lớn tạm dừng việc cử người ra khỏi Đại Vân Đình và tập hợp các Thần Nhân có năng lực đến Chính Điện cùng nhau kiến tạo một cách thức giữ liên lạc giữa Chính Điện và Thần Tộc.
Hàng ngàn mùa xuân trôi đi, cuối cùng Chính Điện đã thành công kiến tạo kết nối toàn Thần Tộc với Đại Vân Đình đó là cây đại thụ Trường Sinh. Từ đó, mỗi đứa bé sinh ra sẽ đặt lên cây Trường Sinh một giọt máu để làm dấu tích. Nơi giọt máu thấm vào nhánh cây sẽ nảy lên một nụ hoa Trường Mệnh. Nụ hoa ấy sẽ nở thành một bông hoa pha lê tám cánh mang theo ánh sáng bảy sắc khi Thần Nhân đó tròn mười sáu tuổi. Lúc này Chính Điện lại bắt đầu công cuộc tìm hiểu Vùng Đất Mới. Nhưng lần này Vùng Đất Mới đã mang đến bất ngờ cho Thần Tộc.
Sau hàng ngàn năm, Vùng Đất Mới bây giờ đã có chủ. Nhân Tộc sinh ra với hình dáng bên ngoài không khác Thần Tộc nhưng họ không có Tùng Hoa nên không mang Thần Lực trong cơ thể. Năng Lượng Tối không được giải phóng nên Nhân Tộc không sống quá trăm năm. Với năng lực kém cỏi, Nhân Tộc luôn chìm trong giết chóc và tranh giành quyền lợi. Vùng Đất Mới còn sản sinh ra muôn ngàn loài động vật ăn thịt và cùng Nhân Tộc tranh giành quyền thống trị. Nhân Tộc chiến thắng tất cả và các loài động vật trở thành lương thực hoặc thú nuôi để phục vụ lợi ích cho họ.
Nhóm Thần Tộc xuất hiện ở Vùng Đất Mới đã khiến toàn Nhân Tộc đảo lộn. Họ được nhìn thấy một giống loài mạnh mẽ và thông thái hơn nhưng với số đông họ đã tiêu diệt nhóm Thần Tộc để bảo toàn vị trí thống trị của mình. Đại Vân Đình muốn giáo dục Nhân Tộc nên lập ra Hội Đồng Nhỏ để thống lĩnh toàn cõi Nhân Tộc. Để đưa được Hội Đồng Nhỏ đến thống lĩnh Vùng Đất Mới, cuộc Đại Phân Tranh đã hình thành giữa Thần Tộc và Nhân Tộc. Thần Tộc chiến thắng và Hội Đồng Nhỏ bắt đầu thống trị Vùng Đất Mới.
Hàng vạn mùa xuân khác trôi qua. Vùng Đất Mới dần trở nên trù phú dù Nhân Tộc mãi mãi không thể mạnh mẽ và sống lâu như Thần Tộc. Đến khi Đại Đế của Nhân Tộc xuất hiện và kêu gọi toàn cõi tấn công Đại Vân Đình. Đại Đế Nhân Tộc cho rằng sở dĩ Thần Tộc mạnh mẽ hơn là nhờ dòng Thiêng Linh Tuyền cho nên chỉ cần Nhân Tộc có được dòng suối thì sẽ trở thành Thần Tộc. Lòng tham của Nhân Tộc trỗi dậy và cuộc Đại Phân Tranh lần hai diễn ra.
Đại Vân Đình buộc phải xuất quân lần nữa để đánh bại Nhân Tộc. Trong sự hỗn độn của cuộc chiến Nhân Tộc đã trộm lấy sách ghi Thần Thuật của Hội Đồng Nhỏ và lập nên một Lời Nguyền Huyền Lực để chuyển sinh một Đại Đế có thể dùng Năng Lượng Tối chuyển hoá thành sức mạnh để chống lại Thần Tộc. Nơi tập trung Năng Lượng Tối dồi dào chính là Biển Bóng Tối ở tận chân trời phía đông ngoài đại dương xa xôi.
Thần Quân của Đại Vân Đình đã tiêu diệt được Đại Đế nhưng không kịp ngăn chặn Lời Nguyền Huyền Lực được tạo nên. Nhận thấy Nhân Tộc không thể cải tạo được nên Chính Điện từ bỏ chính sách thống trị Vùng Đất Mới và rút Hội Đồng Nhỏ trở về. Từ đó cánh cổng Vạn Dặm Vân Quan không mở ra lần nào nữa. Và để chống lại Lời Nguyền Huyền Lực, Thần Tộc đã lập nên Lời Nguyền Thần Lực để chuyển sinh Vệ Nữ. Khi Ấn Ký của Đại Đế được hình thành trên người một nam Nhân Tộc sơ sinh bất kỳ thì một nữ Thần Tộc vừa tròn mười sáu tuổi sẽ được cây Trường Sinh chọn làm Vệ Nữ khi hoa Trường Mệnh nở. Vệ Nữ sẽ có năng lực tìm kiếm Đại Đế của Nhân Tộc. Sau đó Bát Thần Bộ sẽ đến giải trừ Ấn Ký của lời nguyền kia một lần và mãi mãi.
Đại Vân Đình đã cho phá huỷ toàn bộ các sách ghi Thần Thuật để đảm bảo trong tương lai không ai có thể dùng những thuật đó để gây ra chiến tranh và giết chóc. Ngàn dặm sương mù cũng được tạo nên để bao phủ dãy Thiên Cổ Vân Sơn ngăn cách Đại Vân Đình và Vùng Đất Mới.
Khi cuộc Đại Phân Tranh lần hai kết thúc và Thần Tộc rời đi, toàn Nhân Tộc chìm trong Kỷ Mù Loà vì toàn bộ Nhân Tộc trưởng thành đã bị Thần Quân tiêu diệt và giao ước trong năm ngàn năm Nhân Tộc không được nói về sự tồn tại của Thần Tộc và Đại Vân Đình. Hơn vạn năm trôi qua, Đại Đế của Nhân Tộc đã không bao giờ xuất hiện, sự tồn tại của Thần Tộc cũng đã bị lãng quên ở Vùng Đất Mới.
Hai lời nguyền không thức tỉnh, hoà bình của Đại Vân Đình được bình ổn cho đến nay trong khi Nhân Tộc vẫn không ngừng chém giết lẫn nhau và phân chia Vùng Đất Mới thành những quốc gia riêng biệt.
“Đại Đế mang trên người một Ấn Ký Huyền Lực sẽ trở lại vào một mùa đông băng giá. Khi những cơn bão tuyết vần vũ nơi bầu trời phương bắc, những con sóng dữ ở mặt biển phía đông và những mùa hoa lụi tàn trên vùng đất phía nam.
Ở Đại Vân Đình phía bờ tây, Vệ Nữ được chuyển sinh với bông hoa Trường Mệnh màu đỏ máu. Chỉ có nàng có được năng lực tìm thấy được người mang Ấn Ký Huyền Lực giúp Thần Tộc mãi mãi bình yên.””

*​

“Hoa Trường Mệnh màu đỏ máu.”
Thần Quân bay qua những hẻm núi, những thị trấn và những dòng sông trên khắp Đại Vân Đình để tìm đón Vệ Nữ. Nàng đã chạy trốn nhiều ngày từ sau lễ Khai Hoa ở Chính Điện. Khi hàng ngàn hoa Trường Mệnh nở, tất cả những Thần Nhân dự lễ đã thảng thốt khi nhìn thấy một bông hoa bừng lên một màu đỏ máu. Hội Đồng Lớn lập tức đến tìm cô gái là chủ nhân của hoa Trường Mệnh đó nhưng nàng đã nhanh chóng trốn mất. Không ai biết nàng là ai và đã đi đến đâu. Chính Điện đã cử rất nhiều Thần Quân đi tìm kiếm trong nhiều ngày nhưng vẫn không tìm ra. Hầu hết các nữ Thần Nhân tròn mười sáu tuổi đều được đưa đến Chính Điện để kiểm tra Dòng Kết Nối với hoa Trường Mệnh.
Thượng Tôn Thần Mẫu nóng lòng vì sứ mệnh tìm kiếm Đại Đế đã bắt đầu có nghĩa Đại Đế của Nhân Tộc đã chuyển sinh. Bi kịch của vạn năm trước đang có nguy cơ bị lập lại và Thần Tộc mất đi cuộc sống bình yên. Ban Lão Thần mỗi ngày đều có cuộc họp với Thượng Tôn Thần Mẫu về việc truy tìm Vệ Nữ. Cả Chính Điện như rúng động và toàn Đại Vân Đình hoang mang.
- Thưa Thượng Tôn Thần Mẫu! Chúng tôi đã truy tìm khắp nơi vẫn chưa tìm được Vệ Nữ nhưng có được một tin tức có thể có liên quan.
Thượng Tôn Thần Mẫu rời ghế lớn trên điện cao đi nhanh xuống những bậc thang khi nghe tin báo về. Tà áo kéo dài phủ qua những bậc thang như dòng nước. Cành cây khô màu trắng trên tay với những nụ tròn li ti màu đỏ là Thần Lệnh, thứ đã luôn luôn ở cạnh Thần Mẫu qua nhiều đời.
- Có tin tức gì có thể tìm ra Vệ Nữ?
- Vào ngày Vệ Nữ xuất hiện, ở Viện Chung (cô nhi viện) có hơn một trăm Thần Nhân tròn mười sáu tuổi đến Chính Điện dự lễ Khai Hoa. Trong số đó có sáu mươi nữ Thần Nhân nhưng chỉ có năm mươi chín người trở về. Trong Viện Chung cũng có một nam Thần Nhân là người dạy các Thần Nhân trẻ võ thuật cũng mất tích cùng thời điểm đó nên rất có thể đó là Vệ Nữ đã cùng người kia chạy trốn.
- Truy tìm ngay hai người đó và đưa về Chính Điện.
Thần Mẫu thở sâu và nói, người rất có lòng tin rằng cuối cùng cũng tìm được tung tích của Vệ Nữ.

Ở giữa một hồ nước, lẩn khuất dưới những tán cây cao trong một khu rừng rậm phía nam Đại Vân Đình, một cô gái đang trầm mình tận hưởng làn nước mát mơn trớn da thịt mình. Trên bờ một vài con nai toàn thân trắng toát với cặp sừng mãnh màu đen đang đứng gần bờ uống nước. Nhiều loài hoa dại nở rộ quanh hồ kéo theo những đàn bướm ngũ sắc. Trong rừng cây những loài chim thi nhau hót ríu rít. Cảnh sắc như đang ở giữa mùa xuân dù thời điểm đang là mùa đông ở Nhân Tộc. Điều này cô gái đã đọc được trong một quyển sách nào đó ở thư viện. Nghe thấy từ xa có tiếng vó ngựa đang đi đến, cô gái bay lên bờ và mặc lại y phục, rồi lại bay lên một nhánh cây to cao gần đó nhìn xuống phía bờ hồ. Những con nai nghe có động tĩnh cũng đã rời đi.
Chàng trai ngồi trên lưng ngựa đang thong thả đi tới, ánh mắt đảo nhìn xung quanh như đang tìm kiếm gì đó. Đứng bên bờ hồ lộng gió, chàng trai lấy trong ngực áo ra một cây kèn trúc pha lê và bắt đầu thổi. Tiếng du dương nương theo làn gió vang vọng khắp cả khu rừng. Bài nhạc đã dừng nhưng người ngồi vắt vẻo trên cành cao vẫn còn lim dim mắt lắng nghe. Đột nhiên có một lực kéo vô hình kéo cô gái rơi xuống và nằm gọn trong vòng tay của chàng trai kia. Đôi mắt màu xám bạc nhìn cô gái rất nhiều cảm xúc. Cô gái vì bất ngờ nên vẫn đang mở to mắt nhìn người kia, chưa có phản ứng gì, sau đó mới vội vội vàng vàng đứng dậy.
- Nàng ở một mình có buồn không?
Chàng trai ân cần hỏi cô gái. Cô gái lắc đầu nói:
- Không buồn vì thú rừng xung quanh em rất nhiều, bọn chúng hay tìm đến khi anh không có ở đây.
- Sao ta không nhìn thấy con thú nào nhỉ?
- Kim Mã làm chúng hoảng nên đã đi hết rồi.
Cô gái nói và đưa tay vuốt ve bộ lông vàng óng ánh của chú ngựa. Chàng trai sực nhớ điều gì liền mở túi vải treo bên hông chú ngựa và nói:
- Ta có mang thức ăn về cho nàng. Nhiều ngày phải ăn trái cây rừng chắc em cũng ngán rồi nên ta mang ít bánh ngọt về đây.
- Cảm ơn anh!
Hai người dắt theo chú ngựa đi vào một hang đá khi trời đã ngả về chiều. Cả Đại Vân Đình nhanh chóng chìm vào màn đêm.

Cô gái tỉnh giấc khi cảm thấy có vòng tay ôm lấy mình, một hơi thở ấm nóng phả vào gáy. Nàng hơi co người lại vì chưa biết nên làm gì, một mặt muốn đẩy người kia ra, mặt khác lại sợ người đó sẽ buồn. Nàng nhớ ngày lễ Khai Hoa nàng đã háo hức thế nào để đi đến Chính Điện nhìn hoa Trường Mệnh của mình bắt đầu nở. Khi tất cả Thần Nhân cho hiện Dòng Kết Nối của mình với hoa Trường Mệnh thì của nàng lại là một sợi ánh sáng màu đỏ và hoa Trường Mệnh của nàng cũng là màu đỏ. Lúc đó, nàng cảm thấy đầu mình đau nhức vô cùng và trong lòng hoảng sợ. Khi Hội Đồng Lớn đến kéo theo rất nhiều Thần Quân tìm Vệ Nữ, nàng đã bay thật nhanh về Viện Chung và đến tìm Mễ Đằng. Mễ Đằng đang ngồi viết gì đó trong phòng riêng đã rất ngạc nhiên khi nàng đến tìm hắn và lại có vẻ đang hoảng sợ. Nàng hoảng sợ và khóc nức nở:
- Em không muốn làm Vệ Nữ! Em không muốn đến Nhân Tộc một mình! Chúng ta trốn đi có được không?
Mễ Đằng kinh người khi nghe cô gái nói. Trong phút chốc hắn đã hiểu chuyện gì xảy ra với cô liền kéo nàng vào trong phòng để bình tĩnh lại. Mễ Đằng là người dạy võ thuật cho các Thần Nhân và cô gái là một người bạn cùng lớn lên ở Viện Chung, gần đây cũng tham gia vào khóa học. Đôi mắt to tròn màu hổ phách của nàng đã khiến hắn lặng người rất nhiều lần khi nhìn vào đó, nên khi nàng đề nghị hai người cùng trốn đi hắn đã bằng lòng ngay.
Mễ Đằng cùng cô gái rong ruổi đã nhiều ngày và đang ở rất xa Chính Điện. Hắn cũng như cô gái không hề muốn nàng thành Vệ Nữ và có một ngày phải một mình rời Đại Vân Đình để đi đến Nhân Tộc đầy rẫy hiểm nguy gian khổ. Chỉ cần được ở gần nhau, hắn có thể cùng nàng lẩn trốn đến bất cứ nơi đâu nàng muốn.
Cô gái toàn thân bất động đang cố gắng chịu đựng nụ hôn mãnh liệt của Mễ Đằng trên môi nàng. Nàng cảm thấy rất hoang mang, muốn thoát ra khỏi vòng tay đang ôm ghì lấy mình lúc này chỉ sợ mọi chuyện sẽ đi xa hơn. Ở Viện Chung cùng nhau từ nhỏ, nàng luôn xem Mễ Đằng như anh trai vì hắn lớn hơn nàng mười tuổi. Thần Tộc có mười sáu năm đầu trưởng thành rất nhanh nhưng sau năm mười sáu quá trình già lão sẽ kéo dài nên một người gần ba mươi tuổi như Mễ Đằng chỉ nhìn như một người mới mười bảy tuổi. Cô gái không thể kiên nhẫn hơn vì bàn tay Mễ Đằng đã bắt đầu sờ soạng khắp người nàng và đang muốn cởi y phục của nàng ra.
- Không được! Buông em ra! Em không muốn!
Cô gái vùng vẫy thật mạnh để chống lại Mễ Đằng. Cảm xúc trong người dâng cao, Mễ Đằng không buông tay mà giữ chặt cô gái nằm phía dưới và tiếp tục hôn nàng. Cô gái né tránh Mễ Đằng. Nàng không còn cách khác nên dùng Thần Lực kéo một hòn đá ném vào đầu Mễ Đằng. Mễ Đằng phát tay đánh hòn đá vỡ vụn. Điểm sáng của Tùng Hoa trên trán cả hai sáng rực như vì sao. Mễ Đằng không bị đá đánh trúng vào đầu nhưng cũng bình tĩnh lại và buông cô gái ra. Hắn biết rõ nàng không muốn gần gũi hắn ngay từ lúc hắn bắt đầu hôn nàng. Hắn chỉ muốn cố gắng hơn chút nữa nhưng cuối cùng cô gái vẫn không đáp lại. Hai người im lặng không nói gì mà xoay lưng lại với đối phương. Cô gái vẫn còn lo sợ, hai tay ôm trước ngực.
- Ta xin lỗi! Ta sẽ không làm em sợ như vậy nữa. Em cứ ngủ đi.
Mễ Đằng bật ngồi dậy, cầm lấy thanh gươm và đi ra ngoài. Cô gái không nói gì chỉ cảm thấy mắt mình cay cay.
Thần Quân đông đúc đi vào khu rừng rậm sau nhiều ngày lần theo tung tích cô gái trốn đi từ Viện Chung. Khi đến gần một hồ nước thì chia ra bao vây. Có bóng người vụt qua trước cửa hang đá và bay vèo lên cao. Thần Quân lập tức bay theo. Chú ngựa lông vàng óng ánh đứng gần hồ nước hí lên một hồi sợ hãi vì từ đâu lại có rất nhiều Thần Nhân xuất hiện và bay đi làm náo động cả khu rừng.
Khi cảnh vật trở lại yên tĩnh, cô gái đang trốn trong hang rón rén đi ra ngoài và lên lưng ngựa phi nhanh qua cánh rừng. Mễ Đằng đã hẹn nàng sẽ gặp lại nhau khi hắn đã dụ được Thần Quân đi xa. Cô gái chỉ biết đi thật nhanh theo hướng Mễ Đằng đã chỉ nàng cho đến khi bất chợt phía trước xuất hiện một người. Người phụ nữ đó tay ôm một bó hoa rừng đang loay hoay bên một con hươu sao đang bị thương. Cô gái thấy vậy liền dừng ngựa và đi đến xem có thể giúp được gì không.
- Con hươu này bị gì vậy?
- Do trong rừng có tiếng ồn, nó sợ quá chạy đi và bị vấp vào mô đá kia.
Người phụ nữ chỉ tay vào một mõm đá nhô ra từ một gò cao vẫn còn dính chút máu của con hươu. Cô gái thấy bà ấy đang chuẩn bị bó ít lá thuốc vào chân con hươu bằng một mảnh vải xé ra từ gấu váy. Con hươu có vẻ bị đau nên vùng vẫy. Cô gái liền dùng Thần Lực khống chế để nó nằm im cho đến khi người phụ nữ xong việc. Con hươu đứng dậy sau khi đã được băng bó. Nó ngửi ngửi chỗ bị thương rồi lắc nhắc đi lại vào rừng. Người phụ nữ lúc này mới nhìn sang cô gái rồi lại nhìn chú ngựa và hỏi:
- Ở phía đó có gì mà lại ồn ào như thế? Hù doạ đám thú phải chạy đi lung tung.
Cô gái ngập ngừng nói:
- Ta đi từ phía đó nhưng không cùng chỗ có nhiều tiếng ồn nên không biết là vì sao.
- Cô đang đi đâu thế?
- Ta đang đi gặp một người bạn.
- Cô bao nhiêu tuổi rồi? Ta nhìn thì đoán cô khoảng mười lăm mười sáu tuổi.
- Ta... vừa mới mười lăm tuổi thôi.
- Cô gái tốt bụng như vậy nếu cô là Vệ Nữ thì tốt biết mấy.
Cô gái chột dạ, mặt có chút biến sắc nhưng cảm thấy có chút tò mò nên hỏi tiếp:
- Tại sao lại tốt?
Người phụ nữ thở dài nói:
- Cả Thần Tộc đang trông chờ vào Vệ Nữ cứu giúp nhưng cô ấy đã trốn đi mất rồi. Nếu cô ấy không trở lại Đại Vân Đình sẽ ra sao đây chứ?
- Cô ta chỉ là một cô gái mười sáu tuổi sao gánh vác được chuyện lớn như vậy? Hơn nữa, cô ấy sẽ phải đến Nhân Tộc một mình và phải chịu rất nhiều gian khổ để tìm ra một người giữa thế giới rộng lớn đó, các người trách cô ấy nhưng có nghĩ cho cô ấy không? Cô ấy chỉ muốn sống yên bình ở đây, Kết Tùng Hoa với chàng trai mà cô ấy sẽ yêu, ngày ngày tháng tháng không phải ưu phiền.
Người phụ nữ trầm ngâm như nghĩ ngợi những điều cô gái nói
- Nhưng nếu Đại Đế xuất hiện thì Đại Vân Đình sẽ không còn được yên bình nữa. Nơi này có hàng ngàn hàng vạn Thần Tộc cũng muốn sống yên bình, rất nhiều đứa trẻ đang lớn lên và cũng muốn sống hạnh phúc. Vì người khác mà xả thân đôi khi cũng là một thứ hạnh phúc và ta tin rằng Vệ Nữ chỉ là còn bỡ ngỡ, chưa chấp nhận được sự thật mà thôi. Cô ấy sẽ không cảm thấy hạnh phúc nếu mang cả Thần Tộc và Đại Vân Đình ra đánh đổi. Cô ấy rồi sẽ quay lại. Ta tin Vệ Nữ sẽ thấu hiểu!
Cô gái đã leo lên ngựa và định rời đi. Nàng không thể chịu đựng được khi nghe người phụ nữ kia nói chuyện. Người phụ nữ nhìn nàng và mỉm cười với nàng rồi nói:
- Cô gái à! Thời gian không còn sớm, cô hãy đi tìm bạn của mình kẻo muộn. Có rất nhiều chuyện nếu đã muộn thì dù có thấu hiểu cũng không còn cơ hội để sửa chữa sai lầm được. Đi nhanh đi! Không thì bạn cô có thể sẽ giận mà không chờ cô nữa.
Cô gái chau mày nhìn người phụ nữ rồi gật đầu tỏ ý chào và thúc ngựa đi thẳng. Không hiểu sao trong đầu nàng cứ mãi suy nghĩ về những lời nói của người phụ nữ kia. Bà ấy đã đứng nép sang một bên để nhường lối cho nàng rời đi và vẫn đứng ở phía sau nhìn theo nàng cho đến khi dáng của nàng khuất hẳn. Nàng nhìn ngắm cảnh vật của Đại Vân Đình lướt qua trong mắt. Những bụi trúc pha lê trong suốt, những vườn cây trái xum xuê, âm thanh trong trẻo của những luống hoa chuông ngân lên theo những đợt gió đưa. Nhiều thị trấn và thôn làng len lỏi khắp các thảo nguyên, dòng sông, con suối. Dòng Thiêng Linh Tuyền trong vắt đổ xuống từ ngọn thác cao ngút tầm mây chưa có một Thần Nhân nào có thể bay lên đỉnh của nó cũng như dãy Thiên Cổ Vân Sơn ở phía đằng đông ngăn cách Đại Vân Đình và Vùng Đất Mới.
“Những cảnh đẹp này sẽ không còn nếu Đại Đế xuất hiện sao? Ta có thể đứng nhìn điều đó xảy ra ư? Ta phải làm sao? Trở về hay tiếp tục lẩn trốn?”

*

Mễ Đằng đứng chờ cô gái đã rất lâu và rất lo sợ nàng đã bị Thần Quân bắt được. Khi nhìn thấy cô gái cưỡi trên lưng Kim Mã đi đến thì nét mặt của Mễ Đằng mới giãn ra đôi chút. Hắn chạy nhanh lại chỗ chú ngựa và đỡ cô gái bước xuống. Trông cô gái có vẻ bần thần không được vui.
- Em sao vậy? Ta đã rất lo lắng cho em.
- Em không sao! Nhưng em đang nghĩ việc em đang làm là đúng hay sai.
Mễ Đằng nheo mắt nhìn cô gái, một nỗi sợ trỗi lên trong lòng hắn. Hắn nắm lấy tay cô và nói:
- Em không sai! Em sẽ không sống nổi ở đất Nhân Tộc một mình. Chính Điện có rất nhiều Thần Quân chẳng lẽ không thể đánh thắng một tên Nhân Tộc nhỏ nhoi? Chúng ta không cần phải sợ! Đã qua hai cuộc Đại Phân Tranh và Thần Tộc luôn chiến thắng.
- Nhưng đó là trước khi Nhân Tộc có được Lời Nguyền Huyền Lực. Lần này Đại Đế trở lại với Huyền Lực của Biển Bóng Tối. Nếu mọi chuyện đơn giản thì Chính Điện sẽ không dùng đến nhiều Thần Quân để tìm kiếm em như vậy.
- Em không thể quay về đó. Không ai có thể bảo vệ em một khi em rời khỏi nơi này. Ta không thể để em đi như thế! Ta không sống được nếu thiếu em!
Mễ Đằng ôm chầm lấy cô gái. Nỗi lo sợ của hắn đã dần trở thành sự thật. Cô gái hai tay buông thõng, lòng nàng mâu thuẫn và giằng xé.
Có tiếng đông người đang đến gần. Mễ Đằng và cô gái mải nói chuyện nên không đề phòng, lúc này những người kia đã đến rất gần. Hắn nắm lấy tay cô gái chực bay lên để trốn thoát nhưng cô gái đã thu tay lại và bước lùi mấy bước. Mễ Đằng không từ bỏ, bước nhanh lại chụp lấy tay cô gái kéo đi theo hắn.
- Chúng ta hãy đi nhanh lên! Thần Quân đã tìm ra chúng ta rồi.
- Em không đi nữa! Dù sao chúng ta cũng không thể thoát được.
- Chúng ta không được bỏ cuộc! Mặc kệ cái gì là Vệ Nữ và cái gì là Đại Đế. Chỉ cần chúng ta ở bên nhau là đủ rồi.
Giọng nói của một người đàn ông vang lên xen vào giữa cuộc nói chuyện của Mễ Đằng và cô gái:
- Đại Vân Đình sụp đổ thì hai người mãi mãi không có cơ hội để ở bên nhau đâu.
Rất nhiều Thần Quân từ trên cao đáp xuống đất và bao vây đôi nam nữ cùng chú ngựa. Người đàn ông cũng đứng trong vòng tròn đó với vẻ mặt nghiêm nghị, trên người mặc một chiếc áo khoác màu trắng như đang phát sáng trong đêm, tay phải cầm một thanh gươm.
Mễ Đằng kéo cô gái ra đứng sau lưng hắn dù mọi phía đều có Thần Quân nhưng với hắn người đàn ông kia là nguy hiểm nhất. Cô gái lúc này lại cảm thấy sợ hãi khi có quá nhiều người tìm đến bắt lấy mình. Người đàn ông bước tới phía trước vài bước chân thì Mễ Đằng đã rút kiếm chĩa về phía ông ấy, vẻ đe doạ. Người đàn ông dừng lại, liếc mắt nhìn mũi gươm rất gần mìnhkhẽ mỉm cười. Rất nhanh tay người đàn ông cũng tuốt gươm và giao đấu với Mễ Đằng. Giữa vòng tròn lớn được tạo bởi Thần Quân đứng xung quanh, hai người đó đánh nhau rất quyết liệt. Tùng Hoa của họ đều sáng lên để tăng sức mạnh khi ra đòn. Mễ Đằng rất khoẻ nhưng không nhiều kinh nghiệm như người đàn ông kia nên lộ sơ hở và bị đánh bật ra. Hắn vẫn không chịu thua liền đứng dậy và lao vào tấn công người đàn ông lần nữa. Lần này không mất nhiều thời gian người đàn ông lại đánh bật Mễ Đằng té xuống đất. Mễ Đằng bị đánh mạnh nên trúng thương, đưa tay ôm ngực và quỳ khuỵu gối chưa đứng lên được, mũi kiếm của người đàn ông đã ở ngay giữa hai mắt hắn khoảng cách rất gần.
- Ta theo các người về! Hãy tha cho anh ấy! Tất cả là lỗi của ta!
Cô gái nói to. Nàng cuối cùng cũng quyết định sẽ phải làm gì. Nàng biết là không trốn chạy mãi được và dù có trốn thoát nàng cũng không thể vì sự hèn nhát của bản thân mà đẩy Thần Tộc vào cuộc chiến tang tốc lần nữa, cho dù có chiến thắng thêm một cuộc Đại Phân Tranh thì rồi sẽ có bao nhiêu Thần Nhân phải chết trong cuộc chiến đó.
Người đàn ông nhìn cô gái, vẻ nghiêm nghị của ông ta không giảm đi chút nào nhưng rồi cũng thu kiếm lại. Cô gái đỡ Mễ Đằng đứng dậy. Mễ Đằng nhìn cô gái với ánh mắt luyến tiếc tột cùng.
- Vậy chúng ta nhanh về lại Chính Điện.
Người đàn ông không muốn dây dưa thêm chút nào nữa. Ông ấy phát tay ra hiệu cho Thần Quân vào đội hình hộ tống trước sau để đưa Vệ Nữ về lại Chính Điện.

*

Cây đại thụ Trường Sinh lớn như một ngọn đồi ngự ở giữa một hồ nước lớn ngay trung tâm toà Chính Điện. Nước trong hồ dẫn từ suối Thiền Linh Tuyền đổ vào nên trong veo lấp lánh. Vệ Nữ đứng trước cây Trường Sinh chuẩn bị mở Dòng Kết Nối để chứng minh thân phận của mình. Tùng Hoa của cô gái loé sáng, Dòng Kết Nối hiện ra là một sợi màu đỏ chạm vào hoa Trường Mệnh màu đỏ như máu trên một nhánh cây Trường Sinh, bên cạnh ngàn vạn bông hoa bảy sắc xung quanh.
- Kính nginh Thượng Tôn Thần Mẫu!
Cô gái nghe thấy mọi người chào Thần Mẫu thì ẩn đi Dòng Kết Nối và quay lại hành lễ chào. Thần Mẫu xuất hiện trước mặt mọi người với vẻ đẹp nhẹ nhàng trong bộ váy áo màu trắng có tà áo phía sau trải dài, tay vẫn luôn mang theo Thần Lệnh. Cô gái ngẩng đầu lên nhìn Thần Mẫu lần đầu tiên và không giấu được vẻ ngạc nhiên. Thần Mẫu có gương mặt rất giống với người phụ nữ mà cô gái đã gặp trong rừng ngày hôm trước, chỉ có khác là y phục lộng lẫy hơn cùng cách trang điểm cũng xinh đẹp hơn. Thần Mẫu nhìn cô gái và cười dịu dàng với nàng.
- Bà chính là bà ta.
- Chính là ta. Vệ Nữ cuối cùng cũng đã thấu hiểu mọi chuyện.
- Bà cố ý đến đó gặp ta và nói với ta mấy lời đó để ta phải quay lại.
- Ta đã cố ý che giấu thân phận nhưng tất cả những điều ta nói với con đều là thật. Đại Vân Đình rất cần con.
- Sao bà biết chắc ta sẽ chọn quay trở lại?
- Như ta đã nói là ta tin vào Vệ Nữ. Cơ duyên của cây Trường Sinh đã chọn con thì tất nhiên con phải có phẩm cách của Vệ Nữ.
- Bà biết rõ ta không thể thoát khỏi sự truy đuổi của Thần Quân thì sao lại phải đến đó và nhiều lời như vậy với ta?
- Bởi vì, nhiệm vụ lần này là nhiệm vụ sống còn của Thần Tộc. Thần Quân có thể bắt con đưa về đây nhưng nếu con không cam tâm chấp nhận thân phận Vệ Nữ của mình thì sẽ không có cơ hội thành công ở đất Nhân Tộc. Đây là sự hy sinh rất lớn lao, nếu không dùng quyết tâm để thực hiện thì nhiệm vụ sẽ thất bại ngay cả khi cuộc hành trình chưa bắt đầu.
- Vừa rồi mọi người đã thấy ta chính là Vệ Nữ thật. Bây giờ ta sẽ phải làm gì tiếp theo?
- Bây giờ sẽ có người đưa con đến nơi của Vệ Nữ nghỉ ngơi trước đã. Chúng ta có mười sáu năm để chuẩn bị trước khi bắt đầu cuộc hành trình tìm kiếm Đại Đế.
Cô gái trợn mắt ngạc nhiên khi biết phải mười sáu năm sau nàng mới phải đến Nhân Tộc tìm Đại Đế.
- Tại sao lại là mười sáu năm?
Thần Mẫu lại mỉm cười, đưa tay nắm lấy bàn tay lạnh toát của cô gái vỗ về.
- Ấn Ký Huyền Lực chỉ thực sự thức tỉnh khi Đại Đế của Nhân Tộc tròn mười sáu tuổi. Mười sáu năm này rất quan trọng đối với con vì con sẽ luyện tập để có thể giấu đi thân phận Thần Tộc của mình.
- Ta thực sự sẽ chỉ có một mình thôi sao?
- Phải! Chỉ có một mình thôi!
Cô gái đảo mắt nhìn hoa Trường Mệnh của mình lần nữa, rồi nhìn ra ngoài sân lớn chỗ Mễ Đằng đang bị một tốp Thần Quân khống chế không cho vào trong. Nàng lo lắng cho Mễ Đằng nên cầu xin Thần Mẫu:
- Người có thể tha cho hắn được không? Tất cả sai trái đều do ta gây ra, hắn chỉ làm theo ý ta mà thôi.
Thần Mẫu lại mỉm cười rất dịu dàng như để trấn an cô gái:
- Hắn cũng đã bảo vệ cho Vệ Nữ rất tốt nên ta sẽ không trách phạt hắn.
- Cảm ơn Thần Mẫu! Ta nhất định sẽ là Vệ Nữ tốt và bảo vệ Đại Vân Đình.
Thần Mẫu gật gật đầu tỏ vẻ hài lòng.
- Con tên là gì?
- Con tên là Mộc Ang.
Mễ Đằng vùng vẫy khi nhìn thấy Mộc Ang rời đi cùng Thần Mẫu mà không thể nói lời nào với hắn. Người đàn ông kia lại xuất hiện và ra lệnh đưa Mễ Đằng ra khỏi Chính Điện. Hắn không chịu đi nhưng cũng không chống lại được cả một nhóm Thần Quân. Ra đến bên ngoài, Thần Quân thả Mễ Đằng ra và theo sau người đàn ông trở vào trong. Mễ Đằng chạy theo sau họ. Người đàn ông quay lại và bước đến gần Mễ Đằng, nhíu mày nhìn hắn.
- Ta muốn vào Bát Thần Bộ! Bát Thần Bộ sẽ đến Nhân Tộc giải trừ Ấn Ký của Đại Đế đúng chứ? Như vậy ta sẽ sớm được gặp lại nàng ấy.
- Ngươi muốn vào Bát Thần Bộ thì trước hết phải là một Thần Quân.
- Vậy ta sẽ vào Thần Quân trước cũng được.
- Ngày tuyển chọn cũng sắp đến rồi, nếu ta là ngươi thì sẽ không phí thời gian ở đây mà đã về luyện tập. Khả năng của ngươi hiện tại để vào Thần Quân không khó nhưng để vào Bát Thần Bộ thì phải cố gắng nhiều hơn nữa.
Người đàn ông đi vào mặc cho Mễ Đằng vẫn còn đứng lại nhìn theo. Hắn đã quyết tâm phải vào Bát Thần Bộ để được gặp lại Mộc Ang.

*

Mộc Ang đi cạnh Thần Mẫu lên những bậc thang đá cao dẫn đến một hẻm núi dài. Theo sau là người đàn ông hôm trước đã đến bắt nàng về Chính Điện và một đội Thần Quân. Họ đi qua hết hẻm núi ngoằn ngoèo thì phía trước hiện ra một thung lũng hẹp ngăn cách bờ núi bên này với một ngọn núi bên kia có nhiều cây cối bao phủ. Nối liền hai phía là một chiếc cầu bằng đá không có lan can hai bên và cuối đầu cầu bên kia là một sân rộng, ở giữa có một bức tượng đá hình người đang đứng. Từ phía bên này nhìn sang, nếu không nhờ tầm nhìn của Thần Nhân tốt có thể bị nhầm tượng đá kia là một người thật vì đường nét điêu khắc rất mềm mại và tỷ lệ cân đối. Phía sau tượng đá cách xa một khoảng là một toà tháp bằng đá trông có vẻ như đã bỏ hoang từ lâu vì cây cối và dây leo đã bao phủ qua cả những hành lang dài. Cánh cổng lớn màu đen nằm trên những bậc thang cũng bằng đá.
Khi đã đi qua cầu và đứng ở giữa sân đối mặt với tượng đá kia, Mộc Ang ngắm nhìn bức tường lại thấy đó quả thật rất giống người thật. Bức tượng là một cô gái trẻ đang đứng thẳng, người mặc trang phục Thần Tộc, hay bàn tay xoè ra ở vị trí ngang ngực đang nâng một vòng tròn có hoa văn bên trong và ngay tâm là một vòng nhỏ.
- Đây là hình tượng Vệ Nữ của Thần Tộc. Thứ con nhìn thấy là Ấn Ký Huyền Lực của Đại Đế.
Mộc Ang nghe thấy giọng nói nhẹ nhàng của Thần Mẫu đang đứng bên cạnh nàng.
- Nếu vậy nơi này chính là nơi ở của Vệ Nữ rồi.
- Đúng vậy! Con sẽ ở lại đây cho đến ngày xuất hành đến Nhân Tộc.
Mộc Ang chớp chớp mắt nhìn xung quanh. Vì đây sẽ là nơi nàng ở lại trong mười sáu năm tiếp theo nên hoàn cảnh sống như thế nào nàng phải tìm hiểu thật kỹ. Sân rộng và xung quanh cũng không có lan can nên phía nào cũng là vực sâu. Mộc Ang nghĩ điều quan trọng hơn là những gì phía sau cánh cửa lớn kia. Không phải chờ lâu, họ đã đi đến trước cánh cửa lớn, vài Thần Quân đi đến mở cửa cho họ vào.
Hiện lên sau hai cánh cửa lớn là một sảnh lớn, ở giữa sảnh lớn lại có một bức tượng khác trông cũng sống động không khác gì bức tượng Vệ Nữ ngoài sân kia, chỉ khác là bức tượng này là hình dáng của một chàng trai và toàn bộ là một khối pha lê trong suốt. Trên hành lang là những ô cửa sổ lớn nên ánh sáng bên ngoài lọt vào rất nhiều, chiếu lên pho tượng sáng lấp lánh. Mộc Ang tò mò liền đi một mạch đến trước pho tượng nhìn ngắm. Pho tượng bằng pha lê này lại không có mặc y phục nên từng cơ quan trên cơ thể đều thể hiện rõ, đặc biệt là hoa văn trên khuôn ngực kia giống với vòng tròn mà Vệ Nữ đang giữ trong tay.
- Đây là Đại Đế?
Mộc Ang quay sang hỏi Thần Mẫu khi bà ấy cũng như đang mê mẩn nhìn bức tượng quá đỗi sống động kia. Thần Mẫu lại khẽ gật đầu xác nhận.
- Đây là gì? Ấy... ấy…
Mộc Ang nhanh tay giữ lại một viên đá nhỏ hình cầu có màu đen được đính hời hợt ở tâm đường tròn và rơi ra ngoài ngay khi ngón tay của nàng chạm vào.
- Mật Lệnh! Thứ thuộc về Đại Đế, đang nằm trong Biển Bóng Tối và sẽ sớm tìm cách thoát ra ngoài.
Mộc Ang ngạc nhiên vì điều này nàng chưa được đọc qua trong cuốn sách nào cả.
- Lời Nguyền Huyền Lực của Nhân Tộc là kết hợp của hai thứ đó là Ấn Ký và Mật Lệnh. Khi Ấn Ký thức tỉnh là lúc Đại Đế sẽ đi tìm Mật Lệnh. Khi Mật Lệnh và Ấn Ký hợp nhất là lúc Huyền Lực của Biển Bóng Tối trỗi dậy hoàn toàn, chính lúc đó thế giới này sẽ bị tàn phá. Thần Tộc phải ngăn chặn điều đó xảy ra bằng cách tìm ra Đại Đế khi vẫn còn là một Nhân Tộc và sức mạnh của Ấn Ký mang lại chưa đủ lớn để gây hại cho Thần Tộc.
- Chúng ta phải làm gì để giải trừ đi Ấn Ký này?
- Vệ Nữ không cần lo lắng, chỉ cần con cố gắng tìm ra Đại Đế việc còn lại sẽ có Bát Thần Bộ lo liệu.
- Đại Đế sau đó sẽ ra sao? Hắn cũng chỉ là một cậu bé, Ấn Ký xuất hiện không phải là mong muốn của cậu ấy. Chúng ta sẽ chữa cho cậu ấy như cách mà Thần Tộc chúng ta giúp đỡ các con thú bị thương đúng không?
Thần Mẫu nhìn Mộc Ang, hai đầu mài hơi kéo lại gần nhau một chút rồi lại giãn ra. Người nắm lấy tay Mộc Ang và nói:
- Đúng rồi! Chúng ta sẽ chữa cho cậu ấy. Chỉ là, không thể không để lại chút hậu quả.
- Hậu quả?
- Vì cậu ấy sẽ nhìn thấy sự tồn tại của Thần Tộc nên sau khi giải trừ Ấn Ký cậu ấy sẽ không thể nhớ chuyện gì đã xảy ra với mình nữa.
- Mất đi ký ức sao? Nhưng... như vậy cũng không tệ, Thần Tộc và Nhân Tộc sẽ không phải đấu tranh với nhau nữa, Đại Vân Đình sẽ được bình yên, con sẽ được trở về.
- Đúng vậy!
Đôi mắt của Thần Mẫu như long lanh hơn và tràn đầy hy vọng. Đi mất nửa ngày để tham quan tất cả các gian phòng trong tòa tháp của Vệ Nữ. Đã hơn một vạn năm chưa có ai đặt chân đến nơi này mà chỉ duy nhất một người sẽ đến đây để dọn dẹp và bảo tồn mọi thứ đều ngăn nắp sạch sẽ đó chính là các đời Thần Mẫu. Thần Mẫu đưa Mộc Ang đi qua từng lối đi đã quá quen thuộc với người.
Khi trở lại cổng tòa tháp, Thần Mẫu dặn dò Mộc Ang vài điều trước khi rời đi. Mộc Ang cảm thấy có điều không đúng vì không ai trong số họ có vẻ sẽ ở lại cùng nàng nên liền hỏi:
- Sẽ có người canh gác bên ngoài này chứ? Và con sẽ bắt đầu với việc gì đầu tiên?
Thần Mẫu nhìn qua vai Mộc Ang về phía bức tượng pha lê vẫn đang phản chiếu ánh nắng sáng rực.
- Việc đầu tiên của con sẽ là đọc hết tất cả các quyển sách có trong phòng sách của Vệ Nữ. Trong đó, con sẽ biết được nhiều hơn về thế giới của Nhân Tộc. Con được tự do ở đây, sẽ không có ai làm phiền con hay canh giữ con cả, nơi này là nơi an toàn nhất của Chính Điện. Lần sau sẽ có người đến dạy con võ thuật và cách ẩn đi Thần Lực để không bị lộ tung tích khi ở Nhân Tộc.
- Đọc sách? Chúng ta không thể vừa đọc sách vừa luyện võ à?
- Việc gì ra việc đó! Mọi chuyện đã có cách sắp đặt từ trước rồi con cứ theo đó mà làm.
- Thôi cũng được! Nhưng... bao giờ thì sẽ có người đến? Vài ngày thì được nếu lâu quá thì con không chịu nổi buồn chán khi xung quanh chỉ có hai bức tượng này làm bạn.
- Khu vườn phía sau có rất nhiều cây trái và thú rừng sinh sống, con sẽ không sợ cô đơn đâu. Đúng hạn thì sẽ có người đến gặp con thôi.
- Con có thể biết là khi nào để chuẩn bị tinh thần cho tốt không?
- Mười năm!
Mộc Ang đứng như tượng đá ngay bậc cửa khi nghe Thần Mẫu nói. Nàng không thể tưởng tượng được với thời gian mười năm đó nàng sẽ sống ra sao. Khi bình tĩnh lại một chút thì Thần Mẫu và Thần Quân đã đi sang bờ bên kia của chiếc cầu rồi. Mộc Ang không biết có nên chạy theo để xin người cho nàng không làm Vệ Nữ nữa hay không.',
	1
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Cho Tôi Xin Một Vé Đi Tuổi Thơ',
	0,
	N'Truyện Cho tôi xin một vé đi tuổi thơ là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/cho-toi-mot-ve-di-tuoi-tho.jpg?itok=0RW_HSAW',
	N'Một ngày, tôi chợt nhận thấy cuộc sống thật là buồn chán và tẻ nhạt.
    Năm đó tôi tám tuổi.
    Sau này, tôi cũng nhiều lần thấy cuộc sống đáng chán khi thi trượt ở tuổi mười lăm, thất tình ở tuổi hăm bốn, thất nghiệp ở tuổi ba mươi ba và gặt hái mọi thành công ở tuổi bốn mươi.
    Nhưng tám tuổi có cái buồn chán của tuổi lên tám.
    Đó là cái ngày không hiểu sao tôi lại có ý nghĩ rằng cuộc sống không có gì để mà chờ đợi nữa.
    Rất nhiều năm về sau, tôi được biết các triết gia và các nhà thần học vẫn đang loay hoay đi tìm ý nghĩa của cuộc sống và tới Tết Ma Rốc họ cũng chưa chắc đã tìm ra.
    Nhưng năm tôi tám tuổi, tôi đã thấy cuộc sống chả có gì mới mẻ để khám phá.
    Vẫn ánh mặt trời đó chiếu rọi mỗi ngày. Vẫn bức màn đen đó buông xuống mỗi đêm. Trên mái nhà và trên các cành lá sau vườn, gió vẫn than thở giọng của gió. Chim vẫn hót giọng của chim. Dế ri ri giọng dế, gà quang quác giọng gà. Nói tóm lại, cuộc sống thật là cũ kỹ.
    Cuộc sống của tôi còn cũ kỹ hơn nữa. Mỗi đêm, trước khi đi ngủ, tôi đã biết tỏng ngày mai những sự kiện gì sẽ diễn ra trong cuộc đời tôi.
    Tôi kể ra nhé: Sáng, tôi phải cố hết sức để thức dậy trong khi tôi vẫn còn muốn ngủ tiếp. Tất nhiên là trước đó tôi vẫn giả vờ ngủ mê mặc cho mẹ tôi kêu khản cả giọng rồi lay lay người tôi, nhưng dĩ nhiên tôi vẫn trơ ra như khúc gỗ cho đến khi mẹ tôi cù vào lòng bàn chân tôi. Khi đặt chân xuống đất rồi, tôi phải đi đánh răng rửa mặt, tóm lại là làm vệ sinh buổi sáng trước khi bị ấn vào bàn ăn để uể oải nhai chóp chép một thứ gì đó thường là không hợp khẩu vị. Mẹ tôi luôn luôn quan tâm đến sức khỏe và cụ thể hoá mối quan tâm của mình bằng cách bắt tôi (và cả nhà) ăn những món ăn có nhiều chất dinh dưỡng trong khi tôi chỉ khoái xực những món mà bà cho rằng chẳng bổ béo gì, như mì gói chẳng hạn.
    Quan tâm đến sức khoẻ là điều tốt, và càng lớn tuổi mối quan tâm đó càng tỏ ra đúng đắn. Chẳng ai dám nói quan tâm như vậy là điều không tốt. Tôi cũng thế thôi. Khi tôi trưởng thành, có nhà báo phỏng vấn tôi, rằng giữa sức khoẻ, tình yêu và tiền bạc, ông quan tâm điều gì nhất? Lúc đầu tôi nói nhiều về tình yêu, về sau tôi nói nhiều hơn về sức khoẻ. Tôi phớt lờ tiền bạc, mặc dù tôi nhận thấy đó là một bất công: tiền bạc chưa bao giờ được con con người ta thừa nhận là mối quan tâm hàng đầu dù tiền bạc ngày nào cũng chạy đi mua quà tặng cho tình yêu và thuốc men cho sức khoẻ.
    Nhưng thôi, đó là chuyện của người lớn - chuyện sau này. Còn tôi, lúc tám tuổi, tôi chỉ nhớ là tôi không thích ăn những món bổ dưỡng. Nhưng tất nhiên là tôi vẫn buộc phải ăn, dù là ăn trong miễn cưỡng và lười nhác, và đó là lý dó mẹ tôi luôn than thở về tôi.
    Ăn xong phần ăn buổi sáng (chả sung sướng gì), tôi vội vàng truy lùng sách vở để nhét vào cặp, nhặt lên đầu tivi một quyển, trên đầu tủ lạnh một quyển khác và moi từ dưới đống chăn gối một quyển khác nữa, dĩ nhiên bao giờ cũng thiếu một món gì đó, rồi ba chân bốn cẳng chạy vù ra khỏi nhà.
    Trường gần nhà nên tôi đi bộ, nhưng thực tế thì tôi chưa bao giờ được thưởng thức thú đi bộ tới trường. Tôi toàn phải chạy. Vì tôi luôn luôn dậy trễ, luôn luôn làm vệ sinh trễ, luôn luôn ăn sáng trễ và mất rất nhiều thì giờ để thu gom tập vở cho một buổi học. Về chuyện này, ba tôi bảo: "Con à, hồi bằng tuổi con, bao giờ ba cũng xếp gọn gàng tập vở vào cặp trước khi đi ngủ, như vậy sáng hôm sau chỉ việc ôm cặp ra khỏi nhà!". Nhưng hồi ba tôi bằng tuổi tôi thì tôi đâu có mặt trên cõi đời để kiểm tra những gì ông nói, bởi khi tôi bằng tuổi ba tôi bây giờ chắc chắn tôi cũng sẽ lặp lại với con tôi những điều ông nói với tôi - chuyện xếp tập vở trước khi đi ngủ và hàng đống những chuyện khác nữa, những chuyện mà tôi không hề làm. Chà, với những chuyện như thế này, bạn đừng bao giờ đòi hỏi phải chứng minh. Đôi khi vì một lý do nào đó mà chúng ta buộc phải bịa chuyện. Chúng ta cứ lặp lại mãi câu chuyện bịa đó cho đến một ngày chúng ta không nhớ có thật là chúng ta bịa nó ra hay không, rồi sau đó một thời gian nữa nếu cứ tiếp tục lặp lại câu chuyện đó nhiều lần thì chúng ta sẽ tin là nó có thật. Thậm chí còn hơn cả niềm tin thông thường, đó là niềm tin vô điều kiện, gần như là sự xác tín. Như các nhà toán học tin vào định đề Euclide hay các tín đồ Thiên Chúa tin vào sự sống lại của Jesus.
    Ôi, nhưng đó cũng lại là những vấn đề của người lớn.
    Tôi kể tiếp câu chuyện của tôi hồi tám tuổi.
    Như vậy, ra khỏi nhà một lát thì tôi tới trường.
    Trong lớp tôi luôn luôn ngồi ở bàn chót. Ngồi bàn chót thì tha hồ tán gẫu, cãi cọ, cấu véo hay giở đủ trò nghịch ngợm mà không sợ bị cô giáo phát hiện, nhưng điều hấp dẫn nhất ở vị trí tối tăm đó là ít khi bị kêu lên bảng trả bài.
    Điều đó có quy luật của nó. Bạn nhớ lại đi, có phải bạn có rất nhiều bạn bè, yêu quí rất nhiều người nhưng không phải lúc noà bạn cũng nhớ tới họ. Bộ nhớ chúng ta quá nhỏ để chứa cùng lúc nhiều khuôn mặt hay nhiều cái tên, chỉ khi nào nhìn thấy người đó ngoài phố hay bắt gặp cái tên đó trong một mẩu tin trên báo chẳng hạn thì chúng ta mới chợt nhớ ra và cảm động thốt lên “Ôi, đã lâu lắm mình không gặp nó. Năm ngoái mình kẹt tiền, nó có cho mình vay năm trăm ngàn!”.
    
    Cô giáo của tôi cũng vậy thôi. Làm sao cô có thể nhớ tới tôi và kêu tôi lên bảng trả bài khi mà cô không thể nào nhìn thấy tôi giữa một đống đầu cổ lúc nhúc che chắn trước mặt.
    Ngày nào cũng như ngày nào, tôi ngồi đó, vừa xì xầm trò chuyện vừa cựa quậy lung tung, và mong ngóng tiếng chuông ra chơi đến chết được.
    Trong những năm tháng mà người ta gọi một cách văn hoa là mài đũng quần trên ghế nhà trường (tôi thì nói thẳng là bị giam cầm trong lớp học), tôi chẳng thích được giờ nào cả, từ giờ toán, giờ tập viết đến giờ tập đọc, giờ chính tả. Tôi chỉ thích mỗi giờ ra chơi.
    Ra chơi có lẽ là điều tuyệt vời nhất mà người lớn có thể nghĩ ra cho trẻ con. Ra chơi có nghĩa là những lời vàng ngọc của thầy cô tuột khỏi trí nhớ nhanh như gió, hết sức trơn tru. Ra chơi có nghĩa là được tháo cũi sổ lồng (tất nhiên sau đó phải bấm bụng chu vào lại), là được tha hồ hít thở không khí tự do.
    Suốt những năm đi học, tôi và lũ bạn đã sử dụng những khoảng khắc tự do hiếm hoi đó vào việc đá bóng, bắn bi, nhưng thường xuyên nhất và hăng hái nhấ là những trò rượt đuổi, đánh nhau hay vật nhau xuống đất cho đến khi không đứa nào còn ra hình thù một học sinh ngoan ngoãn nữa mới thôi, tức là lúc khuỷu tay đã trầy xước, mắt đã bầm tím, chân đi cà nhắc và áo quần thì trông còn tệ hơn mớ giẻ lau nhà.
    Tại sao tôi không kể giờ ra về vào đây. Vì ra về có nghĩa là rời khỏi một nhà giam này để đến một nhà giam khác, y như người ta chuyển trại cho các tù nhân, có gì hay ho đâu.
    Tôi không nói quá lên đâu, vì ngày nào chào đón tôi ở đầu ngõ cũng là khuôn mặt lo lắng của mẹ tôi và khuôn mặt hầm hầm của ba tôi.
    - Trời ơi, sao ngày nào cũng ra nông nỗi này thế hả con?
    Đại khái mẹ tôi nói thế, giọng thảng thốt, vừa nói vừa nắn nót cánh tay rướm máu của tôi như để xem nó sắp rụng khỏi người tôi chưa.
    Ba tôi thì có cách nói khác, rất gần với cách rồng phun lửa:
    - Mày lại đánh nhau rồi phải không?
    - Con không đánh nhau. Tụi bạn đánh con và con đánh lại.
    Tôi nói dối (mặc dù nói dối như thế còn thật hơn là nói thật) và khi ba tôi tiến về phía tôi với dáng điệu của một cơn bão cấp mười tiến vào đất liền thì mẹ tôi đã kịp kéo tôi ra xa:
    - Ông ơi, con nó đã nát nhừ ra rồi!
    Mẹ tôi có cách nói cường điệu rất giống tôi, tôi vừa chạy theo bà vừa cười thầm về điều đó.
    Sau đó, không nói thì ai cũng biết là tôi bị mẹ tôi tống vào nhà tắm. Khi tôi đã tinh tươm và thơm phức như một ổ bánh mì mới ra lò thì mẹ tôi bắt đầu bôi lên người tôi đủ thứ thuốc xanh xanh đỏ đỏ khiến tôi chẳng mấy chốc đã rất giống một con tắc kè bông.
    Dĩ nhiên là từ đó cho tới bữa cơm, tôi không được phép bước ra khỏi nhà để tránh phải sa vào những trò đánh nhau khác hấp dẫn không kém với bọn nhóc trong xóm, những đối thủ thay thế hết sức xứng đáng cho tụi bạn ở trường.
    Ăn trưa xong thì tôi làm gì vào thời tôi tám tuổi?
    Đi ngủ trưa!
    Trên thế giới rộng lớn này, có lẽ có rất nhiều đứa nhóc trạc tuổi tôi đều bị các bậc phụ huynh cột chặt vào giấc ngủ trưa theo cái cách người ta cột bò vào cọc để chúng khỏi chạy lung tung mà hậu quả là thế nào hàng xóm cũng kéo đến nhà chửi bới om sòm.
    Chứ thực ra với một đứa bé tám tuổi thì giấc ngủ trưa chẳng có giá trị gì về mặt sức khoẻ. Khi tôi lớn lên thì tôi phải công nhận giấc ngủ trưa đối với một người lớn tuổi đúng là quý hơn vàng. Lớn tuổi thì sức khoẻ suy giảm. Làm việc nhiều thì đầu nhức, mắt mờ, lưng mỏi, tay run, giấc ngủ ban đêm vẫn chưa đủ liều để sửa chữa thành công những chỗ hỏng hóc của cơ thể. Buổi trưa phải chợp mắt thêm một lát thì buổi chiều mới đủ tỉnh táo mà không nện búa vào tay hay hụt chân khi bước xuống cầu thang.
    
    Nhưng nếu bạn sống trên đời mới có tám năm thì bạn không có lý do chính đáng để coi trọng giấc ngủ trưa. Với những dân tộc không có thói quen ngủ trưa, như dân Mỹ chẳng hạn, trẻ con càng không tìm thấy chút xíu ý nghĩa nào trong việc phải leo lên giường sau giờ cơm trưa.
    Hồi tôi tám tuổi dĩ nhiên tôi không có được cái nhìn thông thái như thế. Nhưng tôi cũng lờ mờ nhận ra khi ba tôi đi ngủ thì bôi buộc phải đi ngủ, giống như một con cừu còn thức thì người chăn cừu không yên tâm chợp mắt vậy.
    Tôi nằm cựa quậy bên cạnh ông trên chiếc đi-văng, thở dài thườn thượt khi nghĩ đến những quả đấm mà lũ bạn nghịch ngợm đang vung lên ngoài kia.
    - Đừng cựa quậy! Cựa quậy hoài thì sẽ không ngủ được!
    Ba tôi nói, và tôi vờ nghe lời ông. Tôi không cựa quậy nhưng mắt vẫn mở thao láo.
    - Đừng mở mắt! Mở mắt hoài thì sẽ không ngủ được!
    Ba tôi lại nói, ông vẫn nằm ngay ngắn nên tôi nghĩ là ông không nhìn thấy tôi mở mắt, ông chỉ đoán thế thôi. Chẳng may cho tôi là lần nào ông cũng đoán đúng.
    Tôi nhắm mắt lại, lim dim thôi, mi mắt vẫn còn hấp háy, nhưng tôi không thể nào bắt mi mắt tôi đừng hấp háy được.
    Một lát, ba tôi hỏi:
    - Con ngủ rồi phải không?
    - Dạ rồi.
    Tôi đáp, ngây ngô và ngoan ngoãn, rơi vào bẫy của ba tôi một cách dễ dàng.
    Tôi nằm như vậy, thao thức một lát, tủi thân và sầu muộn, rồi thiếp đi lúc nào không hay.
    Khi tôi thức dậy thì đường đời của tôi đã được vạch sẵn rồi. Tôi đi từ giường ngủ đến phòng tắm để rửa mặt rồi từ phòng tắm đi thăng tới bàn học để làm một công việc chán ngắt là học bài hoặc làm bài tập.
    Thỉnh thoảng tôi cũng đựoc phép chạo ra đằng trước nhà chơi với lũ trẻ hàng xóm nhưng trước ánh mắt giám sát của mẹ tôi (từ một vị trí bí hiểm nào đó đằng sau các ô cửa mà mãi mãi tôi không khám phá được), tôi chỉ dám chơi những trò ẻo lả như nhảy lò cò hay bịt mắt bắt dê, đại khái là những trò dành cho bọn con gái hay khóc nhè. (Về sau, tinh khôn hơn, tôi đã biết cách ỉ ôi để mẹ tôi thả tôi qua nhà hàng xóm, nhờ đó một thời gian dài tôi đã có cơ hội làm những gì tôi thích).
    Chơi một lát, tôi lại phải vào ngồi ê a tụng bài tiếp, càng tụng càng quên, nhưng vẫn cứ tụng cho mẹ yên lòng đi nấu cơm.
    Từ giây phút này trở đi thì đời sống của tôi tẻ nhạt vô bờ bến.
    Tôi uể oải học bài trong khi chờ cơm chín. Cơm chín rồi thì tôi uể oải ăn cơm trong khi chờ tiếp tục học bài.
    Tivi tiveo hiếm khi tôi mó thay vào được, trông nó cứ như một thứ để trang trí. Bao giờ cũng vậy, tôi chỉ được rời khỏi bàn học khi nào tôi đã thuộc tất cả bài vở của ngày hôm sau.
    Ba tôi là người trực tiếp kiểm tra điều đó. Khác với mẹ tôi, ba tôi là người kiên quyết đến mức tôi có thể cảm tưởng ông sẽ thăng tiến vùn vụt nếu vô ngành cảnh sát, toà án hay thuế vụ. Ông không bao giờ lùi bước trước những giọt nước mắt của tôi, dù lúc đó trông tôi rất giống một kẻ sầu đời đến mức chỉ cách cái chết có một bước chân.
    - Con học bài xong rồi ba. - Thường thì tôi mở miệng trước.
    Ba tôi tiến lại và nhìn tôi bằng ánh mắt nghi ngờ:
    - Chắc không con?
    - Dạ, chắc!
    Tôi mau mắn đáp và khi ba tôi bắt đầu dò bài thì tôi lập tức phủ nhận sạch trơn sự quả quyết của mình bằng cách ngắc ngứ ngay ở chỗ mà tôi nghĩ dù có va đầu phải gốc cây tôi cũng không thể nào quên được.
    - Học lại lần nữa đi con!
    Ba tôi nhún vai nói và quay đi với tờ báo vẫn cầm chặt trên tay, rõ ràng ông muốn gửi đến tôi thông điệp rằng ông sãn sàng chờ đợi tôi cho dù ông buộc phải đọc tới mẩu rao vặt cuối cùng khi không còn gì để mà đọc nữa.
    Qua cái cách ông vung vẩy tờ báo trên tay, tôi e rằng ẩn ý của ông còn đi xa hơn: có vẻ như nếu cần, ông sẽ bắt đầu đọc lại tờ báo đến lần thứ hai và hơn thế nữa. Nghĩ vậy, tôi đành vùi đầu vào những con chữ mà lúc này đối với tôi đã như những kẻ tử thù, tâm trạng đó càng khiến tôi khó mà ghi nhớ chúng vô đầu óc.
    Cho nên các bạn cũng có thể đoán ra khi tôi đã thuộc tàm tạm, nghĩa là không trôi chảy lắm thì cơ thể tôi đã bị giấc ngủ đánh gục một cách không thương tiếc và thường thì tôi lết vào giường bằng những bước chân xiêu vẹo, nửa tỉnh nửa mê trước ánh mắt xót xa của mẹ tôi.
    Như vậy, tóm lại là đã hết một ngày.
	BỐ MẸ TUYỆT VỜI

    Bây giờ thì các bạn đã hình dung ra một ngày của tôi.
    Tôi chỉ cần kể một ngày là đủ, không cần phải kể thêm những ngày khác.
    Đơn giản là ngày nào cũng giống như ngày nào. Một ngày như mọi ngày, như người ta vẫn nói.
    Và vì thế cuộc sống đối với tôi thật là đơn điệu, nếu sự lặp đi lặp lại là biểu hiện chính xác nhất và rõ rệt nhất của sự đơn điệu.
    Mãi về sau này, tôi mới khám phá ra còn có cách nhìn khác về sự lặp đi lặp lại. Người ta gọi nó là sự ổn định.
    Một công việc có thể sắp đặt trước, một sự nghiệp có thể tính toán trước, là niềm ao ước của rất nhiều người, nhiều quốc gia.
    Tất nhiên sẽ thật là hay nếu tiên liệu được chỉ số tăng trưởng kinh tế của một đất nước nhưng nếu bạn cũng tiên liệu chính xác như thế về chỉ số tăng trưởng tình cảm của bản thân thì điều đó có khi lại chán ngắt. Sẽ thật kỳ cục nếu như bạn tin chắc rằng một tháng nữa bạn sẽ bắt đầu yêu, ba tháng sau bạn sẽ đang yêu – ít thôi, sáu tháng sau bạn sẽ yêu nhiều hơn...
    Tôi từng thấy có nhiều người trẻ tuổi lên kế hoạch cho cuộc đời mình: 22 tuổi tốt nghiệp đại học, 25 tuổi lập gia đình, 27 tuổi mở công ty, 30 tuổi sinh con đầu lòng, vân vân và vân vân... Thật sít sao! Nhưng một khi cuộc đời một con người được lập trình chặt chẽ và khoa học đến thế thì nếu tất cả đều vào khuôn như dự tính liệu bạn có bão hoà về cảm xúc hay không?
    Khi nói về cảm xúc có lẽ không thể không gắn nó với tính cách của từng người. Người lạc quan bảo rằng ổn định cái điều mà người bi quan cho là đơn điệu. Cuộc sống vợ chồng cũng thế thôi, kẻ thì bảo êm đềm, người thì cho vô vị, biết làm thế nào! Quả thật, hai vợ chồng mà sống với nhau êm đềm quá không khéo lại giống sự êm đềm giữa hai người hàng xóm lành tính, và người quá khích lại có dịp bô bô lên rằng êm đềm không hề bà con gì với hạnh phúc, biết nói làm sao!
    Nhưng ôi thôi, tôi lại nói chuyện lúc tôi đã là người lớn mất rồi. Lại nói chuyện vợ chồng cấm kỵ vô đây nữa!
    Tôi sẽ quay lại chủ đề của cuốn sách này, quay lại ngay đây, tức là nói cái chuyện tôi hồi tám tuổi.
    Chuyện tôi sắp kể ra đây, khổ thay, cũng lại liên quan đến chuyện vợ chồng. Nhưng bên cạnh cái khổ cũng có cái may, đây chỉ là trò chơi vợ chồng thôi – cái trò mà đứa trẻ nào bằng tuổi tôi cũng rất thích chơi mặc dù khi lớn lên thì chúng rất dè chừng.
    Tôi và con Tí sún cạnh nhà tôi là một cặp.
    Tôi là chồng, con Tí sún là vợ.
    Con Tí sún không đẹp đẽ gì, người đen nhẻm, tóc xoăn tít vì suốt ngày chạy nhảy ngoài nắng, đã thế lại sún răng.
    Nhưng tôi sẵn sàng chấp nhận nó làm vợ tôi, chỉ vì nó thích tôi, tôi bảo gì nó cũng nghe răm rắp. Thật lòng, tôi thích con Tủn hơn, vì con Tủn xinh gái nhất xóm, lại có lúm đồng tiền. Nhưng tôi không cưới con Tủn bởi tôi thấy nó cứ hay cặp kè với thằng Hải cò. Sau này tôi biết đó là cảm giác ghen tuông, tất nhiên là ghen tuông theo kiểu trẻ con, còn lúc đó tôi chỉ cảm thấy khó chịu thôi.
    Và tôi đùng đùng cưới con Tí sún, theo kiểu người lớn hay nói: cưới người yêu mình chứ không cưới người mình yêu, nhất là khi người mình yêu không có vẻ gì là yêu mình!
    Tôi cưới con Tí sún chừng năm phút thì lập tức đẻ liền một lúc hai đứa con: thằng Hải cò và con Tủn. Ghét hai đứa nó thì bắt chúng làm con vậy thôi, chứ thằng Hải cò lớn hơn tôi một tuổi.
    - Hải cò đâu?- Tôi kêu lớn.
    - Dạ, ba gọi con. - Hải cò lon ton chạy tới.
    Tôi ra oai:
    - Rót cho ba miếng nước!
    Thấy con Tủn che miệng cười khúc khích, Hải cò đâm bướng:
    - Con đang học bài.
    - Giờ này mà học bài hả? – Tôi quát ầm - Đồ lêu lổng!
    Hải cò đưa tay ngoáy lỗ tai để nghe cho rõ:
    - Học bài là lêu lổng?
    - Chứ gì nữa! Không học bài làm bài gì hết! Con ngoan là phải chạy nhảy, trèo cây, tắm sông, đánh lộn!
    Hải cò không ngờ vớ được một ông bố điên điên như thế, cười toét miệng:
    - Vậy con đi đánh lộn đây!
    Nói xong, nó co giò chạy mất.
    Nhưng tôi không giận nó. Tôi đang khoái chí. Tôi tình cờ phát hiện ra cách làm cho cuộc sống bớt tẻ nhạt.
    - Tủn! – Tôi hét.
    - Dạ. Rót nước hả ba?
    Tôi cười khảy:
    - Mày đừng làm ra vẻ ta đây thông minh. Tao hết khát rồi.
    Tôi nói như trút giận:
    - Tao là đứa chúa ghét mấy đứa con nít thông minh, tức là mấy đứa học ài nhoáng một cái đã thuộc vanh vách! Hừm, làm như hay lắm!
    Con Tủn không biết tôi muốn gì. Thấy tôi quát sùi bọt mép, nó sợ run:
    - Dạ, con không thông minh. Con là đứa ngu đần.
    Tôi hả hê:
    - Vậy con mới đúng là con ngoan của ba.
    Tôi móc túi lấy ra một cây kẹo bé tẹo còn sót lại từ hôm qua:
    - Đây, ba thưởng cho con.
    Con Tủn ngơ ngác cầm lấy cây kẹo, không hiểu tại sao ngu mà được thưởng nên không dám ăn.
    Tôi đang tính bảo con Tủn “Ăn đi con” thì thằng Hải cò từ bên ngoài xồng xộc chạy vô, miệng thở hổn hển, làm như vừa đánh nhau thật.
    - Con đi đánh lộn về đó hả con? – Tôi âu yếm hỏi.
    - Dạ. - Hải cò phấn khởi – Con uýnh một lúc mười đứa luôn đó ba!
    - Con thiệt là ngoan. – Tôi khen, và đưa mắt nhìn Hải cò từ đầu tới chân - Thế quần áo của con...
    - Vẫn không sao ba à. - Hải cò hớn hở khoe – Con đập nhau với tụi nó mà quần áo vẫn lành lặn, thẳng thớm...
    - Đồ khốn! – Tôi quát lớn, không cho Hải cò nói hết câu – Đánh nhau mà không rách áo, trầy chân, bầm mặt mà cũng gọi là đánh nhau hả?
    Sự giận dữ bất ngờ của tôi làm Hải cò nghệt mặt một lúc. Nó chẳng biết phản ứng thế nào ngoài việc ấp a ấp úng:
    - Dạ... dạ... ủa... ủa...
    - Dạ dạ ủa ủa cái gì! Con thiệt là đứa hư hỏng! Con làm ba xấu hổ đến chết mất thôi!
    Con Tí sún, vợ tôi, bắt đầu cảm thấy hoang mang trước lối dạy con của tôi:
    - Ông à, con nó biết giữ gìn như thế là tốt rồi.
    - Bà thì biết cái gì! – Tôi nạt con Tí sún, nước miếng bay vèo vèo may mà không trúng mặt nó – Đánh nhau chứ có phải đi dự tiệc đâu! Đánh nhau mà quần áo sạch sẽ thế kia thì có nhục cho tổ tiên không kia chứ!
    Tôi đấm ngực binh binh:
    - Ôi, chẳng thà nó chém tôi một dao cho rồi! Con ơi là con! Mày ra đây mà giết ba đi này con!
    Thấy tôi tru tréo ghê quá, con Tí sún nín khe.
    Trong khi thằng Hải cò cười hí hí thì con Tủn mặt đực ra như bị thằn lằn ị trúng mặt. Nó không biết làm gì với cây kẹo trên tay, rằng nên nhét vào túi áo hay bỏ vào miệng. Trông mặt nó hết sức lo lắng, có lẽ vì nó hoàn toàn không biết được hành động nào mới không bị ông bố gàn dở kia liệt vào loại “hư hỏng” hay tệ hơn, là “làm nhục tổ tiên”.
    ***
    Tụi bạn tôi chỉ ngạc nhiên hôm đầu tiên. Rồi như bất cứ một đứa trẻ chân chính nào, tụi nó nhanh chóng cảm nhận được sự thú vị của trò chơi tuyệt vời đó.
    Hôm sau đến lượt thằng Hải cò và con Tủn đóng vai ba mẹ. Tôi và con Tí sún làm con.
    Tối hôm trước Hải cò chắc thao thức suốt đêm, chờ trời sáng. Sáng ra tôi thấy mắt nó đỏ kè. Nếu hôm đó không phải là ngày chủ nhật, có lẽ Hải cò sẽ bị sự nôn nóng đốt thành than trước khi cả bọn đi học về.
    - Thằng cu Mùi đâu? - Hải cò oang oang, giọng rất chi là hào hứng.
    Cu Mùi là tên ở nhà của tôi. Ba mẹ tôi gọi tôi như thế có lẽ do tôi sinh năm Mùi.
    - Dạ. – Tôi ứng tiếng thưa.
    - Con đem tập vở ra đây cho ba xem nào.
    Tôi lôi cuốn tập nhét trong lưng quần, hồi hộp đưa cho Hải cò, bụng cố đoán xem nó định “dạy dỗ”tôi như thế nào.
    Lật lật vài trang, Hải cò hét ầm:
    - Cu Mùi!
    Tôi lấm lét nhìn nó:
    - Dạ.
    Hải cò đập tay xuống bàn một cái rầm:
    - Con học hành cách sao mà tập vở trắng tinh như thế hả?
    Tôi chưa kịp đáp, nó thẳng tay ném cuốn tập qua cửa sổ, gầm gừ:
    - Học với chả hành! Mày giữ gìn tập vở sạch sẽ như thế này mày không sợ thầy cô bảo ba mẹ mày không biết dạy con hả, thằng kia?
    Tôi bị mắng như tát nước vào mặt mà ruột nở từng khúc. Tôi không ngờ Hải cò là một ông bố tuyệt vời đến thế.
    Tôi hân hoan nhận lỗi:
    - Thưa ba, lần này con trót dại. Lần sau con không dám giữ gìn tập vở kỹ lưỡng như vậy nữa.
    Tôi nói, và đảo mắt nhìn quanh, thấy đằng góc nhà con Tủn và con Tí sún đưa tay bụm miệng cố nén cười.
    - Cái con nhóc sún răng kia! Cười cái gì! - Hải cò lừ mắt nhìn con Tí sún – Mày nấu cơm xong chưa mà đứng đó nhe răng sún ra cười hả?
    Con Tí sún lễ phép:
    - Dạ, con đã dọn cơm rồi. Mời ba mẹ và anh Hai ăn cơm.
    - Mày có điên không vậy con! - Hải cò giơ hai tay lên trời - Đến giờ cơm là ngồi vô ăn, chỉ có kẻ không được giáo dục đến nơi đến chốn mới làm như vậy, hiểu chưa?
    - - Dạ, chưa hiểu. – Con Tí sún thật thà - Chứ kẻ có giáo dục thì đến giờ cơm họ làm gì hả ba?
    - Họ đi chơi chứ làm gì. - Hải cò khoa tay như một diễn giả - Họ đi bơi, họ chơi bi-da, họ câu cá, họ chơi rượt bắt hoặc đánh nhau, nói chung họ có thể làm bất cứ chuyện gì để người khác phải đợi cơm, trừ cái chuỵên hết sứ vô văn hoá là ngồi vô bàn ăn.
    Con Tủn tỉnh bơ đế vô:
    - Ba con nói đúng đó con. Chỉ có bọn hư hỏng mới ăn cơm đúng giờ thôi!
    ***
    Lúc đầu, tôi tưởng chỉ có mình tôi khoái cái trò điên điên này. Hoá ra đứa nào cũng khoái. Trong bọn, con Tí sún là đứa hiền lành và chậm chạp nhất nhưng qua đến ngày thứ 3, nó cũng kịp thích ứng với hoàn cảnh bằng cách chỉnh thẳng Hải cò ra trận khi tới lượt nó làm mẹ.
    2 lần 4 là mấy?
    - Dạ, là 8.
    Con Tí sún không quát tháo om sòm như tôi và Hải cò, nhưng mặt nó trông thật thiểu não:
    - Sao lại là 8 hả con? Thật uổng công mẹ cho con ăn học!
    Hải cò chớp mắt:
    - Chứ là mấy?
    - Là mấy cũng được nhưng không phải là 8.
    - Mẹ ơi, theo bản cửu chương thì 2 lần 4 là 8.
    - Mày là con vẹt hả? Bản cửu chương bảo gì mày nghe nấy là sao? Thế mày không có cái đầu à?
    Hải cò sờ tay lên đầu, hối hận:
    - Con đúng là một đứa không có đầu óc. Lần sau con sẽ không nghe theo bất cứ ai nữa, dù đó là bản cửu chương hay thầy cô giáo. Con hứa với mẹ con sẽ tự suy cái đầu của con.
    Câu nói của Hải cò được coi như tuyên bố chung của cả bọn, kết thúc một thời kỳ tăm tối chỉ biết sống dựa vào sự bảo ban của người khác. Ôi, cuộc sống kể từ lúc đó mới thật đáng sống làm sao!
    Nhưng như người ta thường nói “niềm vui ngắn chẳng tày gang”: vào cái ngày Hải cò mang bộ mặt ủ ê đến gặp tôi, chúng tôi chợt nhận ra cuộc sống vẫn xám xịt như thể xưa nay một năm vẫncó tới bốn mùa đông.
    - Mày sao thế? Mới bị ăn đòn à? – Tôi tò mò hỏi.
    - Ừ. Vì cái tội dám bảo chỉ có đứa đần độn mới giữ gìn tập vở sạch sẽ.
    Con Tí sún xuất hiện với bộ mặt thảm sầu:
    - Còn mình bị ba mình phạt vì khăng khăng 3 lần 5 không phải là 15.
    Con Tủn góp vào hai hàng nước mắt và tiếng thút thít:
    - Còn mình thì mặc cho ba mẹ kêu khản cả cổ, mình nhất định không chạy về ăn trưa.
    Tôi lướt mắt nhìn ba đứa bạn, lặng lẽ thở dài.
    Tôi tập tành làm nhà cách mạng bé con, chán nản khi không thay đổi được thế giới, đã thế còn làm vạ lây cho người khác.
    Cho nên tôi không ủ ê, không thảm sầu, không thút thít và rưng rưng hai hàng nước mắt.
    Nỗi đau của tôi lặn vào bên trong. Nó sâu sắc hơn, ít nhất là bằng nỗi đau của ba đứa bạn cộng lại.
    Vì ngày hôm qua tôi bị ăn đòn vì phạm cùng lúc cả ba tội trên kia.',
	1
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Kính Vạn Hoa',
	0,
	N'Đọc Kính Vạn Hoa, tôi cảm ơn Nguyễn Nhật Ánh đã dày công phản ánh những sinh hoạt muôn mặt của lứa tuổi học trò. Từ cách học với các thủ thuật “phổ thơ” để ghi nhớ thuộc lòng các công thức Toán, Lý, Hóa, Anh văn… đến lối làm thơ, kể vè, dựng hoạt cảnh để học tập các môn Văn, Sử. Từ trò chơi bóng đá, thi giải câu đố… ở sân trường đến những chuyến đi nghỉ hè khám phá các vùng xa. Từ việc tìm hiểu (và yêu mến) những người thân trong gia đình, thầy cô giáo đến việc làm quen với những bà con lao động đủ các nghề nghiệp: bán hàng rong, hốt rác, diễn thế thân (cascadeur), đạo diễn điện ảnh, nghệ sĩ ngôi sao, cầu thủ siêu hạng… Một độc giả - Võ Hồng Quân lớp 10C3, PTTH chuyên Hà Nam đã đưa Kính Vạn Hoa vào “Kho vàng kiến thức”, tôi muốn gọi Kính Vạn Hoa là một bộ “Tiểu bách khoa cho thiếu nhi”. (Nhà văn Văn Hồng - Nguyên Tổng biên tập NXB Kim Đồng)',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/kinh-van-hoa-nguyen-nhat-anh-1.jpg?itok=44DnJhil',
	N'Tháng tư bao giờ cũng bắt đầu bằng những ngày oi bức khó chịu. Hằng năm, vào mùa này mọi cư dân trong thành phố thường trằn trọc khó ngủ. Dù nhà mở toang cửa sổ, suốt đêm cũng chỉ đón được dăm ba làn gió nhẹ thoảng qua và cứ đến gần sáng là mọi người thiếp đi trong giấc ngủ mê mệt. 

Quý ròm dĩ nhiên không thể là một ngoại lệ, nhất là tối hôm qua nó thức khuya lơ khuya lắc ráng đọc cho xong cuốn "Toán học ứng dụng trong đời sống" mà nó vừa mua được chiều hôm trước. 

Như thường lệ, đúng sáu giờ rưỡi sáng, chuông báo thức đổ hồi. Nhưng Quý ròm không buồn nhỏm dậy. Nó cựa quậy và lăn một vòng trên giường trong khi mắt vẫn nhắm tịt. 

Ðang mơ mơ màng màng, Quý ròm cảm thấy có ai đó đang nắm lấy chân nó. Rồi tiếng bà gọi khẽ: 

- Nào, dậy đi cháu! 

Quý ròm không trả lời, thậm chí không cả nhúc nhích. Tất nhiên nó không dại gì hé môi để bà biết là nó đã thức. 

- Dậy đi! Cháu cứ nằm ườn ra như thế này không khéo trễ học mất! 

Lần này không chỉ lay, bà còn cù vào cả lòng bàn chân nó. 

Quý ròm lim dim mắt, cố chịu đựng. Nhưng cuối cùng nhột quá, nó đành phải thét lên: 

- Bà ơi, để yên cho cháu ngủ! Hôm nay cháu được nghỉ học! 

- Hôm nay là thứ tư kia mà! 

- Nhưng trường cháu đóng cửa một tuần. Vì thế chúng cháu được nghỉ. 

Bà tỏ vẻ ngạc nhiên: 

- Sao trường cháu cho nghỉ lâu thế? Ðã đến hè đâu? 

Quý ròm quên mất ý định ngủ nán ban đầu. Nó ngồi bật dậy, vung tay hăm hở giải thích: 

- Cái nhà máy quỷ quái kế bên trường cháu mấy hôm nay cứ nhả khói thải sang. Tụi học trò ho rũ rượi. Thế là nhà trường phải đóng cửa, chờ cho nhà máy dời đi! 

- Thế bao giờ họ mới dời đi? - Bà hỏi, giọng quan tâm. 

- Cháu cũng chẳng biết! - Quý ròm nhún vai hệt người lớn - Hiện nay ban giám hiệu nhà trường đang kiện lên thành phố, chắc ít hôm nữa là họ phải dời đi thôi. 

Nói xong, thấy bà trầm ngâm nghĩ ngợi, Quý ròm sè sẹ ngả lưng xuống giường. Nhưng bà đã kịp nhìn thấy. Bà đập lên chân nó nói:

- Dậy đi cháu! Dù có không đi học thì cũng phải dậy sớm! Cháu không chịu tập thể dục, người cứ còm nhom thế kia! 

Biết không thể nằm lì mãi được, Quý ròm đành leo ra khỏi giường. Nó vừa đi ra cửa vừa làu bàu: 

- Chính phải cứ dậy sớm như thế này cháu mới còm nhom đấy! Cứ để cho cháu ngủ sướng mắt, chẳng mấy chốc cháu sẽ to đùng như thằng Tiểu Long cho bà xem! 

- Này, này, cháu đừng có nói lếu láo như thế chứ! - Bà gọi vói theo, vẻ phật ý - Thằng Tiểu Long to khỏe thế kia, chắc chắn nó phải là đứa siêng năng dậy sớm và ham tập thể dục hơn cháu nhiều! 

Tới đây thì Quý ròm làm thinh. Thoạt đầu nó định bảo với bà là thằng Tiểu Long cũng ham cái trò nướng trên giường không thua gì nó, sáng nào cũng đợi hai ông anh mỗi người nắm một bên tai xách lên mới chịu lồm cồm bò dậy nhưng cuối cùng cảm thấy bịa chuyện nói xấu bạn để bào chữa cho mình là một hành động chẳng hay ho gì, nó bèn tặc lưỡi lặng lẽ bỏ đi. 

Lúc Quý ròm lò dò ra tới phòng ngoài, bốn bề đã vắng tanh. Mọi người đã rời khỏi nhà từ lâu. 

Ba đi dạy. Mẹ đến cửa hàng. Anh Vũ và nhỏ Diệp đi học. Nhỏ Diệp học ở trường Họa Mi, chỗ ba dạy. Lúc này, trong căn nhà trống trải này chỉ còn bà với nó. 

Sự tĩnh lặng khác thường đem lại cho Quý ròm một cảm giác thích thú khó tả. Nó cảm thấy mọi vật chung quanh đột nhiên trở nên lạ lẫm và mới mẻ như thể trước nay chúng vẫn mang một bộ mặt giả và bây giờ thì chúng mới chịu phô bộ mặt thật ra. 

Quý ròm đi lui đi tới, nghiêng ngó một hồi rồi sực nhớ ra một việc quan trọng, liền vội vã chui tọt và phòng học riêng của mình.

Sáng nay, Quý ròm cần phải bắt tay vào thí nghiệm một trò chơi mới: trò phun nước kỳ bí. Nước khi ở bầu bên này thì có màu đỏ, khi phun qua bầu bên kia lại biến thành màu xanh. Trò này mà đem ra biểu diễn, tụi bạn sẽ lác mắt! Quý ròm nhủ bụng và lui cui lôi hai chai bầu trên giá xuống. 

Các chất hỗn hợp amôni clorua và natri huđrôxyt dùng cho cuộc thí nghiệm, Quý ròm đã kiếm được từ lâu. Riêng hai chai bầu thì cho đến sáng hôm qua nó mới mượn được trong phòng thí nghiệm của nhà trường. Là một học sinh cực kỳ xuất sắc về các môn khoa học tự nhiên, là niềm tự hào của nhà trường trong các kỳ thi toán, lý, hóa toàn thành, Quý ròm thường được các thầy cô cho hưởng những biệt lệ, chẳng hạn được mượn đem về nhà một số dụng cụ nhất định trong phòng thí nghiệm để tiến hành những "nghiên cứu khoa học" có tính chất cá nhân. Tất nhiên, vì những cuộc thí nghiệm bên ngoài khuôn viên nhà trường là những cuộc thí nghiệm không thể kiểm soát được, Quý ròm thường xuyên nhận được những lời khuyến cáo. Thật ra các thầy cô chỉ lưu ý nó không nên sử dụng những hoá chất nguy hiểm, đặc biệt là lân tinh, còn thì chẳng ai cấm cản hay ngăn trở gì những trò tọc mạch của nó. 

Nếu có kẻ ngăn cản thì đó là người khác. Cái người khác đó lúc này đang thò đầu vào phòng đảo mắt nhìn lướt qua đống chai lọ nó đang bày lỉnh kỉnh trên nền nhà, tặc tặc lưỡi: 

- Cháu lại bày trò gì nữa đấy? 

Nghe tiếng bà, Quý ròm chột dạ ngẩng lên: 

- Dạ, cháu đang làm thí nghiệm khoa học bà ạ! 

Quý ròm cố tình nhấn mạnh bốn chữ "thí nghiệm khoa học" để mong bà thấy được tầm quan trọng của công việc nó đang làm mà đừng can thiệp. 

Nhưng bà chẳng rơi vào bẫy của nó. Bà nghiêm mặt: 

- Những chuyện này sao cháu không đem vào trường mà làm? Ở trường cháu hẳn có chỗ để cháu làm những chuyện này chứ? 

- Tất nhiên là có! - Quý ròm khụt khịt mũi - Nhưng đây không phải là bài học... 

- Ra là thế! - Bà gật gù - Thì ra vẫn là những trò nghịch phá! 

Bà làm Quý ròm tự ái quá chừng. Nó gân cổ: 

- Ðây không phải là trò nghịch phá bà ạ! Cháu chỉ làm thí nghiệm khoa học thôi! 

Bà hừ giọng: 

- Cháu còn chống chế nữa hả? Thế cháu không nhớ có lần cháu suýt làm nổ sập nhà với những trò táy máy này của cháy hay sao? 

Nghe bà nhắc chuyện cũ, Quý ròm chỉ biết nhăn nhó thở dài. Lần ó, nó định nghiên cứu chế tạo một loại súng đại bác cực mạnh với bột natri cacbônat và dấm chua. Mải say sưa với công việc, Quý ròm lơ đãng để nòng "đại bác" chĩa ngay vào tấm kính mỏng ngăn giữa phòng học với phòng ăn. Khi tiếng nổ phát ra, chiếc nút bị áp suất khí đẩy văng ra khỏi ống thủy tinh, bắn thẳng vào tấm kính đang được gắn một cách lỏng lẻo trên vách kia khiến nó rớt xuống nền nhà vỡ loảng xoảng. 

Lúc đó là buổi chiều, ngoài nó ra chỉ có bà và nhỏ Diệp ở nhà. Ðang rửa rau đằng sau bếp, nghe trong nhà có tiếng nổ và tiếng kính vỡ, bà hốt hoảng ném đại rổ rau xuống đất, ba chân bốn cẳng chạy vụt vào, mặt mày xanh lè xanh lét. 

Bà bắt gặp nhỏ Diệp đang ngồi co rúm trên bàn ăn, hai tay ôm chặt lấy đầu, bà càng hốt hoảng. 

- Cái gì vậy? Cái gì vậy? - Bà ôm lấy nhỏ Diệp, hớt hải kêu. 

Và khi thấy Quý ròm lấm lét thò đầu ra khỏi phòng, bà chạy lại níu lấy tay nó: 

- Cái gì nổ điếc tai vậy cháu? 

- Chẳng có gì đâu ạ! - Quý ròm cố làm ra vẻ thản nhiên - Chẳng qua là... chẳng qua là... 

Thấy Quý ròm cứ ấp a ấp úng, bà sốt ruột: 

- Chẳng qua là sao? Làm gì mà cháu ăn nói lôi thôi như cá trôi sổ ruột thế? 

Quý ròm gãi đầu: 

- Chẳng qua là cháu đang thử một... loại súng mới ấy mà! 

- Lạy chúa! - Bà ngao ngán lắc đầu - Tổ mẹ mày, súng với chả súng! Mày mà không banh xác cả lũ! 

Hôm đó, Quý ròm phải năn nỉ bà và nhỏ Diệp đến ráo cả nước bọt, cả hai mới chịu ém nhẹm chuyện đó cho. Cũng may, khi ba bà cháu vừa dọn xong chỗ kính vỡ thì ba mẹ cũng vừa về tới. Và tất nhiên khi mọi người phát hiện ra sự biến mất của tấm kính, chính bà là người nai lưng ra gánh chịu mọi chuyện giùm cho Quý ròm. Bà bảo trong khi lau kính, bà bất cẩn để nó rơi xuống đất. Thế là ba mẹ chẳng buồn chất vấn hay truy cứu nữa! 

Bây giờ nghe bà nhắc lại chuyện đó, Quý ròm vẫn còn hoảng vía. Nếu nó cứ bướng bỉnh không chịu nghe lời bà, bà nổi sùng đem chuyện đó kể lại với ba mẹ thì nó cứ gọi là nát đít. 

Nghĩ lợi nghĩ hại một hồi, Quý ròm lặng lẽ cất các chai lọ vào lại trên giá. Những gói hóa chất thì nó nhét vào hộp các tông. Xong xuôi đâu đó, nó co giò phóng ra khỏi nhà. 

- Này, này, cháu đi đâu đó? - Tiếng bà gọi giật. 

- Cháu lại nhà thằng Tiểu Long! 

Quý ròm đáp mà không quay đầu lại. Hai cẳng chân khẳng khiu của nó phi như ngựa. Nó nghe tiếng bà lo lắng vọng theo: 

- Ði chầm chậm thôi, cháu ơi! Không khéo vấp ngã u đầu bây giờ!

Mặc bà dặn, Quý ròm vẫn không giảm tốc độ. Nó vừa chạy vừa cười thầm "Bà thật lẩm cẩm! Mình chứ đâu phải nhỏ Diệp!". 

Quý ròm nghĩ chưa dứt câu, chân bỗng trượt phải một vỏ chuối ai ném giữa đường, ngã một cái "oách", đau lịm cả người. 

Nó lồm cồm ngồi dậy và vội vàng ngoảnh cổ nhìn ra phía sau. Hú vía, chỗ này nhờ có bụi cây che khuất nên bà không nhìn thấy mình! Quý ròm mừng rỡ nhủ bụng và sau khi phủi bụi đất bám trên người, nó nghiến răng cà nhắc đi tiếp.
Nhà Tiểu Long rất nghèo. Ba nó là thợ hồ. Mẹ nó bán những thứ linh tinh như thuốc lá, nước ngọt, mì gói và những mặt hàng lặt vặt khác, toàn bộ "gia tài" chất trên một chiếc xe đẩy nhỏ. 
Tiểu Long có hai ông anh sinh đôi là anh Tuấn với anh Tú. Cả hai đều đã nghỉ học từ cuối năm lớp chín để đi làm phụ giúp gia đình. Anh Tuấn làm bảo vệ ở một xí nghiệp may. Còn anh Tú là công nhân trong một nhà máy sản xuất giày dép. 
Tiểu Long còn một đứa em gái là nhỏ Oanh. Nhỏ Oanh cùng tuổi và học cùng lớp cùng trường với nhỏ Diệp, em Quý ròm. Con bé tuy nhỏ tuổi nhưng nom chững chạc ra phết, chả bù với tính nhõng nhẽo của nhỏ Diệp. 
Nhà Tiểu Long nằm cuối một con hẻm cụt. Mẹ nó ngồi bán ở ngay đầu hẻm, sáng đẩy xe ra tối đẩy xe vào. 
Lúc Quý ròm tới, mẹ Tiểu Long đang bán mấy bịch kẹo xanh xanh đỏ đỏ cho một thằng nhóc trong hẻm. 
Vừa nhác thấy Quý ròm, không đợi nó kịp hỏi, bà đã niềm nở: 
- Cháu vào chơi đi! Tiểu Long có ở nhà đấy! 
Cũng như nhà Quý ròm, nhà Tiểu Long vào giờ này vắng tanh vắng ngắt. Mọi người đã đi làm, đi học cả. Ngay cả Tiểu Long cũng không thấy đâu. 
Nhưng Quý ròm không hề ngạc nhiên. Như một kẻ quá quen thuộc với những ngóc ngách trong nhà, nó xăm xăm đi thẳng ra mảnh sân nhỏ phía sau nhà. 
Quả nhiên, vừa bước qua khỏi góc bếp, Quý ròm đã nhìn thấy Tiểu Long. Nhưng trái với sự hình dung của nó, Tiểu Long đang ngồi thừ ra trên chiếc ghế gỗ cuối vườn chứ không bay nhảy đấm đá như mọi ngày. 
Không hiểu sao anh em Tiểu Long người nào cũng mê võ nghệ. Anh Tuấn học Karaté, anh Tú theo Vovinam. Noi gương hai anh, cách đây mấy năm, Tiểu Long lò dò đến trung tâm võ thuật quận đăng ký học Taekwondo. Bây giờ nó đã là võ sinh huyền đai đệ nhị đẳng. 
Bà của Quý ròm không biết Tiểu Long học võ nhưng bà nói trúng phóc. Bà bảo cứ trông tướng tá của thằng Tiểu Long biết ngay nó là đứa ham tập thể dục, thật chả bù với thằng cháu lười hoạt động, chân cẳng cứ như que sậy của bà! 
Tất nhiên Tiểu Long không chỉ tập thể dục suông. Mảnh sân nhỏ phía sau nhà nó treo lủng lẳng toàn những bao cát. Ðó chính là "luyện võ đường" của anh em nhà nó. 
Hằng ngày, vào những giờ rãnh rỗi, Tiểu Long thường ra đây ôn quyền luyện cước. Lần nào bắt gặp Tiểu Long ở phía sau nhà, Quý ròm cũng thấy nó tay đấm chân đá huỳnh huỵch vào các bao cát, mồ hôi mồ kê nhễ nhại. 
Vậy mà hôm nay Tiểu Long lại ngồi im ru trên ghế, dáng điệu rù rù như con gà chết, lạ thật! 
Chắc là nó đang bí bài tập toán thầy Hiếu mới cho về nhà hôm trước! Quý ròm nhủ bụng và rảo bước tiến lại. 
Nghe tiếng động, Tiểu Long giật mình quay đầu lại. Quý ròm vừa mở miệng định hỏi, Tiểu Long đã nhanh nhẩu hỏi trước. Nó nhìn tướng đi khập khiễng của Quý ròm, mắt trố lên: 
- Chân mày sao vậy? 
Quý ròm tặc lưỡi: 
- Tao vừa mới đánh nhau! 
- Ðánh nhau? 
Vẻ nghi hoặc của Tiểu Long khiến Quý ròm đâm tự ái. Nó khịt mũi: 
- Chẳng lẽ chỉ có mày mới biết đánh nhau? 
- Tao đâu nghĩ vậy! - Tiểu Long hạ giọng - Nhưng mày đánh nhau với ai? 
Quý ròm không trả lời thẳng. Nó "nhập đề" theo kiểu "lung khởi": 
- Trên đường đến nhà mày, tao gặp một con chó! 
Tiểu Long gục gặc đầu: 
- Tao hiểu rồi! Và mày đánh nhau với nó! 
- Ừ. 
- Và đó là một con chó... con! 
- Dẹp mày đi! - Quý ròm sầm mặt - Một con béc-giê giống Ðức đang hoàng! Nó bay vào người tao. Thế là tao lập tức bay... 
-...lên lề! - Tiểu Long bất thần chen ngang. 
Quý ròm nghiến răng trèo trẹo: 
- Bậy! Tao cũng bay vào người nó! "Ầm" một cái, con chó lăn quay, xương cổ gãy nghe răng rắc! 
Tiểu Long mỉm cười: 
- Nó gãy cổ, còn mày thì gãy chân! 
Quý ròm rung rung chân: 
- Chân tao dễ gì gãy! Chỉ trầy trụa sơ sơ thôi! Tao đá bằng thế võ của mày mà lại! 
- Thế võ của tao ? - Tiểu Long đi từ ngạc nhiên này đến ngạc nhiên khác - Thế gì vậy? 
- Tao quên rồi! Ðể tao nhớ lại đã! - Quý ròm nhíu mày cố nghĩ đến một cái tên nước ngoài - À, à, hình như thế võ này có tên là Oshin thì phải! 
Thế võ của Quý ròm khiến Tiểu Long ôm bụng cười bò: 
- Làm gì có thế võ nào tên là Oshin! Chỉ có phim Oshin đang chiếu trên ti-vi thì có! 
Biết mình bị hớ, Quý ròm đỏ bừng mặt. Nhưng nó vẫn cố vớt vát: 
- Có thế võ này mà! Mày nhớ kỹ lại đi! 
Tiểu Long quệt nước mắt: 
- Hay là mày muốn nói đến thế Osoto-Otoshi? 
Mắt Quý ròm sáng rỡ: 
- Có thế võ này hả? Vậy thì đúng rồi! Khi nãy tao dùng chính thế này để hạ con bé 
bẹc-giê hung dữ đó! 
Tiểu Long nhún vai: 
- Nhưng tao đâu có biết sử dụng thế võ này! Ðây là đòn thế của nhu đạo, không phải của Taekwondo! 
Quý ròm phẩy tay: 
- Nhu đạo hay Taekwondo gì cũng vậy! Hễ thế võ nào hay là tao dùng! 
Nói xong, Quý ròm ngồi xuống chiếc ghế bên cạnh tỏ vẻ muốn kết thúc câu chuyện về chiến công tưởng tượng của mình. Nó biết nếu cứ kéo dài thêm, sớm muộn gì nó cũng sẽ thòi ra một vài câu bá láp. Và lúc đó thì tha hồ cho Tiểu Long chọc ghẹo. 
Thật ra Tiểu Long làm gì mà chẳng biết bạn mình đang bịa chuyện. Ngữ như Quý ròm, trời sinh ra không phải để đánh nhau, càng không phải để đánh nhau với chó bẹc-giê Ðức. Quý ròm có thể trở thành nhà bác học hay nhà ảo thuật lừng danh thế giới, nhưng trở thành võ sĩ thì không đời nào, dù là võ sĩ hạng tép trong phường. 
Nhưng khổ nỗi, thói đời là khi không có cái gì, con người ta lại thích khoe khoang về cái đó. Anh em Tiểu Long võ nghệ kinh người nhưng chả bao giờ nói đến chuyện đánh nhau. Còn còm nhỏm còm nhom như Quý ròm hễ mở miệng ra là kể toàn chuyện đánh với đấm, làm như ngày nào nó cũng phải "kịch chiến" với những người chung quanh chừng vài chục trận vậy. Mà những trận đánh của Quý ròm đâu phải là xoàng, trận nào cũng có "xương cổ gãy răng rắc", "xương sườn gãy rào rào", toàn cảnh máu chảy thây phơi nghe phát ớn! 
Thấy Tiểu Long tủm tỉm ngồi cười một mình, Quý ròm đâm chột dạ: 
- Mày cười gì vậy? 
- Thích thì cười chơi vậy thôi! - Tiểu Long chối phắt. 
Quý ròm không tin. Nó hừ giọng: 
- Xạo đi mày! Khi nãy ngồi như con gà rù, bây giờ lại tự nhiên thích cười! 
- Ừ, tính tao vậy đó! 
Nói xong, mặt Tiểu Long lại xịu xuống. 
Lúc nãy, nghe Quý ròm gân cổ ba hoa chuyện đánh nhau với chó béc-giê, nó buồn cười quá cỡ, vì vậy nó quên béng mất nỗi phiền muộn trong lòng. Bây giờ, Quý ròm đột nhiên nhắc tới chuyện đó khiến lòng nó đang vui bỗng chùng hẳn xuống. 
Quý ròm nhìn đăm đăm vào bộ mặt rầu rĩ của bạn: 
- Mày có chuyện gì buồn hả? 
- Ừ. 
- Chuyện gì vậy? Kể tao nghe được không? - Vừa hỏi Quý ròm vừa xích ghế gần lại. 
Tiểu Long có vẻ lưỡng lự. Nó không biết có nên thổ lộ tâm sự với bạn mình hay không. 
Quý ròm lại xích ghế sát hơn nữa: 
- Mấy bài tập đại số hóc búa của thầy Hiếu làm mày "hết muốn sống" phải không? 
Ở lớp, Tiểu Long thuộc loại học sinh bị xếp hạng trung bình yếu. Và trong các môn, nó yếu nhất là môn Toán. Kể cũng lạ, trong khi thằng bạn chí thân của nó là Quý ròm được xưng tụng là thần đồng tóan học thì nó cứ trông thấy các con số và các hình vẽ vuông vuông tròn tròn là sợ vãi cả mật. 
"Cứ thấy cuốn sách toán là tao... hết muốn sống!", câu nói nổi tiếng này của Tiểu Long lâu lâu lại bị Quý ròm lôi ra giễu cợt và những lúc như vậy, Tiểu Long chỉ biết nhe răng cười trừ. 
Nhưng hôm nay Tiểu Long không cười. Nó hờ hững nhếch mép: 
- Lớp mình còn nghỉ cả tuần nữa mà sợ gì! 
- Vậy thì mày buồn chuyện gì ? - Lần này thì quả tình Quý ròm không hiểu được điều gì đang xảy đến với thằng bạn của nó. 
Sau một thoáng ngập ngừng, Tiểu Long tặc lưỡi: 
- Tao cần tiền! 
- Tiền? - Quý ròm chưng hửng, nó không hề nghĩ nỗi buồn của Tiểu Long lại liên quan đến những tờ giấy bạc - Mày cần bao nhiêu? 
- Một trăm ngàn! - Tiểu Long buông thõng. 
- Một trăm ngàn? - Quý ròm bất giác buột miệng lặp lại, con số quá lớn làm miệng nó há hốc. 
Quý ròm sửng sốt là phải, một phần vì số tiền lớn ngoài sức tưởng tượng của nó, phần khác "nỗi buồn tiền bạc" này có vẻ gì đó lạ lẫm so với tâm tính thường ngày của thằng bạn nó. 
Xưa nay Tiểu Long nổi tiếng là một đứa tiết kiệm, chi tiêu dè sẻn. Ý thức được sự khó khăn của gia đình, Tiểu Long luôn biết cách tự hài lòng với những gì mình có. Từ chuyện ăn mặc, tóc tai cho đến vui chơi, giải trí, nó không bao giờ đua đòi, bắt chước bạn bè. 
Nói chung, Tiểu Long hầu như ít khi sử dụng đến tiền bạc. Chạy đủ ăn từng bữa, đối với nó đã là một chuyện nhiêu khê. Vì vậy, nó không muốn ba mẹ và các anh phải lo nghĩ thêm về những nhu cầu riêng tư của nọ. 
Vậy mà bây giờ cái đứa không bao giờ đụng đến tiền bạc đó lại đâm ra thẫn thờ vì cần tới những một trăm ngàn một lúc, bảo Quý ròm không kinh ngạc sao được! 
- Mày cần tiền chi vậy? - Cuối cùng không nhịn được, Quý ròm buột miệng hỏi. 
Tiểu Long bùi ngùi : 
- Tao thương em tao! 
Câu trả lời không ăn nhập đâu vào đâu của Tiểu Long khiến Quý ròm ngơ ngác mất một lúc mới lờ mờ đoán ra: 
- Bộ nhỏ Oanh không có tiền đóng học phí hả? 
Tiểu Long lắc đầu: 
- Học phí đóng rồi! 
- Hay nó thiếu tiền mua sách vở? 
Tiểu Long vẫn lắc đầu. 
Quý ròm gãi đầu: 
- Hay nó hết quần áo mặc? 
Lần này Tiểu Long không lắc đầu nữa. Mà thở dài: 
- Nó thích một con gấu bông! 
- Gấu bông? - Quý ròm tròn xoe mắt. 
- Ừ! - Giọng Tiểu Long buồn buồn - Nó thích con gấu bông bày trong tủ kính ở cửa hàng Sao Mai! 
Quý ròm chớp mắt: 
- Nhỏ Oanh bảo với mày vậy hả? 
- Nó không bảo. Nhưng ngày nào tao đi học về, nó cũng lo lắng hỏi tao đã có ai mua con gấu bông đó chưa. Khi nghe tao bảo con gấu vẫn còn nằm trong tủ kính, nó mừng lắm, mặc dù nó biết chẳng bao giờ nó mua được con gấu đó! 
Trong khi Quý ròm đang im lặng buồn lây nỗi buồn của bạn, giọng Tiểu Long vẫn trầm trầm: 
- Tối nào cũng thấy nó ôm chiếc gối, nựng nịu "Ngủ đi, gấu bông ngoan của chị", tao buồn không chịu được. Vì vậy tao quyết tâm kiếm tiền mua con gấu cho nó, càng sớm càng tốt. Tao sợ nhỡ một ngày nào đó, con gấu bị ai mua đi mất, lúc đó... 
Tiểu Long bỏ lửng câu nói, thay vào đó là những tiếng tặc lưỡi đượm vẻ bồn chồn. 
Quý ròm ngồi ngây người bên cạnh. Nó chẳng biết phải an ủi bạn bằng cách nào. Nó cũng chẳng nghĩ ra cách gì giúp bạn. Một trăm ngàn là số tiền quá khủng khiếp so với bọn học trò như nó và Tiểu Long. Khổ nỗi, những chuyện gay cấn như vậy Tiểu Long lại không thể thổ lộ với ba mẹ và cách anh được. Mặc dù nhỏ Oanh là con gái út, được cưng nhất trong nhà, nhưng bỏ một khoản tiền lớn ra mua một món đồ chơi xa xỉ như gấu bông kia thì quả là một ý tưởng điên rồ đối với những người quen sống chắt bóp, tằn tiện lâu nay! 
Nhưng với Quý ròm thì mơ ước của Tiểu Long chẳng có một chút xíu gì gọi là điên rồ. Nó có một đứa em gái, vì vậy nó biết lòng thương em là thế nào. Nhỏ Diệp em nó có cuộc sống tương đối đầy đủ, vậy mà nó còn thương. Huống hồ gì Tiểu Long. Em nó lúc nào cũng thiếu thốn. Nhỏ Oanh lại là một đứa em ngoan. Cũng như Tiểu Long, chẳng bao giờ nó vòi vĩnh ba mẹ một điều gì. Chỉ khi nào thèm khát quá mức một cái gì đó, nó mới rụt rè tâm sự với Tiểu Long. Như chuyện con gấu bông này chẳng hạn. Tội nghiệp nó ghê! 
Quý ròm ngồi rầu rầu. Tiểu Long ngồi rầu rầu. Hai đứa như hai pho tượng, thẫn thờ theo đuổi những ý nghĩ lãng đãng trong đầu. 
Chợt Quý ròm vỗ đùi đánh đét: 
- Chậc, tao nghĩ ra cách rồi! 
Tiểu Long giật mình ngước lên, giọng mừng rỡ xen lẫn ngờ vực: 
- Cách kiếm tiền hả? 
Quý ròm mạnh bạo: 
- Ừ! Cách này chắc ăn như bắp! 
Rồi không đợi Tiểu Long kịp phản ứng, nó đứng bật dậy nắm tay bạn kéo đi: 
- Ði! Ði theo tao! 
Tiểu Long nhăn nhó: 
- Nhưng mà đi đâu? 
- Tới nhà tao! - Quý ròm hăm hở - Tới đó mày sẽ biết! 
Rồi bất chấp cái chân đau, nó cầm tay Tiểu Long lôi một mạch khiến thằng này không có cách nào khác là co giò lính quýnh chạy theo.',
	1
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Thiên thần bóng tối (Black - Angel)',
	0,
	N'Một thế giới bí ẩn, một thế giới không bao giờ thuộc về bạn, một thế giới phiêu lưu đầy cam go bất ngờ nơi mà những mối quan hệ Tình yêu, Quyền lực và Thù hận đan xen!Hải Băng - một cô gái băng lãnh, khó hiểu. Một đôi mắt màu nâu khói trong veo. Một gương mặt thuần khiết và đầy hấp lực. Một trái tim mà nước mắt đã làm đóng thành băng, khiến người ta phải "Say! Ngay từ cái nhìn đầu tiên".',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/thien-than-bong-toi.jpg?itok=sNr9ovuV',
	N'Tiếng lưỡi dao xuyên vào da thịt... rợn người

Tiếng máu... rít lên... loang ra... đỏ thẫm...

Tiếng mưa...

Mưa!

Ào ào...

Xối xả...

Trắng xóa...

Hòa vào vị máu tanh nồng...

Thành phố Fensisco, 2 giờ sáng.

Tóc tách... tóc tách... tách... tách...

Tiếng nước mưa rơi đều trên sàn hành lang... Dãy hành lang rộng, dài hun hút... u ám và đâu đây nghe như đẫm mùi máu tươi...

Dọc hai bên hành lang là hai hàng vệ sĩ mặc vest đen, đeo kính đen cúi rạp cả xuống. một người đàn ông trung niên cao to vẻ đầy quyền lực tiến vào, những bước chân chậm rãi, dứt khoát, uy nghiêm. Đằng sau ông ta là một cô bé chừng mười bốn, mười lăm tuổi với mái tóc dài ướt nhẹp nước mưa xõa xuống, chiếc váy trắng lết trên nền ướt sũng. cô bé co rúm người vì lạnh... đôi mắt long lanh tội nghiệp cúi gằm xuống, bàn chân bé nhỏ khe khẽ bước...

Người đàn ông dẫn cô bé vào một căn phòng khách rộng thênh, được trang hoàng không khác gì nơi ở của một vị vua sa hoa. Đèn sáng trưng nhưng vẫn có cảm giác lạnh lẽo, đáng sợ. Lạ lẫm, cô bé cũng chẳng dám liếc nhìn thứ gì, cứ đứng trân trân, cúi gằm mặt.

Trên ba chiếc ghế bành là ba cậu con trai... ba thiếu gia của ông chủ băng đảng mafia khét tiếng,một trong những băng đảng bậc nhất phía tây thế giới.

- Gọi tụi con vào giờ này định chạy loạn hả ba? - Cậu con trai đầu quẳng cuốn tạp chí ‘Người đẹp’ xuống sàn, đứng dậy vươn vai.

Cậu thứ ba đặt cuốn sách xuống ghế, đứng dậy, cúi đầu chào:

- Chắc có chuyện quan trọng! Vụ Jacker đêm nay thuận lợi chứ ạ?

- Con vẫn làm ta vừa ý nhất, Chấn Nam! Hai đứa ngồi xuống đi, ta có chuyện muốn nói.

Người đàn ông liếc nhìn chiếc ghế gần rèm cửa, nơi cậu con trai thứ hai đang dựa đầu ngủ, tai nghe mp3 hết sức bình thản, bất cần...

- Ba! Con bé kia chui từ xó nào ra thế?

- Chấn Khang!

- Biết rồi! Có gì thì ba nói nhanh đi.

[Chúc bạn đọc sách vui vẻ tại www. gacsach. com gác nhỏ cho người yêu sách.]

Chấn Khang quay mặt đi vẻ hơi khó chịu, trong khi cậu em thứ ba thì nghiêng đầu, nhìn chăm chăm vào cô bé đứng cạnh ba.

- Thời gian tới ta sẽ rất bận. Ta sẽ sang Macao giải quyết lô hàng quanh cảng... cho nên... cho đến lúc ta về... các con đừng gây chuyện... Hôm nay, xong vụ Jacker, ta gặp cô bé này ở nhà kho, có lẽ là bi bỏ rơi. Ta đã từng nói như thế nào?

- Kẻ bị bỏ rơi vào không có khả năng tự lo cho bản thân thì cách giúp đỡ tốt nhất là giết chết.

- Được rồi... nhưng lần này ta có một suy nghĩ khác...

- Ta tin chắc rằng sau này con bé sẽ trở thành cô gái mà bất cứ một thằng đàn ông nào cũng có thể ‘say’ ngay từ cái nhìn đầu tiên. Ta sẽ để nó ở đây với các con. Lúc nó tròn mười bảy tuổi, ai trong các con có thể... tự tay giết chết con bé, sẽ là người thay thế vị trí của ta...

Chấn Nam hơi rùng mình vì câu nói của cha. Còn Chấn Khang chỉ liếc mắt đi, khẽ mỉm cười vì những ý nghĩ độc địa nhất ẩn sâu trong lời nói ấy...

- Các con hiểu ý ta không?

- Kẻ có khả năng nắm quyền là kẻ chỉ tin chính mình và có thể nhẫn tâm với bất cứ ai, dù là người mình mang ơn hay người mình yêu nhất, thưa ba.

Người đàn ông quay người, vẻ nghiêm nghị không chút biến đổi:

- Về điểm này thì con giống ba, Chấn Khang... Hãy chăm sóc tốt cho con bé, nếu muốn...

Ông trùm mafia lừng danh bước đi không chút bận lòng.

... Bước chân ông vừa qua khỏi ngưỡng cửa, đôi mắt cậu con thứ hai từ từ mở ra, khuôn mặt lơ đễnh chẳng để ý ai, cũng chẳng rõ có biết cha mình vừa đến không. Liếc xuống chiếc Mp3, nó sắp hết pin, cậu đẩy người đứng dậy rồi cứ thế đi ngang qua người anh trai...

Chấn Phong dừng bước ngay cạnh cô bé. Cô bé vẫn cúi gằm mặt, tay chân run lập cập vì lạnh. Một cái liếc ngang chỉ một giây hoặc ít hơn... Phong sải bước tiếp, đôi mắt nhìn thẳng, vô cảm, như chẳng có chuyện gì, như tất cả xung quanh chỉ là không khí, lẽ đương nhiên phải tồn tại...

Chấn Khang cùng lúc bật đứng dậy, bằng vẻ chậm rãi đầy thích thú, cậu tiến lại phía cô bé, dừng đúng chỗ cậu em thứ hai vừa dừng... Vài dây suy nghĩ trượt đi trong đầu, Chấn Khang từ từ cúi xuống... gần hơn... rồi... ghé sát vào tai cô bé:

- Mới chừng này tuổi đã thế này. Chắc lớn lên sẽ trở thành một người tình tuyệt vời.

Một nét cười thích thú hiện lên trên khuôn mặt cầu con cả. Cậu ta lại đứng thẳng người, bước đi...

- Vậy thì ta sẽ chờ. Trước khi giết em, ta phải có được em cái đã. Ha ha...

Chấn Nam đứng dậy, người cuối cùng bước lại phía cô bé.

Soạt! Cậu cởi áo khoác ngoài choàng lên người cô bé rồi từ từ ngồi xuống, hết sức dịu dàng... Chấn Nam rút chiếc khăn tay lau nước mưa dính át trên mặt ngây ngô.

...

- Đừng sợ. Từ giờ, chúng ta sẽ là bạn nhé!

Chấn Nam đứng lên, kéo cổ áo choàng trên người cô bé lại, rồi khe khẽ nắm lấy tay cô bé, bước đi...

- Ta sẽ đưa em đến nơi ấy, theo ý của ba...

Cô bé cứ bước chân theo không suy nghĩ, chỉ có cảm giác ở cái nơi lạnh lẽo như đường hầm đị ngục này, chỉ có người con trai trước mặt cho cô sự an toàn. Tiếng mưa ào ào vẫn vọng đâu đây, cái lạnh thấm vào từng làn da thớ thịt nhưng bàn tay người con trai ấy thì... thật ấm...

Hơn 2 giờ sáng, dãy hành lang rộng và dài hun hút trong bóng tối, đèn đường sáng lên theo mỗi bước chân người đến. Không gian vắng lặng bỗng vang lên những hồi chuông. Cuối dãy hành lang là một chiếc cửa lớn. Chiếc cửa từ từ mở ra... Chấn Nam kéo theo cô bé cứ lặng lẽ bước từng bước chân chậm rãi...

Phía sau cánh cửa, hai dãy người xếp hàng dài lần lượt cúi đầu:

- Cậu chủ!

Nam khua nhẹ tay:

- Không cần giữ phép. Xin lỗi vì làm các em thức giấc vào giờ này.

Không sao ạ. Chắc có chuyện gì nền cậu ba mới đến lúc này. - Một cô gái chững chạc bước đến cử chỉ hết sức nhẹ nhàng.

- Không có gì nghiệm trọng đâu. Ta đưa cô bé này đến chỗ các em thôi. Kiều Như giúp ta nhé!

- Cậu ba! Cô bé này...

- Là cha ta mang về đấy. Từ giờ cô bé sẽ ở đây. Như giúp đỡ hộ ta.

- Sao cậu ba nói thế. Em đương nhiên có trách nhiệm với người mới rồi. Cậu ba cứ về nghỉ đi, cũng muộn rồi, cô bé này em sẽ lo cho.

- Em lúc nào cũng làm ta yên tâm.

Chấn Nam kéo cô bé kia lại phía cô guản gia. Cô bé kia dù chẳng hiểu mình sẽ sống thế nào ở cái nơi lạnh lùng và có gì đó rờn rợn này, nhưng có lẽ ở đây tốt hơn ở khu nhà kho dột nát ấy. Cô bé liêc mắt nhìn người con trai ấy quay đi, dẫu rất muốn giữ lại nhưng không thể... Trong đầu cô bé chỉ quay vòng những suy nghĩ “Còn có thể gặp lại người đó không? Người đó... thực sự... là ai?”

Chát!

Cô bé quay phắt 90 độ, loạng choạng suýt ngã, vẫn chưa định thần lại để hiểu chuyện gì xảy ra sau cái tát trời giáng chẳng biết từ ai.

- Vào giờ này mà mày bắt cậu ba phải mất ngủ và bắt bọn tao phải tỉnh giấc hả ranh con?

Cả đám con gái dồn lại, nhìn cô bé đáng thương bằng những đôi mắt hình viên đạn. Đứng trước mặt cô bé là... cô quản gia có vẻ dịu dàng đầy trách nhiệm ban nãy - Trần Kiều Như.

- Mày chui từ cống nước nào lên mà người ngợm thế này?

Cô bé có vẻ hiểu ra một chút vấn đề nên cúi gằm mặt, hai bàn tay nắm chặt.

Đừng có nghĩ được cậu ba mang đến thì mày qua mặt được tụi này. Từ giờ, mày sẽ làm việc dưới quyền của chị đây, cho nên, tốt nhất là biết điều một tí.

Như đưa tay nhẹ nhàng đẩy cằm cô bé lên, ánh mắt trong vao không một chút sợ hãi ngước theo. Như nghiến răng rít lên:

- Còn với vẻ mặt ngây thơ giả bộ này của mày. Đừng có mơ mà ve vãn được cậu ba, em ạ!

Dứt lời, cô nàng quay phắt đi, quanh tay bước điệu bộ kiêu kì.

- Để nó nằm giường 105 với con bé nhí nhố đó. Chị không ưa nên các em liệu đường mà cư xử.

Hơn hai mươi nữ giúp việc cùng nhất loạt quay đi, bước theo cô quản gia.

- ...

- Bạn là người mới hả?

- ...

- Nè, thay bằng nhìn mình bằng cái vẻ ngây ngô đó, tại sao bạn không mở miệng nói hả? Mình tên Thụy An, chị Như bảo từ giờ bạn sẽ ngủ chung giường với mình, vì thế nên tụi mình kết thân nhé.

- ...

- Mà bạn phải lau khô đầu và thay quần áo thì mới được vào ngủ đấy. Ướt rượt thế này... À, nếu không có thì mình cho mượn tạm quần áo nhé!

- ...

- Mà bạn tên gì?... Sao cứ im lặng hoài vậy? Không nói được hay ghét mình? Hả?

Thụy An thở dài một tiếng chán nản, toan quay đi thì chợt khựng lại bởi tiếng nói phát ra. Cảm giác phải được suy nghĩ rất lâu, cảm giác như bất cần cái vô hình của thời gian... Tựa hồ... tiếng đàn phong phanh xuyên qua màn mưa...

- Hải Băng!

Khẽ khàng... trong veo... nhẹ như sương sớm. Tiếng nói làm Thụy An tim ngừng một nhịp.

- Bạn... tên... Hải Băng?... Hì, hay thế, Hải Băng nghĩa là ‘biển lạnh’ phải không?

An ghé mặt lại gần cô bé, ngón tay vuốt những sợi tóc mái sang bên, chăm chú nhìn.

... Mắt trong veo như biển, mái tóc dài như sóng và giọng nói nhẹ như sương.

- Bạn... xinh... quá. Nếu An là con trai thì cũng mê bạn đến chết mất thôi. Hi hi hi...

An ghé tai cô bé mới đến thầm thì:

- Chị Như ghen với bạn đấy. Chị ta giỏi giang nhưng xấu tính lắm. Cậu ba thân thiện với mọi người, nhưng chuyện khoác áo cho người lạnh thì zero nhé. Nếu cậu lấy được lòng cậu ba thì chị Như sẽ điên lên lồng lộn cho mà coi... Nhưng dù sao ở cái nhà này tốt nhất nên theo ý chị ta nếu muốn sống bình yên. Còn nữa, bạn phải biết cái biệt thự hơn một ngàn mét vuông này có ba ông hoàng đẹp trai mà bất kì kẻ nào cũng phải phục tùng: Cậu cả Lâm Chấn Khang, cậu hai Lâm Chấn Phong, và cậu ba Lâm Chấn Nam. Hơn hết, có ba điều cấm kị bạn cần nắm rõ, ve vãn cậu ba trước mặt chị Như, làm phật ý cậu cả và... chạm vào người cậu hai. Nếu phạm phải một trong ba điều theo cách này hay cách khác, bạn sẽ sống không bằng chết!

An hất tóc, đủng đỉnh quay đi, chẳng cần biết cô bạn kia lo lắng hay ngạc nhiên,

- Đừng nghĩ An nhiều chuyện. An muốn tốt cho bạn thôi. Ở cái chốn địa ngục này giúp đỡ nhau là tốt mà.

An đi rồi, cô bé kia vẫn đứng đó. Và tuyệt nhiên không một chút vẻ quan tâm, ngạc nhiên hay sợ hãi. Lặng yên. Suy nghĩ điều gì thì chỉ có cô bé biết

Hơn 5 giờ sáng.

- Mấy giờ rồi mà mày còn ngủ? Chây lười thế à.

Hải Băng giật mình tỉnh giấc sau tiếng chửi te tua của một cô giúp việc. Băng đứng dậy, dụi mắt.

Bộp! Cả bộ đồ lằm bếp bay thẳng lên đầu cô bé mười bốn tuổi.

- Mặc vào rồi ra làm việc đi! - Giọng nói chanh chua của cô giúp việc chẳng làm Băng khó chịu. Cô bé cầm lấy bộ đồ giúp việc lên, chợt nhận ra nó lấm lem rất nhiều vết mực. Chắc là có người bày trò. Băng không quan tâm, chậm dãi đi thay đồ.

...

- Gần 7 giờ rồi. Nhanh lên nào.

- Yến! Món salad xong chưa? Mang ra đi!

- Dạ! Xong rồi chị.

- Nhanh lên! Đổ nước thừa trên kệ đi! Gớm quá!

- Vâng!

Phặc - Oái - àooo...

Nửa chậu nước đục ngầu hắt lên người Hải Băng, cô bé đang tỉ mẩn lau chén đĩa.

- Ồ! Chị không may. Ráng chịu nhe em.

An cùng lúc chạy lại, vẻ khó chịu:

- Thế này mà không may gì. Đường thì rộng thênh thang thế này. Cố tình thì chị nhận quách cho nhanh.

- Im đi con ranh. Chuyện mày à? - Qua sang cô nạn nhân - Còn mỗi bộ đồ này thôi nên em ráng mặc đến tối giặt nha. Lần sau thì phải tránh đi lúc chị qua đấy!

Cô giúp việc quay đi, liếc nhìn Kiều Như vẻ lập được công lớn. Như khẽ cười...

Hải Băng chẳng cần nghĩ xem người ta có phải cố tình hay không, lại tiếp tục lau chén đĩa.
- Cậu chủ! Chúcmột buổi sáng tốt lành!

Cả dãy người giúp việc đồng loạt cúi xuống khi Chấn Nam bước vào phòng ăn. Chỉ có Hải Băng chẳng hiểu gì cứ đứng thẳng vẻ ngơ ngác.

- Không cần giữ phép đâu. Chúc các em một buổi sáng tốt lành.

Chấn Nam nở một nụ cười thân thiện, chợt liếc nhìn cô bé cuối hàng, mỉm cười. Hải Băng gặp ánh mắt dịu dàng ấy lập tức cúi mặt xuống.

- Cậu ba lúc nào cũng lịch sự thế đấy! - Thụy An đứng cạnh khẽ đẩy tay cô bạn. - Ở đây thì nhìu nàng chết mê chết mệt. Khổ... nhưng An lại dính phải tình yêu sét đánh với người khác mới chét chứ... Mà bạn có choáng không? Mỗi bữa sáng mà làm thưc ăn cho như cho cả tuần thế đấy. Chỗ này chỉ cho ba ông hoàng dùng thôi. Thực ra thường chỉ có mỗi cậu ba ăn sáng, cậu cả thì hiếm còn cậu hai thì tuyệt nhiên không.

Kettt... cánh cửa phòng ăn mở ra. Chấn Khang bước vào, vẻ ngông nghênh, cởi trần, tay cầm chiếc áo sơ mi đen.

- Cậu chủ! Chúc một buổi sáng tốt lành!

- Sáng nào cũng một điệu đưa ma. Mấy người không thấy nhức tai à?

Chấn Khang lại chỗ bàn ăn, vứt bộp chiếc áo xuống ghế, nhìn cậu em đang chuẩn bị ăn sáng.

- Thằng Phi Long đang đau đầu vì vụ Jacker đấy. Anh định chơi nó một vố.

Ba đã bảo không được gây chuyện lúc ông vắng mặt, nên anh thôi đi.

- Mày thích dạy đời anh từ lúc nào thế hả?

Sau cái nguýt dài khó chịu, Chấn Khang dửng dưng lấy miếng sandwich ăn, vừa ăn vừa đi khỏi bàn. Dừng chân trước dãy người làm, cậu liếc ngang, mắt tia đến chỗ Hải Băng, Chấn Khang chợt... nhếch mép cười...

Cánh cửa khép lại, Chấn Nam bỏ dao và dĩa xuống, thở một tiếng dài.

- Nếu ông chủ biết cậu cả gây chuyện ở ngoài sẽ không vui đâu. - Cô quản gia lên tiếng.

- Anh cả sẽ tự biết cách để không đi quá đà.

Chấn Nam dùng giấy lau miệng, nhìn ra chỗ người giúp việc.

- Em lại đây đi! - Một câu mệnh lệnh nhẹ nhàng, Kiều Như lập tức bước đến.

- Có chuyện gì mà...

- Ta không bảo em. Là cô bé ấy!

Ngón tay Chấn Nam hướng thẳng đến chỗ Hải Băng. Số người giúp việc còn lại trợn mắt quay sang nhìn. Còn Kiều Như thì đơ hình, mặt nóng ran... Băng từ từ bước lại, vẻ mặt không thay đổi.

- Em không cần làm việc đâu. - Ngón tay Chấn Nam vuốt nhẹ trên vạt áo loang bẩn, mắt chăm chăm nhìn cô bé.

- Em ngồi xuống đi!

- Cậu ba! Không được!

- Nó là giúp việc mà!

- Như vậy là trái quy định ạ!

Đám người làm nhao lên, chỉ có Kiều Như mím chặt môi, vẻ mặt tức tối hiện rõ. Vẫn cái cách nhẹ nhàng ấy, Chấn Nam quay sang:

- Các em có ý kiến gì với điều ta muốn sao?... Kiều Như... cả em cũng...

- Dạ không. Quy định là do ba cậu chủ đặt ra mà. Mấy đứa này! - Như bỗng gắt lên. - Quá vô phép rồi đấy.

Chấn Nam lại tiếp tục nhìn cô bé mới đến.

- Còn em? Cũng muốn chống đối lời ta phải không?

Hải Băng nhìn cậu ba, rồi lại nhìn bàn ăn thịnh soạn. Bụng cô bé đói meo từ tối hôm qua. Thế là khỏi cần suy nghĩ thêm, Hải Băng kéo ghế ngồi xuống. Bằng vẻ chậm rải hết mức có thể, cô bé cầm từng miếng sandwich và xúc xích lên ăn. Đám người làm cứ cắn răng lườm nguýt, bực bội. Chỉ riêng Thụy An thích thú nhìn cô quản gia. Mặt cô đang tím tái, lồng lộn mà vẫn phải giả vờ như không. Đã năm năm làm việc ở đây, chưa bao gìờ xảy ra chuyện cậu ba cho người giúp việc ngồi ăn cùng, kể cả quản gia.

Chấn Nam chống tay, nhìn cô bé kia với một vẻ kiên nhẫn hết sức. Chính cậu cũng không rõ điều gì làm mình cuốn hút đến vậy. Vì khuôn mặt thánh thiện tựa mặt trăng? hay vì vẻ khó hiểu trong đôi mắt ấy? Chấn Nam đang đi tìm câu trả lời... ‘say’ ư? Say vì vẻ đẹp... hay say tình?

Nam đẩy cốc sữa lại trước mặt Hải Băng. Cô bé một giây liếc nhanh người con trai ấy, liền bưng cốc sữa lên, uống hết một nửa. Xong, Băng quệt miệng, đẩy ghế đứng dậy.

- Em ăn hết chỗ này cũng không ai trách đâu!

Băng cúi xuống, lắc đầu khe khẽ. Chấn Nam chợt cười, cũng đẩy ghế đứng dậy theo.

- Có vẻ như em không thích nói chuyện. Em làm ta khó chịu đấy!

Nam tiến thêm một bước, rồi từ từ cúi xuống, ghé vào tai cô bé.

- Lúc nào mệt hãy đến phòng ta!

Không nói thêm một câu nào nữa, Chấn Nam cứ thế bước đi luôn, ra khỏi phòng ăn, vẫn cái cách vô cùng lịch sự. Băng nhìn theo cậu chủ, ánh mắt vẫn không một gợn cảm xúc.

...

Àooo...

Cả cốc sữa dội thẳng lên đầu Hải Băng. Cô bé từ từ quay người lại... Kiều Như đang đứng đó, hai bàn tay nắm chặt, đôi mắt như muốn bốc lửa.

- Con ranh này! Tao đã nói với mày thế nào?!...

Hải Băng ngước mắt nhìn cô quản gia. Cái nhìn không phải thách thức, không phải sợ hãi... mà là... Một cái nhìn... bình thản. Điều đó càng làm như muốn điên hơn. Nhỏ xông đến, hai bàn tay tú cả mớ tóc của Hải Băng giật mạnh.

- Mày nhìn tao như thế là sao? Hả? Con ranh này! Con ranh này!

Băng không chống cự, nhắm nghiền mắt chịu đựng. Đám người làm cười khẩy. Thụy An quay đi, không thể giúp gì hơn. Vẫn túm chặt tóc Băng, cô quản gia nghiến răng rít lên:

- Mày nghĩ mày là cái thá gì? một con chó được rước từ cống rãnh nào lên. Trông mày không hơn gì một con chó! Vểnh lỗ tai lên mà nghe cho rõ, mày có mắc chứng hoang tưởng thì cũng đừng có mơ có được cậu ba của tao. Vắt mũi chưa sạch mà dám bỏ ngoài tai lời chị đây hả? Lần này là cảnh cáo, có lần sau thì mày không còn nguyện vẹn đâu! Con ranh!

Kiều Như xô nhào cô bé xuống đất, phủi tay như vừa chạm vào thứ gì nhơ nhuốc lắm. Nhỏ nhếch mép cười, quay đi... rồi chợt dừng chân, hơi quay đầu lại:

- Các em... Con điên này có bị câm không nhỉ?

Cả đám người làm cười rộ lên, Như cũng hơi mỉm cười thích thú, toan đi tiếp...

- Cứ không nói chuyện... là câm sao?

Tiếng cười chợt im bặt, tim Như sững lại... Nhỏ quay đầu nhìn... cô bé kia đang nhìn thẳng vào nhỏ, vẫn cái ánh mắt ấy... bình thản đến khó hiểu...

Hai bàn tay Như run lên khe khẽ...

- ...

- Xin lỗi. An chẳng giúp được bạn. An mà mở miệng nói đỡ chắc cũng bị chị Như xé xác quá... Bạn định cứ nhẫn nhịn thế này đấy à.

- ...

- Thấy lúc bạn mở miệng ra không? Chị Như sock lắm. Cậu ba mà biết được chị Như đối xử với cậu thế này thì chị ta chết chắc... Ui! Trời ơi, đầu tóc bạn thế này có như con ngớ ngẩn không cơ chứ... Ê, nãy giờ bạn có nghe mình nói gì không vậy?

Hải Băng vẫn ngồi bệt dưới đất, không để ý lời cô bạn nói. Cô bé chợt nâng đuôi tóc lên, quệt qua đầu lưỡi...

Thụy An ngớ người ra chẳng hiểu gì. một lát im lặng, Băng bỗng ngẩng đầu lên, đôi mắt như muốn cười:

- Ngọt quá!

Suýt nữa An ngã rầm xuống đất.

- Cả cốc sữa đổ lên đầu mà bạn vẫn vui quá nhỉ. Con người kì lạ! Con người khó hiểu! Bạn ngồi đó mà chơi cho mát... mặc bạn luôn đấy.

Nói rồi An đủng đỉnh quay đi.

- ...

Trong phòng bếp:

- Chị... chị... nghe nó nói không...?

- Êm như ru nhỉ? Tao bắt đầu có thiện ý với con bé rồi đấy.

- Điên hả? Con cao già đội lốt cừu non ấy, nó giả bộ thôi. Giả bộ hiền lành. Giả bộ ngây thơ.

- Nhưng đâu thể phủ nhận... là... nó... cũng xinh.

- Tức là mày theo nó, chống lại chị Như?

- Chúng mày rỗi việc đấy à? Bàn gì...

- Im hết đi! - Giọng cô quản gia gắt lên khó chịu.

- Em... em xin lỗi...

- Em xin lỗi...

Kiều Như đứng quanh tay, dựa vào thành tủ, vẻ đăm chiêu:

- Dù sao cái vẻ vờ vịt của nó cũng rất dễ lừa phỉnh. Trong khi cậu ba thì dễ thương người, lại tốt tính, cậu cả thì ham thứ lạ... rốt cuộc...

- Cậu hai thì sao à?

- Đồ ngu! Với cậu hai thì có mười đứa như nó cũng chẳng thay đổi được gì.

- Có vẻ như con bé đó phớt lờ lời cảnh báo của chị.

- Đơn giản vì nó ý thức được cậu ba đang chú ý tới nó. Các em cứ xử xự ‘thật tốt’ cho chị, chị không tin nó chịu đựng nổi một tuần.

- Nhưng nhỡ cậu ba biết...

- Nếu con điên đó hé răng nửa lời, chị sẽ cho nó mất lưỡi.

- Thực ra vấn đề không hẳn ở chỗ nó ve vãn cậu ba mà cả cậu ba cũng quan tâm tới nó... Nên em nghĩ nếu làm cho cậu ba ghét nó được thì tốt.

- Làm cậu ba ghét nó?... Hì... Em ngày càng thông minh đấy, Ly ạ... Nhưng nói đến các ông hoàng đẹp trai của chúng ta, chị nghĩ đến một điều thú vị hơn nhiều... mấy đứa nghĩ sao về điều cấm kị thứ ba trong khu biệt thự này?...

Cô quản gia khẽ nhếch mày, cười...

Băng bước từ khu vệ sinh ra, nước từ mái tóc dài xõa ra chảy róc rách xuống nền nhà. Thụy An đang đứng bên ngoài nhìn cô bạn trân trân, với cái vẻ vừa sững sờ, vừa khó hiểu.

- Bạn... tự mình... đi tới đây sao?

Hải Băng nhìn Thụy An, vẫn cái nhìn-thường-thấy.

- Không thể nào! Lúc mới đến đây mình đã mất một tuần để nhớ được đường ra khu vệ sinh đấy. Mình mới chỉ dẫn bạn ra đây một lần vào nửa đêm hôm qua, và lúc ấy trời tối thui mà.

Hải Băng, hoặc cố tình không nghe, hoặc nghĩ không có gì đáng quan tâm, cô bé quay phải, bước chậm rãi, lướt qua mặt An. Thụy An lúng túng rồi bước theo.

- Nói thật đi. Ai đó dẫn bạn ra đây phải không? Lạy chúa Jesus. Từ phòng ăn tới đây phải rẽ cả chục lần đấy. Này, Hải Băng à... bạn nói gì đi chứ... này...

Thụy An cứ luôn miệng lẩm bẩm, rồi chợt nhận ra rằng mình đi theo cô bạn nãy giờ, đúng đường trở về khu bếp. Dù rẽ phải, rẽ trái liên tiếp, Hải Băng vẫn đi đều đều, chậm rãi, như một cái máy có lập trình.

- Thôi được rồi. An cứ coi như IQ cửa bạn vượt mức bình thường vậy. Bạn có thấy khu nhà này như một cái mê cung lớn không? Mình không thể tưởng tượng nổi người ta đã thiết kế và xây dựng nó như thế nào đấy. Mình từng được xem bản đồ rồi (thực ra là nhìn trộm trong phòng cậu ba ý). Từ cổng vào là đại sảnh, khuôn viên dẫn một hành lang dài tới phòng khách. từ phòng khách dẫn ra ba hành lang dài nữa tới ba khu vực. Khu giữa, khu A và khu B. Trên bản đồ là ba khu, nhưng thực tế cả ba lạ thông nhau bằng những hành lang dài và chằng chịt, chạy loanh quanh một phát là lạc như chơi. Chỗ tụi mình là khu A, có khu bếp, phòng ăn, khu sinh hoạt và nghỉ ngơi của người làm. Khu giữa có rất nhiều phòng. Đi trên hành lang thấy giống như khách sạn á. Nhưng có ba phòng lớn nhất dành cho ba cậu chủ nằm trên ba dãy hành lang khác nhau. Còn khu B là... là... mà thôi, bạn không biết thì hơn. Sơ sơ thì thế nhưng để đi hết cả ba khu cũng đến hết ngày đấy. Nói vậy nhưng bốn năm qua An cũng mới chỉ luẩn quẩn ở khu A, thỉnh thoảng mới bước qua khu giữa... Nghe cũng hơi hơi nhàm chán nhỉ? Rồi bạn cũng sẽ thấy, sống ở đây không chỉ có nhàm chán đâu. Nếu không thể, không thể có được sự che chở mà chỉ cậu ba mới là người duy nhất cho được, thì... cái khu biệt thự này cũng sẽ trở thành ĐỊA NGỤC TRẦN GIAN thôi! Nếu được ước, mình sẽ ước ngày ấy không bước chân đến đây...

Hải Băng chợt dừng chân... Đằng sau, An đang cười... và một giọt nước mắt chảy dài xuống má.

- Sao... không... ra khỏi đây? - Giọng Hải Băng lại cất lên, thật hiếm để nghe được. Cô bé không hỏi tại sao lại là Địa ngục trần gian. Không hỏi tại sao lại đồng ý đến. Cũng không hỏi tại sao chịu khổ vậy mà vẫn cười nhiều được thế!? Thật là khó để hiểu trong đầu cô bé nghĩ gì, thật khó!

- Rốt cuộc cũng chịu mở miệng ra đấy à? Đã vào đây làm việc thì mãi mãi... không được đặt chân... ra thế giới bên ngoài nữa... cho đến... khi chết...

Hải Băng quay đầu nhìn An, không ngạc nhiên, không thắc mắc. Cái nhìn ấy vẫn bình thản vậy, nhưng như muốn hỏi một điều.

- Mình hiểu mà. Bạn đang nghĩ nếu vậy tại sao ở đây toàn những người trẻ phải không? Trước lúc mình biết được điều đó mình cũng đã nghĩ nát óc ra là đáng nhẽ phải có những người lớn tuổi đã làm ở đây từ lúc khu biệt thự mới xây chứ. Nhưng mình đã tìm ra lời đáp rồi. - Thụy An chợt cười. - Đơn giản là đến khi không làm việc nhanh nhẹn được nữa, sẽ có người mới được đưa vào ở lứa tuổi mười hay mười một. Còn những người cũ thì... “được làm mồi” cho Tử Thần!

Lời An vừa dứt, cánh cửa lớn phía trước chợt mở ra. Một cô giúp việc bước tới với cái nhìn khó chịu. Cô ta lại gần Hải Băng, tia một lượt từ đầu xuống chân, rồi bất ngờ ném cả cái khay đựng đồ vào người cô bé.

- Bao nhiêu việc mà mày lại chạy đi đâu thế?

Chiếc khay rơi loảng xoảng xuống đất, Hải Băng cúi nhặt, không nói gì. Thụy An lên tiếng:

- Đầu dơ quá nên bạn ấy...

- Mày im đi. Chị có hỏi đến mày đâu... Phần bữa sáng đang trong bếp ấy. Ăn nhanh rồi còn làm việc.

- Em biết rồi... Băng, tụi mình...

- Mình mày thôi, nó không có phần. Mới sáng con điên nào đã chõ mũi vào bàn ăn của cậu chủ hả?

Cô giúp việc quay sang nhìn Hải Băng:

- Nhét no bụng rồi thì lo mà làm việc. Đi xách nước rồi lau dọn đi.

Cô ta quay quắt trở lại, chuẩn bị đi báo cáo thành tích với quản gia.

- Sao bạn không nói gì? Chẳng phải cậu ba bảo bạn không cần làm việc sao?... Bạn không có miệng à?... Mà thôi, nói với bạn thà nói với đầu gối còn hơn. Nếu không muốn bám lấy cậu ba để được hưởng đặc quyền thì quên hết những gì An nói ban nãy và hãy chăm chỉ làm việc, cầu hai chữ bình yên đi!... Để mình chỉ cho bạn đường đến bể nước...

Hơn 11 giờ trưa.

- Đọc thực đơn trưa nay đi.

- Khoai tây chiên bơ, gà rooti, gà ram mặn, bò cuốn sate, bò biết tết, cua lột chiên, salat cải, hủ tiếu vang,... Bít tết, bò khai vị. Nhanh tay lên!...

Tít... tít... tít...

Cô quản gia nhấn nút nghe trên bộ đàm được nối bằng sóng từ với hệ thống an ninh chính.

- Kiều Như, bữa trưa thế nào?

- Sắp xong rồi, cậu ba.

- Ta hơi mệt nên sẽ không xuống. Em cho người mang vào phòng cho ta.

- Vâng. Em sẽ mang đến.

- Không cần đâu, bảo cô bé mới đến ấy!

- Sao ạ?

- Ta không muốn nhắc lại lần hai. Đừng làm ta khó chịu.

- Em... biết rồi...

- Tắt bộ đàm, hai má cô quản gia nóng bừng. Mọi người có vẻ chú ý làm Như càng khó chịu.

- Làm việc đi!

Đúng lúc đó, Hải Băng đang bê cả khay cốc thủy tinh ra. Kiều Như muốn trút giận nên dùng cả hai tay xô cô bé chúi vào cạnh bàn. Hải Băng mất đà, nghiêng người, làm cốc rơi loảng xoảng...

- Mày đi đứng thế à! Thấy tao phải tránh ra chứ!

Mấy cô giúp việc liếc nhìn nhau... rồi lại tiếp tục công việc...

...

12 giờ trưa.

Cô quản gia bước đi trên hành lang, vừa đi vừa lấy hộp trang điểm thoa phấn nhẹ trên gò má... Theo sau là Hải Băng, tay bê một khay đồ ăn lớn.

Cửa phòng 102 kẹt mở... Kiều Như quay người đỡ lấy khay thức ăn rồi ra hiệu cho Hải Băng cùng vào. Chấn Nam đang ngồi đọc sách trong phòng đọc, dưới ánh đèn vàng và tĩnh mịch. Chợt... cậu liếc mắt lên...

- Em xin lỗi vì không gõ cửa, không khóa nên em...

- Không sao. Ta đã để cửa chờ... nhưng, không phải chờ em!

Đúng lúc Hải Băng bước lại, ngay phía sau cô quản gia. Cô bé còn mải nhìn căn phòng, rộng và đầy đủ như căn nhà, Kiều Như hơi bối rối:

- Thực... ra... là em sợ cô bé không tìm được đường đến đây nên đã dẫn đi. Đồ ăn cũng nhiều nên em bê hộ...

Kiều Như quay người, bước đến, đặt khay đồ ăn lên bàn khách rồi quay trở lại phòng đọc phía trong.

- Chúc cậu chủ ngon miêng, - Nhỏ nhìn sang Hải Băng. - đây là quy định, em cúi xuống và chúc cậu chủ đi!

Hải Băng khẽ liếc về phía Chấn Nam, trong khoảnh khắc... rồi tiếp tục ngẩng nhìn miết lên trên trần nhà, nó được chạm khắc vô cùng tinh xảo.

Kiều Như nhíu mày:

- Cô bé này...

- Không sao. Ta đã nói cô bé không phải người làm... Được rồi, em về đi, ta sẽ ăn sau...

- Dạ!... Vậy tụi em...

- Không! Mình em thôi, cô bé đó ở lại!

- Nhưng...

- Ta sẽ cho người đưa cô bé về... Đừng nói thêm nữa!

Với cái giọng nhẹ nhàng nhưng đầy quyền lực đó, Như đành cúi đầu, rồi quay người bước ra ngoài, dù không mấy vui vẻ.

- Em thấy... thoải mái không?... Đừng nhìn nữa!

Hải Băng lại liếc mắt nhìn người con trai ấy, bình thản và lặng yên. Chấn Nam dựa lưng vào ghế, vẫn nhìn chăm chăm vào đôi mắt đó, lạnh và trong veo.

- Lại gần đây!... Mệnh lệnh!

Chân bước đến nhưng mắt lơ đễnh nhìn phía khác, có lẽ cô bé cũng biết người con trai kia đang nhìn mình không dứt.

- Em... ghét ta sao?

Cô bé khẽ lắc đầu.

- Em sẽ ở đây, không phải ngày một ngày hai, nên ta hi vọng, em sẽ cảm thấy thoải mái... Ta sẽ không hỏi về quá khứ của em. Ta chỉ muốn biết... tên em...?

Một thoáng im lặng, Chấn Nam bỗng ngồi thẳng dậy, với lấy cây bút và mảnh giấy. Cậu viết lên rồi đẩy lại trước mặt cô bé kia. Băng liếc nhìn tờ giấy ngắn gọn: “Chấn Nam - mười chín tuổi.”

Một chốc... cô bé cũng với lấy cây bút, cúi người viết gì đó thật chậm. Chấn Nam kéo mảnh giấy lại, cũng ngắn gọn... “Hải Băng- mười bốn tuổi”. Chấn Nam khẽ mỉm cười.

- Tên em đẹp như... em vậy. Cảm giác... thật lạnh...

- ...

- Em không phải người làm nhưng ta muốn em ở cùng họ... sẽ dễ chịu và đỡ buồn hơn... Mọi người... đều tốt phải không?...

- ...

- Ta rất bận... Không thường xuyên đến gặp em được. Nhưng nếu thấy buồn... hãy đến phòng ta.

- ...

- Em... không muốn mở lời... hay... không thích nói chuyện với ta?

Băng vẫn câm lặng, cũng không nhìn vào người con trai đối diện. Đôi mắt vẫn vô cảm nhìn chỗ khác. Nhưng thực sự, có gì đó đang le lói trong tim cô bé... Giữa căn phòng lặng yên và rộng thênh... chỉ có ánh đèn vàng tỏa ra nơi bàn đọc... chỉ một người con trai đang ngồi đó... và giọng nói trầm... thật ấm...

Chấn Nam từ từ cúi xuống, gối đầu lên bàn tay đặt trên quyên sách dày... Cậu nhắm nghiền mắt lại...

- Lúc này... ta hơi mệt và thật... chẳng muốn nói thêm gì với người không thèm trả lời ta... Em... có thể đi...

Hải Băng quay người, chậm rãi bước, không thấy có lỗi dù đã để người con trai ấy độc thoại.

***

Người quản lý của Chấn Nam từ đâu đó bước ra, ngay khi Hải Băng bước chân ra khỏi phòng.

- Quan tâm tới con bé đó không phải ý hay! Cậu chủ!

Chấn Nam vẫn gục đầu dưới bàn.

- Đi theo và đưa cô bé về tận nơi. Ta không muốn tranh cãi lúc vày.

- Ý định của ông chủ rõ ràng rồi. Cậu chủ biết thân với con bé đó sẽ bất lợi thế nào. Chính cậu cả cũng...

- Thôi đi!

Người quản lý quay đi, thở dài một tiếng rồi bước ra khỏi phòng. Cậu ta chạy theo đường về khu A, mắt ráo riết lần theo dấu cô bé kì lạ mới đến. Và cậu giật mình khi tìm ra, cô bé đã đi đúng đường về, chỉ cần rẽ qua một hành lang nữa là đến phòng ăn. Cô bé, chân vẫn đều đều bước, mái tóc dài đưa nhè nhẹ qua mỗi bước chân.

- Được cậu ba quan tâm cũng đừng có kiêu ngạo thế!

Hải Băng chợt dừng chân,một dây thần kinh nào đó vừa phát tín hiệu.

- Ít nhất cũng nên trả lời khi cậu ba nói chuyện, không đến nỗi... nhóc bị câm phải không?

Hải Băng từ từ quay đầu lại, từ từ ngước cánh mắt về phía quản lý của Chấn Nam. Cái nhìn đó làm quản lý chợt khựng lại, những ngón tay như muốn tê dại:

- Lắng nghe... cũng là... đối thoại!

Vẫn cái cách chậm rãi và khẽ khàng ấy, mỗi tiếng cô bé thốt ra làm người quản lý cảm giác như có dòng điện nhẹ chạy qua mỗi đốt tay. Đôi mắt cậu nhìn không chớp... và phải mất một lúc các giác quan mới định thần lại được...

...

Hải Băng về khu A. Mở cách cửa phòng bếp, hơn hai mươi người giúp việc đang ăn trưa vui vẻ quanh một chiếc bàn dài. Cô quản gia ngồi ngay ghế đầu. Hải Băng bước vào, mọi người chợt im bặt, ánh mắt dồn về phía Kiều Như.

- Lại đây ăn cơm cùng đi! - Như lên tiếng làm rất nhìu con mắt trợn tròn...

Hải Băng bước lại gần.

Phặc... cheng... eng...

Kiều Như hất tay, bát cơm đây nguyên văn xuống đất, đổ tung tóe. Hải Băng dừng chân.

- Xin lỗi. Nhưng bàn ăn hết chỗ rồi. Em ngồi tạm xuống dưới sàn ăn cùng mọi người nhé!

Mấy cô giúp việc khúc khích cười. Thụy An ái ngại cúi xuống ăn tiếp. Hải Băng vẫn đứng đó, măt nhìn cô quản gia, bình thản, không có ý chống đối hay phục tùng.

- Sao? Chê cơm chay à? - Kiều Như tiếp tục hất tay vứt phăng đống xương mới ăn xuống đất. - Thế này chắc được rồi chứ? Ở nhà này, cho chó ăn cùng phòng với chủ là cưng chiều quá rồi.

Mấy người giúp việc tiếp tục ăn, nhìn nhau khoái trá. Kiều Như mỉm cười ‘thân thiện’ quay sang nhìn Hải Băng.

- Không ăn sao? Thì ra chó không hiểu tiếng người.

Có tiếng cười to hơn phát ra... Hải Băng vẫn chẳng tỏ vẻ như mình bị xúc phạm, dửng dưng quay đi...

Mặt cô quản gia tối sầm lại...

- Đứng đó! Không ăn thì quay lai mà nhìn bọn tao ăn. Mày có tin mày bước thêm bước nữa tao sẽ chặt chân mày không? Cả con bạn lắm mồm cùng giường với mày nữa!

Thụy An suýt nghẹn họng, ngẩng lên nhìn cô bạn. Băng từ từ quay lại... và đứng đó cho đến khi bữa trưa kết thúc. Kiều Như ăn với một tậm trang hoan hỉ vô cùng.

...

- Mày muốn chết với chị Như à?

- Sao lần nào tao cũng phải làm việc nguy hiểm này?

- Đi mà kêu với chị Như ấy. Mà mày chỉ cần chạy ù vào đặt khay lên bàn rồi chạy ù ra.

- Còn hơn phòng chứa xác!

- Cứ để chị Như biết qua một giờ rồi mà chưa đem đồ ăn đến cho cậu hai xem, mày có bị xé xác không?

- Tao biết rồi. Đi đây! À, tao không phải dọn đồ đấy!

Chị Như bảo đứa nào không ăn cơm thì đứa đó dọn thôi.

- Ồ... vui... con bé đó gặp nạn rùi... ha ha...

...

Cô giúp việc mở cửa phòng 101, rón rén bước vào. Chỉ có ánh đèn mờ nhạt của đèn tường, khắp nơi bao trùm một màu đen cửa đêm tối. Chủ nhân thường ở-đâu-đó trong căn phòng, không ai biết, thoắt ẩn thoắt hiện như hồn ma. Cô giúp việc đặt khay đồ ăn lên bàn, quay người... Một bóng người bước ra từ bóng đêm, cao, phải, rất cao.

- Chúc cậu hai ngon miệng. - Cô ta cúi gập người lặp lại như con rối - Chúc cậu hai ngon miệng! - Rồi cô ù té chạy luôn, hai chân như dính vào nhau.

Chấn Phong ngồi lên thành cửa sổ, lưng dựa tường. Đôi mắt vô hồn nhìn đâu đó rất xa, tai vẫn đeo Mp3, thói quen thường thấy và bất biến. Cậu không để ý hoặc cố tình không đưa thông tin vào bộ não bất kể một điều gì xảy ra xung quanh...',
	1
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Ván bài lật ngửa',
	0,
	N'Trong ngày toàn thắng vĩ đại 30 tháng 4 nǎm 1975 kết thúc quá trình phấn đấu lâu dài của dân tộc có phần hy sinh đóng góp thầm lặng của những chiến sĩ tình báo. Mặt trận mà họ chiến đấu hầu hết không nổ súng, lại là nơi thử thách nghiêm khắc nhất bộ thần kinh cùng các đòi hỏi cao lòng dũng cảm, trí thông minh, sự nhạy bén.\n\nVán bài lật ngửa phản ánh một trong vô số khía cạnh phong phú của cuộc đấu tranh giữa một thời điểm hết sức tế nhị của đất nước: sau hiệp định Genève. Câu chuyện có diễn biến nhanh, cách viết thông minh, lôi cuốn, lời thoại sắc sảo, Ván bài lật ngửa vừa tái hiện một cách sống động lịch sử, đồng thời mang lịch sử đến với người đọc một cách tinh tế, chân thực, gần gũi.\n\nVới Ván bài lật ngửa, nhà văn Nguyễn Trương Thiên Lý không chỉ mô tả lịch sử “chính thống” ở cái bề nổi của nó, mà đi sâu khám phá cuộc sống muôn vẻ, sinh động diễn tiến bên dưới, cho chúng ta một cái nhìn bao quát mà chi tiết về cuộc đấu tranh ngầm nhưng không kém phần gay go, quyết liệt, góp phần làm nên thắng lợi chung.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/van-bai-lat-ngua-tap.jpg?itok=OT6KO68V',
	N'CON NUÔI CỦA GIÁM MỤC

Khẩu mắc-xim(1) trên miarađo(2) vẫn tiếp tục nhả đạn. Từ cao, giọng ục ục của nó càng hách dịch, lấn át tiếng nổ rộ thật căng của hàng trăm súng trường, tiểu và trung liên khác. Giữa đêm tối, đạn của nó vạch một đường đỏ ối, xắt khu trung tâm khỏi vòng ngoài đồn đã bị quân ta tràn ngập. Cũng từ miarađo, thỉnh thoảng một quả lựu đạn O.F nụ xòe sáng rực lao xuống vùng bóng đen và tiếp liền tiếng nổ “oành” thách thức.

(1) Một loại đại liên

(2) Một loại tháp canh lô cốt

Luân xem đồng hồ tay: 1 giờ 25 phút. Trận đánh đã kéo dài hơn tiếng đồng hồ rồi. Tiểu đoàn chủ lực của anh – tiểu đoàn 420 – nhận nhiệm vụ hạ đồn Biện Tạ trong chiến dịch giải phóng tuyến kinh Phụng Hiệp. Đồn Biện Tạ phụ trách hệ phòng thủ nam huyện lị, là căn cứ cấp đại đội mạnh nhất. Khu đồn chia làm ba cụm lô cốt, giữa có một đồn xây đá. Một trung đội Âu Phi thủ nơi xung yếu nhất, ba trung đội BVN(3) thủ ba cụm lô cốt. Chỉ năm phút sau khi bộc phá mở rào, tiểu đoàn 420 đã làm chủ ba cụm lô cốt. Nhưng tiểu đoàn không thể tiếp cận bọn Âu Phi chỉ vì cái miarađo quái ác kia.

(3) Bataillon Việt Nam - Tiểu đoàn Việt Nam (thuộc Liên hiệp Pháp).

[Chúc bạn đọc sách vui vẻ tại www.gacsach.com - gác nhỏ cho người yêu sách.]

Những cáng thương binh ì ọp lội trên ruộng – mùa khô bắt đầu hơn tháng nay, song đám ruộng quanh đồn Biện Tạ lọt vào chỗ trũng, vẫn còn sình nhão. Mỗi lần cáng thương binh qua mặt anh, Luân xốn xang như nằm trên ổ kiển lửa.

Tiếng súng quanh đây, có vẻ đã ngưng. Nghĩa là các đơn vị địa phương đã thu xếp gọn hàng chục đồn và lô cốt lẻ. Trong khi đó, “anh Hai 420” chưa “tính sổ” xong đồn Biện Tạ.

Luân liếc chừng Vũ Thượng. Ánh sáng của hỏa khí từng chặp lóe lên gương mặt người chính trị viên – hàm anh nổi vồng. Nhưng tại sở chỉ huy trận đánh hôm nay còn có một nhân vật cao hơn: Lưu Khánh. Ông mang cấp chức Liên trung đoàn phó, đặc phái viên của Bộ tư lệnh phân liên khu.

Lưu Khánh ngồi bẹp phía sau một công sự đất, mùi bùn nực mũi. Quanh ông, máy ragônô quay nặng nề, ma-níp của hiệu thính viên gõ liên hồi. Cằm vuông, râu cạo nhẵn nhưng vẫn để lại một vệt xanh chạy từ mang tai. Lưu Khánh nghiêm nghị giống như truyền thuyết về ông ta: cười một phần mười mép, hà tiện lời đến mức ngôn ngữ của ông chỉ quanh quẩn có: ừ, không, thôi được, hử, coi chừng…

- Anh Sáu ơi!

Rốt cuộc rồi Luân phải cất tiếng:

- Cái gì? - Lưu Khánh không rời cái miarađo, hỏi cộc lốc.

- Cho tôi vô… - Luân cũng dè sẻn lời nói.

- Chi?

- Buộc khẩu 13,2 im…

- Được không?

- Được!

Lưu Khánh gọi:

- Sa đâu?

Từ bờ mẫu, một chú bé chừng mười bốn, mười lăm tuổi trả lời:

- Em đây!

- Chú theo anh Bảy… đến bờ rào, gặp anh Út, tiểu đoàn phó…

- Dạ.

- Không được vô trong rào.

- Dạ.

- Chú nhớ!

- Dạ.

- Đi đi!

Quyến, cán bộ truyền tin, có dáng một học trò, nhân lúc nghỉ tay, châm chọc Sa:

- Rồi anh Sáu coi, thằng Sa thông đồng với anh Bảy…

- Nó vô trại, kỉ luật! – Lưu Khánh lạnh lùng.

- Anh Quyến phá em đó. – Sa xịu mặt.

- Để coi… - Vũ Thượng giậm dọa thêm.

*

… Luân và Sa trườn sát mặt ruộng. Chốc chốc một viên cối cỡ 60 li mồ côi, một viên mọt-ta bay xè xè, ghé hoặc trước hoặc bên hông họ, miểng văng rào rào.

Sa trườn vài thước lại nhìn Luân.

- Anh Bảy…

- Cái gì?

- Tới rào thôi, nghen…

- Ừ...

Sa về tiểu đoàn chưa được bao lâu. Đang học trường trung học Tiền Phong, cậu giãy nảy, nhất định đòi đi lính. Ban giám đốc trường chịu thua cái nước lì của Sa, gửi cậu đến tiểu đoàn. Ngay từ ngày đầu, Sa được gọi lên Ban chỉ huy. Tiểu đoàn trưởng ngắm nghía cậu một lúc, quyết định giữ cậu làm liên lạc riêng cho ông ta. Sa thối chí. Cậu xin đi lính đâu phải mong núp bóng ông tiểu đoàn trưởng? Rời văn phòng tiểu đoàn về chỗ nghỉ, Sa lầm bầm mãi. Điệu này phải làm đơn gửi lên khu mới xong. Sa hỏi han, biết tiểu đoàn trưởng tên Bảy Luân, thuộc loại “xung phong trước lính.” Giữa lúc Sa rầu rĩ thì có lệnh gọi: Sửa soạn đi “công tác” với anh Bảy.

- Ối, thì cũng “cơm nước, trà lá” vậy thôi…

Sa từng biết vai trò của các “tiểu đồng” theo “phò” các chỉ huy. Bởi vậy, cậu uể oải xuống nhà bếp xin đường, trà…

- Không có! – Trưởng quản trị tiểu đoàn xua tay đuổi Sa.

- Thằng nhỏ này ghiền trà tới giấc rồi! – Anh ta còn ném theo Sa một câu nhận xét độc địa.

- Tôi mà ghiền! Tôi xin cho tiểu đoàn trưởng đó.

Sa quay lại nghinh anh quản trị.

- Tiểu đoàn trưởng đâu biết uống trà, đừng có xạo!

Quản trị trưởng ong óng. Sa không tin lời anh ta.

Tưởng tiểu đoàn trưởng đi công tác rần rần, rộ rộ, ai dè tổng cộng có ba “chư”: tiểu đoàn trưởng, Quyến và Sa. Quyến là trung đội phó truyền tin, song hễ có người thay ngồi ở maníp thì anh ta xung phong chèo xuồng.

Xuồng rời Biển Bạch, xuôi Sông Đốc. Lợi dụng gió thuận, họ cắm trước mũi xuồng hai tàu dừa nước thay buồm. Xuồng lao vun vút. Sụp tối, họ ghé Xóm Sở.

- Chú Quyến vo gạo, chú Sa nhúm lửa…

Luân phân công cho hai người. Anh xách cần câu ra ruộng.

Họ không vào nhà dân mà nấu nướng ngay ở bờ sông. Luân mang về cả chục con cá lóc. Bữa cơm rất tươm tất.

Sa bắt đầu thích tiểu đoàn trưởng. Cậu đã tin lời quản trị trưởng: Tiểu đoàn trưởng không trà lá gì ráo.

Đêm đó, họ theo Rạch Rập, nép sát thị trấn Cà Mau, vòng qua kinh xáng Đội Cường.

Hai hôm sau, trận Đầu Gừa nổ ra. Luân trực tiếp nắm một đại đội và đại đội đã chiếm cái bót nằm giữa Cà Mau – Tắc Vân chỉ tốn không quá mười phút. Trong trận, Sa thiếu điều xỉu vì phải bám sát tiểu đoàn trưởng giữa lưới đạn đan chéo, có viên quạt rát da mặt.

Từ hôm đó, Sa dự đến năm sáu trận. Bây giờ có ai hỏi “làm liên lạc khoái không” thì cậu cười nhe chiếc răng lòi xỉ:

- Nhất trần đời!

*

… Gần tới rào, bỗng Luân nằm lại. Sa sợ ‎quýnh:

- “Bị” rồi hả anh Bảy?

Luân không trả lời, một loáng sau anh trườn ngang Sa. Té ra anh cởi hết quần áo, chỉ giữ khẩu “Côn” nơi bụng. Tác người nhỏ thó, da hơi ngăm, Luân tiệp với màu trời.

Khẩu mắc-xim “ục ục” tiếp từng ba viên một.

- Thằng Tây nào bắn khá quá! – Luân nhận xét.

Tiểu đoàn phó – một người cao lêu nghêu, anh đi khom mà y người ta sổng lưng – tóm tắt tình huống trận đánh: diệt và bắt sống ba trung đội ngụy, nhưng chưa biết phải “xử” cái đồn giữa ra sao.

- Được!

Luân nói thật gọn. Rồi anh vọt qua rào đang ngún khói. Sa muốn níu anh lại song không kịp. Thật tình, Sa chẳng ưa gì phải nằm với Luân tận ngoài rào.

Luân đã ngồi vào cửa lô cốt – bên trong, vài chục lính ngụy tay đặt lên ót, im re, nhìn Luân với nỗi kinh ngạc – hình như có tên cố nén cười nữa. Luân chẳng để ý đến bọn lính, anh ngắm nghía cái miarađô nổi bật trên nền trời trong vắt đầy sao.

- Cho tôi một khẩu VB(4)… - Luân bảo.

(4) Một loại súng phóng lựu.

Người ta chuyển đến anh khẩu súng mút, mấy quả trômblông. Anh gắn quả trômblông vào quặng ở đầu súng, giương súng ngắm miarađo, lấy cự li.

Sa vừa theo dõi tiểu đoàn trưởng, vừa liếc đám tù binh, có vẻ như muốn nói: các người thấy tiểu đoàn trưởng của tôi không?

- Tất cả nép kín phía trong tường!

Ra lệnh dứt, Luân bấm cò. Quả trômblông phóng lên không trung, giống cái đuôi sao chổi. Nó rơi ngay nóc miarađo, một tiếng nổ không lớn lắm và liền sau đó, khẩu mắc-xim câm họng.

Luân bắn thẳng quả trômblông thứ hai vào cửa đồn. Số phận đồn Biện Tạ được kết thúc.

Một số tù binh ngụy, dù lệnh buộc phải đặt tay lên ót vẫn chồm ra ngoài nhìn cái miarađo chìm trong ánh lửa, miệng không ngớt hít hà thán phục tài bắn của viên chỉ huy Việt Minh mà mắt thì vẫn cười cười.

Khi quân ta hò reo xông vào đồn, Luân mới hiểu tại sao họ cười: anh trần truồng, chiếc quần quấn cổ.

P1 - Chương 2

Luân và Vũ Thượng ngồi mãi trước tấm bản đồ trải trên đệm. Sau lưng họ, cán bộ tham mưu, chính trị, các đại đội trưởng, tất cả đều chờ đợi ý kiến của ban chỉ huy. Chẳng là Bộ tư lệnh quyết định mở chiến dịch lớn, phối hợp với chiến trường chính Điện Biên Phủ. Tiểu đoàn 420 được phân công thanh toán các đồn nằm giữa Phụng Hiệp và Cái Răng. Cục diện Đông Xuân năm nay thuận lợi hơn bất kì năm nào trước đây. Toàn bộ lực lượng tinh nhuệ của Pháp co cụm về quanh các thành phố lớn, một số phải dự cuộc hành quân Atlăng(1), một số phải tiếp ứng cho Bắc Bộ, giữ miền Tây Nam Bộ chủ yếu là các tiểu đoàn ngụy mới thành lập. Ta có khả năng dẫy hàng mảng đồn bót, giải phóng hằng khu vực rộng.

(1) Pháp mở chiến dịch Atlan ở Tuy Hòa

Đã quá giờ ăn – tu huýt thổi hai lần rồi – mà chưa ai chịu rời bản đồ.

- Trong tuyến này, tổng cộng mười sáu đồn và lô cốt. Nếu ta đánh bứt đồn Nhà Thờ thì cả tuyến sẽ rã. Cho nên, tôi đề nghị trinh sát liền đồn Nhà Thờ, có thể cường tập, có thể chặn chúng khi chúng ra khỏi đồn, có thể kì tập… Hóa trang kín dưới ghe chở cá, bất thần xung phong… - Luân gợi ý các phương án.

- Nếu kì tập, chính anh giành đi theo ghe, phải không?

Vũ Thượng cười. Mọi người cười theo. Sa và Quyến ngồi ở nhà bếp cũng ngó nhau cười. Vũ Thượng đoán trúng quá.

- Thì… - Luân ấp úng. Sự bẽn lẽn của anh càng khiến mọi người cười to hơn.

- Báo cáo, có điện khẩn.

Đồng chí cơ yếu hấp tấp bước qua sân, đứng nghiêm. Vũ Thượng nhận điện, đọc vội rồi trao cho Luân.

- Bộ Tư lện gọi anh – Vũ Thượng bảo.

- Không phải Bộ tư lệnh. Anh Dương Quốc Chính điện, song bảo “đến chỗ anh Sáu Ú”… tức là đến Trung ương cục…

- Chắc các anh muốn căn dặn điều gì đó… - Vũ Thượng xem lại điện.

- Cha!... - Luân tắc lưỡi – Đang triển khai mà…

- Đi một ngày một đêm là tới Bờ Đập. Làm việc xong, quay về, trinh sát cũng chưa báo cáo kịp với anh đâu… Cứ yên trí mà đi – Vũ Thượng xếp bản đồ nói.

- Vậy các đồng chí tham mưu chính trị ở nhà trao đổi thêm kế hoạch. Các đại đội cho lính nghỉ ngơi lấy sức, trinh sát nắm tình hình khu vực được phân công. Ở Cần Thơ, Sóc Trăng tụi nó còn mấy tiểu đoàn BVN vừa huấn luyện xong, một trung đoàn Âu Phi quân số thiếu… Cho nên, các đồng chí phải tính đến nhiều tính huống. đánh ven lộ, chú ý pháo. Cụm pháo 105 Phụng Hiệp gần đây thêm ba khẩu 155. Các đồn đều nhận thêm cối… Đó là khí tài của chiến tranh Triều Tiên, Mỹ viện trợ cho Pháp.

Khi các cán bộ rời sở chỉ huy, Luân than thở với Vũ Thượng:

- Tôi ngại ông Lưu Khánh rút 420 về bảo vệ Trung ương cục quá!

Vũ Thượng lắc đầu:

- Không có lí... Đang tập trung lực lượng ra phía trước mà!

- Tôi mang theo tất cả bản đồ. Biết đâu các anh lại quyết định đưa 420 lên Long Tuyền, Nhơn Ái, hoặc xa hơn, đưa hẳn lên Long Châu Hậu(2).

Luân phấn khởi trở lại. vài phút sau anh đã ngồi xuống chiếc tam bản cà rèm. Sa và Quyến ướm thử quai chèo. Chiếc tam bản rời bến, phóng đi…

(2) Một tỉnh cũ thời kháng chiến chống Pháp, gần phần hữu ngạn sông Hậu của Long Xuyên và Châu Đốc

P1- Chương 3

Luân bắt tay anh Tư thật chặt. Đã hơn tám năm Luân mới gặp lại anh Tư. So với hồi đó, anh Tư mập hơn đôi chút, song da vẫn ủng, mắt thâm quầng và nhất là vẫn ho khúc khắc.

Hai người hỏi thăm nhau vài câu rồi Luân xin phép được làm việc. Nhìn số cán bộ ngồi chật nhà bên, Luân biết sáng nay, anh Tư còn tiếp có lẽ cả chục khách nữa là ít. Trải tấm bản đồ vùng Phụng Hiệp lên bàn, Luân cầm bút chì, chỉ vào hướng 420 sẽ tấn công.

- Thưa anh, đây là đường xe Phụng Hiệp – Cần Thơ…

- Nhưng hôm nay tôi gặp anh để bàn chuyện khác! – Anh Tư ngăn Luân.

Luân sững sờ. Anh Tư tươi cười:

- Chuyện khác quan trọng hơn chuyện giải phóng tuyến Phụng Hiệp… Anh đọc điện này sẽ rõ.

Bức điện thượng khẩn và tuyệt mật của Trung ương Đảng.

“Quyết tâm của Trung ương diệt chủ lực địch ở Điện Biên Phủ. Các chiến trường cần khẩn trương phối hợp. Sau thắng lợi lớn này, tình hình chính trị có thể có đột biến.”

*

Luân gặp anh Tư lần đầu – và mãi hôm nay mới gặp lại – đúng vào lúc Nam Bộ kháng chiến mở màn.

Dựa vào quân Anh – chiêu bài của chúng là thay mặt cho Đồng minh giải giới quân đội Nhật ở Nam Đông Dương – Pháp cùng một lúc chiếm trụ sở Ủy ban nhân dân Nam Bộ, Tòa đốc lí, Sở công an. Nhật ngầm tiếp tay Pháp, vũ trang cho chúng. Tình hình nói chung là bất lợi đối với ta – vừa giành chính quyền xong, chưa kịp tổ chức lực lượng, thiếu vũ khí.

Dưới ánh đèn dầu mờ mờ trong một căn nhà lọt giữa xóm lao động bên kia Cầu Bông, anh Tư truyền đạt các chỉ thị khẩn cấp của Thành ủy. Luân chưa hiểu anh Tư là ai. Dong dỏng cao, da trắng bệt, mắt trõm, thỉnh thoảng ôm ngực nén cơn ho cơ hồ xé phổi, lại luôn cười đôn hậu, nói không văn vẻ - hơi lộn xộn nữa – nhưng dễ hiểu, anh đã gieo ấn tượng mạnh trong Luân qua phong thái ung dung giữa bốn hướng súng nổ rộ.

Luân là một trong những người hăng hái nhất hôm đó. Anh không để ý lắm các phân tích tình hình của anh Tư.

- Theo tôi, cái cần nhất hiện giờ là súng. Xin cho súng. Có súng, chúng tôi tự biết liền cách đánh!

Luân đặt vấn đề bốp chát như vậy.

Anh Tư nhìn Luân, vẫn tươi cười:

- Anh bạn! Nếu chúng ta có đủ súng thì hà tất phải ngồi đây bàn với nhau cả buổi trời. “Cho tôi một điểm tựa, tôi sẽ bẩy quả đất cho mà xem.” Hình như câu nói đó của Acsimet(1). “Cho tôi súng, tôi sẽ rượt bọn Gra-xi(2) chạy vắt giò lên cổ cho mà xem.” Đến lượt anh bạn, Acsimet thời nay!

(1) Archimède, nhà thông thái thời cổ đại (287 - 212 trước công nguyên).

(2) Gracey, tư lệnh quân đội Anh.

Đối với Luân, cuộc nói chuyện không lấy gì làm thú vị. Tuy vậy, sau đó, anh được phái ra Hà Nội và trở về Nam với một chuyến xe lửa đầy súng đạn. Rồi anh quay ra Hà Nội. Lần sau, chuyến xe lửa đầy vũ khí phải dừng lại Quảng Ngãi – đường phía trong đã bị Pháp chiếm. Thế là Luân chuyển vũ khí bằng thuyền. Anh công tác ở Phòng liên lạc miền Nam năm 1947.

*

Là một kĩ sư vừa tốt nghiệp, Luân mang tật cao ngạo của số đông trí thức lúc bấy giờ. Suốt thời gian học đại học, Luân ít giao du. Với anh, kiến thức và chỉ kiến thức là cái đang thu thập. Bởi vậy, mặc dù quanh anh không khí chính trị sôi sục, Luân vẫn cắm đầu học. Nhật đã đổ bộ vào Đông Dương, chiến tranh thế giới và Thái Bình Dương càng lúc càng gay gắt, Luân chỉ nghe mà không hề tỏ thái độ. Ngoài sách chuyên môn – anh theo ngành canh nông – anh giải trí bằng truyện trinh thám, món giải trí đến với anh từ lúc anh còn ở bậc trung học trường Chasseloup Laubat. Về thể thao, anh chơi quần vợt – chơi khá giỏi.

Sinh trưởng trong một gia đình hội tụ gần như đủ tất cả các điều kiện để được gọi là “thượng lưu” – trí thức, Pháp tịch, đạo Thiên Chúa – Luân, Robert Nguyễn Thành Luân, lại thích lối sống khắc khổ. Có thể anh là con áp út – về con trai anh là út – phải ở với bà nội và học tiểu học tại tỉnh lẻ, cho nên Luân gần gũi hơn so với các anh chị, nếp sinh hoạt nông thôn.

Luân là người duy nhất trong gia đình không đỗ đạt bên Pháp. Sự lựa chọn ngành của anh hoàn toàn là một cử chỉ hiếu đễ: bà nội anh thích trồng trọt. Còn nói về nguyện vọng riêng, chính anh mơ ước trở thành một nhà trinh thám tư – một ngành thực tế không có chỗ dùng ở Việt Nam.

Cần nói thêm cho thật chính xác: anh không sang Pháp vì khi anh đậu tú tài, đường sang Pháp bị chiến tranh làm gián đoạn.

Nhận xong bằng kĩ sư – lễ phát bằng uể oải như guồng máy chạy cầm chừng của nhà nước Pháp ở Đông Dương. Luân về Nam. Chính trên chuyến xe lửa chỉ thì thụt ban đêm và kéo khá dài ngày đó, Luân bắt đầu thay đổi cách suy nghĩ.

Tình cờ một bạn học nằm chung “cút-sết”(3) với anh, anh bạn học này tên là Quý, quê Nam Định, sinh viên ngành y, sống chung với anh nhiều năm ở Đông Dương học xá. Bỗng một dạo, Quý bỏ học. Tin đồn đại trong bạn học: Quý lên chiến khu, theo ông Võ Nguyên Giáp. Khi Luân ra Hà Nội, ông Võ Nguyên Giáp không còn dạy trường Thăng Long, ngôi trường nổi tiếng ở phố Ngõ Trạm, xong tên ông Giáp thì nghe bạn học rỉ tai, đầy thán phục.

(3) Couchette: toa có giường ngủ.

Xe vào đến ga Đò Lèn, Quý mới có mặt trong toa. Gặp Luân, Quý hơi lúng túng. Nghĩa là Quý mua vé đi từ Hà Nội mà không lên xe tại ga Hàng Cỏ. Có lẽ tính toán khá lâu, sau cùng Quý nói thẳng với Luân.

Đúng như tin đồn đãi, Quý lên Tuyên Quang, dự lớp quân chính, cùng nhiều học sinh sinh viên khác. Bây giờ. Quý vào Nam, liên lạc với Việt Minh trong đó. Quý kể nhiều chuyện chiến khu, Luân thích nghe đến nỗi, khi xe đỗ lại tránh máy bay ban ngày – thường giữa vùng rừng núi quạnh quẽ - anh cũng không rời Quý một bước.

Tới Sài Gòn, Luân trình diện tại Sở canh nông. Giám đốc sở vẫn là người Pháp. Lão Tây thất thế rầu rầu nhìn Luân. Ngồi dưới ảnh Quốc trưởng Pétain mà có vẻ lão vểnh tai ngóng tiếng nói của De Gaulle. Còn phó giám đốc đã là một người Việt. Ông ta đỗ bằng kĩ sư nông học bên Pháp – từ thuở kĩ sư nông học còn gọi là Bác vật canh nông – làm phó giám đốc vì đại sứ Nhật muốn như vậy. Thực ra, ông ta chưa hề biết đồng ruộng Việt Nam ra sao. Gặp Luân, ông ta không nói gì về trồng trọt mà thao thao hằng mấy giờ liền về thuyết “Đại Đông Á,” về đề quốc hùng cường Đại Nippon dẫn đạo các dân tộc da vàng. Phó giám đốc ân cần mời mọc Luân viết báo Tân Á(4). Cuộc tháo chạy khỏi Phi Luật Tân, Miến Điện, Nam Dương của quân Nhật… được ông giải thích như là hoàn toàn “mưu mẹo,” y hệt ông ta là hãng Domei(5). Ông ta hé cho Luân biết chẳng bao lâu nữa, Trần Trọng Kim sẽ lập Chính phủ - Chính phủ Việt Nam độc lập – và ông ta sẽ giữ một ghế bộ trưởng…

(4) Tờ báo thân Nhật.

(5) Hãng thông tấn chính thức của Nhật.

Luân chỉ đến sở một lần đó. Anh đi hẳn với Quý. Hai người lội tới lội lui vùng rừng Trị An. Quý đã liên lạc được với Kì bộ Việt Minh. Luân giúp Quý tìm vũ khí. Rất khó, song họ cũng mua được vài khẩu súng lửa.

Người anh thứ năm của Luân là luật gia Jean Nguyễn Thành Luân. Vợ của Jean cũng là một Tiến sĩ Luật, thuộc giọng họ lớn ở Bạc Liêu: dòng họ Trần. Cả hai liên hệ với nhóm trí thức yêu nước và thiên tả lúc bấy giờ: Phạm Ngọc Thạch, Huỳnh Tấn Phát, Nguyễn Văn Thủ…

Jean nhiều lần khuyên Robert tiếp xúc với các trí thức đó – họ làm việc dưới sự lãnh đạo của các đảng viên Cộng sản đệ tam. Robert từ chối. Jean lo ngại vì trong trí thức Sài Gòn còn các nhóm khác mà khuynh hướng khá phức tạp: nhóm Tạ Thu Thâu, nhóm Hồ Vĩnh Kí, nhóm Nguyễn Văn Thinh, nhóm Hồ Văn Ngà – kẻ thì của đệ tứ Trôtkit, kẻ thì của phòng nhì Pháp, kẻ thì thân Nhật. Jean chỉ hết lo ngại khi bắt gặp Robert đọc “Tuyên ngôn của Đảng Cộng sản,” với vô số gạch dưới bằng bút chì đỏ.

*

Rồi Luân cũng hiểu được anh Tư là ai. Có lẽ trừ gốc đạo Thiên Chúa, anh Tư giống Luân về nhiều mặt, thậm chí còn trội hơn nữa. Dân Tây – anh Tư tên là François, vứt bỏ cái một quốc tịch Pháp lẫn vị trí cai trị đầu sỏ, đi dạy học kiếm cơm như những thầy giáo “Annamit” chỉ có bằng sơ học, viết báo chống lại chính quyền Pháp, vào tù ra khám. Là ủy viên ủy ban quân sự khởi nghĩa Nam Kỳ năm 1940, anh Tư bị truy nã, bị bắt, bị tra tấn và bị kết án tử hình. Nếu không phải là công dân Pháp và nếu không có chiến tranh – đường liên lạc từ Đông Dương về Pháp nghẽn, bản án của tòa đại hình Sài Gòn không được Giám quốc(6) Pháp thông qua, đây là luật lệ dành cho các bản án đối với công dân Pháp – thì anh Tư bị điệu ra trường bắn từ lâu rồi.

Luân tìm thấy nhiều điều li kì trong việc anh Tư vượt ngục: một ngày tháng 3 năm 1945, buổi sáng, còi báo động. Trong “xen-luyn”(7) tử hình, anh Tư chỉ biết cuộc oanh tạc của Anh – Mỹ khi chỗ nằm anh bỗng rung rinh dữ dội cùng với một tiếng nổ điếc tai. Anh không trông thấy gì cả. Khói trùm kín khu khám lớn, cửa “xen-luyn” của anh đổ kềnh. Lập tức, anh Tư trút bỏ quần áo tù, mặc độc chiếc quần xà lỏn, vụt nhảy khỏi khám. Anh lao đến đúng nơi bom rơi sạt bức tường cao vọi và chỉ một cái lách mình, anh đã ở ngoài đường Lagrandiere. Hai hôm sau, thân thể còn da bọc xương, phổi nhức nhối, anh Tư chủ trì cuộc họp cán bộ với cương vị bí thư Thành ủy vừa được chỉ định.

(6) Tương tự như chức Tổng thống ngày nay.

(7) Cellule: khám nhỏ nhốt trọng phạm.

Và hôm nay, men con rạch Bờ Đập êm ả, Luân lắng nghe anh Tư không để sót một chi tiết. Luân định nhắc lại để xin lỗi chuyện hơn tám năm trước. Song anh thôi. Chưa chắc một người như anh Tư còn có thể nhớ những thứ ấy. Luân biết rằng anh Tư đang là Ủy viên Trung ương Đảng, Thường vụ Trung ương Cục. Luân còn biết thêm: vài ngày nữa anh Tư sẽ nhận nhiệm vụ Bí thư Đặc ủy khu Sài Gòn – Gia Định, một chiến trường sôi động trong buổi tiếp giáp chiến tranh và hòa bình…
- Anh còn giữ mấy bức thư của Ngô Đình Thục không?

Câu chuyện bỗng nhiên trầm trầm. Luân tiếp nhận quyết định của Đảng với một thái độ rõ ràng là miễn cưỡng. Các trận đánh sắp tới quanh Cần Thơ hoặc phía bắc lộ Cái Sắn vẫn ám ảnh anh. Từ lúc rời cơ quan mật vụ Nam Bộ, trực tiếp cầm quân ở cấp tiểu đoàn, Luân dự hàng trăm trận đánh, song không phải lúc nào anh cũng thắng. Các đơn vị của Pháp từng cho anh nếm mùi đau khổ, khi ở Vĩnh Trà Bến(1), khi ở Long Châu Hà, khi ở Rạch Giá. Cho nên, Luân đã dành tất cả thời gian học tập nghiên cứu, điều tra các loại thực địa khác nhau, các đối tượng địch khác nhau, quyết tâm trở thành một cán bộ quân sự chuyên nghiệp. Từ 1951, tiểu đoàn 420 – với sự bổ sung chính trị viên Vũ Thượng, một cán bộ xuất thân từ thợ máy hải quân Pháp – đã trưởng thành hẳn. Chiến công của tiểu đoàn trở nên niềm hãnh diện của toàn Phân liên khu. Bên cạnh các tiểu đoàn 307, 308, 311… lẫy lừng, người ta bắt đầu kể thêm 420. Trước Đông Xuân 1953-1954, tiểu đoàn 420 làm nhiệm vụ cơ động trên một địa bàn rộng lớn. Luân được đề bạt trung đoàn phó. Tình hình dường như sửa soạn cho tiểu đoàn tung hoành. Bài hát của nhạc sĩ Quách Vũ có câu “ta thắng như chẻ tre, ta thắng như nước tràn” mấy năm trước bị phê bình là “lạc quan tếu” nay có vẻ không xa sự thật là bao nhiêu. Giữa tình thế “trăm năm có một” như vậy, cấp trên lại bàn với anh cung cách hoạt động lâu dài trong lòng địch!

(1) Tỉnh cũ thời kháng chiến chống Pháp gồm Vĩnh Long, Trà Vinh, Bến Tre

- Còn giữ… nhưng tôi không mang theo đây. Mang theo làm gì cái thứ…

Luân trả lời anh Tư, giọng vừa buồn vừa bực.

- Ý! – Anh Tư cười đôn hậu – Cái thứ đó quý lắm đa. Anh còn nhớ mỗi thư nói cái gì không?

Luân chỉ nhớ mang máng.

- Anh cứ tiếp tục công việc đang làm. Tất nhiên, anh phải để ít ra là một nửa thì giờ cho công việc sắp tới. Văn phòng chuẩn bị sẵn cho anh khá nhiều tài liệu, gồm báo cáo, báo chí, sách… Sở công an, phòng quân báo Bộ tư lệnh sẽ cung cấp cho anh các mặt tình hình. Điều anh cần giữ kĩ như nguyên tắc là không tiết lộ với bất kì ai nhiệm vụ mới của anh.

Anh Tư dặn dò thêm Luân trước khi Luân vùi đầu vào đống tài liệu trong gian nhà bên cạnh nơi làm việc của anh Tư.

Không rõ ai đó vô tình hay cố ý đặt lên bàn tờ Nhân dân miền Nam số mới nhất. Luân đọc ngấu nghiến bài kí tên Trung Thành mà Luân biết là bút danh của anh Sáu Thọ, Ủy viên Trung ương Đảng, Phó Bí thư Trung ương Cục: “… Quân địch đang bị động, đối phó với ta ở đồng bằng Bắc Bộ, Điện Biên Phủ và Trung Lào, chúng phải rút gần hết lực lượng ứng chiến tinh nhuệ ở chiến trường Nam Bộ ra các nơi đó, nên ở chiến trường Nam Bộ quân địch đang hoạt động yếu hơn trước và có rất nhiều sơ hở, tinh thần binh lính ngụy lại càng hoang mang dao động trước những chiến thắng của ta…”

*

Cái cớ mà giám mục địa phận Vĩnh Long Ngô Đình Thục viết bức thư đầu tiên cho Robert Nguyễn Thành Luân khá bình thường. Năm đó, năm 1952, kĩ sư điện René Nguyễn Thành Luân qua đời ở Paris – cả Jean và Robert đều không làm sao dự lễ tiễn đưa cha đến nơi yên nghỉ cuối cùng được. Ngay cái tin ông René Nguyễn Thành Luân mất, hai anh em đều không hay, trước khi Robert nhận được thư của giám mục.

Giám mục địa phận gửi thư chia buồn với người con của một tín đồ - và bản thân người con cũng là một tín đồ - không phải là việc gì cần bàn cãi. Hơn nữa, không ai không biết ông René Nguyễn Thành Luân có mối giao hảo cá nhân rất thân mật với người chủ chăn giáo phận – một trong những giám mục người Việt Nam ít ỏi lúc bấy giờ.

Năm Luân vào ban tú tài cũng là năm Ngô Đình Thục được phong giám mục. Ông René đưa con đến chào vị giám mục địa phận – niềm tự hào của người sùng đạo như ông. Và, giám mục đã ban phép cho Luân. Từ đó cho đến khi rời thành phố vào chiến khu, Luân vẫn thường gặp giám mục – nhất là dịp nghỉ hè.

“Cha đau buồn vô hạn khi được tin chẳng lành của người bạn thân, cụ kĩ sư René Nguyễn Thành Luân, vừa từ trần, an táng tại nghĩa trang Père-la-Chaise. Cha đã cầu nguyện cho cụ và mong con cũng cầu nguyện cho người cha thân yêu của mình về nước Chúa…”

Bức thư vắn tắt như vậy thôi.

Bức thư thứ hai, nhiều ý hơn, đến vào tháng 7 năm 1953.

“Cha mừng con được an khang trong Chúa. Cha mong mỏi một ngày gần nhất được gặp con, vừa để thăm lại đứa con của giáo phận ra đi đã tám năm, vừa han hỏi đứa con của người bạn mà cha lúc nào cũng quý mến. Con có thể cho một cái hẹn không? Cha đảm bảo tất cả an toàn và cha tin là con không hề có một chút nghi ngờ.”

Liên trung đoàn trưởng 120 – cũng là một tín đồ đạo Thiên Chúa – nói lại với Luân, ông ta cũng nhận một bức thư tương tự, dĩ nhiên hình thức là chuyện nhớ mong… vì Liên trung đoàn trưởng thuộc một gia đình đạo không phải toàn tòng. Thư của giám mục gửi cho con chiên kháng chiến tương ứng với diễn biến ở chiến trường: năm 1953, thực dân Pháp đang hấp hối.

Hai tháng sau, tháng 9 năm 1953, Luân nhận được bức thư thứ ba:

“Cuộc chém giết ngoài ý Chúa đã kéo khá dài. Như các đấng bề trên và Đức Thánh Cha hằng lo lắng, cha đêm ngày cầu mong sao máu ngừng đổ. Con là một chỉ huy, cha mong con đóng góp vào một cuộc bãi binh mà mỗi bên đều giữ được danh dự. Cha nóng lòng được gặp con đặng cha con ta bàn thảo xem con có thể làm được điều gì trong phận sự mà con gánh vác ngoài đời, chu toàn đặng trách nhiệm của một dân Chúa. Ông Savany, con biết danh tiếng của ông, sẵn sàng tạo mọi phương tiện cho con gặp cha.”

Savany là trung tá, phụ trách phòng nhì Pháp ở đồng bằng sông Cửu Long.

Và bức thư mới nhất trước trận tiểu đoàn 420 hạ đồn Biện Tạ.

“Thời cuộc xoay chuyển thiệt là mau lẹ. Theo những gì mà cha nắm được, trong một ngày không xa, ông Ngô Đình Diệm sẽ về nước chấp chính. Cha hi vọng con hiểu rõ tầm quan trọng đặc biệt của sự thay đổi nầy. Là một người tín ngưỡng Chúa, lại theo chủ nghĩa quốc gia, có mối giao thiệp thân tình với gia đình họ Ngô Đình, con cần suy tính thật kĩ và nên dứt khoát trước khi quá muộn. Sắp tới, không phải người Pháp mà là người Mỹ sát cánh với chúng ta. Con nên nhớ, nước Mỹ là nước đã ném bom nguyên tử xuống nước Nhật. Đức hồng y Spellman thường thư từ với cha. Đó là một đấng bề trên hiểu biết và rộng lượng…”

Thư của giám mục gởi cho Luân vào lúc Mỹ gần như gánh trọn toàn bộ ngân sách chiến tranh Đông Dương – ngày 30-7-1953 quốc hội Hoa Kỳ chấp thuận viện trợ quân sự cho Đông Dương tài khóa 1953-1854 là bốn trăm riệu Mỹ kim; ngày 2-9-1953 Chính phủ Hoa Kỳ lại quyết định bổ sung thêm ba trăm tám mươi lăm triệu đô la nữa. Sự viện trợ dồn dập như thế nhằm yểm trợ cho “kế hoạch Navarre” mà một trong những điều then chốt là “giao cho phía Việt Nam những phần trách nhiệm nặng nề hơn.” Bức thư cũng liên quan tới lời tuyên bố úp mở của Thủ tướng Pháp Laniel ngày 12-11-1953: “Chính phủ Pháp nghĩ rằng vấn đề Đông Dương không nhất thiết phải có giải pháp quân sự. Pháp không đòi hỏi đối phương phải đầu hàng không điều kiện. Pháp mong muốn có cuộc điều đình.”

*

Cuộc hành quân Castor mở màn, với sáu tiểu đoàn Âu Phi nhảy dù chiếm đóng Điện Biên Phủ. Đây là một canh bạc Pháp dốc túi, không chỉ để giảm đến mức có thể giảm sự thua thiệt trước các dân tộc Đông Dương mà còn hòng trả giá với chính đồng minh Mỹ.

Một René Coty nào đó, sau mười ba vòng bầu mới được quốc hội Pháp giao ghế Tổng thống. Nó cho thấy sự phân hóa sâu sắc trong giới cầm quyền Pháp vì cái “ung nhọt” chiến tranh Việt Nam.

P1- Chương 5

Giám mục Ngô Đình Thục ngả người trên ghế bành, chăm chú theo dõi thái độ Ngô Đình Nhu.

Ông nhận được thư trả lời của Robert Nguyễn Thành Luân và tức tốc lên Sài Gòn để trao đổi với Nhu.

Chính phủ Ngô Đình Diệm thành lập trước đây có mấy hôm, do sắc lệnh của Quốc trưởng Bảo Đại.

Trận Điện Biên Phủ kết thúc từ đầu tháng năm, dư âm vẫn còn vang động. Lịch sử chinh phục thuộc địa của Pháp – và các đế quốc phương Tây nói chung – chưa bao giờ vấp một thất bại đau đớn và nhục nhã như vậy: mười sáu nghìn binh sĩ, một viên tướng, hàng trăm sĩ quan, với những con số khí tài ngồn ngộn đành đầu hàng giữa một tập đoàn cứ điểm kiên cố vào bậc nhất Động Dương. Tư lệnh tập toàn cứ điểm, Tướng De Castries, đã bất tuân thượng lệnh: Tướng Cogny, cấp trên của De Castries, buộc ông ta tự sát. Thay vì dùng mảnh vải để thắt cổ, ông dùng nó làm cờ trắng.

Bảo Đại chấp nhận phục hồi Diệm, kẻ bị thất sủng hàng chục năm trước, không hề hàm ý là một ân huệ của hoàng gia. Cất chức Diệm trước đây, Bảo Đại tuân theo chỉ thị của Khâm sứ, bây giờ tấn phong Diệm, Bảo Đại thừa hành quyết định của hai ông chủ: Mỹ và Pháp. Bảo Đại còn bận tâm hơn những buổi dạ tiệc ở lâu đài Thorenc và ông sẽ phải trả một cái giá ê chề về quyết định “Giao toàn quyền quân và dân sự cho Ngô Đình Diệm” của ông.

Vấn đề không phải là Bửu Lộc sang gánh cho Ngô Đình Diệm. vấn đề là thế trận của thế giới tự do ở Đông Dương phải bố trí lại và cái đầu quyết định thế trận từ điện Elisee tại Paris chuyển sang White House tại Washington.

Tình hình sẽ ra sao, đó còn trong dự đoán, song cái đã phơi bày là Pháp đang cuốn gói ở Bắc Bộ.

Ngày 25-6-1954, Thủ tướng chỉ định Ngô Đình Diệm xuống sân bay Tân Sơn Nhất, ngày 30-6 bay ra Hà Nội; trước đó một hôm, quân đội Pháp rút bỏ Nam Định và Thái Bình, hai tỉnh chiến lược mà chúng tốn công sức giữ suốt ngần ấy năm đánh nhau.

Ngày 2-7-1954, Thủ tướng Ngô Đình Diệm ra thông cáo phản đối sự rút lui của Pháp ở các vùng nhiều giáo dân đạo Thiên Chúa.

Kết quả trực tiếp nhất của thông cáo phản đối là ngày hôm sau, Pháp bỏ nốt Phủ Lý và cùng ngày, hai phái đoàn quân sự Pháp và Việt Nam Dân chủ Cộng hòa gặp nhau ở Trung Giã để bàn việc ngừng bắn.

Thế là Ngô Đình Diệm phải cho ra đời ngay một Chính phủ thân Mỹ là chính, song vẫn giữ mùi Pháp trong một bối cảnh hết sức tế nhị.

*

Ngô Đình Nhu đọc đi đọc lại bức thư. Bức thư gọn gàng:

“Kính Đức cha,

Mãi tới hôm nay con mới có thể kính trình đến Đức cha bức thư nhỏ nầy. Suốt mấy năm qua, con phải đi lại luôn, nhiệm vụ một cán bộ chỉ huy quân đội buộc con như vậy. Điều mà con hết sức sung sướng là nhiều tín đồ đạo Thiên Chúa có mặt trong hàng ngũ kháng chiến. Ngay ở đơn vị con, số lượng đó không ít. Hơn nữa, chúng con được chăm sóc phần hồn nhờ các linh mục không rời bỏ con chiên như cha xứ Hồ Thành Biên, cha phó Võ Thành Trinh và nhiều tông đồ khác của Chúa.

Cuộc kháng chiến của toàn dân sắp bước vào bước ngoặt lớn – ngày chiến thắng của nhân dân ta không còn xa nữa, sau võ công Điện Biên Phủ chấn động thế giới. Chính con, khi viết thư nầy trình Đức cha, vừa từ chiến dịch trở về. Đơn vị dưới quyền của con đã giải phóng một loạt làng xã bao quanh Cà Mau. Con nghĩ rằng con sẽ có dịp viếng Đức cha.

Cuối thư, con cầu Chúa ban bình an và minh mẫn cho Đức cha.”

Thư của Robert Nguyễn Thành Luân đề ngày 30-6-1954.

Căn phòng trở nên im lặng, hơi nặng nề. Ngoài tiếng giày nện đều đều của Nhu, không còn một âm thanh nào khác.

Giám mục đặt tay lên bụng, nhìn đứa em với sự chờ đợi. Dẫu sao, Nhu vẫn là người có thẩm quyền hơn hết định giá trị của bức thư và kéo theo, định thái độ của gia đình họ Ngô với viên sĩ quan Việt Minh nầy.

Giám mục viết bức thư đầu tiên cho Luân, cách đây hơn hai năm, là do gợi ý của Nhu. Lúc đó, tin đồn Ngô Đình Diệm về nước lan dai dẳng. Một số người Mỹ đã gặp Nhu. Hồng y Spellman gửi cho giám mục hàng tá thư. Hoàn toàn không phải là vì người chủ chăn ở Nữu Ước muốn có quan hệ đặc biệt với người chủ chăn một giáo phận vô danh ở Việt Nam.

Nhu bàn với giám mục những khả năng lôi kéo người theo đạo Thiên Chúa đang kháng chiến về với Ngô Đình Diệm. Trong bản kê, Jean và Robert Nguyễn Thành Luân nằm trong số những người được chú ý bằng những gạch đỏ đậm nét và trong hai người, Robert được nhiều gạch hơn vì Robert là chỉ huy quân đội và vì chưa ai nói rằng Robert vào Đảng Cộng sản. Robert không phải là chính khách, khác với Jean. Có thể Robert vẫn còn là con chiên – theo cả nghĩa đen lẫn nghĩa trắng.

Nhu nói: Phải sửa soạn ngay từ bây giờ. Chúng ta cần, hết sức cần, người kháng chiến Công giáo. Lực lượng xây dựng từ các phần tử bấy lâu quẩn quanh bình sữa “mẹ bồng con” Mont Blanc sẽ chẳng làm cho chúng ta tự phân biệt với các ông Trần Văn Hữu, Nguyễn Văn Tâm…

Nhưng, Luân không trả lời. Giám mục nóng lòng, viết tiếp… Mãi bây giờ Luân mới trả lời.

- Đức cha có thấy điều gì ẩn phía sau bức thư của Nguyễn Thành Luân không?

Nhu phá bầu không khí nghiêm trang hơn buổi lễ cầu kinh này bằng câu hỏi hơi nặng giọng.

Giám mục vẫn nhịp tay lên chiếc bụng khá to, nhíu mày: Bao giờ cũng vậy, ý kiến của giám mục phụ thuộc vào ý kiến người khác, trước kia ông nể Ngô Đình Khôi, rồi Ngô Đình Diệm, bây giờ ông hết sức coi trọng những suy nghĩ của Ngô Đình Nhu. Và, không riêng gì ông, trong vòng vài năm nay, Ngô Đình Nhu trở thành một “quân sư” đầy uy tín, trong đôi trường hợp, một nhà tiên tri trước mắt Diệm và Luyện.

Thục chờ đợi Nhu, tay nhịp khẩn trương lên bụng, chiếc nhẫn giám mục gần như vạch một vệt vàng.

- Em để ý những chữ: “cuộc kháng chiến toàn dân tộc,” “chiến thắng của nhân dân ta,” “võ công Điện Biên Phủ chấn động thế giới.” Hắn không quên nhắc khéo: hắn là một chỉ huy, đánh tan cả hệ thống phòng thủ Cà Mau. Trên tất cả các thứ khôn ngoan, hắn cho biết hắn vẫn là một tín đồ sùng đạo…

Thấy Thục có vẻ như chưa hiểu ẩn ý của bức thư, Nhu đứng lại:

- Hắn nhấn mạnh để chúng ta nhớ: nếu hắn trở về thành thì không phải với đôi bàn tay trắng.

- Tất nhiên – giám mục nói rụt rè – Ta cần gì những kẻ chỉ có đôi bàn tay trắng.

- Đúng… Ta cần những kẻ mang một cái gì về với ta. Nhưng tốt nhất chỉ nên mang trên cầu vai, thậm chí trên da thịt. Đừng mang trong đầu!

Giám mục ngồi thẳng dậy – ông ta phục xét đoán của em.

- Tuy vậy, để còn xem – Nhu nói chậm rãi – Đức cha viết tiếp cho hắn một thư nữa. Liệu hắn có chịu gặp Đức cha ngay không? Em muốn hắn có mặt ở thành càng sớm càng tốt trước khi các phe liên hệ đạt giải pháp về vấn đề Đông Dương. Đức cha nói cho hắn rõ: Chúng ta cư xử với một người tách ra khỏi phía bên kia khác với một kẻ phục viên…

Giám mục nghĩ rằng người em của ông đúng. Chắc Robert Nguyễn Thành Luân cũng thấy được thực tế nầy. Bởi vậy, ông lập tức gửi cho Luân một bức thư nữa – kèm luôn điểm và ngày giờ đón Luân, qua một cha xứ ở vùng giáp ranh.',
	1
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Yêu anh nhiều hơn em có thể (Rũ bóng nghiêng chiều)',
	0,
	N'Truyện lấy bối cảnh ở Nam Kỳ vào những năm đầu thế kỉ XX.\n\nĐơn giản chỉ là một câu chuyện, một mối tình. Mối tình ấy không lãng mạn bởi những phút giây đầu vụng dại và kết thúc bằng cuộc hôn nhân. Mối tình của hai nhân vật bắt đầu từ hôn nhân và kết thúc cho tới khi cả hai lìa bỏ cuộc đời.\n\nCó lẽ là quá viễn vông khi tác giả viết về một tình yêu vĩnh cửu. Nhưng nếu bạn nghĩ, trên đời không có gì là không thể... thì chuyện tồn tại thứ tình yêu vĩnh cửu, tại sao lại không?\nĐơn giản ở chỗ... chỉ cần mình gặp được đúng người, người có thể yêu mình bất chấp để mình có thể yêu người bất chấp.\nThuở ban đầu, anh vì yêu mà yêu, để cô vì được mà yêu. Để rồi, theo ngày tháng, anh vì yêu mà yêu, vì được yêu mà thêm yêu... và rồi... từ đó, cô trở thành kẻ yêu... chỉ vì... yêu.\nPhức tạp ở chỗ... điều đơn giản ấy như mặt trời giữa muôn vạn vì sao thôi!\n\nCó một số tình tiết 18+\n\nfacebook: @https://www.facebook.com/tacgiaThiNgocThuAn/\nĐây là nơi mình muốn mình bày tỏ cảm xúc với các nhân vật của truyện.(chưa có link ở đây, nó nằm ở phần bình luận với cái tên "Rũ bóng nghiêng chiều").',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/ijph823.jpg?itok=dvKVBrOe',
	N'Nam kỳ lục tỉnh, những năm đầu thế kỉ XX.
Cơn mưa nặng hạt vừa mới dứt. Con đường nhỏ trở nên lầy lội. Liên rón rén bước từng bước một trên dải cỏ bên ven. Giữ chặt mớ sách trong lòng, đầu Liên rướn về phía để che chắn những giọt nước còn đọng trên cành lá, sẵn sàng rơi rớt xuống bất cứ khi nào. Đối với mấy người mê đọc thì mỗi một trang giấy bị nhòa y như một vết xước trên viên ngọc quí, khiến người sở hữu tiếc nuối tới mức xót xa. Huống chi cái này là quà tặng, Liên càng không muốn nó bị hư hao dù chỉ một xíu xìu xiu.
Đông ngồi chờ sẵn trên một mô đất cao ráo, trầm tư hướng mắt về phía xa xa, nơi ngôi trường làng đang im lìm trong giấc ngủ. Đang vào hè nên bông phượng đỏ rực cả một khoảng trời. Dưới mặt đất, tiếng ve nỉ non rền rỉ.
Lần hẹn nào cũng vậy, hễ Liên tới là đã thấy Đông rồi. Dù trời nắng hay trời mưa cũng đều như vậy. Nhìn đôi vai áo còn đẫm nước, Liên hơi áy náy.
- Em xin lỗi. Bữa nay, cha đi nghỉ trưa hơi trễ.
Đông không để ý tới lời xin lỗi, chỉ mau mắn dọn cho Liên một chỗ ngồi khô ráo ngay bên cạnh. Thời gian hò hẹn không nhiều, Đông không muốn những lời dư thừa đó làm phí phạm dù một giây một khắc.
Từ khi Liên lên tỉnh học, cả hai phải xa cách suốt chín tháng trời thì một tiếng đồng hồ trễ nãi có là bao. Chỉ cần được gặp người thương, chờ bao lâu Đông cũng chịu. Có chăng chỉ là luyến tiếc, buồn cho những phút giây cận kề vì đó mà ngắn lại.
Biết Liên rất thích theo câu cá nên Đông đã làm cho cô riêng một cần câu bằng trúc, còn đào sẵn mồi. Nhưng vì đã trễ nên cả hai chỉ có thể cùng đi dạo lòng vòng.
- Anh thích chỗ này lắm hả?
Đông đã kết xong một dây bằng bông dại có màu tim tím. Anh đeo vô tay Liên và nối chúng lại thành một vòng.
- Thời thơ ấu của anh, mấy năm được đi học là niềm vui lớn thứ hai trong đời.
- Vậy niềm vui lớn thứ nhứt của anh là khi nào?
Vòng cỏ đã được nối liền chắc chắn ở cườm tay, mà Đông vẫn chưa chịu nhìn lên, chầm chậm đáp lời.
- Là những lúc như vầy.
Không biết cô có hiểu hết hay không mà miệng cứ cười nhỏ nhẹ.
Biết nhau từ lâu, để ý cô từ hồi nào, Đông cũng không rõ. Chỉ nhớ, khi cả hai cùng nhìn nhau trong cái cảnh, trong đã tỏ mà ngoài còn e, thì cũng là lúc, tình cảm nồng nhiệt trong anh bùng lên dữ dội.
Bao nhiêu vòng hào cùng những bức tường dày chập chùng cao vợi đều theo nhau sụp đổ trong anh.
Thì ra, lâu nay anh đã cố kìm nén, cố đưa tay để bóp chết một mối tình đang nở giữa tim mình. Để rồi… Cho tới một ngày, trong một buổi chiều, chỉ khoảnh khắc vụt qua, anh vô tình bắt gặp đôi mắt to tròn, đen láy trong nét duyên ngầm đằm thắm, đang nhìn anh bằng sự ngại ngùng vụng dại xen lẫn sự dịu dàng… Anh không thể nào trốn chạy thêm được nữa.
Mà Liên lại quá ngây thơ, không chút gì phòng bị. Anh nói mượn sách, cô liền cho anh mượn. Anh rủ cô đi câu, cô hồ hởi gật đầu. Từ những buổi hẹn đầu tiên, tình cảm cả hai thêm thân thiết. Và trong những ngày tháng xa cách, cả hai dần nhận rõ, đó gọi tình yêu trai gái.
Cả hai đi bên nhau giữa trời chiều. Má Liên ửng hồng như mặt trời ráng đỏ. Gặp nãy giờ, hầu như… anh chỉ nhìn cô. Liên bẽn lẽn hỏi.
- Sao anh không nói gì hết vậy?
Đông gãi đầu.
- Anh không biết phải nói gì!
- Xa nhau suốt chín tháng… mà, anh không có gì để nói với Liên hả?
Có quá nhiều thứ để nói, nhưng không cuộc không biết nói ra sao.
- Chỉ cần được nghe Liên nói… thì anh cũng thấy vui rồi.
- Nhưng, Liên muốn nghe anh nói.
Ngập ngừng một hồi, Đông cũng chịu lên tiếng.
- Anh… nhớ Liên nhiều lắm!
Bao nỗi niềm chỉ gói gọn trong một câu nói có vẻ bâng quơ. Đông là vậy, nói rất ít. Có lẽ, khi trái tim chứa đầy tâm sự, người ta chẳng muốn nói nhiều, nhưng mỗi lời nói ra đều mang tấm lòng sâu nặng.
Liên e thẹn nhìn về phía chân trời. Mặt trời đang xuống thấp. Đôi mắt tươi vui theo nắng chiều chuyển màu lưu luyến. Đã đến lúc cô phải về nhà.
Qua hàng cây kia là tới ngã ba. Đường về nhà Liên tuy dài, nhưng đó là một con đê lớn nằm giữa cánh đồng trống trải, chạy thẳng tới cổng, phóng tầm mắt thì có thể thấy khá rõ ràng. Nên Đông chỉ có thể đưa cô tới kia thôi.
Bước chân cả hai chậm dần, chậm dần… Đông khẽ quay người, rồi hỏi Liên một cách bịn rịn.
- Ngày mai…, anh có được gặp Liên không?
- Liên cũng chưa biết nữa! Khi nào có thể gặp thì Liên sẽ nhờ chị Sắng nhắn với anh.
- Ờ…
Câu nói chẳng đặng đừng. Cùng cái cúi đầu, khiến hàng cây cũng vương buồn trong lá. Nhưng sau đó, Đông mỉm miệng cười, một nụ cười chẳng lấy làm vui vẻ, sự gượng gạo càng mang vẻ ủ ê.
Đâu chỉ có anh, cô cũng vậy. Cũng mong ngóng mùa hè. Cũng ráng chờ phượng nở, rồi trông đợi tiếng ve…
Đông hiểu, cô là con gái nhà kín cổng cao tường, đâu phải muốn ra ngoài là được, còn anh chỉ là một tá điền nghèo khổ, muốn gặp được cô cũng chẳng dễ dàng gì. Đôi lúc không thể hẹn nhau, anh đành giả đò tới nhà cô mượn sách, hoặc mỗi bận đi câu về, anh đứng ngoài cổng nhìn vô, chờ cô ra hàng ba ngồi hóng gió, cả hai cùng trao nhau ánh mắt.
Đối với trai gái đang nồng nhiệt lửa yêu đương, chỉ bấy nhiêu đâu thể làm vơi đi nỗi nhớ. Nhưng biết làm sao được!
Liên bịn rịn nhìn xuống bàn tay còn bị anh nắm lấy.
- Em… phải về rồi.
Gật đầu mấy lần, Đông mới chịu buông tay.
Chỉ vài bước thì cô quay người lại, thấy anh vẫn đứng đó nhìn theo. Cô đưa bàn tay thon dài, trắng nõn lên phẩy nhẹ.
- Anh… cũng về đi.
Đông tỏ vẻ lơ đãng.
- Liên cứ về trước. Anh muốn đứng đây thêm chút nữa.
Biết anh muốn nhìn theo, cô không nỡ quay lưng. Nhưng thời gian không cho phép cô nán lại lâu hơn nữa. Liên quyết định đi lùi về phía trước.
Thỉnh thoảng, bước chân của cô loạng choạng khi bị vấp phải bụi cỏ nhỏ phía trước, cũng là phía sau. Vì cô phải nhìn đường bằng lưng và sau ót.
Đông chợt cười. Cười thực sự. Cười vì hạnh phúc. Người con gái anh thương cũng mang tâm sự giống như anh.
Đông tiến tới, Liên thụt thùi. Cả hai cứ thế, cũng coi như đưa nhau thêm một đoạn.
---------------------------
Lúp ló một hồi, chắc chắn rằng không có ai, Liên mới chạy vụt vô nhà. Cô định về phòng thì thấy Huệ đang ngồi bên cửa sổ, mắt nhìn mải miết về cánh đồng rộng phía hông, nơi mặt trời sắp lặn.
- Chị hai làm gì mà thẩn thờ quá vậy? - Không chờ Huệ trả lời, cô đã sà xuống ngồi bên cạnh - Lần này về, em thấy chị khang khác sao đó! Chắc, sắp đi lấy chồng, sắp xa nhà nên chị thấy buồn đúng không?
Huệ cười cười.
- Khi nào đi lấy chồng khắc biết.
- Em chưa đi lấy chồng nhưng em thấy mấy cô gái sắp đi lấy chồng đều vui vẻ hạnh phúc. Mặt lúc nào cũng tươi roi rói. Họ chỉ khóc trong ngày xuất giá thôi! Chớ không mang vẻ mặt rầu rầu như chị. – Liên quay qua chị nhỏ giọng như muốn chia sẻ – Chị không muốn đi lấy chồng hả?
Huệ thở dài, lại đưa mắt nhìn ra phía xa xa. Chuyện của cô, cô chưa biết nói làm sao cho Liên hiểu.
Hai nhà quen biết nhau từ lâu, vì vậy Huệ với Thành cũng nhiều lần gặp mặt, rồi nhà Thành cậy người mai mối. Cha má Huệ vui mừng đồng ý mà không hề hỏi Huệ lấy một câu. Có lẽ, họ thấy không cần, vì Huệ không có quyền lựa chọn, con gái lớn lên là phải gả chồng, đó là qui luật.
- Bộ chị… thương người khác rồi hả?
Ai không mong muốn được lấy người mình yêu thương nhưng thực sự những người Huệ biết ngoài kia, Huệ không hề yêu một ai. Cô cũng có cảm mến một người nhưng chưa thể gọi là yêu, thứ tình cảm đó chưa đủ lớn để cô từ chối cuộc hôn nhân, cái cớ lớn nhất chỉ có thể là vì chính bản thân cô nhưng lí do lại đó không đủ thuyết phục để cha má cô đồng ý từ chối lời mai mối.
Thay vì trả lời, Huệ lại hỏi.
- Em thấy anh Thành là người như thế nào?
Đây là lần đầu, Liên được Huệ hỏi về Thành, anh rể tương lai. Dù không rõ cảm giác sắp lấy chồng ra làm sao, nhưng Liên có thể hiểu sự đắn đo của chị. Dù gì cũng là chuyện đại sự cả đời người. Liên có sao nói vậy.
- Anh Thành… cao lớn, đẹp trai, rất xứng với chị đó!
Huệ một mực lắc đầu.
- Chị không hỏi chuyện đó! Chị muốn hỏi em về tánh tình kìa.
Về cái chuyện đó thì Liên không biết. Bình thường gặp mặt, chào hỏi đôi câu rồi ai làm chuyện nấy. Kể ra thì Huệ còn chuyện trò với Thành nhiều hơn. Vì hai nhà luôn tạo điều kiện cho cả hai tìm hiểu.
Huệ nhìn ra cửa sổ. Những áng mấy trời đang theo gió bay đi.
- Có nói chuyện gì đâu mà nhiều. Có điều chị biết, ảnh cũng giống chị, đều không thích nhau. Chẳng qua là phải gặp nhau thôi.
Thương hay không cũng phải cưới. Tuy không cảm mến, nhưng không ác cảm cũng là một điều tốt. Nghĩ vậy, Liên choàng vai Huệ.
- Biết đâu, cưới rồi thì hai người sẽ thương nhau thôi. Em thấy anh Thành cũng không đến nỗi tệ. Nếu cả hai chịu mở lòng, thế nào cũng êm ấm.
Người lớn hay nói vậy đó.. Cha má cô chính là thí dụ điển hình. Hai người hay kể, ngày xưa cũng chỉ qua mai mối rồi nên duyên, vậy mà họ sống với nhau tới tận bây giờ.
Với cô gái hiền lành như Liên, hẳn nhiên suy nghĩ sẽ đơn giản hơn nhiều. Biết đâu, đó lại là điều may. Càng đơn giản càng dễ tìm hạnh phúc.
- Tranh thủ đi. Chị mà được gả đi rồi là tới lượt em đó, chắc cũng không lâu nữa đâu.
Liên nũng nịu.
- Gả thì gả. Nhưng phải có người tới hỏi mới gả được chớ.
- Khỏi lo. Có người tới đánh tiếng rồi. Nếu không phải đám cưới chị chưa tới thì chắc là cha má đã nhận lễ người ta.
Lúc này, Liên mới giật mình, cô bật khỏi khung cửa để ngồi thẳng dậy. Rối rít hỏi.
- Thiệt hả chị? Sao em không nghe cha má hỏi ý em gì hết. Chị có biết người đó là ai không? Mình có quen không?
- Người đó, chị em mình đều biết, là Bửu chớ ai.
Bửu là bạn thân của Hai Chỉ, anh bạn dì với chị em Liên. Mỗi bận gặp cô, anh đều tươi cười bắt chuyện. Từ khi biết Bửu có ý, Liên đã vạch rõ ranh giới với anh qua cách cư xử có phần thô lỗ. Một công tử giàu có, đã quen được nuông chiều như Bửu, bên ngoài đâu thiếu con nhà thế phiệt trâm anh hơn gia đình Liên gấp trăm ngàn lần, thì sao lại muốn cưới người coi thường mình?
- Anh Bửu, sao anh ấy lại muốn đi hỏi em?
- Thì tại Bửu thích em. Cái này ai cũng thấy được mà.
- Nhưng tại sao anh ấy lại thích em?
- Cái này thì em phải đi hỏi người ta, chớ… chị làm sao biết. Chắc tại em của chị xinh đẹp…
- Chị hai!
Hễ nghe lấy chồng thì hầu hết con gái đều đỏ mặt, thích thú xen lẫn thẹn thùng. Phản ứng quyết liệt như vậy, nếu không có cùng nguyên nhân như Huệ thì phải do nguyên nhân còn lại. Mà Liên thì ắt hẳn thuộc trường hợp thứ hai, cô đã có người thương. Thế nên, những gì vừa được nghe lúc nãy, Huệ không hề nhắc lại. Thay vào đó, là những điều mà Liên chưa hề nghĩ tới.
- Liên, nếu có một ngày em có được cho mình một tình yêu thực sự thì đừng ngần ngại. Hãy mạnh dạn vượt qua mọi rào cản mà đi theo tiếng gọi trái tim mình. Chị nhứt định tán thành.
Bất giác, Huệ nắm chặt tay Liên như muốn truyền cho cô sức mạnh, mắt Huệ ánh lên sự kiên định mạnh mẽ. Liên có chút ngỡ ngàng khi nghe câu nói này của chị, lòng cô không tránh được nỗi băn khoăn, hàng mi cô khẽ chớp rồi đưa mắt ra phía chân trời.
Bữa trước vừa làm xong cái tiệc chào mừng, bữa sau Đạt đã phải xuống nhà bà con thăm hỏi. Đây cũng là một lễ nghĩa cần thiết, cha má anh còn ra sức thúc ép, nên Đạt không thể không đi..
Lên xe từ nãy giờ, Đạt chưa thôi hậm hực.
- Mấy tháng nữa anh mới cưới mà cha má đã hối em về rồi.
Thành cười cười, một tay chìa điếu thuốc.
- Tại cha má sợ chú quyến luyến cô đầm nào rồi ở luôn bên bển nên phải bắt về sớm. Mà nè, ở bển, chú có thương ai chưa?
Đạt gác tay lên khung cửa. Gió thổi vào lồng lộng làm khói thuốc chưa kịp bay thì đã tan ra. Bên ngoài, cánh đồng trải rộng. Thỉnh thoảng, xe sượt qua mấy cô gái đội nón lá, bưng thúng đi trên đường. Có vài khuôn mặt xinh tươi, làm Đạt phải ngoái đầu nhìn theo tới khi khuất bóng. Con gái xứ ruộng đồng có thân hình nảy nở, trong bộ bà ba càng thêm e ấp. Đối với cặp mắt đã quen với đầm tây, thì hình ảnh kia bỗng trở nên thú vị.
Lần này về, thế nào, cha má anh cũng tìm cho anh vài mối. Chuyến đi này, ngoài việc thăm hỏi thì chắc chắn sẽ có khối người tới ra mắt cho mà coi.
Chợt nhớ tới Ngân, cô gái mà Đạt quen khi còn ở Pháp. Một cô gái xinh đẹp. Cô là người Việt Nam nhưng lại mang nhiều nét phương tây, tân thời, khỏe khoắn, tươi trẻ và cuốn hút. Đạt và Ngân gặp gỡ, trò chuyện rồi hẹn hò. Nếu Thành hỏi anh đã thích ai chưa thì anh có thích, không chỉ một mà rất nhiều nữa là khác, nhưng Thành lại hỏi anh đã thương ai, đây là điều khiến Đạt chưa thể trả lời.
- Anh với chị Huệ thương nhau bao lâu rồi?
- Lâu mau gì. Đâu có thương.
Câu trả lời dứt khoát của Thành khiến Đạt trố mắt.
- Không thương sao lại cưới?
- Cưới thì cưới vậy thôi. Đằng nào cũng lấy vợ. Không là Huệ thì cũng là người khác. Thay vì lấy một người mà mình hoàn toàn không biết thì lấy một người mà mình đã biết sơ sơ, không hay hơn à?
- Hổng lẽ, tới từng tuổi này mà anh chưa thương cô nào hết hả?
- Tui đâu có được như chú.
- Vậy sao anh không đợi thêm vài năm nữa?
Như bao nhiêu người, Thành cũng muốn cưới một người anh thực sự yêu thương. Nhưng giữa cái xã hội nửa tây nửa ta như hiện tại, Thành không biết mình phải chờ tới bao lâu. Khi mà thậm chí, anh còn không chắc cái người mà anh ao ước đó, liệu có hiển hiện hay không trên mặt đất.
- Cũng hăm hai rồi chớ trẻ trung gì nữa mà chờ.
Chưa bao giờ Đạt nghĩ, cái nguyên nhân sâu xa của việc Thành cưới Huệ lại đơn giản tới mức giống như ăn một bữa cơm, không cá thì thịt.
- Không biết phần chị Huệ thì sao ta? Chắc cũng như anh quá!
Thành không suy nghĩ, nói liền.
- Về phần Huệ thì… Chắc là vì anh của chú đẹp trai, giàu sang, có học. Con gái nào mà không ưng.
- Ha ha ha… Không biết chị Huệ mà nghe mấy câu này của anh thì chỉ sẽ như thế nào ha? Bữa đó, em chưa nhìn kĩ chị dâu tương lai của mình nữa, bữa nào phải nhìn cho kĩ mới được.
- Cần gì để tới bữa nào, lát nữa tui sẽ ghé ngang nhà bên đó để biếu ít quà. Chú tha hồ mà ngắm. Nhưng mà nói trước cho chú khỏi thất vọng, Huệ không đẹp như mấy cô bồ của chú đâu nha.
- Chuyện xấu đẹp thì có can hệ gì tới em. Anh cưới chớ có phải là em cưới đâu, em có gì để hy vọng đâu mà sợ thất vọng.
Xe thong dong chạy trên đường. Câu chuyện tới đó thì không còn gì để nói. Thành tập trung lái, còn Đạt thì nhìn qua cửa để phóng tầm mắt ra xa. Chẳng có gì ngoài những cánh đồng trải rộng bạt ngàn, xanh thẳm.
Ở nơi này, dường như bước chân tới nơi đâu người ta cũng chỉ bắt gặp một thứ, là lúa. Chúng đang tắm mình trong cái nắng vàng ươm, giòn giã để nhựa sống sinh sôi, chờ ngày trổ bông ra hạt.
Xe tới nhà Huệ đã là lúc ban trưa. Cửa nhà mở rộng nhưng xung quanh vắng vẻ. Thành bóp kèn mấy cái, một lát sau mới thấy Huệ bước ra gian nhà chính.
- Anh đi đâu mà tới giờ này?
Huệ nói với Thành xong thì gật đầu chào Đạt. Thái độ của cô chẳng lấy gì vồn vã, khác hẳn với mọi người. Mà Thành thì cũng thảng nhiên chẳng khác.
- Anh với Đạt đi thăm bà con, tiện thể ghé qua biếu ít quà cho hai bác… à không cha má ăn lấy thảo. Mọi người đang nghủ trưa hả?
- Dạ không, cha má em dắt Cúc đi công chuyện từ sáng, Liên thì vô xóm trong rồi, nên chỉ có mình em ở nhà. Anh ghé thăm lâu không, có lẽ cha má em tới chiều mới về tới.
Anh em Thành cũng chỉ ghé biếu quà rồi đi tiếp, nhưng đúng lúc chị người ở chạy lên báo đã dọn cơm. Huệ cũng mời. Thành hơi lưỡng lự, nhưng định bụng sẽ nhận lời. Nào ngờ, chưa kịp gật đầu thì Đạt đã từ chối.
- Thôi đi chị, đường còn xa, em với anh hai phải tranh thủ.
Huệ với Thành, tuy vẫn giữ lễ khách, nhưng không quá màu mè. Nên Huệ không mời tiếng thứ hai đã quay lưng đi xuống. Đạt không khỏi bất ngờ, vợ chồng sắp cưới gì mà thờ ơ quá!
Thành đập lên vai Đạt một cái.
- Đang nghĩ gì vậy? Thấy sao?
Đạt tiu nghỉu cười.
- Thấy kì! Tháng nữa là về chung nhà, mà xa lạ quá chừng!
- Thì vẫn còn là người lạ mà chớ có thân đâu.
Nhìn cái nắng gay gắt ngoài kia, Thành hơi nản. Anh đốt thuốc rồi lại ván ngả lưng một lát. Thấy Thành thiu thiu ngủ, Đạt không đánh thức mà ra ghế giữa nhà ngồi.
Thu vào tầm mắt chỉ có một khoảng không gian mênh mông của trời, mây và ruộng lúa. Yên bình nhưng có phần tẻ nhạt.
Nắng tắt, trời chuyển cơn dông. Hàng cây phía xa nghiêng mình lay động. Một bóng dáng bước ra.
Sẵn đang buồn chán, Đạt chăm chú nhìn để giải khuây. Cô gái vừa đi được vài bước cô quay đầu lại như đang cười nói với ai đó đang bị che khuất. Rồi cô đi giật lùi.
Qua khúc cua một đoạn, cô bắt đầu chạy. Tà áo trong gió tung bay, chiếc bím tóc dài đung đưa trước ngực. Trên tay cô cầm đủ loại thành phần của cây sen, một lá sen to tròn xanh mướt, một bông sen đã nở khoe sắc hồng tươi thắm, một búp sen hồng phơn phớt còn e thẹn, một bầu sen tròn trĩnh chứa đầy hạt tốt tươi, tất cả trong tay cô vươn cao lay động. Một trận gió thốc lên, cô nhanh tay giữ chiếc nón đang đội trên đầu, cô cứ thế bước về phía trước. Thỉnh thoảng, cô nhảy chân sáo. Rồi đứng lại, đưa búp sen lên miệng như chú ong hút mật. Dù không nhìn rõ mặt, nhưng chắc chắn cô đang rất vui.
Nhìn từ phía xa, thân hình cô gái như một nét chấm phá giữa cảnh đồng không hiu quạnh, một đóa sen hồng của đồng ruộng mênh mông. Trong bộ đầm ca rô, nét tươi mới tràn đầy mang phong cách phương tây nhưng thân hình mềm mại vẫn phảng phất một nét dịu dàng của người con gái á đông.
Cô chạy về phía cổng, không vào ngay mà nép một bên nhìn ngó thăm dò. Vậy là, trốn nhà đi chơi đây mà. Đạt vội đứng dịch qua mép cửa. Vậy là từ nãy giờ, cô vẫn chưa thấy anh.
Cô bước qua cổng đi dọc hàng rào. Được mươi bước, một trận gió lớn nổi lên níu chân cô dừng lại. Muôn vàn bông hoa giấy đỏ tươi theo nhau rụng xuống. Bỏ nón ra khỏi đầu để tầm mắt không vướng víu, rồi ngơ ngẩng nhìn những bông giấy đua nhau rơi rụng xung quanh, bất giác cô đưa tay ra hứng, một bông giấy mềm mại rơi giữa bàn tay, cô hất nhẹ tay cho bông hoa tiếp tục nương bay trong gió. Sau đó nhảy lên bắt lên bắt lại. Cuộc vui tiếp diễn cho tới khi, cô đuổi theo cánh bông gần bậc thềm.
Ngay phía trên, có một thanh niên đang đứng khoanh tay trước ngực, đầu tựa lên khung cửa, nụ cười mỉm thật nhẹ. Sự chăm chú của anh không làm cô mắc cỡ bằng sự mơ màng thoảng trong ánh mắt.
Tay Liên rụt lại. Bỏ cánh bông hồng rơi thẳng xuống đất. Từ mặt xuống cổ đều đỏ bừng, tươi thắm như một bông sen vừa mới nở và mềm mại như bông giấy đang tung bay. Cái cách cô thẹn thùng cũng dễ thương tới lạ.
Sống quá lâu trên đất Pháp, Đạt tưởng mình đã quá chai sạn với những bộ đầm tây, đâu ngờ lại bị cuốn hút như thể mới thấy lần đầu. Xưa nay, người đẹp vì lụa, nhưng nếu được khoác lên một cơ thể có phẩm chất, lụa là cũng theo đó đẹp tươi hơn.
Liên vội vàng phủi lại quần áo. Cô có ý định bỏ đi, nhưng khi nghe tiếng cười khúc khích, lại còn cái nhìn chăm chăm không chút e ngại. Cô bỗng thấy ghét. Cái người gì lạ đời! Thân làm khách mà không chào hỏi chủ nhà một tiếng, đã nhìn lén người khác mà còn kênh mặt ra như vẻ vang lắm không bằng. Cô ngẩng đầu lên cao, hỏi câu đầy khí thế.
- Anh là ai?
- Vậy, cô em là ai?
Bị bắt quả tang còn lớn lối! Thiệt không coi ai ra gì! Mà ghét nhứt là cái cách nói chuyện, nghe cợt nhã gì đâu. Liên không thèm lịch sự co mắc công.
- Tui hỏi anh trước mà.
- Nhưng tui không thích trả lời trước.
Sự kênh kiệu của người đối diện vẫn không suy giảm, Liên trả lời chắc nịch.
- Tui là chủ nhà này.
- Tui là em của con rể tương lai của nhà này. Cô em tên gì?
Lần này tới lượt Liên hếch mặt thách thức.
- Anh tên chi?
Đạt bật cười. Trước nay, chưa có ai hơn thua với anh theo kiểu này.
- Lần này, tui hỏi cô em trước đó.
- Nhưng tui không thích trả lời trước. Có giỏi thì anh tự đoán luôn đi.
Đạt chưa kịp trả lời thì cô đã quay đi. Nhưng Đạt không muốn câu chuyện phải kết thúc. Anh vội nói với theo.
- Vậy để tui đoán nha – Đạt nheo mắt làm ra vẻ suy nghĩ. Muốn chọc cô thêm một chút, nhưng cô gái này không có sự kiên nhẫn, thấy chân cô dợm bước, anh liền đưa ra đáp án - Cô tên Như Liên phải không?
- Sao anh biết?
- Có gì khó đâu! – Đạt thấy thích thú. Trước giờ, anh mới thấy, có người tỏ vẻ ngạc nhiên lại dễ thương tới vậy! Nhắm mắt cũng đoán được tên cô. Ăn mặc kiểu đó thì không phải là kẻ ăn người ở, còn dõng dạc khoe mình là chủ nhà. Lúc nãy Huệ đã nói khá rõ, Cúc thì đi theo cha má, Liên thì đi ra ngoài chưa về, dĩ nhiên cô gái đứng trước mặt anh là cô ba nhà này, Như Liên. Bụng nghĩ như vậy nhưng miệng anh lại nói khác - Tay cô cầm đủ thứ liên quan tới bông sen như vậy thì có khác gì nói với người ta mình tên Liên đâu.
Liên che miệng cười. Đạt thấy lạ mới hỏi.
- Sao lại cười?
- Tui cười anh. Tưởng giỏi lắm, ai dè… chỉ ăn may. Nhìn thấy tui cầm trên tay bông sen thì đoán tui tên Liên, nếu thứ tui cầm không phải bông sen mà là một bông trang, bông bưởi, bông dừa hay một bông dại nào đó thì anh có đoán ra không?
- Vẫn đoán ra được.
- Dựa vô đâu?
- Không cần biết. Chỉ cần biết là tui đã đoán trúng. Cô nói tui ăn may, vậy cô cũng ăn may một lần, nói thử cho tui coi, tui tên gì?
Hai gia đình sắp thành thông gia, ngày nhà anh làm tiệc mừng anh về nước, cha má và chị cô cũng có tới dự, hình như nhật trình ở Lục tỉnh cũng có đưa tin. Đạt tin chắc, làm gì thì Liên cũng biết về anh chút đỉnh, chỉ cái tên thì quá dễ với cô rồi.
Nhưng Đạt lầm. Chuyện của anh, Liên chẳng quan tâm. Huệ đã từng nhắc một lần, khổ nỗi, Liên không thèm để ý. Tuy vậy, cô cũng nhìn kĩ một chút, vì đây là người khó ưa nhất cô từng gặp trong đời. Khuôn mặt sáng sủa, quần áo bảnh bao, đầu tóc vuốt sáp bóng lưỡng, nhìn thì cũng có học thức, con nhà giàu kèm luôn cả sự hống hách kênh kiệu. Với Thành cũng có nét hao hao, nhưng tánh tình thì tệ hơn hẳn.
Liên vuốt nhẹ cánh sen mềm mại.
- Tên anh có gì khó đâu, nhìn mặt với nghe kiểu anh nói chuyện là biết cả tên lẫn họ luôn rồi. Mà tui nghĩ, sẽ không có tên nào hợp với anh hơn tên đó đâu.
Đạt nghiêng đầu chờ đợi.
- Giỏi quá ta, tui tên gì nè?
- Anh họ Hách tên Dịch.
Một cái tên, dám chắc không người Việt nào dám đặt cho con. Càng nghĩ Liên càng khoái chí vì vừa chọc giận được cái tên công tử nhà giàu kiêu ngạo.
Nhưng Đạt không những không giận, lại vui vui. Vì cô vội chạy đi nên chưa kịp nhìn thấy, từ mắt tới miệng của kẻ khó ưa kia đều chứa đựng nụ cười, cứ mải miết nhìn theo bóng lưng cô.
Bông giấy tản mác khắp sân. Đạt cúi người nhặt lấy một bông vừa đậu trên giày. Mây đã tan, mảnh sân lại ngập nắng vàng, để bông giấy trở nên lấp lánh, như giấc mộng trưa hè ngắn ngủi.
Vẫn đang giờ cơm trưa. Đạt chạy vào lay Thành dậy.
- Hay mình ăn cơm rồi hãy đi.
Tự dưng Đạt trở nên lôi thôi, Thành đổ quạu.
- Hồi nãy người ta mời thì không chịu ăn. Bây giờ làm gì có mà ăn. Lộn xộn quá! Có đói thì cũng ráng mà nhịn!
Xe đã ra tới cổng, Đạt vẫn luyến tiếc quay đầu nhìn. Một bông giấy trên tay anh từ nãy giờ vẫn chưa rơi xuống.',
	1
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Hạ đỏ',
	0,
	N'Mùa hè là khoảng thời gian mà học trò không còn lo lắng chuyện học hành và cũng là mùa để họ vui chơi giải trí. Mùa hè này, anh chàng Chương còm sẽ về quê ngoại để đổi gió và nghỉ ngơi sau chín tháng dài học hành căng thẳng với đầy nỗi âu lo. Nơi quê ngoại Chương sẽ làm gì và học hỏi được những gì? Xin mời các bạn cùng đón đọc Hạ Ðỏ để biết được toàn bộ nội dung câu chuyện này.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/ha-do.jpg?itok=7gnzXJne',
	N'Nhà ăn sinh viên, tiếng cười nói ầm ĩ, đầu người chen chúc chập chùng, mùi thức ăn thu hút mọi người nhao về phía đồ ăn, họ chen lấn, xô đẩy nhau khiến đám người đó sắp dẹt như cái bánh quả hồng.

Thu Hạ Hạ và Trương Nhã Tuyên để đồ ăn vô cùng khổ sở mới mua được ôm đằng trước ngực, cẩn thận lách ra khỏi đám đông đang như sắp “phát điên”.

“Nhã Tuyên, chúng mình qua bên kia ăn cơm đi!” Thu Hạ Hạ chỉ vào chiếc bàn phía gần cửa ra vào.

“Tại sao hôm nay tự nhiên lại thay đổi chỗ ngồi của bọn mình vậy? Chẳng phải chúng mình từ trước tới giờ đều ngồi vị trí gần tường ở giữa hay sao?” Tuy có chút thắc mắc nhưng Trương Nhã Tuyên vẫn đi theo Thu Hạ Hạ về phía vị trí gần cửa.

“Hôm nay mình phải đợi một người.”

Nói xong họ đã đi tới chỗ gần cửa ra vào. Trương Nhã Tuyên cảm thấy bùi ngùi, trân trọng khi ăn thức ăn mà phải vô cùng khó khăn mới mua được. Thu Hạ Hạ lại không nghĩ gì tới việc đó, chiếc thìa trong tay cô đảo qua đảo lại thức ăn, mắt cô dán vào cửa nhà ăn.

“Hạ Hạ, cậu đang chờ ai thế?” Trương Nhã Tuyên vừa “chiến đấu” đĩa cơm vừa tò mò ngẩng đầu lên hỏi Thu Hạ Hạ.
“Âu Dương Dị.”

“Híc! Híc!…” Trương Nhã Tuyên vỗ vỗ vì bị nghẹn ở cổ họng.

“Cậu còn chưa bị nghẹn đến chết à?” Thu Hạ Hạ nhìn Trương Nhã Tuyên một cái.

Trương Nhã Tuyên lắc đầu tuyệt vọng, sau đó mở to mắt nhìn Thu Hạ Hạ: “Hạ Hạ, cậu phải cưa đổ Âu Dương Dị thật ư?”.

“Giả đấy!” Thu Hạ Hạ trợn mắt sau đó tiếp tục nhìn ra phía cửa nhà ăn.

“May mắn, may mắn thay!” Trương Nhã Tuyên reo lên, trong lòng thấy yên tâm.

Thu Hạ Hạ lạnh lùng liếc Trương Nhã Tuyên. Đôi mắt trong trẻo mở to, ánh lên tia nhìn đùa dai: “Mình vẫn chưa nói hết, cậu may mắn cái nỗi gì thế hả? Mình định nói là, giả mới là lạ.”

Lần này thì Trương Nhã Tuyên không thốt lên được lời nào vì lưỡi của cô như bị kẹp chặt.

Sau đó một lúc, Trương Nhã Tuyên có cảm giác lưỡi bớt đau hơn một chút, mới mang vẻ băn khoăn hỏi: “Hạ Hạ, cậu đúng là vì muốn giúp mình mới cưa cẩm Âu Dương Dị có phải không?”.

“Đương nhiên!”

“Cậu không thích Âu Dương Dị tý ty nào có đúng không?”

“Không thích.”

Câu trả lời này thật dứt khoát.

“Vậy… Hạ Hạ, cậu định “cưa đổ” Âu Dương Dị bằng cách nào cơ?”

“Đầu tiên sẽ tiến hành gây sự chú ý của anh ta… Trương Nhã Tuyên, cậu bắt đầu biến thành nhiều chuyện rồi đấy! Cậu đừng có hỏi nhiều như vậy, một lát nữa nhìn mình là được rồi!”.

“Hạ Hạ, cậu…”

Trương Nhã Tuyên vốn định thuyết phục Hạ Hạ bỏ cuộc, nhưng lại nhìn thấy mắt Hạ Hạ dán chặt vào cửa rồi đột nhiên sáng lên. Lòng Trương Nhã Tuyên bất an, chưa biết phải làm sao thì đã nghe thấy tiếng Thu Hạ Hạ tuy nhỏ nhưng rất phấn khích: “Âu Dương Dị tới rồi kìa!”.

Trương Nhã Tuyên ngẩng đầu thì quả nhiên thấy Âu Dương Dị cầm bộ đồ ăn đang từ ngoài cửa bước vào. Trong lòng hoảng hốt, cô vội kéo tay Thu Hạ Hạ nói: “Hạ Hạ, chúng mình đi đi! Cậu đừng theo đuổi Âu Dương Dị nữa có được không? Mình không sao đâu, không có lời xin lỗi của Chung Ngọc Thanh, mình vẫn có thể sống tốt!”.

Thu Hạ Hạ quay đầu lại, dùng ánh mắt năn nỉ nhìn Trương Nhã Tuyên: “Xin cậu chí khí một chút có được không? Những lời mình đã nói thì nhất định không thể rút lại! Ấm ức của cậu, mình sẽ giúp cậu nói ra!”.
“Nhưng mà… Hạ Hạ…”

Thu Hạ Hạ không nhẫn nại nữa mà ngắt lời của Trương Nhã Tuyên: “Cậu đừng nói thêm nữa, cậu không thể thay đổi được quyết định của mình đâu! Cậu ngoan ngoãn ngồi ở đấy, nhìn xem mình đối phó với Âu Dương Dị như thế nào nhé!”. Nói rồi, cô không để ý đến Trương Nhã Tuyên nữa mà chỉ chú ý quan sát Âu Dương Dị.

Âu Dương Dị từ cửa đi vào, nhìn thấy dòng người trong nhà ăn, khuôn mặt tuấn tú khẽ nhíu mày một cái. Cậu đã cố ý tới muộn 15 phút rồi mà sao người vẫn còn đông đến như vậy?

Vào lúc Âu Dương Dị còn đang do dự nên hay không nên quay lại phòng học ăn tạm bánh mỳ thì có tiếng con gái trong trẻo ở bên cạnh cất lên.

“Anh Dị.”

Âu Dương Dị cúi đầu nhìn thấy một cô gái xinh đẹp đang cầm hộp cơm, cười bẽn lẽn nhìn cậu. Âu Dương Dị có nhớ cô gái này, hình như cô ta rất thích cậu, thường lợi dụng mọi cơ hội để tiếp cận cậu, hòng để gây sự chú ý của cậu. Có điều đối với cô ta, cậu không hề thấy có chút hứng thú nào cho nên ngoài việc nhớ được bộ dạng của cô ta thì đến tên là gì cậu thậm chí còn không nhớ.

“Anh Dị, anh vẫn chưa ăn ư?” Chung Ngọc Thanh nhìn Âu Dương Dị cười cầu thân, sau đó đưa hộp cơm màu xanh dễ thương trên tay ra: “Đây là hộp cơm chính tay em làm, anh nếm thử không?”.

Âu Dương Dị cúi đầu nhìn hộp cơm đang tỏa ra mùi thơm quyến rũ, thầm nuốt nước bọt, nhưng cậu cười và từ chối: “Cảm ơn bạn, nhưng mình đã chuẩn bị bộ đồ ăn để đi lấy cơm rồi cho nên hộp cơm này bạn giữ lại cho bạn hoặc cho bạn của bạn ăn đi!”. Cậu không muốn vì một hộp cơm mà đến bản thân cũng đem đi bán.

Chung Ngọc Thanh nở nụ cười thất vọng, Đôi mắt to ẩn chứa sự đáng thương nhìn Âu Dương Dị: “Ngon thật mà! Anh thật lòng không muốn nếm thử sao?”.

“Lần sau nhé! Xin lỗi, tớ đi lấy cơm trước đây!” Âu Dương Dị để lộ nụ cười mê hoặc lòng người trước Chung Ngọc Thanh, sau đó nhập vào “đội quân đi lấy cơm”.

Chung Ngọc Thanh đứng nguyên tại chỗ, trong mắt là cả một bầu trời hoa đào nở rộ: anh ấy đã cười với mình. Hạnh phúc quá!

Thu Hạ Hạ chăm chú nhìn Âu Dương Dị, liếc nhìn Chung Ngọc Thanh, trợn mắt cảm thấy không còn lời nào để nói, trong lòng khẽ thở dài: Xem ra, tinh hoa của Chung đại cô nương đều ở trên da mặt cả rồi. Bây giờ muốn cưa đổ con trai, có nhan sắc mà không có đầu óc là không xong rồi! Tặng một hộp cơm, hộp cơm này sớm đã là “kịch cũ” rồi. Chỉ có điều điều mà cô không nghĩ tới đó là việc Âu Dương Dị không nhận hộp cơm của Chung Ngọc Thanh. Tất nhiên Chung Ngọc Thanh xinh đẹp nhường ấy, loại người thích theo chiều gió như cậu ta lẽ ra phải thích cô ta mới phải chứ! Lẽ nào cậu ta đang chơi trò thả mồi bắt bóng?

 

Âu Dương Dị chen chúc hồi lâu, đến lúc cậu cảm thấy bản thân sắp “hy sinh” oanh liệt trong “đội quân quả hồng” này thì cuối cùng cũng lấy được cơm vào cái đĩa ở trong tay. Vẫn còn cảm thấy may mắn, cậu nắm chặt đĩa cơm vượt qua “đội quân tranh cơm”, định đến khu vực bàn ăn thì đột nhiên bị một cô gái vội vã đi qua va phải, lực va chạm lớn tới mức đĩa cơm cậu cầm trên tay rơi xuống.
Cùng với âm thanh lanh lảnh vang lên, Âu Dương Dị thấy thức ăn mà mình phải trải qua muôn vàn khổ cực mới mua được đều đã ở dưới mặt đất.

Trương Nhã Tuyên vẫn ngồi một chỗ, vô cùng kinh ngạc, sợ hãi. Trời ạ, Hạ Hạ đang làm cái trò gì thế không biết?

Âu Dương Dị không dám tin cơm mà mình cực khổ mới mua tự nhiên chưa được ăn mà đã không còn nữa, tình cờ bụng sôi ùng ục lên một chặp, giống như lửa được đổ thêm dầu khiến ngọn lửa nhỏ trong lòng cậu bỗng chốc hóa thành đống lửa lớn rừng rực. Cậu ngẩng đầu, muốn bóp chết người vừa va vào cậu, nhưng chợt nhìn thấy gương mặt trái xoan thanh tú và đôi mắt trong veo quá đỗi.

 

Thu Hạ Hạ thành khẩn nhìn Âu Dương Dị, đôi mắt to tròn, trong veo như thủy tinh chớp chớp, điệu bộ tinh khiết vô hại: “Va vào làm đổ cơm của cậu rồi, mình rất xin lỗi, nếu cậu không để bụng thì mình mời cậu ra nhà hàng Nhã Đằng Các ăn cơm có được không?”.
Một câu nói rất quen thuộc phải không? Không sai! Câu nói này là Thu Hạ Hạ học từ bộ phim nói về tình yêu nhiều tập chiếu lúc 8 giờ tối. Bạn đừng có nhìn bộ dạng thành khẩn lúc này của Thu Hạ Hạ, thực ra trong lòng cô ấy đang cười lăn cười lộn. Chắn chắn rồi! Cũng giống như con người cô lúc nào cũng cười toe cười toét, khiến cô ấy nói những lời nghiêm túc như thế thì thực sự rất buồn cười.

Âu Dương Dị nhìn chằm chằm vào Thu Hạ Hạ, trong lòng sớm đã cảm thấy nghi ngờ trong đôi mắt chứa đầy sự ăn năn kia có chút tương tự như… có ý cười cợt? Âu Dương Dị tự thấy cách nghĩ của mình đáng cười, nghi ngờ gì cô ấy chứ, đằng nào thì cũng chẳng liên quan đến cậu. Âu Dương Nghị mỉm cười, đang định từ chối Thu Hạ Hạ thì bụng lại phát ra những tiếng ùng ục ùng ục.

Thu Hạ Hạ mắt lấp lánh, ngay lập tức mỉm cười và nói: “Cậu đi ăn cùng mình là được rồi!” Sau đó nhanh nhảu kéo tay Âu Dương Dị đi ra khỏi nhà ăn. Trước khi bước ra khỏi cửa còn không quên nhìn “đá lông nheo” về phía Trương Nhã Tuyên mặt nghệt ra, vẫn ngồi im ở chỗ cũ.

 

Thế nên mới nói, con gái muốn “cưa đổ” con trai, còn cần một chút khôn ngoan thì mới được! Giống như cô, không phải đã nắm tay Âu Dương Dị giữa chốn đông người rồi đó sao?

Nhã Đằng Các cách trường Thanh Nhân không xa, trang trí mới lạ và thanh lịch, không gian yên tĩnh, rất thích hợp cho các cặp tình nhân hoặc những người yêu thích không gian tĩnh lặng dùng bữa. Thế nhưng giá đồ ăn ở đó thì “chém” rất “đẹp”! Một ly nước cam là 30 nhân dân tệ, khai vị, đồ ăn chính, tráng miệng, đồ uống tính sơ sơ cũng mấy trăm nhân dân tệ.

Thu Hạ Hạ và Âu Dương Dị ngồi ở chiếc bàn ăn sát cửa sổ, trên bàn bày la liệt đồ ăn ngon lành.

Âu Dương Dị chăm chú ăn, tóc trước trán thưa nhìn như một đoạn tơ lụa mềm mại rủ bên trên mắt. Ánh nắng mặt trời từ bên ngoài cửa sổ đong đầy trong đôi mắt tinh anh, trong trẻo, vầng sáng của những tia nắng mềm mại phác họa rõ hơn những đường nét trên khuôn mặt của cậu. Cậu ăn rất nhanh, nhìn là thấy thực sự rất đói, thế nhưng động tác thì nho nhã hệt như một hoàng tử thanh tao trong câu chuyện cổ tích.

 

Thực ra những con người u mê đó cũng có con mắt tinh tường đấy chứ! Cậu ta đích thực là rất đẹp trai! Đáng tiếc là có quá nhiều người thích, đây chẳng phải là việc tốt đẹp gì! Chí ít đối với bạn gái của cậu ta, điều này đích thực là không hay! Cũng là vì lý do này mà cô sợ nhất là rắc rối có sự liên quan của mối quan hệ nam nữ. Để có thể kết thúc vụ này, mọi người có thể cười một trận, cô nhất định phải lên kế hoạch thật là “cụ tỉ” mới được.
Thu Hạ Hạ tay cầm ống hút, hoàn toàn không để tâm đến ly sinh tố xoài thơm ngon, hai mắt chớp chớp nhìn Âu Dương Dị, trong đầu toan tính làm thế nào để có thể “cưa đổ” Âu Dương Dị một cách nhanh nhất. Làm được thế mới bắt được cô nàng hoa khôi lúc nào cũng cho mình là nhất xin lỗi Trương Nhã Tuyên, và không gây phiền nhiễu đến anh chàng Âu Dương Dị này.

Hay là cô cứ nói chuyện cá cược này cho cậu rồi nhờ cậu giúp đỡ? Chỉ cần cô có thể thuyết phục cậu đồng ý giả làm bạn trai cô trong một khoảng thời gian, chờ cho Chung Ngọc Thanh xin lỗi xong thì hai người có thể ai trở về cuộc sống của người nấy rồi. Hai bên cũng chẳng tổn hại gì, đây có lẽ là cách tốt nhất chăng?
Âu Dương Dị cảm thấy Thu Hạ Hạ không ngừng nhìn mình, sau đó ngẩng đầu lên khỏi bàn ăn và nhìn Thu Hạ Hạ: “Tại sao cậu không ăn, chỉ nhìn mình vậy? Có phải cứ nhìn mình ăn như thế, bụng cậu cũng tự nhiên thấy no rồi?”. Âu Dương Dị nhếch lông mày bên trái, điệu bộ như thể chọc cười Thu Hạ Hạ.

 

“À, chẳng có cách nào cả, tại cậu đẹp trai quá! Nhìn khuôn mặt đẹp trai của cậu, mình cũng chẳng cần ăn gì nữa!” Thu Hạ Hạ mỉm cười, buông tay khỏi ống hút, đẩy ly sinh tố về phía trước rồi ngồi dựa vào thành ghế: “Cậu ăn no rồi phải không?”.

Âu Dương Dị gật gật đầu, cầm cốc nước quả lên hút một hơi, sau đó ngồi dựa vào thành ghế, ánh mắt cười mang ý thăm dò, nhìn Thu Hạ Hạ: “Mình nhớ cậu nói cậu tên là Thu Hạ Hạ đúng không? Mình tên là Âu Dương Dị. Thu Hạ Hạ, cậu nói xem lý do cậu cố ý va vào làm đổ cơm của mình rồi mời mình tới đây ăn cơm là gì đi!”.

Thu Hạ Hạ chau mày, mắt vô cùng gian manh nhìn xéo Âu Dương Dị hỏi: “Cậu biết là mình cố ý?”.

Âu Dương Dị gật nhẹ, nụ cười hiện trên gương mặt: “Hành động của cậu quá lộ liễu rồi!”.

“Vậy thì lần sau mình thực sự cần cải tiến nhiều mới được!”, Thu Hạ Hạ hạ giọng lầm bầm, sau đó tiếp tục nhìn Âu Dương Dị: “Thế cậu có biết vì sao mình mời cậu ra ngoài này không?”.
“Không phải là cậu thích mình đấy chứ?” Âu Dương Dị hoàn toàn chỉ có ý trêu chọc, nhưng không ngờ Thu Hạ Hạ gật đầu rất trịnh trọng.

 

Nghĩ một lát, Thu Hạ Hạ lại lắc đầu nói: “Cũng không phải là thích cậu, mình chỉ muốn hẹn hò cùng cậu thôi.”

“Có gì khác nhau ở đây sao?”

“Đương nhiên rồi!”, Thu Hạ Hạ chăm chú giải thích: “Trước thì vì thích cậu nên muốn có thể hẹn hò với cậu. Sau thì muốn có thể hẹn hò với cậu nhưng không phải vì thích cậu.”

Âu Dương Dị nghe một hồi, lập tức nghiêng về phía trước rất hào hứng, đầu tiến sát Thu Hạ Hạ: “Cậu không thích mình?”.

Thu Hạ Hạ lắc đầu: “Đó không phải là điều quan trọng. Quan trọng là mình có một việc muốn nhờ cậu giúp”.

“Nào, đó là việc gì? Cậu nói mình nghe xem sao!”

 

Thế là Thu Hạ Hạ hoa chân múa tay kể lại đầu đuôi câu chuyện, nói một mạch đến lúc khô hết cả mồm, đau hết cả miệng, cốc sinh tố to đùng để trên bàn đều bị uống sạch bách mới kể hết được từ đầu chí cuối toàn bộ câu chuyện.

“Cậu muốn mình giúp cậu? Nếu như vậy thì mình được lợi gì chứ?” Âu Dương Dị nghe hết câu chuyện, lại tiếp tục ngồi dựa vào thành ghế.

Thu Hạ Hạ nghe xong, hơi cau mày: “Cậu muốn được lợi? Cậu muốn được lợi lộc gì cơ?”.

Âu Dương Dị nhìn Thu Hạ Hạ rồi cười, dùng giọng điệu nhẹ nhàng hỏi lại Thu Hạ Hạ: “Vậy cậu có thể đem đến cho mình điều gì có lợi?”.

Thu Hạ Hạ nghe câu hỏi với thái độ thản nhiên của cậu thì có thể thấy cậu không có hứng thú với chuyện này nên hỏi thẳng: “Có phải là cậu không muốn giúp mình?”.

Âu Dương Dị cười mà không nói gì.

 

“Cậu không đồng ý cũng chẳng có vấn đề gì.” Thu Hạ Hạ nghiêng người nhìn cậu, trên mặt nở một nụ cười tự tin: “Mình sẽ có cách khiến cậu phải hẹn hò với mình”.

“Ồ! Thế à? Vậy để mình chống mắt chờ xem.” Sự hứng thú hiện lên trong đôi mắt đen láy của Âu Dương Dị .

Thu Hạ Hạ nhún vai đứng dậy, cầm ba lô để trên ghế bước ra ngoài, tự nhiên như nhớ ra điều gì, quay đầu lại dặn Âu Dương Dị: “Một lát nữa nhớ thanh toán”.

“Không phải cậu nói cậu mời mình sao?” Tuy ngay từ đầu Âu Dương Dị không định để Thu Hạ Hạ thanh toán nhưng cậu vẫn muốn biết phản ứng của Thu Hạ Hạ sẽ như thế nào.

“Lúc ở cửa Nhã Đằng Các mình có chào mời cậu bước vào! Cậu thử nghĩ lại xem có đúng như vậy không. Thế nhé, mình phải đi rồi, cậu nhớ trả tiền đấy!” Thu Hạ Hạ hùng hồn nói, sau đó lại dũng mãnh bước đi.

Trong đầu Âu Dương Dị vụt qua hình ảnh lúc nãy ở cửa quán ăn, Thu Hạ Hạ cố ý đứng ở cửa “mời” cậu bước vào. Sau đó cậu khẽ cười thành tiếng, đôi mắt đen thoảng nụ cười xuất phát từ trong tim.

 

Trong lớp học, trên bục giảng, thầy giáo môn Địa Lý bị hói đầu đang giảng đến phần “Sự thay đổi của đất đai và đại dương”, học sinh ngồi dưới im phăng phắc. Nhưng bạn đừng lầm tưởng cái không khí lặng không một tiếng chim sẻ ấy có nghĩa là mọi người đang chăm chỉ nghe bài. Ngoài một vài học sinh ưu tú ở hàng đầu ngồi nghe giảng và ghi chép, học sinh ngồi phía dưới thành một đám lớn, đều mơ đi gặp Chu Công cả rồi. Còn lại thì đang dùng di động lên QQ chat chit; con trai đang chơi game bằng máy điện tử cầm tay; con gái đọc mấy cuốn sách bỏ túi hoặc các tạp chí thời trang; chăm chú nghe giảng không có mấy người. Lên lớp môn Địa Lý, mọi người đều nhất trí chỉ cần không ra tiếng động thì dù bạn có nhảy nhót như con khỉ trong lớp cũng chẳng có ai nói gì. Đến lúc thi học kỳ, không cần biết bạn dùng cách gì, chỉ cần bạn qua là được.

 

Thu Hạ Hạ và Trương Nhã Tuyên ngồi ở vị trí sát tường phía dưới lớp học. Hai người ngồi vừa đúng bàn trên bàn dưới, muốn truyền đạt thông tin gì chỉ cần trực tiếp viết vào giấy là được, tiết kiệm được khối tiền nhắn tin.

Trương Nhã Tuyên lặng lẽ chuyền mẩu giấy dưới gầm bàn, Thu Hạ Hạ nhận rồi mở ra xem.
“Hạ Hạ, buổi trưa cậu với Âu Dương Dị đã đi đâu và làm gì vậy?”

Thu Hạ Hạ cầm bút gạch gạch trên giấy viết câu trả lời.

“Chúng mình đến Nhã Đằng Các ăn cơm, mình đề nghị cậu ấy hẹn hò với mình nhưng cậu ấy đã từ chối. Nhưng chẳng sao cả, mình khắc có cách khiến cậu ấy trở thành bạn trai của mình.”

 

Thu Hạ Hạ vo viên mẩu giấy, thừa lúc thầy giáo không chú ý vứt lên trên bàn của Trương Nhã Tuyên. Trương Nhã Tương mở ra xem xong, còn chưa kịp viết lại thì tiếng chuông báo hết giờ vang lên.

Vì nhà trường có quy định sau tiết thứ hai của buổi sáng là giờ thể dục giữa giờ nên thầy dạy Địa Lý còn chưa hết bài thì đã nhanh chóng kêu hết giờ. Bên ngoài cửa sổ còi hiệu lệnh tập trung bắt đầu vang lên, học sinh trong lớp nhanh chóng mang phù hiệu của trường, tốp hai tốp ba đi ra ngoài.

Trương Nhã Tuyên quay người lại, vỗ vỗ lên mặt bàn của Thu Hạ Hạ, theo thường lệ đều gọi Thu Hạ Hạ cùng đi tập thể dục, nhưng nhìn thấy Thu Hạ Hạ nằm gục trên bàn, không động đậy. “Hạ Hạ, cậu làm sao vậy? Cảm thấy không khỏe à?” Trương Nhã Tuyên quan tâm lấy tay sờ lên trán bạn.

 

“Ôi! Bụng mình không hiểu làm sao mà thấy hơi đau. Nhã Tuyên, hôm nay mình không tập thể dục đâu, cậu đi một mình đi!” Thu Hạ Hạ để mặt lên trên lớp áo dày, giọng nghe có vẻ buồn bã, nhìn có vẻ như đau thật. Nhưng thực tế thì đang giả vờ giả vịt, cười thầm trong bụng.

“Ừ! Thế cậu cứ ngồi trong lớp nghỉ nhé, mình ra ngoài đây!” Trương Nhã Tuyên nhìn xung quanh, các bạn đều đã ra ngoài gần hết, cô vỗ nhẹ lên vai bạn rồi nhanh chóng ra ngoài.
Thu Hạ Hạ tiếp tục bộ dạng như sắp chết, gục trên bàn, tai dỏng ngược, lắng nghe động tĩnh trong lớp học. Đến khi lớp học yên tĩnh, không còn tiếng động nào, cô mới lặng lẽ để lộ cặp mắt láo liên. Thận trọng xác nhận trong lớp không còn ai khác ngoài mình thì cô mới nhảy lên với mười phần phấn khích.

He he! Thời khắc thực hiện kế hoạch “cưa cẩm” con trai của Thu Hạ Hạ cô đã tới! Bây giờ hãy xem chiêu đầu tiên trong kế hoạch ấy của cô như thế nào nhé!

 

Thu Hạ Hạ di chuyển rất nhanh đến trước cửa sổ sát phía sau ngọn núi, thận trọng thăm dò phía bên ngoài cửa sổ. Phòng học của cô nằm ở tầng 2 của tòa nhà, chỗ thấp nhất cũng phải tới hơn 3 mét, trên mặt đất lá rụng phủ một lớp dày, nhảy xuống chắc chắn không bị xây xát tí ti nào. Thu Hạ Hạ nhìn xung quanh một lượt, chắc chắn không có ai ở đằng sau mới bám hai tay nhảy lên bệ cửa sổ, sau đó ôm đầu và nhảy xuống.

Thu Hạ Hạ sau khi tiếp đất còn lăn trên lớp lá mềm mại một vòng mới dừng lại. Cô nhanh chóng bò từ dưới đất dậy, lá bám trên quần áo cũng tự rơi xuống, sau đó cô nhằm hướng phía Nam đằng sau ngọn núi co giò chạy.

 

Đích đến của cô chính là bãi đỗ xe của học sinh ở dưới chân núi, mục đích là xì hết hơi trong lốp xe đạp của Âu Dương Dị. Đến lúc tan học thì cô có thể dắt xe đạp của mình mà đắc ý đứng trước mặt cậu, dùng cách đe dọa: “Nếu muốn mình đèo về nhà thì hãy ngoan ngoãn đồng ý hẹn hò với mình đi!”. Hà hà! Cô cũng đã điều tra ra nhà cậu ta cách trường tới hơn mười cây số, nếu không muốn đi bộ đến chết thì cậu ta chỉ có cách là ngoan ngoãn đồng ý với lời đề nghị của cô thôi. Cho nên lần này cô thắng chắc rồi! Ha ha ha!

Thu Hạ Hạ tự tin nghĩ, không thể chạy nhanh hơn được nữa.

 

Bây giờ chỉ còn chờ đến lúc tan học buổi sáng nữa mà thôi!

Thời gian hai tiết nhanh chóng trôi đi, chuông báo hết giờ vang lên, học sinh ùn ùn kéo ra khỏi lớp học.

Thu Hạ Hạ cũng nhanh chóng thu dọn đồ đạc của mình, sau đó đeo ba lô lên lưng, quay về hướng Trương Nhã Tuyên nói: “Nhã Tuyên, mình bận chút việc. Mình đi trước đây! Tạm biệt!”.

 

“Ừ! Đi đường cẩn thận! Tạm biệt!”

“Ừ! Mình biết rồi!” Thu Hạ Hạ hét to, người đã ở tít xa!

Thu Hạ Hạ chạy một mạch không nghỉ từ lớp học đến bãi để xe cách đó 100 mét rồi mới dừng lại. Cô nấp sau một cái cây khô, không dám thở mạnh, mắt không ngừng hướng về bãi để xe theo dõi. Lúc cô nhìn thấy bộ dạng bối rối của Âu Dương Dị khi đứng trước nhà xe, cô không nhịn được cười.

Không nghĩ tới vụ này thuận lợi đến thế! Sự việc hoàn toàn theo hướng sắp đặt của cô, “quả” thắng lợi đang ở rất gần chờ cô hái xuống rồi! Cô đúng là thiên tài!

“Ha ha ha!!!” Thu Hạ Hạ không nén được ngửa mặt lên trời cười to ba tiếng.

Những học sinh đi trên đường đi ngang qua chỗ cô, nhìn thấy cô trong bộ dạng như vậy, liền nhìn cô với ánh mắt sợ hãi như gặp kẻ bị bệnh thần kinh.

 

Thu Hạ Hạ đang cười dở, ánh mắt vô tình nhìn thấy như vậy, tiếng cười đắc ý lập tức chuyển thành nụ cười không thành tiếng.

Nghe đồn, Thu cô nương ưa nổi giận, có thể từ một nữ sinh trung học ngây thơ chỉ trong phút chốc biến thành con rồng trong kỷ Jura khạc ra lửa. Cô nhìn những người xung quanh đang quan sát mình và hét lên như người điên: “Nhìn cái gì mà nhìn? Bộ chưa nhìn thấy con gái xinh đẹp ngây thơ bao giờ sao? Mấy người mà còn nhìn nữa tôi rút giầy ra ném đấy!”. Nói rồi còn rút giầy ra thật.

Đám người đó sợ tới mức chưa tới một giây sau đã tự động tản ra hết. Tiếp sau đó mấy phút cũng chẳng có ai dám đứng gần Thu Hạ Hạ trong vòng mười mét. Cho đến khi lấy lại được nhịp thở bình tĩnh, Thu Hạ Hạ mới đi đến trước mặt Âu Dương Dị.

“Này cậu nhóc!” Thu Hạ Hạ dương dương tự đắc chọc chọc hai cái vào ngực Âu Dương Dị, biết rồi mà còn cố ý hỏi: “Tại sao vẫn chưa về nhà thế hả? Có phải có người xì lốp xe của cậu?”.

 

Âu Dương Dị nhìn vẻ đắc chí của cô, chớp mắt rồi chợt hiểu ra: “Là cậu đã xịt lốp xe của mình?”.

“Ừ thì làm sao?” Hừm! Xem cậu ta thì cũng chẳng dám làm gì. Một lát nữa cậu ấy còn xin cô cho quá giang về nhà! Hờ hờ!

“Mình thực sự chẳng biết phải làm gì với cậu.” Âu Dương Dị buông thõng tay biểu thị sự bất lực, sau đó nhìn cô với ánh mắt nghi ngờ: “Mình chỉ không hiểu, làm như vậy thì cậu được ích lợi gì?”.

 

Thu Hạ Hạ không để ý đến vẻ hoài nghi của cậu, hỏi một câu hỏi không liên quan gì: “Âu Dương Dị, nhà cậu cách trường rất xa phải không? Nếu đi bộ thì sẽ mất bao lâu thế?”.
Âu Dương Dị ngoẹo đầu tính toán rồi trả lời: “Nếu đi với tốc độ của mình thì phải đi khoảng hơn một tiếng!”.

“Oa! Còn lâu hơn mình tính!” Thu Hạ Hạ thì thầm, sau đó tiến sát đến trước mặt Âu Dương Dị, cười với vẻ nham hiểm: “Cậu không định đi bộ về nhà đấy chứ? Quãng đường hơn một tiếng đi bộ không phải là ngắn đâu nhỉ!”.

“Mình đương nhiên không ngốc nghếch đến mức cuốc bộ về nhà đâu.”

 

Điều này hoàn toàn đúng như “kịch bản” dự tính , Thu Hạ Hạ trong lòng sớm đã hoan hỉ. Cô nén sự phấn khích không bật thành tiếng cười, hắng giọng, ra vẻ là người tốt nói: “Chúng mình là học sinh cùng trường, mình không nỡ nhìn cậu “cuốc bộ” về nhà. Thế này đi, mình có một đề nghị, mình cho cậu quá giang về nhà, cậu hẹn hò với mình. Cậu thấy thế nào?”. Cậu ta còn có thể thế nào kia chứ! Ngoài việc đồng ý thì cậu ta còn có thể còn cách nào khác nữa đây? Thế nên mới nói, lần này cậu ta không thể không đồng ý hẹn hò với cô! Ha ha ha! Thu Hạ Hạ đắc ý nghĩ như vậy.

Âu Dương Dị dùng con mắt thăm dò hai chữ “thắng lợi” được viết tận nơi đáy mắt của Thu Hạ Hạ, một giây sau lập tức sáng tỏ: “Thì ra cậu xịt lốp xe của mình là nhằm mục đích uy hiếp mình phải hẹn hò với cậu.”

“Đúng thế, nhưng chẳng phải cậu có quyền từ chối đó sao? Trừ phi cậu muốn cuốc bộ về nhà!” Thu Hạ Hạ ỷ vào ưu thế hiện giờ của mình càng nói càng tỏ ra đắc ý.

Âu Dương Dị liếc nhìn cô, ngay lập tức nhìn thấu ý đồ. “Vậy nhưng… mình thực ra không có ý đi bộ về nhà.” Mắt cậu liếc về phía sau, quét qua một lượt những chiếc xe đạp xếp hàng dài ở đằng sau. “Nhìn thấy bọn xe đạp đằng sau mình chứ?”

 

Thu Hạ Hạ nhìn qua vai cậu, nhìn thấy hàng dài các loại xe đạp, sau đó nhìn cậu một cách khác thường hỏi: “Nhìn thấy! Nhưng việc đó có liên quan gì tới cậu không?”.
“Thu Hạ Hạ, cậu nghĩ xem trong số xe ở đây, chiếc nào đi thấy thoải mái nhất?”. Cậu thực sự rất không muốn đả kích cô gái vênh váo đang đứng trước mặt. Nhưng cô ta cứ nhằm vào trêu chọc cậu, cậu cũng chẳng còn cách nào khác. Haizzz! Đúng là thói đời bây giờ, muốn làm một hoàng tử hiền hòa, hoàn mỹ cũng thật chẳng dễ dàng gì.

 

“Cậu hỏi những điều đó để làm gì?” Tuy Thu Hạ Hạ cảm thấy kỳ lạ nhưng cô vẫn chỉ vào chiếc xe mới màu bạc chuyên dụng đi đường cái, nhìn đặc biệt và rất đẹp ở trong đó.

“Vừa rồi mình vì đang băn khoăn không biết dùng chiếc nào nên cảm thấy hơi lăn tăn.
Cảm ơn ý kiến của cậu.” Âu Dương Dị vừa nói vừa dắt chiếc xe đó ra.

Thu Hạ Hạ nhìn hành động của Âu Dương Dị, đột nhiên thấy không hiểu: “Sao cậu lại lấy xe đạp của người khác?”.

“À! Mình quên nói với cậu”, Âu Dương Dị nhảy lên ngồi trên xe, cố ý thốt lên, “sự thể đã như vậy, các bạn nữ trong trường biết xe mình bị xịt lốp thì chắc chắn sẽ tranh nhau cho mình mượn xe. Cậu có thấy các bạn nữ trường mình rất nhiệt tình không? À, mình không phiền cậu đưa mình về đâu, mình tự đạp xe về nhà là được rồi. Tạm biệt!”. Nói xong, Âu Dương Dị huýt sáo rồi đạp xe tiến về phía trước.

Không phải là cô sắp thành công rồi hay sao? Sự việc tại sao lại biến thành như thế này?

Thu Hạ Hạ vẫn còn ngớ ngẩn đứng chôn chân tại chỗ, miệng há to, hoàn toàn không thể lý giải được sự việc tại sao lại thành ra thế này.

Sau khi kế hoạch xe đạp thất bại, Thu Hạ Hạ vẫn không nản lòng.

 

Tổ tiên nhà Thu Thị trong điều 308 của nội quy có dạy: Vấp phải thất bại không được chạy trốn, cách làm đúng đắn phải là tận dụng lúc thất bại không để ý thì cho nó một liều thuốc xổ, sau đó chờ nó chạy vào nhà vệ sinh thì khóa trái cửa lại, khiến nó vĩnh viễn không có ngày xuất đầu lộ diện.

Vì thế chiêu thứ hai trong kế hoạch “cưa cẩm” con trai của Thu Hạ Hạ đó là: Một liều thuốc xổ!

“Bạn ơi, phiền bạn gọi hộ mình bạn Âu Dương Dị ra ngoài này có được không?” Ngoài hành lang lớp 12 số 17, Thu Hạ Hạ chặn một nam sinh đang bước vào cửa lớp, nở nụ cười năn nỉ.

Nụ cười ngọt ngào của Thu Hạ Hạ khiến cậu nam sinh nọ gật đầu ngay tắp lự, lập tức bước vào lớp gọi người.

“Nụ cười của cậu đúng là không chê ở điểm nào được mà!” Âu Dương Dị đón ánh nắng mặt trời từ trong lớp học bước ra, nụ cười thật rạng rỡ.

Thu Hạ Hạ không thể không nhìn ngẩn ngơ được, Âu Dương Dị nở nụ cười hướng về phía cô nháy mắt “phóng điện”, cô mới tỉnh lại.

 

“Này! Âu Dương Dị! Ý của cậu là vừa rồi cậu có nhìn thấy mình? Thế cậu làm gì mà không tự bước ra?” Để che đậy suy nghĩ tội lỗi của mình, Thu Hạ Hạ cố ý hét lên hung dữ với Âu Dương Dị mà không phát hiện ra khuôn mặt đỏ bừng đã sớm tố cáo lòng cô.

Âu Dương Dị nhìn hai má ửng hồng của cô, đáy mắt hiện rõ một nụ cười. Cậu giả vờ như không nhìn thấy sự e thẹn trong mắt cô, đưa ra câu hỏi: “Cậu tìm mình có việc gì không?”.

Việc gì? À! Đúng rồi! Cô quên mất việc chính rồi! Có trách thì trách nhóc con đáng chết này nói năng linh tinh! Nhưng chờ một phút… Hừm! Thu Hạ Hạ nhìn hộp cơm trong tay một cái, trong lòng tiểu nhân xấu xa đáng thương đang cười như một mụ phù thủy.

“Âu Dương Dị, chúng ta ra đằng kia nói chuyện được không?” Thu Hạ Hạ chỉ về phía góc hành lang, hỏi với giọng điệu nhỏ nhẹ. Kế hoạch trong đầu cô đó là bên ấy không có người, đến lúc cô làm gì Âu Dương Dị thì cũng chẳng có ai có thể làm chứng.

Âu Dương Dị nhìn theo hướng cô chỉ, lạnh lùng trả lời: “Được thôi!”. Trong lòng có chút băn khoăn: “cáo già” Thu Hạ Hạ ưa la hét với cậu tại sao đột nhiên lại nhẹ nhàng nói chuyện với cậu, không phải lại muốn giở trò quỷ quái gì nữa chứ?

Hai người mỗi người một ý lặng lẽ đi về phía góc hành lang.

“Âu Dương Dị, đêm qua mình đã nghĩ kỹ rồi, mình nhận ra trước đây mình đã làm những việc ngốc nghếch, uy hiếp để bắt cậu hẹn hò cùng mình. Những chuyện đó thật là ấu trĩ, mình nghĩ nhất định đã đem đến cho cậu không ít phiền phức.” Cô ngẩng đầu, mắt nhìn cậu, giọng rất thật: “Sau này mình sẽ không làm phiền cậu nữa, cũng sẽ không làm những trò vô bổ này nữa”.

“Ừm, không… không sao đâu…” Âu Dương Dị không ngờ Thu Hạ Hạ đến để xin lỗi mình, nhất thời cũng không biết phải nói gì. Nhưng khi cậu nghe cô nói sau này sẽ không tìm cậu nữa, trong lòng đột nhiên dâng lên một cảm giác kỳ lạ, có chút gì đó gợn lên, có chút cay đắng.

 

“Âu Dương Dị, hai ngày nay mình đã gây ra cho cậu không ít phiền nhiễu, mình cảm thấy rất ân hận. Hộp cơm này, nếu cậu không để bụng thì hãy nhận lấy đi!” Thu Hạ Hạ nói rất thành khẩn, sau đó đưa hộp cơm trong tay ra trước mặt Âu Dương Dị.

Âu Dương Dị cúi đầu nhìn chăm chú vào hộp cơm ở trên đôi tay búp măng, mảnh mai. Đó là một hộp cơm bằng nhựa màu xanh, trên nắp có in hình nhân vật trong truyện tranh Shin đang khoe mông nhảy nhót, mùi thơm của thức ăn từ trong hộp cơm tỏa ra rất hấp dẫn.
Cậu nhóc này làm sao mà còn chưa nhận cơ chứ? Lẽ nào cậu ta nhìn ra manh mối gì? Trong lòng Thu Hạ Hạ đã có chút sốt ruột, đang định giục thì Âu Dương Dị vươn tay ra nhận lấy hộp cơm.

“Cảm ơn cậu!” Môi Âu Dương Dị khẽ cong lên, ánh mắt cười của cậu khiến Thu Hạ Hạ lầm tưởng ánh sáng của mùa hè đang quay ngược chạy đến mùa xuân. Cậu nói: “Những việc trước đây thì cho qua đi. Hy vọng sau này chúng mình vẫn là bạn”.

 

Thu Hạ Hạ cúi thấp đầu, chột dạ lảng tránh cái nhìn ấm áp như mùa xuân của cậu. Năn nỉ! Đừng có cười như thế với cô nữa! Báo hại cô trong lòng tự nhiên có chút tội lỗi trào lên. Thu Hạ Hạ ơi là Thu Hạ Hạ! Nếu muốn cái ngày mà kế hoạch “cưa cẩm” thành công đến sớm thì phải tỉnh táo lên một chút! Nhưng mà kế hoạch còn chưa kết thúc, kế sách muốn để cho Âu Dương Dị mê mẩn cô còn chưa hoàn thành nên sau khi Thu Hạ Hạ thầm tự nhắc nhở, cô ngẩng đầu lên nhìn Âu Dương Dị.

Thu Hạ Hạ vốn định nói với cậu những câu nghe bi đát, mùi mẫn hơn, hòng kiếm chút nước mắt sau đó cô cũng tốn chút nước bọt và cuối cùng thì rút lui một cách bi thảm. Nhưng lại không ngờ bị đôi mắt ấm áp của cậu làm cho đầu óc trống rỗng. Đến lời thoại cũng quên sạch bách còn nói gì đến diễn cảnh bi thương đây? Thế là cố nói nốt câu “tạm biệt” hết sức thảm thương rồi hoảng sợ chạy mất. Giời ạ! Thu Hạ Hạ ơi là Thu Hạ Hạ! Cô đúng là cái đồ vô tích sự!

 

Âu Dương Dị tay cầm hộp cơm, mắt nhìn chằm chằm vào Thu Hạ Hạ đang bước đi, ánh mặt trời giống như đang nhẹ nhàng tỏa sáng trên lưng cô, bóng đổ dài trên mặt đất.

Cô ấy cũng giống như những cô gái khác, đều muốn tiếp cận được với cậu, nhưng với mục đích là để giúp đỡ bạn bè. Cô thích nghĩ ra những cách kỳ quái để ép cậu tiếp xúc với cô, nhưng những cách đó đều là những trò đùa nhỏ vô hại, chẳng ảnh hưởng đến bất kỳ ai. Cô ấy tràn đầy nhiệt huyết, rất có nghĩa khí, không bao giờ thích giả tạo và rất có cá tính, về điểm này thì những cô gái “dịu dàng” ở bên cạnh cậu có lẽ sẽ chẳng bao giờ làm được? Thực ra, cô ấy cũng không tồi chút nào.

 

Trong lòng Âu Dương Dị có một cảm giác rất kỳ lạ, chính cái lúc mà cậu rung động muốn đuổi theo để chấp nhận hẹn hò với cô thì một anh chàng khác chạy vượt lên, nhân lúc cậu đang đờ người ra, đã cướp mất hộp cơm ngon lành trong tay cậu.

“Thật là ghen tị với cậu đấy! Mỗi ngày đều có bao nhiêu cô gái chuẩn bị bữa trưa cho, khổ thân cho tôi, đến một cọng rau cũng chẳng có! Ông trời thật là chẳng công bằng chút nào cả!” Cậu bạn cướp hộp cơm đó là Kim Dục Duy, bạn cùng lớp và cùng trong đội bóng với Âu Dương Dị. Cậu ta vừa cướp được hộp cơm đã vội nhảy sang một bên mở ngay ra, hai con mắt sáng lên: “Oa, thơm quá! Bao nhiêu là đồ ăn”. Kim Dục Duy không chần chừ bốc một miếng thịt hun khói bỏ vào miệng, nhai ngấu nghiến, hai mắt to tròn, trên khuôn mặt lộ rõ vẻ sung sướng. “Quá ngon! Đúng thật là tuyệt hảo! Âu Dương Dị, cậu có thể xem xét kết bạn với cô bé này xem sao. Như thế, ngày nào cậu cũng có thể ăn bữa trưa ngon lành rồi, ha ha!”

Lúc này Âu Dương Dị mới kịp phản ứng lại, lập tức cướp lấy hộp cơm: “Này! Kim Dục Duy! Trả lại cơm cho tôi!”.

Kim Dục Duy tránh được, tiện thể bốc thêm được miếng dưa chuột xào bỏ vào miệng. Cậu Âu Dương Dị này động tác rất nhanh, nhưng Kim Dục Duy cũng không tồi chút nào, dù gì cả hai cũng đều là trụ cột của đội bóng rổ!

Thấy “con sói” Kim Dục Duy lại còn muốn ăn tiếp, Âu Dương Dị liền chạy lên giật lại, quát lên: “Này! Kim Dục Duy! Cậu đừng quá đáng thế! Đây là bữa trưa của tôi!”.

 

Kim Dục Duy vẫn cố tình bỏ thêm con tôm vào miệng, vừa nhai ngấu nghiến vừa nói: “Âu Dương Dị, bình thường cậu có bao giờ nhận cơm của cô gái nào đâu? Hộp cơm này cậu cho lại tôi là được rồi. Ôi, cô gái này thật là tỉ mỉ, con tôm nào cũng bóc vỏ cẩn thận, khi nào mình mới có người nấu cho mình bữa cơm ngon như thế này đây?”.

Câu nói của Kim Dục Duy làm Âu Dương Dị ngây người ra một lúc, đúng thật! Từ trước tới giờ chưa bao giờ cậu nhận cơm của một cô gái nào, vì sợ những phiền phức không đáng có, vậy thì tại sao cậu lại nhận cơm của cô ấy? Vì cô ấy không giống với các cô gái khác? Vì mục đích muốn tiếp xúc với cậu của cô ấy khác? Hay là vì ý‎ nghĩa của hộp cơm này cũng khác?

Âu Dương Dị đang chau mày suy nghĩ về vấn đề ở trong đầu, đột nhiên lại nghe thấy một âm thanh lạ ở bên cạnh. Âu Dương Dị nhíu mày nhìn lại một cách đầy nghi ngờ.

 

Chỉ nhìn thấy Kim Dục Duy mặt mũi nhăn nhó, khom khom lưng, hai tay ôm lấy bụng, hai chân khép lại, run bần bật, miệng kêu đau oai oái, trông có vẻ rất là đau đớn. Hộp cơm rơi xuống đất, vỡ làm mấy mảnh, cơm rau đổ đầy ra mặt đất.

Âu Dương Dị giật nảy mình vội chạy đến đỡ Kim Dục Duy dậy, đôi mắt tỏ vẻ rất lo lắng: “Dục Duy, cậu làm sao vậy?”.

Kim Dục Duy mặt nhăn nhăn nhó nhó ngẩng đầu lên, trán lấm tấm mồ hôi: “Tôi… tôi… tôi đau bụng”.

 

“Sao tự nhiên lại thế này? Hay cậu ăn phải cái gì đó mất vệ sinh?”

“Tôi… hộp cơm…” Kim Dục Duy đau quá đến nỗi nói không thành câu, bụng lại sôi ùng ục, vội vàng buông tay Âu Dương Dị ra, ôm bụng chạy như bay vào nhà vệ sinh.

Âu Dương Dị nhìn Kim Dục Duy đang chạy với ánh mắt đầy nghi hoặc, rồi hướng ánh mắt đó xuống đống cơm rau ở dưới đất. Chắc không phải trò quỷ của nữ nha đầu đó chứ?

Lúc này, tên tội phạm bị tình nghi số một của Âu Dương Dị đang nấp ở góc hành lang cạnh nhà vệ sinh nam, mắt chớp chớp nhìn chiếc đồng hồ trên tay, đang đếm thời gian.
Đã mười phút rồi, lẽ ra Âu Dương Dị phải ăn hộp cơm đó rồi chứ?

Để đề phòng sự cố, Thu Hạ Hạ đợi thêm ba phút nữa, sau đó xác nhận lại trong phòng vệ sinh nam ngoài “cậu ta” ra, sau khi không còn ai khác nữa, mới lẻn vào phòng vệ sinh nam. Để đề phòng trong khi thực hiện kế hoạch có người chạy vào, cô ấy còn chốt cửa của phòng vệ sinh, đồng thời còn treo tẩm biển ghi rõ: “Nhà vệ sinh đang quét dọn, tạm ngừng sử dụng”.

 

Lần này, ngoài cô ấy ra, chắc chắn không còn ai có thể cứu được Âu Dương Dị nữa rồi! Cô ấy không tin kế hoạch lần này lại thất bại! Ha ha!

Thu Hạ Hạ cười khẩy một cái rồi tiến đến cái nhà vệ sinh tách biệt kia, sau đó dừng lại trước cánh cửa đang đóng, nói một cách dương dương tự đắc: “Âu Dương Dị, bữa trưa tôi làm cho cậu rất ngon phải không? Tôi “đặc biệt” làm cho cậu đấy!”. Cái giọng lại còn kéo dài hai từ “đặc biệt” nữa chứ.

“Ai đấy?” Anh chàng Kim Dục Duy đang “dời non lấp bể” trong nhà vệ sinh đột nhiên nghe thấy tiếng con gái, sợ đến nỗi suýt nữa không nói lên lời. Con gái sao lại chui vào nhà vệ sinh nam? Chắc không phải là “Ma nữ nhà vệ sinh nam” trong truyền thuyết xuất hiện đấy chứ? Không phải như thế chứ?

“Âu Dương Dị, lần này không dễ chịu lắm phải không? Trong hộp cơm đó tôi đã cho thêm ba liều thuốc. Tôi nói cho cậu biết, tôi đã đóng chặt cửa nhà vệ sinh rồi, ngoài tôi ra, không ai có thể cứu cậu! Nếu không muốn kéo giãn ruột của mình ra thì hãy ngoan ngoãn đồng ‎ ý hẹn hò với tôi đi! Chỉ cần cậu đồng ‎ kết bạn với tôi, tôi sẽ lập tức đưa thuốc giải cho cậu!” Lần này cô ấy không tin là cậu ta sẽ không đồng ý! Trừ phi cậu ta không muốn cái mạng đó nữa.

 

Hả? Hộp cơm ư? Thuốc ư? Kim Dục Duy nghĩ đến hộp cơm ban nãy, trong chốc lát đã hiểu ra tất cả. “Cậu là cô gái tặng hộp cơm đó ư?”, hại cậu ta vừa nãy còn nghĩ là trong nhà vệ sinh có ma nữ. Lát nữa quay lại sẽ kêu Âu Dương Dị nhất định không được tiếp xúc với cô ta, cô ta đúng thật là khủng khiếp.

Thu Hạ Hạ cũng thấy lạ. Gì cơ? Cái giọng nói này nghe lạ lạ? Hình như không giống với giọng Âu Dương Dị cho lắm!

“Này, cho hỏi, cậu có phải là Âu Dương Dị không?”

“Không phải, tôi là Kim Dục Duy, bạn học của cậu ta.” Kim Dục Duy mặt nhăn như khỉ, bắt đầu cảm thấy hối hận khi cướp hộp cơm của Âu Dương Dục, đúng là mình không nên tham ăn quá.

 

“Gì cơ?”, thế còn tên Âu Dương Dị kia đâu? Cái người đang ngồi ở đây lúc này đáng lẽ ra phải là Âu Dương Dị mới phải chứ? Thu Hạ Hạ ngây người ra một lúc, sau đó cũng hiểu ra: “Là Kim… Kim… Dục Duy sao? Cậu đã ăn hộp cơm đó sao?”.

“Phải.” Kim Dục Duy mặt mày nhăn nhó, bụng lại đau một trận dữ dội.

Thu Hạ Hạ lập tức hiểu ra tất cả! Lần này lại để Âu Dương Dị thoát rồi! Thu Hạ Hạ tức đến nỗi tim muốn nhảy ra khỏi lồng ngực, không thể tin cái sự thất rằng mình lại thua.
“Bạn gì ở ngoài cửa ơi…” Kim Dục Duy không nghe thấy âm thanh gì ở ngoài nữa, một chút lo sợ thoáng qua, “Bạn gì ơi, xin bạn hãy để lại thuốc giải rồi hãy đi! Tôi với bạn không thù không oán, cậu hãy tha cho tôi đi mà!”.

“Giúp tôi nói với bạn Âu Dương Dị của cậu, tôi sẽ không bỏ qua lần này đâu!” Thu Hạ Hạ nói một cách giận dữ, sau đó ném gói thuốc giải ở cửa nhà vệ sinh: “Thuốc giải tôi để ở cửa đó, cậu tự đi mà lấy! Tôi đi đây!”.

Thu Hạ Hạ tức giận bước ra.

 

Cửa vừa mở, Thu Hạ Hạ đen đủi phát hiện ra có mấy nam sinh đang đứng chờ ở cửa nhà vệ sinh nam, cô bỗng chốc ngây người ra một lát không biết nên làm thế nào. Mấy nam sinh đó nhìn thấy cô nữ sinh bước ra từ phòng vệ sinh nam, cũng ngớ người ra, sau đó nhìn cô với ánh mắt kỳ quái.

Thu Hạ Hạ sau khi lấy lại tinh thần lại cất cao giọng mắng mỏ: “Nhìn gì mà nhìn? Còn nhìn nữa là tôi bắt các cậu đến đồn cảnh sát đấy!”.

Người nên bị đưa đến đồn cảnh sát phải là cô mới đúng.

Tiết học thứ hai, tại phòng cắm hoa tập thể.

 

Căn phòng nằm ở phía bắc của tòa nhà hội đồng là phòng cắm hoa tập thể, nhưng trong phòng lại chẳng thấy có một bông hoa nào, mà toàn là đồ ăn vặt và một đống tạp chí bói toán, nếu gọi là phòng bói toán tập thế có lẽ mọi người còn tin hơn.

Thực ra đội cắm hoa này không phải là để học cắm hoa, trên danh nghĩa là một đội cắm hoa nhưng trên thực tế lại là một tổ chức nữ hào kiệt, chuyên bảo vệ chính nghĩa, ngầm giúp đỡ các học sinh dạy cho “bọn ác bá” ở trong trường một bài học. Đội cắm hoa gồm có bốn thành viên, lần lượt là Đoạn Khanh Nhi, Lạc Phán Phán, Trương Nhã Tuyên và Thu Hạ Hạ. Bốn người họ…mà không, ba nữ sinh không cùng tuổi nhau đều có một trái tim nghĩa hiệp, vì vậy đã tự phát thành lập nên một nhóm hào kiệt. Còn riêng Trương Nhã Tuyên, cô ta là do Thu Hạ Hạ lôi vào, tính cách khá là dịu dàng hòa nhã, vì thế bình thường chỉ là giúp đỡ các công việc của đội cắm hoa, còn nói chung là không có nhiệm vụ gì.

Lúc này, ở chính giữa căn phòng, một chiếc bàn màu đỏ son đầy đồ ăn vặt, bốn cô gái ngồi quanh bàn, ăn uống, cập nhật tin tức gần đây, nói chuyện thật rôm rả.

Thành viên đầu tiên của đội cắm hoa – Lạc Phán Phán tự tin đầy mình nói: “Nhiệm vụ sắp tới của mình là bắt cái tên Giản Liên Hạo phải cam tâm “nôn” ra hết số tiền đã lừa được.”

Thành viên thứ hai của đội – Trương Nhã Tuyên hỏi: “Chính là cái tên Giản Liên Hạo yêu tiền đến phát điên, người khác mà nhìn cậu ta một cái cũng phải trả tiền, tên tiếng Anh là money, bút danh là RMB đó à?”.

“Đúng!” Lạc Phán Phán gật đầu, ánh mắt đầy tự tin.

 

“Cool!” Thành viên thứ ba – Đoạn Liêu Nhi giơ ngón tay cái tỏ vẻ tán thành, sau đó nghĩ đến nhiệm vụ của mình, tự nhiên cũng cảm thấy tự đắc: “Còn nhiệm vụ của mình là cải tạo cái anh chàng Bạch Quân Hàn của trường Tri Hiền từ một cái xác ướp trăm năm lạnh giá trở thành một người bình thường có thân nhiệt 36,5o C”.

“Hay lắm, nhiệm vụ đầy thử thách, cẩn thận kẻo nhiệt độ lại cao quá đầu, đốt cháy thành một con ngốc thì lại thảm.” Lạc Phán Phán mỉa mai bạn tốt của mình. Trước khi Đoạn Liêu Nhi nhảy dựng lên, Trương Nhã Tuyên đã kịp nhanh mồm nhanh miệng nói: “Nhiệm vụ của mình chính là làm sao cho thành tích của con heo ngu ngốc Hướng Vũ Phàm đạt yêu cầu”.

“Bái phục! Cái tên đội sổ toàn trường Hướng Vũ Phàm mà cậu cũng dám vượt qua thử thách.” Lạc Phán Phán hướng ánh mắt đầy khâm phục sang cô, giọng còn pha chút nhạo báng: “Nếu cậu có thể khiến cho con heo đầu óc bã đậu Hướng Vũ Phàm đạt được yêu cầu, thì cậu có khả năng ghi được kỷ lục Guinness rồi”.

Ba thành viên đều đã nói xong dự định của mình, chỉ còn lại người cuối cùng. Thế là ánh mắt của ba người trước mặt lại hướng sang vật thể lạ giống như cái xác không hồn, bất động đang nằm dài trên một góc bàn.

 

Ánh mắt của tất cả mọi người đều tập trung vào cái “xác chết” ấy, căn phòng lại rơi vào cái không khí tĩnh lặng đến đáng sợ. Ánh sáng mặt trời lan tỏa khắp phòng, thời khắc này thứ duy nhất hoạt động đó là những hạt bụi bay.

Một giây trôi đi…

Im lặng…

Mười giây qua đi…

Im lặng…

Ba mươi giây qua đi…

Vẫn im lặng…

Đến một phút trôi đi, cái “xác chết” ấy vẫn bất động.

 

Cuối cùng, Lạc Phán Phán với tính cách dễ kích động nhất, không nhẫn nại được nữa cầm một bông hoa trên bàn ném sang cái “xác chết” đó. Cái “xác chết” bị cành hoa đập vào ấy chẳng còn chút sức lực ngẩng đầu lên nhìn Lạc Phán Phán, sau đó lại nằm sụp xuống.
“Này, Thu Hạ Hạ! Khi nào cậu mới thoát khỏi cái “xác chết” này? Bình thường chẳng phải cậu giống khỉ hơn Đoạn Khanh Nhi sao?” Lạc Phán Phán lại ném thêm một bông hoa nữa.

Người được gọi là “xác chết” – Thu Hạ Hạ vẫn không có phản ứng gì, Đoạn Khanh Nhi bị gọi là khỉ, nhìn chằm chằm tức giận: “Lạc Phán Phán, ai nói mình giống khỉ? Mình tuổi con khỉ, không có nghĩa là mình cũng giống khỉ, cậu rõ chưa?”. “Con khỉ” hướng ánh mắt cầu cứu sang Trương Nhã Tuyên, tiện thể chêm thêm một câu: “Bình thường mình là thục nữ! Các cậu nói xem có đúng vậy không?”.

Trương Nhã Tuyên vốn có lòng muốn nói giúp cô ấy, nhưng khi cô nói ra câu này, Trương Nhã Tuyên lập tức lảng đi, giả vờ không nghe thấy gì. Xem ra mọi người đều có suy nghĩ giống nhau: Đoạn cô nương trông không giống khỉ, nhưng về cái tính cách này, đúng là không ai dám nói cô ấy không phải là bạn của khỉ.

 

“Con khỉ” cầu cứu không thành, liền tức giận lườm Trương Nhã Tuyên một cái, sau đó cùng bàn dân thiên hạ tập trung chú ý‎ vào cái “xác chết”.

Trương Nhã Tuyên ngồi bên cạnh Thu Hạ Hạ thực sự không thể nhìn thêm được nữa, thế là dùng tay lay lay cô.

“Chuyện gì vậy?” Thu Hạ Hạ ngẩn người quay đầu về phía mọi người.

“Câu hỏi này lẽ ra phải là bọn mình hỏi cậu mới đúng?” Ánh mắt mọi người đổ dồn về phía Thu Hạ Hạ, đồng thanh nói.

 

“Hả?” Thu Hạ Hạ cuối cùng cũng ngẩng đầu lên, nhưng vẫn cái dáng vẻ thất thần đó, “Mình làm sao?”.

“Hạ Hạ, sao tự nhiên hôm nay cậu như người mất hồn thế hả? Bọn mình đều nói về tình hình trong tuần này rồi, chỉ còn mỗi cậu chưa nói thôi đấy.” Lạc Phán Phán tỏ vẻ quan tâm nhìn cô, kiên nhẫn giải thích.

“Uhm…” Thu Hạ Hạ mệt mỏi đáp lại, sau đó ngồi thẳng dậy, thất vọng nói lên nguyên nhân về nỗi buồn của mình: “Nhiệm vụ tới đây của mình là khiến Âu Dương Dị phải hẹn hò với mình, sau đó bắt Chung Ngọc Thanh xin lỗi Nhã Tuyên. Mình đã vạch ra bao nhiêu kế hoạch, nhưng đều thất bại rồi. Sự việc lần này là như vậy đấy…”, Thu Hạ Hạ kể hết sự tình cho mọi người nghe, “Sau đó, chính xác là hôm nay, kế hoạch thứ hai của mình lại thất bại nữa rồi”.

 

“Thu Hạ Hạ, cậu đúng là xúi quẩy!” Nghe xong câu chuyện, Đoạn Khanh Nhi không chịu được liền nói.

“Mình cũng thấy như vậy.” Lạc Phán Phán gật đầu đồng ý, lần đầu tiên hai người này lại hiểu nhau như vậy.

“Này, các cậu đúng là chẳng có nghĩa khí gì cả!” Thu Hạ Hạ không biết tự lúc nào vênh mặt lên, nhìn chằm chằm vào mấy người bạn đang ngồi xung quanh cô, ném những lời cáo buộc. Ây da, đúng là kết nhầm bạn mà!

“Hạ Hạ, mình ủng hộ cậu! Mình thấy cậu làm thế là rất đúng, chỉ có điều là cái tên Âu Dương Dị đó rất may mắn mà thôi!” Lạc Phán Phán vỗ vai an ủi Thu Hạ Hạ.

“Thực ra mình thấy cách cậu làm không đúng đâu.” Trương Nhã Tuyên im lặng một lát rồi nói, câu nói này của cô đã thu hút sự chú ‎ ý của mọi người.

 

“Vậy thì mình phải làm thế nào?” Thu Hạ Hạ giống như người sắp chết đuối vớ được cọc, mắt sáng lên, không chịu được liền hỏi.

“Này, ghé sát tai đây…” Trương Nhã Tuyên làm ra vẻ bí mật lắm.

Ba cô gái tò mò vội vàng chụm đầu vào nhau.

 

Thực tế thì ý kiến của Trương Nhã Tuyên cũng không có gì là thần bí cả. Cô ấy chỉ kiến nghị rằng tốt nhất Thu Hạ Hạ nên đi tìm Âu Dương Dị để nói chuyện. Nếu thực sự không được, chỉ có thể dùng sắc đẹp để dẫn dụ thôi. Dĩ nhiên vẻ đẹp của cô không bằng những người con gái khác trong trường song đây là giải pháp cuối cùng.

Do vậy, Thu Hạ Hạ quyết định nghe lời của Trương Nhã Tuyên, đi tìm Âu Dương Dị nói chuyện thêm một lần nữa. Do Thu Hạ Hạ lo lắng vì chuyện hộp cơm ngày hôm qua mà Âu Dương Dị từ chối lời mời của cô, nên cô quyết định tìm lúc không có ai, ngầm hạ “chiến thư”.

Ví dụ giống như bây giờ, tất cả các học sinh đều tham gia giờ thể dục giữa giờ, đây là một cơ hội tốt để ra tay.

Thu Hạ Hạ cầm “chiến thư” đã được chuẩn bị từ trước, trên đường đi thì linh hoạt tránh các học sinh trực nhật đi kiểm tra các lớp học, nhẹ nhàng cẩn thận bước vào lớp của Âu Dương Dị.

“Phù… Hôm nay sao mà nhiều học sinh trực nhật đến thế, làm mình tránh mệt chết đi được…” Thu Hạ Hạ dựa vào cửa sau của lớp học thở hổn hển, phàn nàn từng lời từng chữ một.

 

Sau khi thở phù một cái, Thu Hạ Hạ lập tức bắt đầu tìm chỗ của Âu Dương Dị trong một đống chỗ ngồi, giờ thể dục giữa giờ đã được một nửa rồi, cô phải làm nhanh lên mới được, sau một hồi hỗn loạn, cuối cùng thì Thu Hạ Hạ cũng đã tìm thấy chỗ ngồi của Âu Dương Dị.

“Chiến thư để ở chỗ nào thì tốt đây?” Thu Hạ Hạ ngồi xuống chỗ của Âu Dương Dị, do dự nhìn trên mặt bàn rồi lại nhìn vào trong ngăn kéo.

Nếu như để trên mặt bàn thì gió sẽ thổi bay mất. Ngộ nhỡ để cho mấy đứa con gái nhìn thấy, cũng rất có thể… Không được, như thế rất có khả năng họ sẽ trực tiếp xé đi mất, như thế sẽ khiến cho cô một mình đợi trong công viên tối hôm đó đến chết mất! Điều đó kết luận rằng, để trên mặt bàn rất không an toàn. Chỉ có thể để trong ngăn bàn, chỉ cần Âu Dương Dị không ngốc đến nỗi để cho người khác lục đồ đạc trong ngăn bàn của mình, như vậy chắc chắn cậu ta sẽ nhìn thấy.

 

Nghĩ như vậy, Thu Hạ Hạ lôi sách trong ngăn bàn ra, muốn để “chiến thư” vào trong đó, nhưng đột nhiên có một vật gì nho nhỏ từ trong chồng sách rơi ra, cái đồ vật đó trong không trung phát ra ánh sánh kỳ lạ, sau đó rơi xuống dưới đất, vang lên một thứ âm thanh trong trẻo.

Thu Hạ Hạ nghi hoặc nhìn cái vật đang nằm trên mặt đất, sau đó nhẹ nhàng nhặt lên.
Cái đó giống như một cái huy hiệu, hình dạng mặt trăng tròn làm bằng đồng, bên trên có khắc hình dao lưỡi liềm, phía cuối hình dao lưỡi liềm đó có khắc một chữ “tử” có hình giống một giọt máu.

“Đây là cái gì? Huân chương kỷ niệm của trò Anime chăng? Âu Dương Dị thích sưu tầm cái này hay sao?” Thu Hạ Hạ thì thầm, lật đi lật lại để xem cái huy hiệu đã mấy lần, cảm thấy không có hứng thú gì cả, liền bỏ lại vào trong ngăn kéo, sau đó tiếp tục tìm một chỗ an toàn trong ngăn kéo để bỏ “chiến thư” vào trong đó.

 

Trong lúc Thu Hạ Hạ đang cố gắng tìm thì những âm thanh cười nói chế giễu từ đằng sau truyền tới làm cho cô ấy sợ đến nỗi ngã cả ra sàn nhà.

“Thu Hạ Hạ, hình như cô rất thích làm những việc không chút quang minh chính đại này nhỉ.”

Thu Hạ Hạ từ mặt đất bò dậy, cố gắng ngẩng đầu nhìn khuân mặt tuấn tú, nụ cười ấm áp ngay trước mặt. Tiểu tử đáng chết, làm gì mà cao thế không biết? Mẹ anh ta trong lúc mang thai anh ta, chắc chắn không có việc gì làm nên thường ăn mía! Nói cho cùng, trong lòng Thu cô nương vẫn không phải là đố kỵ với người cao hơn một mét tám kia, mà cô ấy lại chỉ khiêm tốn ở 1 mét 60, mà lại còn dùng cái phương pháp làm tròn để tính…
“Âu Dương Dị, cậu cho rằng tôi thích làm những việc này sao? Nếu như ngay từ lúc đầu cậu đồng ý hẹn hò với tôi, bản cô nương đã không đến tìm cậu như vậy!” Thu Hạ Hạ giọng điệu bực tức chỉ vào mũi cậu mà nói.

 

Âu Dương Dị tưởng như vẫn còn nguyên sự tức giận đến chết người, nhưng lại nở một nụ cười hiền hòa, những âm thanh liên tiếp tuôn ra ấm áp giống như dòng nước: “Dựa vào cách nói của cậu, trong thời gian tới cậu cũng phải đến làm phiền tôi? Thực chất tôi không có gì để nói, chỉ cần Thu Hạ Hạ cậu không cố ý làm cho người khác hiểu nhầm là đang theo đuổi tôi, vậy thì cậu có thể tiếp tục kế hoạch của mình”. Ý nghĩa trong lời nói là như thế, đại thiếu gia Âu Dương Dị cậu cũng không có ý định đồng ý hẹn hò với cô ấy.

Giờ thể dục giữa giờ đã kết thúc, âm thanh của từng đoàn người lên lớp trong sân thể dục truyền tới, trong thâm tâm Thu Tiểu Tường mặc dù không cam tâm, nhưng cũng hiểu được rằng nơi này không dễ dàng ở lại lâu, do vậy thở phì phì đưa “chiến thư” trong tay đến trước khuôn mặt tuấn tú có nụ cười hiền hòa kia, sau đó bực tức rời đi.

Thư thách đấu
Đồng chí Âu Dương Dị, do bất mãn với sự thờ ơ của cậu trong những ngày qua đối với kế hoạch theo đuổi của tôi, bản cô nương quyết định đàm phán với cậu. Hẹn cậu đúng 8 giờ tối nay đến bên hồ nước công viên Thủy Tinh. Đương nhiên, nếu như cậu thấy mình là một con rùa rụt đầu thì cậu có thể không tới.

Người thách đấu: Thu Hạ Hạ

Ha ha, sự việc dường như ngày càng trở nên thú vị đây.

Đôi mắt của Âu Dương Dị hướng về cái thân hình mảnh mai đang đi xa dần ở ngoài cửa sổ, đôi môi nở một nụ cười không biết là vui hay buồn.',
	1
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Oxford thương yêu',
	0,
	N'Truyện dài lấy bối cảnh tại trường đại học Oxford - Anh xoay quanh mối tình của cô sinh viên Việt Nam và người trợ giảng Bồ Đào Nha, với một kết thúc có hậu.\n\n“Oxford thương yêu” lôi cuốn người dọc bằng những đoạn tả cảnh thiên nhiên tuyệt đẹp, những quan niệm sống cởi mở và hướng thiện của một lớp thanh niên trưởng thành trong giai đoạn đất nước được đổi mới.\n\nỞ nhiều đoạn, tác phẩm được khắc họa như một bức tranh lung linh màu sắc và sống động hiện thực.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/oxford-thuong-yeu.jpg?itok=3K2uLCtX',
	N'Cô gái Việt Nam vô cùng rụt rè xuất hiện trước cửa văn phòng giáo sư Baddley sau tiếng gõ rất khẽ. Anh chàng trợ lý có gương mặt rất sáng, mũi thanh và đôi mắt đặc biệt thông minh niềm nở mời cô vào: 
“Tôi tin chắc em là Trần Vũ Thiên Kim - Anh phát âm tên cô một cách vụng về nhưng hoàn toàn duyên dáng - Em học hệ Cao học phải không? Giáo sư Baddley dặn tôi đưa em lịch học và cuốn giáo trình này”. 
Kim vụt trở thành một con người khác, cô vui vẻ và dạn dĩ trò chuyện cùng người trợ lý, đôi mắt sáng long lanh nhìn cuốn giáo trình dày cộp đã được photo sẵn: 
- Thật không ngờ giáo sư quan tâm đến tôi như thế - Kim siết cuốn giáo trình vào ngực như thể đấy là quyển thánh kinh làm người trợ lý bật cười - Tôi phải gửi lại anh bao nhiêu tiền photo? À mà anh tên gì? Anh có thể cho tôi địa chỉ e-mail không? Tôi xin học bổng ở một tổ chức phi chính phủ, họ chỉ cho học bổng trong một năm nhưng vì sang đây trễ do thủ tục giấy tờ phức tạp, thầy trưởng khoa nói chắc tôi đành phải kéo dài chuyện học trong hai năm. Anh không tưởng tượng được đâu, tôi khổ sở mấy ngày nay... 
- Ồ! Tôi tưởng tượng được chứ! Tôi là Fernando Carvalho - Người trợ lý mỉm cười - Tôi cũng là người nước ngoài mà. Tôi đến từ Bồ Đào Nha. Tôi đã hoàn thành chương trình Thạc Sĩ cũng bằng học bổng của chính phủ nước này cách nay vài năm. Rồi giáo sư Baddley nhận tôi vào làm trợ lý chính, giờ tôi đang trong giai đoạn nghiên cứu sinh. Đây là danh thiếp của tôi, em cần hỏi gì cứ tự nhiên nhé. 
Dù Kim còn muốn trò chuyện thêm tí nữa nhưng Fernando đã lịch sự mỉm cười tiễn cô ra cửa. Anh nói thêm như vừa chợt nhớ ra: “Em không phải trả lại tôi tiền photo sách đâu, coi như tôi tặng em một món quà nhỏ để chúc em can đảm lên!”. Kim thật sự cảm động, cô lắp bắp cảm ơn rồi bước giật lùi cho đến khi cánh cửa khép hẳn lại và Fernando cùng với nụ cười tươi rói của anh biến mất. 
Quả là những phút giây được an ủi sau bao nhiêu sự kiện làm Kim cực kỳ bối rối, đến nỗi gặp ai cô cũng lặp lại điệp khúc: “Tôi chỉ có học bổng trong một năm mà sang đây mới biết chắc phải học những hai năm. Bạn không tưởng tượng được đâu, tôi khổ sở mấy ngày nay...”. Cô thuộc týp người sống cần có người quan tâm và đã đắm mình trong sự yêu thương của gia đình từ bấy lâu nay đến mức gần như không trưởng thành nổi. Hôm qua khi trình diện giáo sư trưởng khoa, Kim bị ông ta phán cho một câu xanh rờn: “Cô sẽ không thể hoàn thành khóa Cao học này chỉ với một năm ngắn ngủi. Thật ra điều này cũng có thể xẩy ra nếu cô đến từ một nước nào đó ở Châu Á có nền giáo dục phát triển như Singapore hay Malaysia. Đằng này cô lại... Đã vậy còn nhập học trễ nữa chứ!”. Rồi khi Kim há hốc mồm ra một cách ngu xuẩn “Vậy... vậy thầy khuyên em phải làm sao?”, ông ta nhấn mạnh “Chuẩn bị tinh thần và tài chính để nếu phải kéo dài sang hai năm thì cũng không bị hụt hẩng!”. 
Thấy Kim ngơ ngẩn không buồn trả lời, ông trưởng khoa chép miệng: 
- Ở những trường Đại học danh tiếng trên thế giới, đôi khi người ta cũng buộc phải cấp bằng cho những nhân vật đến từ nước ngoài vì lý do ngoại giao hay chính trị. Tuy nhiên tôi không nghĩ cô thích bằng cấp kiểu đó. Cô đã đích thân tìm học bổng sang đây, cô được trường chấp nhận cho nhập học, nên tôi đoán cô muốn có kiến thức thật sự! Thôi cố gắng xoay sở. Tôi thấy không có vấn đề gì! 
Kim định nói “Dĩ nhiên, vì đó đâu phải là vấn đề của thầy!”, nhưng ông đã ra dấu tiễn cô với nụ cười nhếch môi vừa lạnh lùng vừa giễu cợt. 
Kim từ văn phòng khoa Kinh Tế trên phố Manor buồn bã không muốn quay về khu học xá, cô lang thang vào trung tâm thành phố nơi qui tụ những ngôi trường trực thuộc Đại học Oxford. Sang đây Kim mới ngỡ ngàng nhận ra Đại học thuộc loại lâu đời nhất châu Âu này có đến ba mươi chín ngôi trường độc lập khác nhau gọi là “college”. Mỗi college trông cổ kính và đẹp kiêu hãnh như những tòa lâu đài với những cánh cổng bằng gỗ được chạm khắc công phu và những ngọn tháp vươn cao quyền quí. Sinh viên và cả giáo sư chạy xe đạp luồn lách vào những con đường hẹp hay những con hẻm nhỏ lót đá di chuyển từ college này sang college kia. Kim biết rồi mình cũng sẽ được vào trong những ngôi trường cổ kính này dùi mài kinh sử, cô sẽ không học cố định ở một nơi mà tùy theo từng môn sẽ đến các trường khác nhau. Kim tưởng tượng mình như Harry Potter buổi đầu ngơ ngác nhập học ở trường Phù Thủy, ngôi trường cổ kính với những lớp học bé tí, những cầu thang đá nhỏ hẹp và những hành lang dài vô định. Và quả thật, bộ phim Harry Potter được quay tại những college ở Oxford. Ở ngoài phố, Kim thấy có rất nhiều khách du lịch và những đoàn học sinh được giáo viên dẫn đi tham quan Đại học Oxford. Hẳn họ muốn gieo vào lòng những học trò nhỏ niềm hy vọng được vào học trong ngôi trường danh tiếng này. Cô thở dài, nghĩ dù mình đã được nhận vào học nhưng áp lực lớn nhất là phải đi ra với mảnh bằng tốt nghiệp. Sau này về Việt Nam với cái danh học ở Oxford mà không chìa ra được giấy tờ chứng minh chắc Kim chỉ còn nước bỏ xứ đi luôn. 
Buổi tối trong khu học xá, gió gào hú không ngừng, mưa quất từng hạt nặng nề vào kính như thể muốn tìm đủ mọi cách chui vào phòng. Kim bất an chốc chốc lại đến bên cửa sổ nhìn ra ngoài trời đêm. Ánh đèn vàng cao áp đủ cho cô nhìn thấy cây cỏ oằn mình trong gió rét. Suốt đêm Kim cứ trằn trọc với câu hỏi “Làm sao có tiền để ở lại Oxford thêm một năm nữa?”. Cô đã đổ bao công sức để xin được học bổng của một tổ chức phi chính phủ và song song đó phải đáp ứng đủ yêu cầu của Đại học Oxford mới được nhận vào ngôi trường danh tiếng này. Vậy mà không lẽ phải quay về Việt Nam khi chưa hoàn thành chương trình. Bao nhiêu cố gắng lại bỏ phí đi sao? Mộng du học ở Anh đã được Kim ôm ấp hồi còn là học sinh Trung học. Cô luôn cố gắng trao dồi tiếng Anh từ những ngày đó, rồi trong suốt bốn năm Đại học, cô vẫn không ngừng truy tìm học bổng và duy trì điểm số luôn ở mức xuất sắc. Tốt nghiệp ra trường Kim vẫn chưa có cơ hội nên cô lại tiếp tục xoay xở tìm nơi cấp học bổng và xin các trường Đại học chấp nhận. Mãi đến ba năm sau khi tốt nghiệp Đại học, khi đã có một công việc thú vị trong một công ty uy tín, Kim mới hạnh phúc có được niềm vui biến giấc mơ từ thời học sinh thành hiện thực. Đó là cả một quá trình dài phấn đấu và kiên nhẫn không ngừng. Nhưng giờ giấc mơ đó chỉ mới thực hiện được một phần, quan trọng nhất là phải hoàn thành khóa học rất nặng bên đây theo đúng thời hạn một năm. 
Gia đình Kim tuy rất quan trọng chuyện học nhưng không đủ khả năng để nuôi cô trong một năm sinh hoạt ở Anh, nơi có mức sống thuộc hàng đắt đỏ nhất thế giới. Lương đi làm của Kim dành dụm được sau ngày ra trường cũng chỉ đủ cho cô mua sắm đồ đạc trước khi sang đây. Gần sáng, Kim tìm ra câu trả lời: “Chỉ có một con đường: bất cứ giá nào cũng phải học xong trong một năm như người ta! Cố gắng hết sức đuổi kịp ba tuần nhập học trễ. Phải làm cho ông trưởng khoa thấy người Việt Nam cũng học hành đàng hoàng không kém ai!” rồi mệt nhoài đi vào giấc ngủ nhiều mộng mị đến mức ngã lăn xuống nền gạch lạnh như băng. Khu học xá đã tắt lò sưởi trung tâm để tiết kiệm nhiên liệu. 
x 
Oái ăm, buổi học đầu tiên của Kim rơi vào sáng thứ bảy, vào cái ngày mà ai cũng cuộn tròn trong chăn ngủ vùi lười biếng. Ông giáo sư bận quá nhiều việc nên chỉ dạy vào giờ này. Cô khoác áo lạnh dày cộp, ôm cặp, xách dù mò mẫm bước ra đường. Trời hãy còn tối, không một bóng người dù đã bảy giờ ba mươi sáng. Các cửa hàng đóng cửa im lìm chìm khuất trong màn đêm. Kim bước lên xe bus và là người khách duy nhất trên tuyến đường chạy vào trường. Môn này cô học ở một cơ sở hiện đại nằm gần ga, không nằm trong trung tâm thành phố cổ kính. Khi bus dừng thả người khách cô đơn xuống trước khuôn viên khoa, mặt trời cũng vừa hé bức màn dày màu xám ló ra e thẹn. Kim đột nhiên thấy phấn chấn hơn, cô ngước nhìn cảnh bình minh lên với ánh hồng pha cam đẹp lạ lùng rồi mạnh dạn lần đầu bước chân vào giảng đường Oxford, nơi được biết bao người trẻ ao ước. Môn này đã bắt đầu được hai buổi và thu hút khá đông sinh viên nước ngoài. Tụi Ý ăn mặc diêm dúa, một cặp người Nga tóc hung ngồi đầu bàn, ba người nói tiếng Tây Ban Nha, vài đứa sinh viên Anh mặt đầy tàn nhang đang ngáp to như trực thăng kêu. Tất cả đều có vẻ không hài lòng thậm chí là phẫn nộ vì phải đi học vào ngày cuối tuần. 
Đúng tám giờ trợ lý Fernando đến phát tài liệu và vào lúc Kim hồi hộp nhất, giáo sư Baddley xuất hiện. Sẽ chẳng bao giờ cô có thể quên giây phút ấn tượng đó, một người đàn ông mập mạp, tóc húi cua, mặc chiếc áo len màu xanh thủy thủ có nụ cười hiền như bụt đang ngồi trên một chiếc xe lăn bằng điện dần dần tiến vào lớp. Giáo sư Baddley trứ danh đây sao? Kim ngỡ ngàng. Ông là người khuyết tật, chiếc xe của ông phát ra tiếng “rè rè” làm cô bối rối. Xe chạy ngang qua chỗ Kim, theo phản xạ tự nhiên cô đứng dậy cúi đầu chào giáo sư kính cẩn. Hành động lễ phép này làm sinh viên trong lớp hơi ngạc nhiên vì bọn chúng vẫn đang vô tư nhai kẹo cao su. Nhưng giáo sư không lấy đó làm lạ. Ông gật đầu chào lại và tiếp tục lái xe tiến đến bàn giáo viên. Sau vài phút hướng dẫn, giáo sư điều khiển xe lui xuống, nhường bục giảng lại cho một sinh viên người Tây Ban Nha. Mỗi người trong lớp phải soạn bài và giảng lại cho các bạn đồng môn. Vai trò của giáo sư chỉ hướng dẫn chung và chấm bài tiểu luận. 
Cuối buổi học giáo sư Baddley lái xe lăn đến bên Kim cười đôn hậu: “Em là người Việt Nam phải không? Tôi có nghe thầy trưởng khoa nói về trường hợp nhập học trễ của em. Hiếm khi có sinh viên từ Việt Nam. Cố gắng nhé. Cần gì cứ đến văn phòng của tôi, nếu tôi không có ở đó thì cứ nhờ trợ lý Fernando”. Kim xúc động lí nhí cảm ơn rồi nép người nhường đường cho ông lái xe ra thang máy. 
Trời đang mưa. Lại mưa. Những cơn mưa trứ danh của Anh, mạnh mẽ, dai dẳng, rơi mãi không ngừng. Gió thổi những cơn gió rét quất vào mặt Kim thật thô bạo. Cô quấn khăn vào cổ chặt đến mức gần nghẹt thở phải ho khan lên. Tụi sinh viên Oxford thích đi xe đạp và khóa xe đầy đường nhưng Kim biết mình chỉ ở đây không lâu nên chẳng cần mua xe đạp làm gì. Gặp lúc xe hư còn khổ thêm vì làm sao tìm được những chỗ sửa xe ngoài góc đường như bên Việt Nam. Ở trạm xe bus chỉ có vài người đứng chờ, miệng nhai nhóp nhép chút gì đó. Bụng Kim cũng cồn cào, cô mở cặp tìm mấy viên kẹo nhai cầm hơi. Đã một giờ trưa. Lúc xe bus chở Kim chạy ngang bãi đậu xe cô thấy giáo sư Baddley điều khiển xe lăn của mình chạy đến một chiếc xe hơi rồi loay hoay tìm cách chui vào đó. Thì ra ông tự lái xe đi dạy. 
Sau buổi học đầu tiên với người thầy dễ mến dù không có khả năng tự đi trên đôi chân của mình, Kim thất vọng nhận thấy những giáo sư còn lại tuy lịch sự nhưng khá lạnh lùng và gần như vô cảm với những khó khăn của người khác. Đa phần họ đều trông rất sang trọng với những bộ complet cắt may vừa khéo. Khoa Kinh Tế, giáo sư ngoài những giờ lên lớp còn hợp tác làm tư vấn cho các công ty và tham gia nhiều dự án đầu tư với các nước giàu. Kim hay nhòm ngó sang những khoa “hiền lành” như Nông Nghiệp, Lịch Sử hay Sinh Vật để ao ước học với những vị giáo sư mộc mạc, giản dị và nhiệt tình. Fernando bảo cô đừng trông đợi sự tử tế của bất kỳ ai. Cứ cố gắng hết sức rồi thì sẽ có một “quới nhân” phù hộ. Giáo sư Baddley là một người như thế. Fernando nói ngay trong cộng đồng Châu Âu, những nước giàu cũng hay xem thường những nước kém phát triển hơn. Bồ Đào Nha là một nước tụt hậu nhiều so với Châu Âu, nên bản thân anh trước kia cũng gặp khá nhiều khó khăn. Nhưng giáo sư Baddley vẫn đối xử với Fernando một cách hoàn toàn công bằng. Ông đánh giá anh qua thái độ cần mẫn, nghiêm túc trong công việc và qua tinh thần cầu tiến của một thanh niên đến từ một đất nước còn nhiều rào cản. Khi Fernando kể lại với Kim điều này, anh hơi ngượng. Cô cười, làm bộ trêu nhưng thực lòng thấy tự hào được anh chia sẻ: “Chà! Em thấy giáo sư biết nhìn người ghê!”. Fernando hơi đỏ mặt, đôi mắt thông minh ánh những tia lém lỉnh: “Đến từ những nước nhỏ thì chỉ có một con đường là nỗ lực để đừng bị người ta xem thường!” 
Nhiều đêm, khi gió không chịu ngủ cứ thang lang luồn lách vào những cành cây khẳng khiu làm chúng phải kêu lên răng rắc, Kim trằn trọc. Những người trẻ đến từ một nước nhỏ xíu gần như không tên tuổi như cô không phải chỉ muốn “đừng bị người ta xem thường” mà còn làm sao để được người ta tôn trọng. Nhưng quả thật “vươn lên” là điều ai cũng muốn nhưng không phải cứ muốn là được như câu tục ngữ tự phỉnh mình “Vouloir c’est pouvoir” (*) của dân Pháp. Học ở Oxford dù có cố gắng “lấy cần cù bù thông minh” hay “năng động - sáng tạo” kiểu gì thì so với sinh viên Anh, Mỹ hay các nước Châu Âu khác, Kim cũng chỉ là người đến từ một nước có nền giáo dục không được phát triển như ông trưởng khoa đã lo ngại. Những lúc phải nộp bài theo nhóm, bị chúng bạn tìm cách né tránh không cho cùng gia nhập, Kim vừa chán nản vừa phẫn nộ. Mấy đứa sinh viên nước ngoài - mà đa phần là dân châu Mỹ La Tinh và châu Á - đành tụ lại thành một nhóm “hợp chủng quốc”. Và với vốn kiến thức rất “ô hợp”, thường nhóm không bao giờ có được điểm cao và luôn nhận được những nhận xét rất khắc nghiệt của giáo sư. Một lần Kim ao ước: “Giá mà tụi sinh viên bản địa chịu “gánh” dùm mỗi nhóm một vài đứa nước ngoài thì điểm số mình không đến nỗi lẹt đẹt như vậy!”. Fernando đã nổi giận phản đối: “Với ý nghĩ đó, tự em đã xếp mình vào hạng làm gánh nặng cho người khác. Nếu muốn được nhìn nhận, phải có lòng tự trọng chứ!”. Lần đó cảm thấy bị “xúc phạm ghê gớm” Kim thề sẽ không bao giờ nhìn mặt Fernando nữa. Nhưng rồi cô chột dạ nhớ lại, ngày trước học Đại học ở Việt Nam, cô vẫn có thái độ xem thường những bạn từ các tỉnh xa. Cô nghĩ họ làm sao giỏi tiếng Anh bằng mình, làm sao năng động được trong điều kiện nghèo nàn sách vở, làm sao tiếp cận nổi giới doanh nghiệp vì có quen biết ai. Những người bạn đó cũng không được giới thành phố như Kim đón nhận, họ tự chơi với nhau, tự giúp nhau học rồi đi tìm việc để trang trải cho cuộc sống xa nhà. Chẳng bao giờ cô bận tâm khi nghĩ về những khó khăn của họ. Giờ đây sang Oxford, thấy khoảng cách giữa “người ta” và “mình” xa vời vợi, như thể người Sài Gòn tự nhận văn minh nhìn vào một cô nàng nào đó từ núi rừng mọi rợ bước ra đòi hội nhập. 
Trong khu học xá gồm nhiều căn nhà cổ theo lối kiến trúc Victoria trên phố Woodstock, Kim ngụ trong một căn nhà có mười hai nhân khẩu. Sang Oxford cô mới kinh ngạc nhận ra những hình ảnh các ký túc xá to lớn, rộng rãi thường thấy trên phim hoàn toàn chỉ thích hợp cho những trường Đại học ở Mỹ hay các thành phố hiện đại khác ở Anh. Oxford trung thành với lối kiến trúc cổ và tự hào vì điều đó. Những dãy nhà cổ bé tí dễ thương với những căn phòng cũng nhỏ xíu nằm trên những con phố xinh đẹp như Woodstock, Walton, St John... chính là những khu học xá dành cho sinh viên. Trong căn nhà chung của Kim, ngoài cô còn có Yutaka người Nhật và Lệ Chi người Trung Quốc là sinh viên nữ đến từ châu Á. Thời gian đầu có vẻ hút nhau vì cùng màu da vàng, ba người hay ăn cơm chung trong nhà bếp dưới tầng một, nhưng vài tuần sau Lệ Chi tự động lảng tránh nhóm các cô gái châu Á để hòa mình nhanh chóng vào thế giới châu Âu. 
Lệ Chi xinh xắn nhất, trẻ nhất, mới là sinh viên dự bị Đại học gọi là “A level”, nhưng cực kỳ chịu chơi. Lắm hôm khi đi xuống bếp pha trà, Kim giật mình đụng mặt cô bé từ phòng tụi Tây Ban Nha đi ra lúc đêm khuya. Kim đã thử khuyên Lệ Chi nhưng cô bé khó chịu ra mặt nên Kim quyết định “mạnh ai nấy sống”. Nghe đâu Lệ Chi là con một, cha là thương gia, mẹ trước kia là diễn viên, gia đình giàu có nhưng không hạnh phúc. Yutaka trái ngược hoàn toàn với Lệ Chi, cô trạc tuổi Kim, tính chững chạc và không nhan sắc nên sống khép kín. Yutaka học ngành khảo cổ, một ngành luôn tìm về với quá khứ nên trông cô cũng rất lạ. Bọn Tây ngại tính giữ kẽ của Yutaka nên thường cũng chỉ giao thiệp với Kim và Lệ Chi. Xem chừng họ quí Kim hơn vì cô thân thiện nhưng biết dừng đúng lúc, không quá đà và “dễ dụ” như cô bé Trung Quốc. Nhiều lúc Kim lắc đầu cười cho những ngộ nhận, trước kia cô cứ tưởng phụ nữ Nhật rất quậy còn con gái Trung Quốc đoan trang hơn. 
Sang đến cuối tháng mười, Kim vui mừng đón một đồng hương mới từ Việt Nam sang, chị là giáo viên một trường Đại học, sang tu nghiệp theo chương trình hợp tác với khoa Hàng Hải, sẽ chỉ ở Oxford bốn tháng. Mấy ngày đầu Thúy Hà phải nhờ Kim dẫn đi giới thiệu trường 
và giúp làm một số giấy tờ. Kim ngỡ ngàng nhận ra Thúy Hà hoàn toàn không hợp với mình. Chị nói tiếng Anh chưa rành nhưng hay ra vẻ ta đây, thích lên giọng đàn chị dù chỉ hơn Kim một tuổi. Kim thường nhìn cái cách “dốt mà làm như hay chữ” của Thúy Hà mà ngẫm đến lời giáo sư trưởng khoa: “Ở những trường Đại học danh tiếng, đôi khi người ta cũng buộc phải cấp bằng cho những nhân vật đặc biệt vì lý do ngoại giao hay chính trị”. 
Chán thực lực của Thúy Hà đã đành, Kim còn bất mãn với tính nết của cô bạn đồng hương. Có tí nhan sắc và dù đã có chồng với một con trai hai tuổi, Thúy Hà vẫn lúng liếng đưa tình với tất thảy bọn con trai ở đây, dù da đen hay da trắng, miễn vạm vỡ và đẹp trai là được. Cái vẻ lẳng lơ lộ liễu như Thị Mầu của Thúy Hà làm Kim xấu hổ khi có ai đó hỏi “Bạn và Thúy Hà cùng là người Việt Nam hả?”. 
Kim thất vọng nghĩ mình tìm không ra một người bạn tâm giao ở đây, trong lớp bị lạc lõng đã đành, về khu học xá cũng chỉ là những mối quan hệ xã giao. Có thể bọn Tây không lạnh lùng, thậm chí còn sẵn sàng giúp đỡ, nhưng bản thân họ cũng luôn bận rộn, mà Kim thì thấy thật tự ti. Vài anh chàng người Anh đẹp trai như hoàng tử William, chắc xuất thân từ gia đình quyền thế, đôi khi làm Kim rụng tim nhưng cô biết họ không dành cho mình. Cũng có chàng xấu trai và mặt đầy tàn nhang, nhiều lúc Kim muốn kết thân nhưng họ lại có vẻ mặc cảm. Những anh chàng nước ngoài khác đến từ khắp nơi trên thế giới, đủ mọi màu da, sang hèn các loại, đẹp trai cỡ Brad Pitt không thiếu mà ngáo ộp như một chàng Ivan nông dân cũng rất nhiều. Ai cũng “thủ”, tự tôn, tự ti rộn cả lên. Rốt cuộc, Kim kết luận: “Đừng mơ mộng gì nữa!” 
Từ ngày bị Fernando nói thẳng đến mức tự ái không thèm nhìn mặt anh, Kim tìm ra nguồn khác để trút những than thở của mình. Cô hay viết email về kể khổ và nhận được những lời động viên của bạn bè bên nhà. Tuy nhiên họ thường làm cô khó chịu. Có người vô tư hô khẩu hiệu: “Người Việt Nam mình ở đâu cũng giỏi!”. Người thì tin tưởng cô tuyệt đối: “Kim phải đứng nhất lớp đó nhé!”. Kẻ khác thuộc hạng “ếch ngồi đáy giếng”, chúc cô một câu xanh lè: “Học giỏi cho tụi Tây lé mắt luôn!”. Kim bực mình nghĩ lỗi này do các phương tiện truyền thông chỉ đua nhau ca ngợi những gương mặt Việt Nam thành công ở nước ngoài, rồi báo chí hè nhau hoan hô các học sinh - sinh viên đoạt giải thưởng và các huy chương quốc tế. Nhưng những trường hợp đặc biệt này chiếm bao nhiêu phần trăm? Còn bao nhiêu du học sinh học hành lẹt đẹt, ngoại ngữ lõm bõm, cày ngày cày đêm cũng chỉ mong vượt qua được ngưỡng không bị điểm liệt sao họ không đưa tin? Rồi chịu khó lên mạng Internet mà xem, ở khắp nơi trên thế giới còn bao nhiêu sinh viên Việt Nam bế tắc đến nỗi phải vào bệnh viện tâm thần hay thương tâm nhất là tự hủy mình, sao báo chí không lên tiếng? Kim căm ghét cái thói sĩ diện và hay ca ngợi của dân mình. Hay là càng tự ti nên mới càng tự tôn, dạng như Thúy Hà, giáo viên Đại học đó?
Nắng vàng trong vắt nhẹ nhàng đậu trên vai Kim. Một ngày thật hiếm hoi thấy bầu trời trong xanh hơn. Kim rảo bước vào trường qua cánh cổng gỗ xưa cũ và uy quyền. Cô có hẹn đến văn phòng của giáo sư Baddley. Giáo sư đón cô bằng nụ cười thân thiện nhưng Kim vẫn thấy hết sức hồi hộp. 
Giáo sư hỏi: 
- Bài tiểu luận này em có nghĩ rằng đã làm hết sức mình chưa? 
- Dạ... dạ... - Kim cố nén trả lời thật nhỏ nhẹ - Dạ rồi! 
- Em lấy thông tin từ đâu? - Giáo sư hiền lành nhìn Kim đang mướt mồ hôi, cười khích lệ nhắc - Hít sâu, thở đều! 
- Từ Internet, từ các sách em đã ghi vào tiểu luận mục “Tham khảo”, và từ...
- Từ đâu? 
- Từ... Fernando Carvalho, trợ lý của thầy - Kim lúng túng thú nhận, cô chợt nhớ mình chưa trả tài liệu cho anh từ dạo không nhìn mặt nhau đến nay - Có vấn đề gì không ạ? Thông tin đó Fernando có được từ kỳ thực tập tại công ty Euroexport cách nay ba năm. 
- Không sao. Tôi chỉ muốn biết em có năng động trong việc tìm dữ liệu không. Nhân tiện - Giáo sư Baddley cười ngụ ý - Fernando thường xuyên giúp em chứ? Không phải chỉ có môn của tôi mà những môn khác nữa chứ? 
Kim đỏ mặt, cô không biết nói sao. Cuối cùng cô thú nhận hai đứa có một vài tranh luận trong phương pháp học nên tạm đang trong thời gian suy nghĩ xem ai đúng. Baddley gật gù nhận xét: 
- Fernando là một thanh niên “được” lắm đó. Anh ta cũng có vài điểm giống em, cùng là người nước ngoài, cùng hiếu học, cùng rất tử tế. 
Kim chờ giáo sư khen thêm nhưng đột nhiên ông quay lại đề tài chính. Ông nhận xét bài tiểu luận của Kim thiếu nhiều chi tiết quan trọng, cách viết khó hiểu, trình bày chưa chuyên nghiệp. “Cách trình bày cũng quan trọng không kém phần nội dung - Giáo sư chân thành khuyên - Em nên nhờ Fernando chỉ cách cho. Sau này làm luận văn tốt nghiệp người ta còn đòi hỏi cao hơn!”. Kim gục gặc đầu ra vẻ đồng ý. Giáo sư khuyên thêm Kim khi cô khoác áo đứng dậy: “Em cũng nên nhanh chóng tìm đề tài làm luận văn đi. Nếu muốn tốt nghiệp chỉ trong một năm em phải làm việc cật lực hơn và phải có phương pháp”. Kim lại gật đầu lia lịa như một con rối nhưng cô không dám hỏi “Ai sẽ chỉ cho em những phương pháp học tập và nghiên cứu có hiệu quả đó? Em đến từ Việt Nam mà!”. Giáo sư đã lăn xe tiễn Kim ra cửa, cô lấy hết can đảm ngoái đầu lại: 
- Giáo sư! Em... 
Ngay khi Kim còn đang ấp úng và đứng dùng dằng chân trong chân ngoài ngay cửa phòng giáo sư Baddley, Fernando xuất hiện. Anh làm ra vẻ không nhìn thấy Kim nên cô cũng lúng túng cố phớt tỉnh. Cuối cùng giáo sư phải lên tiếng “Hai người không quen nhau sao?” rồi nhìn Fernando và Kim đang gườm gườm chào nhau lí nhí. Người đàn ông có nụ cười hiền như bụt lắc đầu ngao ngán: “Những người trẻ...”. Kim ngơ ngác nhìn ông rồi quay đầu hấp tấp bỏ đi. Sao giáo sư lại nói một câu không ăn nhập gì hết. 
Tối đó Fernando đột ngột ghé vào khu học xá của Kim khi cô đang đầu bù tóc rối vừa chiên khoai tây vừa chấm mút với cá hộp trong căn bếp tập thể sặc mùi dầu mỡ. Sốt cà đỏ lem luốc còn đọng lại trên mép cô làm anh bật cười rút khăn tay lau cho cô một cách chăm chú. Bọn bạn cùng ngồi ăn trong bếp chứng kiến cảnh này nhìn nhau ngỡ ngàng: “Cô nàng Việt Nam tưởng hiền lành này có bạn trai mà hồi nào đến giờ giấu kín!”. Kim quê nhất là ánh mắt thoạt ngạc nhiên rồi nhanh chóng giễu cợt “Vậy mà cũng bày đặt làm như chính chuyên lắm!” của Thúy Hà và Lệ Chi. Kim kinh ngạc đến nỗi đờ người ra không phản ứng bất cứ hành động nào. Thậm chí khi Fernando cầm tay lôi cô lên phòng, Kim cũng lê gót theo anh như kẻ mộng du. Anh nhìn ngó săm soi khắp căn phòng dù bé tí nhưng không ngăn nắp rồi lục tung sách vở giấy tờ bề bộn trên bàn cô một cách bất lịch sự. 
- Góc học tập của em là thế này đó hả? Không thể nào ngờ một cô gái trẻ trung như thế này mà có thể ở được trong một căn phòng kinh khủng như thế ấy. Chả trách học nhiều mà vẫn không hiệu quả! - Fernando gắt, giọng bất bình mà Kim vẫn chưa kịp tỉnh cơn mê, cô ấp úng chẳng nói được câu gì - Đã không có phương pháp mà còn tự ái cao không chịu nghe lời người đi trước! Có một người đầy kinh nghiệm ở đây mà không biết tận dụng! Sĩ diện hão! Nhảm nhí! 
- Hả? - Kim bắt đầu ý thức được chuyện gì đang xẩy ra - Ai khiến anh vào phòng tôi mạt sát chứ? Tôi không cần anh! 
Fernando đay lại: 
- Không cần? Vậy ai than thở với giáo sư mình đến từ Việt Nam, mình không được ai bày cho phương pháp làm việc có hiệu quả, mình bị cô lập, mình bị khó khăn? 
- Tôi không nói, không hề nói! - Kim phản ứng yếu ớt 
- Phải, em không nói - Ánh mắt nghiêm khắc của Fernando ánh lên - Nhưng thái độ tự ti, cách phản ứng tiêu cực, ánh mắt van nài của em đã làm giáo sư nhận ra ngay điều đó! 
- Thì sao? Thì sao? - Kim nổi điên thật sự - Ảnh hưởng gì đến anh? 
Fernando bị Kim lấn đến chân giường một cách ráo riết đến mức anh phải té lăn ra. Cú ngã làm chiếc giường sắt va vào vách tường thạch cao nghe đánh “rầm”, lại thêm đôi chân mang giày của Fernando vung lên đập vào “rầm, rầm” liên tiếp. Phòng bên bọn sinh viên ré lên cười: “Chúa ơi! Chúng nó “yêu” nhau bạo liệt quá!”. Kim còn nghe rõ ràng cái giọng cao vút điêu ngoa của Thúy Hà nói bằng tiếng Việt: “Thế mới biết ai cũng như nhau hết!”. Giờ Kim mới nhận ra tình huống kỳ cục này, cô lúng túng chẳng biết xử sự làm sao. Vậy mà đôi mắt sắc sảo của Fernando vẫn không tha nhìn vào cô chòng chọc. Cuối cùng, dĩ nhiên, Kim khóc. Cô không hiểu vì sao ở Việt Nam cô vốn không phải là loại hay “mít ướt” nhưng sang đây lại dễ cho người ta thấy mình yếu đuối đến như vậy. Càng khóc Kim càng nấc to. Càng nấc to Fernando càng cười lớn. 
- Anh là đồ độc... độc... độc... ác... ác... ác - Kim cố gắng lắm cũng không thể không cà lăm. 
- Độc ác! Độc ác! - Fernando mỉm cười lặp lại. 
- Tôi căm... căm... thù... thù anh! 
- Căm thù! Căm thù! - Fernando nhại, giọng giễu cợt 
- Tôi... tôi... 
Kim thật sự hết biết mình phải nói gì, cô chợt nhận ra nãy giờ Fernando vẫn nằm trên giường cô, nằm một cách thoải mái không thèm cởi giày, tay chống ngay thái dương, chân bắt chéo nhịp nhịp. Còn Kim, cô đang ngồi bẹp dưới đất khóc lóc. Thật chẳng ra thể thống gì! Cuối cùng Kim cũng phải biết đứng lên và xử sự cho đúng với vai trò chủ nhà của mình. Cô lấy hết sức dõng dạc hô: 
- Mời anh đi khỏi phòng tôi! 
- Dĩ nhiên! - Fernando tỉnh rụi trước sự “vùng lên” của Kim - Tôi không có ý định ngủ lại trong căn phòng bề bộn sách vở và khá là bẩn thỉu này! 
- Tôi... tôi... 
- Căm thù! Căm thù! - Fernando nhắc, mặt đểu hết chỗ nói. 
- Tôi... tôi... muốn giết anh - Kim hụt hơi. 
- Giết đi! - Fernando thách, giọng giễu cợt - Ăn toàn khoai tây chiên với sốt cà chua thì lấy đâu ra sức? Học còn không đủ sức nữa là giết người! Nè, cho đấm vô người tôi nè! Đấm đi! 
Kim nhìn thân thể cường tráng, cao ráo của Fernando, biết mình có đấm anh cũng như lấy trứng chọi đá. Nhưng lòng tự trọng không cho phép cô bỏ qua lời “thách đấu” này, Kim lấy hết sức bình sinh thụi một phát vô bụng Fernando và bị dội ngược lại ngay tức khắc. Fernando nhìn Kim ngã chúi ra sau, cười khinh khỉnh: “Có đau tay lắm không?”. Đến nước này Kim chỉ còn biết dậm chân khóc váng lên như một đứa trẻ bị đẩy vào chân tường. Fernando thôi không “độc ác” nữa, đôi tay rắn chắc ôm lấy vai cô vỗ về: “Thôi được rồi! Được rồi! Bình tĩnh! Rồi tôi sẽ chỉ em cách trả thù và cả cách làm sao giết được tôi nữa”. 
Phòng bên bọn sinh viên đang áp chặt tai vào vách tường mỏng dính hồi hộp. Cuối cùng, bọn chúng chán nản kháo nhau “Thôi, hết phim rồi!” và tục lục ôm sách vở tản đi. Dĩ nhiên là bọn chúng lầm. Tất cả chỉ mới bắt đầu. 
Từ đó mỗi sáng trời hãy còn tối đen, dù gió rét, dù mưa rơi Kim đều bị Fernando gọi điện dựng đầu dậy. Khi cô rửa mặt đánh răng xong, vừa ngáp vừa cột dây giày thì Fernando cũng vừa đến. Anh “kè” Kim chạy vòng vòng tập thể dục quanh khu học xá. Cô vừa thở hồng hộc, vừa mếu máo, vừa khóc thút thít, và vừa nguyền rủa kẻ thù đang “nâng cao đùi” chạy canh chừng đàng sau. Bắt một cô gái ẻo lả, ngại vận động như Kim phải có tinh thần thể thao thật khó vô cùng. Thế là Fernando chỉ còn cách “áp giải” kiểu này mới vời được cô nàng ra khỏi giường lúc đang ngủ ngon nhất. 
Trời tờ mờ sáng, khi mấy bà già trùm đầu kín mít dắt chó đi dạo thì Fernando cũng vừa kịp cho phép Kim tự do. Anh mồ hôi ướt đẫm leo lên xe hơi chạy lên trường Đại học. Trước khi cho xe lăn bánh Fernando còn kịp dặn: “Nhớ ăn sáng cho đàng hoàng rồi lên thư viện học! Đừng ngồi trong phòng, dễ bị “hấp lực” của chiếc giường lôi kéo”. Kim gục gặc đầu “Biết rồi! Biết rồi!”, cô đưa tay vẫy, chờ chiếc xe khuất sau cua quẹo chỗ cây phong trụi lá đầu đường rồi co giò nhảy vào phòng tắm. Nước lạnh làm cô tỉnh rụi, thấy tội nghiệp “người dưng” khi không phải cực khổ vì mình. Giờ này chắc Fernando cũng đang tắm ở trường rồi vội vã thay đồ tươm tất chuẩn bị làm việc. Tám giờ rồi, chắc anh chẳng kịp ăn sáng, hình như hôm nay anh phải làm trợ giảng cho giáo sư Baddley đến tận giữa trưa. 
Cuối tuần, Fernando lại bất ngờ xuất hiện lúc Kim đang áo xống xộc xệch, tóc tai rũ rượi nằm sấp trên giường xem mấy cuốn catalogue thời trang Lệ Chi cho mượn. Fernando không mặc complet, thắt cravate và khoác manteau trịnh trọng như những ngày đi làm trong tuần. Anh trẻ trung hơn với bộ đồ jean và cái áo thun trắng khỏe mạnh bên trong. 
- Trời ơi! - Fernando nhìn mấy cô người mẫu đẹp rụng rời chép miệng - Còn lâu em mới có được vóc dáng “chết người” này. Thay vì lo ăn uống tẩm bổ em lại nằm bẹp xem người ta xinh đẹp hơn mình. Không thấy tức sao? 
- Mắc chứng gì anh dám mạt sát nhan sắc của tôi? - Kim vừa tức giận vừa bối rối nhìn lại vẻ luộm thuộm của mình sau những phút bị “hớp hồn” trước vẻ bề ngoài của Fernando - Cuối tuần sao anh không ở nhà nghỉ ngơi đi? Cho tôi hít thở bầu không khí tự do một chút, vác mặt đến đây làm gì? 
Fernando khiêu khích: 
- Em làm như tôi khoái bám theo một người không-có-khả-năng-thu-hút-đàn-ông như em lắm. Em không thấy tụi sinh viên nữ bám theo tôi sao? Em đâu tới lượt! 
- Anh... - Kim tức nghẹn họng - Anh có biết tôi là một người nhạy cảm lắm không? Anh dám xúc phạm tôi vậy đó hả? Anh coi chừng tôi đó! Tôi... tôi có một tâm hồn nghệ sĩ... 
Fernando nhìn Kim đang đau khổ và tức giận, mắt cô long lên sòng sọc nhìn quả đáng ngại. Anh cố cười lớn nhưng đã thấy mình không nên chọc giận con gái ở cái khoản này. Fernando đành ra vẻ giảng hòa, anh lấy cây lược chỗ bồn rửa mặt ra đưa cho Kim: 
- Em là nghệ sĩ hả? Vậy có gì đâu mà tôi phải “coi chừng”. Tưởng em hù “tôi là võ sĩ” thì mới sợ chứ! Giỡn chút làm gì em nổi điên dữ vậy? Thôi chải đầu đi rồi tôi “hộ tống” em đi siêu thị. 
- Tại sao? - Kim ngơ ngác. 
- Cơ thể con người như một cái máy vô cùng phức tạp. Em không thể làm việc tốt nếu không nạp đủ nhiên liệu. Em đã bắt đầu tập thể dục, như vậy là rất tốt. Nhưng em còn phải ăn nữa cơ thể mới khỏe ra - Fernando cười, nháy mắt - và đẹp ra nữa! 
- Nhưng tại sao tôi phải đi siêu thị với anh? - Kim thắc mắc. 
Fernando nhìn thùng mì gói và mấy loại đồ hộp của Kim trên kệ, lắc đầu: 
- Vì em không biết cách đi chợ, không biết cách ăn uống cho đúng cách… Em muốn chết hay sao mà ăn toàn mấy cái thứ này? 
Ở siêu thị, Fernando dẫn Kim đến từng gian hàng, chỉ cô cách chọn từng loại thực phẩm sao cho thật tươi mà giá không quá mắc. Anh chất đầy một xe nào trứng, sữa, thịt bò, cá, rau củ, mì ống, nui, trái cây... rồi đẩy ra quầy thu ngân. Kim xót ruột rút thẻ tín dụng và gần ngất xỉu khi thấy hóa đơn chạy ra. Fernando làm lơ vẻ mặt ngơ ngẩn vì tiếc tiền của Kim. Anh lo chất thức ăn vào xe rồi chở Kim về khu học xá. Lúc hai người khệ nệ bê hàng hóa lên phòng, tụi sinh viên nhìn chằm chặp rồi mỉm cười đầy ngụ ý. Kim cố phớt tỉnh nhưng không hiểu sao lúc nào Fernando xuất hiện cũng có mặt Thúy Hà, chị ta lầm bầm một mình bằng tiếng Việt đủ lớn cho Kim nghe: “Chàng nuôi nàng kỹ quá!”. Kim vừa ngượng vừa quạu liếc xéo Fernando vì đâu phải anh trả tiền. 
- Trong một tuần em phải tiêu thụ hết tất cả những thứ này! - Fernando nghiêm túc căn dặn - Hãy uống sữa, ăn trứng và trái cây mỗi ngày. Nếu hôm nào không khỏe lắm thì ăn cá chứ đừng ăn thịt bò, khó tiêu. Phải uống cho đủ nước! Ăn uống phải đúng giờ, cấm không được bỏ bữa. Tuần sau tôi đến kiểm tra mà thấy còn dư đồ ăn thì đừng có trách! 
- Tôi không quen uống sữa, cũng không thích thịt bò - Kim bực quá cãi lại - Tôi thèm cơm Việt Nam mà anh bắt tôi ăn nui và mì ống thì sao tôi nuốt vô? Nếu bắt anh phải ăn... nước mắm mỗi ngày anh chịu nổi không? 
Fernando do dự vài giây rồi phán: 
- Tôi không cần biết, dù thích hay không em vẫn phải ăn. Nếu thèm cơm Việt Nam thì mỗi tuần cho em ăn một ngày. Còn lại phải ăn mì ống và nui. Những thực phẩm này làm bằng lúa mạch, bổ hơn gạo. Sữa uống chưa quen thì uống ít, từ từ tăng lên. 
- Tại sao chuyện ăn uống của tôi cũng bị anh kiểm soát chứ? - Kim nổi xung - Ăn theo kiểu Tây đắt gấp nhiều lần ăn theo kiểu Việt, mà còn không hạp khẩu vị nữa! 
- Nếu muốn ăn cơm Việt Nam thì đừng qua đây học - Fernando ngang tàng - Ở Việt Nam thời tiết có khắc nghiệt như bên đây không? Cường độ làm việc có cao như bên đây không? Em nhìn lại mình đi, ốm nhom ốm nhách, xanh lè xanh lét. Còn dân bên đây thì sao? Cao ráo, khỏe mạnh, hồng hào. Tất cả là nhờ cái gì? Em đừng có tiếc tiền cho chuyện ăn uống, đâu phải tiền em kiếm ra, mỗi tháng tổ chức cấp học bổng rót tiền cho em đầy đủ mà. Tại sao sống ở Anh mà cứ nhân lên tiền Việt làm gì cho xót ruột? Nếu em hà tiện, tôi sẽ méc họ để họ khỏi phải hốt xác em sau mùa đông này. 
Kim ngao ngán trước anh chàng độc đoán: 
- Có cần phải trù ẻo tôi ác miệng đến vậy không? Tôi ghét anh kinh khủng! 
- Thì cứ ghét đi! - Fernando bật cười - Thậm chí em còn muốn giết tôi nữa mà! Muốn làm được điều này em phải ăn chứ! 
Tuần đầu tiên Kim tiêu thụ không hết đồ ăn, Fernando đến kiểm tra rồi nhìn cô bằng cặp mắt vừa lạnh lùng vừa phẫn nộ: 
- Em có thấy ngày trời càng lạnh hơn không? Chỉ mới mùa thu thôi đó mà đã mặc cả chục lớp áo rồi! - Fernando đột ngột xấn đến lật áo Kim ra đếm làm cô không kịp phản ứng - Có muốn sống sót qua mùa đông sắp đến không? 
Kim run lập cập trước vẻ nghiêm khắc của Fernando nên lí nhí ngụy biện: “Bao tử tôi nhỏ quá!”. Fernando lắc đầu: “Tôi chỉ mua đồ ăn cho một người như em cần phải ăn, tôi còn ăn nhiều hơn em gấp chục lần! Chỉ có cố ăn mà làm không được thì đòi học hành gì cho nổi. Lúc nào nhìn em cũng lờ đờ, xanh lét, run rẩy. Coi có ra người ngợm gì không? Sao mấy cô nàng đẹp đẹp đó, cũng người châu Á mà đâu có thê thảm như em dữ vậy!”. 
Không muốn bị Fernando la lối, xỉ vả, đem nhan sắc cô ra đay nghiến hoài, tuần sau Kim phải nhờ tụi sinh viên ở chung nhà ăn dùm dù tiếc đứt ruột. Mãi đến tuần thứ ba Kim mới ăn được hết số thức ăn theo chỉ tiêu Fernando đề ra. Cô cảm thấy không đến nổi khó ăn theo khẩu phần Châu Âu rồi nhận ra mình không còn bị chóng mặt và xây xẩm mặt mày nữa. Cô nghĩ quả Fernando luôn có lý, tiếc là anh không biết nói dịu dàng. 
Fernando luôn có những nguyên tắc của mình mà Kim luôn than trời “Thật là khắc kỷ!”. Nhưng anh đã thành công trong việc tạo cho cô thói quen tập thể dục mỗi sáng và ăn uống đầy đủ chất. Vì thế những nguyên tắc khác trong học tập thể nào Kim cũng phải theo. 
- Tôi chỉ em cách lên lịch học thế này: phân bổ ra giờ đọc lý thuyết và tìm tư liệu, còn đây là khoản thời gian em làm bài tập. Sao, có ý kiến gì không? 
- Không! - Kim gục gặc - Anh nói gì mà không đúng? 
Fernando nén cười: 
- Tôi đâu có độc tài dữ vậy! Em chẳng biết tí gì về phương pháp làm việc. Biết quản lý tốt thời gian là em có thể thành công được năm mươi phần trăm rồi! 
Fernando tiếp tục chỉ đến cách sử dụng phần mềm vi tính mà Kim tưởng mình đã giỏi hóa ra còn chưa biết gì: Power Point để thuyết trình sao cho thật sinh động, Winword để trình bày các tiểu luận sao cho thật chuyên nghiệp, cách dùng những công thức tài chính trong Excel sao cho tiết kiệm được thời gian mà tiện lợi, cách đọc sách sao cho hiệu quả, cách lên mạng Internet tìm thông tin nhanh chóng, cách nhớ công thức bằng cách ghi lên các mảnh giấy nhỏ dán khắp phòng... Mỗi khi bày cho Kim một phương pháp nào, Fernando chỉ nói qua một lần. Cô phải ghi chép lại để tự mình ứng dụng. Anh dứt khoát không nhắc lại lần thứ hai. Hôm nào lỡ quên, tốt nhất Kim nên đi lang thang khắp khu học xá hỏi ai đó, chớ dại hỏi lại Fernando sẽ bị anh đập bàn quát: “Đã biết trí nhớ không tốt thì phải ghi lại chứ! Tôi ở không đi theo nhắc tò tò cho em hoài sao!”. Kim thấy thật nhức óc. Nhiều lúc Fernando chép miệng than “Bên đây tụi con nít cấp một đã được dạy cách học hiệu quả, còn em lên đến Cao học mới bắt đầu làm quen!”. Kim tự ái kinh khủng nhưng may anh cũng biết an ủi: “Nhờ tiếng Anh của em rất tốt, nếu không còn chết nữa!”. Những lúc phải “ngậm bồ hòn làm ngọt” cho Fernando “lên lớp”, cô thầm tiếc giá anh là một người thầy của mình từ hồi còn ở Việt Nam, hẳn cô không đến nổi “lù khù” đến vậy. 
Hầu như ngày nào Fernando đi làm về cũng phải ghé qua khu học xá “phụ đạo” cho Kim. Lúc thì anh kiểm tra bài tập, lúc dạy cô thêm một phương pháp mới để xử lý thông tin. Có hôm đến tối mịt, hơn mười giờ Fernando mới có thể ra về. Nhiều lúc Kim muốn trêu “Anh dặn tôi ăn uống đúng giờ mà sao bản thân anh giờ này còn chưa ăn tối?” nhưng rồi không muốn “chọc vào ổ kiến lửa” nên nhịn cười nhìn Fernando khàn giọng dạy dỗ mình mà bao tử hẳn đang kêu réo nên lắm lúc phải xin xỏ “Em có thể cho tôi một ly sữa không?”. Những lúc như thế Kim thấy thật mềm lòng, cô đưa ly sữa được rót gần tràn và hào phóng cho anh thêm vài loại trái cây. Kim muốn nói một câu gì đó pha trò cho không khí vui vẻ một chút nhưng Fernando lúc nào cũng nghiêm và sẵn sàng nổi quạu. Có lẽ vì anh đang mệt mỏi quá. 
Mỗi lần Fernando xách cặp từ phòng Kim ra về với cái dáng vẻ bơ phờ, Thúy Hà lại cười cợt nói với cô “Em hành anh ta xanh lè cả ra! Lúc vào đi đứng đàng hoàng, trở ra sao toàn phải đi hàng hai!”. Thoạt đầu Kim hay buồn nôn với cái giọng đĩ thõa của một người đang làm giáo viên, về sau cô tự an ủi nhờ Thúy Hà nói tiếng Anh tệ quá nên bọn Tây không biết chị ta ăn nói kinh khủng đến mức nào. Kim vẫn thường bực tức Fernando cứ bắt cô phải đóng cửa phòng để yên tĩnh tuyệt đối lúc anh đang cùng cô làm việc. Anh rất ghét cái cảnh chốc chốc bọn sinh viên lại gõ cửa lúc mượn cây thước, khi rủ đi chơi, hoặc nhiều khi chỉ giả bộ hỏi xin cái khăn giấy để tò mò nhìn vào phòng. Fernando làm hẳn một cái bảng đánh vi tính “Xin đừng làm phiền, tôi đang làm việc!” treo ngay cửa phòng Kim từ lúc anh bước vào. Chưa hết, Fernando cực đoan đến mức ra lệnh với Kim: “Chỉ khi nào em nghe chuông báo cháy mới được mở cửa ra, còn bất cứ tiếng động nào em cũng phải mặc kệ! Chính tôi cũng tắt điện thoại di động khi đang dạy em đây!”. Cái mặt hình sự của anh không những đe được Kim mà cũng dọa được tụi sinh viên chung tầng lầu. Dần bọn chúng cũng thôi không nhiều chuyện nữa. 
Biết rằng Fernando luôn vì mình, thế mà khá nhiều lần Kim không cưỡng lại được sự lười biếng cố hữu. Do tối thường trằn trọc nhớ nhà và lo lắng chuyện học, cô không ngủ thẳng giấc, sáng lại phải thức sớm tập thể dục nên thường ăn sáng xong thì mắt đã nhíp lại. Không cách chi chống cự nổi, thế là đành chắc lưỡi “Ngủ vài phút!”. Leo lên giường, trùm chăn kín, ấm áp thế này, được ngủ là một hạnh phúc vô biên. Và rồi dù lương tâm vừa cắn vừa rứt trong suốt giấc ngủ đến mức mộng mị thấy Fernando phùng mang trợn má la hét ỏm tỏi “Lên thư viện học, đừng có ngồi trong phòng dễ bị cái giường quyến rũ!”, Kim vẫn không sao tỉnh được dù chuông đồng hồ đổ liên hồi. Đưa tay tắt chuông, Kim còn kịp nêu cái cớ “Ai biểu mình không biết uống cà phê... Ngủ thêm một tí... Ra sao thì ra...”. 
Và cái sự ra sao thì ra đó là đến tận mười một giờ Kim mới lồm cồm bò dậy, vừa xỉ vả mình vừa vội vã khoác áo chạy ra bến xe bus để vào thư viện. Thế mà đểu, cô còn dám mon men đến phòng học có Fernando đang cho sinh viên làm bài tập. Đứng bên ngoài cửa sổ nhìn vào, Kim nháy mắt ra hiệu, thấy anh nhìn ra, cô giả bộ vươn vai, làm ra vẻ từ sáng sớm đến giờ phải ngồi trong thư viện học tập miệt mài lắm. 
Sự giả dối này của Kim thật non tay so với một người sắc sảo như Fernando. Anh không thèm theo dõi cô làm gì cũng biết cô có học hành đàng hoàng trong thư viện hay nằm nhà đánh một giấc đến trưa. Cuối tuần Fernando đến, chỉ cần anh kiểm tra tiến độ bài tập, hỏi vài câu trong giáo trình là phát hiện dễ dàng Kim có “vấn đề”. 
- Sao? Công chúa lười biếng? Cô đã làm gì suốt cả tuần nay mà bài tập tôi giao chưa xong, sách cũng chưa đọc, số liệu chưa tìm? 
Ánh mắt Fernando nghiêm khắc đến mức Kim run bần bật và mồ hôi vã ra. Cô lí nhí: 
- Em... em... em bệnh! 
- Bệnh gì? - Fernando lạnh băng. 
Kim cố thuyết phục: 
- Em bị cảm cúm. Ngày nào em cũng bị rã rời, cơ thể em đau nhức, mắt em mở không lên, em ăn không được... 
- Em chỉ có ngủ thôi! - Fernando thêm vào - Tại sao run dữ vậy? Mà mồ hôi nhỏ ròng ròng trên trán nữa kìa! Chắc bệnh thật rồi! 
- Dạ, em bệnh - Kim gật đầu xác nhận 
Kim chưa kịp vui mừng vì đã thuyết phục được Fernando anh đã đập bàn đánh “rầm” đầy giận dữ: “Lười biếng thì có thể tha chứ dối trá thì không chấp nhận được!”. Tiếng đập bàn cộng thêm tiếng thét bất mãn của Fernando rồi tiếng khóc rống não nùng của Kim làm thành một “tạp âm” đầy kịch tính, thu hút gần như toàn bộ sinh viên ở tầng lầu. Bọn chúng tranh nhau áp tai vào cửa và hai vách của hai phòng kế bên như những con ruồi bẹp dí bên hủ mật. 
Giọng Fernando cao vút: 
- Còn gì để nói nữa không? - Hu... hu... hu... - Chỉ nghe Kim khóc già. 
- Em nghĩ tôi là ai? - Fernando đanh giọng - Tại sao mỗi sáng tôi phải đến đây tập thể dục với em? Tại sao cuối tuần tôi phải đi siêu thị với em? Tại sao tôi phải mất thời giờ và công sức để quan tâm đến cái sự học của em? Tại sao tôi muốn em làm việc có phương pháp? Tại sao tôi muốn em có sức khỏe tốt? Tại sao? Tại sao? 
Bên ngoài, bọn sinh viên nhiều chuyện cũng nhìn nhau hỏi: “Tại sao? Tại sao?”',
	1
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Gái Già Xì Tin',
	0,
	N'“Sai lầm của những đứa ế chồng là chuyên gia đi tụ tập với những đứa… ế chồng còn lại”.\n\n“Gái già xì-tin” là câu chuyện của một cô gái thú vị, là sự chờ đợi ngọt ngào và những diễn biến tình cảm rất đỗi dịu dàng nhưng vô cùng mãnh liệt. Đó là nơi mà giữa cuộc sống bộn bề này bạn tìm thấy được sự lạc quan yêu đời, những khoảng lặng bình yên giản dị mà thật nhiều ý nghĩa.\n\nHãy đừng nghĩ rằng tên truyện sẽ ngăn bạn khỏi danh sách những độc giả phù hợp. Có thể bạn không phải” gái già”, có thể bạn còn rất trẻ hay đã lớn hơn, là con gái hay là con trai, bạn đang sống trong những tình cảm ngọt lịm, hay đang gặp cách trở đắng cay, tôi tin rằng bạn đều tìm thấy một phần của mình trong câu chuyện ấy…',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/gai-gia-xi-tin.jpg?itok=6uvNwCpz',
	N'Một đêm nào đó. Một góc nào đó, ở Hà Nội, có cô gái vào ngày 28 tuổi đã đập tay cái rầm xuống bàn, khiến cốc nước ngô nước bay tung tóe. 

“Tao thề là khi nó đến nhất định tao sẽ tát cho nó một nhát”.

“Nó”, ở đây đích thị là thằng chồng tương lai, chưa rõ tuổi tên mặt mũi của Dương. Ấy là, nếu trường hợp vui vẻ nhất, Dương có thể lấy được chồng ^.^ ^.^ ^.^


*

*                    *



Dương, cô gái tóc ngắn, khuôn mặt tròn trịa, đôi lông mày đen vắt ngang cương trực ngồi nhìn hai cô bạn thân đang miệt mài cắm mặt ăn ốc, lòng ghen tị không ít. Mình, học hành như tụi nó, nhan sắc thường thường bậc trung như tụi nó, đi làm lương bổng sàn sàn như tụi nó. Thế mà, sao tụi nó lấy chồng ngon nghẻ, mình lại không???

Thế nên, lí do không nằm ở cô, mà nằm ở… thằng ngẫn là thằng chồng tương lai của cô kìa. Cho nên, nhất định, nhất định, khi nó đến phải tát cho nó một nhát. Không kềm được suy tư trong lòng, Dương dằn cốc nước ngô xuống, phun ra câu tuyên bố  sặc màu bạo lực khiến cả Lam lẫn Duyên giật nảy mình.

Lam bình tĩnh đặt cái thanh sắt nhỏ bằng kim loại – vũ khí giết … ốc hàng loạt xuống bát, giọng vô cùng hóng hớt.

“Sao, sao! Vụ gì vụ gì!”

Duyên mặt đã đầy hứng chí, bắn ra một tràng liên thanh

“Sao, mặt bàn là một, mặt “đứa nào” là hai, – cần – phải – vả  – đôm – đốp??? Hả?… Nó là đứa nào???? Nó làm gì mày…????

Dương cầm cốc nước ngô vừa “bay” đi một ít nước, uống ực một ngụm lớn.

“Lại còn làm gì???? Nó khiến tao thành gái già thế này mà mày còn hỏi nó làm gì??????????????????!?

Thấy mặt của  Duyên và Lam cùng ngẩn ra, những diễn biến éo le kiểu phim Hồng Kông, Đài Loan xẹt xẹt qua hai đôi mắt láo liên, Dương chép miệng não nề.

“Hai con hâm này. Nó là thằng chồng tương lai của tao í! Đằng nào cái số của nó cũng phải lấy tao đúng không? Thế mà sao nó cứ lạng quạng mãi ở đâu, không đến khuân tao đi, để tao sống cái kiếp gái già những mấy chục năm, cứ tưởng là mình ế thế này…

Lam và Duyên trợn mắt nhìn nhau, lát sau phá lên cười sằng sặc. Duyên cố nín cười.

“Chuẩn, chuẩn!  Phải tát ngay. Tiên sư nó, nó lại để bạn Dươngdễ xương của tụi mềnh sống trong nỗi lo nơm nớp ế chồng thế là dư lào????

Lam cười khằng khặc khác hẳn vẻ thùy mị làm hàng  “Ừ, tát ngay. Dạy dỗ ngay từ lúc nó thập thò vác mặt vào, đừng như tao bây giờ bị thằng chồng nó đè đầu cưỡi cổ”

Dương chép miệng một tiếng lớn.

“Haizzz, cái thằng này nó ngẫn quá! Chỉ có việc đến rước mình đi mà không biết đường, giờ chả biết còn lang thang ở cái xó nào!”. Rồi nàng ta nghiến răng trèo trẹo “Đến đê. Rồi chị mày đây sẽ tát cho mày quay như đĩa hát luôn”

Ở bàn bên cạnh, có cậu thanh niên, mặt búng ra sữa, nghe câu cuối cùng của Dương phụt ra một đống nước trong mồm, vừa phun phì phì vừa cười sằng sặc.


Uống xong 1 bụng đầy nước ngô, tẩn xong cũng đến bốn năm đĩa ốc, Dương chia tay hai cô bạn thân, lững thững đi về khu chung cư của mình, vừa đi vừa “ợ” lên vài tiếng đầy khí thế.

28 tuổi, làm một phóng viên tự do của một tờ báo du lịch, phát hành một tuần một số, Dương được thiên hạ đương nhiên xếp vào đám gái già có nguy cơ ế chồng cao ngất ngưởng. Thứ nhất, cô chẳng xinh đẹp gì! Thứ hai cô chẳng giàu có gì! Thứ ba cô chẳng được cái … nết gì! Thế nên, giờ đây, ngoài vài mảnh tình nát như … tương bần thời phổ thông hồng hồng tím tím, và một chuyện tình yêu éo le như cây tre trăm đốt với một anh chàng có vợ thì Dương, tay trắng vẫn hoàn trắng tay.

Từ khi  22 tuổi, tốt nghiệp đại học bố mẹ Dương bắt đầu rền rĩ về việc cô con gái chẳng thấy yêu đương gì, chỉ tối ngày tụ tập bù khú với đám bạn cũng … ế ẩm như mình. Bố Dương có lần đập bàn đập ghế “Sai lầm của những đứa ế chồng là chuyên gia đi tụ tập với những đứa… ế chồng còn lại”. Haizzz, không tụ tập với những đứa ế chồng thì tụ tập với… ai cơ chứ. Nhưng đến năm 27 tuổi,  đám bạn từng được xếp vào diện nguy cơ tiềm ẩn ế ẩm cũng đã “xuất chuồng” sạch sành sanh. Thỉnh thoảng lắm, Duyên mới trốn được anh chồng hay ghen lồng ghen lộn của nó, còn Lam thì tống được  thằng cu đang hồi mọc răng cho bà giúp việc rồi chạy sang buôn dưa cà mắm muối với Dương. Ba đứa lại ngồi thả phanh trà lá, chém gió phần phật, và một cách dịu dàng cũng có khi… thô thiển nhất, chúng nó an ủi Dương.  Rằng, cái duyên cái số rồi nó sẽ vồ lấy nhau, không việc gì phải xoắn. Chỉ sợ đến khi nó vồ vào rồi, Dương lại chẳng giãy ra được ấy chứ…

Ừ, thì Dương có “xoắn” đâu. Chẳng qua, đôi lúc, nhìn Lam bế thằng Nghé bụ bẫm, hay thấy Duyên vừa sung sướng vừa khổ sở vì bị ông chồng quản thúc cả ngày, Dương lại thấy lòng mình có đôi chút ganh tị và thèm muốn.

Hay đôi lúc, nhìn bố mẹ ngày ngày nhận thiệp cưới của người ta, mặt mũi to đùng hai chữ “chạnh lòng”, Dương lại thấy mình như có lỗi.

Xoa xoa cái bụng còn căng tức vì no, Dương nặng nề bước lên bậc thang khu chung cư. Rút chìa khóa ra mở cửa, Dương chợt sững lại ngạc nhiên. Căn hộ nhà bên cạnh mở cửa.


Từ ngày cặm cụi mua căn hộ trả góp này, Dương chưa từng thấy láng giềng của mình mở cửa, thậm chí, lâu dần cô đương nhiên coi nó như là không người ở. Thế mà đêm nay, ánh đèn hắt ra từ phòng phủ vàng một khoảnh dãy lan can, khiến Dương thấy lạ lẫm.

Chẳng  biết chủ nhân bên ấy là ai nhỉ? Già trẻ, gái trai? Mặt ngang mũi dọc mắt mọc hai bên thế nào. Rồi chợt cười cợt mình tò mò không đâu, Dương nhún vai, mở khóa đi vào nhà, đi thẳng vào toilet đánh răng rửa mặt, mắt lại thô lố nhìn cái con bé là mình ở trong gương, bọt đánh răng đầy miệng, kìm nén một tiếng thở dài ầm ĩ.

Gieo mình xuống giường, Dương lầm bầm tự chúc chính mình vài thứ vớ vẩn, đại loại như là sẽ tìm được 1 thằng chồng “ngon”, tiền kiếm đủ tiêu còn dư lâu lâu đi chơi một bận. Thậm chí khi cơn buồn ngủ bắt đầu kéo đến kéo sụp mí mắt, Dương vẫn còn kịp trấn an mình, không, mình chưa già, hôm nay không phải mình 28 tuổi.

Chỉ là, mình mới 14 tuổi lần thứ 2 mà thôi ^.^
Dương  khoác ba lô vào khu lễ tân của Resort Rainbow  check phòng. Cô có 4 ngày hưởng thụ ở khu resort đẹp nhất nhì miền Trung này, và viết loạt bài PR  nơi đây. Anh Tân, trưởng ban biên tập đã vỗ đầu cô và bảo viết cho ngon nghẻ vào. Anh quý cô lắm lắm mới nhường suất này cho cô. Dương  nhe răng cười he he giấu đi vẻ cảm động. Với cô, Tân không khác gì người anh thân thiết, đôi khi thậm chí xô bồ, nhưng thực tâm quý mến lẫn nhau.

Những ngày mới đi làm, được Tân phái đến những khu du lịch thế này, Dương  bao giờ cũng sướng mê tơi rụng rời. Giờ cảm giác đó nhạt đi nhiều, nhưng bản tính thích du hí khiến cô mỗi lần xếp ba lô vẫn thấy vô cùng phấn chấn.  Nhất là khi nghe Duyên và Lam cằn nhằn chúng nó đeo gông cùm vào cổ, không thể nào mò đi đâu được và đang ghen tị với cô đến phát khóc lên.

Cầm chìa khóa  phòng, Dương  đi về phòng mình. Đó là căn phòng rộng, nhìn ra biển, với những bức rèm trắng mềm mại như tơ. Ngoài ban công, có chiếc ghế trắng xinh xắn, cả một chiếc ô kiểu cách trên đầu. Dương  nghĩ buổi sáng ngồi café đọc truyện ở đó thì phê phải biết.

Tiếng điện thoại vang lên khiến Dương  giật mình. Là Tân gọi.

“Alo, em đây sếp ơi”.

Tiếng  Tân vọng đến bằng điệu cười khà khà quen thuộc.

“Đến nơi rồi hử? Sao, thấy ngon không”.

“Ngon”

“Anh đã bảo mà lị. Này, mang súng ống đầy đủ hả! Chụp đẹp vào. Anh dành cả trang bìa cho mày đấy!”

Dương  vờ vịt nhăn nhó.

“Biết mà! Biết mà! Khổ lắm nói mãi”

“Không! Có cái này chưa nói. Nhớ làm một bài phỏng vấn với tay Hoàng Định, người làm ý tưởng và thiết kế khu này…”

Dương  khựng lại, lăn tăn “Hở? Đấy là tay nào? Lão í ở đâu mọc ra ấy, em tiếp cận kiểu gì được”

Tân cười hề hề “Rồi, tí check mail là biết. Cứ đến lễ tân hỏi anh Định là ra ngay í mà. Thấy bảo tay này lúc nào cũng có một phòng đặc biệt ở RainBow mà!!!”.

Dương  chép miệng “Rồi. Sếp gửi liền đi. Hix, tự dưng lại phát sinh thêm một bài…

“Thì lại phát sinh … nhuận bút nữa còn gì. Về đây anh bao trà bát bảo. Nhá!

Dương  phụng phịu “Em thèm vào trà bát bảo 2 nghìn của anh”

Tiếng Tân cười phá lên “Trượt giá lên 3 nghìn lâu rồi Nấm ạ!” rồi điện thoại rơi cái tạch một cái.

Dương  lẳng con Blackberry to bằng cục gạch, ngồi lọ mọ lôi máy tính ra. Cô biết tính Tân, vừa nói vừa làm, trong lúc buôn với cô thế nào cũng nhanh tay gửi mail rồi.

Dương  mở máy, thấy có thư mới. Nhưng không phải của Tân.

Đó là địa chỉ của Long.

Long, người đã khiến cô đã hồn xiêu phách tán hai năm trước.

Sự xuất hiện đột ngột của bức mail khiến Dương  thừ ra. Cô bất ngờ khi một bức mail cũng có thể khiến mình ngẩn ngơ đến vậy. Cô đã từng nhớ nửa năm trước, Duyên và Lam đã lôi “chuyện tình” sến như con hến của cô ra mà chọc ghẹo, và Dương  thấy mình cũng hỉ hả cười như nó là chuyện của người nào đó ngoài hành tinh chứ không phải chuyện của mình. Chỉ có những đêm bất ngờ, trong giấc mơ, giữa màn pháo hoa rực rỡ, cô vẫn thấy gương mặt Long thoắt ẩn thoắt hiện, mới biết đôi khi tiềm thức dường như trung thực hơn cảm xúc của mình.

Dương  gặp Long lần đầu vào năm Đà nẵng lần đầu tiên tổ chức Liên hoan quốc tế pháo hoa. Vì mê pháo hoa, mà Dương  không quản lạy lục van xin Tân để anh cho cô được tham dự sự kiện này, thậm chí móc tiền túi ra chứ không thèm xin phí công tác.

Lần đó, trong một quán café kiểu cũ ở Đà nẵng, qua một người bạn cũng mới quen, Dương nhìn thấy Long lần đầu. Khi đó, Long không làm gì hơn việc nhìn thẳng Dương  và nói “Anh tên Long”, rồi cầm điện thoại của Dương  ở trên bàn, lặng lẽ gọi vào số của mình.

Thế thôi, và Dương  đổ xiêu đổ vẹo. Cô từng lẩn mẩn đi khắp xó xỉnh Hà Nội để mua cho Long một chiếc zippo, lại cẩn trọng nhờ một nghệ nhân khắc lên đó hình một con rồng đang say ngủ, với niềm vui dịu dàng hình dung Long đốt thuốc trong những đêm mùa đông lạnh giá, ngửi mùi xăng thoang thoảng và nghĩ đến mình. Dương đã sống một quãng thời gian vừa hạnh phúc, vừa khổ sở. Duyên và Lam ngoạc miệng ra bảo cô bị bệnh tương tư thật rồi khi lúc nào cũng không ăn không uống, đầu óc ngơ ngơ ngẩn ngẩn, tâm thần phân liệt. Chúng nó cười lăn với cảnh Dương cầm đũa lẩy bẩy chán ngán không ăn, và bảo trông cụ bà 90 tuổi lúc sắp xuống lỗ cũng không run rẩy bắt chuồn chuồn như Dương. Dương mặc kệ, cô chìm đắm trong tình yêu xa xôi cách trở của mình.

30.4 năm đó, cô vào Đà nẵng với ý nghĩ tạo bất ngờ cho Long còn Long tạo bất ngờ với cô bằng việc lẳng lặng ra Hà Nội. Cuối cùng cả hai cùng choáng váng vì “bất ngờ” của đối phương, thật éo le hơn phim Hàn Quốc.  Nhưng kịch bản mối tình của Dương thì lại quá nhàm chán với tình tiết cuối cùng khi Dương phát hiện ra Long đã có vợ từ lâu. Những ảo tưởng tình yêu vụt vỡ như bong bóng xà phòng. Cô lặng lẽ xóa mọi vết dấu về Long, nhưng lòng buồn không ngớt…

Dương lắc mạnh đầu như xua đi những ám ảnh của tình yêu xưa cũ, thở dài nhìn bức mail vẫn nằm im lìm khiêu khích. Cuối cùng, Dương mím môi, đóng cửa sổ máy tính.

Có 1 câu mà Dương đã đọc ở đâu đó “ta cứ lờ đi thì mọi việc đều ổn cả”. Dương chưa có can đảm xóa, càng không có can đảm mở. Thôi thì cứ lờ đi như chưa nhìn thấy bức mail vậy.

Cô bước ra ngoài hiên nhìn ra xa. Dải cát vàng óng ánh dưới ánh nắng ban trưa. Và biển xanh vô tận. Dương bất giác nuốt tiếng thở dài.

Ừ thì nắng vàng. Ừ thì biển xanh. Nhưng không anh. Không bao giờ có anh cả.

 

Gái già xì tin C2.2 : Sự xuất hiện của sơ mi đen

(hình chỉ có tính chất minh họa, hị hị)

Dương không có thói quen diện dàng khi ở Hà Nội, một nơi mà xác suất gặp người quen là cực lớn. Ở đấy cô lúc nào cũng quần bò, áo phông, giầy ba – ta mà chạy, lạch bà lạch bạch như một con vịt béo. Nhưng mỗi khi đến một vùng đất mới, nơi không ai biết cô, khả năng gặp người quen chỉ như cái lông trên mông một con lợn sề, thì cô cũng… xí xa xí xớn. Nghĩa là váy vó, nghĩa là bikini, áo lệch vai cộng vô số những cái mũ màu mè sặc sỡ mò lên từ đáy tủ.

Được sinh động theo đúng ý mình, và chẳng gặp ai quen biết, thật là một cảm giác hưng phấn.

Như buổi sáng nay,  tỉnh dậy khi ánh nắng mặt trời lùa theo vị mặn muối biển rập rờn qua ô cửa, Dương vội vàng bật dậy.  Vớ chiếc áo hai dây xé tua rua màu mè choe choét, cộng chiếc quần sooc ngắn củn, và đôi dép vải sọc xanh sọc đỏ, Dương nhìn mình trong gương và bật cười khanh khách. Xem chừng cái bộ đồ này sẽ dối được cho cô khá nhiều tuổi, nhìn cô cũng xì tin như ai. Đúng hơn là 1 gái già xì tin. Ầu zé!

Cảm giác bỗng đầy năng lượng, Dương vác luôn chiếc ba lô đồ nghề, đi xuống sảnh, khu vực lễ tân. Kiếm  một góc vắng, Dương đến dãy bàn dài đồ điểm tâm, lấy chút bánh mì thịt nguội. Vốn ghét kiểu café loảng toẹt ở mấy khách sạn, cô quay sang nhờ một nhân viên phục vụ để lấy riêng một tách café đậm.

Phía sau lưng Dương , chợt cũng có giọng đàn ông vang lên.

“Lấy thêm cho anh một tách nữa nhé!”

Nụ cười của cô phục vụ sáng bừng lên. “Dạ, anh đợi một xíu ha”.

Dương ngẩn ngơ nhìn nụ cười của cô con gái miền biển rồi quay lại sau lưng mình. Người vừa đưa ra yêu cầu giống cô, mặc sơ mi đen, đang chúi mũi vào một máy tính trên bàn. Dương thoáng nhăn mặt, cô rất ghét những người thiếu khoa học, vừa ăn sáng lại  vừa làm việc… Nhưng cô cũng rất ghét bao đồng những chuyện chẳng liên quan đến mình, nên cô nhanh chóng quay lại, tấn công triệt để đĩa bánh mì.

Cô phục vụ bưng hai tách café đến, và chẳng theo nguyên tắc “lady first” cái con khỉ gì, cũng chẳng theo nguyên tắc ai gọi trước người í được, cô ta bê tách café đặt xuống trước mặt tay sơ mi áo đen, giọng ngọt ngào.

“Anh cần gì nữa không”.

Sơ mi đen nhẹ lắc đầu, hơi mỉm cười với cô gái như một lời cảm ơn rồi lại cúi xuống máy tính. Cô phục vụ vẻ như đã quen với thái độ đó, vẫn trìu mến nhìn anh ta hồi lâu như không nỡ rời đi, không hay mặt Dương đang nghệt ra vì đợi chờ. Cô đành đằng hắng.

“Em ơi…”

Cô phục vụ sực tỉnh vội vàng bê café tới, đặt trước mặt Dương với vẻ hối lỗi. Trong khi đó, gã sơ mi đen nghe tiếng tằng hắng cũng ngước lên.

Trong thoáng giây bắt gặp, Dương nghĩ ở đâu có ánh mắt thờ ơ đến vậy.

Nhưng mùi vì café nhanh chóng cắt những suy nghĩ của Dương . Cô bắt đầu nhấm nháp café và nhìn ra ngoài sảnh.

Trời nắng rực rỡ. Một buổi chụp hình ngon lành của mình đây.

Vác máy đi lang thang khắp khu resort, tìm chỗ đặt máy và góc chụp khiến Dương nhanh chóng tiêu tốn mấy lát bánh mì buổi sáng. Thực tế, hầu hết những khu Resort miền Trung có thiết kế na ná giống nhau, bởi địa hình ven biển các khu nhà nghỉ đều bám sát mép biển. Các tiện ích dịch vụ cũng không khác nhau là mấy. Tìm một nét đặc sắc, khác lạ của khu resort này, đúng là không đơn giản.

Trên trang web của resort này, Dương cũng đã thấy nhiều bức ảnh kiểu pano lớn, hoành tráng của cả khu resort. Cô cũng thấy nó đẹp, lộng lẫy. Nhưng dường như phô trương quá và không có chiều sâu. Cho nên loạt ảnh này, cô ít chụp đại cảnh, mà chỉ chăm chú vài chi tiết nhỏ. Hình ảnh dây leo vươn bên thềm cửa sổ. những viên đá cuội tròn nhẵn bò dọc theo phòng tắm ngoài trời, mái tóc dài của cô gái Braxin xõa bên bờ vai lấm tấm tàn nhang, ngái ngủ trên chiếc ghế dài sau một buổi tắm nắng hay luống hoa dâm bụt chạy dọc một đường cong cong tạo hình như một trái tim… Lay hoay chỉnh chụp, lần mò hồi lâu, Dương cũng thấy rã rời.

Mặt trời hun nóng bỏng cả má, Dương ngồi phệt xuống bãi cát mịn đã bắt đầu nóng rẫy, mở máy ra xem lại vài khuôn hình, môi thấp thoáng nụ cười hài lòng. Chợt một ý nghĩ tinh nghịch lướt qua, Dương ngả vật người xuống cát, giơ chân lên, không nhìn ống kính, nhấn nút chụp liên tiếp vài kiểu.

Bắp chân trần cát bám vào dinh dính, nhồn nhột, Dương bèn bật dậy, phủi quần áo.  Xong xuôi, cô lôi máy ra nhìn lại và sững người.

Trên màn hình, có một đôi chân xỏ ngón thon thả xoài trên bãi cát vàng óng ả. Xa xăm nơi tận cuối cùng khuôn hình, là một người đàn ông, mặc sơ mi đen khoanh tay cúi nhìn mũi giầy mình. Bố cục chặt và màu sắc sáng rỡ của bức ảnh khiến cô sau phút ngẩn ngơ thì vội vàng ngẩng lên tìm kiếm anh chàng “người mẫu” vừa vô tình bước lạc vào khuôn hình của cô.

Nhưng bãi cát mênh mông, chỉ có một mình Dương đứng ngơ ngác giữa nắng vàng.

 

Gái già xì tin C2.3: Nghe trộm một vụ tỏ tình


Sau cả buổi lao động, đến chiều Dương quyết tâm ra sức hưởng thụ triệt để những tiện nghi khu resort này. Hết xông hơi rồi lại chui vào bể sục, hết bơi lội rồi lại mátxa mátgần, đến nỗi khi buổi chiều ập đến, cô nằm xoài trên chiếc ghế ở hiên, ngắm nhìn hoàng hôn, nhấm nháp chút trà nóng, nghĩ đời chẳng còn gì ao ước nữa.

Mà quên, vẫn còn thứ để ao ước! Dương thở dài đầy ai oán. Đó là cái gã mà cô đã trịnh trọng tuyên bố sẽ tát cho hắn 1 cái khi hắn bước vào đời cô.

Ôi chao, ai sẽ chìa má ra cho cô tát đây cơ chứ?

Điện thoại nhấp nháy. Lúc này Dương mới để ý thấy có 3 tin nhắn. Duyên, Lam mỗi đứa 1 cái tin dài cả mét, sặc mùi ghen tị và cuối cùng dặn dò Dương nhớ phải liếc ngang liếc dọc xem có vớ được thằng Tây mắt xanh mũi lõ nào không, lại còn động viên rằng bọn Tây rất kết những đứa mít đặc An Nam kiểu da vàng mũi tẹt, mà điển hình là Dương khiến Dương không kìm được lăn ra cười. Tin nhắn còn lại là của Tân, hỏi vụ phỏng vấn tay Hoàng Định.

Lúc này Dương mới sực nhớ. Cô chép miệng, ngồi dậy, quyết định lê thân đi dò la tung tích của cái tay khỉ gió này.

Tuy nhiên, khi cô đến khu lễ tân, hỏi han thì được biết đồng chí Hoàng Định nào đó đã gửi lại chìa khóa phòng và lượn đi đâu rồi. Dương bèn nhờ cô lễ tân nhắn lại là có việc cần gặp, nếu anh ta về thì nhớ gọi cho cô, rồi ung dung đi về phòng.

Thật ra, trong email mà Tân gửi cho Dương , có cả email lẫn điện thoại của Hoàng Định. Có điều cô… lười không muốn mở. Thật thà hơn là vì cô không muốn động vào cái hộp thư mà giờ mở ra, cô sẽ thấy email của Long chình ình ra đấy. Nghĩ đến đây, Dương thầm chán ngán. Cô cứ tưởng cô tu thành đắc đạo, trái tim không bê tông cốt thép thì ít ra cũng cứng cỏi tí chứ, ai dè vẫn mềm như bún thế này.

Buổi chiều ở khu Resort quả thật đẹp đến mê mị. Biển xanh thẫm. Vài chiếc dù trắng chạy dọc đường bờ biển, không ấn tượng hay sáng tạo gì, nhưng vẫn tạo nên vẻ thanh thoát đặc biệt, nhất là khi lại chẳng có “mống người” nào mon men ra đấy. Dương vứt đôi dép sọc xanh sọc đỏ xuống hiên, tay cầm chiếc ipod của samsung có màu hồng cực kì “lúa” mà một người bạn (có thẩm mĩ “phi thường”) đã tặng cô, lững thững đi bộ ra ngồi ở dưới gốc dừa. Thả chân xuống nước, cảm nhận từng cơn gió biển rập rờn, bỗng nhiên Dương thấy bình yên đến lạ lùng. Cô chọn mấy bài của Rosewood, kiểu rock ballad nhẹ nhàng  rồi cắm tay nghe, mắt nhắm lại, bụng dạ nhớ đến anh chàng Nhật Linh ngầu zai có mấy quả xăm ở gáy và bắp tay thiệt là oách mà duy nhất một lần cô đi xem anh chàng biểu diễn ở Mỹ Đình. Tiếc là ban nhạc này chẳng chịu sáng tác hát hò thêm gì, nên cô chỉ có mấy bài quẩn quanh mà nghe đi nghe lại. Lơ mơ thêm một chút, rồi chẳng hiểu Dương ngủ mất đi từ lúc nào.

Thức dậy vì cơn đói ập đến, Dương sững lại bất ngờ khi màn đèn treo của cả khu resort bừng lên như một vũ  hội của màu vàng tan chảy, sóng sánh như mật ong. Thiết kế ánh sáng ở đây quả là đẹp mắt. Dương ngu ngơ đứng nhìn hồi lâu, cảm giác bềnh bồng như trên mây. Chỉ cơn đói mới đủ sức kéo cô xuống mặt đất, khiến cô nhớ ra, cô phải về phòng.

Tuy nhiên, ngay cả cơn đói bụng cũng nhanh chóng biến mất, khi vô tình, bước chân của Dương lạc vào con đường hẹp tỉa hoa dâm bụt.

Vốn dĩ, cô nghĩ con đường này vắng tanh như chùa bà đanh ban ngày, thì chẳng cớ gì nó lại đông đúc ban đêm. Chắc chính vì cũng nghĩ như cô, mà có người đã chọn nơi đây làm vị trí để tỏ tình. “Diễn viên” lại là những người cực quen. Anh chàng sơ mi đen ban sáng và cô phục vụ.

“Em nghe nói anh sắp rời đi”

Sơ mi đen trầm lặng “Ừ”.

“Anh mới từ Hà Nội vô mà lại đi luôn sao”

Sơ mi đen vẫn kiệm lời “Ừ”.

Cô phục vụ lặng người đi như thất vọng, bàn tay siết lại xuôi theo người. Cuối cùng như lấy hết can đảm, cô ngẩng lên trực diện người đàn ông.

“Có thể anh cho em là trèo cao, hoặc em là người … vô duyên, cọc đi tìm trâu. Em biết em chỉ là cô phục vụ… Nhưng mà… em thích anh.

Ngập ngừng một lúc, cô gái tuyệt vọng bổ sung thêm câu “Mà không, em yêu anh!”

Sơ mi đen đứng im hồi lâu, vẻ vô cùng trầm lặng, không nói gì. Cô phục vụ như cảm thấy điều gì đó, vội xua tay.

“Anh đừng nghĩ là em bồng bột. Em suy nghĩ kĩ lắm rồi. Em chỉ sợ là là… không có dịp để gặp anh nữa…

Dương hít vào một hơi, tự dưng thấy ngưỡng mộ cô gái này thế. Ít ra cô nàng thật can đảm, thậm chí là còn “chặn” trước câu thoái lui của tay sơ mi đen kia. Định rút lui quay người trở lại một cách êm thấm, nhưng Dương bị sự tò mò hóng hớt quyến rũ. Nên cô đứng nép vào một góc, tai vểnh lên nghe.

 

Gái già xì tin 2.4: Ông mai


Không gian im lặng đến mức Dương như nghe tiếng thở phập phồng của cô gái bạo dạn kia. Mãi lúc sau, cô mới nghe thấy sơ mi đen cất tiếng “Anh quý em, Mây ạ! Và tình cảm của em làm anh xúc động. Nhưng chỉ thế thôi…

Dương không kềm được, ló ra chút xíu để nhìn sơ mi đen. Vẻ mặt anh đầy sự tôn trọng, ngoài ra, không gì khác, cũng không có tí teo nào gọi là sự tự mãn của người đàn ông được đàn bà con gái ngưỡng mộ.

Anh đặt tay lên vai cô gái tên Mây, vỗ nhẹ nhẹ. 

“Đừng tự ti về bản thân mình. Anh tôn trọng sự bày tỏ của em. Chỉ có điều, bây giờ anh chưa thực sự sẵn sàng cho mối quan hệ nào cả. Bất cứ mối quan hệ nào, với bất cứ ai, chứ không phải chỉ riêng em…”

Cô phục vụ tên Mây đờ ra nhìn sơ mi đen. Trong lúc đó, Dương bỗng nhiên cảm tình với tay sơ mi đen ghê gớm. Từ chối nhẹ nhàng và tôn trọng, cũng không hề mất đi sự điềm tĩnh nào. Haizz, cô tưởng mấy màn này chỉ có ở phim Hàn Quốc thôi chứ. Rồi Dương cười  thầm nghĩ thêm, biết đâu vì anh chàng này lậm phim Hàn Quốc quá không chừng…

Nghĩ đến lúc mình ló mặt ra là vừa, Dương len lén bước lùi ra một đoạn, rồi làm điệu bộ huỳnh huỵch nhất đi tới phía đôi trẻ, miệng không quên hét váng lên mấy câu hát  để “đánh động”

“Eh, ai cho em ghé đến, ai trong lòng càng vui lên
Nhìn xem đường xung quanh vắng tênh
Oh mong em như thế đó,
Mong em đừng buồn vu vơ
Nhìn em ta như ngây ngô”…

Làm ra vẻ giật mình khi thấy hai người, Dương im bặt, cười ngượng ngượng rồi bước qua đôi trẻ đang đầy vẻ khó xử. Đi vài bước rồi, cô vẫn nghe sơ mi đen nói nhẹ nhàng “em vào trước đi. Anh hút thêm điếu thuốc nữa rồi vào sau…

Dương về phòng, lúc này cơn đói lại trở lại nhắc nhở cô, khiến Dương phải đấu tranh giữa việc tắm táp và ăn uống. Cuối cùng, Dương vẫn quyết định nhịn cơn đói để phi vào bồn tắm trước.

Vừa lúc cô quấn khăn đi ra, thì có điện thoại của phòng. Cô lễ tân giọng miền Trung ngọt ngào báo với cô là Hoàng Định đã về, và đang ở khu vực lễ tân. 

Bỗng dưng thành ra cập rập, Dương vò mớ tóc ngắn, vội vàng mặc vào chiếc váy lụa, vác cái bụng ùng ục vì đói, ra đến sảnh lễ tân. Nhưng đến đó, thì chẳng có ai, ngoài vài khách nước ngoài đang đứng ngắm nghía khung cảnh, hoặc chuẩn bị đi ăn tối. Lễ tân nhìn Dương ngại ngùng “Xin lỗi chị. Anh Định vừa về phòng. Ảnh có để lại số điện thoại để có gì chị liên lạc…

Dương thoáng bực mình, cô gật gật đầu. Rồi nghĩ kệ xác cái tên dở hơi này, Dương ra bàn, đánh chén bữa tối.

Ăn tối một mình, đôi khi đã thành thói quen với những gái già, nhất là những gái già như Dương. Cô quen việc nhìn từng đôi từng đôi ăn uống với nhau, chăm chút cho nhau  đến mức sự chạnh lòng cũng trở thành xa xỉ. Hằng ngày, trưa thì ăn với đồng nghiệp, hoặc ăn cơm văn phòng. Tối thì trừ những vụ tụ tập bạn bè, cô thường tự nấu món mì cà chua trứng đơn giản để ăn, hôm nào lười thì đi ăn ngoài. Cuộc sống như thế, cũng không có gì đáng phàn nàn, mọi thứ đều đơn giản đến mức tối đa. Chỉ có điều, đôi khi, sự đơn giản biến thành đơn điệu, đôi khi sự cô đơn thành sự cô độc, và đôi khi, nỗi buồn lại trở thành một cảm xúc thường trực với người vốn rất toe toét như Dương.

Dương nhẹ lắc đầu, xua đi vài suy nghĩ vẩn vơ rối rắm. Cô cũng làm lơ ánh mắt hiếu kì của mấy anh chàng mắt xanh mũi lõ thỉnh thoảng liếc về phía cô, một cô nàng bé tí độc chiếm hẳn một cái bàn to đùng và ăn rất miệt mài. Có sao đâu, đôi khi, thức ăn cũng là một niềm vui mà. Và Dương, thì thích tích trữ kiểu “niềm vui” này vô cùng, tất nhiên cô chỉ quay lại oán thán nó nếu có lần lỡ bước nhảy lên cân.  

Ăn xong, Dương ngồi im ở ban công nhìn ra vùng biển sẫm tối phía xa. Bầu trời có một vầng trăng non mảnh mai, bàng bạc.  Gió thổi khiến cô có cảm giác lành lạnh. Sau một hồi trù trừ, Dương cầm dãy số điện thoại của tay Hoàng Định, bấm số.

Sau một tiếng chuông, một giọng trầm lập tức vang lên, ngắn gọn “Alo”.

“Xin lỗi, đây có phải số của anh Hoàng Định không”.

“Đúng”. Câu trả lời khô và ngắn. Dương than thầm, lại vớ phải ông cần phải xà beng bẩy thì mới hé răng nói nửa lời rồi.

“Tôi là Dương, ở tạp chí X. Đợt tới chúng tôi dự định đăng tải loạt bài trong chiến dịch PR khu resort. Bên quản lý có giới thiệu anh là người thiết kế. Liệu tôi có thể phỏng vấn anh một chút được không?

Đầu dây giọng có vẻ ngập ngừng. “Có cần thiết phải gặp trực tiếp không”. Hay cô gửi câu hỏi qua email, tôi có thể trả lời…”

Dương nhẹ cười “Dạ. Vậy cũng được”. 

Thế là xong chuyện. Dương chép miệng, đầu bắt đầu suy nghĩ về mấy câu hỏi dành cho thằng cha này…

***

Trở lại là cô nàng gái già quần bò áo phông, ba lô khoác vai, Dương đến tòa soạn. Về chỗ ngồi bừa bộn của mình, Dương bắt đầu pha café, tiện thể ngó quanh. Dân tình chưa thấy đến, nhưng phòng của Tân thì chỉ khép hờ. Sếp cô đúng thật con ong chăm chỉ, trăm ngày như một, chẳng bao giờ đến muộn. Dương pha thêm một tách café, đá mũi giày vào cánh cửa, đi vào.

Tân đang lọ mọ với cái laptop đời cổ, ngẩng lên, nhìn Dương toe toét.

“Sớm sủa nhỉ?”

“Đến sớm chuồn sớm mà, he he! Café cho sếp đây”.

Tân dòm dòm Dương từ chân đến đầu, hất hàm “Trông béo tốt ra đấy”.

“Em đã bao giờ không béo tốt đâu. Anh đọc bài em chưa?

Tân gật gù. “Đã xong, chuyển sang bên maket rồi. À, bên Gaotravel hôm tới có vụ đi Mai Châu đấy. Thích không anh bảo thằng giám đốc bên đấy một câu.

Dương nhe răng cười “Có free không”.

“Tất nhiên. Em của anh làm gì có chuyện mất xiền”.

Dương cười khì khì. Cô rất quý Tân. Cô với anh là quan hệ sếp nhân viên, nhưng thực tế, thì có chút quan hệ họ hàng xa lăng lắc. Cho nên, Tân đối với cô rất thân tình, có vụ gì hay cũng đều phần cô. Miễn việc anh giao cô làm xong, thì cô muốn làm trời làm trăng, tung tăng ở những đâu anh cũng mặc kệ.

“À, quên. Chưa hỏi, em thấy tay Định đấy thế nào”.

Dương nghệt mặt “Thế nào là thế nào?”

Tân cười đầy gian tà “Thì resort đẹp như mơ thế kia, trời trăng biển sóng, hai đứa gặp nhau mà không mọc ra cái mầm tình ái nào ạ?

Dương suýt sặc café, trợn mắt “Anh có sao không vậy. Em đã biết tay ấy mặt ngang mũi dọc thế nào đâu”.

Mắt Tân như lồi ra “Gì. Thế không gặp thì cái bài phỏng vấn ấy tòi ở đâu ra!’.

Dương ngồi phịch xuống ghế, tròn mắt “ô, thế email sinh ra để làm cái gì!”.

Tân xùy ra đầy thất vọng “Thế hai đứa chưa gặp nhau à! Phí của. Thế mà anh cứ tưởng…”

Dương nhìn Tân ngờ ngợ “không phải anh định mai mối gì đấy chứ hả”…

Tân gãi đầu “Ờ thì hôm nọ qua nhà, thấy cô chú kêu rên ghê quá. Anh lại thấy thằng này cũng được, ngon giai, công ăn việc làm…

Tân thao thao bất tuyệt về cái tên Hoàng Định nào đó, trong khi Dương vò đầu bứt tóc “Em đi chết đây. Cả cái nước này biết em thành gái già cần phải mối mai khẩn trương rồi…

“Cái con bé này, chẳng hiểu lòng hiểu mề bố mẹ gì cả…

Dương thở hắt “Em không hiểu lòng mà một tháng em phải vác mặt đi xem mắt 15 lần ấy à!… Em không hiểu lòng mà lặng ngắt nghe bố mẹ em nhờ hết người nọ người kia mai mối ấy à. Giờ bố mẹ em còn nhờ đến anh nữa… Nhục như con cá nục… Em đi chết đây…

Dương uống nốt cốc café rồi đi thẳng, bỏ mặc Tân đằng sau phì cười.

“Cái con Nấm này…”',
	1
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'SAU NÀY KHÔNG GẶP LẠI',
	0,
	N'Phan Tĩnh Yên: tốt nghiệp loại xuất sắc Học viện cảnh sát nhưng được biết đến nhiều hơn với cái danh con gái của Đại tá Phan Thanh Nguyên.\n\nKiến Nhất Đông: từng là cảnh sát tuyến một, sau chuyển về làm nghiên cứu.\n\nMột vụ án giết người liên hoàn xảy ra ở các thành phố lân cận, mô phỏng kẻ giết người Jack The Ripper, cách thức kì lạ, thủ đoạn tàn bạo và khả năng phản trinh sát cực kỳ cao, chuyên án “Học trò của Jack” lập ra và giao cho đội cảnh sát 1 Thành phố Đồng Vân chịu trách nhiệm chính, Đội trưởng Thanh với sự giới thiệu của một giáo sư tâm lý của học viện cảnh sát, tìm tới một cảnh sát đã từ lâu “không màn sự đời” nhờ hắn giúp đỡ.\n\nMột chuỗi các vụ án xảy ra đều có liên quan đến nhau, đồng thời liên quan đến cái chết ngày trước của Đại tá Phan Thanh Nguyên, kéo theo những hận thù, ân oán từ thế hệ trước…\n\nAi là kẻ đứng sau bức màn?\n\nĐan xen một chút là mối tình “cách biệt thế hệ” của chú cố vấn “làm cái gì cũng lo” và đứa nhỏ “làm cái gì cũng liều”',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/cover.jpg?itok=5p07730o',
	N'Tiếng chuông điện thoại vang lên nhưng chẳng còn ai trong gia đình có thể nhấc máy nữa. Hắn nhẹ nhàng lia con dao yêu quý của mình lên trên người mà hắn coi là “tác phẩm”. Một vệt máu thật tao nhã bắn lên tường, khéo léo không bắn lên chiếc điện thoại đang reo. Jacks chắn chắn sẽ thích sự tinh tế và khéo léo của hắn.  “Đường dao đẹp thật!” lát nữa thôi bức tranh của hắn sẽ hoàn thành. Chuông điện thoại vẫn đang reo, hắn bực dọc vì việc mình đang làm bị làm phiền, nghĩ vậy, hắn bước đến bên chiếc điện thoại, cẩn thận không giẫm lên vết máu, mà cho dù có giẫm lên, cũng không sao, trước đó mình đã cẩn thận mang bao giày, hắn tự nhủ.

 

“Alô! Cháu nghe đây ạ!” Tĩnh Yên vén mớ tóc còn dính nước của mình gọn ra sau gáy, vai kẹp chiếc điện thoại kề sát vào tai:

“Cháu đã về đến nhà chưa?”

“Rồi ạ!” Cháu vừa tắm xong!”

“Đến hiện trường ngay đi, là hắn, hắn lại ra tay rồi, bác sẽ nhắn địa chỉ cho cháu!”

“Cháu đến ngay ạ!”

Cái Tĩnh Yên vừa nhận là cuộc gọi của đại tá Thanh, đội trưởng đội điều tra số 1, Thành phố Đồng Vân, đây là một bộ phận đặc biệt chuyên tiếp nhận và xử lý những vụ trọng án trong địa bàn thành phố và vùng lân cận. Đây là bộ phận điều tra án mang tính chuyên môn về hình sự, các vụ án nghiêm trọng trong tỉnh thường được chuyển thẳng về đội, cũng là bộ phận chịu nhiều áp lực nhất. Phan Tĩnh Yên là sinh viên vừa mới tốt nghiệp học viện cảnh sát, thành tích xuất sắc, 4 năm liền đạt giải quán quân bắn súng trong học viện luôn là sinh viên dẫn đầu trong các lớp tập huấn thực chiến... thành tích của cô gây ấn tượng không nhỏ với nhiều lãnh đạo trong ngành nhưng họ đã sớm biết đến cô, cô chính là con gái của cố Đại tá Phan Thanh Nguyên, là một huyền thoại trong ngành cảnh sát, ông từng là đội trưởng đội cảnh sát 1 hi sinh trong một lần làm nhiệm vụ cách đây  năm.

Gần đây, thành phố Đồng Vân và một số thành phố lân cận xảy ra 03 vụ án giết người hàng loạt được chuyên môn đánh giá là tàn bạo và gần chưa xuất hiện trong lịch sử ngành cảnh sát cả nước, hoàn cảnh nạn nhân khác nhau, thường trú ở những nơi khác nhau nhưng tình tiết và phương thức họ bị giết thì lại rất giống nhau, đặc biệt, tại mỗi hiện trường xảy ra hung án, huh thủ đều để lại một dòng chữ bí ẩn.

Thấy Tĩnh Yên đến, cảnh sát canh giữ hiện trường đã gần như quen mặt với cô gái duy nhất trong đội, anh ân cần vén sợi dây giới hạn lên cho cô, hiện trường vụ án nằm khá xa nhà cô nên khi cô đến các bộ phận kỹ thuật cũng đã lần lượt đến làm việc.

Căn biệt thự nằm dưới chân núi Đồng Vân, ở rìa phía tây thành phố, xung quanh đây không có nhiều nhà dân lắm, chủ yếu là các biệt thự cá nhân của những người thích cuộc sống yên tĩnh, tránh xa thành phố. Bắc đại ca, một thành viên trong đội của cô đưa cô vào hiện trường, nói nhanh:

“Có 4 người chết tất cả đều bị cắt đứt cổ họng và đâm nhiều nhác pháp y suy đoán sơ bộ là chết do mất nhiều máu, anh cũng vừa đến, mọi người trong đội cũng chưa đến đủ”

Tĩnh Yên lần lượt quét mắt qua 4 thi thể nằm trên sàn nhưng dù đã khá quen nhìn những xác chết nhưng cũng khó tránh một đợt gai ốc nổi lên, Tĩnh Yên nén cơn buồn nôn trước cảnh tượng trước mắt, không dám đưa ra ý kiến nhưng trong đầu đã có chủ ý nhất định.

“So với vụ trước đó đúng là có sự khác biệt!” người nói là trưởng khoa Pháp y của cục cảnh sát thành phố, 15 năm kinh nghiệp trong nghề và một cái tên không đi làm chánh án toà án là một điều uổng phí: Phạm Công Bằng.

“Sao vậy?” một người đàn ông cao gầy bước ra từ một căn phòng tại hiện trường, nhìn thấy đội phó đã đến, cả cô và anh đều cất tiếng chào “Đội phó”

Thanh Phương gật đầu “Khoa và Tuấn đã đến rồi, chú đã kêu hai đứa nó xem xét xung quanh” Tĩnh Yên gật đầu im lặng nghe pháp y nhận xét:

“Có hai lý do, theo kiểm tra sơ bộ của tôi, vết thương trên người họ đúng là có thủ pháp tương đồng với những vụ án trước, tuy nhiên tôi cảm thấy đặc điểm vết thương so với vụ ở thành phố Lam Sơn có khác biệt, anh nhìn này…” nói rồi ông đưa cánh tay của một nạn nhân lại đối chiếu với một bức ảnh chụp, ông chỉ vào bức ảnh chụp, nói tiếp: “Đây là vết thương gây ra khi dùng quá nhiều lực… cảm giác, nói thể nào nhỉ?”

“Nghệ thuật” Bắc bên cạnh lập tức nhắc bài

Đội trưởng đội pháp y nghe vậy thì gật đầu lia lịa “Đúng đúng, là cảm giác nghệ thuật”

“Đồng chí Bằng, chú nói tiếng người xem nào” Đội trưởng Thanh đứng cạnh đó gần như mất hết kiên nhẫn

Đội trưởng đội pháp y liếc xéo ông, giọng lại không hề tỏ ra tức giận, nói “Vụ án đầu tiên, khi hung thủ ra tay tạo cho tôi cảm giác hắn rất thành thạo, ra tay nhanh, gọn, dùng lực chính xác, tính mỹ cảm rất cao, đến vụ án ở Lam Sơn thì lại không như vậy, hung thủ đúng là cố gắng mô phỏng tương đồng nhưng lại không có cảm giác mỹ cảm, ầy khó nói cho anh hiểu quá… Tóm lại,  ngoài dòng chữ quen thuộc “Jack’s apprentice” - học trò của Jack được viết bằng chính máu của nạn nhân trên tường tôi lại cảm giác....”

“Ý anh là, chuỗi vụ án này có hai hung thủ, một người là hung thủ của vụ án đầu tiên và vụ này, người còn lại là hung thủ của vụ thứ 2, tên hung thủ của vụ án thứ 2 đã bắt chước?”

Tình tiết này không hiếp gặp trong ngành, vì đã là giết người hàng loạt cái họ muốn không phải là giết người mình ghét hay giết người vì một lợi ích nào nữa, đa số tội phạm giết người liên hoàn chỉ vì khoái cảm đạt được khi thấy người khác đang sống sờ sờ từ từ tắt thở dưới tay mình.

“Đại loại là vậy nhưng chỉ là cảm giác của tôi, tôi hoàn toàn không có chứng cứ xác thực”

Nếu giả thiết này thành lập, tức là vụ án này cơ bản đã xuất hiện tình tiết rẽ nhánh, phức tạp hơn rất nhiều. Những tình tiết mang tính mấu chốt của vị án như cách thức giết người, dòng chữ bằng máu bên phía cảnh sát vẫn chưa công bố ra bên ngoài, vậy tên bắt chước kia làm sao có thể hiểu rõ mọi tình tiết như vậy? Hắn có quan hệ gì với tên hung thủ “bản gốc”?

Đội trưởng Thanh gật đầu: “Được rồi, tôi sẽ lưu ý chuyện này, chúng tôi đủ người rồi”

Đội trưởng đội pháp y hiểu ý, giao phần việc còn lại cho trợ lý, còn mình đến một góc hiện trường, hội họp nhanh với đội cảnh sát báo cáo:

 “Theo phán đoán sơ bộ tôi thời gian tử vong của các nạn nhận giao động từ 23h tối hôm trước đến 3h sáng hôm nay, nguyên nhân tử vong là động mạch cảnh bị cắt đứt dẫn đến mất máu quá nhiều, trước khi chết bụng họ đã bị rạch và phanh thây, nội tạng đôi phần không còn hoặc nếu còn đa phần cũng bị đâm nát. Hung khí nếu giống như những vụ án trước thì chắc là một con dao phẫu thuật. Còn cụ thể như thế nào còn phải đợi đưa về khám nghiệm thật kĩ”

“Tổ khoa học hình sự đã đến chưa?” đội phó Phương hỏi tiếp

“Họ đã vào hiện trường làm việc rồi, thưa chú!”

“Vậy là thủ đoạn, cách thức gây án hoàn toàn giống với hai vụ thảm sát do “Học trò của Jack” gây ra dạo gần đây” Đội phó tổng kết

Vì tính chất tàn bạo và chưa từng xảy ra của vụ án bộ công an đã đặc biệt đưa lệnh xuống thành lập chuyên án “Học trò của Jack” và giao vụ này cho đội cảnh sát số 1 của thành phố thụ lý, tìm được rất ít chứng cứ trong hiện trường, nên theo tôi lần này mấu chốt phá giải vụ án sẽ nằm ở phương diện con người, nên công tác điều tra gặp rất nhiều khó khăn, đã là vụ án thứ 3 rồi nhưng trong tay đội chưa thật sự nhiều. Đội trưởng Nguyễn Minh Thanh là một người cảnh sát kinh nghiệm đầy mình, ông nổi tiếng là người nóng nảy với cấp dưới nhưng điều tra lại rất cẩn trọng, cũng là người nhìn người nhìn việc rất giỏi. Đội cảnh sát số 1 do ông dẫn dắt là một trong những đội xuất sắc của cảnh sát cả nước, tỉ lệ phá án cao được lãnh đạo rất coi trọng giao cho rất nhiều vụ trọng án cả trong tỉnh và khu vực.

Lúc này, cả đội đã tập trung đầy đủ, đội trưởng Thanh liếc nhìn một lượt các thành viên trong đội, bắt đầu phân phó: 

 “Tôi nghĩ điều cần thiết chúng ta phải làm là tìm được nhiều nhân chứng càng liên quan đến vụ án này càng tốt, Thắng và Khoa dẫn theo hai ba người nữa phụ trách phần này. Yên, cô ở lại hiện trường phối hợp với nhân viên chuyên trách mô phỏng lại quá trình xảy ra án mạng, sáng mai kết hợp với tổ khoa học hình sự và pháp y cho tôi một bản báo cáo mô phỏng quá trình xảy ra vụ án hoành chỉnh. Phương, anh và tôi sẽ về sở lấy lời khai của người báo án! Tất cả chia ra làm việc 10h sáng mai họp tại sở.”

“Rõ!” cả đội đồng thanh, ai nấy chạy đi làm việc của mình, Đội trưởng Thanh thấy mọi công tác ở đây đều không cần mình nữa, chuẩn bị về sở, tức thì có tiếng chuông điện thoại gọi đến, ông liếc nhìn tên, trầm giọng tiếp chuyện:

“Là tôi đây giáo sư”

Đầu dây bên kia là giáo sư bộ môn tâm lý học của học viện cảnh sát: “Nghe ông nhà tôi nói anh đang đau đầu vì một vụ án, tôi gọi tới bán “thuốc” đau đầu cho anh đây”

Đội trưởng Thanh cười ha ha, cũng hùa theo cách nói của đối phương “Tôi biết thuốc của chị nhưng chẳng có cách nào mua được”

“Anh có viên ngọc sáng của học viện cảnh sát đấy, giá trị cao lắm, lấy đi mà đổi” đội trưởng Thanh thầm nghĩ, đúng là đẳng cấp giáo sư, nói chuyện nghe không hiểu, xong chỉ dám cười ha ha, nói cảm ơn.

Nếu không có tiến triển, liều “thuốc” đau đầu này, chắc phải dùng ngọc để đổi rồi!

9h 30 sáng – Văn phòng của đội cảnh sát hình sự số 1.

Cả đội cảnh sát 1, người nào lo việc nấy, chuẩn bị báo cáo phần việc của mình cho buổi họp, ai nấy đều rất căng thẳng vì họ biết rằng, vụ án này liên hệ đến nhiều mạng người, thậm chí là nhiều nhất trong lịch sử phạm tội của ngành cảnh sát hơn nữa tình tiết vụ án đều rất tàn bạo, mô phỏng cách giết người của tên tội phạm Jack The Ripper nên vụ án Học trò của Jack dù đã được Bộ Công an phong tỏa tin tức nhưng phạm vi xảy ra vụ án quá lớn cũng như mức độ tàn bạo mà chuyên án này trở thành mối quan tâm hàng đầu của lãnh đạo và người dân.

“Chào buổi sáng, các cảnh sát trẻ!” người gửi lời chào không thể nồng nhiệt hơn là đội phó Phương, ông còn tặng kèm một nụ cười tươi roi rói “Mọi người sao vậy, không khí náo nhiệt bình thường trong đội biến đi đâu rồi?”

Đội phó đội điều tra số 1 trực thuộc cục công an thành phố Đồng Vân là một trung niên tứ tuần “2 không, 2 chưa” lý tưởng của những cô gái hiện đại “không uống rượu – không hút thuốc – chưa vợ - chưa tiền án” đồng thời lương cao kèm tuổi cao, theo lẽ thường, đội phó Phương là đồng chí cùng trang cùng lứa với đội trưởng với điều kiện và tuổi tác hiện giờ của ông, đáng lẽ đã có gia đình, con cái nhưng không hiểu vì cái gì đến giờ đội phó vẫn lẻ bóng một mình.

Tĩnh Yên đang ngồi đọc một mớ báo cáo từ các vụ án trước, nhăn mày đáp:

“Chào buổi sáng chú, a bánh bao” mắt Tĩnh Yên sáng lên, đêm vừa rồi, họ hầu như không ngủ, vừa nhìn thức ăn đã muốn dùng tốc độ nhanh nhất của mình cho vào bụng, không cần biết đó là gì.

“Giúp chú chia cho mọi người” rồi quay sang nói với cả đội “Ăn đã, còn lấy sức đánh báo cáo”

“Cảm ơn đội phó” cả đám người ngước đôi mắt cú mèo vì cả đêm không ngủ, uể oải nói, Tĩnh Yên đã phát bánh bao được gần hết đội, đi đến chỗ của Tuấn, anh lúc này mới dời mắt khỏi màn hình, cất lời “Cảm ơn em”

Câu nói này khiến cả đội cắm đầu xuống bàn đột nhiên ngẩn đầu lên, người đầu tiên nói là Khoa, kênh thông tin văn hóa, khoa học kỹ thuật của cả tòa nhà cũng vì vậy mà khi tra án lại có khả năng thu thập thông tin từ cô dì chú bác đi đến đâu cũng có thêm một mớ họ hàng bà con, moi khẩu cung rất giỏi, miệng vẫn nhai bánh bao ngồm ngoàm:

“Ái chà, hôm nay Tuấn nhà ta lại còn cảm ơn em kìa Yên, mau mua vé số” nói rồi lại nháy mắt với Tĩnh Yên, Tuấn liếc nhìn anh một cái, không thèm mở miệng nói chuyện

Hai người còn lại trong đội là Thắng và Bắc, Thắng là một người ít nói nhưng rất giỏi võ tâm tư đôi lúc tỉ mỉ nhưng đôi lúc gặp việc gì đó không thích, anh cũng không bày tỏ gì nhiều, Tĩnh Yên biết được điều đó vì một ngày cả bọn rủ nhau đi ăn hải sản, cả buổi cô để ý thấy anh không đụng đũa nhưng lại chỉ âm thầm dùng món khác không nói gì. Bắc hay Bắc đại ca là một người đàn ông của gia đình, trong đội trừ hai lãnh đạo ra thì anh là người lớn tuổi nhất, có vợ 1 con, hành động cẩn trọng, tâm tư chu đáo, ân cần, là chỗ dựa cho cả bọn “trẻ trâu” trong đội tuy đôi lúc theo như lời đồng chí Khoa nói thì “có một vài biểu hiện của hội chứng đàn ông có gia đình” tức là cách nói hoa mỹ hơn của việc đụng chuyện là càm ràm.

Lúc này, trong phòng là việc đội trưởng đang tất bật nhận điện thoại đốc thúc của cấp trên gây áp lực rằng phải phá vụ án này trong vòng 3 ngày, điện thoại của cục cảnh sát của các thành phố lân cận bởi lẽ vụ án này trước sau xảy ra ở 3 thành phố khác nhau, lãnh đạo cục công an của các thành phố còn lại cũng rơi vào tình trạng báo động về an ninh, liền sau đó là điện thoại của báo đài có quan tâm đến vụ án, còn có điện thoại của tổ khoa học hình sự, tổ pháp y… khiến ông bực bội còn không hết hoàn toàn không có tâm trạng ăn uống gì, Tĩnh Yên sợ ông không chịu được, đưa một cái nhờ đội phó mang vào cho ông. Vừa lúc đội phó mở cửa thì đằng sau cánh cửa lại truyền ra giọng nói của đội trưởng: “Cái bọn ăn ở không này, lúc này mà còn gọi đến moi tin à, có giỏi thì các người cứ  điều tra đi?” cả bọn không dám nói gì, chỉ tiếp tục giả ngốc, giả điếc cúi đầu gặm bánh bao.
Đúng 10 giờ, cuộc họp bắt đầu.

Bắc mở đầu bằng báo cáo của mình.

“Chuyên án “Học trò của Jack” mà chúng ta đang điều tra tổng cộng có 14 nạn nhân thuộc 3 gia đình, họ đều có đặc điểm chung là một gia đình gồm từ 2 – 3 thế hệ sống chung trong một căn nhà nằm cách xa trung tâm thành phố. Vụ án đầu tiên xảy ra ở thành phố Đồng Sơn, tại một gia đình gồm 6 người, vụ thứ hai là thành phố Lam Sơn có 4 nạn nhân, tổ chúng ta bắt đầu tiếp nhận vụ án và thành lập chuyên án từ vụ án thứ 3, tức là vụ vừa xảy ra đêm qua tại biệt thự dưới chân núi. Theo những thông tin điều tra được, nạn nhân gồm có 4 người, nạn nhân nam tên là Lâm Cảnh Sinh, 35  tuổi, là giám đốc của ngân hàng X, vợ ông ta là Nguyễn Mỹ Phượng, 34 tuổi, từng là nhân viên ngân hàng X, sau khi kết hôn thì không đi làm nữa, họ có với nhau hai đứa con gái, cô chị gái là Lâm Mỹ Linh, 16 tuổi hiện đang học tại trường trung học C, cô em gái nhỏ hơn chị mình 6 tuổi, hiện cũng đang học tại một trường tiểu học. Theo lời đồng nghiệp và bạn bè thì gia đình họ rất hạnh phúc, hòa đồng với mọi người xung quanh không có kẻ thù tới mức độ phải giết hết cả nhà.”

“Còn theo như báo cáo của tổ khoa học hình sự vừa mới gửi qua, kết quả pháp y cho thấy, thời gian tử vong của các nạn nhân không chênh lệch nhiều so với phán đoán ban đầu, đó là khoảng thời gian từ 0 giờ đến 1 giờ sáng, nguyên nhân cái chết là sau khi bị kìm điện làm cho bị ngất bị cắt đứt động mạch cảnh, mất máu quá nhiều dẫn đến tử vong, trước khi chết, họ còn bị phanh thây, nội tạng bị đâm nát, không còn nguyên vẹn, giống như các vụ trước trên tường hiện trường vụ án vẫn được viết lên dòng chữ học trò của Jack bằng tiếng Anh.”

“Vậy là hoàn toàn giống với hai vụ trước!” Thắng kết luận

“Không hẳn vậy!” Đó là Tĩnh Yên, từ nãy đến giờ cô luôn im lặng nghiên cứu bảng báo cáo của tổ khoa học hình sự, cô rất hay suy diễn tâm lý hung thủ thông qua nhưng hành động và dấu vết của hắn để lại tại hiện trường vì vậy nếu có báo cáo hiện trường, cô thường dựng lại hiện trường vụ án, đội trưởng Thanh nói, cách làm này của cô rất giống một người ông quen biết, còn cô, đây là cách một giáo sư trong trường hướng dẫn cho cô.

“Em thấy được điều gì bất thường à, Tĩnh Yên?” Thắng lập tức đặt câu hỏi thay cho cả phòng họp

“Vâng! Mọi người đọc kĩ lại báo cáo của vụ thứ hai, trong báo cáo không hề có chi tiết hung thủ dùng kìm điện hoặc thuốc mê để làm nạn nhân bất tỉnh trong khi đó thủ đoạn này lại xuất hiện trong vụ thứ nhất và vụ thứ ba?”

“Em nghi ngờ vụ án này có hai hung thủ à?” Tuấn hỏi

“Có thể vậy cũng có thể là hung thủ muốn làm rối hướng điều tra của chúng ta nên mới cố ý làm như vậy cũng nên vì theo em hắn có năng lực phản trinh sát rất cao, bằng chứng là hắn chỉ để lại dấu vết mà mình muốn để lại tại hiện trường!”

Thắng quan sát lại địa điểm gây án, cũng đồng tình bổ sung: “Còn nữa, hắn chọn hiện trường vụ án cũng thể hiện được sự cẩn thận, trong phạm vi 100m tính từ hiện trường có rất ít dân cư, muốn tìm nhân chứng để thẩm vấn cũng là một điều rất khó khăn, mà cho dù có tìm được họ cũng không biết rõ nhiều về những người ra vào trong nhà nạn nhân.”

“Trong vụ thứ ba này, rõ ràng chúng ta đã gặp may khi phát hiện và tiếp cận sớm hiện trường, chẳng hạn như trong hai vụ trước kia, thời gian phát hiện sớm nhất cũng xấp xỉ 24 giờ, điều này đã gây trở ngại rất nhiều trong quá trình thu nhặt chứng cứ cũng như khoanh vùng đối tượng!” Đội phó nhận xét

“Đội trưởng, anh thẩm vấn người báo án ra sao?”  người đội trưởng hướng về Tuấn ra hiệu cho anh đứng lên báo cáo thay mình

“Người báo án tên Phạm Minh Hải, 36 tuổi, là quản đốc của một nhà máy may   mặc, không có tiền án tiền sự, ông cho biết hôm qua là sinh nhật của vợ mình nên ông đưa vợ lên núi đi picnic, đến chiều họ xuống núi thì xe bỗng hỏng giữa đường, ông và vợ phải bỏ xe, đi bộ tìm nhà xin gọi điện thoại cố định vì di động không có sóng. Ông ấy vào nhà nạn nhân thì phát hiện cảnh tượng kinh hoàng như chúng ta đã biết, sau đó ông dùng điện thoại cố định để báo cảnh sát.”

“Những vụ án có liên quan đến Jack mà chúng ta đã điều tra như thế nào?”  đội trưởng hỏi để cố gắng tìm một hướng đi mới cho vụ án

“Không có kết quả, những vụ án ấy đa phần đều đã kết án, cháu cũng đã dùng siêu máy tính tra một số dữ liệu về tội phạm quốc tế nhưng đang đợi phê chuẩn quyền truy cập!” Tuấn tiếp tục “Trong nước cũng đã từng có vụ mô phỏng Jack nhưng tên giết người đã bị kết án từ hai năm trước nên cháu nghĩ vụ án này cũng không liên quan! Thế nhưng với từ khóa Jack The Ripper trên mạng, đã giúp cháu tìm được thứ này...” Tuấn rê chuột, gõ vài dòng lệnh lên trên “người vợ” cái tên mà cả đội gọi chiếc máy tính của Tuấn, anh kết nối với chiếc ti vi rồi bật chế độ trình chiếu. Màn hình ti vi hiện lên một trang web mà phông nền của nó hiện lên ba chữ cái la tinh to đùng được thiết kế cách điệu tỉ mỉ JTR. “Đây là trang web dành để “giao lưu” giữa những người hâm mộ Jack The Ripper trên toàn quốc, tuy nhiên có một IP rất khả nghi có tên Học trò của Jack, mọi người hãy để ý những bài đăng của hắn”

Ngày 31/8, tức là trước ngày xảy ra vụ án đầu tiên hắn đăng duy nhất tên một người nước ngoài: Mary Ann Nichols cháu đem cái tên này tra cứu trên cơ sở dữ liệu của ngành thì được biết đây chính là nạn nhân đầu tiên của Jack The Ripper và 31/8 cũng chính là ngày ghi nhận vụ án đầu tiên của hắn. Dòng trạng thái kì lạ thứ hai của hắn cũng được đăng lên vào ngày mà Jack thực hiện vụ thứ hai của mình: 8/9 cũng với một cái tên trong danh sách nạn nhân của Jack Annie Chapman. Cho đến hôm qua 30/9 hắn lại tiếp tục đăng lên tên cô gái thứ 3 và kết quả là chúng ta phát hiện được vụ án thứ 3. Cháu nghĩ đây không phải là trùng hợp.”

“Có điều tra được địa chỉ IP không?”

“Cháu đã cố gắng nhưng tên này rất xảo quyệt dùng IP nước ngoài, cháu đang phối hợp với tổ công nghệ điều tra nhưng cũng phải mất nhiều thời gian”

“Vậy coi như cũng có một tia hy vọng!” đội trưởng nói tiếp “Các đồng chí chú ý, tội phạm lần này khác hẳn với những tên chúng ta đã từng gặp. Hắn có năng lực phản trinh sát cao, các kĩ năng phạm tội cũng rất hoàn thiện đặc biệt là chuyên môn về giải phẫu và công nghệ cộng thêm là áp lực về thời gian,nên tôi đã xin lệnh cấp trên cho ta mời thêm một cố vấn đặc biệt về hỗ trợ chúng ta điều tra, tôi mong mọi người có thể hợp tác tốt! Mọi người tiếp tục điều tra theo những gì tôi phân công, đặc biệt là phía Tuấn, nhanh chóng “moi” được tên đó ra cho tôi! Tĩnh Yên, cháu sẽ đi với bác!”

“Rõ!” cả đội đồng thanh đáp, tất cả, à không, ngoại trừ Tĩnh Yên. Cô đang không hiểu quyết định của người đội trưởng. Cô biết, tên hung thủ mà họ đối mặt lần này có khả năng phản trinh sát và xóa dấu vết rất giỏi trong quá trình điều tra, nên phương pháp của cô áp dụng đạt được hiệu quả rất cao, thường thì đội trưởng phải để cô tiếp tục, nhưng cô hiểu đội trưởng không bao giờ làm những việc vô nghĩa, trong chuyện này chắc hẳn ông đã có tính toán.

Đội trưởng Thanh đang đứng bên ngoài chiếc ban công nhỏ, thường dùng để làm nơi hút thuốc lá của các “con nghiện” trong đội cảnh sát 1, nhả ra một làn khói trắng nói với Tĩnh Yên:

“Bác định, ừm… có người muốn giới thiệu cho cháu”

Tĩnh Yên cố gắng không nhìn đến điếu thuốc trên tay ông, bình thản hỏi “Ai vậy bác? Có liên quan tới vụ án à?”

Đội trưởng Thanh gật đầu “Bác định nhờ hắn giúp vụ này nhưng không chắc hắn có đồng ý không, muốn cháu đi cùng một chút”

Tĩnh Yên mở mắt to nhất có thể, dùng ngón trỏ chỉ vào bản thân mình “Cháu đi thì có liên quan gì?”

“Có liên quan, liên quan rất lớn” ông dừng lại, liếc nhìn đồng hồ, mặt méo xẹo nói một câu “Giờ lành tới rồi, đi thôi!

Tĩnh Yên: “…”',
	2
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Trò chơi tử thần',
	0,
	N'Cảnh báo về nội dung: Đây là một câu chuyện hoàn toàn không có thật. Mọi tình tiết đều được hư cấu\nGiới thiệu truyện:\nTừ cái chết của một vị luật sư trẻ tuổi với hàng loạt các uẩn khúc. Một vụ án tưởng chừng không có một chút dấu vết làm đau đầu các điều tra viên lại dần dần được vén màn bởi một vị thám tử quái đản với sự giúp sức của một bác sĩ mắc chứng tâm thần phân liệt. Và rồi, trò chơi cúp bắt giữa tên sát nhân và họ cuối cùng sẽ dẫn tới đâu. Đằng sau sự thật đó rốt cuộc là những bí mật gì...',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/tro_choi_tu_than.jpg?itok=QX9v-Ty5',
	N'An Huy hoảng hốt bật dậy sau cơn ác mộng, mồ hôi trên người túa ra như tắm.

Giấc mơ đêm qua giống như một màn mây đen kịt bủa vây lấy thần trí anh lúc này dù đây không phải là lần đầu tiên. Những cơn mộng mị không rõ hình khối nhưng khi tỉnh dậy lại để lại trong lòng anh những mảng cảm xúc vô cùng nặng nề và u ám.

Anh cố gắng lấy lại tinh thần tỉnh táo rồi nhanh chóng đến sở cảnh sát.

Trung úy An Huy không thể ngờ được rằng, giấc mơ đêm qua của anh lại chính là sự khởi đầu cho một loạt những sự việc vô cùng li kì và gay go mà anh sắp sửa phải trải qua. Những câu chuyện đã đẩy anh đến những bước ngoặt vô cùng lớn lao trong cuộc đời.

Quá giữa trưa, sở cảnh sát nhận được tin báo về một vụ án mạng. Ngay sau đó, tổ điều tra đã sớm có mặt tại hiện trường.

Ấn tượng đầu tiên của An Huy về hiện trường vụ án, đó là mùi máu tanh nồng nặc đang phả ra khắp mọi nơi trong căn phòng. Hiện trường vụ án vô cùng lộn xộn, dường như bị hung thủ cố tình lật tung lên để tìm kiếm thứ gì đó. Các điều tra viên hết thảy một lượt ai nấy đều cảm thấy xót xa và kinh hãi. Nạn nhân là một thanh niên tuổi chừng ba mươi, bị sát hại rất dã man. Hai cánh tay anh ta bị chém đứt lìa, trên người đầy những vết thương và cuối cùng tử vong bởi một vết đâm chí mạng xuyên qua tim. Thế nhưng, điều kì lạ hơn nữa là sau khi ra tay hành hạ một cách man rợ, tên sát nhân lại đặt anh ta nằm ngay ngắn, đắp lên người anh ta một chiếc chăn mỏng và đặt một nhành hoa lên người nạn nhân. Tất cả những tiếp xúc ban đầu đó khiến cho An Huy không khỏi rùng mình. Nhớ lại giấc mơ đêm qua, mồ hôi của anh lại ướt đẫm, sắc mặt tái nhợt, tệ đi trông thấy.

Anh nhớ lại những khoảng kí ức chập chờn mông lung về giấc mơ đó. Giống như một sự báo trước kể cả tư thế nạn nhân cho đến hiện trường vụ án. Tất cả đều đã xuất hiện trong giấc mơ của anh một cách kì lạ. Anh cố gắng hít một hơi, bàn tay nắm chặt, thận trọng quan sát kĩ xung quanh. Các đồng nghiệp của anh cũng đã nhanh chóng bắt đầu công việc tìm kiếm manh mối. Họ thu dọn lại hiện trường và đưa tử thi về khám nghiệm.

Xung quanh cả căn phòng, vết máu loang lổ, ngay cả hung khí tên sát nhân cũng cố tình bỏ lại ở hiện trường. Thế nhưng, điều kì lạ là trên tất cả những vật chứng ở hiện trường đều không có dấu vân tay của hung thủ. Trong căn phòng nạn nhân bị giết, camera an ninh đã ghi lại toàn bộ quá trình gây án của hắn, nhưng gương mặt hắn lại bị che kín bởi một chiếc mũ trùm đầu quấn quanh nên không thể nhìn rõ. Cả tổ điều tra đều chăm chú theo dõi đoạn băng ghi hình, không khỏi sửng sốt. Hắn không hề đeo găng tay. Thậm chí sau khi gây án, hắn còn quệt những vết máu trên người nạn nhân lên mọi nơi trong căn nhà: giá sách, tủ kính, cửa sổ… Và rồi, hắn lục tung mọi thứ, cố gắng tìm kiếm một thứ gì đó nhưng không được. Cuối cùng hắn sửa sang lại tư thế nằm cho nạn nhân, chốt lại cửa sổ và biến mất. Những giây phút vừa trôi qua, mọi thành viên trong tổ điều tra dường như nín thở. Mọi hành động của kẻ sát nhân vừa dứt khoát, vừa kì quặc, không khỏi khiến mọi người cảm thấy run sợ. Hàng trăm nghi vấn được đặt ra để phác họa chân dung của kẻ sát nhân. Liệu hắn có thù oán gì với nạn nhân? Tại sao sau khi ra tay sát hại anh ta một cách tàn nhẫn, hung thủ lại sửa sang lại quần áo, đặt anh ta nằm ngay ngắn rồi trùm chăn lên người? Tại sao hắn lại cố tình lấy máu trên người nạn nhân vẩy quanh nhà? Và cuối cùng, tại sao ở hiện trường, lại không thể tìm thấy dấu vân tay của hắn? Hung khí thu được tại hiện trường là một chiếc rìu lớn sắc nhọn, trùng khớp với mọi tình tiết được ghi lại trong camera. Nhưng trên đó, ngoài máu của nạn nhân lại không thể xác định được dấu tay hung thủ.

“Ta hãy bắt đầu từ các mối quan hệ của nạn nhân.”

“Nạn nhân tên Lí Hùng – là một luật sư. Tuy còn trẻ, nhưng anh ta đã tham gia khá nhiều vụ kiện lớn. Các mối quan hệ của anh ta có rất nhiều. Vì anh ta đã từng liên quan đến nhiều vụ án quan trọng nên số người thù hằn không phải ít.”

“Ngày mùng ba tháng ba, trước ngày xảy ra vụ án, đồng nghiệp của anh ta cho biết, anh ta nhận lời bào chữa cho một vụ kiện. Hôm đó, anh ta đã đi gặp thân chủ, nhưng không ai biết người thuê anh ta là ai. Anh ta cũng khá ít nói, bảo thủ, không có quan hệ tốt với nhiều đồng nghiệp.”

“Qua cách gây án của hung thủ, tôi nghi ngờ kẻ sát nhân mắc chứng bệnh về tâm lí. Mọi hành động của hắn rõ ràng không giống với người bình thường. Ngoài ra, hắn có thể là một người khá thân thiết với nạn nhân. Sau khi gây án, hắn đã có những hành động giống như kiểu chuộc tội.”

Tổ điều tra đều cố gắng nỗ lực hết sức không bỏ qua bất kì một tình tiết nào để khắc họa một cách hoàn chỉnh, chính xác nhất chân dung của hung thủ.

“Qua camera hình ảnh, có thể hình dung sơ bộ: tuổi của hắn từ 25-30, chiều cao trung bình 1m65- 1m70, vóc người tương đối gầy, có khả năng đang gặp một số vấn đề về tâm lí, có mối quan hệ tốt với nạn nhân.”

Cuộc họp kéo dài đến chiều muộn mới kết thúc. An Huy mệt mỏi trở về nhà. Đêm đó, anh không dám chợp mắt. Bởi vì anh sợ những giấc mơ kì lạ. Đã từ lâu lắm rồi, anh sợ đối mặt với giấc ngủ, sợ cái khả năng nhìn thấy trước tương lai của mình qua mỗi giấc mơ.
Ngày hôm sau, câu chuyện về “tên sát nhân không có dấu vân tay” đã trở thành một đề tài nóng trên các tờ báo pháp luật.

Ở mọi nơi, người ta sôi nổi bàn tán, thi nhau phỏng đoán động cơ gây án và còn đánh cược cả thời hạn cảnh sát tóm được hung thủ.

Rốt cuộc, đau đầu vì “tên sát nhân có đôi bàn tay phù thủy” ấy nhất lại chính là sở cảnh sát.

Người nhà của nạn nhân, dư luận, cấp trên… tất cả đều dồn hết sự quan tâm chú ý vào vụ án “có một không hai” này. Đến nỗi, mỗi ngày, lại có trên dưới chục cuộc điện thoại gọi tới sở cảnh sát chỉ để biết thêm những thông tin về cuộc điều tra.

Ngày hôm nay, cuối cùng tổ điều tra cũng nhận được lệnh bắt khẩn cấp kẻ tình nghi. Đó là Đỗ Văn – một khách hàng đã từng thuê Lí Hùng làm luật sư bào chữa cho em trai anh ta là nghi can trong một vụ án giết người. Nhưng đến sát ngày đưa ra xét xử, Lí Hùng đã hủy bỏ hợp đồng, bỏ mặc em trai Đỗ Văn là Đỗ Vũ. Cuối cùng, Đỗ Vũ bị tòa tuyên án tử hình. Thời điểm xảy ra vụ án mạng, Đỗ Văn không hề có chứng cứ ngoại phạm. Xét về ngoại hình vóc dáng lại hoàn toàn có điểm tương đồng với hung thủ được ghi lại trong đoạn băng. Cộng với động cơ gây án rõ ràng, anh ta hoàn toàn hội tụ đầy đủ các yếu tố để trở thành kẻ tình nghi số một.

Thông tin về lệnh bắt kẻ tình nghi trong vụ án “tên sát nhân với đôi bàn tay phù thủy” ngay lập tức lại trở thành đề tài xôn xao trên các phương tiện thông tin đại chúng. Hình ảnh người thanh niên hai mươi bảy tuổi với nét mặt vô cùng hoảng loạn, cố gắng che mặt trước ống kính ghi hình càng làm dư luận thêm căm phẫn.

Thế nhưng trong một căn phòng nhỏ, gã đàn ông ngồi trước màn hình tivi khẽ nhếch miệng, nở một nụ cười chế giễu. Gã gác chân lên đùi, nhấp một ngụm café đặc quánh thở dài:

“Nhâm à, anh lại đây mà xem này. Đúng là một lũ ngốc!”

Lão đàn ông béo lùn nhăn nhó trả lời vọng ra từ trong bếp:

"Ừ, mày đừng nên xía vô. Tao không muốn dính líu gì nữa với bọn cảnh sát đâu".

Gã kia trưng ra bộ mặt méo mó. Gã tắt phụt màn hình tivi lại gần một cái lồng nhỏ đặt trên nóc tủ.

"Cưng à. Biết đâu mày còn thông minh hơn chúng nó."

Gã lách tay, mở cái lồng bắt ra một sinh vật đầy lông lá. Con chuột nhắt đứng trên bàn tay lão, kêu "chít chít" không ngừng.

**

Ngày hôm sau, sở cảnh sát nhận được một thùng hàng chuyển phát nhanh, bên trong có chứa một cuộn băng video.

Cả tổ ai nấy đều không khỏi hiếu kì và tò mò. Họ cho phát cuộn băng lên. Nhưng nội dung bên trong của nó còn lạ lùng hơn thế.

Trên màn hình chỉ hiện lên duy nhất một hàng chữ màu đỏ tươi trên nền đen kịt.

"You were wrong. Things did not end and you will pay the price".',
	2
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Những cái bẫy chết người',
	0,
	N'“Những vụ án chưa được tìm ra cũng giống như những bài toán chưa có lời giải. Có những lúc lí giải tại sao còn khó hơn kết quả của nó rất nhiều”.\n\nThanh Lâm là đội trưởng đội điều tra của cục cảnh sát thành phố.\n\nTại nơi đây, rất nhiều vụ án rắc rối và phức tạp đã diễn ra.\n\nCùng với sự hỗ trợ của Hải Yến, vợ chưa cưới của anh, đồng thời cũng là một bác sĩ giải phẫu tử thi, những bức màn bí mật đó đều lần lượt được sáng tỏ.\n\nĐằng sau mỗi vụ án, người ta sẽ thấy có những cái bẫy mà hung thủ dàn dựng ra, lừa gạt nạn nhân và cũng để đánh lạc hướng điều tra của cảnh sát.\n\nTuy nhiên, tội ác không bao giờ lọt lưới trước pháp luật. Cho dù chúng có được dàn dựng tinh vi đến đâu cũng sẽ lần lượt bị phanh phui và đưa ra ánh sáng.\ntag',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/11224424_1658555811023896_8874237683850602413_n_1.jpg?itok=FFchwxpj',
	N'Những vụ án chưa được tìm ra cũng giống như những bài toán chưa có lời giải. Có những lúc lí giải tại sao còn khó hơn kết quả của nó rất nhiều.

**

13 giờ 15 phút, xe cảnh sát đã có mặt tại một tòa nhà cao tầng.

Trong nhà ăn của công ty Vạn Quân:

"Nạn nhân tên là Bích Nhã, năm nay hai mươi sáu tuổi, vào làm nhân viên của công ty Vạn Quân được ba năm. Thời điểm tử vong xác định vào khoảng mười hai giờ ba mươi phút, trong nhà ăn tập thể của công ty. Kết luận ban đầu: Nguyên nhân tử vong do trúng độc."

Đội trưởng Thanh Lâm vừa nghe báo cáo sơ bộ, vừa khảo sát hiện trường. Anh đeo găng tay tỉ mẩn khám nghiệm mọi dấu tích trên người nạn nhân. Nạn nhân là một cô gái còn khá trẻ, mặc trang phục công sở đang gục đầu trên bàn ăn.

Lát sau, cảnh sát tìm hiểu lại lời khai của những nhân chứng có mặt tại hiện trường rồi đưa xác nạn nhân về khám nghiệm.

Trên xe cảnh sát, đội trưởng Lâm quay sang hỏi người thanh niên bên cạnh:

" Quang Huy, cậu có suy nghĩ gì không?"

Quang Huy là một cảnh sát trẻ mới vào tổ điều tra được ba tháng, tuy nhiên, anh đã tỏ ra là một điều tra viên rất có năng lực:

" Em thấy vụ án này có hai vấn đề cần lưu ý: Thứ nhất, nạn nhân chết trong giờ ăn trưa ở bếp ăn tập thể, rất khó kết luận, thức ăn ban đầu có thuốc độc, chỉ có thể là đã bị nhiễm độc trong quá trình mang về dùng mà thôi. Hơn nữa, nhân chứng cũng đã xác minh: Nạn nhân ngồi ăn một mình, giữa chừng có vào nhà vệ sinh một lát, nhưng không thấy có đối tượng khả nghi lại gần bàn ăn của cô ta, cho nên cũng loại trừ khả năng có người hạ độc vào đồ ăn. Thứ hai, đồng nghiệp của cô ta cũng xác nhận, gần đây tinh thần cô ta cũng không có dấu hiệu rối loạn, trên túi xách cô ta để lại hiện trường cũng không tìm thấy thuốc độc, càng khó xảy ra khả năng tự sát. Tóm lại, vụ án này có rất nhiều điểm phức tạp, chưa tìm ra được cách thức gây ngộ độc."

"Tốt lắm."

Đội trưởng Lâm nở nụ cười hài lòng nói tiếp:

"Tôi có thể bổ sung thêm: Cô ta chuẩn bị có một cuộc hẹn."

" Tại sao?"

Trên mặt Quang Huy lộ vẻ ngạc nhiên:

" Bởi vì, trên người cô ta mặc trang phục công sở khá nghiêm túc, nếu cậu quan sát kĩ, đồng nghiệp của cô ta cũng ăn mặc và trang điểm khá đơn giản, điều này chứng tỏ, quy định về hình thức của công ty khá khắt khe. Nhưng trên mặt cô ta lại trang điểm khá đậm, đây lại là giờ nghỉ trưa, chứng tỏ dùng cơm xong, cô ta sẽ đi gặp ai đấy. Hơn nữa, giờ nghỉ trưa của công ty cũng không hề kéo dài, cô ta lại đang dùng cơm trong công ty chứng tỏ cuộc hẹn này không có sắp xếp từ trước. Nhân chứng nói, lúc ăn cơm, cô ta nhận được điện thoại rồi đi vào nhà vệ sinh, có lẽ là do nhận được cuộc gọi hẹn gặp. Hơn nữa, người này ắt hẳn phải là người trong cơ quan, làm cùng với cô ta vì chỉ còn nửa tiếng nữa là cô ta vào làm, nếu có hẹn với người khác ở bên ngoài sẽ rất bất tiện, không ai làm thế. Tôi đoán, cô ta có hẹn với một người tình nơi công sở."

Quang Huy tập trung lắng nghe, lòng thầm thán phục. Anh đã nghe kể về khả năng phá án của đội trưởng Lâm rất nhiều, nhưng hôm nay là lần đầu tiên anh được tận mắt chứng kiến.

Xe cảnh sát đi về sở, lập tức, kẻ tình nghi được xác định. Hắn tên là Hữu Trí, làm cùng công ty với Bích Nhã. Hai người đã có quan hệ tình cảm khá lâu. Tuy nhiên, gần đây anh ta đã có quan hệ với một người phụ nữ khác.

Nhưng vấn đề là không có bất cứ bằng chứng gì để buộc tội Hữu Trí. Cái chết của Bích Nhã xảy ra trong nhà ăn công ty, lúc đó, đúng là hắn đã xác nhận hẹn gặp Bích Nhã để nói chuyện, nhưng khi hắn đến đã thấy cô ta chết rồi. Tuy làm cùng công ty, nhưng hôm nay, Hữu Trí kêu có việc bận nên không thể cùng Bích Nhã xuống nhà ăn. Lúc quá trưa anh ta nhớ ra có việc nên gọi điện hẹn gặp Bích Nhã.

Thanh Lâm đến phòng khám nghiệm tử thi, anh rón rén, lại gần bịt mắt một người con gái:

" A, anh đến rồi à, bỏ tay ra nào."

Hải Yến là bác sĩ chuyên giải phẫu tử thi, cô cũng đồng thời là vợ chưa cưới của Thanh Lâm:

"Có phát hiện gì không em?"

Hải Yến lắc đầu nói:

"Cô ấy có thai ba tháng rồi."

"Vậy sao?"

"Vâng. Không biết kẻ nào lại nhẫn tâm đến vậy. Chỗ anh đã có gì mới chưa?"

"Tạm thời chưa tìm ra cách thức đầu độc nạn nhân. Không biết hắn làm thế nào đầu độc được cô ta."

"Vậy à, dù sao cũng không cần nóng vội."

"Tối nay, tan làm anh đón em đi ăn cơm."

***

Tại một nhà hàng sang trọng, Thanh Lâm cùng Hải Yến quây quần bên bàn ăn, Thanh Lâm ngắm nhìn người vợ sắp cưới của mình, gương mặt nở một nụ cười thoải mái:

"Hôm nay em đẹp lắm."

"Vậy à?"

Hải Yến nhìn anh đỏ mặt:

"Màu son này hợp với em phải không? Một người bạn của em mới tặng đấy."

" Ừ."

" Loại son nước này mới ra, không có ở ngoài đâu, nghe nói phải đặt mua tại công ty."

Hải Yến mỉm cười, nhấc li rượu trên bàn nhấp một ngụm.

" Khoan đã."

Trong đầu Thanh Lâm chợt lóe lên một suy nghĩ. Anh mỉm cười nói với Hải Yến:

"Anh tìm ra cách thức hạ độc của hung thủ rồi."

Thanh Lâm nhấc máy điện thoại, gọi về sở cảnh sát.

"Kiểm tra xem trong túi xách của cô ta có thứ đó không?"

Sau khi cúp máy điện thoại, Thanh Lâm nở một nụ cười vừa ý:

"Em yêu, cảm ơn em nhé."

Hải Yến ngơ ngác không hiểu gì, cô nhìn anh, ánh mắt đầy nghi hoặc:

" Anh tìm ra hung thủ rồi à?"

" Ừ."

Hải Yến lặng yên một lúc rồi chợt nghĩ ra:

"A, chẳng lẽ là son môi, hắn ta hạ độc vào son môi."

"Ừ."

"Nhưng làm thế nào?"

"Em thử nghĩ xem?"

"Em không nghĩ ra được."

"Là quà tặng. Giả sử thế này nhé, nếu hôm trước anh tặng em một lọ son nước, ngày hôm sau anh gặp em."

"Ý anh là, hắn sẽ bảo: Em thử dùng loại son anh mới tặng xem sao."

"Phải. Hôm ở hiện trường, anh phát hiện, đồ ăn của cô ấy toàn món cay. Anh cũng đã tìm hiểu: Các đồng nghiệp của cô ta đều nói cô ta thích ăn cay, nhà ăn của công ty có thực đơn cố định theo các ngày trong tuần. Món cay cũng chỉ có vào ngày thứ sáu. Có thể tưởng tượng quá trình gây án của hắn thế này. Ngày hôm trước hắn tặng cô ta một lọ son nước giống của em, bởi vì nó là hàng mới ra, nên các cô gái hiển nhiên rất thích. Hôm sau, trong giờ ăn trưa, hắn cố tình không xuống ăn, nhưng đến giữa bữa ăn hắn gọi điện cho cô ta hẹn gặp, bảo cô ta dùng thử loại son mới cho hắn xem. Cô ta liền vào trang điểm chuẩn bị gặp người yêu vì nghĩ rằng hắn sẽ xuống nhà ăn. Vì ăn nhiều đồ cay dễ khát nước nên Bích Nhã trong lúc đợi Hữu Trí đến đã uống rất nhiều nước. Bản thân thuốc độc trộn vào son nước đã rất dễ tan, khi uống nước, lượng son chứa chất độc trên môi cô ta cũng hòa tan vào nước trôi vào cơ thể. Chỉ cần đến công ty son môi yêu cầu họ cung cấp danh sách những người đặt hàng mua là có thể kết tội được hắn."

"Nhưng anh có chắc là son cô ta được tặng? Nếu là của cô ta rồi hắn cho chất độc vào sau thì rất khó kết tội hắn."

"Khả năng này rất ít. Vì hoàn cảnh của Bích Nhã cũng không phải khá giả. Em đã nói, loại son này không có trên thị trường mà phải đặt mua chứng tỏ giá của nó rất đắt. Một cô gái bình thường như Bích Nhã sẽ không nghĩ đến chuyện mua nó."

Ngày hôm sau đó, Hữu Trí được đưa đến sở cảnh sát, hắn quả nhiên đã khai nhận: Hắn và Bích Nhã đã có quan hệ tình cảm mấy năm nay, nhưng hắn không hề có ý định kết hôn với Bích Nhã. Hắn đồng thời nảy sinh quan hệ tình cảm với một cô gái con nhà giàu khác và hai người đã đính ước, chuẩn bị kết hôn. Lúc Bích Nhã thông báo với hắn cô đã có bầu, hắn sợ phải chịu trách nhiệm, cũng sợ không kết hôn được với cô gái nhà giàu kia, bèn nghĩ ra kế hoạch độc ác để hại chết người yêu và chính con đẻ của mình.

Cuối cùng thì kẻ giết người cũng sa lưới pháp luật, cho dù có kế hoạch tinh vi, hoàn hảo tới đâu thì tội ác cũng không thể che giấu.
“Có đôi khi, người ta mắc sai lầm chính là vì đã phức tạp hóa hóa những điều đơn giản”

Tan sở, Thanh Lâm và Hải Yến dùng cơm trưa tại một quán ăn nhỏ ở gần cơ quan. Tuy chỉ còn hơn hai tháng nữa là đến ngày cưới, nhưng gần đây Thanh Lâm bị vướng vào một vụ án thiếu nữ mất tích khiến anh luôn bận rộn, không có thời gian nhiều để chuẩn bị cho hôn lễ.

"Anh à, vụ án có tiến triển gì không anh?"

Hải Yến hỏi anh, giọng đầy lo lắng.

" Tạm thời chưa có. Trong vòng một tháng nay đã có đến năm nạn nhân mất tích. Đối tượng là các cô gái trẻ tuổi từ mười tám đến hai lăm. Họ đều biến mất khi ra ngoài một mình ở những nơi vắng vẻ cho nên không có nhân chứng, cũng không có dấu vết gì lưu lại. Yến à, anh đang cố gắng để hoàn thành xong vụ án này, anh sẽ xin nghỉ phép để chuẩn bị cho lễ cưới của chúng ta."

"Vâng, em hi vọng sẽ sớm tìm ra manh mối."

Chuông điện thoại của Thanh Lâm chợt reo, trả lời điện thoại xong, anh cúp máy, quay sang nói với Hải Yến.

"Đã tìm được nạn nhân mất tích sau cùng, cô ấy đã chết rồi."

Chỉ nửa giờ sau, Thanh Lâm cùng Hải Yến đã có mặt tại hiện trường nơi xảy ra án mạng. Hai người cùng tập trung lắng nghe thông tin sơ bộ:

" Nạn nhân tên là Phương Ngân, năm nay hai mươi tuổi, đang là sinh viên trường đại học X, đã mất tích ba ngày nay. Nguyên nhân tử vong ban đầu được xác định do chấn thương sọ não bởi vết thương ở đầu."

Thanh Lâm chăm chú nghe. Anh cau mày, khẽ thở dài.

Tại nơi khám nghiệm tử thi, sau khi xem xét rất kĩ càng, Hải Yến nói với Thanh Lâm:

" Có dấu hiệu bị xâm hại tình dục, trên người có nhiều vết bầm dập, có khả năng trước khi chết cô ấy đã bị hành hung."

Thanh Lâm gật đầu với cô, anh đi ra ngoài hút một điếu thuốc, hít một hơi thật dài.

Cuộc điều tra đã mấy ngày nay không có tiến triển, cũng không có thêm manh mối.

Một buổi sáng, thông tin về trụ sở lại có thêm nạn nhân thứ sáu.

Càng ngày càng có thêm nhiều người mất tích, nếu như không nhanh chóng tìm ra sẽ gây ra tâm lí bất an, lo sợ cho người dân, chỉ sợ sẽ có thêm nhiều nạn nhân nữa.

Cho đến nay, chỉ có duy nhất nạn nhân thứ năm được tìm thấy, những người còn lại đều không rõ sống hay chết

Mấy ngày nay, sở cảnh sát làm việc không ngừng nghỉ, chỉ mong sớm tìm ra manh mối.

Cuối cùng, công sức của họ cũng có ngày được đáp trả.

Ba ngày sau vụ mất tích của nạn nhân thứ sáu, một cô gái tự xưng là bạn của nạn nhân chủ động liên lạc với sở cảnh sát. Cô ta nói, ngày bạn mình bị mất tích, cô ta có đi cùng. Hai người đi chơi với nhau đến tối, lúc chia tay ra về cô ta phát hiện mình để quên điện thoại trong túi xách của bạn bèn quay lại tìm. Lúc đó trời đã tối, cô ta không nhìn rõ, chỉ thấy bóng một người đàn ông cao lớn bắt bạn mình đi. Tuy nhiên, khi hắn phát hiện có người nhìn thấy đã lôi cô gái đi thật nhanh và vô tình làm rơi túi xách của nạn nhân. Cô ta sợ hãi nhặt lấy túi xách của bạn đem về. Vì còn chấn động tinh thần nên cô ta chưa dám đi khai báo với cảnh sát, đến hôm nay mới chủ động liên lạc.

Cảnh sát lập tức cho người kiểm tra túi xách của nạn nhân. Thanh Lâm quay sang hỏi cô gái:

" Mọi thứ trong này vẫn còn nguyên đấy chứ?"

"Vâng, ngoài điện thoại của tôi ra, mọi thứ vẫn còn ở đó."

"Điện thoại, đồ trang điểm, thẻ học viên, ví tiền, sổ ghi chép. Đội trưởng, hết rồi."

"Cậu kiểm tra điện thoại cho tôi, đặc biệt chú ý các cuộc gọi, tin nhắn xung quanh ngày hôm đó."

" Rõ, thưa đội trưởng."

"Quang Huy, trên thẻ học viên có ghi gì?"

" Là “Võ quán Á Đông” ạ. Có lẽ là một lớp học võ."

"Cậu kiểm tra tiếp sổ ghi chép cho tôi:"

" Đội trưởng, mấy trang đầu là sổ ghi chép chi tiêu hàng ngày, trang cuối cùng là một dãy số, ngoài ra, trong tờ lịch ở đầu cuốn sổ có rất nhiều ngày được khoanh tròn, Có lẽ là lịch trình gì đó."

"Tốt lắm. Kể từ hôm nay, chúng ta hãy bắt tay vào nghiên cứu thật kĩ các manh mối. Nhất định phải tìm ra được điều gì đó."

Suốt hai ngày hôm nay, Thanh Lâm chỉ ngồi trong phòng, tập trung nghiên cứu các con số: 14673AH57. Một dãy kí tự bí ẩn cứ nhảy nhót trước mặt anh, thật sự manh mối rất mong manh, ban đầu anh cứ nghĩ đã có được manh mối quan trọng, nhưng giờ đây anh lại cảm thấy bất lực, dường như nó quá là vô nghĩa.

Một tiếng gõ cửa nhẹ cắt ngang dòng suy nghĩ mơ hồ của anh. Là Quang Huy:

" Anh Lâm, có manh mối rồi."

"Nói đi."

" Em đã tìm hiểu kĩ, các cô gái bị mất tích trong thời gian vừa qua, trừ nạn nhân đã chết được tìm thấy, những người còn lại đều đã từng là học viên của “Võ quán Á Đông”."

"Cậu làm tốt lắm."

Đội trưởng Lâm vỗ vai Quang Huy, nở nụ cười hài lòng.

"Em đã đến nơi đó điều tra, võ quán đó mở cửa được nửa năm nay, điều đặc biệt là chỉ nhận học viên nữ, không nhận nam, giáo viên ở đó cũng là nữ. Một số học viên ở đó cho biết, bọn họ khi tham gia khóa học mỗi người sẽ được cấp một tài khoản cá nhân, sau đó mọi hoạt động hay kế hoạch của lớp học sẽ được thông báo qua tài khoản đó."

Thanh Lâm gật đầu. Anh khá tin tưởng vào thực lực của Quang Huy. Anh ta tuy mới vào sở chưa lâu, nhưng đã tỏ rõ năng lực hơn người, tương lai sẽ là một điều tra viên đầy triển vọng.

Lại tập trung vào đống giấy tờ lộn xộn trên bàn, anh lẩm nhẩm những con số: 7, 12, 18, 23. Đó là các ngày được khoanh trong tờ lịch trên cuốn sổ tay.

Anh vội lật giở xấp tài liệu trên bàn: 7, 12, 18, 23. Sao mình không nghĩ ra nhỉ?

Số ngày đánh dấu trên lịch trùng khớp với những ngày có thông báo nạn nhân bị mất tích.

Hải Yến khẽ đẩy cửa bước vào. Cô nhìn gương mặt mệt mỏi vì thiếu ngủ trầm trọng của người chồng tương lai mà lo lắng, xót xa.

"Thế nào anh? Có tìm ra không?"

Anh lắc đầu.

Cô vỗ nhẹ vào vai anh động viên:

"Không sao mà. Nhất định sẽ tìm ra thôi."

Như chợt nhớ ra điều gì đó, cô nói tiếp:

" À, hôm trước, em nghe nói vụ án có liên quan đến “Võ quán Á Đông”, em đã đăng kí làm học viên ở đó rồi."

"Công việc điều tra của anh, em không cần quan tâm đâu."

Anh vuốt ve mái tóc dài mềm mại như tơ của Hải Yến.

"Có sao đâu, em đăng kí tham gia thử, nếu có điều nghi vấn em sẽ lập tức thông báo cho anh."',
	2
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Scream Queens',
	0,
	N'Một nhóm học sinh nội trú kinh hoàng nhận ra ngôi trường của họ đang bị tấn công bởi một kẻ sát nhân bí ẩn. Trong khi từng người trong họ lần lượt bị sát hại, những kẻ còn sống sót cố truy tìm danh tính của kẻ thủ ác trước khi quá muộn. Liệu đó có phải là Kẹo Mật – một nữ sinh tâm thần từng gây ra một vụ thảm sát ở nơi này trong quá khứ. Hay đây thực chất là một âm mưu khéo léo của một kẻ nào đó trong số những học sinh ở đây?\n\n​Cảnh báo: Truyện được viết theo phong cách slasher nên sẽ có rất nhiều cảnh gái đẹp trai đẹp đi lang thang thơ thẩn một mình, sau đó thì la hét, rồi rượt đuổi, rồi té ngã, rồi bị đâm bị chém bằng đủ thứ vật dụng linh tinh và chết. Bạn đọc cân nhắc khi xem.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/morning-glories_19.jpg?itok=csoHXz5b',
	N'“Hãy cố mà làm ta bất ngờ xem, mấy tên quái.” Kẻ đó cười khẩy một cái khi liếc nhìn qua ô cửa kính bé nhỏ, thứ duy nhất đang ngăn cản bọn điên đó với cái thế giới bên ngoài. Điều đó nghe thật đáng thương, nhưng mặt khác, điều đó nghe cũng rất nguy hiểm nữa. Kẻ đó quay sang nói với viên quản giáo về mối lo ngại của mình:

- Mọi người có chắc rằng bọn họ sẽ không thể đào tẩu khỏi đây hay gì đó chứ?
Kẻ đó vừa dứt lời thì một tên điên nào đó chợt lao đến cửa và la hét về điều gì đó mà chỉ có gã mới hiểu. Cố hơn nữa đi, bấy nhiêu thì vẫn chưa đủ để gây ấn tượng đâu.
- Đừng lo, nhóc. Chưa có bệnh nhân nào vượt qua được hàng rào an ninh của nơi này. Bọn tôi là chuyên gia trong lĩnh vực này mà.
Viên quản giáo đang cố hết sức để biểu lộ ra một vẻ mặt thông cảm. Dám cá rằng ông ta đang cố hết sức rặn ra mấy câu chữ này chỉ để cho hợp hoàn cảnh mà thôi.
- Ta biết những chuyện đã xảy ra ở trường. Thật khủng khiếp! Nhưng nhóc không cần phải sợ nữa. Mọi chuyện đã kết thúc rồi. Con bé đó, hay bất kì kẻ tâm thần nào ở đây, cũng không thể nào bén mảng đến ngôi trường đó nữa.
Kẻ đó thầm cười mỉa mai. Ai lo lắng gì đến chuyện đó đâu nào? Nhìn những kẻ khốn khổ kia mà xem. Việc bén mảng đến ngôi trường đó cũng chỉ làm cuộc đời của chúng ngắn hơn một chút mà thôi. Có phải chuyện gì lớn lao đâu chứ. Nhưng cô ta thì lại là một chuyện hoàn toàn khác.
- Cô ấy vẫn… ổn chứ?
Từ “ổn” ở đây nghe thật khôi hài. Nhưng bạn không thể thẳng thắn mà nói ra những từ kiểu như “bị điên” được.
- Ừm, con bé… không có tiến triển gì cả. Giống như một con búp bê vậy. Không di chuyển nhiều, đặt đâu ngồi đó. Và vẫn im lặng suốt, như thể chẳng quan tâm gì đến ai cả.
- Có nhiều người đến thăm cô ta lắm sao?
Có một chút lo lắng đang hiện ra trong mắt kẻ đó. Trước câu hỏi bất ngờ này, viên quản giáo phải mất một chút thời gian để lục lọi kí ức của mình. Và sự ngập ngừng đó lại càng khiến kẻ đó thêm sốt ruột.
- Ngoài trừ nhóc ra thì cũng chỉ có vài ba đứa khác. Hình như cũng là bạn của nó. Nhưng ta đã nói rồi. Con bé đó chẳng phản ứng gì trước ai cả.
Thế thì tốt, kẻ đó có thể buông lỏng một chút rồi.
- Thế cô ấy đâu, con muốn gặp cô ấy một chút.
- Đang ở phòng chờ, chúng ta đến đó thôi.
Ngoan ngoãn đi theo ông ta, kẻ đó vừa đi vừa ngước nhìn những bức tường trắng đang dần quen thuộc qua những chuyên thăm viếng bí mật thế này. Và rồi họ đến nơi. Cô ta đang ngồi đó, vẫn y nguyên như hình ảnh lúc họ chia tay lần trước, như thể cô ta chẳng hề di chuyển đi đâu trong suốt thời gian qua. Tuyết Lê vẫn đang hì hục viết cái gì đó, hăng say đến độ ngỡ như sẽ chẳng bao giờ bỏ cây bút kia xuống.
- Cô ấy bắt đầu thế này từ bao giờ?
- Con bé vẫn luôn hí hoáy như thế suốt từ lúc đến đây mà. Chỉ là mấy ngày nay nó có vẻ chú tâm hơn bình thường một chút.
Cô ta đang viết cái quái gì thế không biết? Kẻ đó hồ nghi bước đến bên cạnh chiếc bàn. Những mảnh giấy được viết vội vàng đã bị quăng lung tung khắp nơi. Nhưng ngay khi nhìn thoáng qua những gì đang dần hiện ra qua những trang giấy đó, một nụ cười lại nở trên môi kẻ đó. Ông ta đã nói gì nhỉ? “Mọi chuyện đã kết thúc” ư? Ông ta lại sai nữa rồi.
Và thế là, câu chuyện lại bắt đầu…
XXX
- Con nghĩ chúng ta sẽ rẽ ở chỗ kia… Hay là… Đó là đường cụt à?
Uyên Thư bối rối ngó trở lại cái bản đồ một lần nữa. Những hình ảnh trên này chẳng ăn nhập gì với thực tế cả. Nơi này chỉ toàn là một màu xanh mà thôi.
- Cháu có chắc là chúng ta đi đúng hướng không? Ai lại xây một cái trường ở trên núi cơ chứ? Họ sợ bọn học sinh trốn học hay gì à?
Ông chú lái taxi đang nhìn cô một cách đầy ngờ vực. Trông cô có khả nghi đến mức đó không nhỉ? Một con bé có nước da hơi nhợt nhạt, đôi mắt thì có một chút hoảng loạn… Bộ dạng của cô cũng đâu tệ đến mức giống như một con bé đang tìm cách bỏ nhà đi bụi hay gì đó đâu nhỉ… Chết thật! Liệu ông ta có nhận ra chuyện đó và bắt cô quay về nhà không? Nếu ông ấy buộc cô phải gọi cho mẹ mình để xác nhận thì sao? Không được đâu! Hãy bình tĩnh đi nào! Uyên Thư cố trấn tĩnh mình và nở một nụ cười tươi tắn hết sức có thể. Khốn thật, cô tự nhìn mình qua gương chiếu hậu và nhận ra gương mặt của cô lúc này trông thật ngớ ngẩn.
Ông ta tất nhiên là chẳng đáp lại nụ cười của cô. Nhưng không sao, ít ra thì may mắn cuối cùng cũng đã mỉm cười. Uyên Thư thoáng nhìn thấy một dáng người đang hì hục đạp xe bên lề đường. Hẳn cậu ta phải là một vị cứu tinh hay gì đó.
- Kìa! Cậu ta chắc cũng là học sinh ở đó! Chú hãy tấp vào và hỏi đường cậu ta xem!
Lão tài xế có vẻ hơi bực. Dù sao thì họ cũng đã vượt qua cái xe đạp đó một khoảng cách khá xa. Quay đầu lại thì bất tiện mà dừng lại để chờ cậu ta thì lại tốn thời gian. Nhưng một lần nữa, may mắn lại đến để giải thoát họ khỏi sự khó xử. Ở phía trước họ, một chiếc taxi khác đang đậu bên lề đường. Trong lúc người tài xế đang mệt mỏi với cuộc điện thoại, một cô nữ sinh khác đang đứng bên cạnh với vẻ mặt chán chường. Cũng y hệt như Uyên Thư, gương mặt của cô ấy sáng bừng lên khi nhìn thấy xe họ đang chạy đến gần.
- Xin lỗi! Bồ đang trên đường đến ngôi trường đó đúng không?
Cả hai cô gái đều hớn hở nhìn nhau khi nhận ra mình có cùng đích đến. Mọi chuyện sau đó được dàn xếp rất nhanh chóng. Sau khi Vân Yên đã chuyển sang xe của cô, cuối cùng Uyên Thư đã có thể thở phào nhẹ nhõm.
- Bồ không biết tui mừng thế nào khi gặp được bồ đâu. Bọn tui đã bị lạc trong khu này gần cả tiếng rồi đấy!
- Tui cũng thế. Khi cái xe đó chết máy, tui cứ lo rằng mình sẽ bị kẹt ở đó hàng giờ ấy chứ!
Vân Yên lắc nhẹ đầu của mình để rũ bỏ cái ý nghĩ xui xẻo đó đi. Sau đó, cô rút từ trong túi của mình ra một chai nước và một cái di động. Trong khi uống nước, cô cũng tranh thủ nhắn tin báo cho người bạn của mình. Thấy vậy, Uyên Thư bèn ý tứ mà chuyển ánh mắt sang nhìn ra bên ngoài cửa kính. Không để cho không khí trong chiếc xe yên ắng được bao lâu, Vân Yên lại mở lời hỏi:
- Mà tại sao bồ lại bị lạc thế? Họ có gửi bản đồ hướng dẫn đường đi cho chúng ta mà.
Uyên Thư ngơ ngẩn chẳng biết nên trả lời câu hỏi đó thế nào cho phải.
- Ờ thì, bồ biết đấy, lúc tui rời khỏi nhà, tui đã sợ rằng mình sẽ đến trễ nên… Tui vội quá mà bỏ quên một số giấy tờ ở nhà.
Vân Yên ngước mắt lên một chút, gật gù rồi lại nhanh chóng nhìn trở lại màn hình. Cô ấy vẫn đang nhắn tin với ai đó.
Trong lúc đó, Uyên Thư lại im lặng và hồi tưởng lại cảnh tượng hồi sáng, khi mà cô lẻn ra khỏi nhà trong lúc mẹ cô vẫn còn đang say ngủ. Lúc đó trong đầu cô có quá nhiều ý nghĩ lo lắng nên tất nhiên việc cô đánh rơi một vài tờ giấy là một điều rất dễ hiểu.
Sự im lặng khiến Vân Yên hơi khó chịu. Cô rời mắt khỏi điện thoại một chút và nhìn thấy cái bánh mì đang nằm trong túi của Uyên Thư. Cô ấy lại bắt đầu gợi chuyện.
- Bồ vẫn chưa ăn sáng sao? Ông ta không cho bồ ăn trên xe à?
Vân Yên đảo mắt về phía lão tài xế. Ông ta ngay lập tức lại phủi trách nhiệm.
- Đâu có. Cứ tự nhiên đi nhóc. Chỉ là đừng có làm rơi vãi ra nệm ghế…
Vân Yên trề môi nhìn lão. Chỉ bấy nhiêu cũng đủ để khiến lão phải đổi giọng.
- Ờ, cứ tự nhiên đi! Cứ tự nhiên!
Uyên Thư mỉm cười một cách khổ sở khi nhìn vào cái khối bột nhăn nhúm trong túi mình. Cô định từ chối nhưng rồi lại bị ánh mắt của Vân Yên ép buộc phải cầm cái ổ bánh xấu xí đó lên. Cô chăm chú nhìn nó, cô có thể nhìn xuyên thấu qua nó ấy chứ. Cái đống mỡ màng béo ngậy đến phát ói, và cả cái mớ rau cải chẳng có tí mùi vị gì nữa chứ. Làm sao đây… Cô bất chợt đặt câu hỏi:
- Lúc nãy bồ có thấy một đứa con trai đang đạp xe trên đường không? Tui nhìn thấy cậu ta trước khi đậu xe vào chỗ bồ. Chắc hẳn cậu ta cũng là học sinh ở đó nhỉ?
- Chắc là thế rồi…
Vân Yên chẳng hề ngước nhìn lên khi trả lời cô. Nhưng Uyên Thư vẫn có cảm giác như cô ta đang ngấm ngầm thúc ép mình phải cho cái thứ kia vào miệng. Cô đưa cái bánh lên trước miệng mình và nín thở… Đôi môi cô mím chặt lại, và tay cô ném thẳng cái bánh ra khỏi cửa kính.
- Tui nghĩ nó hỏng rồi!
XXX
Chiếc xe buýt dừng lại. Thật may mắn là cậu đã dặn trước người soát vé. Nếu không thì chắc cậu đã mải mê đọc đến độ bỏ mất trạm dừng này. Anh Thanh uể oải vác ba lô lên lưng, xác định phương hướng của ngôi trường và rồi giở cuốn truyện ra. Cứ thế, cậu vừa bước đi vừa tiếp tục cuộc hành trình trên những trang sách của mình. Hình như cũng có một kẻ khác đã xuống cùng trạm với cậu. Chắc hẳn là một học sinh khác. Là nam hay là nữ nhỉ? Cậu chẳng biết nữa. Tại sao Zoe lại còn sống nhỉ? Cô ta giả chết sao? Có tiếng bước chân phía sau cậu. Chắc chắn là kẻ kia rồi. Đó cũng là một học sinh mới như cậu chăng? Không! Rõ ràng Irina đã bắn cô ta! Bản sao nhân bản? Một kẻ biến hình mạo danh? Có vẻ không phải… Anh Thanh ngước lên nhìn con đường phía trước mình. Ngôi trường có lẽ nằm ở hướng này. Hay là du hành thời gian? Bản thể từ chiều không gian song song? Thật là khó nghĩ!
- Bồ đang đọc gì thế?
Đến mức độ này thì Anh Thanh bắt buộc phải ngẩng đầu lên để nhìn đối phương rồi. Vậy ra, đó là một đứa con trai. Cậu cũng chỉ trả lời cho phải phép lịch sử, trong khi trong đầu vẫn đang cố nhớ về cái chết của Zoe.
- Chỉ là truyện tranh mà thôi.
Zoe đã đuổi theo Hunter sau khi cậu ta nhìn thấy cô ta đâm chết con nhỏ mập kia. Con nhỏ đó tên gì nhỉ? Megan? Maggie?
- Nó nói về cái gì thế?
- Một ngôi trường kì quặc với một đám học sinh cũng kì quặc như thế…
Ngay trước khi Zoe kịp đâm Hunter, Irina cùng cái đám Truants xuất hiện. Irina bắn chết Zoe. Có chuyện gì khác xảy ra khi đó nhỉ?
- Là truyện tình cảm à?
- Sao cơ?! Đây là truyện viễn tưởng và bí ẩn!
Đúng rồi! Có thể Casey có liên quan đến chuyện này! Cô ta đã đi về quá khứ…
- Vậy con nhỏ tóc vàng kia sẽ cặp với thằng tóc nâu hay tóc đen? Là tình tay ba à?
- Không ai cả!
Chết tiệt! Nhưng Jade cũng có khả năng nói chuyện với bản thể tương lai của mình. Cô ta cũng có thể tác động đến chuyện này…
- Có nhân vật nào là gay trong truyện này không?
- Jun và Gui… Bồ đang nói nhảm cái gì thế?! Tui không thể tập trung đọc truyện được!
Vẻ mặt lúc này của Anh Thanh khiến Phục Lễ bật cười nắc nẻ. Cậu ta vén phần tóc mai bồng bềnh của mình lên, để lộ cái tai nghe sành điệu đang bịt kín lỗ tai của mình. Cậu ta tiếp tục chế giễu trong khi bước vượt lên.
- Thành công rồi! Nãy giờ tui có nghe bồ nói gì đâu!
Anh Thanh tức tối đến mức đóng ngay cuốn truyện lại và đuổi theo chất vấn cậu ta.
- Thế tại sao bồ lại hỏi tui lắm thế?
- Tui chỉ đang cố khiến bồ rời mắt khỏi cuốn truyện đó thôi.
- Trò đùa thật nhảm nhí!
Phục Lễ vẫn còn cười không ngớt khi nhìn lén nhìn gương mặt đang nổi cáu kia. Đó chính xác là thứ khiến cậu tò mò suốt từ lúc trên xe buýt đến giờ.
- Bồ có biết là tui đã để mắt đến bồ từ lúc chúng ta còn ở trên xe không?
Được rồi, Anh Thanh cảm thấy có chút kì quặc ở đây. Nếu đây là lời nói của một con bé nào đó thì chắc cậu sẽ hãnh diện lắm. Nhưng đối phương lại là một tên con trai cao hơn cậu đến nửa cái đầu. Câu nói này nghe chẳng còn tí mùi lãng mạn nào nữa cả.
Vờ như không để ý đến biểu cảm bối rối của cậu ta, Phục Lễ đeo tai nghe trở lại và bình thản bước tiếp, tiếp tục độc thoại mà chẳng cần ai góp lời vào.
- Tui rất thích nghe nhạc. Nhất là mỗi khi tui cần thoát ra khỏi cái thế giới này. Giống như chuyến xe chen chúc lúc nãy vậy. Khi tui đã quá mệt mỏi với mấy lời bàn tán chẳng đâu vào đâu của họ, tui chỉ cần vặn âm lượng lớn lên. Và rồi, giống như tôi đã được phóng lên vũ trụ vậy. Bọn họ chẳng thể nào với được đến tui nữa.
Anh Thanh cảm thấy bối rối. Dù gì hắn ta cũng đang huyên thuyên một mình mà chẳng cần người lắng nghe. Có lẽ cậu nên quay về với cuốn truyện của mình nhỉ? Cậu vừa định mở cuốn truyện ra thì tên kia lại lên tiếng, và lần này thì lại nhắc đến cậu. Thế là cậu phải dỏng tai lên mà nghe hắn đang nói cái gì.
- Nhưng bồ thì lại chẳng cần đến cái tai nghe này. Tui đã thấy. Từ thế giới riêng của tui, tui đã nhìn thấy thế giới riêng của bồ. Giữa những khuôn mặt nhăn nhó và những tiếng thở dài mệt mỏi đó, bồ vẫn ngồi bình thản như đang ở nhà mình vậy.
Cảm động thật đấy. Ai đó đang nói về một đứa mọt truyện với giọng điệu khâm phục kìa.
- Mà bồ có nghe thấy tiếng họ bàn tán về bồ lúc đó không? Tui cá là không. Cái lúc mà bà già ấy lên xe và đứng ngay bên cạnh ghế của bồ đấy? Họ cứ xầm xì suốt khi bồ không nhường ghế cho bà ta. Bồ không biết gì cả đúng không?
- Thật ra, tui có biết bà ta đang đứng đó. Thì sao nào? Một chỗ ngồi ư? Bà ta chỉ cần một chỗ ngồi là sẽ hạnh phúc cho đến lúc chết à?
Anh Thanh buột miệng trả lời, trong lòng thầm chắc rằng tên kia vẫn chẳng nghe thấy gì đâu. Có vẻ như hắn đã chán độc thoại rồi. Cậu cũng chẳng thích thú gì với chuyện đó. Anh Thanh giở cuốn truyện ra và tiếp tục câu chuyện còn đang dang dở của mình. Ít ra thì sau khi đến học ở đây, cậu cũng chẳng cần đi xe buýt mỗi ngày nữa.
Một kẻ chẳng nghe thấy gì, một kẻ chẳng nhìn thấy gì. Cả hai chẳng nói thêm lời nào nữa, cứ lặng lẽ bước từng bước về phía ngôi trường kia. Đó là nơi mà những thế giới riêng nhỏ bé của họ sẽ va chạm vào nhau, và vỡ nát.
XXX
Thiên Kiệt vừa đạp xe vừa tranh thủ nhìn ngắm khung cảnh xung quanh. Bầu trời trong xanh kia có phải là lời hứa hẹn cho một sự khởi đầu tuyệt vời hay không nhỉ? Cả con đường dẫn đến trường đang ngập tràn trong thứ ánh sáng trong vắt đó. Nó uốn lượn qua những khoảng rừng thưa sáng sủa, những con suối trong veo, mọi thứ về nó dễ dàng khiến cho mọi đứa trẻ đều quên mất lời của mẹ mình: “Đừng bao giờ đi vào rừng một mình!” Tại sao nhỉ? Khu rừng này không tăm tối, và cả con đường thì thênh thang rộng mở. Thiên Kiệt thích thú đạp hết sức mình, cảm nhận tiếng gió đang thổi qua hai bên tai mình. Bọn chim chóc đi đâu hết rồi nhỉ? Thiên Kiệt bỏ qua ngả rẽ vào trường, cậu muốn đạp thẳng lên đỉnh đồi để có thể nhìn ngắm toàn bộ khung cảnh. Hãy nhìn bao quát tất cả, hãy nhìn thật rõ ràng. Nơi này đang ẩn chứa điều gì? Cậu còng lưng đạp thật hăng say, làm thế thì bộ não của cậu sẽ càng cảm thấy rất hưng phấn. Và thế rồi, cậu đã đến nơi mình muốn đến. Từ trên cao, cả ngôi trường đều nằm dưới tầm mắt cậu. Như một mô hình triễn lãm tinh xảo, những khối nhà lớn nhỏ được sắp xếp hài hòa với những khoảng trống của sân trường và cây cối. Có cả một cái hồ nước ở phía sau trường. Và sau đó, là cả một khoảng rừng bạt ngàn. Hãy nhìn mà xem. Bên trái và bên phải, phía trước và đằng sau, ngôi trường này được bao bọc bởi vòng tay của rừng. Bọn học sinh ở đây cảm thấy thế nào về cuộc sống ở đây của chúng nhỉ? Một cuộc sống quá đỗi êm đềm và trống trải lắm chăng? Sự tĩnh lặng này liệu có thể làm những con quỷ bên trong ngủ quên mất? Hay chúng sẽ cảm thấy chán ngán với sự tẻ nhạt của nơi này? Ở đây chúng chẳng có gì ngoài những lời thì thầm thúc giục bên trong chúng. Như những tên tử tù phải sống trong một buồng giam từ ngày này sang ngày khác, chẳng thể làm gì ngoài việc nói chuyện với con quỷ bên trong mình. Đúng rồi, lũ quỷ đó sẽ chẳng bao giờ ngơi nghỉ cả. Hoàn hảo thật, nơi này đúng là một hiện trường hoàn hảo cho tội ác. Thiên Kiệt đưa mắt nhìn toàn bộ khung cảnh một lần cuối… Một đám mây đen đang dần hiện ra từ phía chân trời xa xăm. Mọi ấn tượng ban đầu của cậu về nơi này đều chợt thay đổi. Ngôi trường này thú vị đấy chứ.
Thiên Kiệt lại càng cảm thấy thêm hào hứng với chuyến tham quan này. Nhận ra việc mình có thể sẽ đến muộn, cậu ta bèn nhấn bàn đạp và thả mình lao xuống dốc. Việc này tất nhiên là ít tốn sức hơn lên dốc, nhưng nó lại khó kiểm soát hơn nhiều. Và nó còn đòi hỏi cả một tinh thần thép nữa. Thiên Kiệt rống lên to hết mức có thể. Ban đầu thì đó là tiếng cười, sau đó thì là tiếng la hét phấn khích. Nhưng đến cuối con dốc thì nó có một phần là tiếng hét kinh hoàng nữa. Nhưng dù cho la hét là thế, khóe miệng cậu ta vẫn nhếch lên một nét khinh bạc. Khi cậu lao đến cổng trường, chiếc xe đã gần như hoàn toàn mất kiểm soát. Thiên Kiệt thoáng giật mình khi nhận ra một bóng người đang dần hiện ra mỗi lúc một gần hơn. Cậu biết mình không thể nào dừng chiếc xe được nữa rồi… Thiên Kiệt nhắm mắt lại, và cậu mỉm cười, không rõ vì lí do gì. Tất cả những gì cậu có thể cảm nhận lúc này là tốc độ. Chiếc xe của cậu lao đi trong gió trong lúc cậu tận hưởng cảm giác sảng khoái này. Cậu không biết trước chuyện này sẽ kết thúc thế nào, nhưng chí ít khoảnh khắc này ngắn ngủi lắm, hãy thoải mái đi nào. Khi cậu mở mắt ra, Thiên Kiệt nhận ra mình đã băng qua cổng, một cách lành lặn. Sau mấy tiếng hú hét, cậu ngoái đầu lại và hét vọng lại phía sau:
- Xin lỗi nhé, anh bạn!
Cái xe chết tiệt kia đã chạy mất, bỏ lại một đám bụi mù phía sau, cùng một con ả đang há hốc vì bất ngờ và tức giận. Kim Vy chẳng kịp chửi cái tên khốn nạn kia được chữ nào thì hắn đã chạy mất. Cô tự nhìn lại bản thân mình một chút. Tóc thì hớt cực ngắn cho mát, quần áo thì rộng thùng thình để che dấu mấy vết xăm trổ khắp người… Ừ thì, hắn muốn gọi cô thế nào thì gọi. Chẳng hơi đâu mà bắt bẻ này nọ. Sau mấy giây cố gắng đè nén cục tức của mình xuống, Kim Vy tiếp tục cuộc gọi của mình.
- Không có gì đâu, chỉ có một thằng điên nào đó vừa lái xe bạt mạng suýt chút là tông vào con thôi.
Giọng điệu tỉnh bơ của cô tất nhiên là không ngăn được sự lo lắng của người bên kia đầu dây. Cô vừa ngáp vừa lắc đầu trong khi mồm thì ậm ừ vâng dạ. Bất chợt, cô ta thay đổi thái độ khi chủ đề cuộc gọi lại thay đổi theo hướng cũ.
- Mẹ, chúng ta sẽ không bàn thêm nữa! Con đã quyết rồi. Con phải tìm cho ra nguyên nhân thực sự! Nếu đúng là do cô ta, ít nhất con cũng phải tìm cho ra nơi ở hiện tại của ả!
Thật buồn cười là mẹ cô lại còn kinh ngạc mà hỏi: “Con tìm cô ta làm gì?” Làm gì ư? Chúng ta sẽ làm gì với kẻ đã gây ra cái chết cho anh mình nào? Ôi trời ơi, bà ta lại bắt đầu rồi. Cái điệp khúc hòa âm giữa mấy tiếng thút thít hổn hển và mấy lời than vãn lo lắng.
- Mẹ, con cúp máy đây. Chắc họ đã bắt đầu buổi họp mặt rồi. Con không thể cứ nói chuyện với mẹ suốt thế này được!
Có chuyện quái gì với bà ta thế không biết? Ồ, cô biết rồi. Cô nghĩ là mình đã hiểu.
- Mẹ, bây giờ con là đứa con duy nhất còn lại của mẹ. Nhưng điều đó không có nghĩa là mẹ phải cố tỏ ra lo lắng thái quá để bù đắp cho con! Anh con chết, và bây giờ mẹ nhớ ra mình còn có một đứa con khác à? Sao mẹ không thử bàn với bố sinh thêm một đứa nữa hay gì đó?
Ôi cám ơn trời đất, bà ta cúp máy rồi. Hãy tranh thủ lúc bà ta còn đang bận trải qua thời gian tự chất vấn lương tâm nào. Kim Vy vội vã bước vào sân trường. Đó là một cái sân to lớn, và trống trải đến mức đơn điệu. Thứ duy nhất trơ trọi ở giữa sân là một bức tượng xấu xí với hình thù của một đôi bàn tay đang giơ ra để hứng trọn lấy một thứ gì đó. Cô chẳng có mấy hứng thú nghệ thuật để quan sát nó kỹ hơn. Khi bước vội vào hành lang trường, thứ đầu tiên đập vào mắt cô là ba con nhỏ đỏm dáng đang đứng sẵn ở lối vào. Chúng có vẻ là ban dàn chào hay gì đó. Nhìn mấy cái nụ cười kia là đầu cô đã nhanh chóng chuyển sang chế độ phòng ngự. Cô có lạ gì mấy con nhỏ thuộc thể loại này chứ. Dòng cảnh báo “khốn nạn” đang hiện rõ trên đầu chúng kia kìa.
Con nhỏ đứng giữa, luôn luôn sẽ là đứa cầm đầu, luôn luôn là đứa mìm cười trước, luôn luôn là đứa chào đón đon đả nhất.
- Cuối cùng bồ cũng đến rồi. Tui là Khiết Đường. Hân hạnh được là người đầu tiên gửi lời chào mừng bồ đã đến gia nhập cùng bọn tui.
Nội dung lời nói và sự biểu đạt bằng ánh mắt của ả đang mâu thuẫn với nhau. Kim Vy biết rằng ả đang cố gắng kiềm chế bản thân lắm để không phun ra mấy lời chanh chua đanh đá. Bằng chứng là ngay sau cái câu chào mời được trích dẫn để học thuộc kia, ả chẳng nói thêm được câu nào cả. Khiết Đường cứ đứng im một chỗ và cười trừ, thậm chí cả hai con ả tay sai đứng hai bên cũng chả có phản ứng gì hơn thế. Chết tiệt, ba con khốn này đang muốn thử thách lòng kiên nhẫn của cô à?
Khiết Đường đánh giá hết một lượt từ đầu đến chân của con ả mới đến. Cô ta nhẹ nhàng bỉu môi… rất nhanh nhưng vẫn đủ lâu để Kim Vy có thể nhìn thấy. Nhanh chóng lấy lại nụ cười hòa nhã trên môi, nhưng ánh mắt cô ta thì lại chứa đầy sự khiêu khích.
Con ả bên trái Khiết Đường, người mang một bộ mặt đau đớn như thể ai đó ép buộc cô ta phải làm một con khốn vậy. “Tôi không phải người xấu. Tôi không cố ý làm bồ đau. Chỉ là tự nhiên cái tay tôi lại vung lên và tát vào mặt bồ mà thôi.” Cô ta nghĩ chỉ cần trưng ra cái ánh mắt thông cảm đầy ái ngại như thế thì có thể cứu vớt được chút thiện cảm nào sao?
- Tui là Vĩnh Lộc. Bồ đến hơi muộn đấy. Mọi học sinh mới đều đã vào trong rồi. Chúng ta nên mau chóng đưa bồ vào để mọi người có thể bắt đầu việc phổ biến.
- Tui là người cuối rồi sao? Nãy giờ tui đứng ngoài cổng mà có thấy bao nhiêu đứa vào trong đâu.
- Đợt này chúng ta chỉ mới nhận thêm sáu học sinh mới mà thôi. Tui không chắc về việc tuyển sinh của trường này. Nhưng việc tuyển chọn rất thất thường, và các học sinh được chọn mỗi đợt đều rất ít…
- …Và đôi khi lại lòi ra một đứa rất kì quặc.
Con ả thứ ba đã lên tiếng. Mấy lời nói của ả chẳng thế khiến Kim Vy sốc bằng cái hơi thở nồng nặc mùi cồn kia.
- Cô ta đang say à? Thật ư?
Bây giờ thì Kim Vy đã nhận ra đôi mắt lờ đờ của cô ả. Bằng cái giọng nghe như nghẹt mũi, Diễm Hằng vừa cười vừa nói với đôi má càng lúc càng ửng hồng.
- Bây giờ là mùa hè! Bồ nghĩ bọn tui vui vẻ lê cái mông lên cái trường này để đón tiếp mấy cái mặt ngu ngốc như của bồ à? Dĩ nhiên là tui phải tiệc tùng một chút để không lãng phí mùa hè này chứ!
Vĩnh Lộc ho khan mấy tiếng. Cô ấy chỉ muốn nhanh chóng dẫn cô nàng học sinh mới này đến phòng tập trung, và kết thúc cái nhiệm vụ dở hơi này. Cô ấy vội ngắt ngang lời của Diễm Hằng.
- Ý cô ấy là bây giờ chỉ mới là đầu hè thôi. Trong ba tháng tới, thế nào họ cũng sẽ kiếm đủ số học sinh để lấp đầy cái phòng học của bồ thôi.
Khiết Đường cũng chả có phản ứng gì đặc biệt, chỉ hờ hững quay lưng đi, sau khi ném lại mấy từ.
- Bộ bồ muốn có nhiều người ở đây để kết bạn à?
Kim Vy nghe thấy tiếng hừ khẽ trong lời nói của ả. Có vẻ như ả và cô đều có cùng một quan điểm chung: bạn bè là thứ bỏ đi. Cô im lặng đi theo sau ba con ả đó, lòng dạ quá chán ngán để có thể trầm trồ khen ngợi mấy cái khu nhà hoành tráng trong trường. Nơi này đúng là hào nhoáng thật đấy, Kim Vy thầm so sánh nó với ngôi trường cũ của mình. Nhưng khi cô nhìn về phía trước, cô lại có suy nghĩ: thật giống y như bọn học sinh ở đây. Bề ngoài là thế, nhưng ai biết thứ ẩn giấu bên trong là gì chứ? Mái tóc bồng bềnh được cuốn nếp rất tỉ mỉ của Diễm Hằng đang phất phơ trước mặt cô. Nó khiến cô không thể nào không nêu lên câu hỏi:
- Làm thế nào bồ có thể giữ được một cái đầu như thế trong khi đã say bét nhè hả?
- Đôi khi tui còn không biết mình bỏ tiền mua bia nhiều hơn hay là mua keo xịt tóc nhiều hơn nữa mà.
Khiết Đường ra hiệu cho mọi người giữ im lặng. Họ đã đến nơi rồi, Vĩnh Lộc thở phào nhẹ nhõm.
- Các học sinh mới, hãy làm quen với các bạn cùng lớp của mình đi nào!
Sáu cặp mắt đang đảo quanh phòng, cố gắng bắt cho được ấn tượng đầu tiên về mỗi con người mới mẻ họ vừa gặp mặt.
Có lẽ Kim Vy là người đầu tiên hết kiên nhẫn với việc săm soi người khác như vậy. Đối với cô, bọn họ chẳng có gì thú vị cả. Mà dù họ có thú vị đi chăng nữa thì cô chẳng quan tâm. Cô không đến đây để làm quen và kết bạn. Kim Vy chọn cho mình chiếc ghế ngoài rìa và im lặng ngồi xuống.
Trong khi đó, Uyên Thư không giấu nổi sự ấn tượng của mình dành cho người vừa mới vào phòng. Cô ấy quay sang Vân Yên và khe khẽ bình phẩm.
- Cô ấy trông ngầu thật!
Đáp lại, Vân Yên chỉ cười trừ lấy lệ. Cô chẳng đánh giá cao Kim Vy lắm. Cái cách cô ả kéo ghế và ngồi thu lại một góc như thế, điều đó chỉ khiến cô có cảm giác ả chỉ là một con hổ giấy mà thôi. Cái đầu đinh và mấy hình xăm vằn vệt trên tay ả càng trở nên kệch cỡm hơn bao giờ hết, chỉ là mấy nét vẽ vằn vện trên giấy chứ chả có chút khí chất gì cả. Mặt khác, điều khiến cô băn khoăn là việc một đứa có bề ngoài như cô ả lại có thể được mời đến đây. Ngôi trường này chọn lựa học sinh theo tiêu chuẩn gì nhỉ? Vân Yên nhìn về phía mấy tên con trai… Câu hỏi kia lại càng xoáy sâu hơn trong đầu cô.
Ánh nhìn đăm chiêu của Vân Yên lọt vào tầm quan sát của Thiên Kiệt. Nơi này thú vị thật đấy. Thiên Kiệt cứ mỉm cười suốt vì thích thú. Cậu như đang sảng khoái tận hưởng một vở kịch mà chính bản thân mình đang đứng trên sâu khấu. Mỗi một kẻ ở đây là một nhân vật độc đáo trong vở kịch này. Vấn đề duy nhất ở đây là chẳng ai biết kịch bản hay thậm chí là thể loại của vở kịch này. Hài kịch hay bi kịch? Ai là vai chính? Ai sẽ là kẻ cuối cùng trụ được đến hồi kết? Quá nhiều thắc mắc, quá nhiều sự thú vị.
Anh Thanh cũng chăm chú nhìn ngó rất lâu. Khung cảnh này giống y như cảnh gặp gỡ lần đầu của nhóm Glories vậy… Có khi nào đó là một vòng lặp không nhỉ? Đại loại như bọn họ đã bị tẩy não và cứ liên tục đến trường như thể hôm đó là ngày đầu tiên nhập học của mình? Đầu óc Anh Thanh lại bắt đầu lơ mơ về những giả thuyết của mình…
Trong khi đó, Phục Lễ đã chán nhìn mấy cô cậu này. Cậu quay đầu về phía người đang đứng trên bục diễn thuyết. Mồm cô ta lại sắp mở ra rồi kìa! Phục Lễ vội chụp lấy cái máy nghe nhạc của mình và vặn âm lượng lên hết cỡ. Thế là xong.
- Vậy là mọi người đã có mặt đông đủ. Một lần nữa, thay mặt ban đại diện học sinh của ngôi trường này, mình rất vui mừng và cảm kích vì sự góp mặt hôm nay của các bạn. Xin tự giới thiệu, mình là Hoàng Hạnh, người sẽ chịu trách nhiệm chính cho chuyến tham quan tìm hiểu ngày hôm nay.
- Chị nên nói trước để bọn họ đừng hiểu lầm chứ!
Từ phía sau căn phòng, Khiết Đường bỗng nói vang lên, kèm theo một giọng cười cợt nhã. Hoàng Hạnh nhíu mày, dự cảm cho cô biết điều mà ả ta sắp nói tiếp theo bảo đảm chẳng phải là lời tốt đẹp gì. Và hóa ra là cô đoán đúng thật.
- Chị ấy chỉ là một học sinh như chúng ta thôi, không phải là giáo viên đâu! Mặc dù vẻ bề ngoài của chị ta thì…
Cô ả lại cười khúc khích một cách ngây thơ. Bọn học sinh mới thì ngơ ngác nhìn lên bục và lập tức hiểu ra lời châm chích của cô ả. Mặc dù bọn chúng còn biết giữ ý tứ mà không cười lớn tiếng, nhưng cái vẻ mặt cố kiềm nén của chúng càng khiến Hoàng Hạnh thêm nóng mặt. Diễm Hằng bỗng nhiên bật cười, và điều đó giống như một phát súng khai hỏa, trong mấy giây ngắn ngủi, bọn học sinh mới cũng phun ra mấy tiếng cười. Hoàng Hạnh nhanh chóng lấy lại nhịp thở của mình. Cô tỏ ra bình thản như chẳng hề nghe thấy gì. Vẻ mặt lạnh lùng của cô ngay lập tức có hiệu quả, khiến cho căn phòng lặp lại sự im lặng cần thiết. Hoàng Hạnh hướng tay về phía Khiết Đường đang đứng ở cuối phòng, thân ái tuyên bố với bọn học sinh mới:
- Người mà các bạn đã làm quen vài phút trước, Khiết Đường, cô ấy cũng là một thành viên của ban đại diện học sinh. Nhưng cô ấy chỉ vừa mới tham gia hội đồng vào học kì vừa qua mà thôi, vẫn còn mới lắm, chưa quen với nề nếp của hội đồng đâu.
Khiết Đường vẫn giữ nguyên đường môi cong cớn của mình khi nghe những lời nói của Hoàng Hạnh. Cứ mặc kệ chị ta, cái ả gái già đó! Hoàng Hạnh cũng không thèm đếm xỉa đến đối phương nữa. Cô ta quay ánh mắt về phía các học sinh mới và tiếp tục nói:
- Trước khi chúng ta bắt đầu chuyến tham quan ngày hôm nay, mình xin vài phút được giới thiệu sơ lược về lịch sử thành lập ngôi trường, cũng như phương châm về cách thức giáo dục của nơi này.
Ai quan tâm chứ? Khiết Đường đang ngáp ngắn ngáp dài, và cô ta cố tình để Hoàng Hạnh nhìn thấy. Đúng như điều cô ta mong muốn, Hoàng Hạnh lại bị phân tâm khỏi bài nói. Chị ta lại phải quay về phía cô ả và lên tiếng:
- Ngoài lề một chút, sao Khiết Đường và nhóm bạn của mình không ra ngoài kiểm tra xem việc chuẩn bị cho buổi đón tiếp các học sinh mới đã hoàn hảo chưa?
Khiết Đường nghe thấy nhưng chẳng thèm buồn động đậy cái chân nào. Cô ta thản nhiên đáp lời:
- Mọi việc đều ổn. Mấy người khác sẽ chăm lo ổn thỏa thôi. Em chỉ muốn ở đây và quan sát chị thôi.
- Để làm gì?
- Ai mà biết được. Sau khi chị rời khỏi trường, ý em là khi chị tốt nghiệp, có thể em sẽ là người thay thế chị và đứng ở chỗ đó hướng dẫn cho các học sinh mới. Em chỉ muốn ở đây để học hỏi chị mà thôi.
Hoàng Hạnh chẳng thèm nói gì nữa. Chị ta bực bội trong lòng, nhưng vẫn phải cố giữ cho bài nói chuyện của mình thật trơn tru. Nỗ lực của chị ta không làm cho bầu không khí trong phòng dễ thở hơn chút nào. Vĩnh Lộc căm ghét sự bức bối này. Cô quay sang Diễm Hằng thì nhận ra cô nàng đã ngồi yên vị trên một cái ghế từ lúc nào. Với lon bia trong tay, cô nàng thỉnh thoảng lại tu một hớp, trong khi mắt thì lờ đờ nhìn về phía màn hình chiếu. Cô ta đang cười quái gì với mấy cái thứ trên đó chứ? Vĩnh Lộc hết chịu nổi mấy ả khốn này rồi! Cô rón rén bước ra khỏi phòng, tiến về phía lan can và đứng dựa vào đó. Cô ấy thẫn thờ nhìn những bóng cây đang đung đưa trong sân, trong lòng thì tự hỏi phải làm cách nào để có thể thoát ra khỏi cái nơi quái quỷ này. Một cú nhảy từ đây xuống liệu có giải quyết được vấn đề không nhỉ? Trong lúc đầu óc cô còn đang lửng lơ, bỗng nhiên cô cảm thấy hai chân mình đã rời khỏi mặt đất. Một đôi tay khỏe mạnh đang ôm chặt lấy eo cô từ phía sau. Cô thấy hai chân mình chấp chới, toàn thân mất đà như thể sẽ rơi xuống bất kì lúc nào. Trong đầu cô chợt lóe lên câu trả lời mà nãy giờ mình đang tìm kiếm: “Không! Rơi xuống đó không phải là cách giải quyết đâu!” Cô hét lên một tiếng thất thanh. Điều đầu tiên mà cô nhận ra sau khi hoàn hồn lại là tiếng cười của Tuấn Anh.
- Anh dọa em sợ đến chết mất!
- Nghe tiếng em hét là anh biết rồi.
Vĩnh Lộc vờ tát vào má của anh ta một cái. Cô không thấy bất ngờ vì sự có mặt của anh ta, nhưng cô vẫn phải giả vờ hỏi:
- Sao anh đến đây sớm thế? Em đã nói anh đến đón vào cuối ngày cơ mà.
Cô chỉ muốn nghe mấy lời nói sáo rỗng dễ thương này của anh ta mà thôi.
- Làm sao anh có thể chờ nổi đến lúc đó chứ? Anh chỉ muốn gặp em càng sớm càng tốt.
Nhưng Tuấn Anh không phải là một anh chàng dễ thương đơn thuần. Sau nụ cười lấp lánh đó, ánh mắt cậu ta bắt đầu tối đi. Cậu ta nhìn về phía hội trường với một sự lạnh lùng đáng sợ. Cậu chẳng bao giờ ưa thích mấy cái trò vớ vẩn của hội học sinh. Cậu ta bắt đầu thay đổi giọng điệu khi tiếp tục câu chuyện với Vĩnh Lộc.
- Sao em không bỏ quách cái hoạt động vớ vẩn này và cùng anh tận hưởng mấy ngày đầu hè này ở một nơi khác chứ? Ở cái trường này có gì cho em lưu luyến đâu nào! Em biết không? Anh nhìn quanh cái nơi buồn tẻ này. Và anh nhận ra em là điều duy nhất đang giữ anh ở lại nơi này đấy.
Vĩnh Lộc thở dài.
- Em ghét nơi này. Nhưng đây không phải là chuyện em thích hay không. Em cảm thấy mình có trách nhiệm…
- Với cô ta? Em có mắc nợ gì cô ta đâu! Bộ bọn em cắt máu và lập lời thề chị em hay gì đó à? Thực tế là Khiết Đường đã chẳng còn xem em là bạn từ lâu rồi.
Cô ấy biết điều đó chứ. Nhưng cô có thể làm gì nào? Khiết Đường đã thay đổi, nhưng cô ta đâu có biến mất một cách bất thình lình. Mỗi ngày, cô vẫn cứ nhìn thấy gương mặt của cô ta đang tươi cười cùng mình. Cô có thể ngừng trả lời cô ta sao?
- Cô ta tự cho mình là một nữ hoàng mới nổi của ngôi trường. Cô ta bắt nạt mọi người yếu thế, gây bất hòa trong hội đồng đại diện học sinh. Cô ta thậm chí còn sẵn sàng cặp kè với người khác chỉ để kéo bè cánh…
Có những khoảnh khắc, Vĩnh Lộc chỉ muốn lao vào và bẻ gãy cổ ả ta, nhưng cô chẳng bao giờ giữ được cái ý nghĩ đó đủ lâu cả.
- Nói đến chuyện phe phái, thậm chí cô ta còn muốn ghép đôi em với cái gã đó! Lí lẽ của cô ta là gì chứ? Cái gã đó có là bạn thân của bạn trai cô ta thì sao nào? Cô ta chỉ muốn lôi kéo sự ủng hộ của mấy gã đó mà thôi!
Cô cảm nhận được sự lợi dụng, sự phản bội và sự dối trá của Khiết Đường, nhưng trong sâu thẳm tim cô, cô luôn dành một chút tình cảm nhỏ bé dành cho cô ả. Khiết Đường là bạn của cô. Dù cho là “đã từng” thì thứ tình cảm đó cũng không dễ dàng vứt đi được. Nếu cô làm thế, cô sợ mình cũng sẽ đánh rớt nốt chút tốt đẹp còn sót lại của mình. Cô không muốn là một con khốn toàn diện như bọn họ.
- Anh bình tĩnh đi nào. Đó chỉ là mấy trò ghép đôi vớ vẩn thôi mà. Em đã nói với cô ta rằng em chẳng có hứng thú gì với hắn ta cả!
- Nhưng cái gã béo đó thì rất hứng thú với em đấy! Và cô bạn thân của em thì đang cố chia rẽ chúng ta kể từ ngày đầu tiên.
- Cô ta chẳng cần phải vất vả thế. Em với anh cứ cãi nhau suốt thôi!
Sau khi nói xong, Vĩnh Lộc quay lưng bỏ đi. Đó là cái mánh của cô để kết thúc mọi vấn đề. Bỏ chạy. Tuấn Anh sẽ buộc phải đuổi theo, anh ta sẽ chẳng dám nói điều gì làm cô phật lòng. Anh ta sẽ dỗ dành cô, nói lảng sang chuyện khác. Và thế là vấn đề của họ sẽ tạm biến đi trong một chốc. Nó sẽ ẩn nấp ở đâu đó và chờ một cơ hội khác để quay trở lại. Hi vọng là nó sẽ chẳng bao giờ đánh úp được họ.
XXX
- Và đó là ý nghĩa cái tên của ngôi trường này!
Hoàng Hạnh kết thúc bài diễn thuyết của mình với một nụ cười rất đỗi tự hào. Dường như ánh đèn trong phòng này quá nóng. Những giọt mồ hôi đang lăn dài trên má cô, nụ cười của cô dường như có chút gượng gạo. Hình như cô đã nhìn thấy những cái nhíu mày của bọn học sinh mới. Uyên Thư ngơ ngác quay sang hỏi thầm Vân Yên:
- Thế rốt cuộc tên của cái trường này là gì thế?
Đứng từ phía sau, Khiết Đường vẫn có thể nhìn thấy sự lúng túng của chị ta. Cô ta chẳng phải là loại người thích giải vây cho người khác, trái lại, cô ta chỉ thích việc đổ thêm dầu vào lửa.
- Đừng có tạo cơ hội cho chị ta giảng lại bài đó một lần nữa chứ cô em!
Một lần nữa, Diễm Hằng lại là kẻ khơi mào cho mấy tiếng cười khúc khích trong phòng. Trong khi Hoàng Hạnh vẫn còn đang im lặng vì tức giận, Khiết Đường điềm nhiên tiến lên phía trước và bắt đầu trò chuyện cùng bọn học sinh mới. Từ giọng nói và điệu bộ của cô ta đều toát lên một sự kịch tính rất cuốn hút.
- Mọi người hãy cám ơn chị ta vì những lời chia sẻ nhàm chán và vô giá trị đó đi nào. Nhưng các bồ biết không? Ngôi trường này không chỉ nổi tiếng vì cái bề dày lịch sử hay là thành tích nổi trội đâu. Có ai trong các bồ từng nghe về câu chuyện “đó” chưa?
Đôi mắt của Thiên Kiệt bất chợt sáng lên. Trong khi Kim Vy thì cảm thấy tim mình như ngưng đập. Đó chẳng phải là lí do họ có mặt ở đây sao? Thiên Kiệt rít lên trong phấn khích:
- Là vụ án đó sao? Vụ trả thù của cô nữ sinh đó?
Vân Yên nhăn nhó nhìn cậu ta. Loại người gì mà lại phấn khích vì những vụ việc đẫm máu như thế chứ? Cô hoang mang hỏi lại:
- Nhưng chẳng phải đó chỉ là lời đồn thôi sao? Kết luận cuối cùng mà họ nói với công chúng là tất cả chỉ là một loạt tai nạn và trò đùa mà thôi!
Thiên Kiệt nén tiếng cười lại trong cổ họng khi hỏi ngược lại cô ta.
- Bồ thực sự tin mấy cái bài phát biểu đó sao?
Dĩ nhiên cô không phải là con ngốc. Vân Yên tức tối quay sang tìm kiếm sự hỗ trợ từ Uyên Thư. Nhưng Uyên Thư chẳng phản ứng gì cả. Gương mặt cô ta đang dần tái đi. Có lẽ cô đang sợ hãi vì mấy cái chuyện kinh dị này, hay cũng có thể là cái bụng đói cồn cào đang hành hạ cô ấy.
- Mọi người đang nói về chuyện gì thế? Một bộ phim?
Thỉnh thoảng, Anh Thanh mới chịu xa rời cuốn truyện mà quay về với thế giới thực. Và lần nào cậu ta cũng ngơ ngác y như thế.
Phục Lễ đã vặn nhỏ âm lượng xuống từ lúc cuộc trò chuyện bắt đầu thay đổi. Cậu ta chẳng muốn nói gì về vụ án đó cả. Nhưng quá im lặng như cái cô nàng đầu đinh kia thì cũng thật đáng ngờ, thế nên cậu ta nói bừa vài lời châm chọc cậu bạn mọt truyện.
- Tui cá là bồ thậm chí còn chẳng biết gì về các vụ việc đó. Chúng hấp dẫn chẳng kém gì mấy thứ bồ đang đọc đâu.
- Thế rốt cuộc mọi người đang nói về chuyện gì thế?
Khiết Đường giơ tay lên ra hiệu cho mọi người giữ im lặng. Bất chấp vẻ mặt khó chịu của Hoàng Hạnh, cô ta bước lên bục diễn thuyết và đẩy chị ta sang một bên.
- Bản thân tui đã có mặt trong câu chuyện đó, như là một nhân vật chính vậy. Tui đã tận mắt chứng kiến cảnh tượng cô ta bước ra khỏi bóng tối và thú nhận toàn bộ kế hoạch quỷ quyệt của mình. Cô ta đã lợi dụng bạn bè, cô ta đã trả đũa những kẻ thù, cô ta đã trừng phạt gã con trai dám lừa gạt mình! Và cuối cùng, khi vở kịch đã hạ màn, cô ta đã gieo mình từ trên lan can xuống…
Khiết Đường ngừng lại một chút. Cô ta đang vờ như hồi tưởng lại cảnh ấy. Cô ta có nên nhắm mặt lại để thêm phần kịch không nhỉ?
- Tui đã có mặt ngay lúc đó. Tui đã nhìn thấy cô ta nằm trên sàn nhà. Ngập chìm trong vũng máu của chính mình, và cả những viên kẹo đủ màu nữa…
- Tại sao lại có kẹo ở đó nhỉ?
Trong lúc Anh Thanh còn đang lảm nhảm thắc mắc thì bỗng nhiên đèn phụt tắt. Uyên Thư vô thức nhảy khỏi chỗ ngồi mà bám vào người Vân Yên. Cô ấy cứ thầm thì qua hơi thở, những điều đại loại như là sự hối hận. Vân Yên bị bất ngờ nên cũng chẳng suy nghĩ được gì, cô ấy cứ ngồi ngây người ra và trông chờ vào phản ứng của những người khác. Ở một chiếc ghế khác, Kim Vy vội co hai chân của mình lên khỏi mặt đất. Cô ngồi bó gối lại, cố co rút cả thân mình lại càng bé càng tốt. Thiên Kiệt là người có phản ứng nhanh nhạy nhất trong bọn họ. Cậu ta rời khỏi ghế và thận trọng bước từng bước ngắn trong bóng tối. Các giác quan của cậu đều đang cố gắng hoạt động hết công suất. Nhưng bỗng nhiên chân cậu chợt giẫm phải một thứ gì đó. Nó là một vật gì đó rất bé, có vẻ trơn trượt. Bất chấp rủi ro có thể là gì, Thiên Kiệt vẫn hiếu kỳ nhấn mạnh chân lên vật đó. Dưới sức nén như thế, vật đó nhanh chóng vỡ tan tành, tạo ra những tiếng răng rắc như thủy tinh bị nghiền. Ngoài ra thì sau đó chẳng có chuyện gì xảy ra nữa cả. Thiên Kiệt cứ nghĩ là sẽ có một vụ nổ hay một vụ rò rỉ chất độc chứ. Thứ cậu giẫm phải là gì thế nhỉ?
- Mọi người ở yên chỗ của mình! Tôi sẽ đi kiểm tra…
Bất chấp lời cảnh báo muộn màng của Hoàng Hạnh, Thiên Kiệt vẫn cúi người xuống và xem xét thứ ở dưới gót giày của mình. Mấy ngón tay của cậu cảm nhận thấy sự nhớp nháp và dinh dính. Thiên Kiệt hồi hộp đưa ngón tay lên trước mũi mình… Có một mùi thơm nhẹ thoảng qua mũi cậu. Đến lúc này, đèn bỗng sáng trở lại. Thiên Kiệt giật mình khi thấy mấy đầu ngón tay mình đều nhuộm trong một màu đỏ thẫm. Nhưng sự chú ý của cậu và mọi người đều nhanh chóng chuyển hướng sang một thứ vừa mới xuất hiện trong căn phòng.
- Đó là một cái xác sao?',
	2
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Ánh Sao Đẫm Máu',
	0,
	N'Có ai đã từng nghĩ những thứ đẹp đẽ, trong sáng như Mặt Trăng hay Ngôi Sao lại nhuốm đầy máu người dưới đêm khuya tĩnh lặng?!\nCó ai đã từng ngồi ngẩn ngơ mơ về một ngày mai tươi sáng, triển vọng của bản thân, ước mơ cao cả trong tương lai? Nếu có thì xin hãy cẩn thận, ước mơ như một nguồn suối ngon lành, ngọt ngất, có thể độc chết bạn đấy!\nCâu chuyện không quá rùng rợn, ma mị nhưng sẽ cố gắng hấp dẫn các độc giả vào thế giới của những điều kỳ bí!\nPhần 1 cũng như là quyển đầu sẽ theo chân các cảnh sát trong Tổ trọng án cao cấp lật tìm ra những bí ẩn khiến cả thế giới phải nghi hoặc, thượng cấp phải đóng hồ sơ lại! Từ những chuyện bình thường như giải cứu con tin lại vô tình phát hiện ra một chuyện kì lạ để từ đó rơi vào một thế giới mà bản thân chưa từng biết đến!\nTại sao những thứ tưởng chừng như giản đơn kia lại mang trong mình bí mật to lớn đến thế?\nCó lẽ Ma, Người và Thần Tiên đâu dễ dàng gì phân biệt?\nMa trong tim, thân là người, miệng lưỡi phun hoa sen!\n*Toàn bộ câu chuyện đều là hư cấu* Nguồn: Vnkings.com\n\nLịch đăng: 1, 2 tuần/chương\nNgoan (tác giả) muốn đem đến cho các bạn độc giả của mình những tác phẩm hay, giải trí nhưng hơn hết là vẽ nên một bức tranh toàn cảnh luôn canh cánh trong lòng Ngoan. Ngoan rất thích Stephen King và mong có thể trở thành một nhà văn như ông.\nXin lỗi vì sự chậm trễ của Ngoan nhưng mong mọi người thông cảm và luôn ủng hộ Ngoan hết mình nhé! Các bạn độc giả có thể gọi Ngoan là Tiểu L nha (bản thân thích tên này lắm, thấy cute cute sao ấy). Yêu mọi người!',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/newdesign_1_original_1.jpg?itok=nASOMEf9',
	N'*Tất cả nội dung đều là hư cấu*

Ánh trăng trên cao chiếu lồng lộn xuống con đường phố thanh vắng, tĩnh lặng. Một góc được chiếu sáng còn một góc thì không nhưng nơi được ánh sáng khoanh vùng kia có thật là "sáng", những nơi chìm ngập trong bóng tối thăm thẳm kia là "tối"? Cây đèn đường chập chờn ánh điện, chớp tắt không ngừng. Nơi đây là khu phố đã xuống cấp trầm trọng, Chính phủ hiện tại tất có chu cấp để cải thiện tình hình dân cư nhưng có một số nơi bản nguyên nó đã thế thì dù có sửa như thế nào thì cũng không thay đổi được. Nếu có cũng chỉ là vỏ ngoài, còn bản chất thì thật rất khó, có câu "giang sơn dễ đổi, bản tính khó dời" là thế.

Trên con đường phố vắng lặng đó, ngoài đèn đường chập chờn muốn tắt, chỗ sáng chỗ tối như bảng cờ caro, thì cũng chính cái âm thanh "cộc, cộc" kia làm cho nơi đây thêm phần kinh dị. Nhà cửa xung quanh không bóng đèn thức giấc, nhân ảnh ai đó đang đi trên con đường phố phát ra những tiếng gõ lên mặt đất tựa như cây gậy chống của những ông bà già thường hay chống đi trên con đường này vào ban sáng. Nhưng "cộc, cộc" đang phát kia như mang một âm hưởng kì quái, nó léo lắt, vang xa nhưng cũng lại có chút cụt ngủn và thật là xa lạ. Một bốt công an ngay đầu phố kia có lẽ là bóng đèn thức giấc duy nhất nơi đây!

Nơi đây chất lượng cuộc sống của mỗi người không gọi là quá tệ nhưng chắc chắn một điều là vô cùng an ninh. Không ai dám nói chắc nơi đây mãi luôn an toàn không một tên bại hoại nào ghé thăm nhưng Anh Quang hắn lại dám nói phải, nơi đây rất nâng cao về mặt an ninh và rất an toàn.

Hắn tên là Trần Anh Quang, sinh năm 1974, nhà thuở nhỏ nghèo không có tiền để hắn ăn, ngủ chứ đừng nói đến đi học. Nhưng dù sao thời bấy giờ Chính phủ kêu gào xóa nạn mù chữ tại mọi gia đình nên thành ra hắn lại được vinh dự được đi học, tiếp xúc vào môi trường mới, những điều kì diệu. Thế mà cho dù hắn cố gắng vô cùng thì cánh cửa đại học cũng không chào đón hắn tiến vào, loại bỏ yếu tố gia đình không đủ điều kiện thì chính hắn cũng không leo lên được cái ghế trống của giảng đường đại học, cho dù là rách nát. Làm qua vô số nghề để tự nuôi sống bản thân và là trụ cột kinh tế trong gia đình, dưới có cha mẹ già yếu, trên có một đứa em gái bệnh nặng quanh năm suốt tháng, khi sinh ra thì thể chất đã rất nhược.

Hắn gồng gánh, chạy xuôi chạy ngược cho đến một ngày may mắn mỉm cười khiến hắn bỗng nhiên trở thành một cảnh sát. Do buôn cả tất tả nhiều năm nên sức khỏe của hắn khỏe mạnh vô cùng, lúc đó bằng cấp trung học phổ thông cũng đủ đậu vào cảnh sát và sau hai ba ngày thi cử, xét tuyển thành công thì cuối cùng hắn đã chính thức trở thành một cảnh sát. Cho dù là lính quèn nhưng ít ra tiền lương định kỳ hàng tháng luôn có, và chuyển về nơi đây, khu phố này vào năm 1999. Cho đến bây giờ thì cũng đã là năm năm rồi, năm nay là năm 2004!

Tiếng "cộc, cộc" vẫn rất nhịp nhàng vang đến, bóng của nhân ảnh kia dính sát rạt vào tường với tốc độ chầm chậm. Anh Quang đang ngủ gà gật trên cái bàn gỗ không mấy gì êm ái so với cái giường nhỏ đằng sau, tiếng tivi rì rè không bắt được sóng vang lên trong bốt công an ánh đèn ấm áp khác hẳn với quang cảnh bên ngoài. Càng ngày càng đến gần, tiếng chống gậy càng thanh và vang, đằng sau lưng nhân ảnh kia là một khoảng tối đen như mực, đèn đường đã không còn chớp tắt, mây đen trên cao cũng đã che đi một khoảng mặt trăng tròn hôm nay.

Nơi lỗ mũi Anh Quang phát ra những tiếng xì xì khó chịu, răng cũng cứa lại vào nhau, thật gây ức chế! Nhưng kì lạ hơn hết là một sự hòa hợp đến lạ lùng, nơi khu phố này dĩ nhiên khoác lên bộ áo bạc kì bí lấp lánh kim tuyến như bầu trời sao sáng của vũ trụ ngoài kia. Nơi khu phố trải dài tổng cộng có mười hai cột đèn đường, nơi bốt công an là cột thứ mười hai và cũng là cột không tắt đi giữa trời đêm không người và không giống như đám bạn của mình, đã nhắm mắt lại và ngủ. Nó vẫn sáng ngời ngời làm nơi đây mang trong mình hơi thở quang minh, an tức lạ thường, tồn tại một sự an tâm không hề nhẹ. Nhân ảnh đứng trong vùng sáng, cả người được ánh đèn bốt công an và đèn đường trên cao làm rõ bừng cả một khuôn mặt, cơ thể!

Khuôn mặt bà lão vàng vọt, xanh xao đến tái nhợt cả khuôn mặt, tựa như một người mắc bệnh bạch tạng nhưng chính cái đầu tóc bóng mượt đen tuyền kia càng làm rõ làn da nhợt nhạt, thiếu sức sống. Mặc bộ áo dài màu tím vô cùng kì quái, lưng còng, tay chống gậy phát ra tiếng "cộc, cộc". Dù bà lão còng lưng mà đi nhưng vẫn có thể thấy dáng vẻ cao lớn của thân thể lúc tuổi vị thành niên. Đôi chân bà quả thật khá dài, nếu thật đứng thẳng lên thì cũng chắc một mét bảy trở lên. Đôi tay nhăn nhúm run lẩy bẩy, đôi mắt cho dù đang trong quá trình đục ngầu dần nhưng vẫn thấy được điểm sắc bén cứa vào không khí. Nơi bà xuất hiện dường như lạnh đi, gió cũng bắt đầu dâng cao. Đôi chân không mang giày và cũng nhăn nhúm không kém đang đi chậm rãi đến bốt công an, bà đi rất lạ, khi đi bà lão luôn nhón. Nhón từng bước với bộ dạng quái dị, gậy chống luôn là điểm tựa vững chắc cho bà.

Anh Quang khẽ rùng mình một cái, càng thêm cuộn tròn bản thân lại với nhau, như thấy không thoải mái hắn bừng tỉnh giấc. Nhìn cảnh vật xung quanh bằng đôi mắt mơ màng, hắn ngái ngủ tắt ti vi, cởi bộ đồng phục màu xanh sẫm ra, treo lên tường. Tìm một tư thế thoải mái nhất nằm lên trên giường nhỏ, lăn lốc mấy hồi liền dần chìm vào cơn buồn ngủ dở dang ban nãy. Đèn trong phòng không tắt, cánh cửa phòng không biết chịu lực tác động nào mà chầm chậm trượt vào bên trong, mở ra một khoảng vừa đủ để người đi vào.

Bà lão chân nhón tiến vào bốt công an hay gọi là phòng ngủ của Anh Quang. Gương mặt tái nhợt không biểu cảm, bàn tay trái đưa ra lấy cái bàn làm việc kế bên làm điểm tựa dựa vào, di chuyển dần trên nền đất, bà xem ra rất là mệt mỏi. Tay chân yếu ớt không có sức, nhìn bà không đến nỗi là ngoài tám mươi, tóc đen mượt đến thế, tốn khoảng mười lăm phút đồng hồ bà đã thành công đem cái ghế chuyển đến cạnh giường, thân thể mệt nhọc ngồi xuống. Đôi mắt sắc bén khẽ rung nhắm lại, đôi môi khô khốc nứt nẻ mở he hé.

Anh Quang nằm ngủ cảm thấy rất là khó chịu, gió đêm thổi ùa vào khiến cả tấm lưng hắn hứng chịu một cách đầy bi kịch. Hắn khẽ nhúc nhích, lật người lại, nằm ngửa hít thở đều đều. Tay ngưa ngứa giơ lên gãi bụng vài cái, gãi dần lên trên, gãi loạn xạ, đem cái áo ba lỗ mà hắn đang mặc kéo đến tận nửa ngực. Sau một loạt động tác này thì Anh Quang dường như rơi vào giấc ngủ tiếp tục, hai tay để lên trên đầu. Bà lão đối với những động tác đó vẫn rất là bình tĩnh, gương mặt vẫn y nguyên ban đầu, lạnh nhạt vô tình. Bàn tay phải khẽ chống thành giường, thân thể dần cúi xuống, hạ thấp... Việc như thế cứ cách một đoạn lại dừng rồi lại tiếp tục, cuối cùng mũi của bà cũng đến được bụng của Anh Quang.

Khẽ hít vài hơi, đôi mắt nãy giờ vẫn chưa mở, như đã xác định được cái gì đó. Bà khẽ dịch người tiến lên trên, cả người cũng phải đứng lên cách ghế một chút. Đôi môi nứt nẻ vẫn hé mở đó, một màu đỏ tươi đến yêu dị như một con rắn trườn bò ra ngoài, như đang quan sát con mồi một cách vô cùng cẩn thận. Cái lưỡi bén nhọn khẽ đụng chạm với những sợi lông trên vùng cao nguyên kia, Anh Quang cũng khẽ rung vài cái. Con rắn vẫn chưa xác định rõ ràng con mồi, lại tiếp tục thăm dò. Lần này thâm nhập sâu hơn, lưỡi đỏ tươi như máu bỗng cứng rắn thẳng đứng, đâm xuống nơi mềm mại, bốc mùi kia khẽ mút, rất khẽ như kiến cắn như mồ hôi ướt người khó chịu. Con rắn quay về nơi ở nhưng để lại một dấu tích nơi nó từng đi qua.

Anh Quang cảm thấy nơi nách nhột nhột kì lạ, nơi thần trí mơ màng tỉnh giấc, mắt mở ra một đường chỉ nhỏ liền bị ánh sáng xâm nhập, nhanh chóng đóng lại. Một cánh tay bên đối diện đưa đến lượt sượt vài cái, hắn khẽ ngáp một cái rõ lớn, tay lại tiếp tục gãi khắp cả người. Giờ đây bà lão quái dị đã không còn dịch người lên trên nữa, tay phải chống thành giường của bà đã đổi thành tay trái. Tay phải khẽ rung vài cái trên không trung, ánh sáng trong bốt cũng khẽ nhạt đi, bà lần này có một chút không hài lòng, không biết là vì việc gì, đôi lông mày khẽ nhíu.

Tay phải dần chống thành giường, cây gậy chống thì đang nằm lăn lóc trên mặt đất. Nó rơi từ lúc nào không ai biết? Nó có hay chăng phát ra tiếng động, không ai nghe thấy? Bà lão khẽ hít vài hơi, lỗ mũi phát ra tiếng "khịt khịt" nho nhỏ, tay phải nhích từng bước đến hạ bộ Anh Quang. Chạm vào chiếc quần đùi đã khô cứng, bà rất nhẹ nhàng xoa khắp đùi, cẳng chân, bàn chân, tay trượt lên làn da không đáng gì tự hào. Dừng tại nơi bộ vị quan  trọng, tay không chạm đến chỉ đi khắp các vùng xung quanh. Nhịp nhàng lên vùng bụng xung quanh, cơ bụng săn chắc có vài ba múi, một đường lông từ rốn chạy dài xuống.

Bà khẽ rụt tay, đôi tay chống gậy đứng lên, tiếp tục tốn thêm mười lăm phút nữa đem mọi thứ về lại vị trí cũ. Một tiếng "bịch" xuất hiện, mọi thứ quanh bà dường như đông cứng, đôi tai được giấu sau mái tóc dài bóng mượt khẽ nhô ra. Sau hai phút đồng hồ, mọi thứ như dần chuyển động lại. Không, chúng nó vẫn luôn chuyển động nhưng tất cả mọi thứ đều do tâm thức, ý nghĩ của con người làm ra, cải biên. Cánh cửa trượt ra thêm lần nữa, vẫn như lúc đầu vừa đủ cho một người đi qua. Nơi bốt công an ánh sáng ngập tràn, mọi thứ ngăn nắp đàng hoàng, tất cả mọi thứ đều hoàn hảo, nhìn khung cảnh hiện tại rất khó để nói là đã có người đi vào nơi đây!

Sáng sớm hôm sau, nơi khu phố buổi sáng ngập tràn sức sống, ánh ban mai gõ cửa từng nhà. Tiếng chim, gió thoảng, nắng sớm, một cảnh sắc rất đẹp! Người người dần đi qua đi lại, Kiến Húc, người quen thân nhất với Anh Quang trong khu phố trải dài hàng chục cái hẻm, ngỏ phố, mắt có chút đăm chiêu, môi khẽ nhếch lên giễu cợt. Hắn ta đang nghĩ ngợi đến đêm hôm qua mà hắn ta tình cờ bắt gặp trong bốt công an nghiêm chính. Hai người một trai một gái, cô nam quả nữ ở chung trong một căn phòng, xung quanh tối đen như mực, rất phù hợp để hành sự! Nhưng người anh em này gu thưởng thức cũng khá lạ nhỉ, mái tóc thì đẹp thật đấy nhưng đôi tay thì có chút xấu, làn da nơi tay nó khá sần sùi.

Đến bốt công an, cảnh tượng mà Kiến Húc thấy vào đêm hôm qua bỗng hiện về. Không khí lúc đó có chút gọi là u ám, lạnh lẽo. Hừ! Cái tên này làm mình sợ run cả mật như thế, lát phải bắt nó khao một chầu ăn sảng khoái mới được, cũng xem như phiếu giữ bí mật an toàn tuyệt đối!

Cánh cửa trượt dần, đầu Kiến Húc dần ló vào, đập vào mắt là cái bàn làm việc cùng cái ghế gỗ. Hai người này làm việc gọn gàng thật! Cửa dần mở rộng ra hơn nữa, bóng đèn vẫn sáng từ tối qua cho đến giờ. Thật tiêu phí quá mà! Cuối cùng Kiến Húc cũng thấy được người mà mình muốn gặp nhưng thứ hắn ta thấy trước nhất là cuối giường. Đôi chân dài của Anh Quang, lông mọc rậm rạp quyến rũ, chiếc quần đùi kéo đến tận cổ chân. Sao lại lõa lồ như thế chứ, cô gái ấy còn trong đó sao? Kiến Húc nhanh nhảu nhìn khắp căn phòng qua khoảng hở mà hắn ta thấy, không dấu vết nào chứng tỏ có người sang. Anh Quang hắn không ngờ lại phóng khoáng đến thế, chắc đêm qua kịch liệt, nằm ngủ đến tận sáng! Kiến Húc khẽ bật cười, cánh cửa bật mở thật mạnh, tiếng cười nói của Kiến Húc phát ra, kèm theo một chút châm chọc giễu cợt:

"Sáng rồi thức thôi, người nông dân chăm chỉ!"

Không một tiếng đáp lại, cả khoảng không như dừng lại ngay lúc đó, tiếng chim hót không còn chỉ còn tiếng "phạch, phạch" đập cánh bay đi. Mây đen giăng kín che đi ánh sáng ban mai, gió đã mạnh hơn nhưng lần này còn kèm theo một cái gì đó, một sự tiễn biệt!

"Aaaaaaaa!"

*****

Nơi ổ chuột đông người, luôn bốc một thứ mùi hôi quái đản khiến bao người ghét bỏ. Nhà nơi đây xập xệch, người nơi đây thì ăn nói thô lỗ, tiếng quát tháo cứ văng vẳng truyền đi hang cùng ngõ hẻm. Dọc một đường trên nền đất đen thui, cứ lâu lâu một đoạn đường là liền gặp phải xác chuột. Máu nhuộm nơi đây, tô màu đỏ huyết sắc lên nền đen u tối, hôi thối, luôn có vài ba người đầu chụm lại vào đầu gối, thân thể dơ dáy, sắc mặt đen như đít nồi. Tiếng khóc trẻ con không thiếu, tiếng chửi rủa lại càng không thể nào không có ở nơi đây, chúng có thể gọi là đặc sản!

Những người tồn tại nơi khu ổ chuột này đều đời sống tất cơ cực, bọn họ đối với đời chả có một tí nào gọi là khái niệm. Bọn họ bị vận mệnh đùa bỡn, quấy phá! Nét u uất, buồn bã luôn hiện rõ trên nét mặt mọi người, số lượng người chết nơi đây luôn nằm trong tốp cao nhất nước. Dịch bệnh đã từng hoành hành nơi đây rất nhiều lần, bọn họ phải đi, nơi này không dành cho người sống nhưng đích đến cuối cùng của bọn họ là nơi đâu? Ngoài nơi đó ra thì nơi đâu sẽ chứa chấp bọn họ, "Trời đất rộng lớn lắm, chắc chắn sẽ có nơi cho chúng ta nương tựa thôi, chúng ta phải tin tưởng vào một ngày mai tươi sáng!", lời cổ vũ tinh thần của các nghệ sĩ trên đài radio khiến người khác phải cười than. Đúng! Trời đất bao la nhưng chúng tôi có còn là con của đất nước, con của dân tộc nơi đây và là một phần của trời đất.

Ánh ban mai của chúng tôi đã bị các nhà cao tầng, khu cao ốc, phức hợp gì đấy che đi hết rồi. Nó cao to, bề thế và rất chi là hùng vĩ, nó mang trong mình một niềm tự kiêu bản thân rất cao quý, ánh sáng kia là của chúng nó. "... ngày mai tươi sáng" đấy chúng ta đã được thấy chứ, không, chúng ta không thể nào tin tưởng vào một thứ mà bản thân không biết đến, mơ màng về nó cả. Nếu đã thế chúng tôi đã hết lựa chọn rồi ư, có lẽ là như thế vì chúng tôi không biết tin tưởng ai cả, ánh ban mai của ngày mai không có!

"Vận mệnh là của bản thân, không do ai định đoạt cả mà là do chính bạn tự định đoạt để khi bạn thất bại, bạn không đổ thừa ai cả mà phải tự xem lại bản thân có cố gắng, có hết mình dốc sức vì vận mệnh bản thân!" Có ý nghĩa và thực dụng hơn câu trước rất nhiều, đúng, khi chúng tôi ra đời không thể lựa chọn hoàn cảnh sống, cha mẹ, anh em nên chúng tôi khi thấy không vừa ý chúng tôi liền đổ lỗi cho chính ông trời bất công vô cùng nhưng giờ đây khi chúng tôi tự nắm vận mệnh chính mình thì mọi tội lỗi, thất bại chúng tôi sẽ chấp nhận.

"Thế lực xấu xa luôn ra đời khi bạn đã rất tuyệt vọng với thế gian bất công, sự liêm chính, công bằng là nơi mà bạn luôn tìm kiếm!" Nhưng tự hỏi nếu mà đi tìm kiếm sự công bằng, liêm chính thì phải chăng đấy là thế lực xấu, tốt chứ nhỉ? Tòa án không phải là tồn tại theo phương thức ấy sao? Không, chính do cách mà ta thực hiện sẽ quyết định tính chất sự việc. Đúng và sai luôn có một ranh giới mỏng manh chắn ngang cả hai khái niệm!

Hành khất rất nhiều, nhà giàu thì lại ít, ấy đã là một sự không cân bằng! Âm dương phân nam nữ cũng như thế, người tốt làm việc xấu nhưng lại được bọc một lớp mang tên "việc tốt" thì "Bằng Khen: Chứng nhận 'Công nhân tốt làm việc tốt'" được phát ra. Ấy thật là kinh dị!

Có câu "Trời đất vô tình, vạn vật hữu tình", không phải luôn tồn tại mặt đen tối xấu xa mà do chính ta dùng con mắt ấy để nhìn thôi. Nhưng... vấn đề là ở đây! Vì sao ta lại dùng con mắt ấy, con mắt nhìn đời một cách tối tăm, đen đúa, mà không phải dùng con mắt khác nhìn đời tốt hơn? Sự lựa chọn nơi đây đã không được thực hiện...

Khu ổ chuột, căn nhà xập xệch, con đường đen đầy xác chuột bốc mùi, đêm đã về ướm nơi đây sắc đen càng thêm thuần.

Nơi đây tất không giống nơi khác có đèn đường vào ban đêm nhưng đổi lại nơi đây có bột huỳnh quang. Nó lấm tấm khắp nơi, như những con đom đóm xinh đẹp, tối đến khu ổ chuột so với nơi khác càng thêm ồn ào. Vì giờ này người đến kẻ đi rất nhiều, trong đoàn người tấp nập kia có một bà lão tay chống gậy đi đến. Bà mặc áo dài tím quái dị, lưng còng chân trần đi nhón, một mùi hôi từ người bà phát ra nhưng đối với những người nơi đây thì thật có chút kì lạ nhưng bọn họ không để ý nhiều.

Bà vẫn đi rất chậm, đôi mắt bà luôn nhìn xuống đất, có lẽ nhìn chân bản thân hoặc đang né tránh các xác chuột dưới đất. Như đã xác định được địa điểm và đã thuộc lòng toàn bộ khu ổ chuột này, bà không cần nhìn đường cứ một đường thẳng tiến rồi đôi lúc rẽ trái, phải. Dần dà, bà biến mất trong đoàn người tấp nập này và như là một điều hiển nhiên không ai biết cả.

Tiếng "cạch", "xoạc", "rạp" cứ liên hồi nhịp nhàng khe khẽ phát ra trộn lẫn vào tạp âm kia liền bị mất hút, không ai nghe thấy. Những âm thanh dần rời xa khỏi nơi tấp nập này, tiến nhập vào một nơi yên tĩnh nhưng chính vì thế khiến cho âm thanh đó càng thêm nhỏ. Mười phút trôi qua, trăng trên cao tỏa sáng, âm thanh chuyển động nhịp nhàng đi đến, một cỗ khí thế to lớn như sông trường hà ập vào chế trụ nơi đây. Âm thanh quát lớn xuất hiện như làm đông cứng cả không khí xung quanh nơi này, mùi sắt thoảng hiện, cảm giác nguy hiểm cao độ bấu chặt nơi không gian vốn yên tĩnh giờ bị lấp dần bởi người:

"Cảnh sát đây! Bỏ ma túy xuống, giơ hai tay lên đầu! Đi qua một bên, không được phản kháng!"

Mất khoảng năm, sáu phút cảnh sát liền thành công bắt toàn bộ những người có liên can đến vụ giao dịch và buôn bán ma túy bất hợp pháp. Phá bỏ một đường dây buôn ma túy lớn, đang chuẩn bị rời khỏi hiện trường, chừa lại vài ba pháp y xem xét hiện trường, còn tất cả áp giải tội phạm trở về. Trăng trên cao hôm nay rất tròn và sáng nhưng đang bị một đám mây trôi dạt che mất một phần...

"Aaaaaaa". Cảnh sát bất ngờ xoay lại, cảnh giác xung quanh, vị sếp lĩnh đội lần này xác định hướng âm thanh truyền đến kia liền ngay lập tức cùng hai, ba người đi đến đấy.

Trăng bị mây che mất, bầu trời ban đầu là tối đen không có lấy một vì sao nhưng giờ đây ở gần mặt trăng đang có thứ gì đó lấp lóe phát sáng, có lẽ ngoài vũ trụ kia đang thai nghén một thứ gì đó...

Một cảnh sát canh chừng nơi đây, nhìn tội phạm trong xe bực mình, cay cú, đôi mắt lửa hận không thôi. Kim Trù tay châm điếu thuốc, phả một hơi vào không trung, mắt nhìn bầu trời trên cao mà lòng nhớ đến đứa con gái dễ thương ở nhà cùng người vợ xinh đẹp. Hắn phát hiện bên mặt trăng vậy mà có ba ngôi sao xuất hiện, bao vây lấy mặt trăng bị che khuất một phần. Nhìn cảnh tượng kì lạ trên trời hắn bất ngờ hứng thú, tay móc điện thoại định chụp. Bên mặt trăng ngoài ba ngôi sao sáng kia thì dường như đang xuất hiện một thứ gì đấy lấp lóe sáng...

Tiến càng gần vào nơi phát ra âm thanh kinh hãi, hoảng hốt kia thì không biết vì sao cả bốn người lưng ướt cả lên, không khí xung quanh nơi đây có gì đấy thật là ghê rợn. Âm thanh kia không xuất hiện thêm lần nữa nhưng một bóng người trong bóng tối phía trước hốt hoảng chạy tới, chân chạy té lên té xuống. Cả bốn người cảnh giác tột độ, xác nhận bóng người đến là ai. Càng gần, người đang chạy kia cũng phát hiện thấy bốn người, dù hoảng sợ khi thấy súng nhưng chính bộ đồng phục cảnh sát đã khiến người đó như gặp cứu tinh.

"Mấy người là cảnh sát đúng không? Mau đến cứu người đi, mau đến cứu người!"

Có một người lên đỡ lấy người đó, người này mặt mày nhem nhuốc, đôi mắt đỏ lên còn chảy xuống một dòng lệ. Sau khi hỏi thăm tình hình thì biết được, người này phát hiện được một xác chết, chết một cách đáng sợ! Gọi về nơi cũ bảo cần người chi viện, sếp lĩnh đội ngay lập tức cùng người này đến hiện trường phát hiện xác chết.

Hình ảnh mặt trăng bị che khuất một phần cùng năm ngôi sao bao vây xung quanh được căn chuẩn, Kim Trù trông thấy được còn hai luồng sáng nho nhỏ nữa đang dần lớn lên thì liền nhận được một lệnh điều động thêm người của cấp trên vì phát hiện thấy một xác chết. Hắn thấy tiếc cho quang cảnh đẹp này, định bỏ qua nhưng cố đi chậm lại, trông hiện tượng trên trời, mắt thấy gần đến hiện trường hắn càng gấp, cầu xin hai ngôi sao nhanh phát tướng.

Đến được hiện trường, tiếng hít hơi, nôn ói cùng nét mặt kinh nghi bất định của những người xung quanh xuất hiện khi nhìn thấy xác chết. Vào lúc này đây, bảy ngôi sao trên trời bầu trời bao vây lấy mặt trăng khuyết thiếu bừng sáng rực rỡ, phát quang cả một góc trời đêm, Kim Trù hưng phấn chụp một tấm. Điện thoại nóng lên bất ngờ khiến hắn buông tay, hít khí, nhìn điện thoại dưới đất đỏ lên hết mà hoảng sợ. Tiếng "rầm, đùng" như Thor tái thế, đánh một cú lớn khiến cho mưa như trút chảy ào xuống nhân gian.

Cảnh sát nhanh tay lấy đồ che lại xác chết, ngôi nhà mà không có mái liền hứng hết luồng mưa. Mưa đến không báo trước, pháp y chưa kịp thu lấy những mảnh vật khả nghi, mẫu đất nơi đây liền bị mưa lớn cuốn trôi hết thảy, thấm nhuần. Điện thoại của Kim Trù không còn đỏ lên nữa, dù còn chút nghi ngờ nhưng tiếng gọi của cấp trên liền kéo hắn trở về.

Nơi nhà xác có pháp y, Kim Trù cùng vị sếp lĩnh đội hôm nay tên là Bá Thanh, mở túi đựng xác chết ra. Kim Trù giật mình phát hiện, đôi mắt ánh lên tia chuyên nghiệp, quay sang nhìn Bá Thanh nói:

"Lại gây án nữa rồi sao? Sát Bà Bà đó lại tiếp tục giết người nữa, lần này không ngờ địa điểm gây án lại là khu ổ chuột!"

"Người này gây án rất là kì quặc nhưng kiểu chết của các nạn nhân đều giống nhau y đúc. Vùng bụng thì khô quắc, nội tạng nửa mất nửa bị phá hủy. Nách của các nạn nhân đều xuất hiện tình trạng bị ăn mòn, nơi trung tâm thì phát hiện một đường dài khoảng hai xăng đâm sâu vào. Đôi chân phải của các nạn nhân đều xuất hiện các dấu tay in sâu vào đỏ hồng cả một mảng. Dương vật nạn nhân bị phình to ra bất thường, và không chỉ người này mà các nạn nhân trước đều xuất hiện tình trạng dương vật dài đến ba mươi xăng, độ rộng luôn dừng lại ba xăng!"

Kim Trù cũng biết về những tình trạng này, bây giờ vụ án là tâm điểm truyền thông trong nước và nhận được một ít sự quan tâm của thế giới. Vì ngoài Việt Nam ra thì các nước như Hàn Quốc, Trung Quốc, Nhật Bản và kể cả lả Mỹ đều xuất hiện lấy vài ba tình trạng y như đúc. Dù có điều tra cách mấy cũng không phát hiện được tung tích hung thủ, những người phát hiện ra xác chết đều nói là từng thấy hung thủ. Sau khi tra vấn, chân dung hung thủ cũng dần lộ rõ...

Kết thúc một ngày mệt mỏi vô cùng, nhìn cái xác chết người không ra người kia cùng sự bất thường của dương vật khiến Kim Trù có chút ám ảnh đấy. Về lại ngôi nhà đèn tắt tối tăm, có lẽ vợ cùng con đã ngủ hết rồi, dù sao giờ cũng một giờ mấy sáng rồi. Điện thoại để trên bàn, cả người nhào thẳng vào ghế sofa, nhắm mắt nghĩ mệt đôi chút, tay tháo cà vạt và cởi vài ba hàng khuy áo. Dễ thở hơn rồi! Khi kim đồng hồ trôi đến số mười hai liền phát ra một tiếng "đing" thanh thúy.

Kim Trù nhìn đồng hồ chỉ hai giờ sáng, hắn cố gắng lết thân đi tắm dù hắn rất không muốn nhưng vợ hắn lại không thích thân thể dơ, mồ hôi nằm lên giường nên phải đi thôi. Đèn nhà tắm bật sáng, tiếng vòi nước bật mở, cánh cửa kính tại hành lang cũng bật mở, tấm màn ngay lập tức phần phật bay! Chiếc điện thoại đời mới nhất hiện nay bỗng sáng lên, hình ảnh cô con gái dễ thương đang nhìn màn hình cười toa toét, đáng yêu vô cùng dần biến mất, tấm ảnh bảy ngôi sao sáng trên bầu trời đêm, bao vây lấy mặt trăng khuyết thiếu xuất hiện. Nó rất đẹp, công nghệ chụp ảnh tiên tiến hiện nay khiến cho bức ảnh rực rỡ hơn bao giờ hết, điều chỉnh độ sáng phù hợp khiến bức tranh ẩn lấy một vẻ đẹp mộng mị!

Một cái bóng dài không biết từ đâu ra bao trùm lấy điện thoại, nếu truy lấy thì có thể thấy nơi bắt đầu là cánh cửa kính tại hành lang. Điện thoại một tiếng "ting" như âm thanh tin nhắn, cửa phòng tắm bật mở, Kim Trù bước ra cùng bộ đồ ngủ, tay cầm điện thoại lướt vài cái. Đi khắp căn nhà xem mọi thứ có đóng lại an toàn chưa, xác định tất cả các cửa đều được đóng an toàn. Kim Trù cũng quay về nơi phòng ngủ, điện thoại không có tin nhắn nhưng sao lại kêu nhỉ? Nhưng hắn lại không phát hiện điện thoại hắn bây giờ có thêm gì và mất cái gì, dù sao giờ đã quá khuya hắn rất là buồn ngủ. Không kinh động lấy đứa con gái dễ thương, nhìn nó ngủ ngon lành xong liền quay về phòng mình, nhẹ nhàng leo lên giường ngủ.

Nơi phòng tắm bật sáng, tiếng vòi nước bật mở, một dáng người kiều diễm xinh đẹp hắt lên cửa phòng tắm mờ mờ...

Trời cao không còn trăng, sao sáng cũng lặn mất tăm, bệnh viện tấp nập kẻ ra người vào...

Tiếng "cộc, cộc" vang lên như một chuông hồi báo, phòng mổ, phòng hồi sức hay hàng lang không người, lác đác vài người...
Ánh đèn vằng vặc chiếu xuống làm sáng cả một căn nhà, nhà rộng, xe lớn và xịn. Đấy là điều đầu tiên mà Kiến Húc thấy khi đáp xuống nơi đây qua mái nhà, hắn đã điều tra  không sót về chủ nhà nơi đây, lên kế hoạch kĩ lưỡng và tối ngày hôm nay là ngày hành động. Hắn đã bỏ cái nghề ăn trộm này cũng được ba năm rồi, cũng chính vì nhờ có một người can ngăn, cứ gây phiền phức cho hắn, dạy cho hắn một bài học nhớ đời và thật khiến hắn tỉnh ngộ ra. Hắn đã thề rằng hắn sẽ giúp đỡ hết sức những khi người đó cần, lên dầu nóng dạo chảo dầu đi chăng hắn cũng không lùi và luôn xem người đó là người thân cho đến suốt cả cuộc đời nhưng đáng tiếc thay...

Gạt bỏ cái suy nghĩ vẩn vơ đó để tập trung hành động nhưng khi vừa nghĩ đến thì lại thấy rất là tội lỗi, cậu ta vì mình mà bỏ ra bao nhiêu thứ, giờ cậu ta mới mất chưa bao lâu mình lại ngựa quen đường cũ. Kiến Húc cười tự giễu, đâu biết chừng cậu ta biết rồi tức quá đội mồ sống dậy, ha ha, vậy cũng tốt!

Kiến Húc cảnh giác đi  từng bước chậm rãi đến chỗ công tắc đèn, cả nhà không người vậy mà vẫn mở đèn, thật hao phí! "Tách" khi bóng tối phủ xuống căn nhà, mọi ngóc ngách, Kiến Húc đã có thể bình tĩnh một chút, lưng cũng thẳng lên và đi thăm dò xem xét.

Tay kéo cặp kính dưới cổ quàng ra sau kia lên mắt, thế là bóng tối sẽ thành một trợ thủ đắc lực cho hắn. Thông qua màn xanh trước mắt hắn liền dễ dàng lấy được vài ba món giá trị, dù chủ nhà này đã đi ăn tiệc (hay bàn chuyện làm ăn vì hắn thấy người này mặc bộ tây trang bảnh bao) nhưng những đồ vật tại gia đây cũng rất giá trị. Một cặp nhẫn mạ vàng nguyên chất, đai lưng da cá sấu hãng cao cấp dành cho đàn ông, cái máy tính xách tay cỡ khoảng chục triệu, nguyên một tủ giày da đáng giá cũng khoảng ngàn đôla trở lên, những bộ cánh đẳng cấp thế giới hàng trăm triệu và một loạt hàng mỹ phẩm mắc tiền! Thế giới trong mắt Kiến Húc ngoài màu xanh ra còn có màu vàng sáng lấp lánh, nhức cả mắt!

Hắn biết lần này trúng mánh lớn rồi, cái túi thể thao này không thể đem đi hết nhưng chắc cũng hốt khoảng vài chục triệu gần trăm triệu. Hắn lẹ tay nhanh chóng gom hàng vào, căn nhà ba tầng lầu hắn đã tham quan hết hai tầng lầu, túi vẫn còn trống một vài chỗ chính là dành cho tầng ba, phòng ngủ của chủ nhà nơi đây!

Bước lên bậc thang bằng đá quý, sáng bóng lấp lánh khiến hắn phải lau mồ hôi về độ giàu lẫn độ chịu chi của tên này. Mới bước được tám bậc cầu thang thì hắn ngay lập tức nhìn thấy một cái bao cao su vừa được sử dụng, hàng bên trong không thể lấp lánh!

"Hai người đó cũng dữ thiệt! Nhưng vứt bừa bãi như thế ư, chắc ban nãy gấp đi lắm! Đã vậy mà còn chơi một phát... xem chừng trên chiếc xe limousine đắt tiền kia vẫn còn một trận kịch chiến!"

Để hàng xài rồi về lại chỗ cũ, Kiến Húc liền nhanh chân hơn chút, chẳng mấy chốc hắn đã đến được tầng ba, tầng ba hình như rộng hơn tầng một đôi chút nhưng so với tầng hai thì có chút nhỏ. Khi lên được tầng ba liền gặp phải hai ngã rẽ dẫn đến hai căn phòng và đường thẳng lên là một ban công, hắn rẽ trái thăm thú căn phòng ngủ của chủ nhà, tất nhiên cũng có chút tò mò về vết tích trận chiến nóng bỏng. Lúc đến tuổi dậy thì cho đến khi qua cái giai đoạn đầy ngô nghê nhưng hấp dẫn kia và cho đến tận bây giờ hắn chưa có một mảnh tình vắt vai nào cả, nên chính hắn đã cận kề ba mươi đến nơi nhưng trinh nguyên vẫn còn!

Cửa phòng ngủ bật mở chầm chậm, cả căn phòng hóa màu xanh. Nhìn căn phòng rộng rãi còn hơn căn hộ hắn sống, đồ dùng hiện đại và xa hoa, bồn tắm thì thật mê ly! Bồn tắm chứa được cả bốn người trở lên, mùi hoa hồng tươi ập vào mặt hắn, mùi xà phòng hảo hạng thơm lừng so với dầu tắm rẻ tiền ở nhà thì khác xa một trời một vực, mùi hương nồng đậm kia cứ vẫn chưa phai, theo như mấy thằng biến thái chuyên gia về chuyện này gần nhà hắn hay bàn tán thì cái này gọi là...

"Mùi hương hoan ái kích tình lan tỏa khiến cho ngọn lửa đam mê trong lòng bừng cháy, cháy cả người anh nóng hừng hực, em cùng anh dập hỏa cho nhau!"

Kiến Húc thì thầm nói. Nói xong lại khẽ phản bác cái suy nghĩ hư đốn đấy, mắng mấy tên đó trai tơ mà tỏ ra nguy hiểm, còn chưa đụng đến mà tỏ ra rất rành! Hắn định xoay người rời đi nhưng thật không ngờ lại phát hiện thấy một cái đồng hồ giới hạn nằm bên bồn tắm, sao căn nhà này đâu đâu cũng là báu vật thế! Xem ra bản thân thật sự vẫn chưa rõ về chủ nhân nơi đây, theo như thông tin hắn điều tra được thì tổng giá trị tài sản không quá nhiều, nhưng xem ra nãy giờ hắn thấy thì cũng đã vượt quá mấy tỷ gần mười tỷ, không kể cả xe hơi trong nhà sau lẫn...

"Cốp", "Bịch"... tiếng vang thanh thúy trong căn nhà không người, chủ đi vắng, ăn trộm sang...

"Binh", "cộc, cộc", "Aaaaaa". Cả một căn nhà chìm trong bóng đêm, tiếng quạ đập cánh bay đi, tiếng xe hơi đụng nhau, tiếng vang hô, tiếng còi xe cảnh sát, tiếng xe cứu thương lần lượt vang lên. Lửa cháy bốc cao, hai xe hơi đụng nhau, năm người chết, một người sống nhưng đang trong cơn nguy kịch!

*****

Trường mẫu giáo Họa Mi

Trong một lớp lá, hai thầy cô đang chơi cùng các học sinh của mình, người dạy xếp hình, người chọc cười các bé, cả lớp học tiếng cười vui vẻ! Đám nhóc nhoi nhoi chạy vòng vòng, người đạp đổ tầng tháp cao của bạn, người chạy quá nhanh té trượt dài nhưng không khóc, vẫn đứng lên cười đùa chạy tiếp. Đến giờ ăn, cả lớp chỉ vài ba thành phần là không chịu ăn, khó đút, còn những người còn lại thì rất ngoan ngoãn tay cầm đồ chơi nghịch trong im lặng, đôi mắt nửa nhìn đồ chơi còn nửa nhìn cái muỗng cơm. Sau khi ăn xong thì hoạt động nhẹ, tránh vận động mạnh, khoảng nửa tiếng sau thì đã đến giờ đi ngủ. Căn phòng lớp lá không quá lớn nhưng lại vật dụng tiện nghi, đồ chơi đều trông rất cao cấp, ánh đèn vàng nhẹ tỏa sáng khắp phòng, đem các bé nơi đây chìm vào giấc ngủ trưa trong căn phòng máy lạnh mát mẻ.

Đi kiểm tra vài vòng, chắc rằng các bé đã ngủ say nên cả hai thầy cô giáo đều chậm rãi rời đi. Cùng với các thầy cô ngoài kia hội họp, một người đàn ông bảnh bao trong số đó lên tiếng:

"Mấy đám nhóc đó ngủ hết rồi sao?"

Những người còn lại đồng loạt gật đầu, người đàn ông bảnh bao mỉm cười hài lòng, định mời mọi người đi ăn cơm nhưng một người phụ nữ trung niên đã lên tiếng trước:

"Nếu vậy thì đến lượt chúng ta rồi, hôm nay mọi người ăn gì để tôi còn biết đặt nữa..." Người phụ nữ trung niên từ trong túi lấy ra một tờ giấy note, cây viết bấm nút ra vẻ định viết "... hình như hôm nay có sườn xào chua ngọt đấy, thầy Ngọc! Thầy ăn như cũ hay đổi món?... Vậy được rồi, thầy Ngọc một phần sườn xào chua ngọt và tất cả đều như cũ..." Tay xoèn xoẹt viết nhanh trên giấy, liên tiếp có người lên tiếng đặt đồ ăn, người phụ nữ trung niên đấy cũng rất nhanh liền xài hết ba tờ giấy note "... Được! Vậy nha, để tôi đi lấy điện thoại đặt, mọi người chờ chút nhé!... À, vậy còn thầy?"

Người đàn ông bảnh bao nhìn sự việc diễn biến nãy giờ, mắt thâm trầm ghét bỏ người phụ nữ trước mắt. Nhà cô ta có bốn người, chồng cô ăn chơi không làm ăn, con trai ngu si đần độn không lên được đại học đang làm thêm tại quầy thức ăn nhanh và còn cô gái thì đỡ hơn chút nhưng gia môn bất hạnh bị người khác lừa đảo, mất vài chục triệu nên sợ hãi không dám ra ngoài, mở quán ăn gia đình nho nhỏ. Giờ đây cô là trụ cột gia đình nhưng lại lợi dụng việc ăn trưa mà lôi kéo mọi người ủng hộ quán ăn cô ta, ngày nào cũng đổi món và mùi vị khá là ngon nhưng làm như thế là không đúng. Nhìn cô ta lấy việc công làm việc riêng khiến cho người đàn ông không thích tí nào, người đàn ông không muốn thấy cô có thể thành công thêm lần nào nữa.

"À, cám ơn nhưng tôi định rủ mọi người đi nhà hàng ăn trưa. Nơi đấy thoáng đãng mát mẻ, đồ ăn thì lại rất ngon. Với lại nó cũng gần đây nhưng... nếu mọi người đã có món thì thôi vậy!"

Khoảng không bỗng có chút im lặng, một cô gái khoảng hai mươi ba, hai mươi bốn lên tiếng đầy hớn hở:

"Vậy sao thầy, cho em đi nữa! Em chưa có đồ ăn trưa!..." Cô gái huých tay người bạn kế bên, người đấy giật mình gật đầu lia lịa cầu đi, nhiều người thấy thế cũng biết rõ tình hình không đi là không được nên rất nhanh liền giơ tay biểu thị bản thân chưa có đồ ăn. Ba tấm giấy note nằm trong tay người phụ nữ trung niên dần trở nên nhăn nhúm, khóe mắt cô ta cũng xuất hiện vẻ hung thần ác sát nhưng con mắt lại tươi cười quá đỗi! Cô gái trẻ xung phong đầu đếm số người rồi hô hào vui vẻ đi khuất dần trong mắt cô ta, tờ giấy note rơi xuống đất và cô ta khoanh đầu liền nhìn thấy một người.

"... Sao thầy Ngọc không đi ăn cùng mọi người?"

"Nơi đấy không có sườn xào chua ngọt!"

Vì nơi đấy là nhà hàng tây cơ mà! Cô ta thầm nhủ trong lòng, nhưng sâu trong đôi mắt lại hiện lên tia vui vẻ. Đến tủ đựng đồ giáo viên lấy điện thoại đặt phần cơm cho hai người, cô con gái từ bên kia điện thoại ngơ ngác hỏi:

"Mẹ, sao hôm nay chỉ có hai phần thôi chứ!"

"Cứ làm đi, đừng hỏi quá nhiều!..." Nghe đến thế liền bực mình, cô con gái cũng biết điều "dạ, dạ" liên tục. Lương Cúc sực nhớ một chuyện, trong giọng nói cũng xuất hiện sự chán ghét nồng đậm... "Ba mày còn lên cơn không, nếu còn thì kệ cha ông ta, đừng quá quan tâm! Đàn ông gì đâu vô tích sự!"

"Mẹ, ba sáng nay đã rời khỏi nhà, xách theo rất nhiều giấy tờ chạy đến công an phường..."

"Mày nói gì? Xách theo giấy tờ gì cơ chứ, vậy bây giờ ba mày về chưa?"

"Về rồi! Giờ đang trên lầu ngủ, con lẻn vào biết được ông ta cầm rất nhiều đồ nhà mình! Có nhà, có xe và bán một số vàng bạc của mẹ để trong tủ, ông ta đi rất sớm nhưng đúng lúc con khát nước mò dậy nên biết được... Mẹ vậy phải làm sao đây?"

Lương Cúc cả người nóng ran cả lên, đôi lông mày ẩn hiện sự tức giận nồng đậm, việc trước việc sau cùng giáp công khiến cô cả người dần bốc lửa. Lúc này điện thoại trong tay bỗng thoát khỏi lòng bàn tay, tiến nhập bàn tay khác. To hơn, ấm áp hơn rất nhiều. Lương Cúc bất ngờ nhìn thầy Ngọc nói chuyện với con gái mình, chỉ cách con gái cô làm sao trừng trị kẻ đàn ông khốn nạn kia và cách khiến cô thoát khỏi nơi đó nhưng cô kịp thời ngăn cản...

Đôi môi mỏng nhưng rất cương mãnh của thầy Ngọc bỗng mím lại thành một đường, mắt nhìn chăm chú vào Lương Cúc, cô có chút ngại ngùng cúi xuống, giọng trầm ấm mê hoặc cất lên kết thúc cú điện thoại:

"Vậy đi! Nhớ mười phút sau phải đem cơm đến đấy. Tạm biệt!"

Lương Cúc ngại ngùng tiếp nhận điện thoại lại trong tay, "cảm ơn" vài ba tiếng rồi rất nhanh chạy ào vào nhà vệ sinh. Thầy Ngọc đứng tại chỗ sững sờ, tuổi tác đã khoảng ba mươi ba, ba mươi bốn rồi sao mà như hai mươi thế, ngại ngùng này nọ. Hắn bước ra ngoài với nụ cười thích thú, dù đã hơn ba mươi nhưng cô ấy vẫn đẹp như thuở xưa, tính tình thì rất khó đoán. Ra đến khu vực dành riêng cho các thầy cô, nơi đấy có đến ba, bốn ghế đá dài cùng bàn đá lớn chứa được khoảng bảy người. Lương Cúc vẫn chưa xuất hiện, thầy Ngọc ngồi vào một cái ghế đá dài ngắm nhìn bầu trời qua cửa kính ngoài kia.

Bỗng bàn tay được một luồng hơi ấm áp, diện tích nhỏ nhắn bao bọc lấy, thầy Ngọc không bất ngờ liền nắm chặt hơn. Lương Cúc cả hai má đã đỏ cả lên, cô lí nhí nói:

"Cảm ơn thầy..."

"Không, không có người nào ở đây thì em có thể gọi bằng 'anh' không, hay là kêu tên cũng được. Không, cả 'anh' và tên luôn."

Ánh nhìn như rực lửa của người đối diện mình khiến Lương Cúc tim đập rộn ràng như thuở lần đầu mới yêu, cô đã luôn khao khát có người đàn ông nào có thể tim cô đập nhanh như thế và luôn bảo vệ cô như người đàn ông này. Người này đã từng thích cô nhưng cô đã quá mù quáng về cái cảm giác nhất thời như tiếng sét kia khiến cô liền chấp nhận trói buộc bản thân vào người chồng vô dụng ở nhà. Bất tài và có tài, cô đã không lựa chọn đúng người có thể mang lại tương lai cho cô! Nho nhã và nóng nảy, cô thật là đã chọn cái đáp án mà mọi người đều chọn nhưng chỉ đáng tiếc sự lồng ghép của gã chồng ở nhà quá tài ba, lần đầu cô bị sự nhẹ nhàng cùng yêu thương kia thu hút nhưng khi đã về chung một nhà thì tính khí nóng nảy, ra đường thì ngay lập tức yêu chiều đến đáng sợ!

Cô đã không tìm hiểu kỹ, cô đã luôn như thế. Sự vội vàng của cô khiến mười năm sau này của mình khổ cực, buồn đau.  Cô mê mang suy nghĩ, đôi mắt vô thần nhìn người đàn ông mà cô thấy hối tiếc. Nghênh Ngọc bất ngờ khi trông thấy Lương Cúc chăm chú nhìn mình, lòng anh cũng mềm yếu, vô thức mỉm cười nhìn người phụ nữ trước mắt với ánh mắt cưng chiều như thuở lần đầu yêu.

Anh khẽ ôm Lương Cúc vào lòng, cằm kề lên đầu, thở dài. Cô cũng tỉnh mộng, được Nghênh Ngọc ôm lấy cô cũng chả phản kháng, nói lời gì, tất cả đều rất tự nhiên vô cùng. Như thể hai người mới thật sự là của nhau.

"Chụt" Nụ hôn trầm tĩnh, nhẹ nhàng, nâng niu hạ xuống gò trán bóng loáng của cô. Cô nhắm tịt cả mắt, lòng dần ấm lên. Không cuồn cuộn như thuở lần đầu, không hoảng hốt xấu hổ, cô đã ba mươi mấy. Chồng cũng đã có, con thì cả hai nhưng cô vẫn nhận ra được tâm của bản thân có xúc động. Cô vẫn còn cảm xúc với người này, vẫn còn yêu!

"Aaaaa!" Tiếng la vang vọng, thảm thiết, cấu xé cả không gian nơi hai người. Cả hai buông nhau ra nhanh chóng, Lương Cúc rất nhanh hiển lộ bản năng của một giáo viên mầm non. Cô đứng lên kéo thầy Ngọc đi ra khỏi nơi đây, tiếng la vẫn còn nhưng không nhất thời, tiếng la này kéo dài tựa như có người đang phải chịu một nỗi đau thấu cả da thịt, rút xương.

"Hình như là ở nhà vệ sinh cuối dãy hành lang!", Lương Cúc cũng gật đầu đồng ý, đôi mắt lo lắng của cô hoảng hốt, như tìm thấy một thứ gì khủng khiếp trong đầu, cô há mồm "Tiếng này... âm thanh này là của... của Đồng Đồng đấy!"

Cả hai người tốc hỏa lực nhanh chóng xuất hiện ngay tại nhà vệ sinh cuối dãy, nơi đây có chút tối và thường là dành cho người lớn. Nghênh Ngọc bật mở cánh cửa nhà vệ sinh, một thân hình bé gái cuộn tròn, co rúm lại trên sàn làm hai người giật nảy. Lương Cúc tiến lên đỡ lấy bé gái, âm thanh đau đớn thống khổ vẫn tru réo trong nhà vệ sinh chật hẹp.

Đầu tóc bù xù che cả khuôn mặt, cả thân thể run lên từng đợt lẩy bẩy, cô ôm lấy bé gái lên tiếng dỗ dành không thôi. Hai âm thanh hòa vào nhau, lộn xộn cả lên, ồn vô cùng nhưng thật khó hiểu rằng không ai bị đánh giấc... Nghênh Ngọc từ khi bước vào nơi đây thì luôn tồn tại lấy một cảm giác hết sức kì lạ, một nỗi sợ hãi không tên bao trùm nơi anh, khiến anh lạnh cả tóc gáy...

"Thầy Ngọc, mau, mau gọi xe cứu thương đi!" Nghênh Ngọc có chút nhíu mày, nhưng chính anh cũng thấy nguy cấp nên không nấn ná thêm, móc điện thoại ra thì xuất hiện hiện tượng kì dị...

"A!", Điện thoại đỏ hồng như than rơi xuống đất, bàn tay anh đỏ cả một mảng trông thấy được cả thịt bị nướng tới cháy đen, thịt đỏ lửng hừng hực. Điện thoại phình to lên, Lương Cúc hoảng hồn nhìn chiếc điện thoại, nhìn lấy bàn tay đáng sợ kia mà thương xót. Nghênh Ngọc linh hoạt, bay thẳng đến bồn rửa, mở lấy vòi, nước lạnh mạnh tưới thẳng không thương tiếc. Anh hít khí liên tục.

Bây giờ tại không gian nhỏ hẹp này, tình hình vô cùng loạn. Âm thanh đau đớn như cắt da cắt thịt phát ra từ miệng một đứa bé gái chưa đến năm tuổi, Lương Cúc bối rối không ngừng, bỗng nơi đùi bộc phát ra một nguồn nhiệt nóng cực. Cô hét toáng cả lên, quần bên ngoài dần hiện lên màu đỏ tươi đang nướng thịt. Nghênh Ngọc hoảng hồn sợ hãi, mặc kệ bàn tay đang phỏng nặng, lao tới xé toạc một bên quần của Lương Cúc.

Nửa cái quần dài bay thẳng đến tận cửa, màu đỏ phừng phực sức nóng kia như đang trỗi dậy. Nó đang dần thoát khỏi nơi giam cầm, chất lỏng sền sệt xuất hiện cùng chiếc điện thoại đỏ thẫm phát tướng. Cô cùng anh nhìn nhau, nhìn thấy được sự sợ hãi lẫn khó hiểu sâu trong mắt đối phương. Nghênh Ngọc kéo vòi xịt nước trong buồng phun lên vết thương đỏ loét thấy cả thịt tươi đang chín dần. Cô rơi nước mắt đau đớn tột độ, trong màng nước đang đóng trong mắt cô nhìn lấy không gian xung quanh. Tăm tối lạnh giá, nơi xa xăm bỗng bật ra từng đốm lửa nhỏ màu tím đang du động trên không trung...

"Ha... aa", Lương Cúc ôm chặt lấy cánh tay rắn chắc của Nghênh Ngọc, anh đỡ cô trở lại bên người bé gái vẫn chưa im lặng kia, âm thanh giờ có chút khàn đặc...

"Em chờ đây tí nhé! Anh lấy hộp cứu thương tới rồi gọi xe cứu thương. Coi chừng Đồng Đồng!"

Nghênh Ngọc có chút choáng váng khi bước ra khỏi phòng, cái đau nơi lòng bàn tay khiến thể lực anh tiêu hao nhanh chóng. Anh chống tường, lắc đầu tỉnh táo. Vừa mới bước ra một bước liền trông thấy một bà lão còng lưng, tay cầm gậy chống, áo dài màu tím huyền xinh đẹp đang đứng cách anh khoảng hai mươi bước chân.

"Cụ... đến tìm ai vậy?"

Im lặng tuyệt đối! Cái cửa sổ nhỏ trên đầu bà lão phát ra ánh sáng vàng ấm áp, có chút gay gắt. Bà bước ba bước liền mạch, dứt khoát. Nghênh Ngọc có chút sững người nhưng anh cũng tiến lên một bước, đôi môi mỏng cương nghị phát ra lời cảnh cáo lạnh lùng:

"Cụ có biết nơi đây là trường mẫu giáo không? Không phải phụ huynh, ngoại trừ các giáo viên ra thì những người khác muốn vào phải xin phép!". Bà lão lại tiếp tục bảo trì sự im lặng, hai phút trôi qua bà vẫn không bước. Âm thanh thảm thiết, ngày càng khàn đặc cùng hình ảnh mảng thịt cháy kia khiến Nghênh Ngọc có chút gấp gáp, khó giữ lấy bình tĩnh.

Lúc này bà lão động, bà xoay người bước chân nhanh không tưởng mà biến mất ngay góc cua nơi hành lang. Nghênh Ngọc chạy ra tận ngoài mà chả thấy ai cả, cấp thiết đi xem khắp phòng, nơi phòng ngủ lớp lá, cửa mở toang ra!

"Cộc, cộc" Anh tiến vào trong, hoảng sợ nhìn biển máu trong phòng. Tường, cửa kính, bất cứ thứ gì trong đây đều tắm mình trong biển máu. Đám nhóc ngủ an lành, trôi lênh đênh trên huyết hải. Một mùi chua xộc thẳng lên cổ họng khiến Nghênh Ngọc ho khan, tay chống tường, gượng người nhìn căn phòng khắp nơi là máu, chấn động! Một đốm lửa, hai đốm lửa, ba rồi bốn rồi từng chục đốm lửa tím lạnh giá, u linh xuất hiện trôi nổi trên không trung.

Bước chân mệt mỏi lùi lại, ngã phịch xuống đất, đôi mắt đau đớn khô khát. Dần dần, mọi sự việc sẽ như thủy triều lên rồi sẽ xuống, đến nhanh đi cũng nhanh. Trước mắt đều rất là bình thường, căn phòng ngủ của lớp lá vẫn như trước được đóng lại. Anh khẽ khàng mở cánh cửa, bình thường, toàn bộ. Bọn trẻ ngủ ngon lành!

Cả người như mất hồn, đôi mắt nháy lên lên sự giãy dụa, sự khó hiểu và bình lặng! Tay cầm hộp cứu thương, sử dụng điện thoại bàn gọi xe cứu thương đến. Tận tay chăm sóc lấy Lương Cúc, băng bó tỉ mỉ. Lương Cúc lật người bé gái lên, vuốt mái tóc rối bù kia sang, phát hoảng khi nhìn thấy hai hàng huyết lệ chảy đến tận cằm.

Hôm nay cô đã hoảng hốt bao nhiêu lần, cô lắc đầu xin qua! Cùng Nghênh Ngọc lên xe cứu thương đến bệnh viện, được băng bó cứu chữa và được chuyển đến phòng bệnh. Người thân trong gia đình cũng được bệnh viện thông báo đến, phụ huynh của Đồng Đồng kinh hãi nhìn đứa con gái băng bó cả đầu, trông thật thảm thương!

Con gái Lương Cúc cũng đến, đang chăm sóc cô ăn từng miếng, từng giọt nước mắt cũng thi nhau rơi xuống. Toàn bộ từ nãy đến giờ, Nghênh Ngọc rơi vào trạng thái trầm tư. Đôi lông mày cứ nhíu lại, thả lỏng rồi lại nhíu. Lương Cúc bảo con gái sang hỏi thăm.

"Chú Ngọc, chú không sao chứ... có cần con giúp chú ăn cơm không?" Nghênh Ngọc nhìn Trần Mỹ, đôi mắt dâng lên một vòng quang khó hiểu đan xen giãy dụa. Anh nghĩ chút rồi lắc đầu, mắt đưa sang Lương Cúc bên kia. Đôi mắt quan tâm không giả, lại trầm tư, đôi môi dần mỉm cười yêu chiều.

*****

"Anh à, Đồng Đồng sẽ không sao đúng không? Hu hu hu"

"Em đừng khóc nữa! Bác sĩ nói mắt của Đồng Đồng có khả năng hồi phục lại như xưa mà!"

"Anh, chị! Là lỗi của tôi đã không xem chừng, trông cháu kỹ. Chúng tôi thành thật xin lỗi!"

"Cô giáo! Đó cũng không phải là lỗi của cô nhưng tôi mong nhà trường hãy trông chừng thật kỹ, cho một người lạ vào mà không ai hay biết. Còn... còn làm hại đến con gái chúng tôi!"

Các thầy cô đều đồng loạt trầm mặc, cúi đầu xin lỗi. Người đàn ông bảnh bao tên Tuấn Lâm nhìn CCTV trước mắt mà thầm hít khí lạnh...

... Một bà lão còng lưng, áo tím, tay chống gậy đi từng bước hay nói đúng hơn là đạp trên không mà đi. Đi khắp trường mẫu giáo như chốn không người, vào phòng này phòng nọ. Đến tận trưa, mọi người đang nói chuyện về cơm trưa thì bà lão quái dị đó đang nhón chân đứng sau cột, mái tóc dài suôn mượt che hết khuôn mặt. Khi mọi người đi hết chỉ còn lại hai người: Lương Cúc cùng Nghênh Ngọc. Mất khoảng mười phút, bà lão từ đằng sau cột đi ra. Từng bước một, từng bước đi vào một căn phòng của lớp chồi. Khi bà đi ra thì đằng sau lưng có một bé gái đi theo: Đồng Đồng! Nhí nha nhí nhảnh đi sau bà lão, cái đầu tròn với mái tóc dài đẹp cứ lúc lắc. Có thể nhìn thấy được Đồng Đồng phấn khích cỡ nào. Cả hai người biến mất dần trong khung CCTV này, chuyển sang cái khác. Ngay tại hành lang dài có một cái máy quay nhưng nhà vệ sinh nằm đến tận cuối dãy nên hình ảnh có chút không rõ ràng. Tiếng cửa vang lên, tiếng cười khúc khích rõ lớn, hồn nhiên của bé gái 4 tuổi. Bỗng âm thanh hét đau đớn vang lên bất thình lình làm những người tại đây kinh hồn bạt vía. Cánh cửa nhà vệ sinh bật mở, "cộc, cộc" lạnh lẽo, u ám quấn lấy tâm thần mọi người nơi đây...

Ban đầu, chuyện như thế sẽ không đến tay của Kim Trù nhưng khi xem xong CCTV đó thì ngay lập tức đưa ngay cho Tổ trọng án cao cấp của cậu. Kim Trù lòng dần phát lạnh cả lên, Sát Bà Bà này cần phải đem lên cấp độ cực độ nguy hiểm quá! Ngay cả trẻ nhỏ cũng không tha, rốt cuộc động cơ gây án của người phụ nữ điên này là gì? Hay thật rằng chỉ là ngẫu nhiên vì bà ta bị "điên"?

Kim Trù nhìn bé gái trong lồng đang được hồi sức, đầu quấn mấy cuộn băng. Cả thân thể gầy gò, xanh xao, ốm yếu đến độ khiến người khác phải đau thương thay. Ba Đồng Đồng đau khổ nhìn đứa con gái, Kim Trù muốn nói chuyện riêng với Lương Cúc vì ngoại trừ cô chả còn ai ở hiện trường, còn Nghênh Ngọc thì dường như thần trí bất minh, luôn trầm mặc lạnh lùng như một người mất hồn, được bác sĩ chẩn đoán bị trọng chấn tâm lý nặng! Cô cắn răng đồng ý!

"Nếu ngài muốn biết thêm cái gì, tôi sẽ cố gắng hợp tác!"

"Thật ra, chúng tôi cũng lấy đầy đủ thông tin có thể lấy. Kết hợp với các thông tin chúng tôi hiện giờ đang giữ cũng có chút suy đoán nhưng nhân vật cực độ nguy hiểm này lại có chút biến mất vô tung sau khi gây án. Thần bí vô cùng!"

"... Tôi thật ra đã muốn nói điều này nhưng chỉ sợ các anh lại không tin.."

"Điều gì?... Cô cứ nói, chúng tôi sẽ cố gắng hợp tác!"

Lương Cúc chống lấy cái nạng bên người, tay chỉ lên bên chân băng bó, đôi mắt phát sáng cầu xin sự tin tưởng của Kim Trù. Cô nói:

"Đôi chân của tôi không phải là khớp xương bị gãy! Mà là bị điện thoại trướng nóng đến nướng chín, ảnh hưởng đến các cơ thịt bên trong, có khả năng bị hoại tử!... Tôi không biết vì sao khi bác sĩ mở băng ra thì vết thương ghê gớm kia đã không còn, chỉ còn lại vết bầm tím to đùng cả!"

Kim Trù làm ra biểu cảm mà Lương Cúc đã định liệu sẵn. Cô có chút thất vọng, thất thần quay đi.

"Khoan đã! Đúng là lời cô nói có chút hơi khó tin. Với lại điện thoại của cô vẫn bình thường, không có chút gì gọi là 'trướng nóng đến nướng chín' nhưng dù sao nhân vật tôi đang truy này còn quỷ dị hơn chuyện này rất nhiều. Mà cả hai đều có chút liên quan nhau... có lẽ tôi tin cô đấy! Làm sao được, manh mối đứt gãy, đầu mối lộn xộn cả lên. Dù chỉ là một cơ hội mỏng manh, tôi cũng sẽ cố níu kéo!"

Lương Cúc quay lại, nhìn người đàn ông đang phát ra khí thế quyết tâm, hùng hồn, nhiệt huyết. Lương Cúc bật cười ha hả:

"Có phải anh thật là một cảnh sát lâu năm rồi hay không?"

Kim Trù có chút xụ mặt xuống, Lương Cúc vội vã lắc đầu xua tay

"Không, không, tôi không có ý đó! Chỉ là một cảnh sát lâu năm mà còn có thể phát ra lòng nhiệt huyết như thế thật hiếm."

"Ha ha Mọi người cũng hay nói thế! Cô có muốn nói rõ cái sự việc siêu nhiên mà cô gặp phải hay không? Nếu có chúng ta đi tìm một chỗ nào đó..."

Lương Cúc im lặng, nắng chiều xuyên qua khung kính tiếp đất. Cô trông tiều tụy dưới màn nắng, cô thở ra hơi dài, mệt mỏi lắc đầu:

"Chưa! Tôi cần giải quyết xong chuyện nhà cái đã. Nếu xong tôi sẽ đến đồn gặp sếp, khai báo rõ ràng hơn. Một tháng, nhiều nhất là một tháng thì tôi chắc rằng sẽ đến gặp sếp!"

Lương Cúc cất bước đi mất. Kim Trù dõi theo bóng dáng cô biến mất dần. Bỗng đến khúc quẹo cô xoay nửa người lại, âm thanh cô vọng đến:

"Tôi đã trông thấy một dòng chữ trên tấm gương nhà vệ sinh khi đó, nó ghi rằng Bảy mạng người, bảy vì sao, bảy sinh mệnh!... Mong có thể giúp đỡ được sếp trong khoảng thời gian này!"

',
	2
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Chơi Độc',
	89000,
	N'Khi ấy, Tôn Hồi vẫn đang đi học, để kiểu tóc ngắn giống đầu bê con, khắp cơ thể toát ra năng lượng dồi dào, ngập tràn sức sống. Trong mắt cô không có anh, mà anh bị điên rồi nên mới làm tất cả vì cô.\n\nMột hôm nào đó, Tôn Hồi làm bài trắc nghiệm tâm lý trên mạng, cô hỏi anh: "Ba việc anh đều phải làm mỗi ngày là gì?"\n\nVẫn đang chăm chú đọc báo, anh trả lời: "Ăn, ngủ, yêu Hồi Hồi."\n\nTôn Hồi kinh hãi: "Anh không cần đi ị à?"\n\nAnh: "..."\n\nMột câu thôi: Anh đánh hạ bầu trời này cho em, em tuyệt đối không được phép liếc ai khác đâu đấy!',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/choi-doc.jpg?itok=dJrpm3HD',
	N'',
	2
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Anh Ninh',
	98000,
	N'Thánh Tông Hoàng Đế lên ngôi năm mười tám tuổi, không ngừng cải cách chính sách trị nước, tổ chức thi cử tuyển chọn nhân tài, trọng dụng quan lại thanh liêm, thẳng tay trừng phạt kẻ phạm tội bất kể địa vị. Dưới thời Hồng Đức, dân chúng đời sống ấm no, trên đồng bông lúa trĩu nặng, khói bếp nghi ngút vươn lên những mái nhà san sát.\n\nTrong Nam Hoa Kinh của Trang Tử - chương Nội Thiên - thiên Đại Tông Sư, trích phần hỏi đáp giữa Nam Bá Tử Quỳ và Trang Tử: “kỳ vi vật vô bất tương dã, vô bất nghênh dã, vô bất hủy dã, vô bất thành dã, kỳ danh vi anh ninh”. Dịch nghĩa là “đã là vật thì không lúc nào không đưa, không lúc nào không đón, không lúc nào không hủy, không lúc nào không thành, tên nó là anh ninh" (một số bản dịch là oanh ninh). Nếu đọc một câu này thì sẽ không hiểu rõ, nhưng đọc cả đoạn đối thoại của Nam Bá Tử Quỳ và Trang Tử sẽ thấy ý Trang Tử là: muốn dạy Đạo cho người có tài thánh nhân nhưng không có đạo thánh nhân thì phải gạt thiên hạ, gạt vật và gạt sống ra ngoài lúc đó mới thông suốt Đạo, thông suốt rồi có thể thấy được một điều duy nhất còn tồn tại là đúng đắn. Cho nên anh ninh (chạm yên - Nhượng Tống dịch) nghĩa là tiếp xúc với ngoại vật mà không bị dao động và vẫn giữ được tinh thần bình thản điềm đạm. Đây cũng là tinh thần phá án được duy trì xuyên suốt mạch truyện, luôn giữ vững tinh thần và đầu óc không để nó bị loạn bởi những vật xung quanh, cuối cùng là tìm được hung thủ.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/anh_bia_chinh_2.jpg?itok=oafbf7Ak',
	N'',
	2
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Đào Mộ Đào Ra Quỷ',
	74000,
	N'Lâm Ngôn đứng trước bồn rửa mặt nhìn vào chính mình trong gương,sơmi trắng,quần bò, gương mặt thực thanh tú sạch sẽ,đáng tiếc bộ dáng đã tiều tụy đến mức người không ra người,hai tròng mắt che kín tơ máu,dưới mí mắt là hai luồng thâm đen nặng nề làm cho người ta như già thêm vài tuổi.\n\nTừ khi bị vật kia đeo bám,hắn đã liên tục vài ngày không có hảo hảo ngủ một giấc.\n\nLâm Ngôn dùng sức vỗ vỗ mặt,muốn đánh cho ửng ra một chút huyết sắc, mở vòi nước định đánh răng,màu gạch men đen bóng từ bồn rửa mặt phản chiếu hình ảnh của hắn,không đúng, không chỉ là của hắn. Lâm Ngôn nhìn chằm chằm vào ảnh ngược, khuôn mặt trên đó bắt đầu vặn vẹo biến đổi,môi không khỏi run rẩy,một trận gió theo cửa sổ thổi vào,đèn bên trong giống như bị nghẽn mạch, liên tục chớp nháy vài cái.\n\n',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/dao-mo-dao-ra-quy.jpg?itok=TYfhGuSx',
	N'',
	2
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Đọc Thầm',
	90000,
	N'Truyện diễn biến theo từng giai đoạn, từ lúc còn nhỏ đến giai đoạn trưởng thành rồi quan hệ xã hội, những nổi đau tổn thương sâu sắc...\n\nChúng ta không ngừng tìm hiểu nguyên nhân cũng như tìm hiểu động cơ xuất phát của những kẻ phạm tội, phải tìm kiếm những niềm vui nỗi buồn sự an lạc và yếu ớt nhất của họ, không những thử đặt mình vào hoàn cảnh của họ mà còn phải cảm thông cho họ, tha thứ cho họ, không phải để cho tội ác một lý do trốn tránh, không phải để bái phục trước sự phức tạp của nhân tính, không phải để xét lại mâu thuẫn xã hội, càng không phải để dị hóa cả chính mình thành quái vật.\n\nChúng ta chỉ đang tìm cho mình, và cho những người vẫn gửi gắm kỳ vọng vào thế giới này – một lời giải thích công bằng mà thôi.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/newdesign_1_original_1.jpg?itok=nASOMEf9',
	N'',
	2
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Hoại đạo',
	100000,
	N'Truyện mang nhiều yếu tố tâm lý biến thài cùng với các loại hành vi dị thường, cốt truyện xoay quanh việc điều tra và phá án. Sẽ có rất nhiều vụ án kỳ quái cùng nhiều mỹ nữ xuất hiện xen kẽ.\n\nCường thế buồn bực tao công vs thiên nhiên ngốc phúc hắc thuộc tính không rõ thụ.\n\nXen kẽ cặp đôi phụ: tử triền lạn đả công vs hoa hoa công tử thụ.\n\nNhững đứa bé liên tiếp mất tích một cách bí ẩn, xác chết trong cống thoát nước, xác chết sống dậy mà giết người, đường phố bị tàn phá bởi việc ném bom một cách điên cuồng, thảm án diệt môn cùng hàng chữ máu để lại trên tường...\n\nTóm lại, nếu muốn tìm hiểu nguồn gốc, bản chất của tội ác thì cứ vào xem.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/hoai-dao.jpg?itok=tTxxct3C',
	N'',
	2
)

Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Sức Mạnh Kỳ Diệu Cho Sự Giàu Có Vô Hạn',
	68000,
	N'Bạn đã bao giờ tự hỏi mình những câu hỏi này chưa?\nTại sao một người rất giàu và một người khác lại rất nghèo?\nTại sao một người thành công trong kinh doanh trong khi một người khác thất bại trong cùng một mảng kinh doanh đó?\nTại sao một người cầu nguyện cho sự giàu có nhưng không nhận được câu trả lời và một thành viên khác trong gia đình anh ta cầu nguyện và nhận được kết quả ngay lập tức?\nTại sao một người sử dụng lời khẳng định cho tiền bạc và thành công nhưng trở nên nghèo hơn và một người khác sử dụng cùng một lời khẳng định và nhận được kết quả tuyệt vời?\nCuốn sách này trả lời tất cả các câu hỏi đã nói ở trên, rất thực tế và dễ dàng thực hành. Nó dành cho tất cả những ai muốn trải nghiệm sự giàu có vốn đã ở xung quanh họ. Bạn đang ở đây để có một cuộc sống đầy đủ, hạnh phúc và có tất cả số tiền bạn cần để làm bất cứ điều gì bạn muốn ở bất cứ thời điểm nào. Tiền nên được lưu chuyển tự do trong cuộc sống của bạn và luôn luôn có một khoản thặng dư dành cho bạn.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/713q23nrmbl._sx318_bo1204203200_.jpg?itok=aH6wAu70',
	N'',
	3
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Sức Mạnh Giàu Có Vô Tận Bên Trong Bạn',
	98000,
	N'Bạn Có Quyền Trở Nên Giàu Có\nBạn sinh ra đã có quyền giàu có. Bạn giàu có nhờ vào việc sử dụng những nguồn lực vô tận của Vũ Trụ, và một khi tâm thức bạn đầy những ý niệm tốt đẹp thì công việc của bạn cũng sẽ trở nên hiệu quả hơn và mang lại cho bạn nhiều tiền bạc và giàu có hơn.\n\nChính cảm giác là một thể thống nhất với Vũ Trụ ngay trong tim bạn làm cho bạn giàu có, và bạn giàu có theo đúng thái độ tinh thần và niềm tin vào những điều tốt đẹp của bạn. Tất cả sự giàu có trong Vô Lượng- nằm bên trong và bên ngoài bạn- là dành cho bạn để tận hưởng.\n\nKhông có phẩm hạnh gì trong sự nghèo khó, thực tế đó là một căn bệnh tâm thần cần phải bị xóa bỏ khỏi trái đất này. Bạn ở đây để tìm ra vị trí đích thực của mình cho cuộc sống và cống hiến tài năng của mình cho thế giới. Bạn ở đây là để phát triển và khai phá bản thân mình một cách tuyệt vời từ những tiềm năng mà bạn đã được ban tặng, và mang đến sự giàu có về tinh thần, trí tuệ và vật chất. Hãy học cách bao quanh bản thân mình bởi cái đẹp và sự giàu có và nhận ra những quyền không thể thay đổi của bạn- đó là quyền sống, tự do, bình an và giàu có. Đó là quyền Thiêng Liêng của bạn để thế hiện sức mạnh, sự thanh lịch và sự giàu có của một con Người Vô Hạn.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/41pn5vjk7pl.jpg?itok=I3ambMUo',
	N'',
	3
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Steve Jobs',
	75000,
	N'Cuốn tiểu sử với tiêu đề ngắn gọn “Steve Jobs” do cựu thư ký tòa soạn của tạp chí “Time”, Walter Isaacson biên soạn, dựa trên 40 cuộc phỏng vấn với Steve Jobs trong 2 năm cùng các cuộc phỏng vấn với hơn 100 người thân, bạn bè, đồng nghiệp và đối thủ của ông, khi vừa được phát hành trên Amazon đã liên tục đứng vị trí số 1 danh sách sách bán chạy nhất của cả Amazon lẫn Barnes & Nobles. Đây cũng là cuốn tiểu sử đầu tiên và duy nhất nhận được sự đồng ý của Steve Jobs. Walter Isaacson cũng là người viết tiểu sử nổi tiếng, với 2 tác phẩm viết về Benjamin Franklin và Albert Einstein.\n\nCuốn sách Steve Jobs tiết lộ nhiều thông tin chưa từng được kể về Steve Jobs như tính cách cay nghiệt, kỳ dị, chuyện ông chiến đấu với bệnh ung thư, những mối quan hệ lãng mạn của ông và cuộc hôn nhân với bà Laurene P Và trên hết đó là quá trình ông đã gây dựng và chèo lái Apple đi đến thành công như ngày hôm nay với không ít sai lầm cũng như những ám ảnh không thôi về sự hoàn hảo. Tác phẩm vì thế đã cung cấp cho người đọc một cái nhìn sâu sắc về nhân cách và cả những thành tựu của cuộc đời Steve Jobs. Đó là một cuốn sách chứa đựng những điều Steve Jobs muốn nói với thế giới.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/tieu-su-steve-jobs.jpg?itok=Ob4HQjkh',
	N'',
	3
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Trên đường băng',
	45000,
	N'Trên đường băng là tập hợp những bài viết được ưa thích trên Facebook của Tony Buổi Sáng. Nhưng khác với một tập tản văn thông thường, nội dung các bài được chọn lọc có chủ đích, nhằm chuẩn bị về tinh thần, kiến thức…cho các bạn trẻ vào đời. Sách gồm 3 phần: “Chuẩn bị hành trang”, “Trong phòng chờ sân bay” và “Lên máy bay”, tương ứng với những quá trình một bạn trẻ phải trải qua trước khi “cất cánh” trên đường băng cuộc đời, bay vào bầu trời cao rộng.\n\nNhững bài viết của Tony sinh động, thiết thực, hài hước và xuất phát từ cái tâm trong sáng của một người đi trước nhiều kinh nghiệm. Anh viết về thái độ với sự học và kiến thức nói chung, cách ứng phó với những trắc trở thử thách khi đi làm, cách sống hào sảng nghĩa tình văn minh…truyền cảm hứng cho các bạn trẻ sống hết mình, trọn vẹn từng phút giây. Tuy đối tượng độc giả chính mà cuốn sách hướng đến là các bạn trẻ, nhưng độc giả lớn tuổi hơn vẫn có thể đọc sách để hiểu và có cách hỗ trợ con em mình một cách đúng đắn, chứ không “ủ” con quá kỹ để rồi tạo ra một thế hệ yếu ớt, không biết tự lập. Những người đi làm nhiều năm đọc sách cũng có thể nhìn lại con đường đi của mình, tự ngẫm đó đã phải là con đường mình muốn đi chưa, bởi thay đổi không bao giờ là quá muộn.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/tony-buoi-sang.jpg?itok=PoBf-9TX',
	N'',
	3
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Người Bán Hàng Vĩ Đại Nhất Thế Giới',
	84000,
	N'"Người Bán Hàng Vĩ Đại Nhất Thế Giới" của Og Mandino là một hành trình dài về câu chuyện của Hafid, một cậu bé lạc đà nghèo, ở Jerusalem cổ đại. Người thanh niên đã học được từ một thương nhân giàu có và thành công về những bí quyết để trở thành một người bán hàng vĩ đại.\n\nCuốn sách này được gói gọn trong mười cuốn da dê giúp bạn trở thành một Người bán hàng vĩ đại nhất thế giới, tuy nhiên nó không chỉ dạy bạn cách “bán hàng”, mà nó còn là một cuốn sách dạy bạn làm người, giúp bạn trở thành người “vĩ đại nhất” trong lĩnh vực mà mình đã chọn. Nội dung cuốn sách này được đúc rút từ những kinh nghiệm xương máu mà nhờ đó nó đã biến các ước mơ của cổ nhân thành hiện thực chứ không phải do một cá nhân nào đó tưởng tượng ra trong khi lại chưa được thực nghiệm kiểm chứng cả. Mỗi người đều có quyền tự do lựa chọn con đường để thực hiện giấc mơ của mình tuỳ thuận với nhận thức riêng của họ. Quyển sách này là một trong những con đường có thể giúp bạn đạt được ước mơ của mình. Cho đến nay, “Người bán hàng vĩ đại nhất Thế giới” được dịch ra 25 ngôn ngữ và đã bán ra hơn 50 triệu bản, trở thành cuốn sách bán chạy nhất Thế giới.\n\n"Người Bán Hàng Vĩ Đại Nhất Thế Giới" có một cốt truyện rất độc đáo và thú vị cùng văn phong tài tình và cuốn hút. Mỗi người trong chúng ta đều là một nhà kinh doanh, dù ta thuộc ngành nghề nào. Bởi vì quan trọng nhất là ta phải tiếp thị được bản thân mình cho chính mình, chỉ khi đó ta mới tìm được hạnh phúc và sự bình yên trong tâm hồn. Hãy đọc thật cẩn thận, tiếp thu và lưu từng chi tiết trong cuốn sách này, và nó sẽ giúp bất cứ người nào trở thành nhà kinh doanh tài ba nhất.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/nguoi-ban-hang-vi-dai-nhat-the-gioi.jpg?itok=gxqxNzlZ',
	N'',
	3
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Mặt dày tâm đen',
	95000,
	N'Có một bí quyết ẩn giấu dưới mọi thành công. Các vị tướng từ thời cổ đại biết bí quyết đó. Những người tiên phong khi đến Châu Mỹ biết bí quyết đó. Các lái buôn Á Đông sử dụng nó. Giờ đây, Chin-Ning Chu - chuyên gia có uy tín nhất về tư tưởng kinh doanh - giảng giải về quy luật tự nhiên đã gắn liền các động thái tinh thần với sự thành công tuyệt đối. Phối hợp cả triết lý Đông và Tây, " Mặt Dày Tâm Đen"  cho biết cách vận dụng sức mạnh tích cực khôn lường đang ẩn tàng bên trong mỗi chúng ta - và cách giải phóng sức mạnh ghê gớm đó.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/mat-day-tam-den.jpg?itok=_k2_5_81',
	N'',
	3
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Dám Nghĩ Lớn!',
	78000,
	N'Dám Nghĩ Lớn! – tác phẩm nổi tiếng thế giới về những ý tưởng và phương pháp tư duy độc đáo và hiệu quả đã làm thay đổi một cách kỳ diệu cuộc đời của hàng triệu người qua nhiều thế hệ. Qua quyển sách này, Tiến sĩ David Schwartz trình bày một cách sinh động và dễ hiểu cách tư duy giúp bạn đạt được mục tiêu cao nhất trong công việc, cuộc sống và trong cộng đồng của bạn. Bạn không cần phải thông minh tuyệt đỉnh hay tài năng xuất chúng mới đạt được thành công lớn lao, bạn chỉ cần rèn luyện và áp dụng thường xuyên tư duy Dám Nghĩ Lớn.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/dam-nghi-lon.jpg?itok=oynYeBdB',
	N'',
	3
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Tâm Lý Học Dành Cho Lãnh Đạo',
	150000,
	N'"Việc đọc cuốn sách này là một trong những bước tiến quan trọng nhất trong sự nghiệp của bất kỳ nhà quản lý nào"\n\nTrong các tổ chức kinh doanh theo hướng tập thể ngày nay, mỗi nhà quản lý là một nhà lãnh đạo. Cuốn sách hấp dẫn và đầy tính giáo dục này sẽ mang đến cho bạn các kỹ năng và kiến thức tâm lý mà mọi nhà quản lý/ lãnh đạo đều cần có để thúc đẩy, trao quyền hành động và hợp nhất nhân viên của mình một cách có hiệu quả.\n\n"Tôi ước gì cuốn sách này xuất hiện vào thời điểm khi chúng tôi thực hiện chương trình đào tạo cho các nhà quản lý chương trình mới. Mặc dù luôn hài lòng về kiến thức của mình nhưng hầu hết các nhà lãnh đạo đều không nghiên cứu về tâm lý học của thuật lãnh đạo và đây có vẻ như là nguyên nhân gây ra nhiều rắc rối trong sự nghiệp của họ. Tâm lý học dành cho lãnh đạo chứa đựng cái nhìn thấu đáo về những thách thức này đồng thời đề xuất các phương pháp tiếp cận hiệu quả và thực tiễn để đạt được các mục tiêu kinh doanh" - Candice L.Phelan, PhD.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/tam-ly-hoc-danh-cho-lanh-dao.jpg?itok=fhp_9SJ1',
	N'}',
	3
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Nếu Tôi Biết Được Khi Còn 20',
	140000,
	N'Những bước ngoặt lớn của cuộc đời như rời xa giảng đường êm ả hoặc khởi đầu một sự nghiệp mới thường khiến ta nhụt chí. Phải đối mặt với một rừng những lựa chọn trong khi hiểu rằng sẽ chẳng có ai cho ta biết mình đang lựa chọn đúng hay sai thật đáng sợ. Chẳng có con đường vẽ sẵn hay công thức viết sẵn nào cho thành công, thậm chí việc quyết định mình nên bắt đầu thế nào và ở đâu cũng đã rất khó khăn rồi.\n\nHiểu được những khó khăn, đặc biệt của những người trẻ, trước các bước ngoặt như thế trong cuộc đời, tác giả – một doanh nhân, một giáo viên, một nhà khoa học – đã dồn tâm huyết viết nên những chia sẻ tuy nhẹ nhàng và khiêm nhường, nhưng thật sâu sắc. Những trang sách chứa đầy ví dụ thú vị, cả trong phòng học lẫn trong phòng họp, về những con người sẵn sàng phấn đấu để vượt xa các tiêu chuẩn ở mức “vừa đủ”, thách thức các giả định hay quan điểm đã thành lối mòn, không bao giờ bỏ lỡ cơ hội để vươn tới tiềm năng cao nhất, và nhờ đó đạt tới những thành công vang dội.\n\nThông qua quyển sách, tác giả còn muốn các độc giả, đặc biệt là độc giả trẻ, sẽ được trang bị đủ sự tự tin để biến căng thẳng thành sự hào hứng, biến thử thách thành các cơ hội, và cứ sau mỗi lần vấp ngã lại đứng lên trưởng thành hơn.\n\nThông điệp cốt lõi của quyển sách có thể tóm gọn như sau: “Hãy cho phép mình táo bạo và xuất sắc!”',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/neu-toi-biet-duoc-khi-con-20.jpg?itok=wJDC4A7D',
	N'',
	3
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Suy nghĩ và làm giàu',
	110000,
	N'Think & Grow Rich - Nghĩ Giàu Và Làm Giàu là một trong những cuốn sách bán chạy nhất mọi thời đại. Đã hơn 60 triệu bản được phát hành với gần trăm ngôn ngữ trên toàn thế giới và được công nhận là cuốn sách tạo ra nhiều triệu phú hơn, một cuốn sách truyền cảm hứng thành công nhiều hơn bất cứ cuốn sách kinh doanh nào trong lịch sử.\n\nTác phẩm này đã giúp tác giả của nó, Napoleon Hill, được tôn vinh bằng danh hiệu “người tạo ra những nhà triệu phú”. Đây cũng là cuốn sách hiếm hoi được đứng trong top của rất nhiều bình chọn theo nhiều tiêu chí khác nhau - bình chọn của độc giả, của giới chuyên môn, của báo chí.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/newdesign_1_original_1.jpg?itok=nASOMEf9',
	N'',
	3
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Để yên cho bác sĩ "Hiền"',
	87000,
	N'Hắn tuổi GÀ, người bé như con CHUỘT.\n\nSuốt ngày hùng hục như TRÂU. \n\nChạy loăng quăng khắp nơi như con NGỰA.\n\nThế mà vẫn bị mắng mỏ như một con CHÓ. \n\nCái loại tưng tửng sống không uốn éo được như RẮN, lủi thủi làm việc. \n\nĐồng nghiệp bảo đồ MÈO đội lốt HỔ, tinh tướng nói như RỒNG leo rồi làm culi bán sức. \n\nThế nên mặt hắn lúc nào cũng nhăn như con KHỈ. \n\nTối đi làm về mệt phờ nằm lăn ra ngủ như LỢN.\n\nCó mơ giấc mơ hồng, sáng mai dậy nụ cười DÊ thế?',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/bac-si.jpg?itok=TMebR_TM',
	N'',
	4
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Hồi Ký Về Thảm Hoạ Everest: Tan Biến',
	125000,
	N'Hồi Ký Về Thảm Họa Everest - Tan Biến là hồi ức sau cùng về mùa leo núi tang tóc nhất trong lịch sử Everest, Jon Krakauer đã đưa người đọc từng bước một từ Kathmandu lên đến đỉnh núi chết chóc, mở ra một câu chuyện nghẹt thở, làm người đọc rùng mình và kinh hãi.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/hoi-ky-ve-tham-hoa-everest-tan-bien.jpg?itok=lh_H1cSw',
	N'',
	4
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Đường Xưa Mây Trắng',
	72000,
	N'Đường Xưa Mây Trắng là cuốn sách kể chuyện đời đức Phật Thích Ca qua con mắt của chú bé chăn trâu Svasti, sau xuất gia, trở thành một vị đệ tử của Phật. Đó là chú bé cúng dường cỏ bồ đề cho sa môn Tất Đạt Đa tĩnh tọa suốt 49 ngày trước khi thành đạo.\n\nTác phẩm là một thiên anh hùng ca tỏ bày lòng ngưỡng mộ chân thành trước một lối sống gương mẫu đầy những hành vi và mục đích cao cả, thu hút bạn đọc bởi nhân cách vĩ đại của Buddha qua cái nhìn và ngòi bút của Thầy Thích Nhất Hạnh.\n\nĐường Xưa Mây Trắng đã bán được hơn 1 triệu bản tại bắc Mỹ và được dịch ra hơn 20 thứ tiếng; trong đó có tiếng Hindu. Chính vì thế mà nhà tỉ phú Ấn Độ Bhupendra Kuman Modi sau khi đọc Đường Xưa Mây Trắng đã nói với phóng viên tờ Hollywood Reporter: "Tôi tìm được Đường Xưa Mây Trắng từ hai năm nay, cuốn sách đã thay đổi đời tôi và nay đến lượt tôi phải chia sẻ hạnh phúc ấy với thế giới ".\n\nÔng đã quyết định tài trợ 120 triệu USD để các nhà làm sản xuất dựa theo Đường Xưa Mây Trắng dựng thành phim.\n\nTỉ phú Bhupendra Kuman Modi hy vọng bộ phim có thể được chọn chiếu ở Liên hoan phim Cannes 2008.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/duong-xua-may-trang.jpg?itok=Yohm9luU',
	N'',
	4
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Đi Xuyên Hà Nội',
	123000,
	N'Bảng lảng và trần trụi...\n\nTrong một thời gian dài bao cấp, ấn tượng về những trang báo thời sự là chúng khô khan, vắng bóng tính giải trí, và dường như sẽ nhanh chóng bị quên lãng trong các thư viện cũ kỹ. Những đã có một người chuyên tâm đi lục lại những trang thông tin hết thời ấy, chắp nối lại chúng và thổi hồn vào đấy thành những ghi chép khảo cứu sống động.\n\nĐó là Nguyễn Ngọc Tiến.\n\nCho đến giờ, những khảo cứu của anh về một Hà Nội qua chiều dài lịch sử đã thành thương hiệu trong làng văn. Đọc những trang viết từ nhiều cuốn sách được tập hợp qua nhiều năm tháng miệt mài làm việc, tập trung quanh câu chuyện về một mảnh đất nhiều thăng trầm, người ta có thể thấy Nguyễn Ngọc Tiến tựa như một sử nhân của Hà Nội.\n\nVấn đề mà Đi xuyên Hà Nội tiếp nối các cuốn sách trước của cùng tác giả chính là giá trị của những trang truyện - sử phong tục xã hội, điều các chính sử thường bỏ qua, đặc biệt cần thiết ở một đô thị hậu thuộc địa. Sự lựa chọn đề tài đa dạng, gần gũi đời sống thường nhật cũng làm nên sự sống động của cuốn sách. Tất cả dựng nên một cách tự nhiên chân dung một Hà Nội vừa tài hoa vừa xô bồ, cổ kính mà luôn đầy chất đương đại.\n\nKhả năng bao trùm các đề tài về nơi này của Nguyễn Ngọc Tiến tiếp tục khẳng định một điều: còn rất nhiều thứ của Hà Nội xứng đáng để các nhà văn viết thật hay.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/di-xuyen-ha-noi.jpg?itok=FWIj4hPB',
	N'',
	4
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Bí quyết hóa rồng - Lịch sử Singapore 1965 - 2000',
	200000,
	N'Tựa đề cuốn sách này biểu thị khát vọng của tất cả các nước đang phát triển, nhưng tiếc thay, cho đến nay, số thành đạt rất ít. Singapore là một trong số rất ít đó. Vì thế, hồi ký về những năm đầu thời kỳ độc lập được viết bởi người cha sáng lập đất nước này - ông Lý Quang Diệu - sẽ rất lý thú đối với nhân dân các nước đang phát triển và những ai quan tâm đến vận mệnh của đất nước họ. Câu chuyện được kể thẳng thắn bằng văn phong rất trong sáng và thú vị. Cuốn sách có sức thu hút kỳ lạ. (Trích lời của Kofi A.Annan, Tổng Thư ký Liên Hiệp Quốc).',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/bi-quyet-hoa-rong-lich-su-singapore.jpg?itok=x6x3WK74',
	N'',
	4
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Miếng ngon Hà Nội',
	140000,
	N'Văn học Việt Nam thời xưa có nhiều tác phẩm có giá trị to lớn về mặt nhân văn và nghệ thuật, đã được công nhận và chứng thực qua thời gian. Bộ sách Việt Nam danh tác bao gồm loạt tác phẩm đi cùng năm tháng như: Số đỏ (Vũ Trọng Phụng), Việc làng (Ngô Tất Tố), Gió đầu mùa, Hà Nội băm sáu phố phường (Thạch Lam), Miếng ngon Hà Nội (Vũ Bằng), Vang bóng một thời (Nguyễn Tuân). Hy vọng bộ sách sau khi tái bản sẽ giúp đông đảo tầng lớp độc giả thêm hiểu, tự hào và nâng niu kho tàng văn học nước nhà.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/mieng-ngon-ha-noi.jpg?itok=lhzvE37Y',
	N'',
	4
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Ba Chị Em Nhà Họ Tống',
	78000,
	N'Gia đình nhà họ Tống ảnh hưởng tới chánh sách của tổng thống Mỹ Roosevelt về Á Châu trong một thời gian khá lâu dài. Những người nhà họ Tống rất giỏi khoa giao tế, và biết cách mua chuộc các chính khách Hoa Kỳ.\n\nNgoài ra sự thành công của họ còn nhờ một phần lớn vào sự ủng hộ của Henry Luce, một nhà truyền giáo Mỹ rất có thế lực tại Trung Hoa. Các tạp chí Time và Life của Henry Luce đã tạo huyền thoại quanh gia đình nhà họ Tống, mô tả họ là những người yêu chuộng dân chủ, và là những anh hùng dân tộc của Trung Hoa.\n\nChúng ta hãy theo dõi cuộc đời của ba chị em nhà họ Tống, để xem họ đã đem lại vinh quang cho dòng họ nhà chồng và dòng họ Tống như thế nào, và ảnh hưởng của họ đối với chính trường Trung Hoa đầu thế kỷ 20 ra sao.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/3-chi-em-ho-tong.jpg?itok=Sw0dp-IK',
	N'',
	4
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Chết dưới tay Trung Quốc',
	89000,
	N'Có ai đã từng nghĩ những thứ đẹp đẽ, trong sáng như Mặt Trăng hay Ngôi Sao lại nhuốm đầy máu người dưới đêm khuya tĩnh lặng?!\nCó ai đã từng ngồi ngẩn ngơ mơ về một ngày mai tươi sáng, triển vọng của bản thân, ước mơ cao cả trong tương lai? Nếu có thì xin hãy cẩn thận, ước mơ như một nguồn suối ngon lành, ngọt ngất, có thể độc chết bạn đấy!\nCâu chuyện không quá rùng rợn, ma mị nhưng sẽ cố gắng hấp dẫn các độc giả vào thế giới của những điều kỳ bí!\nPhần 1 cũng như là quyển đầu sẽ theo chân các cảnh sát trong Tổ trọng án cao cấp lật tìm ra những bí ẩn khiến cả thế giới phải nghi hoặc, thượng cấp phải đóng hồ sơ lại! Từ những chuyện bình thường như giải cứu con tin lại vô tình phát hiện ra một chuyện kì lạ để từ đó rơi vào một thế giới mà bản thân chưa từng biết đến!\nTại sao những thứ tưởng chừng như giản đơn kia lại mang trong mình bí mật to lớn đến thế?\nCó lẽ Ma, Người và Thần Tiên đâu dễ dàng gì phân biệt?\nMa trong tim, thân là người, miệng lưỡi phun hoa sen!\n*Toàn bộ câu chuyện đều là hư cấu* Nguồn: Vnkings.com\n\nLịch đăng: 1, 2 tuần/chương\nNgoan (tác giả) muốn đem đến cho các bạn độc giả của mình những tác phẩm hay, giải trí nhưng hơn hết là vẽ nên một bức tranh toàn cảnh luôn canh cánh trong lòng Ngoan. Ngoan rất thích Stephen King và mong có thể trở thành một nhà văn như ông.\nXin lỗi vì sự chậm trễ của Ngoan nhưng mong mọi người thông cảm và luôn ủng hộ Ngoan hết mình nhé! Các bạn độc giả có thể gọi Ngoan là Tiểu L nha (bản thân thích tên này lắm, thấy cute cute sao ấy). Yêu mọi người!',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/chet-duoi-tay-trung-quoc.jpg?itok=AJJHf6u1',
	N'',
	4
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Thi Nhân Việt Nam',
	130000,
	N'Từ hơn nửa thế kỷ trước đây, phong trào Thơ mới đã có những đóng góp đáng kể vào sự phát triển của nền văn học trước Cách mạng tháng Tám của đất nước. Các thi sĩ của thuở ấy đã đem lại cho bạn đọc một tiếng nói mới, phản ánh khá trung thực tâm trạng của cả một lớp thanh niên tiểu tư sản trong cuộc sống có nhiều đau buồn, trăn trở và đôi khi bế tắc trước hiện trạng của đất nước thời bấy giờ. Với sự đổi mới mạnh mẽ của hình thức nghệ thuật, Thơ mới thật sự đã thu hút được sự chú ý của khá đông bạn đọc yêu thơ và đó cũng là một đóng góp có ý nghĩa vào sự phát triển của thể loại và chứng minh khả năng biểu đạt phong phú của tiếng Việt.\n\nNgay lúc bấy giờ, hai tác giả Hoài Thanh và Hoài Chân đã sớm nhận ra giá trị ấy và đã kịp thời sưu tầm, giới thiệu các thành tựu của phong trào Thơ mới qua tác phẩm Thi nhân Việt Nam và đã cho xuất bản vào đầu năm 1942.\n\nThi nhân Việt Nam là sự khám phá và đánh giá đầu tiên đối với Thơ mới. Chúng ta đều biết việc lựa chọn tác phẩm và tác giả đương thời, nhất là những người mới xuất hiện trên văn đàn, là một việc hết sức khó khăn, nhưng với sự cảm thụ khá sâu sắc và với cái nhìn tinh tế, các tác giả đã chọn được một chùm hoa giàu hương sắc trong vườn Thơ mới để gửi tặng những người yêu thơ. Chính vì thế, Thi nhân Việt Nam đã được bạn đọc cả nước đón nhận và tán thưởng.\n\nHơn nửa thế kỷ đã trôi qua, việc thẩm định lại những giá trị có thể có những thay đổi, nhưng để bảo đảm tính lịch sử của một tác phẩm đã xuất hiện trước đây, chúng tôi cho in nguyên văn của tác phẩm.\n\nNgoài ra, để giúp bạn đọc có thêm tư liệu tham khảo, sách có thêm phần Lời cuối sách của nhà văn Từ Sơn, trưởng nam của nhà văn Hoài Thanh.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/thi-nhan-viet-nam.jpg?itok=L87aLEr1',
	N'',
	4
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Thương Nhớ Mười Hai',
	175000,
	N'Trong số tác phẩm của Vũ Bằng, Thương Nhớ Mười Hai là tác phẩm đặc sắc nhất, tiêu biểu cho tình cảm và phong cách viết của ông. Tác phẩm được đặt bút từ Tháng Giêng 1960 và mất mười một năm mới hoàn thành vào năm 1971 với độ dày 250 trang.\n\nMười hai ở đây là mười hai tháng trong năm mà theo lời tác giả “mỗi tháng lại có những cái đẹp não nùng riêng, nỗi nhớ nhung riêng…”. Thông qua mười hai tháng ấy, Vũ Bằng đã gởi gắm những hồi ức đẹp đẽ của mình về Hà Nội, nơi chốn xa xôi ông luôn hướng về với những phong tục của người Bắc Việt, những thói quen sinh hoạt, những thú vui ẩm thực giản dị mà đầy tính nghệ thuật và trên tất cả là hình bóng người vợ đảm đang dịu hiền đang còn xa cách…\n\nThương nhớ mười haiThương nhớ mười haiNhân vật tôi ở miền Nam mà lòng luôn nhớ thương miền Bắc. Nỗi lòng ấy da diết và khắc khoải tựa thanh gỗ mục, bề ngoài đẹp đẽ mà bên trong đã rệu nát tự bao giờ. Ông biết thế là bất công nhưng tình yêu mà, đã yêu thì bao giờ người mình yêu cũng là đẹp nhất. Ông còn thầm cảm ơn sự bất công ấy bởi nó đã cho ông nhận ra mình yêu Bắc Việt đến dường nào…mà càng yêu thì lại càng nhớ…',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/thuong-nho-muoi-hai.gif?itok=htmcF7fZ',
	N'',
	4
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Phụng Vũ Trần Triều',
	167000,
	N'Lịch sử nhà Trần vốn dĩ có nhiều sóng gió, đặc biệt là chốn cung cấm đầy rẫy mưu mô. Bộ truyện sẽ theo chân cháu gái của Hưng Đạo Đại Vương, kể từ lúc nàng nhập cung cho đến khi trở thành Hoàng hậu.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/c1dabfc2-e431-4b6a-8aca-1b7bfb561cf0.png?itok=DIL7Dlwa',
	N'',
	5
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Cuộc Bắc phạt thần thánh của Lý Thường Kiệt
',
	50000,
	N'Báo điện tử Một Thế Giới xin giới thiệu loạt bài về chống ngoại xâm phương Bắc và bắt đầu về cuộc chiến thần thánh phạt Tống của Lý Thường Kiệt.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/ly-thuong-kiet.jpg?itok=f-gycQM0',
	N'',
	5
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Những nhà quân sự nổi tiếng thế giới',
	187000,
	N'Ngày 19/5/1999, tại Royal Albert Hall, London, Lạt ma 14 - lãnh tụ tinh thần Tây Tạng đã có buổi nói chuyên sâu sắc về đạo đức cho thiên niên kỷ mới trước rất đông khán thính giả, trong đó ông - người yêu hòa bình có lẽ hàng đầu nhân loại đã dành những lời sau về chiến tranh: "... Tôi nghĩ đó (chiến tranh) là những quan niệm lỗi thời. Ngày xưa quyền lợi các quốc gia còn có tính cách độc lập riêng rẽ, các cộng đồng như làng xóm đều có thể tự túc. Trong khung cảnh đó quan niệm về chiến tranh, về quân đội còn có nghĩa lý: nếu bên ta thắng trận thì bên địch phải thua.\n\nNhưng ngày nay, tình trạng đó đã thay đổi hoàn toàn. Không chỉ các làng xóm mà ngay cả quốc gia hay đại lục, cũng không còn độc lập nhiều, nhất là về kinh tế. Trong hoàn cảnh đó, khi tiêu diệt hàng xóm của bạn là bạn tự tiêu diệt. Vậy nên tôi cho rằng lối suy nghĩ và chính sách xưa cũ nay đã lỗi thời..."\n\nThật sự như vậy, dễ dàng nhận ra rằng chiến tranh đã đồng hành với nhân loại chúng ta trong suốt chiều dài lịch sử như là một người bạn đường bất đắc dĩ! Ngày nay tư tưởng về chiến tranh đã là tư tưởng lạc hậu cần bài bác triệt để, nhưng thật khó để nói điều đó trong những hoàn cảnh lịch sử nhất định trước đây, khi con người ta sinh ra lớn lên trong tinh thần chiến tranh mãnh liệt, giống như một người tướng của Napoleon từng tuyên bố: "Ba mươi tuổi mà chưa chết thì chưa phải là tướng!"\n\nCuốn sách này ra đời với mong muốn tóm lược cuộc đời của những nhân vật quân sự lớn trong hàng ngàn năm đau thương đó của nhân loại, với sự đa dạng về tính cách và số phận của những con người vĩ đại lại chỉ được tóm tắt trong sự hiểu biết hạn hẹp của người viết thì sẽ không thể tránh khỏi những sai sót, rất mong nhận được sự thông cảm của người đọc.\n\nMột niềm vui lớn của bất kỳ người viết sử nào đó chính là được vinh dự kể cho bạn đọc nghe về quá khứ hàng ngàn năm của nhân loại.\n\nBên cạnh đó, khi bạn lần giở cuốn sách này để đi theo dòng thời gian, từ Hannibal Barca cho tới khi khép lại quyển sách với người anh hùng gần chúng ta nhất là đại tướng Võ Nguyên Giáp, nếu độc giả thấy lời nào ca ngợi những người anh hùng của một thời xa cũ, và giá như từ đó bạn có thể nhận ra giá trị mà mình đang có để hát lên những lời ca khác ngợi ca hòa bình của thời đại chúng ta, thì niềm vui khi ấy của người viết sử chúng tôi sẽ là trọn vẹn.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/unnamed.jpg?itok=dJtu6fW0',
	N'',
	5
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Điệp viên hoàn hảo X6: Phạm Xuân Ẩn',
	79000,
	N'Phạm Xuân Ẩn (sinh ngày 12/9/1927, mất ngày 20/9/2006) tham gia hoạt động cách mạng từ đầu thập niên 1950, năm 1953 được kết nạp Đảng và được giao nhiệm vụ hoạt động điệp báo. Nhằm tạo vỏ bọc tốt hơn để có thể thâm nhập sâu hơn vào giới chức chính quyền và quân đội Sài Gòn, năm 1957 ông được cấp trên bố trí cho sang Mỹ học ngành báo chí. Năm 1959, Phạm Xuân Ẩn về nước, làm việc cho Hãng tin Reuters và sau đó là tạp chí hàng đầu Time, New York Herald Tribune của Mỹ. Với kiến thức uyên bác, hiểu biết rộng, cương trực và tài năng giao tiếp, ngoại giao khác biệt, độc đáo theo kiểu lãng tử, hào hoa, ngang tàng, “chửi thề như bắp rang”, xuất hiện với phong cách thượng lưu, thừa hưởng văn hóa được đào tạo chính qui từ Mỹ, ông đã thâm nhập và là bạn tri kỷ với các tướng lĩnh, trùm an ninh mật vụ cả Mỹ và Sài Gòn, giới báo chí Việt Nam Cộng Hòa và Mỹ cũng như các chính khách chóp bu của chính quyền Sài Gòn để khai thác những thông tin tuyệt mật mang tầm chiến lược cho cuộc đối đầu của Bắc Việt Nam với Mỹ và chính quyền Sài Gòn. Cuộc đời hoạt động tình báo đầy ly kỳ hấp dẫn nhưng cũng vô cùng hiểm nguy của Phạm Xuân Ẩn với bí danh X6 thuộc cụm tình báo H63 được thể hiện một cách trung thực, sinh động trong cuốn Điệp viên hoàn hảo X6 được bổ sung cập nhật mới.\n\nSau 6 năm, cuốn sách với những thông tin có giá trị lịch sử giờ đây lại được ra mắt bạn đọc qua một bản dịch đầy đủ và cập nhật nhiều thông tin chưa từng được công bố do chính Phạm Xuân Ẩn tiết lộ với tác giả Larry Berman có ghi âm. Với lời hứa chỉ được công bố những thông tin này từng giai đoạn sau khi Phạm Xuân Ẩn mất, Larry Berman đã mất 6 năm để cân nhắc để từng bước công bố thông tin của người đã khuất.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/diep-vien-hoan-hao.gif?itok=K5ljk0ae',
	N'',
	5
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Lê Vân - Yêu và sống',
	80000,
	N'Tôi đã sống một cuộc đời thường có cả điều đúng, có cả điều sai, có cả những đau khổ tự chuốc lấy trong khi đó tôi cũng trút đau khổ lên không ít người khác. Tôi có cả mọi tuổi thơ cay đắng mà không biết đỗ lỗi cho ai. Tôi từng có thể muốn gì được nấy, những thứ mà bất cứ người bình thường nào cũng đều thèm khát. Và ngược lại, tôi cũng phải đối mặt với biết bao sự ê chề trong đó có cả tôi, có cả do người khác gây ra cho tôi. Tóm lại tôi chẳng việc gì phải dựng nên những thứ mà tự nó đã chặt kín trong cuộc đời mình rồi. Nhưng nếu vẫn có ai đó không tin mục đích của tôi khi chấp nhận có cuốn sách này, thì tôi cũng không hề vì thế mà thiếu tôn trọng họ. Chúng ta được đào luyện trong một môi trường mà lòng thành thật không phải lúc nào cũng được đặt ở những vị trí xứng đáng.\n\nĐôi khi tôi lại nghĩ, hình như mình đang " vạch áo cho người xem lưng ".... Tại sao tôi lại phải cứ làm cho những người thân của mình đau lòng? Nhưng hoá ra người đau lòng nhất lại chính là tôi. Giờ đây thì mọi việc đã không thể nào dừng lại được. Thôi thì ai muốn nghĩ gì về tôi là quyền của họ. Tôi chấp nhận cả sự nguyền rủa. Bời vì nếu cuốn sách này trở thành nguyên nhân của những hiểu lầm có thể xảy ra, thì nó cũng đồng thời là một cơ hội để cho tôi tự thanh tẩy tâm hồn mình. Mục đích lớn nhất của tôi là sám hối mặc dù tôi biết không phải mọi sự sám hối đều được tha thứ. Tôi muốn tự trừng phạt mình thay cho một sự trừng phạt từ trên cao sớm muộn rồi cũng giáng xuống...',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/le-van-yeu-va-song.jpg?itok=OgmJ03ax',
	N'',
	5
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Hồi ký Phạm Duy',
	91000,
	N'Phạm Duy (sinh ngày 5 tháng 10 năm 1921) tên thật Phạm Duy Cẩn là một nhạc sĩ, ca sĩ, nhà nghiên cứu nhạc của Việt Nam. Ông được coi là một trong những nhạc sĩ lớn của nền tân nhạc với số lượng sáng tác đồ sộ và đa dạng về thể loại, trong đó có những bài đã trở nên rất quen thuộc với người Việt. Ngoài sáng tác, Phạm Duy còn có nhiều công trình khảo cứu về âm nhạc Việt Nam có giá trị. Ông cũng từng giữ chức giáo sư nhạc ngữ tại trường Quốc gia Âm nhạc Sài Gòn. Mặc dù vậy, các quan điểm nhìn nhận về Phạm Duy còn gây nhiều tranh cãi.\n\nKhởi sự đời nhạc trong gánh hát Đức Huy với vai trò ca sĩ hát lưu động. Từng tham gia kháng chiến chống Pháp một thời gian trước khi vào miền Nam để tiếp tục tự do hoạt động âm nhạc. Phạm Duy là một tên tuổi lớn và đầy ảnh hưởng tại miền Nam Việt Nam với những hoạt động tích cực giành cho cả âm nhạc lẫn chính trị, cho đến sau sự kiện 30 tháng 4 năm 1975, khi ông vượt biên sang Hoa Kỳ. Thời kì ở miền Nam và một thời gian dài sau 1975, ông có quan điểm chống Cộng mạnh mẽ thể hiện qua nhiều sáng tác và bình luận, điều đó khiến ông bị phe Cộng Sản phê phán gắt gao. Trong suốt ba mươi năm từ 1975 đến 2005, Phạm Duy bị nhà nước Việt Nam cấm đoán về nhân thân, những ca khúc của ông bị liệt vào loại nhạc quốc cấm. Tuy nhiên tại cộng đồng người Việt hải ngoại, nhạc của ông vẫn được phổ biến rộng rãi.\n\nNăm 2005, ông về Việt Nam định cư và một số ca khúc của ông mới bắt đầu được cho phép phổ biến. Tính cho đến nay, có hơn 50 ca khúc trong số hàng nghìn sáng tác của Phạm Duy được cấp phép.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/pham-duy.jpg?itok=jCIjCu70',
	N'',
	5
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Em phải đến Harvard học kinh tế',
	125000,
	N'Em phải đến Harvard học kinh tế là cuốn sách tường thuật và tổng kết lại những kinh nghiệm nuôi dạy con cái từ lúc lọt lòng cho đến khi thành tài của Lưu Vệ Hoa và Trương Hân Vũ, mẹ và cha dượng của cô bé Lưu Diệc Đình - “cô gái Harvard” - thần tượng học tập của giới trẻ Trung Quốc. Sau khi xuất bản, cuốn cẩm nang này đã giữ ngôi vị best-seller trong suốt 16 tháng liên tục, lượng xuất bản lên tới gần 3 triệu bản, nhận được hưởng ứng tích cực chưa từng thấy từ các bậc phụ huynh. \n\nNhân vật chính của cuốn sách - Lưu Diệc Đình, năm 1996 thi đỗ vào trường trung học ngoại ngữ Thành Đô sau một cuộc cạnh tranh khốc liệt. Sau vô số những nỗ lực tích cực và thành tích xuất sắc, đến năm 1999 đã nhận được giấy báo nhập học và học bổng toàn phần của bốn trường Đại học tại Hoa Kỳ, trong đó có Harvard. Sau đó, cô theo học chuyên ngành Kinh tế học và Toán ứng dụng tại Harvard, tháng 6 năm 2003 tốt nghiệp, vào làm việc trong tập đoàn tư vấn Boston (Boston Consulting Group) nổi tiếng. Hiện cô định cư tại Mỹ.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/em-phai-den-harvard-hoc-kinh-te.gif?itok=58a2BmGQ',
	N'',
	5
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Sử ký Tư Mã Thiên',
	170000,
	N'Sử ký là bộ thông sử đầu tiên của Trung Quốc cổ đại. Bộ sử ký lưu giữ, chỉnh lí lại các tư liệu lịch sử vô cùng phong phú trong hơn ba ngàn năm từ thời Ngũ đế vốn có trước sử cho tới giữa thời Tây Hán.\n\nẤn bản này với hình thức mới mẻ, toàn diện, góc nhìn mới, đa tầng, giúp bạn đọc hiểu rõ hơn nguyên tác. Cuốn sách còn có phần phụ như giải thích, dịch nghĩa bằng câu từ tinh tế giúp bạn đọc thưởng thức trọn vẹn nội dung tác phẩm.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/su-ky-tu-ma-thien.gif?itok=v3XAJeRi',
	N'',
	5
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Chung Vô Diệm',
	91000,
	N'Một hôm, Tuyên Vương đang uống rượu giữa bầy cung nga xinh đẹp, vui chơi ở Tiệm Đài. Chung vô Diệm xin vào yết kiến, tự xưng là người con gái không lấy được chồng của nước Tề, nghe nói Tề Vương là người hiền minh, xin vào hậu cung lo việc quét tước cho vua. Các cung nữ nghe xong bụm miệng cười, Tuyên Vương nghe tâu cũng tức cười nhưng vì lòng hiếu kỳ, ra lệnh cho vào yết kiến. Tuyên Vương hỏi: "Xú phụ! Ngươi sao không chịu ở yên nơi quê hương mà tự tiến tới vua phải chăng ngươi có tài nghệ cao kì?". Vô Diệm đáp: "Không dám nói kì tài cao nghệ, chỉ học được thuật ẩn hình, xin vì đại vương hiến chút nghề mọn để giúp vui". Nói xong liền ẩn mình, không ai thấy nữa.\n\nHôm sau Triệu Vương lại triệu đến làm trò. Vô Diệm không nói, chỉ trừng mắt, cắn răng, giơ tay, vỗ gối... làm 4 động tác và kêu liên tiếp 4 tiếng "hiểm". Tuyên Vương hỏi ý nghĩa ra sao? Vô Diệm nói rằng: "Nay nước Tề có sự uy hiếp của Tần ở phía Tây, Sở phía Nam, đó là nguy hiểm thứ nhất. Đại vương làm nhọc sức dân, hao tốn tiền của, lập Tiệm đài hoa lệ, đó là điều nguy hiểm thứ hai. Trong triều thì biếm người hiền, dùng kẻ nịnh, đó là điều nguy hiểm thứ ba. Đấng quân vương đam mê tửu sắc, không sửa sang chính trị trong nước, đó là điều nguy hiểm thứ tư. Thiếp trừng mắt vì đại vương xét cái biến phong hoả, cắn răng là thay đại vương trừng trị cái miệng chống can gián, giơ tay là vì đại vương đuổi kẻ bề tôi xàm nịnh, vỗ gối là xin đại vương dẹp bỏ cái đài ăn chơi."\n\nTề Tuyên Vương nhận lời can gián, từ đó bỏ yến nhạc, phá Tiệm đài, trừ tôi nịnh, làm cho binh mã mạnh, kho lẫm đầy... lập Chung Vô Diệm làm Vương hậu, và với sự phụ tá của bà, nước Tề trở nên cường thịnh.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/chung_vo_diem_to_chan.jpg?itok=mm5zMHr2',
	N'',
	5
)
Insert into Books([Name], Price, Review, RatePoint, Picture, Chapter,CategoryID)
values(
	N'Nỗi buồn chiến tranh',
	49000,
	N'Tác phẩm là dòng hồi ức của người lính về chiến tranh và thời tuổi trẻ đã trải qua trong bom đạn. Đó là lòng tiếc thương vô hạn đối với những người cùng thế hệ với mình đã nằm xuống, là ám ảnh về thân phận con người trong thời buổi loạn ly, và thông qua thân phận là sự tái hiện đầy xót xa  về quá khứ, những suy tư nghiền ngẫm về con đường dấn thân của cả một thế hệ sinh ra trong chiến tranh. Bao trùm lên tất cả, là nỗi buồn sâu xa gắn với từng mảnh đời riêng. Tác phẩm đã bước ra khỏi lối mòn về lòng tự hào dân tộc cùng những chiến công và vinh quang tập thể để nêu lên thông điệp về sự ghê tởm, về tính chất hủy diệt của chiến tranh đối với con người.\n\nVào thời điểm ra đời cuối thập niên 1980, “Nỗi buồn chiến tranh” có thể  được xem là tác phẩm văn học Việt Nam hiện đại đầu tiên viết về chiến tranh có cái nhìn khác với quan niệm truyền thống, khẳng định mạnh mẽ vai trò cá nhân trong xã hội, quyền sống, hạnh phúc và đau khổ của con người với tư cách một cá thể độc lập. Tiểu thuyết nhận được giải thưởng Hội Nhà văn Việt Nam năm 1991.',
	0,
	N'https://gacsach.club/sites/default/files/styles/book310/public/noi-buon-chien-tranh.jpg?itok=Or0gs5uX',
	N'',
	5
)

Insert into AuthorBooks(AuthorID, BookID) Values(1,1)
Insert into AuthorBooks(AuthorID, BookID) Values(2,2)
Insert into AuthorBooks(AuthorID, BookID) Values(1,3)
Insert into AuthorBooks(AuthorID, BookID) Values(1,4)
Insert into AuthorBooks(AuthorID, BookID) Values(3,5)
Insert into AuthorBooks(AuthorID, BookID) Values(4,6)
Insert into AuthorBooks(AuthorID, BookID) Values(5,6)
Insert into AuthorBooks(AuthorID, BookID) Values(1,8)
Insert into AuthorBooks(AuthorID, BookID) Values(6,9)
Insert into AuthorBooks(AuthorID, BookID) Values(7,10)
Insert into AuthorBooks(AuthorID, BookID) Values(8,11)
Insert into AuthorBooks(AuthorID, BookID) Values(9,12)
Insert into AuthorBooks(AuthorID, BookID) Values(9,13)
Insert into AuthorBooks(AuthorID, BookID) Values(10,14)
Insert into AuthorBooks(AuthorID, BookID) Values(11,15)
Insert into AuthorBooks(AuthorID, BookID) Values(12,16)
Insert into AuthorBooks(AuthorID, BookID) Values(13,17)
Insert into AuthorBooks(AuthorID, BookID) Values(14,18)
Insert into AuthorBooks(AuthorID, BookID) Values(15,19)
Insert into AuthorBooks(AuthorID, BookID) Values(15,20)
Insert into AuthorBooks(AuthorID, BookID) Values(16,21)
Insert into AuthorBooks(AuthorID, BookID) Values(16,22)
Insert into AuthorBooks(AuthorID, BookID) Values(17,23)
Insert into AuthorBooks(AuthorID, BookID) Values(18,24)
Insert into AuthorBooks(AuthorID, BookID) Values(19,25)
Insert into AuthorBooks(AuthorID, BookID) Values(20,26)
Insert into AuthorBooks(AuthorID, BookID) Values(21,27)
Insert into AuthorBooks(AuthorID, BookID) Values(22,28)
Insert into AuthorBooks(AuthorID, BookID) Values(23,28)
Insert into AuthorBooks(AuthorID, BookID) Values(24,29)
Insert into AuthorBooks(AuthorID, BookID) Values(25,30)
Insert into AuthorBooks(AuthorID, BookID) Values(26,31)
Insert into AuthorBooks(AuthorID, BookID) Values(27,32)
Insert into AuthorBooks(AuthorID, BookID) Values(28,33)
Insert into AuthorBooks(AuthorID, BookID) Values(29,34)
Insert into AuthorBooks(AuthorID, BookID) Values(30,35)
Insert into AuthorBooks(AuthorID, BookID) Values(31,36)
Insert into AuthorBooks(AuthorID, BookID) Values(32,37)
Insert into AuthorBooks(AuthorID, BookID) Values(33,38)
Insert into AuthorBooks(AuthorID, BookID) Values(34,39)
Insert into AuthorBooks(AuthorID, BookID) Values(35,39)
Insert into AuthorBooks(AuthorID, BookID) Values(31,40)
Insert into AuthorBooks(AuthorID, BookID) Values(36,41)
Insert into AuthorBooks(AuthorID, BookID) Values(37,42)
Insert into AuthorBooks(AuthorID, BookID) Values(38,43)
Insert into AuthorBooks(AuthorID, BookID) Values(39,44)
Insert into AuthorBooks(AuthorID, BookID) Values(40,45)
Insert into AuthorBooks(AuthorID, BookID) Values(41,46)
Insert into AuthorBooks(AuthorID, BookID) Values(42,47)
Insert into AuthorBooks(AuthorID, BookID) Values(43,47)
Insert into AuthorBooks(AuthorID, BookID) Values(44,48)
Insert into AuthorBooks(AuthorID, BookID) Values(45,49)
Insert into AuthorBooks(AuthorID, BookID) Values(46,50)

Insert Into Roles([Name]) values(N'Admin')
Insert Into Roles([Name]) values(N'User')

Insert into Users([Name],Avatar,Username,[Password],PhoneNumber,RoleID)
Values(N'Admin',N'https://i.pinimg.com/474x/69/c2/65/69c26502e38c4212af37f20219102a20.jpg',N'admin',N'AQAAAAEAACcQAAAAECw02FxnVt2GPRMD6JPwA4qfxfk5gMgEx8W/Kf8oecAVeLLyHKGnAu4yiI7/Q3njHQ==',N'0945615475',1)
Insert into Users([Name],Avatar,Username,[Password],PhoneNumber,RoleID)
Values(N'User',N'https://i.imgflip.com/1adauc.jpg?a458760',N'user',N'AQAAAAEAACcQAAAAECw02FxnVt2GPRMD6JPwA4qfxfk5gMgEx8W/Kf8oecAVeLLyHKGnAu4yiI7/Q3njHQ==',N'0125478958',2)


Insert into Catalogs([Name]) Values (N'Thịnh hành')
Insert into Catalogs([Name]) Values (N'Bán chạy')
Insert into Catalogs([Name]) Values (N'Mới nhất')
Insert into Catalogs([Name]) Values (N'Miễn phí')

Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 1)
Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 2)
Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 3)
Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 4)
Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 5)
Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 6)
Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 7)
Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 8)
Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 9)
Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 10)
Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 11)
Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 12)
Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 13)
Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 14)
Insert into CatalogBooks([CatalogID], [BookID]) Values (4, 15)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 16)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 17)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 18)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 19)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 20)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 21)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 22)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 23)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 24)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 25)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 26)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 27)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 28)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 29)
Insert into CatalogBooks([CatalogID], [BookID]) Values (1, 30)
Insert into CatalogBooks([CatalogID], [BookID]) Values (2, 31)
Insert into CatalogBooks([CatalogID], [BookID]) Values (2, 32)
Insert into CatalogBooks([CatalogID], [BookID]) Values (2, 33)
Insert into CatalogBooks([CatalogID], [BookID]) Values (2, 34)
Insert into CatalogBooks([CatalogID], [BookID]) Values (2, 35)
Insert into CatalogBooks([CatalogID], [BookID]) Values (2, 36)
Insert into CatalogBooks([CatalogID], [BookID]) Values (2, 37)
Insert into CatalogBooks([CatalogID], [BookID]) Values (2, 38)
Insert into CatalogBooks([CatalogID], [BookID]) Values (2, 39)
Insert into CatalogBooks([CatalogID], [BookID]) Values (2, 40)
Insert into CatalogBooks([CatalogID], [BookID]) Values (3, 41)
Insert into CatalogBooks([CatalogID], [BookID]) Values (3, 42)
Insert into CatalogBooks([CatalogID], [BookID]) Values (3, 43)
Insert into CatalogBooks([CatalogID], [BookID]) Values (3, 44)
Insert into CatalogBooks([CatalogID], [BookID]) Values (3, 45)
Insert into CatalogBooks([CatalogID], [BookID]) Values (3, 46)
Insert into CatalogBooks([CatalogID], [BookID]) Values (3, 47)
Insert into CatalogBooks([CatalogID], [BookID]) Values (3, 48)
Insert into CatalogBooks([CatalogID], [BookID]) Values (3, 49)
Insert into CatalogBooks([CatalogID], [BookID]) Values (3, 50)