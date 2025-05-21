Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D154ABF315
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 May 2025 13:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkTXcxjW9HMHjVS/W2tKNFOcc+ljssnpmQc1sNYpNOw=; b=iP+ue0MQC/KPrZhLiZFGwB8YJP
	/J5YOFIRG/xUUxzjp6LZMHKLP6QirJHEx4EQLaYqBk92NFax1Oo5NJt3+S9s+xqHr93Vy1EbsKokL
	K4TDH3B7ipdF0jfksj7mnQoTVcEhpsXy82H0tGmh3h+kWFc3n43ccyzxTYXi8/YLH9oY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uHhoJ-0005vq-Ho;
	Wed, 21 May 2025 11:40:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uHho9-0005vd-Em
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 11:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=57H8BLPxe/eygtHAXY225c4fGnnff4H6htigrWwsE9w=; b=mHESwXTmfsioXBnnorPuvAd1a0
 ghtSMg5E8n4+obo99rAcYYeasKqHjNyXJz3TsbRVH+yrrptm3ZrvDzfDRZV5+medmfTIvBLxUKKjN
 RkMSrIs2NUX/jl6RxAHiKE1A2zMclLjo4Ad7OvBxykNzZM9VnzLwr3wchG0zwjAWtNRQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=57H8BLPxe/eygtHAXY225c4fGnnff4H6htigrWwsE9w=; b=dYVZYebtOmXmPIagg04oVFNOOi
 Jhc96eSkbECW6dvmNSeEMxtzqw0Gxc8uugrombFEgHLUnvKCS9XQEyYHL7kzMcuzChbdLNWleY8Sf
 MLVojW6yUnkh/bCUkVF2YBPRDKY8k32r3Y9dG+s8SEaVQobl+cY158PahwlqM+A3pO7U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uHho7-00064s-E9 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 11:40:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 813785C548E;
 Wed, 21 May 2025 11:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6627FC4CEE4;
 Wed, 21 May 2025 11:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747827617;
 bh=5WSMlNxT1LwPIfDc6eIYsGLxWlLYLsM6LuCD2y5QTBQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Cg5t53Ps8tdTSMB63M7Iz7ymhW5ZKbJy/7gmMkcMs43v6GZeoQethck4ONf8Fi486
 btWfZUWomWLle3aIDUJkNXHcyluNAfCm09rXWq+6Vsq2W+NlN9tD7/sDZM7Du3bNDB
 Doig3AaNVcq2CaWqA/BuxmcSkQLPsizWVixnVDVsQqLdZgNiRSO5gxad3OROfnN2+2
 mnSnQqS0bfL47rqdYH4j7uNH975utAVOgIE1NB5/p/kTlhtvzvSQ17V1Xg8UPUshOt
 6yDeJQPjE9miGlbRWN2wDppjSc0FYYSvHt0ES5RQcnCfm5zSljfgnrMQoDHzNLgzWx
 gYpEaeINFtuGA==
Message-ID: <71446a9d-fd2f-4a74-8486-775c56fe782b@kernel.org>
Date: Wed, 21 May 2025 19:40:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com>,
 bp@alien8.de, dave.hansen@linux.intel.com, hanqi@vivo.com, hpa@zytor.com,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, mingo@redhat.com,
 syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org
References: <682d743a.a00a0220.29bc26.0289.GAE@google.com>
Content-Language: en-US
In-Reply-To: <682d743a.a00a0220.29bc26.0289.GAE@google.com>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test:
 https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
 bugfix/syzbot On 5/21/25 14:35, syzbot wrote: > Hello, > > syzbot found the
 following issue on: > > HEAD commit: 3c21441eeffc Merge tag 'acpi-6.15-rc7'
 of git://git.kernel.. > git tree: upstream > console+strace: h [...] 
 Content analysis details:   (-6.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uHho7-00064s-E9
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] INFO: task hung in freeze_super (6)
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot

