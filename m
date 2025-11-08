Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C15C42595
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 08 Nov 2025 04:12:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fs+/0tY6LButxSxvHt749h12hvdyLmPFWVrNsZgMPbE=; b=mX5INLU60FnsGb8AbHEZM8VNZi
	hcGIkkJXXRVhSwCoqf/JHre4SFBPOkIOoxkumZQLr6f5ZmamM0p+yy9b2Us8WowUbA2rF1Cw2NvJx
	SgdLaUVddeKDat/CBNcAmbUGLIu8Kvb1I70N15oI1e0InTZ2R8j/PnKrX4/uqecCscXE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHZMy-0004ZL-8d;
	Sat, 08 Nov 2025 03:12:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vHZMw-0004ZD-O4
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Nov 2025 03:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5QaKrX51l0iXCgvJ8GKrX5Pg2SjernjoJh/OR3AZ93s=; b=Xg/qlVlKJQcubF6xN0V/gEQ2Nd
 mAr/8n9UMdX/HQ8KjBCEQJgwmge4NQKlXzc25jgSM5HJSvbXmOE1223RIWA9t6rLRvY8JLT3EtzDA
 CtMWrkFPK+1/iBVkkp9dpZv96prfsApzHb9sbYeeu1r7mw1u1+DLqJ9YF0uhtq3vORR4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5QaKrX51l0iXCgvJ8GKrX5Pg2SjernjoJh/OR3AZ93s=; b=dypscQRcgpIw5Rq2AodBvKVl2k
 /6Pk95iucZz0Xfdx+f386Q1TiKXVYG7YBin06qG73qhAUlRBAGpV0QMoNyfrhTGP0wY87Y3YxBtSM
 8STtmsCy+NYH0PJ8bb3oJZAKopFkdKLSNSKnHUijGNsD+zbq3/ZeAF96LeC1hZ4XMAR0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vHZMw-0003BE-Af for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Nov 2025 03:12:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E2DC0440D9;
 Sat,  8 Nov 2025 03:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F70C4CEF5;
 Sat,  8 Nov 2025 03:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762571511;
 bh=Z4McIs+W5zoPawQI2o5BzLS+urg+6lYTIe/hzurF4Pw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=jB0vEb/8+ZordYuMMwdvj8yDbwHo2ZnIZ4RIvWz7cWaZd1WkCSLd001yLdk1YzRst
 0nUv1WI7iXL/qXMh5ICHga6dMx7kqkw5pXhawbzNFljXTWGPNxfXks3nlieBEaBE08
 qOFj52ZtNMM2EA14lusbyewZAcWVo/67v0XjeYoCStA4JHaJgquH41xTVLid/k5ytC
 jTZXDBwPFUjSFbmtTkKkSZCuQ50fwgrgcKvDucpiofhTr1+DuXx6fnaAlIkF9c/evZ
 YGan+3nemWAY1q+l6V7RpRPgRAwZ6Bo0fMPTlED2Q4B+zqO0CuUHgm0NrDYkoJfzEo
 tWB+1pV1mVW8A==
Message-ID: <268cf104-6f77-419c-931e-c5cd82c3a921@kernel.org>
Date: Sat, 8 Nov 2025 11:11:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yunlei He <heyunlei1988@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251107062907.384287-1-heyunlei1988@gmail.com>
Content-Language: en-US
In-Reply-To: <20251107062907.384287-1-heyunlei1988@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Yunlei, On 2025/11/7 14:29, Yunlei He wrote: > From: Yunlei
 He <heyunlei@xiaomi.com> > > GC move fbe data block will add some non uptodate
 page, we'd > better release it at the end. This is just for saving memory,
 right? Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vHZMw-0003BE-Af
Subject: Re: [f2fs-dev] [PATCH] f2fs: drop non uptodata page during GC
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Yunlei,

On 2025/11/7 14:29, Yunlei He wrote:
> From: Yunlei He <heyunlei@xiaomi.com>
> 
> GC move fbe data block will add some non uptodate page, we'd
> better release it at the end.

This is just for saving memory, right?

> 
> Signed-off-by: Yunlei He <heyunlei@xiaomi.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>   fs/f2fs/gc.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 8abf521530ff..09b65e6ea853 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1315,6 +1315,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
>   	struct node_info ni;
>   	struct folio *folio, *mfolio;
>   	block_t newaddr;
> +	bool need_invalidate = true;
>   	int err = 0;
>   	bool lfs_mode = f2fs_lfs_mode(fio.sbi);
>   	int type = fio.sbi->am.atgc_enabled && (gc_type == BG_GC) &&
> @@ -1450,7 +1451,11 @@ static int move_data_block(struct inode *inode, block_t bidx,
>   put_out:
>   	f2fs_put_dnode(&dn);
>   out:
> +	if (folio_test_uptodate(folio))
> +		need_invalidate = false;

How about dropping such folio under its lock?

if (!folio_test_uptodate())
	truncate_inode_partial_folio()

>   	f2fs_folio_put(folio, true);
> +	if (need_invalidate)
> +		invalidate_mapping_pages(mapping, bidx, bidx);
>   	return err;
>   }
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
