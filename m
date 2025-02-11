Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9650BA30341
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2025 07:10:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thjT1-00022y-6a;
	Tue, 11 Feb 2025 06:09:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1thjT0-00022s-33
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 06:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QXe3NcQRfuMSETUVs3XwsJRy8bj08mFkk/2I+uAOCBk=; b=G9suVn72JQTIeTnlQqgC17I3ot
 r8yb4HxD0QfV5npwqU9HtTMKPN/JRdQ0lTuB6+RWuXcnw71PK43lTsvPRypKrbtdG9K3eEacHkr1y
 IdWtmzE+Jww0OU7A6IRfLGzWu8A9fqOrtS2vtY/W5Ye2+XgbkmRhMbEuvzQ4X6lRYgKo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QXe3NcQRfuMSETUVs3XwsJRy8bj08mFkk/2I+uAOCBk=; b=DNsYrPV3ODAHxzux89ZRi0CrdZ
 cThpUzojci9nNDDB5Gl6cTI6TN+mU6MzWQr6WT3KBMX/N3F/I8QeP6qZBDHZYEcgQ+PLzGfbHpVBT
 2JPJAQDcMAn2wUR6jFsz0ZwWNg91TAMDMsE0l3thmUqVlrjBbHK1Irw9QhPCVFOpTNgI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1thjSy-0004Rp-Jn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 06:09:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9E2EC5C47E0;
 Tue, 11 Feb 2025 06:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60CBC4CEDD;
 Tue, 11 Feb 2025 06:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739254186;
 bh=ecMp9NzXgAfPDtti/3umyr6JhdSqbCGAQwtPeBNYQPs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=TR1XciYLPT9/8V4qrVzVjhJNrG+j4DcRZAlZMoLhYr6+R02N3koDFMPCTQERhLMND
 74GkgskAg7BD/JVRh4rkvby1ZlhFc5ZKUe9OS+YFA+MJnSPetyFu+hJpSwC3DrAWUH
 kq+7wRASzpLOf40DnLsTcaHAq1XCl2fSQhM/sPGaN+AmZjCT+kQ0u+SuRo73tUpKC8
 SgquD2rF3GVyksah8ROV789UXgV/Urtx1ZLHy04/XnFjLDSjD/nVlnTZKnjNzSk3cK
 x6xMQOGs79KxKF3kkpYcrUupycqGpW71Jd1+ixDXsX1j0B7FHTyIufsFqKSMLVEoYe
 FErCFxoBDM6/Q==
Message-ID: <c6764fc9-9ced-4a55-a91d-ae29e3db2433@kernel.org>
Date: Tue, 11 Feb 2025 14:09:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <67aa72bf.050a0220.110943.0035.GAE@google.com>
Content-Language: en-US
In-Reply-To: <67aa72bf.050a0220.110943.0035.GAE@google.com>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test:
 https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
 bugfix/syzbot On 2/11/25 05:42, syzbot wrote: > syzbot has found a reproducer
 for the following issue on: > > HEAD commit: a64dcfb451e2 Linux 6.14-rc2
 > git tree: upstream > console output: https://syzkaller.appspo [...] 
 Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1thjSy-0004Rp-Jn
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in new_curseg (2)
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

