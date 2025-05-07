Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECBCAAD60F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 08:29:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrtvHGfCFZST9A3XOhjGc0Czo5w/Iv0n1v8eQKxQY/0=; b=eK9DwyMNCyAy6+dhJa2EeoCVVk
	sZ1mW9CNUqCD3httXMjyBQXPSvY2D5FqoDeiTu8cJP6VU6tdqKL9jw9rjRYDefDdKUXnqVdnGnVP0
	6yDdk1yS1dgyXwWAcTzF7cqWALbq9WcCJtIvx6GidjfiaYwc/c3miQCNJQdiMDV/drn8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCYHd-0007Ig-U9;
	Wed, 07 May 2025 06:29:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCYHV-0007II-70
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 06:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mKcp6CMBbxLMsItKHCXRt5ldsGH05AoznacomwmOYF0=; b=bMKv3kIY3XYKiDNqjoV+etn/Qw
 sx7qVzNJ5rvkqxhzGHRpjhxeHuteQgXf+X1Qm+9VL5q256bWFodcdQrp1mmb70Ls1hO3b8tmxjup0
 RLgu5ns+lRgg3APfbddAqavEGggI9581qbfzbK0SYQkSBT+criu2aVvVijBW/48Z/6MM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mKcp6CMBbxLMsItKHCXRt5ldsGH05AoznacomwmOYF0=; b=LTxccshQq4x1P+FtnAhv1ssK3K
 AlZ3v8UJXfLy4Pq43bRt8f+XBp/+SRBB3K7V3+2T8Nw4q/kmTXbbvUVNJVX+m8FPEUUDmdALrj6o2
 Xy/qf3YNteFLmq3ldiqCtkaSdPB53HaMtfDfYwleNmoDxEBE6hJyFxFm4mzQ+ifsMOuE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCYHF-0007qW-Iv for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 06:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DB2DD5C5AA6;
 Wed,  7 May 2025 06:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21CAC4CEE7;
 Wed,  7 May 2025 06:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746599338;
 bh=Bw64KSmyq0PtEWjmClJdBAYx3Jvs46ZpRQzhQjkMaY0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=R24uxpymSfD8FgnaspKaiOvkS1fOgSJiEww6efZne6c0QijnmTRwgWJy5qzIgMZSx
 uj3FmImh/Nb+sp+qUvw49zRWDYrY2MLfuIAX9JDhjEGU8hpDd9DZaur+XYHH7pAesk
 Lx8+IKTs2siIZhnmPc3/5GipgCV3BAL4bGEedIk6HdrS5cow9Zjfcis2DL8h5jcHdh
 b+FT+ClB81FDGISBGgJsgMMJMjhy0lewS4Age2PxMYlWXGFACO7QQyaKH5zV+cJNXw
 kr7D/fCIuBPe2TmwKKJbPAka9FXLfETvdmx7y6sDPKmD45xzR1avzny6wNgRcayi+F
 TZtpFoZ0MpkUg==
Message-ID: <aab08ad6-22db-44f3-9924-97e096cb0619@kernel.org>
Date: Wed, 7 May 2025 14:28:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250505092613.3451524-1-hch@lst.de>
 <20250505092613.3451524-3-hch@lst.de>
Content-Language: en-US
In-Reply-To: <20250505092613.3451524-3-hch@lst.de>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/5/25 17:25, Christoph Hellwig wrote: > Instead unlock
 the pages locally where that would happen and thus > consolidate the code
 in the callers. > > Signed-off-by: Christoph Hellwig <hch@lst.de> > [...]
 Content analysis details:   (-6.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
X-Headers-End: 1uCYHF-0007qW-Iv
Subject: Re: [f2fs-dev] [PATCH 2/4] f2fs: don't return
 AOP_WRITEPAGE_ACTIVATE from f2fs_write_single_data_page
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/5/25 17:25, Christoph Hellwig wrote:
> Instead unlock the pages locally where that would happen and thus
> consolidate the code in the callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/f2fs/compress.c |  5 +----
>  fs/f2fs/data.c     | 13 ++++---------
>  2 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index e016b0f96313..ce63b3bfb28f 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1565,10 +1565,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>  						NULL, NULL, wbc, io_type,
>  						compr_blocks, false);
>  		if (ret) {
> -			if (ret == AOP_WRITEPAGE_ACTIVATE) {
> -				folio_unlock(folio);
> -				ret = 0;

Previously, for this case, it will goto out label rather than writing
left pages?

Thanks,

> -			} else if (ret == -EAGAIN) {
> +			if (ret == -EAGAIN) {
>  				ret = 0;
>  				/*
>  				 * for quota file, just redirty left pages to
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 08a8a107adcb..e32c9cf5b4f5 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2930,10 +2930,10 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>  	 * file_write_and_wait_range() will see EIO error, which is critical
>  	 * to return value of fsync() followed by atomic_write failure to user.
>  	 */
> -	if (!err || wbc->for_reclaim)
> -		return AOP_WRITEPAGE_ACTIVATE;
>  	folio_unlock(folio);
> -	return err;
> +	if (err && !wbc->for_reclaim)
> +		return err;
> +	return 0;
>  }
>  
>  /*
> @@ -3146,8 +3146,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  			ret = f2fs_write_single_data_page(folio,
>  					&submitted, &bio, &last_block,
>  					wbc, io_type, 0, true);
> -			if (ret == AOP_WRITEPAGE_ACTIVATE)
> -				folio_unlock(folio);
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  result:
>  #endif
> @@ -3159,10 +3157,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  				 * keep nr_to_write, since vfs uses this to
>  				 * get # of written pages.
>  				 */
> -				if (ret == AOP_WRITEPAGE_ACTIVATE) {
> -					ret = 0;
> -					goto next;
> -				} else if (ret == -EAGAIN) {
> +				if (ret == -EAGAIN) {
>  					ret = 0;
>  					if (wbc->sync_mode == WB_SYNC_ALL) {
>  						f2fs_io_schedule_timeout(



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
