Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC04D4AC947
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Feb 2022 20:15:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nH9Ta-0006uJ-Sf; Mon, 07 Feb 2022 19:15:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nH9TZ-0006uD-UC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Feb 2022 19:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rBhSciC5pp7GHVHF13cKYldZEIeEVVixoZyuc/RgctU=; b=bQRozgX/K3b5XSRWefT7FWbcLX
 nxxw2uLtDf3pXRBIXavFiwI8TFtmv74CvVZcfiRtP7n3ygPHm3XgSkcw6HQm64D8yoXZ+V0+1kTHQ
 4CZJSbanNqGNdsUoVQ5ZVOWCX0RPb2AW2OYZq17GGRLFIV8LhIVK/Ev1FoAZx18xjZiI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rBhSciC5pp7GHVHF13cKYldZEIeEVVixoZyuc/RgctU=; b=OdrzEST5ebuTQg0PGSZhjxGLGQ
 HCJ0DFtbXJrOupEaH43IFhH5/bPH9f6IyzWq0o5PMHpM8UQ4QW/0p+4eEkS+wn4vcv24QL9JUrI/S
 AMtKBXijEmq7fGyHVwcvGlIloFVCy6rtz/DDkTwWTPCoIsbbqp5+QTl0eg/8nWPWPCb8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nH9TX-0006UW-Ts
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Feb 2022 19:15:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AC7D2B8164B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Feb 2022 19:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440D8C004E1;
 Mon,  7 Feb 2022 19:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644261292;
 bh=HJoLZayjw9d/gTYyeZLWOIyycJnicgl+gCOYbWkZsXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mtOs0UFvLFkypBmJJ4xlwyKBYH+C3cuBhr2TXU4kpDV9+q1LF8W1t++Gwl4Ejy9//
 xbD6K6t+PhFRAo0E9bK7c63F1EadKKIfN678kYPxoxlCKz/M++a5b1hdQU6q56lPQf
 A/G+HyzTi+1QQoBU0/VhUOx3ja68Klh4Yx9BHryHm6RE99SZvhzVQ9aS0ED7pwNVYA
 LAaA67j2ip7+Oop90XwqyRjxNe6N3/HPmvLTj94CBSZ/tXh8BjuGhhrIB1oeliy/TT
 6D3quwBsbKKrzomk2Lf/xp41Lbm0i4EB4eth6qu7VpDbCL+xHcS7N/N3jdZFEhjALr
 7BZMFQ5tFiuSA==
Date: Mon, 7 Feb 2022 11:14:50 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YgFvqnoa61BspqmW@google.com>
References: <20220207113516.9489-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220207113516.9489-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/07, Chao Yu wrote: > During checkpoint,
 we have committed
 preflush command via f2fs_flush_device_cache() 787 int
 f2fs_flush_device_cache(struct
 f2fs_sb_info *sbi) 788 { 789 int ret = 0, i;
 790 791 if (!f2fs_is_multi_device(sbi)) 792 return 0; 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nH9TX-0006UW-Ts
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid unneeded preflush during
 checkpoint()
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

On 02/07, Chao Yu wrote:
> During checkpoint, we have committed preflush command via f2fs_flush_device_cache()

 787 int f2fs_flush_device_cache(struct f2fs_sb_info *sbi)
 788 {
 789         int ret = 0, i;
 790 
 791         if (!f2fs_is_multi_device(sbi))
 792                 return 0;

Seems a wrong assumption.

> to persist all metadata pages except last #2 CP pack page, so we don't need to
> commit another preflush command in commit_checkpoint(), remove it to avoid unneeded
> write cache overhead.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/data.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 8c417864c66a..15ac18bbbc8e 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -598,7 +598,7 @@ static void __f2fs_submit_merged_write(struct f2fs_sb_info *sbi,
>  		io->fio.op = REQ_OP_WRITE;
>  		io->fio.op_flags = REQ_META | REQ_PRIO | REQ_SYNC;
>  		if (!test_opt(sbi, NOBARRIER))
> -			io->fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
> +			io->fio.op_flags |= REQ_FUA;
>  	}
>  	__submit_merged_bio(io);
>  	up_write(&io->io_rwsem);
> -- 
> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
