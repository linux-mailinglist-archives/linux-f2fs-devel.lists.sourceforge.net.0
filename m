Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0FEA1B0F6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2025 08:31:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tbE9Y-0000iW-5r;
	Fri, 24 Jan 2025 07:30:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tbE9X-0000iI-1y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Jan 2025 07:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oMir6UKnvNgc6hxbMCAFLTh/4zW/OWYSS8JpZ4oi45c=; b=B+QWVjaKk+beU7ttSYPPFhWB26
 uOjqOzNdd7QV9r22gO+x8Ae6WBeuPu+HcrzW2FbR3QuvHM5ZGQ85CFoysIU+OJiZDx3IcrmVpbrGx
 X/MCjcRaJnVYvt4mBF5/KZtuopJdlEXIZZ8h+TpWiLq+/sH2/hrASVP/Fj5c+STmbGnE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oMir6UKnvNgc6hxbMCAFLTh/4zW/OWYSS8JpZ4oi45c=; b=iU5jDW4Gi4rbdOJBNvomszucqt
 pbygFCaZPClPznqVpncBcbyif1wOfMEWl65I1aGbLfUMI55KNL+AyJ44w794LI0yNrnXwGV8Nfd45
 TyppXkg1g//T1ekD2zZYNt2ncxTd+iC/Y9rO8g9/qyS5s+IwnfHwJ7U22gnRpXGA6VJk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tbE9W-0001GT-BH for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Jan 2025 07:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4A08FA40D54;
 Fri, 24 Jan 2025 07:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF89AC4CEDD;
 Fri, 24 Jan 2025 07:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737703848;
 bh=sCuoP9efc2REoQKmSVl+umUkhz7VP2sBjFztWdib3YQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=H2yTaqISV5OLQiyUnbgsjXMIlsU5r8xyeTcSL1YBCV2nEZWtKZoZ+FhircWEEPp9d
 aClnSl+9O/dO1VZdLcOfkvdv1L17EUQfxpHC+BaERta5vAh4jdqsY1okEgIO4xNztl
 7J//KNo39z9+08v97ryPPmQOvhlmxrVQv9deZ83QjMICNBSRyzNZQQL9/nMoHly+Dn
 edps7J2U+fpw5y13KYTqqA52xJ6glgFuvgHrd09ulY3wAE5bgnj31h/jJJxClssbuQ
 PIUcGYgSKdgFaew0cEWciCZ/iMpr0fW0bTTgAww010jvyc/w1eigq/Z+p0sBcLAiO6
 2FFA22r/b91mA==
Message-ID: <2e51d9c8-840d-486f-a1eb-f18500d2f252@kernel.org>
Date: Fri, 24 Jan 2025 15:30:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jianan Huang <huangjianan@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
References: <20250124015042.273336-1-huangjianan@xiaomi.com>
 <20250124055751.283198-1-huangjianan@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250124055751.283198-1-huangjianan@xiaomi.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/24/25 13:57,
 Jianan Huang wrote: > When testing the atomic
 write fix patches, the f2fs_bug_on was > triggered as below: > > [ cut here
 ] > kernel BUG at fs/f2fs/inode.c:93 [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tbE9W-0001GT-BH
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix inconsistent dirty state of
 atomic file
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
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org, jnhuang95@gmail.com,
 yudongbin@xiaomi.com, wanghui33@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/24/25 13:57, Jianan Huang wrote:
> When testing the atomic write fix patches, the f2fs_bug_on was
> triggered as below:
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/inode.c:935!
> Oops: invalid opcode: 0000 [#1] PREEMPT SMP PTI
> CPU: 3 UID: 0 PID: 257 Comm: bash Not tainted 6.13.0-rc1-00033-gc283a70d3497 #5
> RIP: 0010:f2fs_evict_inode+0x50f/0x520
> Call Trace:
>  <TASK>
>  ? __die_body+0x65/0xb0
>  ? die+0x9f/0xc0
>  ? do_trap+0xa1/0x170
>  ? f2fs_evict_inode+0x50f/0x520
>  ? f2fs_evict_inode+0x50f/0x520
>  ? handle_invalid_op+0x65/0x80
>  ? f2fs_evict_inode+0x50f/0x520
>  ? exc_invalid_op+0x39/0x50
>  ? asm_exc_invalid_op+0x1a/0x20
>  ? __pfx_f2fs_get_dquots+0x10/0x10
>  ? f2fs_evict_inode+0x50f/0x520
>  ? f2fs_evict_inode+0x2e5/0x520
>  evict+0x186/0x2f0
>  prune_icache_sb+0x75/0xb0
>  super_cache_scan+0x1a8/0x200
>  do_shrink_slab+0x163/0x320
>  shrink_slab+0x2fc/0x470
>  drop_slab+0x82/0xf0
>  drop_caches_sysctl_handler+0x4e/0xb0
>  proc_sys_call_handler+0x183/0x280
>  vfs_write+0x36d/0x450
>  ksys_write+0x68/0xd0
>  do_syscall_64+0xc8/0x1a0
>  ? arch_exit_to_user_mode_prepare+0x11/0x60
>  ? irqentry_exit_to_user_mode+0x7e/0xa0
> 
> The root cause is: f2fs uses FI_ATOMIC_DIRTIED to indicate dirty
> atomic files during commit. If the inode is dirtied during commit,
> such as by f2fs_i_pino_write, the vfs inode keeps clean and the
> f2fs inode is set to FI_DIRTY_INODE. The FI_DIRTY_INODE flag cann't
> be cleared by write_inode later due to the clean vfs inode. Finally,
> f2fs_bug_on is triggered due to this inconsistent state when evict.
> 
> To reproduce this situation:
> - fd = open("/mnt/test.db", O_WRONLY)
> - ioctl(fd, F2FS_IOC_START_ATOMIC_WRITE)
> - mv /mnt/test.db /mnt/test1.db
> - ioctl(fd, F2FS_IOC_COMMIT_ATOMIC_WRITE)
> - echo 3 > /proc/sys/vm/drop_caches
> 
> To fix this problem, clear FI_DIRTY_INODE after commit, then
> f2fs_mark_inode_dirty_sync will ensure a consistent dirty state.
> 
> Fixes: fccaa81de87e ("f2fs: prevent atomic file from being dirtied before commit")
> Signed-off-by: Yunlei He <heyunlei@xiaomi.com>
> Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
