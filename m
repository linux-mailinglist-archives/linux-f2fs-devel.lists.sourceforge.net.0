Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 525AC6F5B23
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 May 2023 17:29:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puEPo-0000er-An;
	Wed, 03 May 2023 15:29:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1puEPm-0000ek-SR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 May 2023 15:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wNXgW3IUOd3JPYpCTbxQP/K2tp1fZ34lCUjyZE8GVpM=; b=U0ipoo5Omi7YamevCtJIJkhjCH
 3DzYcVuRpkZoISM/wVpNOny01wslXWv6B2FwWD0bpt1IKnjgbpfz8Vqu4Z0Qba32vlkAishIQRjra
 UHh6vjJsZGBfbYq1hOTHvJgF7JP3TZ1PghrTUnfK3Nti1J4ESjm+FTFxbrlroRyBxsxo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wNXgW3IUOd3JPYpCTbxQP/K2tp1fZ34lCUjyZE8GVpM=; b=Ia6aqZP8lQN88yqMUYfusNMfAf
 CaE2m6T3waoGTtUHwB8naKf+KefIP/LEAvN+3fCSc9mBPRHcA3kaej52Diu1L/9RBszgCOtoHivD+
 P1tQJHRukwX76V288yVzpoM3vjVLld3tqeWAtdfKFK3tTBBWrsxNuDJLFP5pYHKxDsZk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puEPm-0005vA-7D for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 May 2023 15:29:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CF0236130D;
 Wed,  3 May 2023 15:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698D9C433EF;
 Wed,  3 May 2023 15:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683127744;
 bh=c5fHNZL9gOzBsNhK0yGMsJoyKVL5D1e08PMrRpEg6W4=;
 h=Date:To:References:From:Subject:In-Reply-To:From;
 b=Fj95HdonyQmZbSiFkZHqpx3KwX9ypTLHx4FgwR4mZ4N8x6dgwXuj2ytfnByfZTOsv
 cpkmVXfgCoWf/k8OljZNJKEnDn9gAxhLVIa40sRfFBCJ7GI4wbM/iBp0yGeH6WHXAV
 2k1s2ZcObPDTo3lqPjNq/akF4C4tCECmlMhUEPBo03SAFKgfNSP1nReBzIhMbmhIOG
 tfF9Ejt01gVUIEsUF55+lw+ZgfDdWkzMmxV4pTGztBejxD19jZRcH4NDq6cqWdGpqD
 OW0cXa+MfJZ+iwdiovYT97HsDShiW4FqXin/mZupp513c0w1PNnG762lZBnsqW0qzK
 as0pz7TP1A9DA==
Message-ID: <5540e94e-d744-bf51-6344-95c8a173e89a@kernel.org>
Date: Wed, 3 May 2023 23:28:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: syzbot <syzbot+eb6201248f684e99b9f8@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <0000000000000534da05faa4d3d4@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <0000000000000534da05faa4d3d4@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/2 1:05, syzbot wrote: > Hello, > > syzbot found
 the following issue on: > > HEAD commit: 58390c8ce1bd Merge tag
 'iommu-updates-v6.4'
 of git://git.k.. > git tree: upstream > console+strace: h [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puEPm-0005vA-7D
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING: lock held when returning
 to user space in f2fs_write_single_data_page
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/2 1:05, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    58390c8ce1bd Merge tag 'iommu-updates-v6.4' of git://git.k..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=136e6ef8280000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5eadbf0d3c2ece89
> dashboard link: https://syzkaller.appspot.com/bug?extid=eb6201248f684e99b9f8
> compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16bbb03c280000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=140d36f8280000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/60130779f509/disk-58390c8c.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/d7f0cdd29b71/vmlinux-58390c8c.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/de415ad52ae4/bzImage-58390c8c.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/dc89d01cd6e9/mount_0.gz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+eb6201248f684e99b9f8@syzkaller.appspotmail.com

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test

> 
> syz-executor768: attempt to access beyond end of device
> loop0: rw=2049, sector=77824, nr_sectors = 2048 limit=63271
> syz-executor768: attempt to access beyond end of device
> loop0: rw=2049, sector=79872, nr_sectors = 2048 limit=63271
> ================================================
> WARNING: lock held when returning to user space!
> 6.3.0-syzkaller-12049-g58390c8ce1bd #0 Not tainted
> ------------------------------------------------
> syz-executor768/4998 is leaving the kernel with locks still held!
> 1 lock held by syz-executor768/4998:
>   #0: ffff88807e800448 (&sbi->node_write){++++}-{3:3}, at: f2fs_down_read fs/f2fs/f2fs.h:2087 [inline]
>   #0: ffff88807e800448 (&sbi->node_write){++++}-{3:3}, at: f2fs_write_single_data_page+0xa10/0x1d50 fs/f2fs/data.c:2842
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
> If the bug is already fixed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to change bug's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the bug is a duplicate of another bug, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
