Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCECE3CEAF4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jul 2021 20:26:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5Xy0-0001Uf-Nu; Mon, 19 Jul 2021 18:26:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1m5Xxz-0001UY-2c
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 18:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F0YJq1bcysHGwAMuwoIABR93ctD2PdgGwNZOtvvFo6U=; b=IkQOHZJacXlbxljHLfq3OTpEM/
 FJBrK2jNWO3qfSPkbOAGI85DoL4VIG25B9vBAohw1yf1tAPLU1KjVcAg7Jw7Bcy3Udlp7WYb7P9TT
 7TuohR6LM9wOUMGTnIM7dokdUxoe1JEjb2iSTPPBW56ZHJkXHG5EIn/8L1DCF23p2g/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F0YJq1bcysHGwAMuwoIABR93ctD2PdgGwNZOtvvFo6U=; b=MDyT0JXongZccAcihqYiPohWBW
 juzaSA4lKoCG3tPejPdhP9kfTO8lVUoAPC837luVy/4GU+x+10zdWbdN4oXaBi9XAsT/HS5olDOOv
 JLtURh6FHDcoqyC1CYbX2klDwfr6a1yhP3c3u7p9n7VEyT40nfjPj+Qe+yYfE1rVL3Vc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5Xxr-00DtO6-UV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 18:26:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6795260FF1;
 Mon, 19 Jul 2021 18:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626719158;
 bh=ULSYh6TP6SghAuUE8JAa4nayEQ1PEwzi5jl1A2rpbbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HKJr2PKDCHcmKmhhPOHTVwrbIZhGI2ccLpRfeokqWs3Y91kjUuhI6LpbjdF0cmuMV
 KInrkaRYWv/wik08PgCOuA6V9anK7xp+9CrJ4T57ylZ9KRpTvenELFznOdNuSjw5t5
 eAUkN1T+vQWWZlsTbexgk0ZjZUlL6L4YZ5qihdxq1VheY4JLxJASGJfYfufw3MtgBN
 ZC9mBgjazouE5qqlzFV13AI7nY0agOGkVefVa/3wApHvjupOYcyAhs4nvI3+rPBYOH
 yroLqaS7BV1h54vxYAo+n3aNPhtOLrQZEL5MiEzKU6nimtxn3kDap35sBIV9VegHGb
 HAQFce5m/nNzg==
Date: Mon, 19 Jul 2021 11:25:56 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YPXDtEyBg5W2ToD/@google.com>
References: <20210427082106.2755-1-frank.li@vivo.com>
 <12ae52df-bc5e-82c3-4f78-1eafe7723f93@huawei.com>
 <5f37995c-2390-e8ca-d002-3639ad39e0d3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f37995c-2390-e8ca-d002-3639ad39e0d3@kernel.org>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m5Xxr-00DtO6-UV
Subject: Re: [f2fs-dev] [PATCH] f2fs: reset free segment to prefree status
 when do_checkpoint() fail
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/19, Chao Yu wrote:
> On 2021/4/27 20:37, Chao Yu wrote:
> > I think just reverting dirty/free bitmap is not enough if checkpoint fails,
> > due to we have updated sbi->cur_cp_pack and nat/sit bitmap, next CP tries
> > to overwrite last valid meta/node/data, then filesystem will be corrupted.
> > 
> > So I suggest to set cp_error if do_checkpoint() fails until we can handle
> > all cases, which is not so easy.
> > 
> > How do you think?
> 
> Let's add below patch first before you figure out the patch which covers all
> things.
> 
> From 3af957c98e9e04259f8bb93ca0b74ba164f3f27e Mon Sep 17 00:00:00 2001
> From: Chao Yu <chao@kernel.org>
> Date: Mon, 19 Jul 2021 16:37:44 +0800
> Subject: [PATCH] f2fs: fix to stop filesystem update once CP failed
> 
> During f2fs_write_checkpoint(), once we failed in
> f2fs_flush_nat_entries() or do_checkpoint(), metadata of filesystem
> such as prefree bitmap, nat/sit version bitmap won't be recovered,
> it may cause f2fs image to be inconsistent, let's just set CP error
> flag to avoid further updates until we figure out a scheme to rollback
> all metadatas in such condition.
> 
> Reported-by: Yangtao Li <frank.li@vivo.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 6c208108d69c..096c85022f62 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1639,8 +1639,10 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
> 
>  	/* write cached NAT/SIT entries to NAT/SIT area */
>  	err = f2fs_flush_nat_entries(sbi, cpc);
> -	if (err)
> +	if (err) {
> +		f2fs_stop_checkpoint(sbi, false);

I think we should abuse this, since we can get any known ENOMEM as well.

>  		goto stop;
> +	}
> 
>  	f2fs_flush_sit_entries(sbi, cpc);
> 
> @@ -1648,10 +1650,12 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	f2fs_save_inmem_curseg(sbi);
> 
>  	err = do_checkpoint(sbi, cpc);
> -	if (err)
> +	if (err) {
> +		f2fs_stop_checkpoint(sbi, false);
>  		f2fs_release_discard_addrs(sbi);
> -	else
> +	} else {
>  		f2fs_clear_prefree_segments(sbi, cpc);
> +	}
> 
>  	f2fs_restore_inmem_curseg(sbi);
>  stop:
> -- 
> 2.22.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
