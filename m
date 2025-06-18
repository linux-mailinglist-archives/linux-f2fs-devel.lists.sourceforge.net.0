Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B96DCADF8A9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Jun 2025 23:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kjylUqQGa4mmmoIb6F6uLDkSW/g/2JhJlv8GJM522d4=; b=GOM2Ai9bg2nvvmGxOrf5BxdZf5
	3roMhMP6QytZlLwO8OfAi9LTGtMKp6XcEyUldfiPWklMoSU9R3AutYH2NdxrYT9pXAPB3pFARwrF+
	7ivEvX1nEVK0qdCkCsyyhuCRPxjY2xpltuXXmHgLOOYsldS/f2BP2eEu5MQ7VsqGsAEw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uS0Et-0002T7-SM;
	Wed, 18 Jun 2025 21:22:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3Dy5TaAkbAAIu01mcnngtcrrkf.iqqingwugteqpvgpv.eqo@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uS0Et-0002Su-1T for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 21:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gyda97p0k8LMpqYwxXSUSu+cJ9FxoUrepV5dKozGTbs=; b=P003LHpsxqb3XvJ88oYUFLYyJY
 /hpN7M724Y7MTbc67sGbg/JSYUmSbbO1p3SUgZjgQ9RTImM46e6Z2DhnVL9/jeGgvSoleOcgYQKWe
 ifRUVzEVHqKDTovarCj624ieq4rkCiG64YeDDSsF96b9Dm8x/LDYh+4lsfJIHYE2sq5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Gyda97p0k8LMpqYwxXSUSu+cJ9FxoUrepV5dKozGTbs=; b=S
 PFGK/+2oTcozd7x0Drksr6OvCcBbZLv/asBtHfHQhTJ5vFfr8AtR6z0DKf3sOmk4gFvHraIvtj6d9
 RN+C40PEiBKKSWJU8CsBkeBXCY2ntkoc/yht8FTRVzA+7Tt10L2KD3/7YIxQbUQ5WRGOzvEW2wRlw
 RIobO4VtdeAYwo1Q=;
Received: from mail-il1-f205.google.com ([209.85.166.205])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uS0Es-0005CX-G8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Jun 2025 21:22:34 +0000
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-3ddbfe1fc8fso2714715ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Jun 2025 14:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750281744; x=1750886544;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gyda97p0k8LMpqYwxXSUSu+cJ9FxoUrepV5dKozGTbs=;
 b=kviEtNBAHuySqO4XNxrsE6gqiXVoThH5E4QFUBbeiS+zQRPcZA2+9QYrkr8fFKYtCA
 Y8FcglNuhJiqtWkeOxziMAIJGeE7HGREV+DOHtqXeT59VzZLu40c+dkPm++7oVMIv9BF
 0ZJWNOLYkMcYSRc2v5cNmd2H2zuJyHz3h5hoTK5WGEsqhU1oyWUMLNrPz5bi0vEqz8zf
 uLnHZhaBeuFDxuevNOsABVZF6LxCTMbR/hsS3X67Lr5hSOI+Ke6X1jKai43iQy/+uxn4
 MnO4fY8Z7nwcGcB7ebvkbmmS6bHRHK6aWZTL1o0bcSZSJAIXG0D1GZV3n2ah3uszMChA
 lLyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNUcbyhdV6mVwQQj9tVO9ZSPX1qVBK/2vur6lH6laweE+LoXFaPGFTmAiSJZ6MJTOmPJbMSsB3FckClqOr2qj8@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwfsaG+3xZLxIRs45jx5/VvbozukEkuD1MFwm9dFUh/0/0xGJxs
 Bq11bXYEbtidNQ6//XH+8HhjxVr0pG5zt4XGx8pnDcT73xaoSl5FobUSOXDhWGgsqBgf38vGTV2
 5w6ed4AOZQkHLKQIoSFTaKR+qypmxBT0vPPvb+hO/n+e4aqtXmr7Nd+j6P6A=
X-Google-Smtp-Source: AGHT+IG972MFzHU6mHqcjmmOnulMds72kAVtT8v2nrX12zqUlz6DwYEfYZiyHxMCtv1ejD658G7RsJu0lyr+z4U7dKJLjA4xam3J
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2401:b0:3dd:f3e1:2899 with SMTP id
 e9e14a558f8ab-3de07c3718amr267678985ab.2.1750281743885; Wed, 18 Jun 2025
 14:22:23 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:22:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68532e0f.050a0220.216029.00aa.GAE@google.com>
