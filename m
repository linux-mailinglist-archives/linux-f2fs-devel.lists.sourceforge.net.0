Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B177896A094
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 16:29:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slUXP-000314-H1;
	Tue, 03 Sep 2024 14:29:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1slUXO-00030u-Jd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 14:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K0dKW6U/Se+f+5ziu61dd9bVf1I6OoP9NyFe2phoinw=; b=X6uKWugxFDZQ/IDBR1rjzrRN9f
 OoVjFHTXuD/zJon+/hy7reWuVH4Aq48Plku70BmTVZDmeXEzRMDs1zsyPpZr8trz8W93Ps6eoVhkH
 2RdQiBzZ/PMWAbqW+Mj+cFhdotEqxrMWdEQA0EsN38gM1IpTmiE80f4WA8TGOme9MrsI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K0dKW6U/Se+f+5ziu61dd9bVf1I6OoP9NyFe2phoinw=; b=Nw7SEOg5GKywe57YYeRaXBhMWx
 tZ89xHJ8JTtRS4ZIFF5XbvN2CAhn6pVEq6IjF/gXXz9Gv0KDvgkpXqb8vfSAFkf/T//4DzEifNjot
 s30axCeHn56rCZRo2F4KRxsrPbWJCIoIMMPuufD+8iBCaWyAjDMK9UkJdohtLZEjERoA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slUXN-00023j-L4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 14:29:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A4E2BA43700;
 Tue,  3 Sep 2024 14:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C2FC4CEC4;
 Tue,  3 Sep 2024 14:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725373770;
 bh=WN58fwH7EbY6PBzdDqIJkpil+L7A4/7HqEQ8ZxMEVS0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=DxN3LwBlXaNc4cJHAq352Q5hw2H/fuK4x9RGCZdDlqsSzN+Zu391Vkun8AwYKUa6i
 9VlTv/w6tZYMijcnZhM1K1vi608Nfg/vMgz1iUG4sQ9IPjLfP1Ems1sOP8AwatarKS
 iFRHuOMTJd96bOevl30gX/k5FItZuLZdypT5d+orCkCfduQvbwvksIs8wCf8/wzM3b
 HD8NpHbQYRjBnDVe7/APHKLepZheqqkwUfAucxd8sFHPEilWkdeb9E47X/Myq8BvT7
 W55/O8qzXXHSylKWDKb5BYcRQQPD95lEuh6fXHJh4YuHwv5oyaRX/tuM2fineN1v/F
 p6K/A9u6iwJcQ==
