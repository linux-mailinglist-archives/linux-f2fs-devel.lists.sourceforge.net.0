Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FF961597D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 04:12:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oq4BO-00016P-KE;
	Wed, 02 Nov 2022 03:12:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3J-BhYwkbAJACIJ4u55yBu992x.08805yECyBw87Dy7D.w86@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1oq4BM-00016I-OS for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 03:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=loDCBxhW8nfOBxRigXju8ECAHUU0s3sQgs+KQ5Jx9ac=; b=B3ExCeqOeeTR5ZxjD4oxUvT4Ie
 CYaQ2paOvtiNlMa9ohdynRdfBHWRE3+eYm8VKvk2RpLH3eQaELq+yVO28Ou19akxVT6/p+bp9nnI0
 ytT9FfggkCqpzwwT8/gEK/s4R1gz6J69VK/PRLJTwysdHc4skkFKcmurQgX8H6Kd7tWk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=loDCBxhW8nfOBxRigXju8ECAHUU0s3sQgs+KQ5Jx9ac=; b=K
 3Lvn4WGAxO5UncZ1EHAtAo14OMe0s6x1S8mqTv8Q01pVieoJrPUQdd2o+Evk9lX8CuocRjPra2Y1C
 +0K66OyXCBCF5qZCm/3crFxf2Nek8orsh4XNhXfJSYq87yO5mCWn7XDzFyrq60Uw4MRmQra6R78HB
 /34NyHlqUzKqNk4Y=;
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oq4BJ-0007fl-C9 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 03:12:48 +0000
Received: by mail-io1-f71.google.com with SMTP id
 y26-20020a5d9b1a000000b006bc71505e97so13179216ion.16
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Nov 2022 20:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=loDCBxhW8nfOBxRigXju8ECAHUU0s3sQgs+KQ5Jx9ac=;
 b=4v7fGq5fNp/kXauSJ6Q7UnbCNyDog/pnOTG24JmOYu284Ic83LEXzM2oAw0W5JD+zd
 HjvynSwabDotKRqNY385bX49JXZwivzfECfBYGGMfdB1dS7fKBjeFjfhds3a4yy5zFoO
 cG6A3Sqv2SQ6598FHwYUPCxsJMxotLEKOYu7e7oXLjvaAtAq3wexJ0PMzLXWHkJEvjzK
 G/7iXtzcTHIT+qkGhYGKNYeYT1R9onum3hZcLexD7/njxUjOtA/cSEQiqB7sFF3xnA3v
 E2x2drkC8has95gwXpiLonLHgzrJ5SQsis3sVqbNlxCRFoZOYerym/u9RGTNLHejgTL3
 W2YA==
X-Gm-Message-State: ACrzQf3zBKlwm3+Kuzp8D1VoG9L5QnP+nBejmZu3NEPeybYVZ4Jp/9ld
 NonIo0s4zanccoEDaAtZ/uVnzm+ciD5Gjinjcs/0E27kBt5C
X-Google-Smtp-Source: AMsMyM4FWUFn2gUJUy/c9Ed7RcOX5BhfGlQHvi6AQyy32RMNxsBhf+r8JeU616o57TxtUZzsK3HUNpv4V3ZJe2N6OqeaEkVr1dUn
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:606:b0:300:c570:74d6 with SMTP id
 t6-20020a056e02060600b00300c57074d6mr3754548ils.152.1667358759824; Tue, 01
 Nov 2022 20:12:39 -0700 (PDT)
Date: Tue, 01 Nov 2022 20:12:39 -0700
In-Reply-To: <000000000000f48ffe05ec534218@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000097b4b005ec743600@google.com>
From: syzbot <syzbot+8c1c6ffb39e290968f8d@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: b229b6ca5abb Merge tag 'perf-tools-fixes-for-v6.1-2022-10-..
 git tree: upstream console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=12e47046880000
 kernel config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.71 listed in list.dnswl.org]
X-Headers-End: 1oq4BJ-0007fl-C9
Subject: Re: [f2fs-dev] [syzbot] INFO: task hung in f2fs_issue_checkpoint
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

HEAD commit:    b229b6ca5abb Merge tag 'perf-tools-fixes-for-v6.1-2022-10-..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12e47046880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a66c6c673fb555e8
dashboard link: https://syzkaller.appspot.com/bug?extid=8c1c6ffb39e290968f8d
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1585b5ea880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1551f6da880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ba5b49fa77de/disk-b229b6ca.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7c061f2ae4dc/vmlinux-b229b6ca.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bc45c1300e9b/bzImage-b229b6ca.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f95889b8a293/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8c1c6ffb39e290968f8d@syzkaller.appspotmail.com