From: syzbot <syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 4774cfe3543a
 Merge tag 'scsi-fixes' of git://git.kernel.or.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=1219de0c580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.205 listed in wl.mailspike.net]
X-Headers-End: 1uS0Es-0005CX-G8
Subject: [f2fs-dev] [syzbot] [f2fs?] KMSAN: uninit-value in
 __try_merge_extent_node
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

HEAD commit:    4774cfe3543a Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1219de0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61539536677af51c
dashboard link: https://syzkaller.appspot.com/bug?extid=b8c1d60e95df65e827d4
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c5c5e2dcd9e4/disk-4774cfe3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0ec9403177cd/vmlinux-4774cfe3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8c9c37a4fc0e/bzImage-4774cfe3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com

loop8: detected capacity change from 0 to 131072
F2FS-fs (loop8): Mounted with checkpoint version = 48b305e5
=====================================================
BUG: KMSAN: uninit-value in __is_extent_mergeable fs/f2fs/extent_cache.c:154 [inline]
BUG: KMSAN: uninit-value in __is_back_mergeable fs/f2fs/extent_cache.c:173 [inline]
BUG: KMSAN: uninit-value in __try_merge_extent_node+0x415/0x1600 fs/f2fs/extent_cache.c:546
 __is_extent_mergeable fs/f2fs/extent_cache.c:154 [inline]
 __is_back_mergeable fs/f2fs/extent_cache.c:173 [inline]
 __try_merge_extent_node+0x415/0x1600 fs/f2fs/extent_cache.c:546
 __update_extent_tree_range+0x1b53/0x2ae0 fs/f2fs/extent_cache.c:776
 __update_extent_cache+0x11cc/0x1420 fs/f2fs/extent_cache.c:950
 f2fs_update_read_extent_cache+0x20/0x30 fs/f2fs/extent_cache.c:1055
 f2fs_update_data_blkaddr+0x428/0x470 fs/f2fs/data.c:1142
 f2fs_outplace_write_data+0x1bf/0x250 fs/f2fs/segment.c:4011
 f2fs_do_write_data_page+0x2a11/0x3480 fs/f2fs/data.c:2752
 f2fs_write_single_data_page+0x15bf/0x29b0 fs/f2fs/data.c:2868
 f2fs_write_cache_pages fs/f2fs/data.c:3133 [inline]
 __f2fs_write_data_pages fs/f2fs/data.c:3282 [inline]
 f2fs_write_data_pages+0x2f66/0x5480 fs/f2fs/data.c:3309
 do_writepages+0x3f2/0x860 mm/page-writeback.c:2636
 filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
 __filemap_fdatawrite_range mm/filemap.c:419 [inline]
 file_write_and_wait_range+0x6f0/0x7d0 mm/filemap.c:794
 f2fs_do_sync_file+0x79b/0x31c0 fs/f2fs/file.c:278
 f2fs_sync_file+0x107/0x180 fs/f2fs/file.c:395
 vfs_fsync_range+0x1a1/0x240 fs/sync.c:187
 generic_write_sync include/linux/fs.h:3027 [inline]
 f2fs_file_write_iter+0x3032/0x4650 fs/f2fs/file.c:5203
 do_iter_readv_writev+0x947/0xba0 fs/read_write.c:-1
 vfs_writev+0x52a/0x1500 fs/read_write.c:1057
 do_pwritev fs/read_write.c:1153 [inline]
 __do_sys_pwritev2 fs/read_write.c:1211 [inline]
 __se_sys_pwritev2+0x22f/0x480 fs/read_write.c:1202
 __x64_sys_pwritev2+0xe4/0x150 fs/read_write.c:1202
 x64_sys_call+0x22b9/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:329
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable ei created at:
 f2fs_init_read_extent_tree+0xe7/0xf10 fs/f2fs/extent_cache.c:417
 do_read_inode fs/f2fs/inode.c:541 [inline]
 f2fs_iget+0x7a0e/0x8950 fs/f2fs/inode.c:589

CPU: 1 UID: 0 PID: 24362 Comm: syz.8.5691 Not tainted 6.16.0-rc1-syzkaller-00203-g4774cfe3543a #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
=====================================================


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