Message-ID: <10d4a49b-c596-418e-969c-0830d678de87@kernel.org>
Date: Tue, 3 Sep 2024 22:29:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <000000000000b0231406204772a1@google.com>
Content-Language: en-US
Autocrypt: addr=chao@kernel.org; keydata=
 xsFNBFYs6bUBEADJuxYGZRMvAEySns+DKVtVQRKDYcHlmj+s9is35mtlhrLyjm35FWJY099R
 6DL9bp8tAzLJOMBn9RuTsu7hbRDErCCTiyXWAsFsPkpt5jgTOy90OQVyTon1i/fDz4sgGOrL
 1tUfcx4m5i5EICpdSuXm0dLsC5lFB2KffLNw/ZfRuS+nNlzUm9lomLXxOgAsOpuEVps7RdYy
 UEC81IYCAnweojFbbK8U6u4Xuu5DNlFqRFe/MBkpOwz4Nb+caCx4GICBjybG1qLl2vcGFNkh
 eV2i8XEdUS8CJP2rnp0D8DM0+Js+QmAi/kNHP8jzr7CdG5tje1WIVGH6ec8g8oo7kIuFFadO
 kwy6FSG1kRzkt4Ui2d0z3MF5SYgA1EWQfSqhCPzrTl4rJuZ72ZVirVxQi49Ei2BI+PQhraJ+
 pVXd8SnIKpn8L2A/kFMCklYUaLT8kl6Bm+HhKP9xYMtDhgZatqOiyVV6HFewfb58HyUjxpza
 1C35+tplQ9klsejuJA4Fw9y4lhdiFk8y2MppskaqKg950oHiqbJcDMEOfdo3NY6/tXHFaeN1
 etzLc1N3Y0pG8qS/mehcIXa3Qs2fcurIuLBa+mFiFWrdfgUkvicSYqOimsrE/Ezw9hYhAHq4
 KoW4LQoKyLbrdOBJFW0bn5FWBI4Jir1kIFHNgg3POH8EZZDWbQARAQABzRlDaGFvIFl1IDxj
 aGFvQGtlcm5lbC5vcmc+wsF3BBMBCgAhBQJWLOm1AhsDBQsJCAcDBRUKCQgLBRYCAwEAAh4B
 AheAAAoJEKTPgB1/p52Gm2MP/0zawCU6QN7TZuJ8R1yfdhYr0cholc8ZuPoGim69udQ3otet
 wkTNARnpuK5FG5la0BxFKPlazdgAU1pt+dTzCTS6a3/+0bXYQ5DwOeBPRWeFFklm5Frmk8sy
 wSTxxEty0UBMjzElczkJflmCiDfQunBpWGy9szn/LZ6jjIVK/BiR7CgwXTdlvKcCEkUlI7MD
 vTj/4tQ3y4Vdx+p7P53xlacTzZkP+b6D2VsjK+PsnsPpKwaiPzVFMUwjt1MYtOupK4bbDRB4
 NIFSNu2HSA0cjsu8zUiiAvhd/6gajlZmV/GLJKQZp0MjHOvFS5Eb1DaRvoCf27L+BXBMH4Jq
 2XIyBMm+xqDJd7BRysnImal5NnQlKnDeO4PrpFq4JM0P33EgnSOrJuAb8vm5ORS9xgRlshXh
 2C0MeyQFxL6l+zolEFe2Nt2vrTFgjYLsm2vPL+oIPlE3j7ToRlmm7DcAqsa9oYMlVTTnPRL9
 afNyrsocG0fvOYFCGvjfog/V56WFXvy9uH8mH5aNOg5xHB0//oG9vUyY0Rv/PrtW897ySEPh
 3jFP/EDI0kKjFW3P6CfYG/X1eaw6NDfgpzjkCf2/bYm/SZLV8dL2vuLBVV+hrT1yM1FcZotP
 WwLEzdgdQffuQwJHovz72oH8HVHD2yvJf2hr6lH58VK4/zB/iVN4vzveOdzlzsFNBFYs6bUB
 EADZTCTgMHkb6bz4bt6kkvj7+LbftBt5boKACy2mdrFFMocT5zM6YuJ7Ntjazk5z3F3IzfYu
 94a41kLY1H/G0Y112wggrxem6uAtUiekR9KnphsWI9lRI4a2VbbWUNRhCQA8ag7Xwe5cDIV5
 qb7r7M+TaKaESRx/Y91bm0pL/MKfs/BMkYsr3wA1OX0JuEpV2YHDW8m2nFEGP6CxNma7vzw+
 JRxNuyJcNi+VrLOXnLR6hZXjShrmU88XIU2yVXVbxtKWq8vlOSRuXkLh9NQOZn7mrR+Fb1EY
 DY1ydoR/7FKzRNt6ejI8opHN5KKFUD913kuT90wySWM7Qx9icc1rmjuUDz3VO+rl2sdd0/1h
 Q2VoXbPFxi6c9rLiDf8t7aHbYccst/7ouiHR/vXQty6vSUV9iEbzm+SDpHzdA8h3iPJs6rAb
 0NpGhy3XKY7HOSNIeHvIbDHTUZrewD2A6ARw1VYg1vhJbqUE4qKoUL1wLmxHrk+zHUEyLHUq
 aDpDMZArdNKpT6Nh9ySUFzlWkHUsj7uUNxU3A6GTum2aU3Gh0CD1p8+FYlG1dGhO5boTIUsR
 6ho73ZNk1bwUj/wOcqWu+ZdnQa3zbfvMI9o/kFlOu8iTGlD8sNjJK+Y/fPK3znFqoqqKmSFZ
 aiRALjAZH6ufspvYAJEJE9eZSX7Rtdyt30MMHQARAQABwsFfBBgBCgAJBQJWLOm1AhsMAAoJ
 EKTPgB1/p52GPpoP/2LOn/5KSkGHGmdjzRoQHBTdm2YV1YwgADg52/mU68Wo6viStZqcVEnX
 3ALsWeETod3qeBCJ/TR2C6hnsqsALkXMFFJTX8aRi/E4WgBqNvNgAkWGsg5XKB3JUoJmQLqe
 CGVCT1OSQA/gTEfB8tTZAGFwlw1D3W988CiGnnRb2EEqU4pEuBoQir0sixJzFWybf0jjEi7P
 pODxw/NCyIf9GNRNYByUTVKnC7C51a3b1gNs10aTUmRfQuu+iM5yST5qMp4ls/yYl5ybr7N1
 zSq9iuL13I35csBOn13U5NE67zEb/pCFspZ6ByU4zxChSOTdIJSm4/DEKlqQZhh3FnVHh2Ld
 eG/Wbc1KVLZYX1NNbXTz7gBlVYe8aGpPNffsEsfNCGsFDGth0tC32zLT+5/r43awmxSJfx2P
 5aGkpdszvvyZ4hvcDfZ7U5CBItP/tWXYV0DDl8rCFmhZZw570vlx8AnTiC1v1FzrNfvtuxm3
 92Qh98hAj3cMFKtEVbLKJvrc2AO+mQlS7zl1qWblEhpZnXi05S1AoT0gDW2lwe54VfT3ySon
 8Klpbp5W4eEoY21tLwuNzgUMxmycfM4GaJWNCncKuMT4qGVQO9SPFs0vgUrdBUC5Pn5ZJ46X
 mZA0DUz0S8BJtYGI0DUC/jAKhIgy1vAx39y7sAshwu2VILa71tXJ
