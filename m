Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCAA6F34D6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 May 2023 19:05:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ptWxc-0003IB-Fp;
	Mon, 01 May 2023 17:05:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3QfFPZAkbAIw8EF0q11u7q55yt.w44w1uA8u7s439u39.s42@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1ptWxb-0003I3-3B for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 May 2023 17:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c7hKOKbJMl2YcfkxcJZJbcJ0r0WbQba+Lj4vLNvcKOE=; b=auEME1VJUnwr0z+SdfOjVO3viS
 tXZqvpO98BUxRUbBUBBb8zVVb5otrOTuf7lLbW19Nwv1WyCKtntBoKP+FLuByAVKkMeVcLPxqFbiT
 OkbPr04n60LDcdayHYteuNVHOenks3gtGmMIlqd6gdbyepqNRvzcCj/MjfqC+joAAJMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c7hKOKbJMl2YcfkxcJZJbcJ0r0WbQba+Lj4vLNvcKOE=; b=j
 4hlX21vNe6mTmMwRLY0Z257kODTEx5LEhK6JL2OrrU/GoqGyYnTYHlOEyZw0kXVfowszO8DgIklDX
 Yb2XQW2Fjtzo0eLf2IttTCyap0E949OSZIYUC5YDu6XyHc6LKQzVSDAD4H0XHRmt/huwra1qtP9mE
 wLMEPfI1nqbDBb7g=;
Received: from mail-io1-f77.google.com ([209.85.166.77])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ptWxb-0001o1-9u for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 May 2023 17:05:11 +0000
Received: by mail-io1-f77.google.com with SMTP id
 ca18e2360f4ac-76659fe1ac7so363877939f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 May 2023 10:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682960705; x=1685552705;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c7hKOKbJMl2YcfkxcJZJbcJ0r0WbQba+Lj4vLNvcKOE=;
 b=QZpFmrE4mBZgIzFpobn97EcaS5cTB1ZW6/4w9CaSYCa/5EbpptINeA9MAnIDuVc/YY
 ux4wA/nwoOTPKVKot0TKFvyzfPwLRPo3kBA0ofeoaodY7KHWe4vN0rHBbGLnLhFuNfvs
 JVpMT2bNopRsOTaGkAfLVPutsrh25TWRp6UCGud9F/kHENRZabY2qaoAZ+SaX6yWPOCd
 auKoYRMGBTC/lget4bsM7zVvvMLRKWA9jUONEMJr0pyqnMGRJi7AHuHQ7zV+0pgfn6ms
 Zbf1XuCjaH4HlRBkq0PqA/mCQ4bHVSbCgLgRBUJQ5GFdrOmmt7x6c028eqCKZTO7/p/D
 A+Tg==
X-Gm-Message-State: AC+VfDy2cfyaEb8swBujiTTRaNQzTeaFraTCfMBx41vYjOJSfzxIJYE3
 s00xhcu1psdFQzfdw9wsusmX8yGfgiHF1LCXl7GqPWBxq5pf
X-Google-Smtp-Source: ACHHUZ5FVEo4YIYIOxSOTqYoStsO2FMW1fltRzaNlRIlAPBCKX6aQmNn7FN7CSNEMFtrbbLgQtxJDHAg67n5/kE75ozY5FZzLBwM
MIME-Version: 1.0
X-Received: by 2002:a02:6207:0:b0:40f:9262:b588 with SMTP id
 d7-20020a026207000000b0040f9262b588mr5871886jac.6.1682960705456; Mon, 01 May
 2023 10:05:05 -0700 (PDT)
Date: Mon, 01 May 2023 10:05:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000534da05faa4d3d4@google.com>
From: syzbot <syzbot+eb6201248f684e99b9f8@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 58390c8ce1bd
 Merge tag 'iommu-updates-v6.4' of git://git.k.. git tree: upstream
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=136e6ef8280000 kernel config:
 https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.77 listed in list.dnswl.org]
X-Headers-End: 1ptWxb-0001o1-9u
Subject: [f2fs-dev] [syzbot] [f2fs?] WARNING: lock held when returning to
 user space in f2fs_write_single_data_page
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

HEAD commit:    58390c8ce1bd Merge tag 'iommu-updates-v6.4' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=136e6ef8280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5eadbf0d3c2ece89
dashboard link: https://syzkaller.appspot.com/bug?extid=eb6201248f684e99b9f8
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16bbb03c280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=140d36f8280000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/60130779f509/disk-58390c8c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d7f0cdd29b71/vmlinux-58390c8c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/de415ad52ae4/bzImage-58390c8c.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/dc89d01cd6e9/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+eb6201248f684e99b9f8@syzkaller.appspotmail.com

syz-executor768: attempt to access beyond end of device
loop0: rw=2049, sector=77824, nr_sectors = 2048 limit=63271
syz-executor768: attempt to access beyond end of device
loop0: rw=2049, sector=79872, nr_sectors = 2048 limit=63271
================================================
WARNING: lock held when returning to user space!
6.3.0-syzkaller-12049-g58390c8ce1bd #0 Not tainted
------------------------------------------------
syz-executor768/4998 is leaving the kernel with locks still held!
1 lock held by syz-executor768/4998:
 #0: ffff88807e800448 (&sbi->node_write){++++}-{3:3}, at: f2fs_down_read fs/f2fs/f2fs.h:2087 [inline]
 #0: ffff88807e800448 (&sbi->node_write){++++}-{3:3}, at: f2fs_write_single_data_page+0xa10/0x1d50 fs/f2fs/data.c:2842


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
