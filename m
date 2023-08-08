Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FE77736F1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Aug 2023 04:44:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTChq-0003rH-84;
	Tue, 08 Aug 2023 02:44:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1qTChp-0003rB-3p
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 02:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZZ3n364wJBBn5i6olC7X8xOphz5aoEwi3PPn9Humxy4=; b=baWLK1oVNMu4FrQtsODkgXXByj
 BgSqOBhObrTdqxuvbsAt9ZIIkApQotv3HLrAU6S9Q2ACN8C98+0oMb9ARDj0hdVVfjS53kNtdgSwv
 L2g3MsLniVVA5Gpa1hr1btfWiWu5pw+IU2UI3Mf1m1iBwvP2eWEpDj470PdhbCmbE1Ac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZZ3n364wJBBn5i6olC7X8xOphz5aoEwi3PPn9Humxy4=; b=EamEOmcGlWdJrasBqr1pwQuXtQ
 CQB+IUErYDFIj/bVlG626CZ9puYZ+B26JqebBNij/iePsG4nYUcagy4GkVwv47s0wmLYMKpP+gL+P
 mTIy1FSsKDp8FLDApj5oo2tFEaIy8YYmJRmIWjC3J/OjYV3CBvdI0bqgJ0LxB2XiBKsI=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qTCho-00Gbfm-Bc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 02:44:22 +0000
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1bbf3da0ea9so33830205ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Aug 2023 19:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1691462655; x=1692067455;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZ3n364wJBBn5i6olC7X8xOphz5aoEwi3PPn9Humxy4=;
 b=c9iOPpy41VC6QSzv5vLbmCPsxZB2K7hAItf8MEtryT/BAlfvdA0UPM4PAg3DtN7rr+
 GFW2nm1AoLFEe5zmSSiqyIhn92P6iecybeuExkqa7jbnj+LEVM1LioV7SZGiR/8Kzy2+
 mJYrJW8XMi2+dbRvP7Xg6QuSzUnp/yHkq29M7vbAYNrF1NokfShgkpn7COiSBb38dkF0
 MWE0ZNG9ZS4LzaWgVeAy0Pmh7etHcKYaOYLW+oCVP3Q2zlcEbOnfLG0lI+GjqQwBJGqv
 OKDqkP3u3mDYRaZI2hDArPl64kIP09oRYh791qhymi4aMBqJthtqlGcAIAw7e+Im4Q2d
 AiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691462655; x=1692067455;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZ3n364wJBBn5i6olC7X8xOphz5aoEwi3PPn9Humxy4=;
 b=PfClKtosrf6/kV2DgP1L2CK6wwHI2hQEO90KGfbEiZlEmYIRbMDkCC+Qim6OlobyT7
 A2VF9l5iPYE+d7tfvIDnx9QPYR/GW4JMDxrNmBLKLx0QYRNIDzFfqUG+qwqrX11tNYOg
 zYarYl06gIb+2JOJAlc0qCtrQqm+dp+VwFkW7GloIxFGf2cGXE/NAcMk+o2aW7/fS0a2
 PnGz617ok4EhyX2hOGYHax/f17eKy84ICSCn65vxPWCJrhdW4CB4FWXWqjVQVKEUBaQH
 DkE9TUQ7EgCYSc23Do630O7hSxTmEMIrdI6qejR9ND8+LV2QB0rzQisWkos/wMIzTvLN
 tGUA==
X-Gm-Message-State: AOJu0YxSQplirFbNJN7vqJ/8dngudlyYCm4M/L5Il/CvD/tK/uu+1Hrr
 9QR9+b51VK+M7x0LZYFqWeRgXg==
X-Google-Smtp-Source: AGHT+IEZT2gUmOSYrkIbMjP5ySF6z1UEt5Q+o+GMN8zU98oO9pgzqqi+i8QK+swPthTlPTk4WQ36Qw==
X-Received: by 2002:a17:902:7287:b0:1b3:f5c7:4e75 with SMTP id
 d7-20020a170902728700b001b3f5c74e75mr9699662pll.58.1691462654669; 
 Mon, 07 Aug 2023 19:44:14 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-166-213.pa.nsw.optusnet.com.au.
 [49.180.166.213]) by smtp.gmail.com with ESMTPSA id
 u2-20020a170902e80200b001b893b689a0sm7632067plg.84.2023.08.07.19.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 19:44:14 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qTChf-002XBg-27;
 Tue, 08 Aug 2023 12:44:11 +1000
Date: Tue, 8 Aug 2023 12:44:11 +1000
To: Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <ZNGr+1orhHaBORJG@dread.disaster.area>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-47-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807110936.21819-47-zhengqi.arch@bytedance.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 07, 2023 at 07:09:34PM +0800, Qi Zheng wrote:
 > Like global slab shrink, this commit also uses refcount+RCU method to make
 > memcg slab shrink lockless. This patch does random code cleanups amongst
 the actual RCU changes. Can you please move the cleanups to a spearate patch
 to reduce the noise in this one? 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.180 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.180 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qTCho-00Gbfm-Bc
Subject: Re: [f2fs-dev] [PATCH v4 46/48] mm: shrinker: make memcg slab
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

On Mon, Aug 07, 2023 at 07:09:34PM +0800, Qi Zheng wrote:
> Like global slab shrink, this commit also uses refcount+RCU method to make
> memcg slab shrink lockless.

This patch does random code cleanups amongst the actual RCU changes.
Can you please move the cleanups to a spearate patch to reduce the
noise in this one?

