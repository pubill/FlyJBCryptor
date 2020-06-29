#include <stdio.h>
#import <Foundation/Foundation.h>
#import "Cryptor/NSString+AESCrypt.h"

int main(int argc, char *argv[], char *envp[]) {
								int command;
								NSString *easterkey = @"이 편지는 영국에서 최초로 시작돼 일 년에 지구 한 바퀴를 돌면서 받는 사람에게 행운을 가져다주었습니다. 지금 당신에게 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. 이 편지를 포함하여 7통의 편지를 행운이 필요한 사람에게 보내 주어야 합니다. 복사를 해도 좋습니다. 영국에서 ‘HGXWCH’라는 사람은 1930년 이 편지를 받았습니다. 그는 비서에게 복사해서 보내라고 했습니다. 며칠 뒤 그는 복권이 당첨되어 20억원을 받았습니다. 어떤 이는 이 편지를 받았으나 96시간 이내 자신의 손에서 떠나야 한다는 사실을 잊었습니다. 그는 곧 사직되었습니다. 나중에야 이 사실을 알고 7통의 편지를 보낸 후 다시 좋은 직장을 얻었습니다. 이 편지를 보내면 7년간 행운이 있을 것이고 그렇지 않으면 3년간 불행이 있을 것입니다.";

								printf("암호화/복호화 둘 중 하나를 선택하세요.\n");
								printf("1. 암호화\n");
								printf("2. 복호화\n");
								scanf("%d", &command);
								if(command == 1) {
																printf("암호화를 선택하셨습니다.\n");
																NSString* filepath = @"/var/tmp/FJMemory.json";
																NSData *data = [NSData dataWithContentsOfFile:filepath options:0 error:nil];
																NSData *encryptedData = [data AES256EncryptWithKey:easterkey];
																NSString *encryptedPath = @"/var/mobile/Library/Preferences/FJMemory";
																NSFileManager* fileMgr = [NSFileManager defaultManager];
																[fileMgr createFileAtPath:encryptedPath contents:encryptedData attributes:nil];
																printf("완료! 암호화된 파일은 /var/mobile/Library/Preferences/FJMemory로 저장되었습니다.\n");
								}



								if(command == 2) {
																printf("복호화를 선택하셨습니다.\n");
																NSString* filepath = @"/var/mobile/Library/Preferences/FJMemory";
																NSData *data = [NSData dataWithContentsOfFile:filepath options:0 error:nil];
																NSData *decryptedData = [data AES256DecryptWithKey:easterkey];
																NSString *decryptedPath = @"/var/tmp/FJMemory.json";
																NSFileManager* fileMgr = [NSFileManager defaultManager];
																[fileMgr createFileAtPath:decryptedPath contents:decryptedData attributes:nil];
																printf("완료! 복호화된 파일은 /var/tmp/FJMemory.json으로 저장되었습니다.\n");


								}
								return 0;
}
