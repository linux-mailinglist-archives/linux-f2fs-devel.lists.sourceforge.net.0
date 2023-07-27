Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C23764CF2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 10:30:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOwNy-0007O4-Jm;
	Thu, 27 Jul 2023 08:30:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1qOwNx-0007Ny-1Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bCyRY2AypM6cafCQjVrDjLb4nbis8pECb0YQZp2M6iE=; b=VDuClIDepRcoeGwUytnWpG4z4g
 H8NHZVJ3XH/1pvnVzHmRSLCfDkysai7pioVv4M12wtWUWXm4qfiuGSd4aTzGZPLwyaODwETWfwUbX
 9sdVZlDzgsgVTKoRZWA4Eyzt6a7iwBDxNk3fbd+HnQHEvEUpceMjurPvmydvcK4+CLBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bCyRY2AypM6cafCQjVrDjLb4nbis8pECb0YQZp2M6iE=; b=ltcQzFPRJf3XvxmlegBAEbl6JK
 STV50oXPOL783A8yitp0aEeSWU/3DnHK925hZmYGbGOtT87oVKi06bxBbMmeVzKbZmuZ/p18pBul/
 +c/VekwFY+ynPGpSABFuEbGFezu3zXRhh6hGHCiYdhxYtbAst7IjDT9wX/sGKU9fFLvA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qOwNw-004NNM-PP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:30:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6549661D96;
 Thu, 27 Jul 2023 08:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06711C433C7;
 Thu, 27 Jul 2023 08:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690446606;
 bh=lgMwb11ItIJ27YCsuj2akQ0e0AMgpISaoiuOUrGiITY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Tr4M7HQ3pxhso0Q/eg4xKtwD0lUURtq4zUL2WnDxbX7YJArr/oNtVx0HKmYWbVJCj
 uZ3CjjOq76HigUmfxsBIfU5BJp2UCC8gXysiCMyY4oUiNa0NyuYtXgOb+GgYI2e2UD
 q/DMid3QMY2nJGias56vfjnyYrQ2kAGyvOg7az/lKKcQPYsllW1cAnQl1FfA/ktsaA
 ypQoOxGNqaMUpP2GFbXa8+1QKt5gSsrAShH7O9rxadTFuFxweU5IvbZDayprJj2afQ
 IGlbjA9TtQP0FcoHyTXu4yjcQ81VS0g2mOFp+HrXHsn6/kAwTiNlXyj4HVftm6tXbg
 kxbv5Cd7EwHzQ==
Message-ID: <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
Date: Thu, 27 Jul 2023 17:30:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
 david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230727080502.77895-29-zhengqi.arch@bytedance.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/27/23 17:04,
 Qi Zheng wrote: > In preparation for implementing
 lockless slab shrink, use new APIs to > dynamically allocate the dm-zoned-meta
 shrinker, so that it can be freed > asynchronously us [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qOwNw-004NNM-PP
Subject: Re: [f2fs-dev] [PATCH v3 28/49] dm zoned: dynamically allocate the
 dm-zoned-meta shrinker
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/27/23 17:04, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the dm-zoned-meta shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct dmz_metadata.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  drivers/md/dm-zoned-metadata.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 9d3cca8e3dc9..0bcb26a43578 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -187,7 +187,7 @@ struct dmz_metadata {
>  	struct rb_root		mblk_rbtree;
>  	struct list_head	mblk_lru_list;
>  	struct list_head	mblk_dirty_list;
> -	struct shrinker		mblk_shrinker;
> +	struct shrinker		*mblk_shrinker;
>  
>  	/* Zone allocation management */
>  	struct mutex		map_lock;
> @@ -615,7 +615,7 @@ static unsigned long dmz_shrink_mblock_cache(struct dmz_metadata *zmd,
>  static unsigned long dmz_mblock_shrinker_count(struct shrinker *shrink,
>  					       struct shrink_control *sc)
>  {
> -	struct dmz_metadata *zmd = container_of(shrink, struct dmz_metadata, mblk_shrinker);
> +	struct dmz_metadata *zmd = shrink->private_data;
>  
>  	return atomic_read(&zmd->nr_mblks);
>  }
> @@ -626,7 +626,7 @@ static unsigned long dmz_mblock_shrinker_count(struct shrinker *shrink,
>  static unsigned long dmz_mblock_shrinker_scan(struct shrinker *shrink,
>  					      struct shrink_control *sc)
>  {
> -	struct dmz_metadata *zmd = container_of(shrink, struct dmz_metadata, mblk_shrinker);
> +	struct dmz_metadata *zmd = shrink->private_data;
>  	unsigned long count;
>  
>  	spin_lock(&zmd->mblk_lock);
> @@ -2936,19 +2936,23 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  	 */
>  	zmd->min_nr_mblks = 2 + zmd->nr_map_blocks + zmd->zone_nr_bitmap_blocks * 16;
>  	zmd->max_nr_mblks = zmd->min_nr_mblks + 512;
> -	zmd->mblk_shrinker.count_objects = dmz_mblock_shrinker_count;
> -	zmd->mblk_shrinker.scan_objects = dmz_mblock_shrinker_scan;
> -	zmd->mblk_shrinker.seeks = DEFAULT_SEEKS;
>  
>  	/* Metadata cache shrinker */
> -	ret = register_shrinker(&zmd->mblk_shrinker, "dm-zoned-meta:(%u:%u)",
> -				MAJOR(dev->bdev->bd_dev),
> -				MINOR(dev->bdev->bd_dev));
> -	if (ret) {
> -		dmz_zmd_err(zmd, "Register metadata cache shrinker failed");
> +	zmd->mblk_shrinker = shrinker_alloc(0,  "dm-zoned-meta:(%u:%u)",
> +					    MAJOR(dev->bdev->bd_dev),
> +					    MINOR(dev->bdev->bd_dev));
> +	if (!zmd->mblk_shrinker) {
> +		dmz_zmd_err(zmd, "Allocate metadata cache shrinker failed");

ret is not set here, so dmz_ctr_metadata() will return success. You need to add:
		ret = -ENOMEM;
or something.
>  		goto err;
>  	}
>  
> +	zmd->mblk_shrinker->count_objects = dmz_mblock_shrinker_count;
> +	zmd->mblk_shrinker->scan_objects = dmz_mblock_shrinker_scan;
> +	zmd->mblk_shrinker->seeks = DEFAULT_SEEKS;
> +	zmd->mblk_shrinker->private_data = zmd;
> +
> +	shrinker_register(zmd->mblk_shrinker);

I fail to see how this new shrinker API is better... Why isn't there a
shrinker_alloc_and_register() function ? That would avoid adding all this code
all over the place as the new API call would be very similar to the current
shrinker_register() call with static allocation.

> +
>  	dmz_zmd_info(zmd, "DM-Zoned metadata version %d", zmd->sb_version);
>  	for (i = 0; i < zmd->nr_devs; i++)
>  		dmz_print_dev(zmd, i);
> @@ -2995,7 +2999,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>   */
>  void dmz_dtr_metadata(struct dmz_metadata *zmd)
>  {
> -	unregister_shrinker(&zmd->mblk_shrinker);
> +	shrinker_free(zmd->mblk_shrinker);
>  	dmz_cleanup_metadata(zmd);
>  	kfree(zmd);
>  }

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
