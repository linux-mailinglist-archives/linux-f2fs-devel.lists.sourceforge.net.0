Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE8B762D38
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 09:24:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOYsr-0000b3-30;
	Wed, 26 Jul 2023 07:24:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <muchun.song@linux.dev>) id 1qOYsq-0000ax-7Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 07:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nTTDffXkzxVXBy4JmC8uLINROt4TIYQk3fp5u25NUNM=; b=CIzc3KG7QXnsBXLGNI1XlAvbEK
 XLzZcDK637KDFZXD+MovB+MvP5NeJVmjHzmTe/TjOjodzmA5s3lB7zIw9UexC7Jd1K8Pqt1Pt90bZ
 oSi9d6yd9c9jJ00YsQ2ptHL0MkI45qqlUFoQNF520ZhH8+aMi6wRc9WIHve1B0mkk4TU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nTTDffXkzxVXBy4JmC8uLINROt4TIYQk3fp5u25NUNM=; b=GMcz37XFYpmPxAdxHjW/CX3vbM
 UACvKXSJeyjdpZwbtPVl6OHaeNGTCPaeqFTV4V5EjnWBrnlx7WEz3wPohO1DrV4Ktgww3INruWHmB
 A8L4cePbtYCNAHsCECm/e9KlGHxLNcuyTNWAfFd+4xPYMa76zfH64XSvzO3x7r35crOE=;
Received: from out-40.mta1.migadu.com ([95.215.58.40])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qOYsp-002lYY-58 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 07:24:33 +0000
Message-ID: <17de3f5b-3bef-be38-9801-0e84cfe8539b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1690356262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nTTDffXkzxVXBy4JmC8uLINROt4TIYQk3fp5u25NUNM=;
 b=BnM6ObbVvlHjNT0EQ9FNfJjw5uDAlrCLhNEcIu2YqjXKf/vGuoud+hHft88ZtRNtDuEwCg
 tBOK3Iz/LamlBXXb/s2VBKik1ft+6SPkGLcP8h8g11eIlgemJmkdkTnX+9qLAUoZF66N+E
 FHLnBM7v5jm+QRNUOfsvfgruR8wkbzM=
Date: Wed, 26 Jul 2023 15:24:02 +0800
MIME-Version: 1.0
To: Qi Zheng <zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-24-zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-24-zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/24 17:43,
 Qi Zheng wrote: > In preparation for implementing
 lockless slab shrink, use new APIs to > dynamically allocate the drm-msm_gem
 shrinker, so that it can be freed > asynchronously us [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qOYsp-002lYY-58
Subject: Re: [f2fs-dev] [PATCH v2 23/47] drm/msm: dynamically allocate the
 drm-msm_gem shrinker
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, tytso@mit.edu,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2023/7/24 17:43, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the drm-msm_gem shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct msm_drm_private.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

A nit bellow.

> ---
>   drivers/gpu/drm/msm/msm_drv.c          |  4 ++-
>   drivers/gpu/drm/msm/msm_drv.h          |  4 +--
>   drivers/gpu/drm/msm/msm_gem_shrinker.c | 36 ++++++++++++++++----------
>   3 files changed, 28 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 891eff8433a9..7f6933be703f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -461,7 +461,9 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	if (ret)
>   		goto err_msm_uninit;
>   
> -	msm_gem_shrinker_init(ddev);
> +	ret = msm_gem_shrinker_init(ddev);
> +	if (ret)
> +		goto err_msm_uninit;
>   
>   	if (priv->kms_init) {
>   		ret = priv->kms_init(ddev);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e13a8cbd61c9..84523d4a1e58 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -217,7 +217,7 @@ struct msm_drm_private {
>   	} vram;
>   
>   	struct notifier_block vmap_notifier;
> -	struct shrinker shrinker;
> +	struct shrinker *shrinker;
>   
>   	struct drm_atomic_state *pm_state;
>   
> @@ -279,7 +279,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan);
>   #endif
>   
> -void msm_gem_shrinker_init(struct drm_device *dev);
> +int msm_gem_shrinker_init(struct drm_device *dev);
>   void msm_gem_shrinker_cleanup(struct drm_device *dev);
>   
>   int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> index f38296ad8743..7daab1298c11 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -34,8 +34,7 @@ static bool can_block(struct shrink_control *sc)
>   static unsigned long
>   msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
>   {
> -	struct msm_drm_private *priv =
> -		container_of(shrinker, struct msm_drm_private, shrinker);
> +	struct msm_drm_private *priv = shrinker->private_data;
>   	unsigned count = priv->lru.dontneed.count;
>   
>   	if (can_swap())
> @@ -100,8 +99,7 @@ active_evict(struct drm_gem_object *obj)
>   static unsigned long
>   msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>   {
> -	struct msm_drm_private *priv =
> -		container_of(shrinker, struct msm_drm_private, shrinker);
> +	struct msm_drm_private *priv = shrinker->private_data;
>   	struct {
>   		struct drm_gem_lru *lru;
>   		bool (*shrink)(struct drm_gem_object *obj);
> @@ -148,10 +146,11 @@ msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan)
>   	struct shrink_control sc = {
>   		.nr_to_scan = nr_to_scan,
>   	};
> -	int ret;
> +	unsigned long ret = SHRINK_STOP;
>   
>   	fs_reclaim_acquire(GFP_KERNEL);
> -	ret = msm_gem_shrinker_scan(&priv->shrinker, &sc);
> +	if (priv->shrinker)
> +		ret = msm_gem_shrinker_scan(priv->shrinker, &sc);
>   	fs_reclaim_release(GFP_KERNEL);
>   
>   	return ret;
> @@ -210,16 +209,27 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
>    *
>    * This function registers and sets up the msm shrinker.
>    */
> -void msm_gem_shrinker_init(struct drm_device *dev)
> +int msm_gem_shrinker_init(struct drm_device *dev)
>   {
>   	struct msm_drm_private *priv = dev->dev_private;
> -	priv->shrinker.count_objects = msm_gem_shrinker_count;
> -	priv->shrinker.scan_objects = msm_gem_shrinker_scan;
> -	priv->shrinker.seeks = DEFAULT_SEEKS;
> -	WARN_ON(register_shrinker(&priv->shrinker, "drm-msm_gem"));
> +
> +	priv->shrinker = shrinker_alloc(0, "drm-msm_gem");
> +	if (!priv->shrinker) {

Just "if (WARN_ON(!priv->shrinker))"

> +		WARN_ON(1);
> +		return -ENOMEM;
> +	}
> +
> +	priv->shrinker->count_objects = msm_gem_shrinker_count;
> +	priv->shrinker->scan_objects = msm_gem_shrinker_scan;
> +	priv->shrinker->seeks = DEFAULT_SEEKS;
> +	priv->shrinker->private_data = priv;
> +
> +	shrinker_register(priv->shrinker);
>   
>   	priv->vmap_notifier.notifier_call = msm_gem_shrinker_vmap;
>   	WARN_ON(register_vmap_purge_notifier(&priv->vmap_notifier));
> +
> +	return 0;
>   }
>   
>   /**
> @@ -232,8 +242,8 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev)
>   {
>   	struct msm_drm_private *priv = dev->dev_private;
>   
> -	if (priv->shrinker.nr_deferred) {
> +	if (priv->shrinker) {
>   		WARN_ON(unregister_vmap_purge_notifier(&priv->vmap_notifier));
> -		unregister_shrinker(&priv->shrinker);
> +		shrinker_unregister(priv->shrinker);
>   	}
>   }



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
