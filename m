Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7918C951A66
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 13:51:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1seCXZ-0003lw-Q6;
	Wed, 14 Aug 2024 11:51:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3PZq8ZgkbAKASYZKALLERAPPID.GOOGLEUSERCONTENT.COM@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1seCXQ-0003li-OL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 11:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wfhPFen+pJGtXri7WMYT8g/C8iSfG1cnFgoXyp9YAIA=; b=K0sr1BATVuxdT/TOwq/cgOWvpN
 Zy/28JCpr8QhM8nEjMmR0nKy7J7kR/9bYsMZ7/zI4VtJ3sCO6mUJPR3mpnHT3/Ex/U6WITAkkslnA
 CzNfgVFzY5XYgZ6qOTBcpyQbJCpucJ/Zn32mWKqTyJHCMnlZdpHCRRYIRDCUCbSD6oXU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wfhPFen+pJGtXri7WMYT8g/C8iSfG1cnFgoXyp9YAIA=; b=g
 SRCQwk4l1KplGRrDDFkVsgb6LDQpW+TQbn+lFvfSm0T/evmSjX9d2BQ4MAfFm1KyoCgJUVJdKdpBf
 FabEBA9+cyHGmaofMaZVyenuX3wYQDvClKdMoqeuNYQCebWi/VEyl4XMWOr1awo4hXoP5h+6wpQGZ
 KTA3Es3xFEDPT/aM=;
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1seCXP-0002zM-Uw for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 11:51:36 +0000
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-824d69be8f7so159983039f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Aug 2024 04:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723636285; x=1724241085;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wfhPFen+pJGtXri7WMYT8g/C8iSfG1cnFgoXyp9YAIA=;
 b=oaagKhqfwu1EHye5IBpGB7q8A6rno9qPa8UD2HjOFY90+KBPZ2Yt3lLmt2L3GKI2yQ
 C26kQ7cn2FaCGsr358/SZSleAH07v9D2ZMPvGCZYf2oxOklPPjVf9UMfgFw5UxtUUQ6a
 BaFSJrEx+UwLcIYxB/n3MvSSnJ4LUESOkf8qQm9hSe8/rr4vOOe/IR1+f+S8LjCXm2Vj
 aNZbi1FoZELvQdMLkpRnHDccdEGfZWGxd+NmBlOuCCJH1vrHrgX19PfxkWA4X0h4hG1W
 ttHT8cfur2cjeTw/2hFQ4FyZqb01f22IdpyZn3V07O/9fsCdOj1pw56GBub4YyztR4Da
 l/WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnMTeZqVm45CXdTktmH9+2uynudP5O9C5tN5/ZuggpnpTln9e7eifgJNMDxxSMXfrI2+64tCNwKOrQ6xIu4OWnMgJxEhM4g7ARakhof7ApnfGNj5G7Ng==
X-Gm-Message-State: AOJu0Yz9SHTLjsPyzyInu16wSaxzOcCgzOk5gnE114nd3TjxPk9bXPXx
 lpmxT8QNxeYARTm3LWNFEf/GZAbamtzYXRD9SoBnsZ5AxIwVjuJjOTkGahhL0rzSKSZhuxS3vnl
 d4bxBhGROL+7+UXGt7fHig3QN7rdjk4QfIkh95/+GXIKMRwmJIeW2/5g=
X-Google-Smtp-Source: AGHT+IHnms+5nTtcNuZshswUQpu1bJOfgn0qohq2NYn9uBNUrbcfJSU6xBHQ46OzBj/w8kmk+ylzaeIIX5haxI+6UaERRc1Wlw0T
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2501:b0:4b7:c9b5:6765 with SMTP id
 8926c6da1cb9f-4cab0a2d383mr138659173.5.1723636285040; Wed, 14 Aug 2024
 04:51:25 -0700 (PDT)
Date: Wed, 14 Aug 2024 04:51:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007dfbdb061fa35855@google.com>
From: syzbot <syzbot+733300ca0a9baca7e245@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: -4.4 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 9e6869691724
 Add linux-next specific files for 20240812 git tree: linux-next
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=1431e405980000 kernel config:
 https://syzkaller.apps [...] 
 Content analysis details:   (-4.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googleapis.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.166.71 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.71 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1seCXP-0002zM-Uw
Subject: [f2fs-dev] [syzbot] [f2fs?] WARNING: lock held when returning to
 user space in f2fs_ioc_start_atomic_write
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

HEAD commit:    9e6869691724 Add linux-next specific files for 20240812
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1431e405980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61ba6f3b22ee5467
dashboard link: https://syzkaller.appspot.com/bug?extid=733300ca0a9baca7e245
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=120ed77d980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=130e0ef3980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f1b086192f50/disk-9e686969.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b457920fb52e/vmlinux-9e686969.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e63ba9cce98a/bzImage-9e686969.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/08b48c782593/mount_0.gz

The issue was bisected to:

commit 374a8881ce4ccf787f5381a39f825cb17a3f6b14
Author: Chao Yu <chao@kernel.org>
Date:   Tue Jun 25 03:13:51 2024 +0000

    f2fs: atomic: fix to forbid dio in atomic_file

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10741429980000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12741429980000
console output: https://syzkaller.appspot.com/x/log.txt?x=14741429980000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+733300ca0a9baca7e245@syzkaller.appspotmail.com
Fixes: 374a8881ce4c ("f2fs: atomic: fix to forbid dio in atomic_file")

F2FS-fs (loop0): Found nat_bits in checkpoint
F2FS-fs (loop0): Mounted with checkpoint version = 48b305e5
syz-executor312: attempt to access beyond end of device
loop0: rw=10241, sector=45096, nr_sectors = 8 limit=40427
================================================
WARNING: lock held when returning to user space!
6.11.0-rc3-next-20240812-syzkaller #0 Not tainted
------------------------------------------------
syz-executor312/5227 is leaving the kernel with locks still held!
1 lock held by syz-executor312/5227:
 #0: ffff8880695aa0e0 (&fi->i_gc_rwsem[READ]){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2196 [inline]
 #0: ffff8880695aa0e0 (&fi->i_gc_rwsem[READ]){+.+.}-{3:3}, at: f2fs_ioc_start_atomic_write+0x2ed/0xac0 fs/f2fs/file.c:2163


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
