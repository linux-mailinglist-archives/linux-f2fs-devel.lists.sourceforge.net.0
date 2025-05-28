Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F2CAC6D52
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 May 2025 18:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mg7IZIdyxvT9Kjh4t7WW+b+TDX5vGXo3qL3V+AOlyfI=; b=CAKpaaF3leI2xnXn73HSlEXAsi
	UP3mVJ01nLS33Q1IammD/tk1fC9aJ0puCdEixZojDT0qzKaFOWVPPX307+RE+G4Ljk7RlI+delnPG
	oc3P5QYqN9t0vxPRStwWDNwB7KP9UNcBikxmTFp+jI9e4FEYJvdOzztBmVlEP+bJQMPc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKJCn-0003f8-F0;
	Wed, 28 May 2025 16:00:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uKJCl-0003er-BJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 May 2025 16:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cTarBWoWdv7H3zppHtD11MhJA4f8tpyV+ldckh9GCOw=; b=H+ysyCPeURaHVb5ehNtwSdaZ/0
 4EMYRmo1ha19AQrpdz5S/9HtlBUj5elmEuqoiEQPi3fDrBHBww7XbmLyMLozvt8qeery/xSe0nXVG
 kJ1+/zb5dqY2hiw6jsP5vFKnch4EbdQWF4p8K2wy4VQZ95iGaTaNOEnlnjtkNCFBQDuc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cTarBWoWdv7H3zppHtD11MhJA4f8tpyV+ldckh9GCOw=; b=EJ4K/WisrGtrnBLiHv7/n2wlRG
 /ByN9g5Bgx4xOrE7bi65cPzge4TOZAzq86Wo4J33+IILkJXmtdgrUdp8cLM+0K3CuinvktsgFxYD5
 /i0DF0pz93F+zRE6wErxtd6CyhiPkJMMrdteejvNt6N2lEAgPBFObLIUNtEepOn3wgTA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKJCk-0002KG-L2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 May 2025 16:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 441AD43B69;
 Wed, 28 May 2025 16:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA42C4CEE3;
 Wed, 28 May 2025 16:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748448024;
 bh=KcwudleOKREFiTnzrvnQ2gW5IQ/mRaXJ1eFhUaLPNiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JwnAgZHNMom76PzcOL3VWdBEGAku5nLRro0GIgJlXJ/FNpRhqsVNHjWhFqv4Koxfj
 Fcp6kECQ1k2FqaEH8xXl07P1Ku2dalyl3w1Y3/ivjZQ60wHLD87Gk4+XqPQUmd9xUC
 1GbZ4Gi2PNIeQkT+bG5S1mvF3xSi7zuzX8Ft2B7D1wmGj0/iAPWsfxjkBgrxHsiXZX
 1kwSYp6Oh6bJbJ6/kYpM+7SbhtYaaOPQZkbo+ROJM8jvd0rcecWaL9VGcelIQHgB7x
 SlqXt7Myp379Z4xM5xoYIVM3tUTgUlcaGdKuhkhxkGDI2238hks+qnguvoigdADAj+
 NIbivoYtWDycg==
Date: Wed, 28 May 2025 16:00:22 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aDczFqQAMoLxcatZ@google.com>
References: <20250528072045.416898-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250528072045.416898-1-chao@kernel.org>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Thanks, I added the patches back with this fix applied to
 the original patch. :) On 05/28, Chao Yu wrote: > syzbot report a f2fs bug
 as below: > > CPU: 0 UID: 0 PID: 5840 Comm: syz-executor138 Not tai [...]
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.9 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uKJCk-0002KG-L2
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on section
 ckpt_valid_blocks correctly
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thanks, I added the patches back with this fix applied to the original patch. :)
On 05/28, Chao Yu wrote:
> syzbot report a f2fs bug as below:
> 
> CPU: 0 UID: 0 PID: 5840 Comm: syz-executor138 Not tainted 6.15.0-rc7-next-20250523-syzkaller #0 PREEMPT(full)
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:408 [inline]
>  print_report+0xd2/0x2b0 mm/kasan/report.c:521
>  kasan_report+0x118/0x150 mm/kasan/report.c:634
>  sanity_check_valid_blocks fs/f2fs/segment.h:385 [inline]
>  build_sit_entries+0x1b0c/0x1f80 fs/f2fs/segment.c:5060
>  f2fs_build_segment_manager+0x3112/0x49f0 fs/f2fs/segment.c:5707
>  f2fs_fill_super+0x45bc/0x6c80 fs/f2fs/super.c:4754
>  mount_bdev+0x211/0x2c0 fs/super.c:1736
>  legacy_get_tree+0xfd/0x1a0 fs/fs_context.c:666
>  vfs_get_tree+0x92/0x2b0 fs/super.c:1802
>  do_new_mount+0x24a/0xa40 fs/namespace.c:3869
>  do_mount fs/namespace.c:4206 [inline]
>  __do_sys_mount fs/namespace.c:4417 [inline]
>  __se_sys_mount+0x317/0x410 fs/namespace.c:4394
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> sanity_check_valid_blocks() should be called after set_ckpt_valid_blocks()
> in the loop, otherwise, @segno passed to sanity_check_valid_blocks() will
> become invalid, fix it.
> 
> Fixes: 313d10d79a82 ("f2fs: add ckpt_valid_blocks to the section entry")
> Reported-by: syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-f2fs-devel/68345c8d.a70a0220.253bc2.0097.GAE@google.com
> Cc: yohan.joung <yohan.joung@sk.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> Change v1:
> - merge this into original patch is fine to me as well.
>  fs/f2fs/segment.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 5ff0111ed974..b77b5de71a48 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -5054,10 +5054,10 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>  	if (__is_large_section(sbi)) {
>  		unsigned int segno;
>  
> -		for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))
> +		for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi)) {
>  			set_ckpt_valid_blocks(sbi, segno);
> -
> -		sanity_check_valid_blocks(sbi, segno);
> +			sanity_check_valid_blocks(sbi, segno);
> +		}
>  	}
>  
>  	if (err)
> -- 
> 2.49.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
