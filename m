Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D26CB61DBE7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Nov 2022 17:08:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1orLiC-0008VJ-V3;
	Sat, 05 Nov 2022 16:08:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3WIpmYwkbACkXdePFQQJWFUUNI.LTTLQJZXJWHTSYJSY.HTR@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1orLiA-0008V4-UB for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 05 Nov 2022 16:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SrkMdh2rzSEfUpITUGJrHhsutoE7n5vCXPNepIr4K2k=; b=F0GyljvPEva7qDIFDC7Tk50D/q
 I0kMtfuWKk1mpw+yfD8ix9cVUjIGSEy4ljmgATDWtr5yQog/GykUkt1UwT1n2ro0dciS30R0Z4kks
 eyc+LyI0AmKL7Gf+L7ifyVt/paBg7GrnxLb4KOKlOKYv4hBtwLLqZ/D2V0grFwqOdoLU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SrkMdh2rzSEfUpITUGJrHhsutoE7n5vCXPNepIr4K2k=; b=C
 du8TXNJ7PGWmX5LX+Ogn6wdFvgKZxc4bp6HWCA7ZQMBYMQKhnwK/zwccbP3FyBp4LS2DOawCshHCn
 lAYm9pjc2owy7G/qY2g0NytiWSuHZh1Kd3Yh3jmMifetRVYt4pcrg9WmEwmv5Crb6DpmSXqiUYBVP
 8AX3ueQCQ94+AMtQ=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1orLiA-00D2Nr-6r for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 05 Nov 2022 16:07:58 +0000
Received: by mail-il1-f197.google.com with SMTP id
 o13-20020a056e0214cd00b00300a27f9424so5822656ilk.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 05 Nov 2022 09:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SrkMdh2rzSEfUpITUGJrHhsutoE7n5vCXPNepIr4K2k=;
 b=Ot7dIzpNtYs/gNi5tCgML+icFOcYqRDkwZMANXpHbQwiU7OP+jZVbFW9aZ6U2UAOLL
 qjisnAODULJlAalSr1NvHEkVBR6UkFN4F1cL0J+0SWFAkCk9O1pVi2BiCO7OKBLPdUti
 Sn7d9COH5np8UoggtpdG+kXuWCKe9P5dtf/9gFDv83rkCloQ5ct6rOkamJP6CH7BlIGK
 1y6Z/ZWbjbosBSOnWKoQvl/l60fnyCjMIMZ40LvbnufrJRCoZAb2gHrCepeRTteTdFFK
 LJYtYC6wleZGl6BqKObHiQZr70IhLpl64hoDYPKIMItABN6hQafoKPY31llZ8+m1R3/t
 0cTA==
X-Gm-Message-State: ACrzQf2wawDUiKb771fkinRYm1hzZSmFveFxyATchLFe5srMhJSIxvnC
 0LfF21IzBn6oGjYMj7uwXfU/xIzi9J29FTrWPY4de4Nan+9n
X-Google-Smtp-Source: AMsMyM6ys/LYnOhuTYOgkQ7MFHH4ecac145EmKuKP9CrJkMvbn34KrtBesqKzcBYna0D2fV2xIFVycZ7w9BmJZ5cZKkPFQ2r0IDY
MIME-Version: 1.0
X-Received: by 2002:a05:6638:ce:b0:373:fccb:63e3 with SMTP id
 w14-20020a05663800ce00b00373fccb63e3mr24202249jao.66.1667664472626; Sat, 05
 Nov 2022 09:07:52 -0700 (PDT)
Date: Sat, 05 Nov 2022 09:07:52 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007edb6605ecbb6442@google.com>
From: syzbot <syzbot+40642be9b7e0bb28e0df@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, terrelln@fb.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 10d916c86eca
 Merge tag 'soc-fixes-6.1-2' of git://git.kern.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=117b4251880000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.197 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
X-Headers-End: 1orLiA-00D2Nr-6r
Subject: [f2fs-dev] [syzbot] INFO: trying to register non-static key in
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

Hello,

syzbot found the following issue on:

HEAD commit:    10d916c86eca Merge tag 'soc-fixes-6.1-2' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=117b4251880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ddb381fe9a8f6a8b
dashboard link: https://syzkaller.appspot.com/bug?extid=40642be9b7e0bb28e0df
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/73d5475b518c/disk-10d916c8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2ce12d00f04a/vmlinux-10d916c8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4d23719c0557/bzImage-10d916c8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+40642be9b7e0bb28e0df@syzkaller.appspotmail.com

loop1: detected capacity change from 0 to 264192
F2FS-fs (loop1): inaccessible inode: 2, run fsck to repair
INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 1 PID: 28028 Comm: syz-executor.1 Not tainted 6.1.0-rc3-syzkaller-00239-g10d916c86eca #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e3/0x2cb lib/dump_stack.c:106
 assign_lock_key+0x22a/0x240 kernel/locking/lockdep.c:981
 register_lock_class+0x287/0x9b0 kernel/locking/lockdep.c:1294
 __lock_acquire+0xe4/0x1f60 kernel/locking/lockdep.c:4934
 lock_acquire+0x1a7/0x400 kernel/locking/lockdep.c:5668
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x2a/0x40 kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:350 [inline]
 f2fs_save_errors fs/f2fs/super.c:3868 [inline]
 f2fs_handle_error+0x29/0x230 fs/f2fs/super.c:3896
 f2fs_iget+0x215/0x4bb0 fs/f2fs/inode.c:516
 f2fs_fill_super+0x47d3/0x7b50 fs/f2fs/super.c:4222
 mount_bdev+0x26c/0x3a0 fs/super.c:1401
 legacy_get_tree+0xea/0x180 fs/fs_context.c:610
 vfs_get_tree+0x88/0x270 fs/super.c:1531
 do_new_mount+0x289/0xad0 fs/namespace.c:3040
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount+0x2e3/0x3d0 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x2b/0x70 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f5a7388cada
Code: 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5a74682f88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 00007f5a7388cada
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f5a74682fe0
RBP: 00007f5a74683020 R08: 00007f5a74683020 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000000
R13: 0000000020000100 R14: 00007f5a74682fe0 R15: 00000000200005c0
 </TASK>
F2FS-fs (loop1): Failed to read F2FS meta data inode


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