INFO: task syz-executor969:3642 blocked for more than 143 seconds.
      Not tainted 6.1.0-rc2-syzkaller-00105-gb229b6ca5abb #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor969 state:D stack:28520 pid:3642  ppid:3605   flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5191 [inline]
 __schedule+0xae9/0x53f0 kernel/sched/core.c:6503
 schedule+0xda/0x1b0 kernel/sched/core.c:6579
 schedule_timeout+0x1db/0x2a0 kernel/time/timer.c:1911
 do_wait_for_common kernel/sched/completion.c:85 [inline]
 __wait_for_common+0x1ca/0x5c0 kernel/sched/completion.c:106
 f2fs_issue_checkpoint+0x358/0x460 fs/f2fs/checkpoint.c:1882
 f2fs_sync_fs+0x240/0x4c0 fs/f2fs/super.c:1656
 sync_fs_one_sb fs/sync.c:84 [inline]
 sync_fs_one_sb+0x107/0x140 fs/sync.c:80
 iterate_supers+0x13c/0x290 fs/super.c:723
 ksys_sync+0xa8/0x150 fs/sync.c:104
 __do_sys_sync+0xa/0x10 fs/sync.c:113
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fa42b72e519
RSP: 002b:00007ffc2d6fae78 EFLAGS: 00000246
 ORIG_RAX: 00000000000000a2
RAX: ffffffffffffffda RBX: 0000000020010ba0 RCX: 00007fa42b72e519
RDX: 00007fa42b6ec363 RSI: 0000000000000003 RDI: 0000000000004c00
RBP: 0000000000000000 R08: 0000555556fc22c0 R09: 0000000000000000
R10: 00007ffc2d6fab80 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc2d6faea0 R14: 00007ffc2d6fae8c R15: 00007ffc2d6fae90
 </TASK>
INFO: task syz-executor969:3643 blocked for more than 144 seconds.
      Not tainted 6.1.0-rc2-syzkaller-00105-gb229b6ca5abb #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor969 state:D
 stack:28848 pid:3643  ppid:3603   flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5191 [inline]
 __schedule+0xae9/0x53f0 kernel/sched/core.c:6503
 schedule+0xda/0x1b0 kernel/sched/core.c:6579
 schedule_timeout+0x1db/0x2a0 kernel/time/timer.c:1911
 do_wait_for_common kernel/sched/completion.c:85 [inline]
 __wait_for_common+0x1ca/0x5c0 kernel/sched/completion.c:106
 f2fs_issue_checkpoint+0x358/0x460 fs/f2fs/checkpoint.c:1882
 f2fs_sync_fs+0x240/0x4c0 fs/f2fs/super.c:1656
 sync_fs_one_sb fs/sync.c:84 [inline]
 sync_fs_one_sb+0x107/0x140 fs/sync.c:80
 iterate_supers+0x13c/0x290 fs/super.c:723
 ksys_sync+0xa8/0x150 fs/sync.c:104
 __do_sys_sync+0xa/0x10 fs/sync.c:113
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fa42b72e519
RSP: 002b:00007ffc2d6fae78 EFLAGS: 00000246
 ORIG_RAX: 00000000000000a2
RAX: ffffffffffffffda RBX: 0000000020010ba0 RCX: 00007fa42b72e519
RDX: 00007fa42b6ec363 RSI: 0000000000000003 RDI: 0000000000004c00
RBP: 0000000000000000 R08: 0000555556fc22c0 R09: 0000000000000000
R10: 00007ffc2d6fab80 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc2d6faea0 R14: 00007ffc2d6fae8c R15: 00007ffc2d6fae90
 </TASK>
INFO: task syz-executor969:3644 blocked for more than 145 seconds.
      Not tainted 6.1.0-rc2-syzkaller-00105-gb229b6ca5abb #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor969 state:D stack:28544 pid:3644  ppid:3602   flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5191 [inline]
 __schedule+0xae9/0x53f0 kernel/sched/core.c:6503
 schedule+0xda/0x1b0 kernel/sched/core.c:6579
 schedule_timeout+0x1db/0x2a0 kernel/time/timer.c:1911
 do_wait_for_common kernel/sched/completion.c:85 [inline]
 __wait_for_common+0x1ca/0x5c0 kernel/sched/completion.c:106
 f2fs_issue_checkpoint+0x358/0x460 fs/f2fs/checkpoint.c:1882
 f2fs_sync_fs+0x240/0x4c0 fs/f2fs/super.c:1656
 sync_fs_one_sb fs/sync.c:84 [inline]
 sync_fs_one_sb+0x107/0x140 fs/sync.c:80
 iterate_supers+0x13c/0x290 fs/super.c:723
 ksys_sync+0xa8/0x150 fs/sync.c:104
 __do_sys_sync+0xa/0x10 fs/sync.c:113
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fa42b72e519
RSP: 002b:00007ffc2d6fae78 EFLAGS: 00000246 ORIG_RAX: 00000000000000a2
RAX: ffffffffffffffda RBX: 0000000020010ba0 RCX: 00007fa42b72e519
RDX: 00007fa42b6ec363 RSI: 0000000000000003 RDI: 0000000000004c00
RBP: 0000000000000000 R08: 0000555556fc22c0 R09: 0000000000000000
R10: 00007ffc2d6fab80 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc2d6faea0 R14: 00007ffc2d6fae8c R15: 00007ffc2d6fae90
 </TASK>
