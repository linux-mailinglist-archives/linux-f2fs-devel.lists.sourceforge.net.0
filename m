Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCA9773687
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Aug 2023 04:24:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTCOT-0005lx-Th;
	Tue, 08 Aug 2023 02:24:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1qTCOS-0005lr-PD
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 02:24:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HUGk8Gm4qWKcvYyYW1oMdtOdnxgdWZtLrf0WmvG8aOg=; b=WpPBe2NoSMdTQ+KrWeCjndwTHA
 3LVklG7MxOpVniptX4KDNYw22sRuCyogCYJVvvcQaAOLhKdnypMLCFVi3Ubmf89elhKshv2XqSR3T
 Sa8tIz3NztQ4bLeX+iO8e9hgGplYdjBMUnV2Rz36MjZtsZtVnc7oowtgG0gtwuJ7QSzE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HUGk8Gm4qWKcvYyYW1oMdtOdnxgdWZtLrf0WmvG8aOg=; b=hD+yDTa/QVfc6JyF8pDk+BW+ZF
 jg9d25Pum2a4wF6M+Fk1RWd68ebhnPsoC6CGC+olCdvjEzuwI4UQTB69ZAdF2CaZhbp0WVrl9UDF9
 z4JOJhuva5OKctVJHZeHT2PNwyBqXGEh/S/R5IeJ1RFAbfWicTl27LCDxYDTmJnGSO6g=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qTCOR-00052u-GL for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 02:24:21 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1bc6624623cso18732695ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Aug 2023 19:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1691461454; x=1692066254;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HUGk8Gm4qWKcvYyYW1oMdtOdnxgdWZtLrf0WmvG8aOg=;
 b=E8R/sNcxrOK1IUnWWdPxuHAURfzEKsQXFvPF/8WoYIocyBzrOF6C/15wk0bBTyq8fp
 w+9skh2POsCjChG96SdxCE1ukUJoo7U6iUCJoOHux3qHabiPQt2q8GYhzVnnqh4Ia8gf
 otMrpF/u+4+6GZvnjfH9iZQVLX7oYyO80eB3aSg/65gqSdDxQ6TBQ0eTbg/7hck8CRIR
 N2poqJrxPUv+xHM8+kwldwyyrpY8ClA2gjcNqxK3I6Rjaxj3f+CIGTw2aTNSrwyrBhAC
 fS1NWvmq7XKVFcVROA15iTu7BqzTlMOOgRsfusR61dD9uCRFfNfvH5SixHmdTB0ZZ2at
 NUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691461454; x=1692066254;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HUGk8Gm4qWKcvYyYW1oMdtOdnxgdWZtLrf0WmvG8aOg=;
 b=K8hVvwmECK1M9aBfgSc0Eu3ccS4Rok3j7Bf23UqThbT3FuKvpMN+x85GUeoQEgy3Lf
 QkbeZQAxxIuiPqNkbE96UXsZu8NH59GEnbpWlFT0rmUtGqDIdnjD8aT0gv5y+Ysmp8R8
 Gg1biguKRpeybkSNH43aLrg7CdaYViU15IUCO0Yg8fdrE9S9fKMKr22g7IsTV5Btnm//
 wpwHLNWd8cpZqSEk4LoBcIFa3msAtTukDVYkkiIiyQjlpER3N5/zB27qR6n+KAg69o9K
 Vo7yKFOdWOk+piuvoJorm2zqd387ZiG7sEHQZNctJQObJGm9AI4a9WWDbVSkgllkXkJU
 wAtw==
X-Gm-Message-State: AOJu0Yzm6eObTYID6LkIkjrEIA9bLP9OZtsYBnTCCUvyG4E6XQKgd9uS
 2J0Z3l7dcuhd1K8P4EV3gTXj5w==
X-Google-Smtp-Source: AGHT+IEzrDGpXyLCXRNBmZGxK80nBmbnZ3Zc29NdEkVzSJ3QNXEJvOFh13D52+77LsVxnWz7HKqTHA==
X-Received: by 2002:a17:902:8692:b0:1b9:d307:c1df with SMTP id
 g18-20020a170902869200b001b9d307c1dfmr10722096plo.17.1691461453690; 
 Mon, 07 Aug 2023 19:24:13 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-166-213.pa.nsw.optusnet.com.au.
 [49.180.166.213]) by smtp.gmail.com with ESMTPSA id
 h17-20020a170902f55100b001b864add154sm7583543plf.154.2023.08.07.19.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 19:24:13 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qTCOH-002Wjl-2u;
 Tue, 08 Aug 2023 12:24:09 +1000
