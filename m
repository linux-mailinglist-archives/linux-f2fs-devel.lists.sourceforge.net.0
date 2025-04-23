Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2C4A98188
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Apr 2025 09:50:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u7Urv-00027N-5m;
	Wed, 23 Apr 2025 07:50:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3jZsIaAkbAC4cijUKVVObKZZSN.QYYQVOecObMYXdOXd.MYW@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1u7Urp-00026Y-3z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Apr 2025 07:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VSKtXzbeEK9AbIC3smKkMKPobrSVNoSlrl9FplPF804=; b=MOTdRfOnTTLt2KB7fv1LDuc/kJ
 87H4oT/3qVest0cEHzTAfQgJ2QRJVpy3Pse04KNt2LA+lIbxFhF0q7JySQwBXbsZ4dkUDUsWF/iBH
 GUueGAA/SqTwsOtjDUnhhtUBhmMsycZdXqYhQlg2a4QkceoXa/FdP82jDG52PhKazlAA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VSKtXzbeEK9AbIC3smKkMKPobrSVNoSlrl9FplPF804=; b=I
 1WbXFl/aP4xxhglPPdTm6DvtBetS+HIYVFVIDgXrE4V78DreGm1maTlZK+wwW0XhL9Xd9oJYyqdLC
 9lnH4yV1PvYPgkCLp+uXzzZWNbqGgK2Uc2msFN7xkOyLA1ZGI9R4f49oiq33rMECisibeQjKpV6oI
 +kvEF2pbPVpwr++4=;
Received: from mail-io1-f79.google.com ([209.85.166.79])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u7UrY-0006n9-VP for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Apr 2025 07:50:00 +0000
Received: by mail-io1-f79.google.com with SMTP id
 ca18e2360f4ac-862dda418a6so841073239f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 23 Apr 2025 00:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745394574; x=1745999374;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VSKtXzbeEK9AbIC3smKkMKPobrSVNoSlrl9FplPF804=;
 b=lWkLdxb7+mmX1GfLNXKFOOPn83MF+Ckx+72l7SqdPoSDnVtXDkPFahS28WMpkDMSdW
 QPWQZ6+3mAKLIbClLkmq5alGYq+UGu9a/DX0jG9RPZAGilxLErtcfEhtFvh8QQU/0rSu
 wrTWk6cjWZukk73v7C/Q/2myx1UPsxkcgV5eFfAhG5OoxMw/CraY0h0qYC1fDPY+6h7+
 Pse+rgIMlKuUlLaEUWK4tuWDj99piBBAmDP+Y9btjR1G35o9i2Jt2XZFWUXINl4dmNhN
 lY1XSQZqmR46g5klEVmffXwFAH+diMxVsbiE+1gW4Rn/ry/5wzamh4I94GvQzYD3aLZO
 9hNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkYKCdHh48Z8OdI8T8SMzJoMrrHrm/ymh4N7CnXALq9E6sreNRySdMEkt/A+ZvV8DqYRQTLqL39pcsC73wQxdz@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzPN1mHRCNNTfmNWdpbADxFib0ZNZDhuiUalKrRSKM5SDfpMj33
 ePhs6V7qtnSxkWTl50CUnZzEW6/pUrYIBuxeoSpQ8nH5b+4TEdFlTfNCAspZ4Wvf/HaQOyI+Aq4
 Hy5zS/dro13nxfZjhr/PkiGq0Lqm9uzZy1gJndDT/O3hwrso5dCmPwwk=
X-Google-Smtp-Source: AGHT+IHvkow66BMhG/TSSICfHddGnFKQ1S6/ST+RAgW16u672roFKspEn7cEMe8LQrIh1dVhqlBlBAWDDVJS8J+NLsZf6ebK+43H
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1648:b0:3d6:d145:2ffb with SMTP id
 e9e14a558f8ab-3d89428c8f1mr216463595ab.21.1745394573985; Wed, 23 Apr 2025
 00:49:33 -0700 (PDT)
Date: Wed, 23 Apr 2025 00:49:33 -0700
In-Reply-To: <675101f3.050a0220.17bd51.0081.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68089b8d.050a0220.36a438.000a.GAE@google.com>
From: syzbot <syzbot+effe7da6578cd423f98f@syzkaller.appspotmail.com>
To: brauner@kernel.org, chao@kernel.org, jack@suse.cz, jaegeuk@kernel.org, 
 kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 viro@zeniv.linux.org.uk
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: bc3372351d0c Merge tag 'for-6.15-rc3-tag' of git://git.ker..
 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=138cdccc580000
 kernel config: https://syzkaller.a [...] 
 Content analysis details:   (2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.79 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.79 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.79 listed in list.dnswl.org]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1u7UrY-0006n9-VP
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] INFO: task hung in do_truncate (3)
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

HEAD commit:    bc3372351d0c Merge tag 'for-6.15-rc3-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=138cdccc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3bbffc3b5b4301e1
dashboard link: https://syzkaller.appspot.com/bug?extid=effe7da6578cd423f98f
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17c8ac70580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6c893a6bd7cc/disk-bc337235.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6c31d81cbcae/vmlinux-bc337235.xz
kernel image: https://storage.googleapis.com/syzbot-assets/acf5d144656b/bzImage-bc337235.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/53b1b110f131/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=16d4f204580000)
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/3185ba5a394f/mount_4.gz
  fsck result: OK (log: https://syzkaller.appspot.com/x/fsck.log?x=14ebe7ac580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+effe7da6578cd423f98f@syzkaller.appspotmail.com

INFO: task syz.9.68:6713 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc3-syzkaller-00019-gbc3372351d0c #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.9.68        state:D stack:27592 pid:6713  tgid:6701  ppid:6519   task_flags:0x400140 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x1b33/0x51f0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0x163/0x360 kernel/sched/core.c:6860
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6917
 rwsem_down_write_slowpath+0xedd/0x1420 kernel/locking/rwsem.c:1176
 __down_write_common kernel/locking/rwsem.c:1304 [inline]
 __down_write kernel/locking/rwsem.c:1313 [inline]
 down_write+0x1da/0x220 kernel/locking/rwsem.c:1578
 inode_lock include/linux/fs.h:867 [inline]
 do_truncate+0x20e/0x310 fs/open.c:63
 vfs_truncate+0x4a6/0x540 fs/open.c:115
 do_sys_truncate+0xd8/0x190 fs/open.c:138
 __do_sys_truncate fs/open.c:150 [inline]
 __se_sys_truncate fs/open.c:148 [inline]
 __x64_sys_truncate+0x5b/0x70 fs/open.c:148
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6c9918e169
RSP: 002b:00007f6c983dd038 EFLAGS: 00000246 ORIG_RAX: 000000000000004c
RAX: ffffffffffffffda RBX: 00007f6c993b6080 RCX: 00007f6c9918e169
RDX: 0000000000000000 RSI: 0000000000008001 RDI: 00002000000000c0
RBP: 00007f6c99210a68 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f6c993b6080 R15: 00007ffc2675ba78


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
