Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A3877366E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Aug 2023 04:20:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTCKo-00081W-O1;
	Tue, 08 Aug 2023 02:20:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1qTCKn-00081K-8q
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 02:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S5nJ90Y7HkcDKRE+pcPu5keZJ+24iVkBC6PdC2b5uJ0=; b=VC+A80+2xqyF+0EBoeFR4GWKP/
 i/CILg8mY9zSh5K1xBs9FhahyYcyUh2nIEP3cgSXmk16GbDg8dTNmRvefmlmo2tTcpW28RkSDLrs/
 BsKUXcZNgtFhGOcZDJXS02m4wZQzyCdPwyVpFbmZJ7enQsYX5UUIodm2QcHeEVEOTSk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S5nJ90Y7HkcDKRE+pcPu5keZJ+24iVkBC6PdC2b5uJ0=; b=Pygfu9aueu++e+KPggpCB5mdhE
 mw5TLmkraGZbPnE85ciod+FiuzwQNGbocfXV9yEImKLuw6KXCPYyc8t7qn+SF2p1uSn2zQgvoTc0O
 FkIZtpwLEUcNbByQ9O38tUEAHl8lv985XKqpzl7ESz0D5XiFsQmDjlF6D831PXU7HV9k=;
Received: from mail-qt1-f180.google.com ([209.85.160.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qTCKh-0004um-VB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 02:20:32 +0000
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-40fd276621aso36128501cf.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Aug 2023 19:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1691461222; x=1692066022;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S5nJ90Y7HkcDKRE+pcPu5keZJ+24iVkBC6PdC2b5uJ0=;
 b=VvNNP1By2om1lhAYQYG3twEmC3NZ/MDgcz1X1b6ALiKEVVSy4DZo/kDY7fb1BZY4p0
 m46J4Z0giOWVrBx2xLpJpNPIexjWdjKzV+jYqAGZ/A8QShtLSLEY5+WhaA8wcpQo9S6u
 I1Hgv9oDEX7DooFaeytXZuUhjVHM307Cc1uzBzR9dpJlgzpwkSiQPTezrHuQEBj2Grvh
 ev7bGWoSzkBKlubYKjpyP3DeKSF3l+2afgZ/GsBKTT9dO79xuvkFrlKericH0AMxSNRA
 f5wnP3aDL3Te4bu0DFEGt/DDyQGXIJNGpriQ2WLevgWiI+WKgldmlzEaUPxJ0k6VWrfu
 skWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691461222; x=1692066022;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S5nJ90Y7HkcDKRE+pcPu5keZJ+24iVkBC6PdC2b5uJ0=;
 b=daln+BgeMhO5LMLHtJGXwd+kdCDKIIuX9orDUOwa27dR5J8tqoL4+THm4RbofaW6z3
 L4HK3hJWtPVdoTYI40pQ5gwAGfUAMGg5nWwecsSyOoqaaJ1CxQJW/HbQ/Xy6jaIp0Oll
 ZBtzmhddl7oBDZMF3fmearoeXFvK7LnIvD2+O1OwyzguCBdUqXRAdVi/WboSeLEsM8Im
 iZ34yS/8RkrN2Yi6FFS3fsq/F5TxLLb9H1yvSYmhp9jiKk5n0x7ML5vQHjXL7KN07eYC
 KqOPWBnqyUgdXMB/rTuX400A0wuyRhM42sIGpM+aCVM9Fp4n1sDiyWp42z3lRTtS7BIL
 gprg==
X-Gm-Message-State: AOJu0YyPeYvtsrhWvzdQmAa8Y901Hr67GpRvk9QObMTkHRiBT4lnGBFO
 Gv1KmTUdFHYgadBxJjTXlD0wtLvV04j4rN7qq4w=
X-Google-Smtp-Source: AGHT+IHE8FO8RAjHks3Izbxy+yXIAOFeIsxej7SyncoSZwq8TiDh2J09MxtXtA2ffdHhYGJ2WNjVaA==
X-Received: by 2002:a17:90a:ad90:b0:25e:d013:c22c with SMTP id
 s16-20020a17090aad9000b0025ed013c22cmr8256877pjq.47.1691460726140; 
 Mon, 07 Aug 2023 19:12:06 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-166-213.pa.nsw.optusnet.com.au.
 [49.180.166.213]) by smtp.gmail.com with ESMTPSA id
 jv14-20020a17090b31ce00b00263e4dc33aasm9313956pjb.11.2023.08.07.19.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 19:12:05 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qTCCY-002WbH-25;
 Tue, 08 Aug 2023 12:12:02 +1000
Date: Tue, 8 Aug 2023 12:12:02 +1000
To: Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <ZNGkcp3Dh8hOiFpk@dread.disaster.area>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-45-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807110936.21819-45-zhengqi.arch@bytedance.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 07, 2023 at 07:09:32PM +0800, Qi Zheng wrote:
 > Currently, we maintain two linear arrays per node per memcg, which are >
 shrinker_info::map and shrinker_info::nr_deferred. And we need to r [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.180 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.180 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qTCKh-0004um-VB
Subject: Re: [f2fs-dev] [PATCH v4 44/48] mm: shrinker: add a secondary array
 for shrinker_info::{map, nr_deferred}
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 cel@kernel.org, x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 simon.horman@corigine.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, paulmck@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 dlemoal@kernel.org, Muchun Song <songmuchun@bytedance.com>,
 yujie.liu@intel.com, vbabka@suse.cz, linux-raid@vger.kernel.org,
 brauner@kernel.org, tytso@mit.edu, gregkh@linuxfoundation.org,
 muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 07, 2023 at 07:09:32PM +0800, Qi Zheng wrote:
> Currently, we maintain two linear arrays per node per memcg, which are
> shrinker_info::map and shrinker_info::nr_deferred. And we need to resize
> them when the shrinker_nr_max is exceeded, that is, allocate a new array,
> and then copy the old array to the new array, and finally free the old
> array by RCU.
> 
> For shrinker_info::map, we do set_bit() under the RCU lock, so we may set
> the value into the old map which is about to be freed. This may cause the
> value set to be lost. The current solution is not to copy the old map when
> resizing, but to set all the corresponding bits in the new map to 1. This
> solves the data loss problem, but bring the overhead of more pointless
> loops while doing memcg slab shrink.
> 
> For shrinker_info::nr_deferred, we will only modify it under the read lock
> of shrinker_rwsem, so it will not run concurrently with the resizing. But
> after we make memcg slab shrink lockless, there will be the same data loss
> problem as shrinker_info::map, and we can't work around it like the map.
> 
> For such resizable arrays, the most straightforward idea is to change it
> to xarray, like we did for list_lru [1]. We need to do xa_store() in the
> list_lru_add()-->set_shrinker_bit(), but this will cause memory
> allocation, and the list_lru_add() doesn't accept failure. A possible
> solution is to pre-allocate, but the location of pre-allocation is not
> well determined.

So you implemented a two level array that preallocates leaf
nodes to work around it? It's remarkable complex for what it does,
I can't help but think a radix tree using a special holder for
nr_deferred values of zero would end up being simpler...

> Therefore, this commit chooses to introduce a secondary array for
> shrinker_info::{map, nr_deferred}, so that we only need to copy this
> secondary array every time the size is resized. Then even if we get the
> old secondary array under the RCU lock, the found map and nr_deferred are
> also true, so no data is lost.

I don't understand what you are trying to describe here. If we get
the old array, then don't we get either a stale nr_deferred value,
or the update we do gets lost because the next shrinker lookup will
find the new array and os the deferred value stored to the old one
is never seen again?

> 
> [1]. https://lore.kernel.org/all/20220228122126.37293-13-songmuchun@bytedance.com/
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
.....
> diff --git a/mm/shrinker.c b/mm/shrinker.c
> index a27779ed3798..1911c06b8af5 100644
> --- a/mm/shrinker.c
> +++ b/mm/shrinker.c
> @@ -12,15 +12,50 @@ DECLARE_RWSEM(shrinker_rwsem);
>  #ifdef CONFIG_MEMCG
>  static int shrinker_nr_max;
>  
> -/* The shrinker_info is expanded in a batch of BITS_PER_LONG */
> -static inline int shrinker_map_size(int nr_items)
> +static inline int shrinker_unit_size(int nr_items)
>  {
> -	return (DIV_ROUND_UP(nr_items, BITS_PER_LONG) * sizeof(unsigned long));
> +	return (DIV_ROUND_UP(nr_items, SHRINKER_UNIT_BITS) * sizeof(struct shrinker_info_unit *));
>  }
>  
> -static inline int shrinker_defer_size(int nr_items)
> +static inline void shrinker_unit_free(struct shrinker_info *info, int start)
>  {
> -	return (round_up(nr_items, BITS_PER_LONG) * sizeof(atomic_long_t));
> +	struct shrinker_info_unit **unit;
> +	int nr, i;
> +
> +	if (!info)
> +		return;
> +
> +	unit = info->unit;
> +	nr = DIV_ROUND_UP(info->map_nr_max, SHRINKER_UNIT_BITS);
> +
> +	for (i = start; i < nr; i++) {
> +		if (!unit[i])
> +			break;
> +
> +		kvfree(unit[i]);
> +		unit[i] = NULL;
> +	}
> +}
> +
> +static inline int shrinker_unit_alloc(struct shrinker_info *new,
> +				       struct shrinker_info *old, int nid)
> +{
> +	struct shrinker_info_unit *unit;
> +	int nr = DIV_ROUND_UP(new->map_nr_max, SHRINKER_UNIT_BITS);
> +	int start = old ? DIV_ROUND_UP(old->map_nr_max, SHRINKER_UNIT_BITS) : 0;
> +	int i;
> +
> +	for (i = start; i < nr; i++) {
> +		unit = kvzalloc_node(sizeof(*unit), GFP_KERNEL, nid);

A unit is 576 bytes. Why is this using kvzalloc_node()?

> +		if (!unit) {
> +			shrinker_unit_free(new, start);
> +			return -ENOMEM;
> +		}
> +
> +		new->unit[i] = unit;
> +	}
> +
> +	return 0;
>  }
>  
>  void free_shrinker_info(struct mem_cgroup *memcg)
> @@ -32,6 +67,7 @@ void free_shrinker_info(struct mem_cgroup *memcg)
>  	for_each_node(nid) {
>  		pn = memcg->nodeinfo[nid];
>  		info = rcu_dereference_protected(pn->shrinker_info, true);
> +		shrinker_unit_free(info, 0);
>  		kvfree(info);
>  		rcu_assign_pointer(pn->shrinker_info, NULL);
>  	}

Why is this safe? The info and maps are looked up by RCU, so why is
freeing them without a RCU grace period expiring safe?

Yes, it was safe to do this when it was all under a semaphore, but
now the lookup and use is under RCU, so this freeing isn't
serialised against lookups anymore...


> @@ -40,28 +76,27 @@ void free_shrinker_info(struct mem_cgroup *memcg)
>  int alloc_shrinker_info(struct mem_cgroup *memcg)
>  {
>  	struct shrinker_info *info;
> -	int nid, size, ret = 0;
> -	int map_size, defer_size = 0;
> +	int nid, ret = 0;
> +	int array_size = 0;
>  
>  	down_write(&shrinker_rwsem);
> -	map_size = shrinker_map_size(shrinker_nr_max);
> -	defer_size = shrinker_defer_size(shrinker_nr_max);
> -	size = map_size + defer_size;
> +	array_size = shrinker_unit_size(shrinker_nr_max);
>  	for_each_node(nid) {
> -		info = kvzalloc_node(sizeof(*info) + size, GFP_KERNEL, nid);
> -		if (!info) {
> -			free_shrinker_info(memcg);
> -			ret = -ENOMEM;
> -			break;
> -		}
> -		info->nr_deferred = (atomic_long_t *)(info + 1);
> -		info->map = (void *)info->nr_deferred + defer_size;
> +		info = kvzalloc_node(sizeof(*info) + array_size, GFP_KERNEL, nid);
> +		if (!info)
> +			goto err;
>  		info->map_nr_max = shrinker_nr_max;
> +		if (shrinker_unit_alloc(info, NULL, nid))
> +			goto err;

That's going to now do a lot of small memory allocation when we have
lots of shrinkers active....

> @@ -150,17 +175,34 @@ static int expand_shrinker_info(int new_id)
>  	return ret;
>  }
>  
> +static inline int shriner_id_to_index(int shrinker_id)

shrinker_id_to_index

> +{
> +	return shrinker_id / SHRINKER_UNIT_BITS;
> +}
> +
> +static inline int shriner_id_to_offset(int shrinker_id)

shrinker_id_to_offset

> +{
> +	return shrinker_id % SHRINKER_UNIT_BITS;
> +}

....
> @@ -209,26 +251,31 @@ static long xchg_nr_deferred_memcg(int nid, struct shrinker *shrinker,
>  				   struct mem_cgroup *memcg)
>  {
>  	struct shrinker_info *info;
> +	struct shrinker_info_unit *unit;
>  
>  	info = shrinker_info_protected(memcg, nid);
> -	return atomic_long_xchg(&info->nr_deferred[shrinker->id], 0);
> +	unit = info->unit[shriner_id_to_index(shrinker->id)];
> +	return atomic_long_xchg(&unit->nr_deferred[shriner_id_to_offset(shrinker->id)], 0);
>  }
>  
>  static long add_nr_deferred_memcg(long nr, int nid, struct shrinker *shrinker,
>  				  struct mem_cgroup *memcg)
>  {
>  	struct shrinker_info *info;
> +	struct shrinker_info_unit *unit;
>  
>  	info = shrinker_info_protected(memcg, nid);
> -	return atomic_long_add_return(nr, &info->nr_deferred[shrinker->id]);
> +	unit = info->unit[shriner_id_to_index(shrinker->id)];
> +	return atomic_long_add_return(nr, &unit->nr_deferred[shriner_id_to_offset(shrinker->id)]);
>  }
>  
>  void reparent_shrinker_deferred(struct mem_cgroup *memcg)
>  {
> -	int i, nid;
> +	int nid, index, offset;
>  	long nr;
>  	struct mem_cgroup *parent;
>  	struct shrinker_info *child_info, *parent_info;
> +	struct shrinker_info_unit *child_unit, *parent_unit;
>  
>  	parent = parent_mem_cgroup(memcg);
>  	if (!parent)
> @@ -239,9 +286,13 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
>  	for_each_node(nid) {
>  		child_info = shrinker_info_protected(memcg, nid);
>  		parent_info = shrinker_info_protected(parent, nid);
> -		for (i = 0; i < child_info->map_nr_max; i++) {
> -			nr = atomic_long_read(&child_info->nr_deferred[i]);
> -			atomic_long_add(nr, &parent_info->nr_deferred[i]);
> +		for (index = 0; index < shriner_id_to_index(child_info->map_nr_max); index++) {
> +			child_unit = child_info->unit[index];
> +			parent_unit = parent_info->unit[index];
> +			for (offset = 0; offset < SHRINKER_UNIT_BITS; offset++) {
> +				nr = atomic_long_read(&child_unit->nr_deferred[offset]);
> +				atomic_long_add(nr, &parent_unit->nr_deferred[offset]);
> +			}
>  		}
>  	}
>  	up_read(&shrinker_rwsem);
> @@ -407,7 +458,7 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>  {
>  	struct shrinker_info *info;
>  	unsigned long ret, freed = 0;
> -	int i;
> +	int offset, index = 0;
>  
>  	if (!mem_cgroup_online(memcg))
>  		return 0;
> @@ -419,56 +470,63 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>  	if (unlikely(!info))
>  		goto unlock;
>  
> -	for_each_set_bit(i, info->map, info->map_nr_max) {
> -		struct shrink_control sc = {
> -			.gfp_mask = gfp_mask,
> -			.nid = nid,
> -			.memcg = memcg,
> -		};
> -		struct shrinker *shrinker;
> +	for (; index < shriner_id_to_index(info->map_nr_max); index++) {
> +		struct shrinker_info_unit *unit;

This adds another layer of indent to shrink_slab_memcg(). Please
factor it first so that the code ends up being readable. Doing that
first as a separate patch will also make the actual algorithm
changes in this patch be much more obvious - this huge hunk of
diff is pretty much impossible to review...

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
