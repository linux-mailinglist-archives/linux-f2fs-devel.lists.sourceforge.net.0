Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 977F89E2AE7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2024 19:31:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tIXgN-0003PX-QO;
	Tue, 03 Dec 2024 18:31:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3fU5PZwkbAJgKQRC2DD6J2HHA5.8GG8D6MK6J4GFL6FL.4GE@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tIXgJ-0003PJ-R5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Dec 2024 18:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hjj6R/xMvb7wKkH2m47buE6p9q7fmi7jYfOqhRPXBC8=; b=iEUAXMVbocsfgzlmfX96wS9j2W
 uspcOJB+AfwxB0n0q122XflFTjWWGi5XwqLlrid3/88jh2MsT05S/ino8RwWaLQJjJhXqcpvLEUGW
 nN8Xyr1BX99ay6CyAr6mGulWthZoHYM1fi9uekLDYU9PIFPQ0oEXMDucmhRIFNzJmRAc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Hjj6R/xMvb7wKkH2m47buE6p9q7fmi7jYfOqhRPXBC8=; b=l
 Ma58rOdW1M//jd1vg2LjmPuO4lP5Te4IFGWXU/sdM7W2rotoqmWS9fVN+lhxSzlJdu1bKPV4Rn0vl
 qkPbars/19bdB9Zz3O2vL45usYTBDRs3PnhDSIXi017uNMI3WywBAAPjI8Fzu/ZY/sR7WBkrUlv5N
 29q9C7XanIgy1wHQ=;
Received: from mail-io1-f80.google.com ([209.85.166.80])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tIXgJ-0001vZ-0Z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Dec 2024 18:31:31 +0000
Received: by mail-io1-f80.google.com with SMTP id
 ca18e2360f4ac-841896ec108so646329539f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Dec 2024 10:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733250685; x=1733855485;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hjj6R/xMvb7wKkH2m47buE6p9q7fmi7jYfOqhRPXBC8=;
 b=Ey3zXjSh1s/ypMEQ2UDOPYqogU1V3TcJm6HTyqhprYEenNIVMAX9xU/BMXR6Zp/HaD
 o5uctBiNpaxnrSjeJ+hSaFCw/+WQLs7dAh7OJLy5mIO5NOE6AREn+7dzdJp0YMlQrKBc
 7N+inhOJhaxdqYWmp78FDKu75Afpd8X8e8xJrq9Yreww7GqF3DxfAqGIV3P12o4rSGut
 G5PyhodttSs6EfS8Hl45Bp5Mfo9PUq+HyaeMVufWmE03rTsci7wBR0/+gma5SWeQIx0f
 nSa4Qk+BhpVBLS8bxBLXSUR2N0UiO+t6oRaVWMtigm/OGsGGBAL4xEILLzChf73kxA7O
 QE9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCXEmV7/L36b3GS23aDw1UjKfIdPxQsJSMpw9VKIGlvIS4JoTJ8J0Iab66BJRrUjie/NmVfVldkprxf87bBEQM@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwoupB8PfVQmo0QBlSap0E8Fh0Ie1RaJiKHEbaWhTsYeadH27GI
 tY8LQyr9L8nCfL4G86MnrC4Ey8wIaipOJ9ETgKnRisIpNprNrBX8m5iaV6zTNn43hWwfYZ57GPs
 FkO6gMvYpbe98AicvHnROSoezNXrPjliaQwtS2ttr+CJVqcclCK22pAg=
X-Google-Smtp-Source: AGHT+IEOo3SCsgbxAa9xqtkmIEQ+7AEX0hf07PLykR1Stk6qa9V9Xc7UwyKJdnn9cnAwO/M21fCLjnewMDkd3n+Z8R0yQYmhMyTM
MIME-Version: 1.0
X-Received: by 2002:a92:c246:0:b0:3a6:c98d:86bc with SMTP id
 e9e14a558f8ab-3a7f9a3838cmr48606465ab.1.1733250685284; Tue, 03 Dec 2024
 10:31:25 -0800 (PST)
Date: Tue, 03 Dec 2024 10:31:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <674f4e7d.050a0220.17bd51.004f.GAE@google.com>
From: syzbot <syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 7af08b57bcb9
 Merge tag 'trace-v6.13-2' of git://git.kernel.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=1519f3c0580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.80 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.80 listed in bl.score.senderscore.com]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.80 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.80 listed in list.dnswl.org]
X-Headers-End: 1tIXgJ-0001vZ-0Z
Subject: [f2fs-dev] [syzbot] [f2fs?] UBSAN: array-index-out-of-bounds in
 read_inline_xattr
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

syzbot found the following issue on:

HEAD commit:    7af08b57bcb9 Merge tag 'trace-v6.13-2' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1519f3c0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3891b550f14aea0f
dashboard link: https://syzkaller.appspot.com/bug?extid=69f5379a1717a0b982a1
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-7af08b57.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/63d6781734c3/vmlinux-7af08b57.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f3bd17982594/bzImage-7af08b57.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 131072
F2FS-fs (loop0): Invalid Fs Meta Ino: node(13) meta(0) root(3)
F2FS-fs (loop0): Can't find valid F2FS filesystem in 2th superblock
F2FS-fs (loop0): Found nat_bits in checkpoint
F2FS-fs (loop0): Try to recover 2th superblock, ret: 0
F2FS-fs (loop0): Mounted with checkpoint version = 1b41e955
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in fs/f2fs/f2fs.h:3292:19
index 18446744073709550491 is out of range for type '__le32[923]' (aka 'unsigned int[923]')
CPU: 0 UID: 0 PID: 5338 Comm: syz.0.0 Not tainted 6.12.0-syzkaller-10689-g7af08b57bcb9 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan.c:429
 read_inline_xattr+0x273/0x280
 lookup_all_xattrs fs/f2fs/xattr.c:341 [inline]
 f2fs_getxattr+0x57b/0x13b0 fs/f2fs/xattr.c:533
 vfs_getxattr_alloc+0x472/0x5c0 fs/xattr.c:393
 ima_read_xattr+0x38/0x60 security/integrity/ima/ima_appraise.c:229
 process_measurement+0x117a/0x1fb0 security/integrity/ima/ima_main.c:353
 ima_file_check+0xd9/0x120 security/integrity/ima/ima_main.c:572
 security_file_post_open+0xb9/0x280 security/security.c:3121
 do_open fs/namei.c:3830 [inline]
 path_openat+0x2ccd/0x3590 fs/namei.c:3987
 do_file_open_root+0x3a7/0x720 fs/namei.c:4039
 file_open_root+0x247/0x2a0 fs/open.c:1382
 do_handle_open+0x85b/0x9d0 fs/fhandle.c:414
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4a4bf80849
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f4a4cd52058 EFLAGS: 00000246 ORIG_RAX: 0000000000000130
RAX: ffffffffffffffda RBX: 00007f4a4c145fa0 RCX: 00007f4a4bf80849
RDX: 0000000000000000 RSI: 0000000020000040 RDI: 0000000000000003
RBP: 00007f4a4bff3986 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f4a4c145fa0 R15: 00007ffd9526f5d8
 </TASK>
---[ end trace ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
