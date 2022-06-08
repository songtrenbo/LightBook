import { HttpClient, HttpParams } from '@angular/common/http';
import { EventEmitter, Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Book } from '../models/book.model';
import { Author } from '../models/author.model';
import { Category } from 'src/models/category.model';
const baseURL = 'https://localhost:44379/api/Book';
@Injectable({
  providedIn: 'root',
})
export class BookService {
  recipeSelected = new EventEmitter<Book>();
  private categories: Category[] = [
    new Category(
      1,
      "Văn học"
    ),
    
    new Category(
      2,
      "Kinh dị"
    ),
    
    new Category(
      3,
      "Ngôn tình"
    )
  ];
  private books: Book[] = [
    new Book(
      1,
      'Cho Tôi Xin Một Vé Đi Tuổi Thơ',
      700000,
      'Truyện Cho tôi xin một vé đi tuổi thơ là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.',
      1,
      'https://gacsach.club/sites/default/files/styles/book310/public/cho-toi-mot-ve-di-tuoi-tho.jpg?itok=0RW_HSAW',
      '\r\n\t\t"chapters":[\r\n\t\t\t{\r\n\t\t\t\t"chuong": "1", \r\n\t\t\t\t"tenChuong": "",\r\n\t\t\t\t"noiDung": "Tiếng lưỡi dao xuyên vào da thịt... rợn người\\n\\nTiếng máu... rít lên... loang ra... đỏ thẫm...\\n\\nTiếng mưa...\\n\\nMưa!\\n\\nÀo ào...\\n\\nXối xả...\\n\\nTrắng xóa...\\n\\nHòa vào vị máu tanh nồng...\\n\\nThành phố Fensisco, 2 giờ sáng.\\n\\nTóc tách... tóc tách... tách... tách...\\n\\nTiếng nước mưa rơi đều trên sàn hành lang... Dãy hành lang rộng, dài hun hút... u ám và đâu đây nghe như đẫm mùi máu tươi...\\n\\nDọc hai bên hành lang là hai hàng vệ sĩ mặc vest đen, đeo kính đen cúi rạp cả xuống. một người đàn ông trung niên cao to vẻ đầy quyền lực tiến vào, những bước chân chậm rãi, dứt khoát, uy nghiêm. Đằng sau ông ta là một cô bé chừng mười bốn, mười lăm tuổi với mái tóc dài ướt nhẹp nước mưa xõa xuống, chiếc váy trắng lết trên nền ướt sũng. cô bé co rúm người vì lạnh... đôi mắt long lanh tội nghiệp cúi gằm xuống, bàn chân bé nhỏ khe khẽ bước...\\n\\nNgười đàn ông dẫn cô bé vào một căn phòng khách rộng thênh, được trang hoàng không khác gì nơi ở của một vị vua sa hoa. Đèn sáng trưng nhưng vẫn có cảm giác lạnh lẽo, đáng sợ. Lạ lẫm, cô bé cũng chẳng dám liếc nhìn thứ gì',
      1,
      [new Author('Nguyễn Nhật Ánh'), new Author('Chi Chan')]
    ),
    new Book(
      1,
      'Cho Tôi Xin Một Vé Đi Tuổi Thơ',
      700000,
      'Truyện Cho tôi xin một vé đi tuổi thơ là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.',
      1,
      'https://gacsach.club/sites/default/files/styles/book310/public/cho-toi-mot-ve-di-tuoi-tho.jpg?itok=0RW_HSAW',
      '\r\n\t\t"chapters":[\r\n\t\t\t{\r\n\t\t\t\t"chuong": "1", \r\n\t\t\t\t"tenChuong": "",\r\n\t\t\t\t"noiDung": "Tiếng lưỡi dao xuyên vào da thịt... rợn người\\n\\nTiếng máu... rít lên... loang ra... đỏ thẫm...\\n\\nTiếng mưa...\\n\\nMưa!\\n\\nÀo ào...\\n\\nXối xả...\\n\\nTrắng xóa...\\n\\nHòa vào vị máu tanh nồng...\\n\\nThành phố Fensisco, 2 giờ sáng.\\n\\nTóc tách... tóc tách... tách... tách...\\n\\nTiếng nước mưa rơi đều trên sàn hành lang... Dãy hành lang rộng, dài hun hút... u ám và đâu đây nghe như đẫm mùi máu tươi...\\n\\nDọc hai bên hành lang là hai hàng vệ sĩ mặc vest đen, đeo kính đen cúi rạp cả xuống. một người đàn ông trung niên cao to vẻ đầy quyền lực tiến vào, những bước chân chậm rãi, dứt khoát, uy nghiêm. Đằng sau ông ta là một cô bé chừng mười bốn, mười lăm tuổi với mái tóc dài ướt nhẹp nước mưa xõa xuống, chiếc váy trắng lết trên nền ướt sũng. cô bé co rúm người vì lạnh... đôi mắt long lanh tội nghiệp cúi gằm xuống, bàn chân bé nhỏ khe khẽ bước...\\n\\nNgười đàn ông dẫn cô bé vào một căn phòng khách rộng thênh, được trang hoàng không khác gì nơi ở của một vị vua sa hoa. Đèn sáng trưng nhưng vẫn có cảm giác lạnh lẽo, đáng sợ. Lạ lẫm, cô bé cũng chẳng dám liếc nhìn thứ gì',
      1,
      [new Author('Nguyễn Nhật Ánh'), new Author('Chi Chan')]
    ),
    new Book(
      1,
      'Cho Tôi Xin Một Vé Đi Tuổi Thơ',
      700000,
      'Truyện Cho tôi xin một vé đi tuổi thơ là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.',
      1,
      'https://gacsach.club/sites/default/files/styles/book310/public/cho-toi-mot-ve-di-tuoi-tho.jpg?itok=0RW_HSAW',
      '\r\n\t\t"chapters":[\r\n\t\t\t{\r\n\t\t\t\t"chuong": "1", \r\n\t\t\t\t"tenChuong": "",\r\n\t\t\t\t"noiDung": "Tiếng lưỡi dao xuyên vào da thịt... rợn người\\n\\nTiếng máu... rít lên... loang ra... đỏ thẫm...\\n\\nTiếng mưa...\\n\\nMưa!\\n\\nÀo ào...\\n\\nXối xả...\\n\\nTrắng xóa...\\n\\nHòa vào vị máu tanh nồng...\\n\\nThành phố Fensisco, 2 giờ sáng.\\n\\nTóc tách... tóc tách... tách... tách...\\n\\nTiếng nước mưa rơi đều trên sàn hành lang... Dãy hành lang rộng, dài hun hút... u ám và đâu đây nghe như đẫm mùi máu tươi...\\n\\nDọc hai bên hành lang là hai hàng vệ sĩ mặc vest đen, đeo kính đen cúi rạp cả xuống. một người đàn ông trung niên cao to vẻ đầy quyền lực tiến vào, những bước chân chậm rãi, dứt khoát, uy nghiêm. Đằng sau ông ta là một cô bé chừng mười bốn, mười lăm tuổi với mái tóc dài ướt nhẹp nước mưa xõa xuống, chiếc váy trắng lết trên nền ướt sũng. cô bé co rúm người vì lạnh... đôi mắt long lanh tội nghiệp cúi gằm xuống, bàn chân bé nhỏ khe khẽ bước...\\n\\nNgười đàn ông dẫn cô bé vào một căn phòng khách rộng thênh, được trang hoàng không khác gì nơi ở của một vị vua sa hoa. Đèn sáng trưng nhưng vẫn có cảm giác lạnh lẽo, đáng sợ. Lạ lẫm, cô bé cũng chẳng dám liếc nhìn thứ gì',
      1,
      [new Author('Nguyễn Nhật Ánh'), new Author('Chi Chan')]
    ),
    new Book(
      1,
      'Cho Tôi Xin Một Vé Đi Tuổi Thơ',
      700000,
      'Truyện Cho tôi xin một vé đi tuổi thơ là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.',
      1,
      'https://gacsach.club/sites/default/files/styles/book310/public/cho-toi-mot-ve-di-tuoi-tho.jpg?itok=0RW_HSAW',
      '\r\n\t\t"chapters":[\r\n\t\t\t{\r\n\t\t\t\t"chuong": "1", \r\n\t\t\t\t"tenChuong": "",\r\n\t\t\t\t"noiDung": "Tiếng lưỡi dao xuyên vào da thịt... rợn người\\n\\nTiếng máu... rít lên... loang ra... đỏ thẫm...\\n\\nTiếng mưa...\\n\\nMưa!\\n\\nÀo ào...\\n\\nXối xả...\\n\\nTrắng xóa...\\n\\nHòa vào vị máu tanh nồng...\\n\\nThành phố Fensisco, 2 giờ sáng.\\n\\nTóc tách... tóc tách... tách... tách...\\n\\nTiếng nước mưa rơi đều trên sàn hành lang... Dãy hành lang rộng, dài hun hút... u ám và đâu đây nghe như đẫm mùi máu tươi...\\n\\nDọc hai bên hành lang là hai hàng vệ sĩ mặc vest đen, đeo kính đen cúi rạp cả xuống. một người đàn ông trung niên cao to vẻ đầy quyền lực tiến vào, những bước chân chậm rãi, dứt khoát, uy nghiêm. Đằng sau ông ta là một cô bé chừng mười bốn, mười lăm tuổi với mái tóc dài ướt nhẹp nước mưa xõa xuống, chiếc váy trắng lết trên nền ướt sũng. cô bé co rúm người vì lạnh... đôi mắt long lanh tội nghiệp cúi gằm xuống, bàn chân bé nhỏ khe khẽ bước...\\n\\nNgười đàn ông dẫn cô bé vào một căn phòng khách rộng thênh, được trang hoàng không khác gì nơi ở của một vị vua sa hoa. Đèn sáng trưng nhưng vẫn có cảm giác lạnh lẽo, đáng sợ. Lạ lẫm, cô bé cũng chẳng dám liếc nhìn thứ gì',
      2,
      [new Author('Nguyễn Nhật Ánh'), new Author('Chi Chan')]
    ),
    new Book(
      1,
      'Cho Tôi Xin Một Vé Đi Tuổi Thơ',
      0,
      'Truyện Cho tôi xin một vé đi tuổi thơ là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.',
      1,
      'https://gacsach.club/sites/default/files/styles/book310/public/cho-toi-mot-ve-di-tuoi-tho.jpg?itok=0RW_HSAW',
      '\r\n\t\t"chapters":[\r\n\t\t\t{\r\n\t\t\t\t"chuong": "1", \r\n\t\t\t\t"tenChuong": "",\r\n\t\t\t\t"noiDung": "Tiếng lưỡi dao xuyên vào da thịt... rợn người\\n\\nTiếng máu... rít lên... loang ra... đỏ thẫm...\\n\\nTiếng mưa...\\n\\nMưa!\\n\\nÀo ào...\\n\\nXối xả...\\n\\nTrắng xóa...\\n\\nHòa vào vị máu tanh nồng...\\n\\nThành phố Fensisco, 2 giờ sáng.\\n\\nTóc tách... tóc tách... tách... tách...\\n\\nTiếng nước mưa rơi đều trên sàn hành lang... Dãy hành lang rộng, dài hun hút... u ám và đâu đây nghe như đẫm mùi máu tươi...\\n\\nDọc hai bên hành lang là hai hàng vệ sĩ mặc vest đen, đeo kính đen cúi rạp cả xuống. một người đàn ông trung niên cao to vẻ đầy quyền lực tiến vào, những bước chân chậm rãi, dứt khoát, uy nghiêm. Đằng sau ông ta là một cô bé chừng mười bốn, mười lăm tuổi với mái tóc dài ướt nhẹp nước mưa xõa xuống, chiếc váy trắng lết trên nền ướt sũng. cô bé co rúm người vì lạnh... đôi mắt long lanh tội nghiệp cúi gằm xuống, bàn chân bé nhỏ khe khẽ bước...\\n\\nNgười đàn ông dẫn cô bé vào một căn phòng khách rộng thênh, được trang hoàng không khác gì nơi ở của một vị vua sa hoa. Đèn sáng trưng nhưng vẫn có cảm giác lạnh lẽo, đáng sợ. Lạ lẫm, cô bé cũng chẳng dám liếc nhìn thứ gì',
      2,
      [new Author('Nguyễn Nhật Ánh'), new Author('Chi Chan')]
    ),
    new Book(
      1,
      'Cho Tôi Xin Một Vé Đi Tuổi Thơ',
      700000,
      'Truyện Cho tôi xin một vé đi tuổi thơ là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.',
      5,
      'https://gacsach.club/sites/default/files/styles/book310/public/dam-nghi-lon.jpg?itok=oynYeBdB',
      '\r\n\t\t"chapters":[\r\n\t\t\t{\r\n\t\t\t\t"chuong": "1", \r\n\t\t\t\t"tenChuong": "",\r\n\t\t\t\t"noiDung": "Tiếng lưỡi dao xuyên vào da thịt... rợn người\\n\\nTiếng máu... rít lên... loang ra... đỏ thẫm...\\n\\nTiếng mưa...\\n\\nMưa!\\n\\nÀo ào...\\n\\nXối xả...\\n\\nTrắng xóa...\\n\\nHòa vào vị máu tanh nồng...\\n\\nThành phố Fensisco, 2 giờ sáng.\\n\\nTóc tách... tóc tách... tách... tách...\\n\\nTiếng nước mưa rơi đều trên sàn hành lang... Dãy hành lang rộng, dài hun hút... u ám và đâu đây nghe như đẫm mùi máu tươi...\\n\\nDọc hai bên hành lang là hai hàng vệ sĩ mặc vest đen, đeo kính đen cúi rạp cả xuống. một người đàn ông trung niên cao to vẻ đầy quyền lực tiến vào, những bước chân chậm rãi, dứt khoát, uy nghiêm. Đằng sau ông ta là một cô bé chừng mười bốn, mười lăm tuổi với mái tóc dài ướt nhẹp nước mưa xõa xuống, chiếc váy trắng lết trên nền ướt sũng. cô bé co rúm người vì lạnh... đôi mắt long lanh tội nghiệp cúi gằm xuống, bàn chân bé nhỏ khe khẽ bước...\\n\\nNgười đàn ông dẫn cô bé vào một căn phòng khách rộng thênh, được trang hoàng không khác gì nơi ở của một vị vua sa hoa. Đèn sáng trưng nhưng vẫn có cảm giác lạnh lẽo, đáng sợ. Lạ lẫm, cô bé cũng chẳng dám liếc nhìn thứ gì',
      2,
      [new Author('Nguyễn Nhật Ánh'), new Author('Chi Chan')]
    ),
    new Book(
      1,
      'Cho Tôi Xin Một Vé Đi Tuổi Thơ',
      0,
      'Truyện Cho tôi xin một vé đi tuổi thơ là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.',
      1,
      'https://gacsach.club/sites/default/files/styles/book310/public/nguoi-ban-hang-vi-dai-nhat-the-gioi.jpg?itok=gxqxNzlZ',
      '\r\n\t\t"chapters":[\r\n\t\t\t{\r\n\t\t\t\t"chuong": "1", \r\n\t\t\t\t"tenChuong": "",\r\n\t\t\t\t"noiDung": "Tiếng lưỡi dao xuyên vào da thịt... rợn người\\n\\nTiếng máu... rít lên... loang ra... đỏ thẫm...\\n\\nTiếng mưa...\\n\\nMưa!\\n\\nÀo ào...\\n\\nXối xả...\\n\\nTrắng xóa...\\n\\nHòa vào vị máu tanh nồng...\\n\\nThành phố Fensisco, 2 giờ sáng.\\n\\nTóc tách... tóc tách... tách... tách...\\n\\nTiếng nước mưa rơi đều trên sàn hành lang... Dãy hành lang rộng, dài hun hút... u ám và đâu đây nghe như đẫm mùi máu tươi...\\n\\nDọc hai bên hành lang là hai hàng vệ sĩ mặc vest đen, đeo kính đen cúi rạp cả xuống. một người đàn ông trung niên cao to vẻ đầy quyền lực tiến vào, những bước chân chậm rãi, dứt khoát, uy nghiêm. Đằng sau ông ta là một cô bé chừng mười bốn, mười lăm tuổi với mái tóc dài ướt nhẹp nước mưa xõa xuống, chiếc váy trắng lết trên nền ướt sũng. cô bé co rúm người vì lạnh... đôi mắt long lanh tội nghiệp cúi gằm xuống, bàn chân bé nhỏ khe khẽ bước...\\n\\nNgười đàn ông dẫn cô bé vào một căn phòng khách rộng thênh, được trang hoàng không khác gì nơi ở của một vị vua sa hoa. Đèn sáng trưng nhưng vẫn có cảm giác lạnh lẽo, đáng sợ. Lạ lẫm, cô bé cũng chẳng dám liếc nhìn thứ gì',
      3,
      [new Author('Nguyễn Nhật Ánh'), new Author('Chi Chan')]
    ),
    new Book(
      1,
      'Cho Tôi Xin Một Vé Đi Tuổi Thơ',
      700000,
      'Truyện Cho tôi xin một vé đi tuổi thơ là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.',
      4,
      'https://gacsach.club/sites/default/files/styles/book310/public/cho-toi-mot-ve-di-tuoi-tho.jpg?itok=0RW_HSAW',
      '\r\n\t\t"chapters":[\r\n\t\t\t{\r\n\t\t\t\t"chuong": "1", \r\n\t\t\t\t"tenChuong": "",\r\n\t\t\t\t"noiDung": "Tiếng lưỡi dao xuyên vào da thịt... rợn người\\n\\nTiếng máu... rít lên... loang ra... đỏ thẫm...\\n\\nTiếng mưa...\\n\\nMưa!\\n\\nÀo ào...\\n\\nXối xả...\\n\\nTrắng xóa...\\n\\nHòa vào vị máu tanh nồng...\\n\\nThành phố Fensisco, 2 giờ sáng.\\n\\nTóc tách... tóc tách... tách... tách...\\n\\nTiếng nước mưa rơi đều trên sàn hành lang... Dãy hành lang rộng, dài hun hút... u ám và đâu đây nghe như đẫm mùi máu tươi...\\n\\nDọc hai bên hành lang là hai hàng vệ sĩ mặc vest đen, đeo kính đen cúi rạp cả xuống. một người đàn ông trung niên cao to vẻ đầy quyền lực tiến vào, những bước chân chậm rãi, dứt khoát, uy nghiêm. Đằng sau ông ta là một cô bé chừng mười bốn, mười lăm tuổi với mái tóc dài ướt nhẹp nước mưa xõa xuống, chiếc váy trắng lết trên nền ướt sũng. cô bé co rúm người vì lạnh... đôi mắt long lanh tội nghiệp cúi gằm xuống, bàn chân bé nhỏ khe khẽ bước...\\n\\nNgười đàn ông dẫn cô bé vào một căn phòng khách rộng thênh, được trang hoàng không khác gì nơi ở của một vị vua sa hoa. Đèn sáng trưng nhưng vẫn có cảm giác lạnh lẽo, đáng sợ. Lạ lẫm, cô bé cũng chẳng dám liếc nhìn thứ gì',
      3,
      [new Author('Nguyễn Nhật Ánh'), new Author('Chi Chan')]
    ),
  ];
  constructor(private httpClient: HttpClient) {}

  listBooks(params: HttpParams): Observable<any> {
    return this.httpClient.get(baseURL, { params: params });
  }

  read(id: any): Observable<any> {
    return this.httpClient.get(`${baseURL}/${id}`);
  }

  getBooks() {
    return this.books;
  }
  getCates(){
    return this.categories;
  }
  getCate(id: number){
    return this.categories.find(c=>c.id === id);
  }
  getBooksByCate(cate:number) {    
    return this.books.filter(b=>b.categoryId===cate);
  }
}
