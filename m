Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2A193CF18
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2024 09:54:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sXFmY-0001tl-0g;
	Fri, 26 Jul 2024 07:54:30 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3LVajZgkbAKIUabMCNNGTCRRKF.IQQINGWUGTEQPVGPV.EQO@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sXFmW-0001tf-A6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 07:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vnDCOOC3UV8dc6a0qIuJGgDHn4oMM4I2MKMhtLQV5q8=; b=M5sxlz+JNsrDwLo8cfZewJ9vF0
 z8rsx7k5LPfZ4FO4I3gAsvEl2ueRPVSvA5LkvXaR8Ol2cslrqa5KDldSzBJNy8A78EnHFUJ3FieCg
 FqLvhjPsII/fe5EDVi3d8sPlRIk944ksG//pg4yoWXNfWHUM6bS04boObFa3W0EOWWXk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vnDCOOC3UV8dc6a0qIuJGgDHn4oMM4I2MKMhtLQV5q8=; b=k
 8+U4ImBLSB9D6e8K/Xn5W3c814OAaH8dLYmNLxmBYofG4jdMXaF2ki2aKNO/157YUEjMkPBMk4J2m
 0kDlFEw4hvd9grWgGbrEGs0mCSW8AaMAMMV5Qt79OBpEz/NFum8CD30amMA0zNN996H4vnW14oGU8
 s1jty0v+3jaPX2/8=;
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sXFmV-0007Dc-HS for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 07:54:28 +0000
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-80502b81995so135116139f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jul 2024 00:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721980462; x=1722585262;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vnDCOOC3UV8dc6a0qIuJGgDHn4oMM4I2MKMhtLQV5q8=;
 b=mkjj0LXSfuOixivMh9qyJMyW0Ws1gqnlXEd0OPTzGiCUX5PbG14GeMXrBUvL50cOUx
 oocQhS/LSdNiacD+0HzQfnVkDPlKKR60WPnuYW/dsONHIdtFjb8B69624Q/mFZRmho5t
 iB7gW9dG+OqD2XO1QmP29rHkNCoJsTYHGBwj7ozzlJ9EaGMW5MysgS3DhH1R2AlQRIDG
 rKi51CDuOoZsNckm4jSlz8IXrxagIzrTTTMaBN/iUb99ejZnpV1L3iZnJYKSUhckJiG1
 H3peJrPnjSXJGOKnYDHqX9BuI9SO47re2oPoo9NiLe2d/pqfwLdiiOD7E0/+rNMX1v4h
 KDxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS3SM6zwsVX0sxcHO3W9o2EAallY41XJp0+qz4wbWgFNfFf2mfqReYS+QpmuVgl/4gHuJGCNoFsdqdSyvLRRbpi47eJ9WyCdaxsLj3JAZlvCkcbfTzyA==
X-Gm-Message-State: AOJu0YxImiPLjjhdQ+JzT8pm6374nda8jNwEieJSvPU7oUYlBENG2ZCk
 /LuZcMvKpKKgiihq2jdJYdxn3EECvq+ZlPAn0zIg3G2Wl5NoP2A+Y2VTGRysyriMTPqXSszrrH/
 pI3iY4LDEzkl89LmrqVDhcDK/fvpdNysG/ES6ec7eT/Bw4OLel7x3QIM=
X-Google-Smtp-Source: AGHT+IGTiaIgqckHaA2GQY4sMfSe0y7Ns330nWXc2INezDOpG2bIu9XyNhnlvPD25B2z0rB2cIya/K7ELlJjF4im0Ag3ixXSpARU
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2184:b0:39a:e800:eec9 with SMTP id
 e9e14a558f8ab-39ae8010c08mr539575ab.4.1721980461578; Fri, 26 Jul 2024
 00:54:21 -0700 (PDT)
Date: Fri, 26 Jul 2024 00:54:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b90a8e061e21d12f@google.com>
From: syzbot <syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com>
To: brauner@kernel.org, chao@kernel.org, jack@suse.cz, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 viro@zeniv.linux.org.uk
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 1722389b0d86
 Merge tag 'net-6.11-rc1' of git://git.kernel... git tree: upstream
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=14955423980000 kernel config:
 https://syzkaller.a [...] 
 Content analysis details:   (2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googleapis.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.70 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.70 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.70 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.70 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1sXFmV-0007Dc-HS
Subject: [f2fs-dev] [syzbot] [f2fs?] WARNING in rcu_sync_dtor
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

HEAD commit:    1722389b0d86 Merge tag 'net-6.11-rc1' of git://git.kernel...
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14955423980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b698a1b2fcd7ef5f
dashboard link: https://syzkaller.appspot.com/bug?extid=20d7e439f76bbbd863a7
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1237a1f1980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=115edac9980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e3f4ec8ccf7c/disk-1722389b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f19bcd908282/vmlinux-1722389b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d93604974a98/bzImage-1722389b.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/e0d10e1258f5/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 58 at kernel/rcu/sync.c:177 rcu_sync_dtor+0xcd/0x180 kernel/rcu/sync.c:177
Modules linked in:
CPU: 1 UID: 0 PID: 58 Comm: kworker/1:2 Not tainted 6.10.0-syzkaller-12562-g1722389b0d86 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
Workqueue: events destroy_super_work
RIP: 0010:rcu_sync_dtor+0xcd/0x180 kernel/rcu/sync.c:177
Code: 74 19 e8 86 d5 00 00 43 0f b6 44 25 00 84 c0 0f 85 82 00 00 00 41 83 3f 00 75 1d 5b 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 90 <0f> 0b 90 e9 66 ff ff ff 90 0f 0b 90 eb 89 90 0f 0b 90 eb dd 44 89
RSP: 0018:ffffc9000133fb30 EFLAGS: 00010246
RAX: 0000000000000002 RBX: 1ffff11005324477 RCX: ffff8880163f5a00
RDX: 0000000000000000 RSI: ffffffff8c3f9540 RDI: ffff888029922350
RBP: 0000000000000167 R08: ffffffff82092061 R09: 1ffffffff1cbbbd4
R10: dffffc0000000000 R11: fffffbfff1cbbbd5 R12: dffffc0000000000
R13: 1ffff1100532446a R14: ffff888029922350 R15: ffff888029922350
FS:  0000000000000000(0000) GS:ffff8880b9300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055557c167738 CR3: 000000007ada8000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 percpu_free_rwsem+0x41/0x80 kernel/locking/percpu-rwsem.c:42
 destroy_super_work+0xec/0x130 fs/super.c:282
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd40 kernel/workqueue.c:3390
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

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