On 2/11/25 05:42, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    a64dcfb451e2 Linux 6.14-rc2
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17297b18580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7f246b548ed0635a
> dashboard link: https://syzkaller.appspot.com/bug?extid=15669ec8c35ddf6c3d43
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103943f8580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12da1bdf980000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-a64dcfb4.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/6a816640d31b/vmlinux-a64dcfb4.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/b5cb42ffa4f6/bzImage-a64dcfb4.xz
> mounted in repro #1: https://storage.googleapis.com/syzbot-assets/caba9b9b8f24/mount_0.gz
>   fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=14da1bdf980000)
> mounted in repro #2: https://storage.googleapis.com/syzbot-assets/270c3c4c1558/mount_6.gz
>   fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=121672a4580000)
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com
> 
> F2FS-fs (loop0): Found nat_bits in checkpoint
> F2FS-fs (loop0): Start checkpoint disabled!
> F2FS-fs (loop0): Mounted with checkpoint version = 48b305e6
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/segment.c:2809!
> Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
> CPU: 0 UID: 0 PID: 5304 Comm: syz-executor274 Not tainted 6.14.0-rc2-syzkaller #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> RIP: 0010:get_new_segment fs/f2fs/segment.c:2809 [inline]
> RIP: 0010:new_curseg+0x1f52/0x1f70 fs/f2fs/segment.c:2939
> Code: fb fd e9 1a fa ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 4c fa ff ff 48 89 df e8 59 4e fb fd e9 3f fa ff ff e8 5f b5 94 fd 90 <0f> 0b e8 57 b5 94 fd 90 0f 0b e8 4f b5 94 fd 90 0f 0b e8 47 b5 94
> RSP: 0018:ffffc9000d0af4a8 EFLAGS: 00010293
> RAX: ffffffff842a9a41 RBX: 0000000000000018 RCX: ffff88801ede4880
> RDX: 0000000000000000 RSI: 0000000000000018 RDI: 0000000000000018
> RBP: dffffc0000000000 R08: ffffffff842a8875 R09: fffff52001a15e84
> R10: dffffc0000000000 R11: fffff52001a15e84 R12: 0000000000000018
> R13: ffff888043de5101 R14: 0000000000000018 R15: ffff888038298f58
> FS:  000055556f014380(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 0000000042a82000 CR4: 0000000000352ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  __allocate_new_segment+0x1ce/0x940 fs/f2fs/segment.c:3273
>  f2fs_allocate_new_section fs/f2fs/segment.c:3287 [inline]
>  f2fs_allocate_pinning_section+0xfa/0x4e0 fs/f2fs/segment.c:3301
>  f2fs_expand_inode_data+0x696/0xca0 fs/f2fs/file.c:1849
>  f2fs_fallocate+0x537/0xa10 fs/f2fs/file.c:1959
>  vfs_fallocate+0x623/0x7a0 fs/open.c:338
>  do_vfs_ioctl+0x258c/0x2e40 fs/ioctl.c:885
>  __do_sys_ioctl fs/ioctl.c:904 [inline]
>  __se_sys_ioctl+0x80/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7ffbafdefd99
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffecbc98b98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000400000000080 RCX: 00007ffbafdefd99
> RDX: 00004000000000c0 RSI: 0000000040305828 RDI: 0000000000000005
> RBP: 0030656c69662f2e R08: 000055556f0154c0 R09: 000055556f0154c0
> R10: 0000000000000000 R11: 0000000000000246 R12: 00004000000000c0
> R13: 00004000000000e0 R14: 00004000000000c2 R15: 00007ffbafe3903b
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:get_new_segment fs/f2fs/segment.c:2809 [inline]
> RIP: 0010:new_curseg+0x1f52/0x1f70 fs/f2fs/segment.c:2939
> Code: fb fd e9 1a fa ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 4c fa ff ff 48 89 df e8 59 4e fb fd e9 3f fa ff ff e8 5f b5 94 fd 90 <0f> 0b e8 57 b5 94 fd 90 0f 0b e8 4f b5 94 fd 90 0f 0b e8 47 b5 94
> RSP: 0018:ffffc9000d0af4a8 EFLAGS: 00010293
> RAX: ffffffff842a9a41 RBX: 0000000000000018 RCX: ffff88801ede4880
> RDX: 0000000000000000 RSI: 0000000000000018 RDI: 0000000000000018
> RBP: dffffc0000000000 R08: ffffffff842a8875 R09: fffff52001a15e84
> R10: dffffc0000000000 R11: fffff52001a15e84 R12: 0000000000000018
> R13: ffff888043de5101 R14: 0000000000000018 R15: ffff888038298f58
> FS:  000055556f014380(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 0000000042a82000 CR4: 0000000000352ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
> 
> ---
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
