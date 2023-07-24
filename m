Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1C975F5FF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 14:18:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNuW0-0002lU-EY;
	Mon, 24 Jul 2023 12:18:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qNuVz-0002lL-A9
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 12:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RDXDydZCMBYMIrczKDE4bVsTDeQMx3KqkW665iu8SKc=; b=TkoTk6ghnTEbmZgzav+wv2GDWW
 yQmEoSyefT30fURu6GWO4e6CGwMb4d7vuHj9CHTD0O1ujLTlJPrhbQkB4SD4Eg6bJfo1V5vo76Jvh
 WunxjWNgkSWE0H3fllDi3L1l7nzY6RcYepnL50ZIcVg0LhcbCC/AX9CN2SIU8U0k2wLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RDXDydZCMBYMIrczKDE4bVsTDeQMx3KqkW665iu8SKc=; b=abTYVmdYd8giqlhhI0dSvTgzTp
 JHVVB7rSIf3EXQSN1gKzMleJiqGFWfdRHwW+bihARbOmfhUP4CMC254InssEJF3ECiQ6mR63xHFzn
 wDzEzrIYOrGJhTvLWWVVhzdcay+NdXH65Xj0IqibFfchKtS2Dap1l/RK24fkX14M6aK0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qNuVn-0000wu-KO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 12:18:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 397746113E;
 Mon, 24 Jul 2023 12:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7639DC433C7;
 Mon, 24 Jul 2023 12:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690201076;
 bh=SgqvEHTSsoLx88OM4JQmZh6whPE6BGZ/uEOL9QxuZhc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=HeauOjdE48WDStWMcmbZe0QJCu1PZbrw2jnOfPPp5Y0n0Q1TK60SYgINluh0tVUHu
 HMa9pGy9YrA2Xid5ZQCkD41aahatrfHq9vVHLjbuzLzQBP/bIUW5s/kQBvStLkPbEr
 52wVvvm4TuW1EIIyQppWxFYEv7SoUq895jOWh1zWA+5Bhuu0CwPKUfnKQ6aPaR+FNu
 w4bgci3LfqcgT2vztkyr4DzF2/4Hyf1LGlp6Z0shJe1d8GJLzPQbDhc3dh09sCIq3l
 N9zzfqaN5HsWy8Vmt4P1E7EQFqQrkFrxcJ7/1W6yEYc3GiEERam+zZN0XSQm/ELIIc
 3urjqaifuO8iw==