In-Reply-To: <000000000000b0231406204772a1@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test
 git://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
 wip On 2024/8/22 23:38, syzbot wrote: > syzbot has found a reproducer for
 the following issue on: > > HEAD commit: 872cf28b8df9 Merge tag
 'platform-drivers-x86-v6.11-4'
 of g.. > git tree: upstream > conso [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slUXN-00023j-L4
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_evict_inode (3)
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

On 2024/8/22 23:38, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    872cf28b8df9 Merge tag 'platform-drivers-x86-v6.11-4' of g..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=13ece38d980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4fc2afd52fd008bb
> dashboard link: https://syzkaller.appspot.com/bug?extid=ebea2790904673d7c618
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1344680b980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1034880b980000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/c63409516c62/disk-872cf28b.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/79b2b8c52d3a/vmlinux-872cf28b.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/27cb9df9c339/bzImage-872cf28b.xz
> mounted in repro #1: https://storage.googleapis.com/syzbot-assets/1f04d7ef7499/mount_0.gz
> mounted in repro #2: https://storage.googleapis.com/syzbot-assets/831601ee93df/mount_5.gz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/inode.c:896!
> Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
> CPU: 1 UID: 0 PID: 5217 Comm: syz-executor605 Not tainted 6.11.0-rc4-syzkaller-00033-g872cf28b8df9 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
> RIP: 0010:f2fs_evict_inode+0x1598/0x15c0 fs/f2fs/inode.c:896
> Code: 6e 9b ab fd 31 ff 89 de e8 65 9b ab fd 40 84 ed 75 28 e8 5b 98 ab fd e9 3c ec ff ff e8 51 98 ab fd 90 0f 0b e8 49 98 ab fd 90 <0f> 0b e8 41 98 ab fd 90 0f 0b 90 e9 fc fe ff ff e8 33 98 ab fd e8
> RSP: 0018:ffffc90003497808 EFLAGS: 00010293
> RAX: ffffffff83e7f267 RBX: 0000000000000002 RCX: ffff88801a3e8000
> RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
> RBP: 0000000000000000 R08: ffffffff83e7ec50 R09: 1ffff1100efe9611
> R10: dffffc0000000000 R11: ffffed100efe9612 R12: ffff88807a834000
> R13: ffff888077f4b088 R14: ffff888077f4abe8 R15: dffffc0000000000
> FS:  000055556d6353c0(0000) GS:ffff8880b9300000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f376cbf9000 CR3: 00000000786a0000 CR4: 00000000003506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   <TASK>
>   evict+0x532/0x950 fs/inode.c:704
>   dispose_list fs/inode.c:747 [inline]
>   evict_inodes+0x5f9/0x690 fs/inode.c:797
>   generic_shutdown_super+0x9d/0x2d0 fs/super.c:627
>   kill_block_super+0x44/0x90 fs/super.c:1696
>   kill_f2fs_super+0x344/0x690 fs/f2fs/super.c:4898
>   deactivate_locked_super+0xc4/0x130 fs/super.c:473
>   cleanup_mnt+0x41f/0x4b0 fs/namespace.c:1373
>   task_work_run+0x24f/0x310 kernel/task_work.c:228
>   ptrace_notify+0x2d2/0x380 kernel/signal.c:2402
>   ptrace_report_syscall include/linux/ptrace.h:415 [inline]
>   ptrace_report_syscall_exit include/linux/ptrace.h:477 [inline]
>   syscall_exit_work+0xc6/0x190 kernel/entry/common.c:173
>   syscall_exit_to_user_mode_prepare kernel/entry/common.c:200 [inline]
>   __syscall_exit_to_user_mode_work kernel/entry/common.c:205 [inline]
>   syscall_exit_to_user_mode+0x279/0x370 kernel/entry/common.c:218
>   do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f37740a00a7
> Code: 08 00 48 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 b0 ff ff ff f7 d8 64 89 02 b8
> RSP: 002b:00007ffc120a25e8 EFLAGS: 00000206 ORIG_RAX: 00000000000000a6
> RAX: 0000000000000000 RBX: 0000000000015fbb RCX: 00007f37740a00a7
> RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffc120a26a0
> RBP: 00007ffc120a26a0 R08: 0000000000000000 R09: 0000000000000000
> R10: 00000000ffffffff R11: 0000000000000206 R12: 00007ffc120a3750
> R13: 000055556d636700 R14: 431bde82d7b634db R15: 00007ffc120a36f4
>   </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:f2fs_evict_inode+0x1598/0x15c0 fs/f2fs/inode.c:896
> Code: 6e 9b ab fd 31 ff 89 de e8 65 9b ab fd 40 84 ed 75 28 e8 5b 98 ab fd e9 3c ec ff ff e8 51 98 ab fd 90 0f 0b e8 49 98 ab fd 90 <0f> 0b e8 41 98 ab fd 90 0f 0b 90 e9 fc fe ff ff e8 33 98 ab fd e8
> RSP: 0018:ffffc90003497808 EFLAGS: 00010293
> RAX: ffffffff83e7f267 RBX: 0000000000000002 RCX: ffff88801a3e8000
> RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
> RBP: 0000000000000000 R08: ffffffff83e7ec50 R09: 1ffff1100efe9611
> R10: dffffc0000000000 R11: ffffed100efe9612 R12: ffff88807a834000
> R13: ffff888077f4b088 R14: ffff888077f4abe8 R15: dffffc0000000000
> FS:  000055556d6353c0(0000) GS:ffff8880b9300000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f376bda6000 CR3: 00000000786a0000 CR4: 00000000003506f0
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