Date: Tue, 8 Aug 2023 12:24:09 +1000
To: Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <ZNGnSbiPN0lDLpSW@dread.disaster.area>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-46-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807110936.21819-46-zhengqi.arch@bytedance.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 07, 2023 at 07:09:33PM +0800, Qi Zheng wrote:
 > diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h > index
 eb342994675a..f06225f18531 100644 > --- a/include/linux/shrinker.h [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qTCOR-00052u-GL
Subject: Re: [f2fs-dev] [PATCH v4 45/48] mm: shrinker: make global slab
 shrink lockless
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
 dlemoal@kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, brauner@kernel.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 07, 2023 at 07:09:33PM +0800, Qi Zheng wrote:
> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> index eb342994675a..f06225f18531 100644
> --- a/include/linux/shrinker.h
> +++ b/include/linux/shrinker.h
> @@ -4,6 +4,8 @@
>  
>  #include <linux/atomic.h>
>  #include <linux/types.h>
> +#include <linux/refcount.h>
> +#include <linux/completion.h>
>  
>  #define SHRINKER_UNIT_BITS	BITS_PER_LONG
>  
> @@ -87,6 +89,10 @@ struct shrinker {
>  	int seeks;	/* seeks to recreate an obj */
>  	unsigned flags;
>  
> +	refcount_t refcount;
> +	struct completion done;
> +	struct rcu_head rcu;

Documentation, please. What does the refcount protect, what does the
completion provide, etc.

> +
>  	void *private_data;
>  
>  	/* These are for internal use */
> @@ -120,6 +126,17 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
>  void shrinker_register(struct shrinker *shrinker);
>  void shrinker_free(struct shrinker *shrinker);
>  
> +static inline bool shrinker_try_get(struct shrinker *shrinker)
> +{
> +	return refcount_inc_not_zero(&shrinker->refcount);
> +}
> +
> +static inline void shrinker_put(struct shrinker *shrinker)
> +{
> +	if (refcount_dec_and_test(&shrinker->refcount))
> +		complete(&shrinker->done);
> +}
> +
>  #ifdef CONFIG_SHRINKER_DEBUG
>  extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
>  						  const char *fmt, ...);
> diff --git a/mm/shrinker.c b/mm/shrinker.c
> index 1911c06b8af5..d318f5621862 100644
> --- a/mm/shrinker.c
> +++ b/mm/shrinker.c
> @@ -2,6 +2,7 @@
>  #include <linux/memcontrol.h>
>  #include <linux/rwsem.h>
>  #include <linux/shrinker.h>
> +#include <linux/rculist.h>
>  #include <trace/events/vmscan.h>
>  
>  #include "internal.h"
> @@ -577,33 +578,42 @@ unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>  	if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
>  		return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
>  
> -	if (!down_read_trylock(&shrinker_rwsem))
> -		goto out;
> -
> -	list_for_each_entry(shrinker, &shrinker_list, list) {
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(shrinker, &shrinker_list, list) {
>  		struct shrink_control sc = {
>  			.gfp_mask = gfp_mask,
>  			.nid = nid,
>  			.memcg = memcg,
>  		};
>  
> +		if (!shrinker_try_get(shrinker))
> +			continue;
> +
> +		/*
> +		 * We can safely unlock the RCU lock here since we already
> +		 * hold the refcount of the shrinker.
> +		 */
> +		rcu_read_unlock();
> +
>  		ret = do_shrink_slab(&sc, shrinker, priority);
>  		if (ret == SHRINK_EMPTY)
>  			ret = 0;
>  		freed += ret;
> +
>  		/*
> -		 * Bail out if someone want to register a new shrinker to
> -		 * prevent the registration from being stalled for long periods
> -		 * by parallel ongoing shrinking.
> +		 * This shrinker may be deleted from shrinker_list and freed
> +		 * after the shrinker_put() below, but this shrinker is still
> +		 * used for the next traversal. So it is necessary to hold the
> +		 * RCU lock first to prevent this shrinker from being freed,
> +		 * which also ensures that the next shrinker that is traversed
> +		 * will not be freed (even if it is deleted from shrinker_list
> +		 * at the same time).
>  		 */

This needs to be moved to the head of the function, and document
the whole list walk, get, put and completion parts of the algorithm
that make it safe. There's more to this than "we hold a reference
count", especially the tricky "we might see the shrinker before it
is fully initialised" case....


.....
>  void shrinker_free(struct shrinker *shrinker)
>  {
>  	struct dentry *debugfs_entry = NULL;
> @@ -686,9 +712,18 @@ void shrinker_free(struct shrinker *shrinker)
>  	if (!shrinker)
>  		return;
>  
> +	if (shrinker->flags & SHRINKER_REGISTERED) {
> +		shrinker_put(shrinker);
> +		wait_for_completion(&shrinker->done);
> +	}

Needs a comment explaining why we need to wait here...
> +
>  	down_write(&shrinker_rwsem);
>  	if (shrinker->flags & SHRINKER_REGISTERED) {
> -		list_del(&shrinker->list);
> +		/*
> +		 * Lookups on the shrinker are over and will fail in the future,
> +		 * so we can now remove it from the lists and free it.
> +		 */

.... rather than here after the wait has been done and provided the
guarantee that no shrinker is running or will run again...

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
