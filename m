Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E658D6F8F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2024 13:50:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sDNFv-0003U4-Rb;
	Sat, 01 Jun 2024 11:50:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3AwtbZgkbAL4w23oeppivettmh.ksskpiywivgsrxirx.gsq@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sDNFu-0003Ty-LV for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Jun 2024 11:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1nhwM4GXqjdtOIKde8twxoOQTnsBpiNgrRNHNeDdmjk=; b=W2JTV+qPwi9XO2cuwXD+78bJJ0
 CFcD8DGzcK8bRfPeehHW43tDBD2dN1i7+/wuESo2mR/H4zrSkt5RMreQPziv9W1+/nljEF55gsOv6
 Ub4pe9RQ+uh+giTqmO2AJS8oBd667rp2D+h+HgQd5KRrlU6QG1Wnt+Vc4atWZ1gkyT4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1nhwM4GXqjdtOIKde8twxoOQTnsBpiNgrRNHNeDdmjk=; b=i
 GlgwFFM9EkfbYDz2T8ErLRllgUMUg33/dlPBx3xota5M8iFJXUo6iRU9XBQ7yn4B1yXJQ3rbBgQ73
 LHLdi8w4exBn7xrii6hQVWa0GcydmK+frcx4u1SoS5wT/t60uz/LznAgG8rxjVpK2S7gbT6sBsGM7
 zBb2dSnlN3rtcHqU=;
Received: from mail-io1-f80.google.com ([209.85.166.80])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sDNFv-0005fS-2Q for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Jun 2024 11:50:39 +0000
Received: by mail-io1-f80.google.com with SMTP id
 ca18e2360f4ac-7e261e3e1beso358317039f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 01 Jun 2024 04:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717242627; x=1717847427;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1nhwM4GXqjdtOIKde8twxoOQTnsBpiNgrRNHNeDdmjk=;
 b=BlOh3bmmw8D+jQSgj/1qBiGsyL9/fq7VWiS8WbieFXE9IW9JZ5x4M8wAq5xfZ/FhmU
 EnA4Frx5Ahx4RytsNG2E/oA7t9LXizjRHUk+B5n2K/C8saglOAgEWDLvh5THbf+9pt6r
 5k3dYupO2k6+JcSrRzkR0Gcq/5b5HcGr/AMXsw31YkAcvXv0hZRv3ulcgCBr7ULJyu2m
 5Jl3G+nhue0y8f23PevzkGNx7l2Rob6tv77Cy2v/+QcRTfpWszEIMt5lZjwPpV/0EjZy
 YuHE/SdVOd69MXeOWt5doNAdPKNfUfPA40M6wMpa5rpM6mAR39ilK/DLGMKk7lAjU7Fa
 KLXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJHcdGy1Bmj8vMW5kIbQMgOdu+uOx/1+7juUHIENPL9ZkH9Q0syiVlSYQPbt8/ltmYT/PX1+sYUEWFTbewwbA0WI7cTYAXU6WUv+4xzW7mbhaH/kY4Uw==
X-Gm-Message-State: AOJu0YzW6hd4UrETsUli6Y9PgDQhTmYNxPdr9VRO5neACTECkzcACGu7
 zhmSGBP1lW7PAEx8my6p8KW/NgU/3ffxWEXFcJ2mWDFM3vkDJtyeRwXZnJoeYRUGlIuLzLFy3TF
 eyqe6T49OCJboClsGKhzmT3kHCABaHCsbzt+8jFzixK0Ap1tPFuuAmdk=
X-Google-Smtp-Source: AGHT+IH7wfe+za0EdvFAvcEtXmC3MHXDRTeOcLV3gfUwDXXTtb42zCMIid46qJeJcAgjoeKsgsH/gOnyLi9RzISxfD4A1MvMQC6M
MIME-Version: 1.0
X-Received: by 2002:a05:6602:168c:b0:7e2:30a3:bd13 with SMTP id
 ca18e2360f4ac-7eafff67c45mr33191739f.4.1717242627670; Sat, 01 Jun 2024
 04:50:27 -0700 (PDT)
