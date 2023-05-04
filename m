Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 351456F6AE0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 May 2023 14:08:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puXkq-0008JR-6l;
	Thu, 04 May 2023 12:08:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1puXkp-0008JG-Jx
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 12:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wNXgW3IUOd3JPYpCTbxQP/K2tp1fZ34lCUjyZE8GVpM=; b=a+Z0GxS9mw6zEgQ98gk1Jed21d
 vQ4VMw1NIBycdvOGhjiEAArqbNbMZ+SUiUhqsgfzrkfCIFnkh+zabsKZJpdfob60swY576Qxg+fid
 /U6v882+AcgPHmr1g22ZYwEBJVrVHhIcARS472K8Ugrw3ddKsBYPSqZIjmj8VQRtF/9A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wNXgW3IUOd3JPYpCTbxQP/K2tp1fZ34lCUjyZE8GVpM=; b=JxJNvCm51VQ50SeTxabuO+d1hP
 kdUoYHKJYEUb+E+kmEvoXCDx+yLW9HAHd6sLxwiKL0rjNqAWQNbMBmuJ3S4rpZeoaYkLfchZ4z6+s
 d9j3CP7JAo9whbDNrG9A1DIqUtI5drUHKe3o1eyJsP5PLe8IUptgPjuvy2gznZfE5ZhA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puXkp-00DwLN-Pl for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 12:08:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 696E3633A0;
 Thu,  4 May 2023 12:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B27C433EF;
 Thu,  4 May 2023 12:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683202085;
 bh=c5fHNZL9gOzBsNhK0yGMsJoyKVL5D1e08PMrRpEg6W4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=VMm0aaiaP/f6HZUlefG+lLRiWMw8jAWz5osg6aTLPdj4RWj4fgrfXmt0B1OFRyY6D
 jbN3lgI2Hs24f419n3Fo1fLuj4k4hSqo/l5FLaGPLMPcNaAJ8qTyJPGWW26s5W9+cF
 R3nOi0seg2jolpgfKtCVj3NW5K5CiGgFXez6bE/MNRh0JxLtQtE/ziqtLiGT1l0zLY
 vb2wsXJK0VSAx8RkbDaRR6Kahv8o7SQvf1UnfJKPbjxBa0xurNOIA3g7JaJfNyiF3m
 zttRSHkFDEsDtH3HjCCNJblN3P6lBV8bVVooreCYN76ESKUqB4rozUUxdDRrkO/2f8
 poLDeLG4sD7eg==
Message-ID: <fb9b6de8-1efc-eeea-7acb-09d291590576@kernel.org>
Date: Thu, 4 May 2023 20:08:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: syzbot <syzbot+eb6201248f684e99b9f8@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <0000000000000534da05faa4d3d4@google.com>
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
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puXkp-00DwLN-Pl
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