> diff --git a/mm/shrinker.c b/mm/shrinker.c
> index d318f5621862..fee6f62904fb 100644
> --- a/mm/shrinker.c
> +++ b/mm/shrinker.c
> @@ -107,6 +107,12 @@ static struct shrinker_info *shrinker_info_protected(struct mem_cgroup *memcg,
>  					 lockdep_is_held(&shrinker_rwsem));
>  }
>  
> +static struct shrinker_info *shrinker_info_rcu(struct mem_cgroup *memcg,
> +					       int nid)
> +{
> +	return rcu_dereference(memcg->nodeinfo[nid]->shrinker_info);
> +}

This helper doesn't add value. It doesn't tell me that
rcu_read_lock() needs to be held when it is called, for one....

>  static int expand_one_shrinker_info(struct mem_cgroup *memcg, int new_size,
>  				    int old_size, int new_nr_max)
>  {
> @@ -198,7 +204,7 @@ void set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id)
>  		struct shrinker_info_unit *unit;
>  
>  		rcu_read_lock();
> -		info = rcu_dereference(memcg->nodeinfo[nid]->shrinker_info);
> +		info = shrinker_info_rcu(memcg, nid);

... whilst the original code here was obviously correct.

>  		unit = info->unit[shriner_id_to_index(shrinker_id)];
>  		if (!WARN_ON_ONCE(shrinker_id >= info->map_nr_max)) {
>  			/* Pairs with smp mb in shrink_slab() */
> @@ -211,7 +217,7 @@ void set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id)
>  
>  static DEFINE_IDR(shrinker_idr);
>  
> -static int prealloc_memcg_shrinker(struct shrinker *shrinker)
> +static int shrinker_memcg_alloc(struct shrinker *shrinker)

Cleanups in a separate patch.

> @@ -253,10 +258,15 @@ static long xchg_nr_deferred_memcg(int nid, struct shrinker *shrinker,
>  {
>  	struct shrinker_info *info;
>  	struct shrinker_info_unit *unit;
> +	long nr_deferred;
>  
> -	info = shrinker_info_protected(memcg, nid);
> +	rcu_read_lock();
> +	info = shrinker_info_rcu(memcg, nid);
>  	unit = info->unit[shriner_id_to_index(shrinker->id)];
> -	return atomic_long_xchg(&unit->nr_deferred[shriner_id_to_offset(shrinker->id)], 0);
> +	nr_deferred = atomic_long_xchg(&unit->nr_deferred[shriner_id_to_offset(shrinker->id)], 0);
> +	rcu_read_unlock();
> +
> +	return nr_deferred;
>  }

This adds two rcu_read_lock() sections to every call to
do_shrink_slab(). It's not at all clear ifrom any of the other code
that do_shrink_slab() now has internal rcu_read_lock() sections....

> @@ -464,18 +480,23 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>  	if (!mem_cgroup_online(memcg))
>  		return 0;
>  
> -	if (!down_read_trylock(&shrinker_rwsem))
> -		return 0;
> -
> -	info = shrinker_info_protected(memcg, nid);
> +again:
> +	rcu_read_lock();
> +	info = shrinker_info_rcu(memcg, nid);
>  	if (unlikely(!info))
>  		goto unlock;
>  
> -	for (; index < shriner_id_to_index(info->map_nr_max); index++) {
> +	if (index < shriner_id_to_index(info->map_nr_max)) {
>  		struct shrinker_info_unit *unit;
>  
>  		unit = info->unit[index];
>  
> +		/*
> +		 * The shrinker_info_unit will not be freed, so we can
> +		 * safely release the RCU lock here.
> +		 */
> +		rcu_read_unlock();

Why - what guarantees that the shrinker_info_unit exists at this
point? We hold no reference to it, we hold no reference to any
shrinker, etc. What provides this existence guarantee?

> +
>  		for_each_set_bit(offset, unit->map, SHRINKER_UNIT_BITS) {
>  			struct shrink_control sc = {
>  				.gfp_mask = gfp_mask,
> @@ -485,12 +506,14 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>  			struct shrinker *shrinker;
>  			int shrinker_id = calc_shrinker_id(index, offset);
>  
> +			rcu_read_lock();
>  			shrinker = idr_find(&shrinker_idr, shrinker_id);
> -			if (unlikely(!shrinker || !(shrinker->flags & SHRINKER_REGISTERED))) {
> -				if (!shrinker)
> -					clear_bit(offset, unit->map);
> +			if (unlikely(!shrinker || !shrinker_try_get(shrinker))) {
> +				clear_bit(offset, unit->map);
> +				rcu_read_unlock();
>  				continue;
>  			}
> +			rcu_read_unlock();
>  
>  			/* Call non-slab shrinkers even though kmem is disabled */
>  			if (!memcg_kmem_online() &&
> @@ -523,15 +546,20 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>  					set_shrinker_bit(memcg, nid, shrinker_id);
>  			}
>  			freed += ret;
> -
> -			if (rwsem_is_contended(&shrinker_rwsem)) {
> -				freed = freed ? : 1;
> -				goto unlock;
> -			}
> +			shrinker_put(shrinker);

Ok, so why is this safe to call without holding the rcu read lock?
The global shrinker has to hold the rcu_read_lock() whilst calling
shrinker_put() to guarantee the validity of the list next pointer,
but we don't hold off RCU here so what guarantees a racing global
shrinker walk doesn't trip over this shrinker_put() call dropping
the refcount to zero and freeing occuring in a different context...


> +		/*
> +		 * We have already exited the read-side of rcu critical section
> +		 * before calling do_shrink_slab(), the shrinker_info may be
> +		 * released in expand_one_shrinker_info(), so reacquire the
> +		 * shrinker_info.
> +		 */
> +		index++;
> +		goto again;

With that, what makes the use of shrinker_info in
xchg_nr_deferred_memcg() in do_shrink_slab() coherent and valid?

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
