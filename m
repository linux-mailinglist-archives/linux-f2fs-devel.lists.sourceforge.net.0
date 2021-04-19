Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 104EF3648A4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Apr 2021 18:57:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lYXDB-0005F2-OE; Mon, 19 Apr 2021 16:57:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lYXDA-0005Ed-GO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Apr 2021 16:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AamghkwKfeaEmplQ+BF976fFUNVO5q6O3UPxzvgoDkE=; b=c5kdkrvZpsMIqEFOdKe8GkdTWc
 rTgGbrENk9EyyX4c5r/NjqgFUwTV7VgudukgL7jnAf8mCCm0Bb2NEzq4sDOd69pDZyKtRtLNISbsl
 4BnqUp72cjEqilFRZktLQYLcFTch6Lm2d8ntdbNCWxL1k9TX2oPjMdkreRU5W8unKV6E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AamghkwKfeaEmplQ+BF976fFUNVO5q6O3UPxzvgoDkE=; b=XE0dXB97cWuwXIOulsjA1fh6if
 anC9/FrLa7Vv1iQgQ3QpEY5IdmeqzUWAlbISJlBk2ERDmK9H4WpFWsTGO8ZeqNwFUWjOTcFsqclPX
 8JRUgUa58B7Fsb+wzZW2jxoEYzf1s6EH9tRP+bE+78m6ymBnE5khfXu5yWULEo1eZyLM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lYXD8-00FTIv-Is
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Apr 2021 16:57:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1902F61157;
 Mon, 19 Apr 2021 16:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618851437;
 bh=3dmEuV6yQnYs+WvENMHQ1GFdBQ3rQzjD8hIFXwwaDEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=upUv8v+s/Hv7tEJrZ8W+uGHlGnRmuCZFWdOlt+hLPf4JJgSz48dQ+1OSjcWw8k2g3
 shPYs5CIpoDtZ9v0YVVnPPMrzSFuYonPB/r08c0Lo+nThMX52yU1ceP63LLnUz9fwb
 MNBOo/wZwIX/O72FFKMx2OjkDRfoREzvXkdqecEHvLrW17LNrvClnOyJjCHgqsGNSf
 k3ujEbqNdwdG5sgoU4qj6FzzVymP9dXprWSuxacId4lVpr6Dtq76Sp99YBxcSI21WO
 m9mX4teKXFRJH8eEVUr5v+2KjUcGUT5jZhtZTVDZP9Lcb7dyxMLzuky/S9Z4CGOjab
 ev3KYtBrejrlw==
Date: Mon, 19 Apr 2021 09:57:15 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YH22a55sexxwmGCe@google.com>
References: <20210414012134.128066-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414012134.128066-1-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lYXD8-00FTIv-Is
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to cover allocate_segment() with
 lock
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/14, Chao Yu wrote:
> As we did for other cases, in fix_curseg_write_pointer(), let's
> change as below:
> - use callback function s_ops->allocate_segment() instead of
> raw function allocate_segment_by_default();
> - cover allocate_segment() with curseg_lock and sentry_lock.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/segment.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index b2ee6b7791b0..daf9531ec58f 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4848,7 +4848,12 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
>  
>  	f2fs_notice(sbi, "Assign new section to curseg[%d]: "
>  		    "curseg[0x%x,0x%x]", type, cs->segno, cs->next_blkoff);
> -	allocate_segment_by_default(sbi, type, true);
> +
> +	down_read(&SM_I(sbi)->curseg_lock);
> +	down_write(&SIT_I(sbi)->sentry_lock);
> +	SIT_I(sbi)->s_ops->allocate_segment(sbi, type, true);
> +	up_write(&SIT_I(sbi)->sentry_lock);
> +	up_read(&SM_I(sbi)->curseg_lock);

Seems f2fs_allocate_new_section()?

>  
>  	/* check consistency of the zone curseg pointed to */
>  	if (check_zone_write_pointer(sbi, zbd, &zone))
> -- 
> 2.29.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