Message-ID: <d79d3ef43b3a61be99e53a77fa9eb19af7fc550f.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org, 
 david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, 
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org, 
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 08:17:52 -0400
In-Reply-To: <20230724094354.90817-36-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-36-zhengqi.arch@bytedance.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2023-07-24 at 17:43 +0800,
 Qi Zheng wrote: > In preparation
 for implementing lockless slab shrink, use new APIs to > dynamically allocate
 the nfsd-reply shrinker, so that it can be freed > asy [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qNuVn-0000wu-KO
Subject: Re: [f2fs-dev] [PATCH v2 35/47] nfsd: dynamically allocate the
 nfsd-reply shrinker
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
 linux-xfs@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2023-07-24 at 17:43 +0800, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the nfsd-reply shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct nfsd_net.
> 
> Acked-by: Chuck Lever <chuck.lever@oracle.com>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>  fs/nfsd/netns.h    |  2 +-
>  fs/nfsd/nfscache.c | 31 ++++++++++++++++---------------
>  2 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/nfsd/netns.h b/fs/nfsd/netns.h
> index f669444d5336..ab303a8b77d5 100644
> --- a/fs/nfsd/netns.h
> +++ b/fs/nfsd/netns.h
> @@ -177,7 +177,7 @@ struct nfsd_net {
>  	/* size of cache when we saw the longest hash chain */
>  	unsigned int             longest_chain_cachesize;
>  
> -	struct shrinker		nfsd_reply_cache_shrinker;
> +	struct shrinker		*nfsd_reply_cache_shrinker;
>  
>  	/* tracking server-to-server copy mounts */
>  	spinlock_t              nfsd_ssc_lock;
> diff --git a/fs/nfsd/nfscache.c b/fs/nfsd/nfscache.c
> index 6eb3d7bdfaf3..9f0ab65e4125 100644
> --- a/fs/nfsd/nfscache.c
> +++ b/fs/nfsd/nfscache.c
> @@ -200,26 +200,29 @@ int nfsd_reply_cache_init(struct nfsd_net *nn)
>  {
>  	unsigned int hashsize;
>  	unsigned int i;
> -	int status = 0;
>  
>  	nn->max_drc_entries = nfsd_cache_size_limit();
>  	atomic_set(&nn->num_drc_entries, 0);
>  	hashsize = nfsd_hashsize(nn->max_drc_entries);
>  	nn->maskbits = ilog2(hashsize);
>  
> -	nn->nfsd_reply_cache_shrinker.scan_objects = nfsd_reply_cache_scan;
> -	nn->nfsd_reply_cache_shrinker.count_objects = nfsd_reply_cache_count;
> -	nn->nfsd_reply_cache_shrinker.seeks = 1;
> -	status = register_shrinker(&nn->nfsd_reply_cache_shrinker,
> -				   "nfsd-reply:%s", nn->nfsd_name);
> -	if (status)
> -		return status;
> -
>  	nn->drc_hashtbl = kvzalloc(array_size(hashsize,
>  				sizeof(*nn->drc_hashtbl)), GFP_KERNEL);
>  	if (!nn->drc_hashtbl)
> +		return -ENOMEM;
> +
> +	nn->nfsd_reply_cache_shrinker = shrinker_alloc(0, "nfsd-reply:%s",
> +						       nn->nfsd_name);
> +	if (!nn->nfsd_reply_cache_shrinker)
>  		goto out_shrinker;
>  
> +	nn->nfsd_reply_cache_shrinker->scan_objects = nfsd_reply_cache_scan;
> +	nn->nfsd_reply_cache_shrinker->count_objects = nfsd_reply_cache_count;
> +	nn->nfsd_reply_cache_shrinker->seeks = 1;
> +	nn->nfsd_reply_cache_shrinker->private_data = nn;
> +
> +	shrinker_register(nn->nfsd_reply_cache_shrinker);
> +
>  	for (i = 0; i < hashsize; i++) {
>  		INIT_LIST_HEAD(&nn->drc_hashtbl[i].lru_head);
>  		spin_lock_init(&nn->drc_hashtbl[i].cache_lock);
> @@ -228,7 +231,7 @@ int nfsd_reply_cache_init(struct nfsd_net *nn)
>  
>  	return 0;
>  out_shrinker:
> -	unregister_shrinker(&nn->nfsd_reply_cache_shrinker);
> +	kvfree(nn->drc_hashtbl);
>  	printk(KERN_ERR "nfsd: failed to allocate reply cache\n");
>  	return -ENOMEM;
>  }
> @@ -238,7 +241,7 @@ void nfsd_reply_cache_shutdown(struct nfsd_net *nn)
>  	struct nfsd_cacherep *rp;
>  	unsigned int i;
>  
> -	unregister_shrinker(&nn->nfsd_reply_cache_shrinker);
> +	shrinker_unregister(nn->nfsd_reply_cache_shrinker);
>  
>  	for (i = 0; i < nn->drc_hashsize; i++) {
>  		struct list_head *head = &nn->drc_hashtbl[i].lru_head;
> @@ -322,8 +325,7 @@ nfsd_prune_bucket_locked(struct nfsd_net *nn, struct nfsd_drc_bucket *b,
>  static unsigned long
>  nfsd_reply_cache_count(struct shrinker *shrink, struct shrink_control *sc)
>  {
> -	struct nfsd_net *nn = container_of(shrink,
> -				struct nfsd_net, nfsd_reply_cache_shrinker);
> +	struct nfsd_net *nn = shrink->private_data;
>  
>  	return atomic_read(&nn->num_drc_entries);
>  }
> @@ -342,8 +344,7 @@ nfsd_reply_cache_count(struct shrinker *shrink, struct shrink_control *sc)
>  static unsigned long
>  nfsd_reply_cache_scan(struct shrinker *shrink, struct shrink_control *sc)
>  {
> -	struct nfsd_net *nn = container_of(shrink,
> -				struct nfsd_net, nfsd_reply_cache_shrinker);
> +	struct nfsd_net *nn = shrink->private_data;
>  	unsigned long freed = 0;
>  	LIST_HEAD(dispose);
>  	unsigned int i;

Acked-by: Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