INFO: task syz-executor969:3645 blocked for more than 146 seconds.
      Not tainted 6.1.0-rc2-syzkaller-00105-gb229b6ca5abb #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor969 state:D
 stack:28400 pid:3645  ppid:3608   flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5191 [inline]
 __schedule+0xae9/0x53f0 kernel/sched/core.c:6503
 schedule+0xda/0x1b0 kernel/sched/core.c:6579
 schedule_timeout+0x1db/0x2a0 kernel/time/timer.c:1911
 do_wait_for_common kernel/sched/completion.c:85 [inline]
 __wait_for_common+0x1ca/0x5c0 kernel/sched/completion.c:106
 f2fs_issue_checkpoint+0x358/0x460 fs/f2fs/checkpoint.c:1882
 f2fs_sync_fs+0x240/0x4c0 fs/f2fs/super.c:1656
 sync_fs_one_sb fs/sync.c:84 [inline]
 sync_fs_one_sb+0x107/0x140 fs/sync.c:80
 iterate_supers+0x13c/0x290 fs/super.c:723
 ksys_sync+0xa8/0x150 fs/sync.c:104
 __do_sys_sync+0xa/0x10 fs/sync.c:113
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fa42b72e519
RSP: 002b:00007ffc2d6fae78 EFLAGS: 00000246
 ORIG_RAX: 00000000000000a2
RAX: ffffffffffffffda RBX: 0000000020010ba0 RCX: 00007fa42b72e519
RDX: 00007fa42b6ec363 RSI: 0000000000000003 RDI: 0000000000004c00
RBP: 0000000000000000 R08: 0000555556fc22c0 R09: 0000000000000000
R10: 00007ffc2d6fab80 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc2d6faea0 R14: 00007ffc2d6fae8c R15: 00007ffc2d6fae90
 </TASK>
INFO: task syz-executor969:3646 blocked for more than 147 seconds.
      Not tainted 6.1.0-rc2-syzkaller-00105-gb229b6ca5abb #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor969 state:D
 stack:28520 pid:3646  ppid:3607   flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5191 [inline]
 __schedule+0xae9/0x53f0 kernel/sched/core.c:6503
 schedule+0xda/0x1b0 kernel/sched/core.c:6579
 schedule_timeout+0x1db/0x2a0 kernel/time/timer.c:1911
 do_wait_for_common kernel/sched/completion.c:85 [inline]
 __wait_for_common+0x1ca/0x5c0 kernel/sched/completion.c:106
 f2fs_issue_checkpoint+0x358/0x460 fs/f2fs/checkpoint.c:1882
 f2fs_sync_fs+0x240/0x4c0 fs/f2fs/super.c:1656
 sync_fs_one_sb fs/sync.c:84 [inline]
 sync_fs_one_sb+0x107/0x140 fs/sync.c:80
 iterate_supers+0x13c/0x290 fs/super.c:723
 ksys_sync+0xa8/0x150 fs/sync.c:104
 __do_sys_sync+0xa/0x10 fs/sync.c:113
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fa42b72e519
RSP: 002b:00007ffc2d6fae78 EFLAGS: 00000246
 ORIG_RAX: 00000000000000a2
RAX: ffffffffffffffda RBX: 0000000020010ba0 RCX: 00007fa42b72e519
RDX: 00007fa42b6ec363 RSI: 0000000000000003 RDI: 0000000000004c00
RBP: 0000000000000000 R08: 0000555556fc22c0 R09: 0000000000000000
R10: 00007ffc2d6fab80 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc2d6faea0 R14: 00007ffc2d6fae8c R15: 00007ffc2d6fae90
 </TASK>
