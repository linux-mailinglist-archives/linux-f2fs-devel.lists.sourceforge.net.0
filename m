Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C47562048E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Nov 2022 01:16:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1osCHb-0005cL-Nq;
	Tue, 08 Nov 2022 00:16:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3uJ9pYwkbAL8x34pfqqjwfuuni.lttlqjzxjwhtsyjsy.htr@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1osCHZ-0005cE-Vv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Nov 2022 00:16:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kVNNuLLGgelV/9xzO4pFlRh5Pn9rCXjBZ2XsV4Ryk3I=; b=YMtnRgjVDCch2jm4SNWLIharvY
 ez48Ry5xFnI4UrmptHosvzNSIZflQR23bEkDRgUX4MaKCjoFtdX9k+KWa1g5qpT7Vrx3NGPU7VV0j
 AYNHAC3VildgSz0oXanihRJn634yJWe8zaQVytS5RQf/EMx26Jx5llCF4P9yructUmFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kVNNuLLGgelV/9xzO4pFlRh5Pn9rCXjBZ2XsV4Ryk3I=; b=I
 iHqRH5dvEMoh5rYvJBBIu04FRVXlL/2UOLurgQBC0661fU1PswbVfsug5I67c7Cd6RAUX5FOag3OC
 W7fwPpo1z4/1iRXcS+HxtBfb4n3PiVLwUrmt5m+t6VBYhNb4DLFj3X5n9PcXQynvd5r+pF7RdObRH
 FRF67oqK6GGkjsVQ=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1osCHW-00Fdhj-CF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Nov 2022 00:16:01 +0000
Received: by mail-il1-f197.google.com with SMTP id
 d19-20020a056e020c1300b00300b5a12c44so10057931ile.15
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Nov 2022 16:15:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kVNNuLLGgelV/9xzO4pFlRh5Pn9rCXjBZ2XsV4Ryk3I=;
 b=30rnVzqsP+3mHFhLTncAdvyLYA+ZqyCNAfDLfGjCzxCiucsZjweTv32J7ZYghB62da
 1hzvjlvCrmTa1yxDghoONRGjbtZnqxoZkk/NLiGlO9478vrpkZO5UK7RwAarQc5FxZq4
 +Yc80mTqVaeaSdkfMqbDkIUf41noq0wADkQrU6VyKHAdk5WKPVgNiiKlaKOb6Qj7FcFo
 ly+BRdybLPUb9RiF9M4UQYq+B32+Ig6YbbD62GdFZwCJtrolHzspxxUeDRsaq96unW8U
 R9Z7nhXEJk4QzfxzsGcIG2XVjo+A9FJ6LAB574stpCzZTaw2xMa34YuVznMm++XViUTC
 uGCg==
X-Gm-Message-State: ACrzQf3lDyFBzdHeGVrvN1+gJbReOczRCBbeGy50ZhWKuG2+PcXTPDR4
 h4Q+RncUwSMFJqzTFL1nBcr2Ci0AnXMuJPaHHq/m/KKJ/SzY
X-Google-Smtp-Source: AMsMyM6OKtM8oYKG9ke6xzQflEt4ODd1XHnCWjZXS34r+2HSVycQZAadI+H46F6ygEMqHaE7poT1gp/8+bppizoJYOLw6oPTneNV
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1bc4:b0:300:61e9:69af with SMTP id
 x4-20020a056e021bc400b0030061e969afmr30785458ilv.191.1667866552859; Mon, 07
 Nov 2022 16:15:52 -0800 (PST)
Date: Mon, 07 Nov 2022 16:15:52 -0800
In-Reply-To: <0000000000007edb6605ecbb6442@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006a83e705ecea7171@google.com>
From: syzbot <syzbot+40642be9b7e0bb28e0df@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, terrelln@fb.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: f0c4d9fc9cc9 Linux 6.1-rc4 git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output:
 https://syzkaller.appspot.com/x/log.txt?x=15e494fe880000
 ke [...] Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.197 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1osCHW-00Fdhj-CF
Subject: Re: [f2fs-dev] [syzbot] INFO: trying to register non-static key in
 f2fs_handle_error
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

HEAD commit:    f0c4d9fc9cc9 Linux 6.1-rc4
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=15e494fe880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ff27f0c8b406726e
dashboard link: https://syzkaller.appspot.com/bug?extid=40642be9b7e0bb28e0df
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10822271880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14f4cd51880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/92c7e839ac32/disk-f0c4d9fc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b7bedbc08fb4/vmlinux-f0c4d9fc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3fe25e2dfdb7/Image-f0c4d9fc.gz.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/1f9d740f89a9/mount_1.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/6c6db4f39192/mount_2.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+40642be9b7e0bb28e0df@syzkaller.appspotmail.com

F2FS-fs (loop0): Invalid log_blocksize (16), supports only 12
F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
F2FS-fs (loop0): inaccessible inode: 2, run fsck to repair
INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 1 PID: 3141 Comm: syz-executor147 Not tainted 6.1.0-rc4-syzkaller-31833-gf0c4d9fc9cc9 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
Call trace:
 dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
 show_stack+0x2c/0x54 arch/arm64/kernel/stacktrace.c:163
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x104/0x16c lib/dump_stack.c:106
 dump_stack+0x1c/0x58 lib/dump_stack.c:113
 assign_lock_key+0x134/0x140 kernel/locking/lockdep.c:981
 register_lock_class+0xc4/0x2f8 kernel/locking/lockdep.c:1294
 __lock_acquire+0xa8/0x3084 kernel/locking/lockdep.c:4934
 lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5668
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x54/0x6c kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:350 [inline]
 f2fs_save_errors fs/f2fs/super.c:3868 [inline]
 f2fs_handle_error+0x38/0x17c fs/f2fs/super.c:3896
 f2fs_iget+0x138/0x538 fs/f2fs/inode.c:516
 f2fs_fill_super+0x10fc/0x1e90 fs/f2fs/super.c:4222
 mount_bdev+0x1b8/0x210 fs/super.c:1401
 f2fs_mount+0x44/0x58 fs/f2fs/super.c:4580
 legacy_get_tree+0x30/0x74 fs/fs_context.c:610
 vfs_get_tree+0x40/0x140 fs/super.c:1531
 do_new_mount+0x1dc/0x4e4 fs/namespace.c:3040
 path_mount+0x358/0x890 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __arm64_sys_mount+0x2c4/0x3c4 fs/namespace.c:3568
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581
F2FS-fs (loop0): Failed to read F2FS meta data inode
loop0: detected capacity change from 0 to 8192
REISERFS warning:  read_super_block: reiserfs filesystem is deprecated and scheduled to be removed from the kernel in 2025
REISERFS (device loop0): found reiserfs format "3.6" with non-standard journal
REISERFS (device loop0): using ordered data mode
reiserfs: using flush barriers
REISERFS (device loop0): journal params: device loop0, size 512, journal first block 18, max trans len 256, max batch 225, max commit age 30, max trans age 30
REISERFS (device loop0): checking transaction log (loop0)
REISERFS (device loop0): Using rupasov hash to sort names
REISERFS warning (device loop0): jdm-20006 create_privroot: xattrs/ACLs enabled and couldn't find/create .reiserfs_priv. Failing mount.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
