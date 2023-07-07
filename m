Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8077374B2F8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jul 2023 16:20:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHmJy-0001Iq-HR;
	Fri, 07 Jul 2023 14:20:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qHmJx-0001Ik-C0
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jul 2023 14:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3duEBuglYHJPiW+Zxu6laR0xjOyTgL2sZiY4YxhF0hY=; b=ZNNhb0QyHfzfgKspYJVv6yThYo
 AP6CE5K0sOMSnTN2Wlx7ZPuc5IVO2zfonLeOSWRN+pOCSZpo7Ii/y2ua3gFmAONJojnDAJJJTE1Zq
 bJn2NxBupvsvLiNtFCQ1XHo6PdCeIvoQe4/rRbf5A6ZkftcIOsBjr7Z1Z1HT4+uqQEh4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3duEBuglYHJPiW+Zxu6laR0xjOyTgL2sZiY4YxhF0hY=; b=jIxdUFBcaanguINxsqavJ8TgEh
 k8VMjPHg+1RjS5Zmtx1vQhTvXpE5e8XgtwVQ0Ls3DaiSMQ2b3r56ggfnTpalkASkXcZpibMjsZ+FY
 RO5v2UQ6E+KBPAVTYm2fjdgOq+RJE6FTa3RHN2Y4hL66hXsolXR/dFML/ewhfiVM4D38=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHmJr-0000AU-Cv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jul 2023 14:20:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F2E4619A3;
 Fri,  7 Jul 2023 14:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAC3C433C8;
 Fri,  7 Jul 2023 14:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688739613;
 bh=mNP/gqJLpyaxvzSWcLJtN1wqNRT4VvoT6PdxXISC5Pc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nLvLzEHCHs4XO4acIOVyMtZtmHOZOHtZYAeSf3h969sQ7MChkBNwNvFfMvbIpsBUB
 yfXohAya2vhixmHxuF+O7bv28cJYo/deGNLGVoXHJqjxdX7dRW+vZU1xCXc6zjv/30
 WTV0seOEyGtSKXSeyjfwVmHF5pilJ1oKXo6f4wpYOcHu6tk/Uz5kialL3QWE86QIzg
 /5tAO9fg6aGZi0GucFQXw0m45jnR7yKV1CE4JS4nsNLvAZHpT7JDWbK5JYDJ7PJptg
 z31z/Tlu8KKQQF+mLw/e3g4Klh1HbFSwcX0Hxw6cQ6JG5w3Qzsgde1hdNC84VadVnm
 +WKdwsYZXSB/A==
Date: Fri, 7 Jul 2023 07:20:11 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: syzbot <syzbot+e1246909d526a9d470fa@syzkaller.appspotmail.com>
Message-ID: <ZKgfG5yE+VoMiVsZ@google.com>
References: <000000000000f020a905f061d4c2@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000f020a905f061d4c2@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test:
 git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev-test On 12/21, syzbot wrote: > Hello, > > syzbot found the following
 issue on: > > HEAD commit: 77856d911a8c Merge tag 'arm64-fixes' of
 git://git.kernel.o..
 > git tree: upstream > console+strace: https://s [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHmJr-0000AU-Cv
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] [tmpfs?] kernel BUG in
 f2fs_evict_inode
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
Cc: syzkaller-bugs@googlegroups.com, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test

