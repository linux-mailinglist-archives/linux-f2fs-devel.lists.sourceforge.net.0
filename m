Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEE397DB9B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Sep 2024 06:07:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1srrP4-0005Gv-HJ;
	Sat, 21 Sep 2024 04:07:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3d0buZgkbAPou01mcnngtcrrkf.iqqingwugteqpvgpv.eqo@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1srrP3-0005Gn-8V for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Sep 2024 04:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VZyQv0qbFTPikDnecwxXC+O2lerTNeJjpgnb1XX0/fw=; b=i+WbtApsWX4SNZbovUz8oFKSq9
 MaXZsPfAHAxbVxhQhCzUhFtVm2I8uEWnuRfFfxjGcH0uGrqheHY2pbVF1zFxLC/4Ji5HP8mrGCksW
 N+J4ICFLuxMytXGH65BGFyx0utf8JqBvd5efnow9RAgm7IQaevXJhovdjWtG44/RHpKc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VZyQv0qbFTPikDnecwxXC+O2lerTNeJjpgnb1XX0/fw=; b=R
 qpLy29vsZ6yuFAXbociALgdb9um7LBstFAq3HHvdYiQwvFqjFt6KNJxGHYFezfWSQkfXYoxVVdEsO
 oPsxyLam9PDMMrEjXUAQF2IwXBSK8pifmgRWzCq/iB+I5Yc4jAZyPJXhhTcXawZ0j1lPaD+jxTGze
 oSbYzvLtKWfTbBKI=;
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1srrP3-0003F2-1Y for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Sep 2024 04:07:25 +0000
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-82cfb2e416eso339341339f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Sep 2024 21:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726891639; x=1727496439;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VZyQv0qbFTPikDnecwxXC+O2lerTNeJjpgnb1XX0/fw=;
 b=CfyV0PtE3t23ydjC0nOJfvONT59P9DYvn0Wh+kW9qeg4uX8w9pqcxa783yvmrNYNi5
 avHny0AFAL19c0Hk9Y7Y3DaolX1zOwtrwOZvK8jqfwtkzXX2bPcsrxjnJ1+ILt4oPpHd
 US5lUZEaWZAkTiRlftBK5438M5lFaskQVtdZiNE0xRQox1w/eUXthC0Z8KfUDNqeg3NS
 TGGHhMnRGe+95y2C2fIPqycSeIb0vhZCjJReMLqdADxrSJ7mxkz3J5PYTdpJY2aoOisv
 0yBpDrwiB4uuszXSyT9oeGD+20Da/hPGvCz2wgbQKZmtxda0WvAEfmcuwbYfUCBL1irW
 T4xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt1vGv+fuPCjRIQEglygz9dLdCPaLirisligwWSq5hRL+jka0f4vq++fuVh4870q6PhwcWVWoz+wiKFiNlilNi@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwDehAQX1sUuG4DougrZFNw4QGoRk5TdQGfa56ocQuvzJdZOSjY
 4QtzTcnUPPx9vvOy0lubhNduEWSApKpeX3oVs6s03ieVg9eeViMlfZG9R9tf3h/BpJF/BS1W/EJ
 s5pF5Lyh0Vj16GMb18KLTpwQGrtSVh2mPoq0xZDMDgPdU6xlkUHP8+v4=
X-Google-Smtp-Source: AGHT+IGagEIbUYS/f7DaoR1Nmc3vTRJc9NH3Fxg4o8jW3sMbO5Ea0a8swYel3t3i29Xazx//m8sNEIOwC3paOecwtQF/34bDOhBS
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2184:b0:3a0:4de2:3257 with SMTP id
 e9e14a558f8ab-3a0c8d28fcdmr41963305ab.18.1726891639107; Fri, 20 Sep 2024
 21:07:19 -0700 (PDT)
Date: Fri, 20 Sep 2024 21:07:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66ee4677.050a0220.3195df.002a.GAE@google.com>
From: syzbot <syzbot+44090b62afaabafe828a@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 5f5673607153
 Merge branch 'for-next/core' into for-kernelci git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot. [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.69 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -1.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.69 listed in wl.mailspike.net]
X-Headers-End: 1srrP3-0003F2-1Y
Subject: [f2fs-dev] [syzbot] [f2fs?] WARNING: locking bug in f2fs_getxattr
 (2)
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
console output: https://syzkaller.appspot.com/x/log.txt?x=13c8e200580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dedbcb1ff4387972
dashboard link: https://syzkaller.appspot.com/bug?extid=44090b62afaabafe828a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/40172aed5414/disk-5f567360.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/58372f305e9d/vmlinux-5f567360.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d2aae6fa798f/Image-5f567360.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+44090b62afaabafe828a@syzkaller.appspotmail.com

