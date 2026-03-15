import '../data/repositories/songs/song_repository_mock.dart';
import '../model/songs/song.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Instantiate the  song_repository_mock
  SongRepositoryMock repositoryMock = SongRepositoryMock();

  // Test both the success and the failure of the post request

  // - Using then() with .catchError().
  test("Success Using then() with .catchError()", () {
    return repositoryMock.fetchSongById("s2")
    .then((value) {
      print("Song received: ${value!.title}");
    })
    .catchError((error) {
      print(error);
    });
  });

  test("Fail Using then() with .catchError()", () {
    return repositoryMock.fetchSongById("s9")
    .then((value) {
      print("Song received: ${value!.title}");
    })
    .catchError((error) {
      print(error);
    });
  });


  // - Using async/await with try/catch.
  test("Success Using async/await with try/catch", () async{
    try{
      Song? song = await repositoryMock.fetchSongById("s2");
      print("Song received: ${song!.title}");
    }catch(e){
      print(e);
    }
  });

  test("Fail Using async/await with try/catch", () async{
    try{
      Song? song = await repositoryMock.fetchSongById("s9");
      print("Song received: ${song!.title}");
    }catch(e){
      print(e);
    }
  });
}





