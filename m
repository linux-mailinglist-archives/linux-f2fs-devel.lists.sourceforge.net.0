Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 601C1C459A3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 10:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhVvLXQ5k3YhQ40uolr6fOE/REPx3cOYySBZcGVhFJw=; b=Dj7AvEsrGnmrHJjTZ7Tw4On1gd
	kmb/HCgzYYUrBBiUY0jI/a1KxrapU16wd23/xxWYXIPPCX3pxv7VCztBKMYkcxxdXhPK13u0mfprI
	Jm38zq1CDzlUNWS/hCYYvCoFCkvJ24KZvvTSk2ZvqvmVa+jhvqoMH+itkHqc7N5A/fzQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIO70-0005oy-RU;
	Mon, 10 Nov 2025 09:22:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vIO6z-0005oq-Cp
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 09:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/++lxgvJ81eTiPPjnWouRWHgy4wry7WgE7YWHHlD5Ds=; b=L9PPDSZ0ZjT8fJU5xu9R7gg2wE
 wekxoa1cfl1sMyFLHkgNvs9QSsNC+avms4+Jbl6Zo3WGPYNMshEuxlLf7JpxG9nKu/L9/38QFXGgM
 N4Bwj+lPoGWcYxNeoiE9JwxDtYt8Oy5zG+IumXYOfdaTS5iE+PZIhPrKCUSpdrlntTKo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/++lxgvJ81eTiPPjnWouRWHgy4wry7WgE7YWHHlD5Ds=; b=MibW9L5eK3C7P95kUzuGmI2Ot/
 Ef3nmNd5bLgQcHBWNqOGtmQhIXPzB8O21smQs3WooueeKQdwqKoVsohlSCPHu1yWBdoLWjLTzC+DT
 /DYPU5SsvVBtPWtEHdUCywo256u+sye+GI0mkc3vAyX9yXWgzUWcA4EoBLIHKo60v7mU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIO6y-0004bK-WA for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 09:22:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 41F3260008;
 Mon, 10 Nov 2025 09:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995C8C4CEF5;
 Mon, 10 Nov 2025 09:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762766565;
 bh=+xiY9MN26eBYxB9c0SfjXDZIdjSMZQRG2772qKMqFlM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=kNZ4NAYDkj9Sw+R4r+dGD3+NO8AfuxxiP72xtldiNIYmVqPaf5J3YkdPklOTlYPGY
 ObRcEe/2VasAPMzAeODsCrv2fPgTB9BtWmKHrWyJADP2UlTA3QYSi9kApF0CXFmhV9
 IgYn2WVhMosSdS2MFXyuyrsw/oyFbXvJBgKdHRwdIte/Jk6+twip02quVm0x7+/lhI
 hwEGKeM6m7DR9sliZKoBM3igT4RYzx48W4mbuL3pobD+jUBfgazCLMGikc8tjrbO+1
 TMrG/aZguLEeIe5XLQ9htqVOrVOtF0Z5R8jZXSnJtuCU72IpvWs0vc8F0UtUIOLIUH
 CnbzEdfI7ay8w==
Message-ID: <17b8c497-c1ad-4a31-a8ad-a5d73b7c2e82@kernel.org>
Date: Mon, 10 Nov 2025 17:22:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20251104162402.928582-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20251104162402.928582-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/5/25 00:24,
 Daeho Jeong wrote: > static void write_sum_page(struct
 f2fs_sb_info *sbi, > - struct f2fs_summary_block *sum_blk, block_t blk_addr)
 > + struct f2fs_summary_block *sum_blk, unsigned i [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIO6y-0004bK-WA
Subject: Re: [f2fs-dev] [PATCH] f2fs: revert summary entry count from 2048
 to 512 in 16kb block support
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/5/25 00:24, Daeho Jeong wrote:
>  static void write_sum_page(struct f2fs_sb_info *sbi,
> -			struct f2fs_summary_block *sum_blk, block_t blk_addr)
> +		struct f2fs_summary_block *sum_blk, unsigned int segno)
>  {
> -	f2fs_update_meta_page(sbi, (void *)sum_blk, blk_addr);
> +	struct folio *folio;

w/ 4k-sized block config, I suffered performance regression issue while testing
fallocate() on pinfile.

Seems we need to add below code:

	if (SUMS_PER_BLOCK == 1)
		return f2fs_update_meta_page(sbi, (void *)sum_blk,
					GET_SUM_BLOCK(sbi, segno));

Otherwise, we will load summary block whenever we change segment for curseg.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