On 5/21/25 14:35, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    3c21441eeffc Merge tag 'acpi-6.15-rc7' of git://git.kernel..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=176b22d4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ea35e429f965296e
> dashboard link: https://syzkaller.appspot.com/bug?extid=aa5bb5f6860e08a60450
> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=167d2ef4580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13a81f68580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/57d40aff8cb0/disk-3c21441e.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/9f367fd8bfd5/vmlinux-3c21441e.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/4e70f31a61dc/bzImage-3c21441e.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/9e197e7beb8c/mount_0.gz
>   fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=11108ef4580000)
> 
> The issue was bisected to:
> 
> commit 84b5bb8bf0f6a78c232a20c2eecdbb8112ac2703
> Author: Qi Han <hanqi@vivo.com>
> Date:   Fri Oct 25 09:18:23 2024 +0000
> 
>     f2fs: modify f2fs_is_checkpoint_ready logic to allow more data to be written with the CP disable
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10f45ef4580000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=12f45ef4580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=14f45ef4580000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com
> Fixes: 84b5bb8bf0f6 ("f2fs: modify f2fs_is_checkpoint_ready logic to allow more data to be written with the CP disable")
> 
> INFO: task syz-executor328:5836 blocked for more than 143 seconds.
>       Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor328 state:D stack:23432 pid:5836  tgid:5832  ppid:5826   task_flags:0x400140 flags:0x00004006
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5382 [inline]
>  __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
>  __schedule_loop kernel/sched/core.c:6845 [inline]
>  schedule+0x165/0x360 kernel/sched/core.c:6860
>  percpu_down_write+0x28e/0x330 kernel/locking/percpu-rwsem.c:253
>  sb_wait_write fs/super.c:1855 [inline]
>  freeze_super+0x4c2/0xeb0 fs/super.c:2044
>  fs_bdev_freeze+0x19f/0x310 fs/super.c:1484
>  bdev_freeze+0xd8/0x220 block/bdev.c:298
>  f2fs_do_shutdown+0x23d/0x5c0 fs/f2fs/file.c:2367
>  f2fs_ioc_shutdown fs/f2fs/file.c:2459 [inline]
>  __f2fs_ioctl+0x3de9/0xae80 fs/f2fs/file.c:4558
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:906 [inline]
>  __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f836b5ab109
> RSP: 002b:00007f836b55f218 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f836b6386c8 RCX: 00007f836b5ab109
> RDX: 0000200000000080 RSI: 000000008004587d RDI: 0000000000000005
> RBP: 00007f836b6386c0 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f836b604668
> R13: 00002000000000c0 R14: 0000200000000180 R15: 00002000000000e0
>  </TASK>
> INFO: task syz-executor328:5856 blocked for more than 144 seconds.
>       Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor328 state:D stack:24392 pid:5856  tgid:5832  ppid:5826   task_flags:0x400040 flags:0x00004006
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5382 [inline]
>  __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
>  __schedule_loop kernel/sched/core.c:6845 [inline]
>  schedule+0x165/0x360 kernel/sched/core.c:6860
>  io_schedule+0x81/0xe0 kernel/sched/core.c:7742
>  f2fs_balance_fs+0x4b4/0x780 fs/f2fs/segment.c:444
>  f2fs_map_blocks+0x3af1/0x43b0 fs/f2fs/data.c:1791
>  f2fs_expand_inode_data+0x653/0xaf0 fs/f2fs/file.c:1872
>  f2fs_fallocate+0x4f5/0x990 fs/f2fs/file.c:1975
>  vfs_fallocate+0x6a0/0x830 fs/open.c:338
>  ioctl_preallocate fs/ioctl.c:290 [inline]
>  file_ioctl fs/ioctl.c:-1 [inline]
>  do_vfs_ioctl+0x1b8f/0x1eb0 fs/ioctl.c:885
>  __do_sys_ioctl fs/ioctl.c:904 [inline]
>  __se_sys_ioctl+0x82/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f836b5ab109
> RSP: 002b:00007f836b53e218 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f836b6386d8 RCX: 00007f836b5ab109
> RDX: 00002000000000c0 RSI: 0000000040305828 RDI: 0000000000000004
> RBP: 00007f836b6386d0 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f836b604668
> R13: 00002000000000c0 R14: 0000200000000180 R15: 00002000000000e0
>  </TASK>
> INFO: task syz-executor328:5894 blocked for more than 145 seconds.
>       Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor328 state:D stack:24152 pid:5894  tgid:5892  ppid:5825   task_flags:0x400140 flags:0x00004006
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5382 [inline]
>  __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
>  __schedule_loop kernel/sched/core.c:6845 [inline]
>  schedule+0x165/0x360 kernel/sched/core.c:6860
>  percpu_down_write+0x28e/0x330 kernel/locking/percpu-rwsem.c:253
>  sb_wait_write fs/super.c:1855 [inline]
>  freeze_super+0x4c2/0xeb0 fs/super.c:2044
>  fs_bdev_freeze+0x19f/0x310 fs/super.c:1484
>  bdev_freeze+0xd8/0x220 block/bdev.c:298
>  f2fs_do_shutdown+0x23d/0x5c0 fs/f2fs/file.c:2367
>  f2fs_ioc_shutdown fs/f2fs/file.c:2459 [inline]
>  __f2fs_ioctl+0x3de9/0xae80 fs/f2fs/file.c:4558
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:906 [inline]
>  __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f836b5ab109
> RSP: 002b:00007f836b55f218 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f836b6386c8 RCX: 00007f836b5ab109
> RDX: 0000200000000080 RSI: 000000008004587d RDI: 0000000000000005
> RBP: 00007f836b6386c0 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f836b604668
> R13: 00002000000000c0 R14: 0000200000000180 R15: 00002000000000e0
>  </TASK>
> INFO: task syz-executor328:5907 blocked for more than 145 seconds.
>       Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor328 state:D stack:25432 pid:5907  tgid:5892  ppid:5825   task_flags:0x400040 flags:0x00004006
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5382 [inline]
>  __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
>  __schedule_loop kernel/sched/core.c:6845 [inline]
>  schedule+0x165/0x360 kernel/sched/core.c:6860
>  io_schedule+0x81/0xe0 kernel/sched/core.c:7742
>  f2fs_balance_fs+0x4b4/0x780 fs/f2fs/segment.c:444
>  f2fs_map_blocks+0x3af1/0x43b0 fs/f2fs/data.c:1791
>  f2fs_expand_inode_data+0x653/0xaf0 fs/f2fs/file.c:1872
>  f2fs_fallocate+0x4f5/0x990 fs/f2fs/file.c:1975
>  vfs_fallocate+0x6a0/0x830 fs/open.c:338
>  ioctl_preallocate fs/ioctl.c:290 [inline]
>  file_ioctl fs/ioctl.c:-1 [inline]
>  do_vfs_ioctl+0x1b8f/0x1eb0 fs/ioctl.c:885
>  __do_sys_ioctl fs/ioctl.c:904 [inline]
>  __se_sys_ioctl+0x82/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f836b5ab109
> RSP: 002b:00007f836b53e218 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f836b6386d8 RCX: 00007f836b5ab109
> RDX: 00002000000000c0 RSI: 0000000040305828 RDI: 0000000000000004
> RBP: 00007f836b6386d0 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f836b604668
> R13: 00002000000000c0 R14: 0000200000000180 R15: 00002000000000e0
>  </TASK>
> INFO: task syz-executor328:5896 blocked for more than 147 seconds.
>       Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor328 state:D stack:25144 pid:5896  tgid:5893  ppid:5827   task_flags:0x400140 flags:0x00004006
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5382 [inline]
>  __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
>  __schedule_loop kernel/sched/core.c:6845 [inline]
>  schedule+0x165/0x360 kernel/sched/core.c:6860
>  percpu_down_write+0x28e/0x330 kernel/locking/percpu-rwsem.c:253
>  sb_wait_write fs/super.c:1855 [inline]
>  freeze_super+0x4c2/0xeb0 fs/super.c:2044
>  fs_bdev_freeze+0x19f/0x310 fs/super.c:1484
>  bdev_freeze+0xd8/0x220 block/bdev.c:298
>  f2fs_do_shutdown+0x23d/0x5c0 fs/f2fs/file.c:2367
>  f2fs_ioc_shutdown fs/f2fs/file.c:2459 [inline]
>  __f2fs_ioctl+0x3de9/0xae80 fs/f2fs/file.c:4558
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:906 [inline]
>  __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f836b5ab109
> RSP: 002b:00007f836b55f218 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f836b6386c8 RCX: 00007f836b5ab109
> RDX: 0000200000000080 RSI: 000000008004587d RDI: 0000000000000005
> RBP: 00007f836b6386c0 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f836b604668
> R13: 00002000000000c0 R14: 0000200000000180 R15: 00002000000000e0
>  </TASK>
> INFO: task syz-executor328:5908 blocked for more than 147 seconds.
>       Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor328 state:D stack:24984 pid:5908  tgid:5893  ppid:5827   task_flags:0x400040 flags:0x00004006
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5382 [inline]
>  __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
>  __schedule_loop kernel/sched/core.c:6845 [inline]
>  schedule+0x165/0x360 kernel/sched/core.c:6860
>  io_schedule+0x81/0xe0 kernel/sched/core.c:7742
>  f2fs_balance_fs+0x4b4/0x780 fs/f2fs/segment.c:444
>  f2fs_map_blocks+0x3af1/0x43b0 fs/f2fs/data.c:1791
>  f2fs_expand_inode_data+0x653/0xaf0 fs/f2fs/file.c:1872
>  f2fs_fallocate+0x4f5/0x990 fs/f2fs/file.c:1975
>  vfs_fallocate+0x6a0/0x830 fs/open.c:338
>  ioctl_preallocate fs/ioctl.c:290 [inline]
>  file_ioctl fs/ioctl.c:-1 [inline]
>  do_vfs_ioctl+0x1b8f/0x1eb0 fs/ioctl.c:885
>  __do_sys_ioctl fs/ioctl.c:904 [inline]
>  __se_sys_ioctl+0x82/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f836b5ab109
> RSP: 002b:00007f836b53e218 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f836b6386d8 RCX: 00007f836b5ab109
> RDX: 00002000000000c0 RSI: 0000000040305828 RDI: 0000000000000004
> RBP: 00007f836b6386d0 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f836b604668
> R13: 00002000000000c0 R14: 0000200000000180 R15: 00002000000000e0
>  </TASK>
> 
> Showing all locks held in the system:
> 3 locks held by kworker/u8:1/13:
>  #0: ffff888143ad3148 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
>  #0: ffff888143ad3148 ((wq_completion)writeback){+.+.}-{0:0}, at: process_scheduled_works+0x9b1/0x17a0 kernel/workqueue.c:3319
>  #1: ffffc90000127c60 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
>  #1: ffffc90000127c60 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ec/0x17a0 kernel/workqueue.c:3319
>  #2: ffff888079b0a0e0 (&type->s_umount_key#43){++++}-{4:4}, at: super_trylock_shared+0x20/0xf0 fs/super.c:562
> 1 lock held by khungtaskd/31:
>  #0: ffffffff8df3dce0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
>  #0: ffffffff8df3dce0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
>  #0: ffffffff8df3dce0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6764
> 5 locks held by kworker/u8:2/36:
> 3 locks held by kworker/u8:3/53:
>  #0: ffff888143ad3148 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
>  #0: ffff888143ad3148 ((wq_completion)writeback){+.+.}-{0:0}, at: process_scheduled_works+0x9b1/0x17a0 kernel/workqueue.c:3319
>  #1: ffffc90000be7c60 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
>  #1: ffffc90000be7c60 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ec/0x17a0 kernel/workqueue.c:3319
>  #2: ffff8880240c40e0 (&type->s_umount_key#43){++++}-{4:4}, at: super_trylock_shared+0x20/0xf0 fs/super.c:562
> 3 locks held by kworker/u8:5/969:
>  #0: ffff888143ad3148 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
>  #0: ffff888143ad3148 ((wq_completion)writeback){+.+.}-{0:0}, at: process_scheduled_works+0x9b1/0x17a0 kernel/workqueue.c:3319
>  #1: ffffc90003787c60 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
>  #1: ffffc90003787c60 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ec/0x17a0 kernel/workqueue.c:3319
>  #2: ffff8880230a20e0 (&type->s_umount_key#43){++++}-{4:4}, at: super_trylock_shared+0x20/0xf0 fs/super.c:562
> 2 locks held by getty/5576:
>  #0: ffff888030c370a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
>  #1: ffffc900036e32f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x43e/0x1400 drivers/tty/n_tty.c:2222
> 2 locks held by syz-executor328/5836:
>  #0: ffff888022856930 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:289
>  #1: ffff8880230a2420 (sb_writers#9){++++}-{0:0}, at: sb_wait_write fs/super.c:1855 [inline]
>  #1: ffff8880230a2420 (sb_writers#9){++++}-{0:0}, at: freeze_super+0x4c2/0xeb0 fs/super.c:2044
> 3 locks held by syz-executor328/5856:
>  #0: ffff8880230a2420 (sb_writers#9){++++}-{0:0}, at: file_start_write include/linux/fs.h:3041 [inline]
>  #0: ffff8880230a2420 (sb_writers#9){++++}-{0:0}, at: vfs_fallocate+0x62a/0x830 fs/open.c:337
>  #1: ffff888078bcbfd8 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
>  #1: ffff888078bcbfd8 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: f2fs_fallocate+0x24e/0x990 fs/f2fs/file.c:1940
>  #2: ffff888033c5d4f8 (&sbi->pin_sem){+.+.}-{4:4}, at: f2fs_down_write fs/f2fs/f2fs.h:2213 [inline]
>  #2: ffff888033c5d4f8 (&sbi->pin_sem){+.+.}-{4:4}, at: f2fs_expand_inode_data+0x430/0xaf0 fs/f2fs/file.c:1839
> 2 locks held by syz-executor328/5894:
>  #0: ffff888022855db0 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:289
>  #1: ffff888079b0a420 (sb_writers#9){++++}-{0:0}, at: sb_wait_write fs/super.c:1855 [inline]
>  #1: ffff888079b0a420 (sb_writers#9){++++}-{0:0}, at: freeze_super+0x4c2/0xeb0 fs/super.c:2044
> 3 locks held by syz-executor328/5907:
>  #0: ffff888079b0a420 (sb_writers#9){++++}-{0:0}, at: file_start_write include/linux/fs.h:3041 [inline]
>  #0: ffff888079b0a420 (sb_writers#9){++++}-{0:0}, at: vfs_fallocate+0x62a/0x830 fs/open.c:337
>  #1: ffff888074156398 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
>  #1: ffff888074156398 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: f2fs_fallocate+0x24e/0x990 fs/f2fs/file.c:1940
>  #2: ffff888079f554f8 (&sbi->pin_sem){+.+.}-{4:4}, at: f2fs_down_write fs/f2fs/f2fs.h:2213 [inline]
>  #2: ffff888079f554f8 (&sbi->pin_sem){+.+.}-{4:4}, at: f2fs_expand_inode_data+0x430/0xaf0 fs/f2fs/file.c:1839
> 2 locks held by syz-executor328/5896:
>  #0: ffff8880228574b0 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:289
>  #1: ffff8880240c4420 (sb_writers#9){++++}-{0:0}, at: sb_wait_write fs/super.c:1855 [inline]
>  #1: ffff8880240c4420 (sb_writers#9){++++}-{0:0}, at: freeze_super+0x4c2/0xeb0 fs/super.c:2044
> 3 locks held by syz-executor328/5908:
>  #0: ffff8880240c4420 (sb_writers#9){++++}-{0:0}, at: file_start_write include/linux/fs.h:3041 [inline]
>  #0: ffff8880240c4420 (sb_writers#9){++++}-{0:0}, at: vfs_fallocate+0x62a/0x830 fs/open.c:337
>  #1: ffff888074157578 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
>  #1: ffff888074157578 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: f2fs_fallocate+0x24e/0x990 fs/f2fs/file.c:1940
>  #2: ffff88807f9ad4f8 (&sbi->pin_sem){+.+.}-{4:4}, at: f2fs_down_write fs/f2fs/f2fs.h:2213 [inline]
>  #2: ffff88807f9ad4f8 (&sbi->pin_sem){+.+.}-{4:4}, at: f2fs_expand_inode_data+0x430/0xaf0 fs/f2fs/file.c:1839
> 2 locks held by syz-executor328/6364:
>  #0: ffff8880228546b0 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:289
>  #1: ffff88807dedc420 (sb_writers#9){++++}-{0:0}, at: sb_wait_write fs/super.c:1855 [inline]
>  #1: ffff88807dedc420 (sb_writers#9){++++}-{0:0}, at: freeze_super+0x4c2/0xeb0 fs/super.c:2044
> 3 locks held by syz-executor328/6374:
>  #0: ffff88807dedc420 (sb_writers#9){++++}-{0:0}, at: file_start_write include/linux/fs.h:3041 [inline]
>  #0: ffff88807dedc420 (sb_writers#9){++++}-{0:0}, at: vfs_fallocate+0x62a/0x830 fs/open.c:337
>  #1: ffff88806d35a508 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
>  #1: ffff88806d35a508 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: f2fs_fallocate+0x24e/0x990 fs/f2fs/file.c:1940
>  #2: ffff888079e4d4f8 (&sbi->pin_sem){+.+.}-{4:4}, at: f2fs_down_write fs/f2fs/f2fs.h:2213 [inline]
>  #2: ffff888079e4d4f8 (&sbi->pin_sem){+.+.}-{4:4}, at: f2fs_expand_inode_data+0x430/0xaf0 fs/f2fs/file.c:1839
> 2 locks held by syz-executor328/6379:
>  #0: ffff888022855230 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:289
>  #1: ffff888033604420 (sb_writers#9){++++}-{0:0}, at: sb_wait_write fs/super.c:1855 [inline]
>  #1: ffff888033604420 (sb_writers#9){++++}-{0:0}, at: freeze_super+0x4c2/0xeb0 fs/super.c:2044
> 3 locks held by syz-executor328/6382:
>  #0: ffff888033604420 (sb_writers#9){++++}-{0:0}, at: file_start_write include/linux/fs.h:3041 [inline]
>  #0: ffff888033604420 (sb_writers#9){++++}-{0:0}, at: vfs_fallocate+0x62a/0x830 fs/open.c:337
>  #1: ffff88806d037578 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
>  #1: ffff88806d037578 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: f2fs_fallocate+0x24e/0x990 fs/f2fs/file.c:1940
>  #2: ffff8880286b14f8 (&sbi->pin_sem){+.+.}-{4:4}, at: f2fs_down_write fs/f2fs/f2fs.h:2213 [inline]
>  #2: ffff8880286b14f8 (&sbi->pin_sem){+.+.}-{4:4}, at: f2fs_expand_inode_data+0x430/0xaf0 fs/f2fs/file.c:1839
> 
> =============================================
> 
> NMI backtrace for cpu 0
> CPU: 0 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>  nmi_cpu_backtrace+0x39e/0x3d0 lib/nmi_backtrace.c:113
>  nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
>  trigger_all_cpu_backtrace include/linux/nmi.h:158 [inline]
>  check_hung_uninterruptible_tasks kernel/hung_task.c:274 [inline]
>  watchdog+0xfee/0x1030 kernel/hung_task.c:437
>  kthread+0x70e/0x8a0 kernel/kthread.c:464
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
> Sending NMI from CPU 0 to CPUs 1:
> NMI backtrace for cpu 1
> CPU: 1 UID: 0 PID: 5905 Comm: f2fs_gc-7:4 Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> RIP: 0010:__sanitizer_cov_trace_pc+0x0/0x70 kernel/kcov.c:210
> Code: 89 fb e8 23 00 00 00 48 8b 3d 5c c3 d5 0b 48 89 de 5b e9 33 41 55 00 cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 <f3> 0f 1e fa 48 8b 04 24 65 48 8b 0c 25 08 70 72 92 65 8b 15 18 7f
> RSP: 0018:ffffc90004697b90 EFLAGS: 00000206
> RAX: ffffffff818dcd2c RBX: ffff88802fa49e00 RCX: 0000000000000000
> RDX: ffff88802fa49e00 RSI: 0000000000200000 RDI: 0000000000000000
> RBP: 0000000000200000 R08: ffff88803342a007 R09: 1ffff11006685400
> R10: dffffc0000000000 R11: ffffed1006685401 R12: ffff88807f9ac000
> R13: dffffc0000000000 R14: ffff88802fa49e2c R15: dffffc0000000000
> FS:  0000000000000000(0000) GS:ffff8881261f9000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f836b5fec18 CR3: 000000000dd38000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  to_kthread kernel/kthread.c:84 [inline]
>  kthread_should_stop+0x59/0xf0 kernel/kthread.c:169
>  gc_thread_func+0x344/0x2b30 fs/f2fs/gc.c:49
>  kthread+0x70e/0x8a0 kernel/kthread.c:464
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
