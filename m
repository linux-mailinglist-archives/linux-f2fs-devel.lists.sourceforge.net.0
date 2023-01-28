Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C1C67F454
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Jan 2023 04:35:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pLc0J-0005sQ-SS;
	Sat, 28 Jan 2023 03:35:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pLc0H-0005sK-Lw
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 03:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jvyac98PfOImtDLtlU7j0NcXsfeWJQSz0ungZNBMBXM=; b=dqQzyXO7qD8aEFf5K6CeOyHLVQ
 LNs7ZZ9WK1UyjLzw9s+4YgFSGpV78ZSCEGFS6UyrZpEA/My8qrCmqQwY16+KcxGqb9g70ieJunLBs
 9A067v2ND/282lSwaQXlHz5l1vmm3EPsq7/VDQMEZ8ej32yebj+KKM6F9nlpULfpXf2k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jvyac98PfOImtDLtlU7j0NcXsfeWJQSz0ungZNBMBXM=; b=AwdRF2xsMMyMH8i4BZDt5DfJPk
 /KmOGUpY2tBZvvaigbj2VqEGrpJmALxLhtk210o9G5V/kKoGp3ESuRA/u0XfvAfPiQ3ulbYA3q1d4
 u/2fHaJ14ogKgql3ZA+QBeV0Upy+fohxCxoW2Kx36/b1sFffSHi20YKS7hx4LkTPNEXg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pLc0G-001EiP-8z for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 03:35:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA6AA615A9;
 Sat, 28 Jan 2023 03:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D347AC433D2;
 Sat, 28 Jan 2023 03:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674876938;
 bh=ApbP8EJRFMfmC3wPXgImgw5jYcobkoKDFxkpXh2Drh0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Js2I/owq0961EyvlPFtUXq5ooYps1yJbvF/JXCs7fUcJ0WOv5Ov+J6HRA0anLaHUM
 qdyhAcmSQaplf4qUaY9Qy+qlwOshueRrLI/VrR082U/vxKi6/dyFZPl9sYDLupHthe
 UZ1WNyTgXL/QTww9HYXWWBhu2tmd0H90nFc0fH6J/FL5RiPcoWksbhv9Gyj7JxXaw5
 aPjE5N1HCgAdgHJGQp/SiyiMff95BnlsFSoAOmewb4lmyfYlCYkXgbw7Ii0ALS8Hdy
 t7xVZPAu84zAa+zXc7p9xUKdgOzIHuHmUCZvNpXc7v2DtZHaXn8PZODdD0M7h9nG0F
 IZo9JSs+GGaMQ==
Message-ID: <7c12ebaa-4d3d-e475-dfb2-7b459cd26e64@kernel.org>
Date: Sat, 28 Jan 2023 11:35:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: qixiaoyu1 <qxy65535@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230113125859.15651-1-qixiaoyu1@xiaomi.com>
 <20230116030850.20260-1-qixiaoyu1@xiaomi.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230116030850.20260-1-qixiaoyu1@xiaomi.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/16 11:08, qixiaoyu1 wrote: > Currently we wrongly
 calculate the new block age to > old * LAST_AGE_WEIGHT / 100. > > Fix it
 to new * (100 - LAST_AGE_WEIGHT) / 100 > + old * LAST_AGE_WEIGHT / [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pLc0G-001EiP-8z
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: fix wrong calculation of block
 age
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
Cc: xiongping1@xiaomi.com, qixiaoyu1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/1/16 11:08, qixiaoyu1 wrote:
> Currently we wrongly calculate the new block age to
> old * LAST_AGE_WEIGHT / 100.
> 
> Fix it to new * (100 - LAST_AGE_WEIGHT) / 100
>                  + old * LAST_AGE_WEIGHT / 100.
> 
> Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
> Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
> ---
> Change log v1 -> v2:
>   - fix udiv
> 
>   fs/f2fs/extent_cache.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 342af24b2f8c..ad5533f178fd 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -874,11 +874,8 @@ void f2fs_update_read_extent_tree_range_compressed(struct inode *inode,
>   static unsigned long long __calculate_block_age(unsigned long long new,
>   						unsigned long long old)
>   {
> -	unsigned long long diff;
> -
> -	diff = (new >= old) ? new - (new - old) : new + (old - new);
> -
> -	return div_u64(diff * LAST_AGE_WEIGHT, 100);
> +	return div_u64(new, 100) * (100 - LAST_AGE_WEIGHT)
> +		+ div_u64(old, 100) * LAST_AGE_WEIGHT;

How about updating as below to avoid lossing accuracy if new is less than 100?

return div_u64(new * (100 - LAST_AGE_WEIGHT), 100) +
		div_u64(old * LAST_AGE_WEIGHT, 100);

Thanks,

>   }
>   
>   /* This returns a new age and allocated blocks in ei */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
