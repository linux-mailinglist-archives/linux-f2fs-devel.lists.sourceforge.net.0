Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A6B971C0E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2024 16:03:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sneys-0003Ca-2F;
	Mon, 09 Sep 2024 14:03:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sneym-0003C3-US
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 14:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OckRHMhfk8IZ/Td/yDoTGF4sPznJuEjLhatZPodNeX8=; b=UugBX9YTEfWfxb9bSJwTKvMLCu
 ijDw6Nt9Ku6Z758UVo/HYMdEWE0GPpeLlLim8Q4bZgDUxgJz5zR9Vz4MLsIiXfk92ZwQko+OIfEQR
 ojjQrEfxj9coz7L28SLFPGek1cRK0j5kwFjb0MstGcT8XqGgDyl1kP/KT7Do+WjZBgmw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OckRHMhfk8IZ/Td/yDoTGF4sPznJuEjLhatZPodNeX8=; b=RGue+nJUJ5S07R8RKpohQ+R+i+
 SQx2EiWncAoewBE+l40J9Lb9Ki1IHBU5qXAJB/TcJuWJHDq4+TPp8h1DUGbMT63YM1HkkfKovYizo
 814cOCE0eFLtDGccN+mVWAWvgmc7cGGnjD4TQ5UvCGGSWgHyM4GxRoj8oILc7zDWlq88=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sneym-0002Zw-Of for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 14:02:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6EDD7A43C4A;
 Mon,  9 Sep 2024 14:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C08C4CEC5;
 Mon,  9 Sep 2024 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725890565;
 bh=wnLgePkGM9YiICg864sAXY6woeBp8cqEKUTOstcrdgQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=R6jGEmzqAQFHlf/HNC+pTLDu6UgUfXUvMzohZ9A2cU0lxbEoTQlWgN7piut0QkNCG
 qPJCvX1oAbHlzuFWzwTCMF9CjAQFBKvetuAcVfQOpMRYbxL//89rBCnqdat3Tnqxtp
 Shv+te5fWKfmvoh6nF93QWs1cbr28eiQAK+HyYlqYW9iTfBJDTPesIHO0y4WxK4MMM
 hDl0GWrImmAYFaO4cVjXwwLRrStpSi5Vk5huX5mgV1Bs/mSaGz84xWILYl9SJf4yzQ
 Qxh2ZvybJ+JbnnPiBWRvmihaCDO+CM7hBuO2+O9lubLlKrMaybn4+pkigIypfdo7Br
 kV5XW0GN+ODBg==