F2FS-fs (loop1): invalid namelen(0), ino:0, run fsck to fix.
------------[ cut here ]------------
Looking for class "c->lock" with key init_kmem_cache_cpus.__key, but found a different class "&c->lock" with the same key
WARNING: CPU: 1 PID: 6409 at kernel/locking/lockdep.c:934 look_up_lock_class+0xec/0x158 kernel/locking/lockdep.c:931
Modules linked in:
CPU: 1 UID: 0 PID: 6409 Comm: syz-executor Not tainted 6.11.0-rc7-syzkaller-g5f5673607153 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : look_up_lock_class+0xec/0x158 kernel/locking/lockdep.c:931
lr : look_up_lock_class+0xec/0x158 kernel/locking/lockdep.c:931
sp : ffff80009d476c80
x29: ffff80009d476c80 x28: dfff800000000000 x27: 0000000000000000
x26: ffff800097041700 x25: ffff800097041000 x24: 0000000000000001
x23: 0000000000000000 x22: 1ffff00011eae0b1 x21: ffff8000970a13b0
x20: fffffdffbf769c10 x19: ffff800092b14580 x18: 0000000000000008
x17: 2c79656b5f5f2e73 x16: ffff800083032784 x15: 0000000000000001
x14: 1fffe000366d7a5a x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000003 x10: 0000000000ff0100 x9 : b8f830333a1c6900
x8 : b8f830333a1c6900 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff80009d4763d8 x4 : ffff80008f65b620 x3 : ffff8000806051a0
x2 : 0000000000000001 x1 : 0000000100000001 x0 : 0000000000000000
Call trace:
 look_up_lock_class+0xec/0x158 kernel/locking/lockdep.c:931
 register_lock_class+0x8c/0x6ac kernel/locking/lockdep.c:1283
 __lock_acquire+0x18c/0x779c kernel/locking/lockdep.c:5019
 lock_acquire+0x240/0x728 kernel/locking/lockdep.c:5759
 local_lock_acquire+0x3c/0x98 include/linux/local_lock_internal.h:29
 ___slab_alloc+0xcbc/0xf38 mm/slub.c:3776
 __slab_alloc+0x74/0xd0 mm/slub.c:3817
 __slab_alloc_node mm/slub.c:3870 [inline]
 slab_alloc_node mm/slub.c:4029 [inline]
 kmem_cache_alloc_noprof+0x26c/0x350 mm/slub.c:4048
 f2fs_kmem_cache_alloc fs/f2fs/f2fs.h:2835 [inline]
 xattr_alloc fs/f2fs/xattr.c:30 [inline]
 lookup_all_xattrs fs/f2fs/xattr.c:333 [inline]
 f2fs_getxattr+0x3b4/0x111c fs/f2fs/xattr.c:533
 f2fs_xattr_generic_get+0x130/0x174 fs/f2fs/xattr.c:63
 __vfs_getxattr+0x394/0x3c0 fs/xattr.c:423
 smk_fetch+0xc8/0x150 security/smack/smack_lsm.c:306
 smack_d_instantiate+0x594/0x880 security/smack/smack_lsm.c:3613
 security_d_instantiate+0x98/0xf0 security/security.c:3942
 d_splice_alias+0x70/0x310 fs/dcache.c:2987
 f2fs_lookup+0x270/0xaf4 fs/f2fs/namei.c:591
 __lookup_slow+0x250/0x374 fs/namei.c:1718
 lookup_slow+0x60/0x84 fs/namei.c:1735
 walk_component+0x280/0x36c fs/namei.c:2039
 lookup_last fs/namei.c:2542 [inline]
 path_lookupat+0x13c/0x3d0 fs/namei.c:2566
 filename_lookup+0x1d4/0x4e0 fs/namei.c:2595
 user_path_at+0x50/0x74 fs/namei.c:3002
 ksys_umount fs/namespace.c:2033 [inline]
 __do_sys_umount fs/namespace.c:2041 [inline]
 __se_sys_umount fs/namespace.c:2039 [inline]
 __arm64_sys_umount+0xf4/0x178 fs/namespace.c:2039
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
irq event stamp: 261568
hardirqs last  enabled at (261567): [<ffff8000809d8e84>] seqcount_lockdep_reader_access+0x6c/0xd4 include/linux/seqlock.h:74
hardirqs last disabled at (261568): [<ffff8000809ef7cc>] ___slab_alloc+0xc90/0xf38 mm/slub.c:3776
softirqs last  enabled at (261538): [<ffff8000800307f8>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (261536): [<ffff8000800307c4>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
---[ end trace 0000000000000000 ]---


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