Date: Sat, 01 Jun 2024 04:50:27 -0700
In-Reply-To: <000000000000d103ce06174d7ec3@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d0d5e20619d2b486@google.com>
From: syzbot <syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: 0e1980c40b6e Add linux-next specific files for 20240531 git tree:
 linux-next console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=146c33d6980000
 kernel config: https://syzkaller.apps [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googleapis.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.166.80 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.80 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.80 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.80 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sDNFv-0005fS-2Q
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_write_inline_data
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    0e1980c40b6e Add linux-next specific files for 20240531
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=146c33d6980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d9c3ca4e54577b88
dashboard link: https://syzkaller.appspot.com/bug?extid=848062ba19c8782ca5c8
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a9aabc980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d86426980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/44fb1d8b5978/disk-0e1980c4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a66ce5caf0b2/vmlinux-0e1980c4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8992fc8fe046/bzImage-0e1980c4.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/72a0fa392581/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com

F2FS-fs (loop0): Try to recover 1th superblock, ret: 0
F2FS-fs (loop0): Mounted with checkpoint version = 48b305e5
------------[ cut here ]------------
kernel BUG at fs/f2fs/inline.c:258!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 1 PID: 5090 Comm: syz-executor430 Not tainted 6.10.0-rc1-next-20240531-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
RIP: 0010:f2fs_write_inline_data+0x781/0x790 fs/f2fs/inline.c:258
Code: ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c e3 fc ff ff 48 89 df e8 ff a4 09 fe e9 d6 fc ff ff e8 25 22 9a 07 e8 a0 b7 a3 fd 90 <0f> 0b e8 98 b7 a3 fd 90 0f 0b 0f 1f 44 00 00 90 90 90 90 90 90 90
RSP: 0018:ffffc9000343eb00 EFLAGS: 00010293
RAX: ffffffff83f2c450 RBX: 0000000000000001 RCX: ffff88807f750000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc9000343ec30 R08: ffffffff83f2bf15 R09: 1ffff1100f0ed1ad
R10: dffffc0000000000 R11: ffffed100f0ed1ae R12: ffffc9000343eb88
R13: 1ffff1100f0ed1ad R14: ffffc9000343eb80 R15: ffffc9000343eb90
FS:  000055557674e380(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020002000 CR3: 000000001fb2e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 f2fs_write_single_data_page+0xbb6/0x1e90 fs/f2fs/data.c:2858
 f2fs_write_cache_pages fs/f2fs/data.c:3157 [inline]
 __f2fs_write_data_pages fs/f2fs/data.c:3312 [inline]
 f2fs_write_data_pages+0x1efe/0x3a90 fs/f2fs/data.c:3339
 do_writepages+0x35d/0x870 mm/page-writeback.c:2657
 filemap_fdatawrite_wbc+0x125/0x180 mm/filemap.c:397
 __filemap_fdatawrite_range mm/filemap.c:430 [inline]
 file_write_and_wait_range+0x1aa/0x290 mm/filemap.c:788
 f2fs_do_sync_file+0x68a/0x1b10 fs/f2fs/file.c:276
 generic_write_sync include/linux/fs.h:2810 [inline]
 f2fs_file_write_iter+0x7bd/0x24e0 fs/f2fs/file.c:4935
 new_sync_write fs/read_write.c:497 [inline]
 vfs_write+0xa72/0xc90 fs/read_write.c:590
 ksys_write+0x1a0/0x2c0 fs/read_write.c:643
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd453a5f779
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc94e03488 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007ffc94e03658 RCX: 00007fd453a5f779
RDX: 0000000000002000 RSI: 0000000020000040 RDI: 0000000000000006
RBP: 00007fd453ad8610 R08: 00007ffc94e03658 R09: 00007ffc94e03658
R10: 00007ffc94e03658 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffc94e03648 R14: 0000000000000001 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_write_inline_data+0x781/0x790 fs/f2fs/inline.c:258
Code: ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c e3 fc ff ff 48 89 df e8 ff a4 09 fe e9 d6 fc ff ff e8 25 22 9a 07 e8 a0 b7 a3 fd 90 <0f> 0b e8 98 b7 a3 fd 90 0f 0b 0f 1f 44 00 00 90 90 90 90 90 90 90
RSP: 0018:ffffc9000343eb00 EFLAGS: 00010293
RAX: ffffffff83f2c450 RBX: 0000000000000001 RCX: ffff88807f750000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc9000343ec30 R08: ffffffff83f2bf15 R09: 1ffff1100f0ed1ad
R10: dffffc0000000000 R11: ffffed100f0ed1ae R12: ffffc9000343eb88
R13: 1ffff1100f0ed1ad R14: ffffc9000343eb80 R15: ffffc9000343eb90
FS:  000055557674e380(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000056082271e438 CR3: 000000001fb2e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
