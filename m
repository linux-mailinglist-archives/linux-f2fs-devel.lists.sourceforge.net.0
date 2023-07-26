Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C0762DB9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 09:32:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOZ0p-0005Gh-3L;
	Wed, 26 Jul 2023 07:32:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <muchun.song@linux.dev>) id 1qOZ0g-0005GF-5i
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 07:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OYGRVTqgscFQdcJoAIv1RQJgZK2J3Xems6RanwsA4o0=; b=Iu4BdPFztwsNYzYRc/RRiUMHnx
 yQorTsGMT9hDv8WLJLsePrH5dtxvPDyFzwK3DS0i3P1uj1C30b/zbZRB38k5reK4jB2i9QngnDZo2
 3i4Gs7MblXwqyVpfaYbfAdsT1VMwwUXhKO5ptqVJhROUvfxD7+hgWQXLQ8gmmGcQnzwQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OYGRVTqgscFQdcJoAIv1RQJgZK2J3Xems6RanwsA4o0=; b=Tun1ABvn1f0PAam33X4pNUIDgE
 9I7BVf8TUaHRISiX7WqYEbNKM+VqjwgV0H5Jz31tNAu8WM7Hj5JRswX4fh5cACMroA2jSMtX51Okb
 WvHjrq4otPzST6jRuxLf5Gruz0FJKomPCVRxVhcUpVjvEgfyAGYwBpEbjBYBUi+iQezM=;
Received: from out-30.mta1.migadu.com ([95.215.58.30])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qOZ0a-002mD2-UE for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 07:32:37 +0000
Message-ID: <4ee26da4-314e-0517-5d9a-31fb107368ef@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1690356746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OYGRVTqgscFQdcJoAIv1RQJgZK2J3Xems6RanwsA4o0=;
 b=GCsKw+CqeG0NLvU5JG9vhNLkiCqBIozjq4+mghrN4n54qEc8Ada19ZBzziy+rqbgGP2UKc
 TRnfIbI6wQqD1XzBynZ64zgbT937OIDi9314tjiKBhNwZptVDCqjhQglYT3NeOO47ZzKdD
 /L1dy0OB1iSvzxJ2Vh5k44+kOPJOpuA=
Date: Wed, 26 Jul 2023 15:32:10 +0800
MIME-Version: 1.0
To: Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
 david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-29-zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-29-zhengqi.arch@bytedance.com>
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
 lockless slab shrink, use new APIs to > dynamically allocate the md-bcache
 shrinker, so that it can be freed > asynchronously usin [...] 
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
X-Headers-End: 1qOZ0a-002mD2-UE
Subject: Re: [f2fs-dev] [PATCH v2 28/47] bcache: dynamically allocate the
 md-bcache shrinker
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
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2023/7/24 17:43, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the md-bcache shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct cache_set.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   drivers/md/bcache/bcache.h |  2 +-
>   drivers/md/bcache/btree.c  | 27 ++++++++++++++++-----------
>   drivers/md/bcache/sysfs.c  |  3 ++-
>   3 files changed, 19 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/md/bcache/bcache.h b/drivers/md/bcache/bcache.h
> index 5a79bb3c272f..c622bc50f81b 100644
> --- a/drivers/md/bcache/bcache.h
> +++ b/drivers/md/bcache/bcache.h
> @@ -541,7 +541,7 @@ struct cache_set {
>   	struct bio_set		bio_split;
>   
>   	/* For the btree cache */
> -	struct shrinker		shrink;
> +	struct shrinker		*shrink;
>   
>   	/* For the btree cache and anything allocation related */
>   	struct mutex		bucket_lock;
> diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
> index fd121a61f17c..c176c7fc77d9 100644
> --- a/drivers/md/bcache/btree.c
> +++ b/drivers/md/bcache/btree.c
> @@ -667,7 +667,7 @@ static int mca_reap(struct btree *b, unsigned int min_order, bool flush)
>   static unsigned long bch_mca_scan(struct shrinker *shrink,
>   				  struct shrink_control *sc)
>   {
> -	struct cache_set *c = container_of(shrink, struct cache_set, shrink);
> +	struct cache_set *c = shrink->private_data;
>   	struct btree *b, *t;
>   	unsigned long i, nr = sc->nr_to_scan;
>   	unsigned long freed = 0;
> @@ -734,7 +734,7 @@ static unsigned long bch_mca_scan(struct shrinker *shrink,
>   static unsigned long bch_mca_count(struct shrinker *shrink,
>   				   struct shrink_control *sc)
>   {
> -	struct cache_set *c = container_of(shrink, struct cache_set, shrink);
> +	struct cache_set *c = shrink->private_data;
>   
>   	if (c->shrinker_disabled)
>   		return 0;
> @@ -752,8 +752,8 @@ void bch_btree_cache_free(struct cache_set *c)
>   
>   	closure_init_stack(&cl);
>   
> -	if (c->shrink.list.next)
> -		unregister_shrinker(&c->shrink);
> +	if (c->shrink)
> +		shrinker_unregister(c->shrink);
>   
>   	mutex_lock(&c->bucket_lock);
>   
> @@ -828,14 +828,19 @@ int bch_btree_cache_alloc(struct cache_set *c)
>   		c->verify_data = NULL;
>   #endif
>   
> -	c->shrink.count_objects = bch_mca_count;
> -	c->shrink.scan_objects = bch_mca_scan;
> -	c->shrink.seeks = 4;
> -	c->shrink.batch = c->btree_pages * 2;
> +	c->shrink = shrinker_alloc(0, "md-bcache:%pU", c->set_uuid);
> +	if (!c->shrink) {
> +		pr_warn("bcache: %s: could not allocate shrinker\n", __func__);
> +		return -ENOMEM;

Seems you have cheanged the semantic of this. In the past,
it is better to have a shrinker, but now it becomes a mandatory.
Right? I don't know if it is acceptable. From my point of view,
just do the cleanup, don't change any behaviour.

> +	}
> +
> +	c->shrink->count_objects = bch_mca_count;
> +	c->shrink->scan_objects = bch_mca_scan;
> +	c->shrink->seeks = 4;
> +	c->shrink->batch = c->btree_pages * 2;
> +	c->shrink->private_data = c;
>   
> -	if (register_shrinker(&c->shrink, "md-bcache:%pU", c->set_uuid))
> -		pr_warn("bcache: %s: could not register shrinker\n",
> -				__func__);
> +	shrinker_register(c->shrink);
>   
>   	return 0;
>   }
> diff --git a/drivers/md/bcache/sysfs.c b/drivers/md/bcache/sysfs.c
> index 0e2c1880f60b..45d8af755de6 100644
> --- a/drivers/md/bcache/sysfs.c
> +++ b/drivers/md/bcache/sysfs.c
> @@ -866,7 +866,8 @@ STORE(__bch_cache_set)
>   
>   		sc.gfp_mask = GFP_KERNEL;
>   		sc.nr_to_scan = strtoul_or_return(buf);
> -		c->shrink.scan_objects(&c->shrink, &sc);
> +		if (c->shrink)
> +			c->shrink->scan_objects(c->shrink, &sc);
>   	}
>   
>   	sysfs_strtoul_clamp(congested_read_threshold_us,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