Message-ID: <2f736900-9642-4824-9e41-e304c250857a@kernel.org>
Date: Mon, 9 Sep 2024 22:02:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+341e5f32ebafbb46b81c@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <000000000000f0ee5b0621ab694b@google.com>
Content-Language: en-US
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <000000000000f0ee5b0621ab694b@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test
 git://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
 wip On 2024/9/9 16:19, syzbot wrote: > Hello, > > syzbot found the following
 issue on: > > HEAD commit: 89f5e14d05b4 Merge tag
 'timers_urgent_for_v6.11_rc7'
 of gi.. > git tree: upstream > console output: [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sneym-0002Zw-Of
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in new_curseg
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip

On 2024/9/9 16:19, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    89f5e14d05b4 Merge tag 'timers_urgent_for_v6.11_rc7' of gi..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14085f29980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=58a85aa6925a8b78
> dashboard link: https://syzkaller.appspot.com/bug?extid=341e5f32ebafbb46b81c
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1614c807980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13854e00580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-89f5e14d.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/dfc310daee41/vmlinux-89f5e14d.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/a92f22c06568/bzImage-89f5e14d.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/c7aaf1741c93/mount_1.gz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+341e5f32ebafbb46b81c@syzkaller.appspotmail.com
> 
> F2FS-fs (loop0): inject no free segment in get_new_segment of __allocate_new_segment+0x1ce/0x940 fs/f2fs/segment.c:3167
> F2FS-fs (loop0): Stopped filesystem due to reason: 7
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/segment.c:2748!
> Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
> CPU: 0 UID: 0 PID: 5109 Comm: syz-executor304 Not tainted 6.11.0-rc6-syzkaller-00363-g89f5e14d05b4 #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> RIP: 0010:get_new_segment fs/f2fs/segment.c:2748 [inline]
> RIP: 0010:new_curseg+0x1f61/0x1f70 fs/f2fs/segment.c:2836
> Code: 24 58 e8 12 b9 f2 ff eb 05 e8 4b 71 96 fd 48 8b 7c 24 70 e8 91 ac c6 07 48 8b 7c 24 10 31 f6 ba 07 00 00 00 e8 50 1e f6 ff 90 <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 90 90 90 90 90 90 90
> RSP: 0018:ffffc9000179f548 EFLAGS: 00010246
> RAX: 8fb07c62f860e300 RBX: 00000000000002b2 RCX: 8fb07c62f860e300
> RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
> RBP: ffff8880125250c8 R08: ffffffff817401bc R09: 1ffff920002f3e20
> R10: dffffc0000000000 R11: fffff520002f3e21 R12: ffff8880008c2700
> R13: ffff8880125250cc R14: 1ffff110024a4a19 R15: 00000000000002b2
> FS:  0000555593e0e380(0000) GS:ffff88801fe00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f6cf8cb40f8 CR3: 000000001255a000 CR4: 0000000000350ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   <TASK>
>   __allocate_new_segment+0x1ce/0x940 fs/f2fs/segment.c:3167
>   f2fs_allocate_new_section fs/f2fs/segment.c:3181 [inline]
>   f2fs_allocate_pinning_section+0xfa/0x4e0 fs/f2fs/segment.c:3195
>   f2fs_expand_inode_data+0x5d6/0xbb0 fs/f2fs/file.c:1799
>   f2fs_fallocate+0x448/0x960 fs/f2fs/file.c:1903
>   vfs_fallocate+0x553/0x6c0 fs/open.c:334
>   do_vfs_ioctl+0x2592/0x2e50 fs/ioctl.c:886
>   __do_sys_ioctl fs/ioctl.c:905 [inline]
>   __se_sys_ioctl+0x81/0x170 fs/ioctl.c:893
>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>   do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f6cf8c37229
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 21 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffeb5036b58 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0030656c69662f2e RCX: 00007f6cf8c37229
> RDX: 00000000200000c0 RSI: 0000000040305828 RDI: 0000000000000004
> RBP: 0000000000000000 R08: 00007ffeb5036b90 R09: 00007ffeb5036b90
> R10: 00007ffeb5036b90 R11: 0000000000000246 R12: 00007ffeb5036b7c
> R13: 0000000000000002 R14: 431bde82d7b634db R15: 00007ffeb5036bb0
>   </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:get_new_segment fs/f2fs/segment.c:2748 [inline]
> RIP: 0010:new_curseg+0x1f61/0x1f70 fs/f2fs/segment.c:2836
> Code: 24 58 e8 12 b9 f2 ff eb 05 e8 4b 71 96 fd 48 8b 7c 24 70 e8 91 ac c6 07 48 8b 7c 24 10 31 f6 ba 07 00 00 00 e8 50 1e f6 ff 90 <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 90 90 90 90 90 90 90
> RSP: 0018:ffffc9000179f548 EFLAGS: 00010246
> RAX: 8fb07c62f860e300 RBX: 00000000000002b2 RCX: 8fb07c62f860e300
> RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
> RBP: ffff8880125250c8 R08: ffffffff817401bc R09: 1ffff920002f3e20
> R10: dffffc0000000000 R11: fffff520002f3e21 R12: ffff8880008c2700
> R13: ffff8880125250cc R14: 1ffff110024a4a19 R15: 00000000000002b2
> FS:  0000555593e0e380(0000) GS:ffff88801fe00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f6cf8cb40f8 CR3: 000000001255a000 CR4: 0000000000350ef0
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