INFO: task syz-executor969:3647 blocked for more than 148 seconds.
      Not tainted 6.1.0-rc2-syzkaller-00105-gb229b6ca5abb #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor969 state:D
 stack:25760 pid:3647  ppid:3606   flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5191 [inline]
 __schedule+0xae9/0x53f0 kernel/sched/core.c:6503
 schedule+0xda/0x1b0 kernel/sched/core.c:6579
 schedule_timeout+0x1db/0x2a0 kernel/time/timer.c:1911
 do_wait_for_common kernel/sched/completion.c:85 [inline]
 __wait_for_common+0x1ca/0x5c0 kernel/sched/completion.c:106
 f2fs_issue_checkpoint+0x358/0x460 fs/f2fs/checkpoint.c:1882
 f2fs_sync_fs+0x240/0x4c0 fs/f2fs/super.c:1656
 sync_fs_one_sb fs/sync.c:84 [inline]
 sync_fs_one_sb+0x107/0x140 fs/sync.c:80
 iterate_supers+0x13c/0x290 fs/super.c:723
 ksys_sync+0xa8/0x150 fs/sync.c:104
 __do_sys_sync+0xa/0x10 fs/sync.c:113
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fa42b72e519
RSP: 002b:00007ffc2d6fae78 EFLAGS: 00000246
 ORIG_RAX: 00000000000000a2
RAX: ffffffffffffffda RBX: 0000000020010ba0 RCX: 00007fa42b72e519
RDX: 00007fa42b6ec363 RSI: 0000000000000003 RDI: 0000000000004c00
RBP: 0000000000000000 R08: 0000555556fc22c0 R09: 0000000000000000
R10: 00007ffc2d6fab80 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc2d6faea0 R14: 00007ffc2d6fae8c R15: 00007ffc2d6fae90
 </TASK>
INFO: lockdep is turned off.
NMI backtrace for cpu 0
CPU: 0 PID: 27 Comm: khungtaskd Not tainted 6.1.0-rc2-syzkaller-00105-gb229b6ca5abb #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/11/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 nmi_cpu_backtrace.cold+0x24/0x18a lib/nmi_backtrace.c:111
 nmi_trigger_cpumask_backtrace+0x32f/0x3c0 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:148 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:220 [inline]
 watchdog+0xc71/0xfc0 kernel/hung_task.c:377
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 PID: 9 Comm: kworker/u4:0 Not tainted 6.1.0-rc2-syzkaller-00105-gb229b6ca5abb #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/11/2022
Workqueue: events_unbound toggle_allocation_gate
RIP: 0010:native_apic_mem_read arch/x86/include/asm/apic.h:112 [inline]
RIP: 0010:__xapic_wait_icr_idle arch/x86/kernel/apic/ipi.c:107 [inline]
RIP: 0010:__default_send_IPI_dest_field+0x2e/0x130 arch/x86/kernel/apic/ipi.c:156
Code: fc 55 53 89 d3 48 83 ec 08 83 fe 02 74 73 a0 60 f8 eb ff ff fb ff ff 84 c0 74 08 3c 03 0f 8e a8 00 00 00 8b 04 25 00 c3 5f ff <48> bd 60 f8 eb ff ff fb ff ff f6 c4 10 74 1e f3 90 0f b6 45 00 84
RSP: 0018:ffffc900000e78a0 EFLAGS: 00000046
RAX: 00000000000008fb RBX: 0000000000000800 RCX: 0000000000000000
RDX: 0000000000000800 RSI: 00000000000000fb RDI: 0000000000000001
RBP: 1ffff9200001cf1d R08: 0000000000000005 R09: 0000000000000001
R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000001
R13: ffffc900000e7908 R14: 0000000000000002 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000562976970990 CR3: 000000000bc8e000 CR4: 0000000000350ee0
Call Trace:
 <TASK>
 _flat_send_IPI_mask+0x4e/0x60 arch/x86/kernel/apic/apic_flat_64.c:56
 arch_send_call_function_single_ipi arch/x86/include/asm/smp.h:109 [inline]
 send_call_function_single_ipi+0x1e9/0x3b0 kernel/sched/core.c:3750
 smp_call_function_many_cond+0xe64/0x10a0 kernel/smp.c:967
 on_each_cpu_cond_mask+0x56/0xa0 kernel/smp.c:1155
 on_each_cpu include/linux/smp.h:71 [inline]
 text_poke_sync arch/x86/kernel/alternative.c:1311 [inline]
 text_poke_bp_batch+0x3f1/0x6b0 arch/x86/kernel/alternative.c:1555
 text_poke_flush arch/x86/kernel/alternative.c:1670 [inline]
 text_poke_flush arch/x86/kernel/alternative.c:1667 [inline]
 text_poke_finish+0x16/0x30 arch/x86/kernel/alternative.c:1677
 arch_jump_label_transform_apply+0x13/0x20 arch/x86/kernel/jump_label.c:146
 jump_label_update+0x32f/0x410 kernel/jump_label.c:801
 static_key_disable_cpuslocked+0x152/0x1b0 kernel/jump_label.c:207
 static_key_disable+0x16/0x20 kernel/jump_label.c:215
 toggle_allocation_gate mm/kfence/core.c:814 [inline]
 toggle_allocation_gate+0x183/0x390 mm/kfence/core.c:792
 process_one_work+0x9bf/0x1710 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
