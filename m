Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3761A8765D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Apr 2025 05:50:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4ApU-0002qo-MI;
	Mon, 14 Apr 2025 03:49:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u4ApT-0002qi-Ep
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 03:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t7xrqrWkDOv8jdWXgRVoresGKoXhcbXpS3ric/htzxQ=; b=UJVwmsCuwWFvRvIwDRuABgsGly
 nXuqRKuul3b0ogX0A0+Mg44rcRrIfjDn2VGLKQFDhg+1X3BTnaoEVQfQRJi5rBHYRiOyvzABq9NXV
 xyyjWNcq7CpgTvWFCE9UJHYiMySQqFk/mzDEavX7zZv1PLkP7bb5Zfhtugq/d89+zgB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t7xrqrWkDOv8jdWXgRVoresGKoXhcbXpS3ric/htzxQ=; b=N1UvsR3xTLGwf06abgVUB6yWHn
 boC/w/oeB2EMfWT5WRPzjkNvCEEuqCExyCluxBzFQgExWI93+Hs9G/+TuHmgNc9UZntGT36zu71EO
 x3sVOsLHnwwqYncj3pa/Cm/v/IEzjHTpa3uKLp2zxzRaSOBQNyfiy2wT/kkTNi+jc5co=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u4ApD-00031h-0R for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 03:49:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ED38DA46B7F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Apr 2025 03:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C76C4CEE2;
 Mon, 14 Apr 2025 03:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744602569;
 bh=lUcWQccR/bhfsFgTbctZHB2jErDD9Wr06l4iz/xmVTA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=P9HV8NwIZZKJwXjQSLmrjRhR43gD86iTf6H7jryKuyUtAuNXiJHZVQjySJKsZgFgE
 C4OKXYPeFTKnEwEq0TbnYu/0q84agZxKWSC+oFHZTfIVG4osNLt2sxPLX973nUfI4s
 lij7g2WDDfeCam3vG3BOtSLL8BF2qbl6skvaALO3YCF6eOrrRqWqB7qzpYVy4TcYmc
 cfWeWLaI1G7Yid3GU+rMU3vQKo5uHvhN+2wop8CR5ASeJRvXyqNd5E3n63o73dQ07d
 Q1fZYlWCbXd4iCKjOTGHGA02TYeS+dSgSloYfO+KUl2hIqED68kPDTSinn4b71rm7Z
 yeqR5NIZFE17Q==
Message-ID: <48ccf640-fe56-4253-9155-27aa32b2d9b8@kernel.org>
Date: Mon, 14 Apr 2025 11:49:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250412214226.2907676-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250412214226.2907676-1-jaegeuk@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/13/25 05:42, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > WARNING: CPU: 1 PID: 9426 at fs/inode.c:417 drop_nlink+0xac/0xd0 >
 home/cc/linux/fs/inode.c:417
 > Modules linked in: > CPU: 1 UID: 0 PID: 94 [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u4ApD-00031h-0R
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent kernel warning due to negative
 i_nlink from corrupted image
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/13/25 05:42, Jaegeuk Kim via Linux-f2fs-devel wrote:
> WARNING: CPU: 1 PID: 9426 at fs/inode.c:417 drop_nlink+0xac/0xd0
> home/cc/linux/fs/inode.c:417
> Modules linked in:
> CPU: 1 UID: 0 PID: 9426 Comm: syz-executor568 Not tainted
> 6.14.0-12627-g94d471a4f428 #2 PREEMPT(full)
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> 1.13.0-1ubuntu1.1 04/01/2014
> RIP: 0010:drop_nlink+0xac/0xd0 home/cc/linux/fs/inode.c:417
> Code: 48 8b 5d 28 be 08 00 00 00 48 8d bb 70 07 00 00 e8 f9 67 e6 ff
> f0 48 ff 83 70 07 00 00 5b 5d e9 9a 12 82 ff e8 95 12 82 ff 90
> &lt;0f&gt; 0b 90 c7 45 48 ff ff ff ff 5b 5d e9 83 12 82 ff e8 fe 5f e6
> ff
> RSP: 0018:ffffc900026b7c28 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff8239710f
> RDX: ffff888041345a00 RSI: ffffffff8239717b RDI: 0000000000000005
> RBP: ffff888054509ad0 R08: 0000000000000005 R09: 0000000000000000
> R10: 0000000000000000 R11: ffffffff9ab36f08 R12: ffff88804bb40000
> R13: ffff8880545091e0 R14: 0000000000008000 R15: ffff8880545091e0
> FS:  000055555d0c5880(0000) GS:ffff8880eb3e3000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f915c55b178 CR3: 0000000050d20000 CR4: 0000000000352ef0
> Call Trace:
>  <task>
>  f2fs_i_links_write home/cc/linux/fs/f2fs/f2fs.h:3194 [inline]
>  f2fs_drop_nlink+0xd1/0x3c0 home/cc/linux/fs/f2fs/dir.c:845
>  f2fs_delete_entry+0x542/0x1450 home/cc/linux/fs/f2fs/dir.c:909
>  f2fs_unlink+0x45c/0x890 home/cc/linux/fs/f2fs/namei.c:581
>  vfs_unlink+0x2fb/0x9b0 home/cc/linux/fs/namei.c:4544
>  do_unlinkat+0x4c5/0x6a0 home/cc/linux/fs/namei.c:4608
>  __do_sys_unlink home/cc/linux/fs/namei.c:4654 [inline]
>  __se_sys_unlink home/cc/linux/fs/namei.c:4652 [inline]
>  __x64_sys_unlink+0xc5/0x110 home/cc/linux/fs/namei.c:4652
>  do_syscall_x64 home/cc/linux/arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xc7/0x250 home/cc/linux/arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fb3d092324b
> Code: 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66
> 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 57 00 00 00 0f 05
> &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01
> 48
> RSP: 002b:00007ffdc232d938 EFLAGS: 00000206 ORIG_RAX: 0000000000000057
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fb3d092324b
> RDX: 00007ffdc232d960 RSI: 00007ffdc232d960 RDI: 00007ffdc232d9f0
> RBP: 00007ffdc232d9f0 R08: 0000000000000001 R09: 00007ffdc232d7c0
> R10: 00000000fffffffd R11: 0000000000000206 R12: 00007ffdc232eaf0
> R13: 000055555d0cebb0 R14: 00007ffdc232d958 R15: 0000000000000001
>  </task>
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
