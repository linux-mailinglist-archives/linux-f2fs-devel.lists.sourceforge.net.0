Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF42C978F60
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Sep 2024 11:10:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1spOnk-0004oR-Ud;
	Sat, 14 Sep 2024 09:10:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3CFPlZgkbAIEx34pfqqjwfuuni.lttlqjzxjwhtsyjsy.htr@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1spOnj-0004oK-U0 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Sep 2024 09:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4ucFpJgZBDEvbayFGovsp4xwz0hvB2iTSA1f2jDtBTQ=; b=MihAL6PvS2f33Zho3UW+Y45xHZ
 5MFV5ne/BKqNcGgTJ8Ensj0EMT7wqAucZR88ZGY1nj/aqt2SH1j+N5D7sVu5b3XnZYB8OWYnM7vNZ
 UUkUgSZFj3vQS421lPGIYJPvEJcEPs5ZS3Q7b+cEuB+6BLvuXvZsZcPbNe9CyhKyE4Ws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4ucFpJgZBDEvbayFGovsp4xwz0hvB2iTSA1f2jDtBTQ=; b=N
 uEEtDWfp9D8ZCOmo6yDsSsl3vybStxoqsjharfKPuMQuo9M0LKJnXa7H8oGAOFfoYwTo2e11wh/aD
 8zI4ickUPDQzXibf/av+ORpLMOcDbzU0MJlKfBYXffrZARlrwtEXjP+ioLTWb0IN0/Pd0BwSnitsB
 g8rd6GTKFsi5aTr0=;
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1spOnj-0005ks-6k for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Sep 2024 09:10:43 +0000
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3a0862f232fso51626495ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 Sep 2024 02:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726305032; x=1726909832;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4ucFpJgZBDEvbayFGovsp4xwz0hvB2iTSA1f2jDtBTQ=;
 b=KJ0+mJBqp58taGFiCPaIpikhScm+Ee+MsMSFppEO0rEvRf1KSsP1z14NppUuoY+1Af
 aMdn/caVflHTO5Fd/QLkCiz7BTTje8FWFcrWgiVH8p5jqrY0UkB6apj+2Oifbz3eNaKR
 Xjyh7HNIshei1sZ0qX0eDPQNeDedn54cfTpr+xFZ9MUdiaEzbwdnydBFKCfnoJGIUont
 uobXcZc+ES6brL9e0scwR70SXtgK8yZrq8EM+LDqg+5ytsf9pxqeaEg+lhY1f5sTDd2v
 nyiMx5nq1pSfgFmCmA2AzUXdR1+fdZ6j+5KfMrYz1q3pXXAcAqPoVKjkySFhziRsIvxE
 L2pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdvAkh+fKWgWkRVEbK6aYjne1UYtiwRc75vw3QTWWoF5i1mVStZi9hjitd/KPomTS3nXc+dBv9jhPYY6N2foLH@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxiK6gV5uv/vY1bxAd5IvDSSgXw+YAhy6jOeauxWKXqj5qkJS7z
 tHeVNLJCIX2c1d6I2x87pkds5xPyGWwndKigqT60UZQ0B6YP+4fFkbRRdOnwgn8HptKDpPno9Yr
 RSB2bQdp0y46Nx1pSrMcfOUixAgvJg6QQO+J4d1jz2Gl1SgauBmrv8g4=
X-Google-Smtp-Source: AGHT+IHHbna/iwJ27nJ6qU9seZDGQ6C8ywG3DkdgB2nAAawQLf9mITHYEvW3AZ2nT1GTszrXNx8LNXFWmcvSAb3WqjxyY//m2NjH
MIME-Version: 1.0
X-Received: by 2002:a92:870a:0:b0:3a0:533e:3c0a with SMTP id
 e9e14a558f8ab-3a084902a10mr80045435ab.7.1726305032394; Sat, 14 Sep 2024
 02:10:32 -0700 (PDT)
Date: Sat, 14 Sep 2024 02:10:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66e55308.050a0220.1f4381.0004.GAE@google.com>
From: syzbot <syzbot+74f79df25c37437e4d5a@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 5f5673607153
 Merge branch 'for-next/core' into for-kernelci git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot. [...] 
 Content analysis details:   (0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.198 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.198 listed in wl.mailspike.net]
 0.1 PLING_QUERY            Subject has exclamation mark and question mark
X-Headers-End: 1spOnj-0005ks-6k
Subject: [f2fs-dev] [syzbot] [net?] BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!
 (7)
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

HEAD commit:    5f5673607153 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=141567c7980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dedbcb1ff4387972
dashboard link: https://syzkaller.appspot.com/bug?extid=74f79df25c37437e4d5a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/40172aed5414/disk-5f567360.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/58372f305e9d/vmlinux-5f567360.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d2aae6fa798f/Image-5f567360.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+74f79df25c37437e4d5a@syzkaller.appspotmail.com

F2FS-fs (loop3): Disable nat_bits due to incorrect cp_ver (10241045589465957861, 39874397669)
F2FS-fs (loop3): Try to recover 1th superblock, ret: 0
F2FS-fs (loop3): Mounted with checkpoint version = 48b305e5
BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!
turning off the locking correctness validator.
CPU: 0 UID: 0 PID: 8464 Comm: syz.3.313 Not tainted 6.11.0-rc7-syzkaller-g5f5673607153 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
Call trace:
 dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:319
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:326
 __dump_stack lib/dump_stack.c:93 [inline]
 dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:119
 dump_stack+0x1c/0x28 lib/dump_stack.c:128
 lookup_chain_cache_add kernel/locking/lockdep.c:3815 [inline]
 validate_chain kernel/locking/lockdep.c:3836 [inline]
 __lock_acquire+0x1fa0/0x779c kernel/locking/lockdep.c:5142
 lock_acquire+0x240/0x728 kernel/locking/lockdep.c:5759
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x5c/0x7c kernel/locking/spinlock.c:162
 sb_mark_inode_writeback+0x80/0x47c fs/fs-writeback.c:1306
 __folio_start_writeback+0x630/0xac0 mm/page-writeback.c:3150
 set_page_writeback+0x5c/0x78 mm/folio-compat.c:45
 __write_node_page+0xa90/0x1ba0 fs/f2fs/node.c:1687
 f2fs_sync_node_pages+0x11ec/0x1a88 fs/f2fs/node.c:2057
 block_operations fs/f2fs/checkpoint.c:1290 [inline]
 f2fs_write_checkpoint+0xa5c/0x16f4 fs/f2fs/checkpoint.c:1665
 f2fs_issue_checkpoint+0x284/0x3b4
 f2fs_sync_fs+0x1f0/0x540 fs/f2fs/super.c:1708
 f2fs_create+0x3d8/0x494 fs/f2fs/namei.c:389
 lookup_open fs/namei.c:3578 [inline]
 open_last_lookups fs/namei.c:3647 [inline]
 path_openat+0xfb4/0x29f8 fs/namei.c:3883
 do_filp_open+0x1bc/0x3cc fs/namei.c:3913
 do_sys_openat2+0x124/0x1b8 fs/open.c:1416
 do_sys_open fs/open.c:1431 [inline]
 __do_sys_openat fs/open.c:1447 [inline]
 __se_sys_openat fs/open.c:1442 [inline]
 __arm64_sys_openat+0x1f0/0x240 fs/open.c:1442
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598


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
