Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC2348E725
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Jan 2022 10:09:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n8IaL-0002zW-6p; Fri, 14 Jan 2022 09:09:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <3vD3hYQkbANEFLM7x881ExCC50.3BB381HF1EzBAG1AG.zB9@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1n8IaI-0002zL-OK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Jan 2022 09:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=grHxCRd7/fDYY0i9cGDsjoRzJRJ5aOkbW3ALA1psZtI=; b=ev7gW4VmawxR4jyxZCwiPWu6kn
 +8LZJP+hR2MYcy84MSG+9EuiXIG4qqASV4oDRATG+qlsdUUFFE74Qme8SjzhByHwQ1M/Vy2eIOupV
 9NLt8LAdYW1rysDlIwB1HkYG2Fq1ZZRcaWMZbjwHDFnDTmR/Ljly+5UP2qc9qvjXFzy4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=grHxCRd7/fDYY0i9cGDsjoRzJRJ5aOkbW3ALA1psZtI=; b=F
 F9dLvtStR4hJnj/L0W2GTuqFwuH3yL4sp60owg2hzNEukv/JVSkKW0z1M2GOsEC+oE4tUp70Y2azw
 NKuYEMvGoe1tVYm8Fm2qgph3nnzX58g1kKZED7ssatoc0yELda0kF/AiXjiROiYq5znQo2s/dCA1Z
 bBR3tDixGuKDvCOY=;
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1n8IaI-00FPMU-Ii
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Jan 2022 09:09:23 +0000
Received: by mail-io1-f69.google.com with SMTP id
 s203-20020a6b2cd4000000b00604f8ca7282so5262968ios.22
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 14 Jan 2022 01:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=grHxCRd7/fDYY0i9cGDsjoRzJRJ5aOkbW3ALA1psZtI=;
 b=RHsT0x7b1HGlqLb3hUiWXyrNmvG4PMfpu9jYd4sZAZQ/Qa7QzgxtuQi75rN/DgxViO
 8mUX7WKf2BPJH/iseP3RzcR6MlRn9wWhet4tJFndSaW/psaByBS7ZVE7Xc3t5pNLHkys
 la9ySTt9u3cHcnJph0BBn9wj1I/yvjpOIYIB9kBSasVl+hipKL1B5MQS2+qFvQ9uB7+V
 Js/wEoZqJpWtVdvT4ctTnLR0MWAN+bHqlxZEKPmFqGQZb2oQ9Ut7pXQhVOcKXuBoj1uW
 V87RXeNab+rBXnP4UBDU+SZs5anhGaQ7A4fo8WCpmUxqlmgr4l7CvobLQpNGOjbEm5rF
 ot0w==
X-Gm-Message-State: AOAM5300qz62BckBpbjdOX2sNMd22DWCbL64a7mSq+t4hB9mONGybHg8
 Hld8Tw6mwElb+uDFbTRwIdMnv4vtLJwtU8MLThpSFEtzO5hx
X-Google-Smtp-Source: ABdhPJzrtzL3KtaKjcbS2baa8Qd4awayCo48Py4S2a3t1Oj2zYk/kDJec2Lpeaz7tQ2eeoftXXRshiw/OHvPgFXiLmNUMwVJAmyC
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3c6:: with SMTP id
 g6mr3954432iov.213.1642151356982; 
 Fri, 14 Jan 2022 01:09:16 -0800 (PST)
Date: Fri, 14 Jan 2022 01:09:16 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004cede805d58728c3@google.com>
From: syzbot <syzbot+0b9cadf5fc45a98a5083@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 57c149e506d5
 Add linux-next specific files for 20220110 git tree: linux-next console
 output:
 https://syzkaller.appspot.com/x/log.txt?x=15cb8b77b00000 kernel config:
 https://syzkaller.apps [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.69 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.69 listed in wl.mailspike.net]
X-Headers-End: 1n8IaI-00FPMU-Ii
Subject: [f2fs-dev] [syzbot] possible deadlock in f2fs_write_checkpoint
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

HEAD commit:    57c149e506d5 Add linux-next specific files for 20220110
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15cb8b77b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2f1cca5543ac6349
dashboard link: https://syzkaller.appspot.com/bug?extid=0b9cadf5fc45a98a5083
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0b9cadf5fc45a98a5083@syzkaller.appspotmail.com

============================================
WARNING: possible recursive locking detected
5.16.0-rc8-next-20220110-syzkaller #0 Not tainted
--------------------------------------------
f2fs_ckpt-7:2/4139 is trying to acquire lock:
ffff88807c598390 (&sem->internal_rwsem#2){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2149 [inline]
ffff88807c598390 (&sem->internal_rwsem#2){+.+.}-{3:3}, at: f2fs_write_checkpoint+0x535/0x5d00 fs/f2fs/checkpoint.c:1615

but task is already holding lock:
ffff88807c599338 (&sem->internal_rwsem#2){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2149 [inline]
ffff88807c599338 (&sem->internal_rwsem#2){+.+.}-{3:3}, at: __write_checkpoint_sync fs/f2fs/checkpoint.c:1744 [inline]
ffff88807c599338 (&sem->internal_rwsem#2){+.+.}-{3:3}, at: __checkpoint_and_complete_reqs+0xdd/0x360 fs/f2fs/checkpoint.c:1764

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&sem->internal_rwsem#2);
  lock(&sem->internal_rwsem#2);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

1 lock held by f2fs_ckpt-7:2/4139:
 #0: ffff88807c599338 (&sem->internal_rwsem#2){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2149 [inline]
 #0: ffff88807c599338 (&sem->internal_rwsem#2){+.+.}-{3:3}, at: __write_checkpoint_sync fs/f2fs/checkpoint.c:1744 [inline]
 #0: ffff88807c599338 (&sem->internal_rwsem#2){+.+.}-{3:3}, at: __checkpoint_and_complete_reqs+0xdd/0x360 fs/f2fs/checkpoint.c:1764

stack backtrace:
CPU: 0 PID: 4139 Comm: f2fs_ckpt-7:2 Not tainted 5.16.0-rc8-next-20220110-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_deadlock_bug kernel/locking/lockdep.c:2956 [inline]
 check_deadlock kernel/locking/lockdep.c:2999 [inline]
 validate_chain kernel/locking/lockdep.c:3788 [inline]
 __lock_acquire.cold+0x149/0x3ab kernel/locking/lockdep.c:5027
 lock_acquire kernel/locking/lockdep.c:5639 [inline]
 lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5604
 down_write+0x90/0x150 kernel/locking/rwsem.c:1514
 f2fs_down_write fs/f2fs/f2fs.h:2149 [inline]
 f2fs_write_checkpoint+0x535/0x5d00 fs/f2fs/checkpoint.c:1615
 __write_checkpoint_sync fs/f2fs/checkpoint.c:1745 [inline]
 __checkpoint_and_complete_reqs+0xea/0x360 fs/f2fs/checkpoint.c:1764
 issue_checkpoint_thread+0xdf/0x250 fs/f2fs/checkpoint.c:1795
 kthread+0x2e9/0x3a0 kernel/kthread.c:377
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
 </TASK>


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