On 12/21, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    77856d911a8c Merge tag 'arm64-fixes' of git://git.kernel.o..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=17c418c8480000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f967143badd2fa39
> dashboard link: https://syzkaller.appspot.com/bug?extid=e1246909d526a9d470fa
> compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=160ea04f880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17e2a99d880000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/4b424d9203f5/disk-77856d91.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/47fd68051834/vmlinux-77856d91.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/d3091f087a86/bzImage-77856d91.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/36b1377afaef/mount_0.gz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+e1246909d526a9d470fa@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/inode.c:864!
> invalid opcode: 0000 [#1] PREEMPT SMP KASAN
> CPU: 1 PID: 5067 Comm: syz-executor118 Not tainted 6.1.0-syzkaller-13031-g77856d911a8c #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
> RIP: 0010:f2fs_evict_inode+0x1306/0x1310 fs/f2fs/inode.c:864
> Code: ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 8a f5 ff ff 48 89 df e8 4b 51 1a fe e9 7d f5 ff ff e8 e1 b4 c4 fd 0f 0b e8 da b4 c4 fd <0f> 0b 0f 1f 84 00 00 00 00 00 55 41 57 41 56 53 48 89 fb e8 c2 b4
> RSP: 0018:ffffc90003b3f8f8 EFLAGS: 00010293
> RAX: ffffffff83c720e6 RBX: 0000000000000002 RCX: ffff8880251257c0
> RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
> RBP: 0000000000000000 R08: ffffffff83c71bc3 R09: ffffed100e5a41b5
> R10: ffffed100e5a41b5 R11: 1ffff1100e5a41b4 R12: dffffc0000000000
> R13: ffff888072d208f0 R14: ffff888072d20da0 R15: 0000000000000000
> FS:  000055555685a300(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007ffd85832d68 CR3: 00000000726a5000 CR4: 00000000003506e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  evict+0x2a4/0x620 fs/inode.c:664
>  dispose_list fs/inode.c:697 [inline]
>  evict_inodes+0x658/0x700 fs/inode.c:747
>  generic_shutdown_super+0x94/0x310 fs/super.c:480
>  kill_block_super+0x79/0xd0 fs/super.c:1386
>  kill_f2fs_super+0x2f9/0x3c0 fs/f2fs/super.c:4640
>  deactivate_locked_super+0xa7/0xf0 fs/super.c:332
>  cleanup_mnt+0x494/0x520 fs/namespace.c:1291
>  task_work_run+0x243/0x300 kernel/task_work.c:179
>  ptrace_notify+0x29a/0x340 kernel/signal.c:2354
>  ptrace_report_syscall include/linux/ptrace.h:411 [inline]
>  ptrace_report_syscall_exit include/linux/ptrace.h:473 [inline]
>  syscall_exit_work+0x8c/0xe0 kernel/entry/common.c:251
>  syscall_exit_to_user_mode_prepare+0x63/0xc0 kernel/entry/common.c:278
>  __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
>  syscall_exit_to_user_mode+0xa/0x60 kernel/entry/common.c:296
>  do_syscall_64+0x49/0xb0 arch/x86/entry/common.c:86
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7fd8e1d06d97
> Code: 08 00 48 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffd858334a8 EFLAGS: 00000202 ORIG_RAX: 00000000000000a6
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007fd8e1d06d97
> RDX: 00007ffd85833569 RSI: 000000000000000a RDI: 00007ffd85833560
> RBP: 00007ffd85833560 R08: 00000000ffffffff R09: 00007ffd85833340
> R10: 000055555685b653 R11: 0000000000000202 R12: 00007ffd858345d0
> R13: 000055555685b5f0 R14: 00007ffd858334d0 R15: 0000000000000001
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:f2fs_evict_inode+0x1306/0x1310 fs/f2fs/inode.c:864
> Code: ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 8a f5 ff ff 48 89 df e8 4b 51 1a fe e9 7d f5 ff ff e8 e1 b4 c4 fd 0f 0b e8 da b4 c4 fd <0f> 0b 0f 1f 84 00 00 00 00 00 55 41 57 41 56 53 48 89 fb e8 c2 b4
> RSP: 0018:ffffc90003b3f8f8 EFLAGS: 00010293
> RAX: ffffffff83c720e6 RBX: 0000000000000002 RCX: ffff8880251257c0
> RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
> RBP: 0000000000000000 R08: ffffffff83c71bc3 R09: ffffed100e5a41b5
> R10: ffffed100e5a41b5 R11: 1ffff1100e5a41b4 R12: dffffc0000000000
> R13: ffff888072d208f0 R14: ffff888072d20da0 R15: 0000000000000000
> FS:  000055555685a300(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007ffd85832d68 CR3: 00000000726a5000 CR4: 00000000003506e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this issue, for details see:
> https://goo.gl/tpsmEJ#testing-patches


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
