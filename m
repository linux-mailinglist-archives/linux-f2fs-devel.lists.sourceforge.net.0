Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2904D7843FA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Aug 2023 16:24:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qYSJG-00070R-De;
	Tue, 22 Aug 2023 14:24:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel@ffwll.ch>) id 1qYSJF-00070K-2J
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Aug 2023 14:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LXzMnEM8moHL5KfliVx5cD1lb3aAd5NGNjk14fqFYLY=; b=NywXIw8lv+X/XECebJWckN0lCm
 Efr77MfBzs8Z7QJKQN0+jQu4hAVYes1vMKUmLoT8PPhtDbRLcxvtuFOcnJpq4S07ahMJpURT3jrdZ
 ha+6y+HCuxzusfcKQev4+BdPhi56unfCKcqO4g8qwdGwZmvUNp99mC5cbEuXhHzGQ6DY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LXzMnEM8moHL5KfliVx5cD1lb3aAd5NGNjk14fqFYLY=; b=nSpaaNqFkYtYtxo4QIDGOMMprD
 AEMiVmT7o/JlXCvbB2r+/Vl7eZmbZAtQTZ9VLf92ucJAc6/LVJzrq0r42m6UBCso/4M/TDkLaY/k4
 xABoZTam+YWb6oL5IW4Fna4K/4wfLlsbnTwMFmp/os+Z3eS0L+xJSZxek/t6T1SBx0Bc=;
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYSJ9-0006cI-Tl for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Aug 2023 14:24:41 +0000
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-3fef29ce3e5so4132225e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Aug 2023 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1692714269; x=1693319069;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXzMnEM8moHL5KfliVx5cD1lb3aAd5NGNjk14fqFYLY=;
 b=E3NF4bMIvTEsabugjEa7Gzmi8XjqmkxpcIwRAOhOfFqyXGaV5ReBuparRmRk2p2toT
 lvI0Kn5ZQJP6IKObsO2FgWOJcIOG9bCboD7QIoceHiS5h8LYRhoI0FguoN1pcEBcPS5A
 hR9wgCcfVtfr1omhWnedYcApT/jIBrp0HPPEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692714269; x=1693319069;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LXzMnEM8moHL5KfliVx5cD1lb3aAd5NGNjk14fqFYLY=;
 b=LEmkgr/Iu8JoOJZL/B1nlhXjzOg7xP+sa61N1YBgzC83bV/obNmYHgIGOWNz3SH12X
 D3P5wAcWLaTFOWTaNYqbF2zxV6mzG8XWuSxFd3/j0P7IKTl9QNKijTS2Kz8y0iPpRyW4
 OQHiufPLAXBFh/MGLB/q0jrPZ+7zoZF5NFSoIKffuvpkys2BW9cyP5/GOBa9KN2IsbxJ
 NIjA0Yfm8eeFahlKKgilZW2+Q4ulkaKiSej2okXcIkwCgdTLPxCdPTAmYOFYKwbYWBB9
 9nYliCp2Y4V/MlgW4sJ5/zwbk7Wly+IfLPCXyJx0WRccVzzNxNU3vJxF9KATq+7jZ/lp
 c9NA==
X-Gm-Message-State: AOJu0Yx6C/8q/tFv4zLWerl/i9/qhGoqvqZAqrFXeJtBWrdCO7dcqeOZ
 i/C+/JRcWfMjKYxtcjR+arxBTnv/hzz+EM3s4cg=
X-Google-Smtp-Source: AGHT+IHJQrlSrCu8WgUX5s8XkdDm6/hR/jwfxds8mVBdQgFEL5tBYnuf/oIT+VMpj8Z6S8wRiH/+Kw==
X-Received: by 2002:a5d:65c5:0:b0:319:8dcf:5c10 with SMTP id
 e5-20020a5d65c5000000b003198dcf5c10mr6979657wrw.6.1692712582669; 
 Tue, 22 Aug 2023 06:56:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c210500b003fc02e8ea68sm19456835wml.13.2023.08.22.06.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 06:56:22 -0700 (PDT)
Date: Tue, 22 Aug 2023 15:56:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <ZOS+g51Yx9PsYkGU@phenom.ffwll.local>
Mail-Followup-To: Qi Zheng <zhengqi.arch@bytedance.com>,
 akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org,
 muchun.song@linux.dev, simon.horman@corigine.com,
 dlemoal@kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-44-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807110936.21819-44-zhengqi.arch@bytedance.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 07, 2023 at 07:09:31PM +0800, Qi Zheng wrote:
 > Currently, the synchronize_shrinkers() is only used by TTM pool. It only
 > requires that no shrinkers run in parallel. > > After we use RCU+ [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.45 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.45 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1qYSJ9-0006cI-Tl
Subject: Re: [f2fs-dev] [PATCH v4 43/48] drm/ttm: introduce pool_shrink_rwsem
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

On Mon, Aug 07, 2023 at 07:09:31PM +0800, Qi Zheng wrote:
> Currently, the synchronize_shrinkers() is only used by TTM pool. It only
> requires that no shrinkers run in parallel.
> 
> After we use RCU+refcount method to implement the lockless slab shrink,
> we can not use shrinker_rwsem or synchronize_rcu() to guarantee that all
> shrinker invocations have seen an update before freeing memory.
> 
> So we introduce a new pool_shrink_rwsem to implement a private
> synchronize_shrinkers(), so as to achieve the same purpose.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>

On the 5 drm patches (I counted 2 ttm and 3 drivers) for merging through
some other tree (since I'm assuming that's how this will land):

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 15 +++++++++++++++
>  include/linux/shrinker.h       |  2 --
>  mm/shrinker.c                  | 15 ---------------
>  3 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index c9c9618c0dce..38b4c280725c 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -74,6 +74,7 @@ static struct ttm_pool_type global_dma32_uncached[MAX_ORDER + 1];
>  static spinlock_t shrinker_lock;
>  static struct list_head shrinker_list;
>  static struct shrinker *mm_shrinker;
> +static DECLARE_RWSEM(pool_shrink_rwsem);
>  
>  /* Allocate pages of size 1 << order with the given gfp_flags */
>  static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> @@ -317,6 +318,7 @@ static unsigned int ttm_pool_shrink(void)
>  	unsigned int num_pages;
>  	struct page *p;
>  
> +	down_read(&pool_shrink_rwsem);
>  	spin_lock(&shrinker_lock);
>  	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
>  	list_move_tail(&pt->shrinker_list, &shrinker_list);
> @@ -329,6 +331,7 @@ static unsigned int ttm_pool_shrink(void)
>  	} else {
>  		num_pages = 0;
>  	}
> +	up_read(&pool_shrink_rwsem);
>  
>  	return num_pages;
>  }
> @@ -572,6 +575,18 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>  }
>  EXPORT_SYMBOL(ttm_pool_init);
>  
> +/**
> + * synchronize_shrinkers - Wait for all running shrinkers to complete.
> + *
> + * This is useful to guarantee that all shrinker invocations have seen an
> + * update, before freeing memory, similar to rcu.
> + */
> +static void synchronize_shrinkers(void)
> +{
> +	down_write(&pool_shrink_rwsem);
> +	up_write(&pool_shrink_rwsem);
> +}
> +
>  /**
>   * ttm_pool_fini - Cleanup a pool
>   *
> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> index c55c07c3f0cb..025c8070dd86 100644
> --- a/include/linux/shrinker.h
> +++ b/include/linux/shrinker.h
> @@ -103,8 +103,6 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
>  void shrinker_register(struct shrinker *shrinker);
>  void shrinker_free(struct shrinker *shrinker);
>  
> -extern void synchronize_shrinkers(void);
> -
>  #ifdef CONFIG_SHRINKER_DEBUG
>  extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
>  						  const char *fmt, ...);
> diff --git a/mm/shrinker.c b/mm/shrinker.c
> index 3ab301ff122d..a27779ed3798 100644
> --- a/mm/shrinker.c
> +++ b/mm/shrinker.c
> @@ -650,18 +650,3 @@ void shrinker_free(struct shrinker *shrinker)
>  	kfree(shrinker);
>  }
>  EXPORT_SYMBOL_GPL(shrinker_free);
> -
> -/**
> - * synchronize_shrinkers - Wait for all running shrinkers to complete.
> - *
> - * This is equivalent to calling unregister_shrink() and register_shrinker(),
> - * but atomically and with less overhead. This is useful to guarantee that all
> - * shrinker invocations have seen an update, before freeing memory, similar to
> - * rcu.
> - */
> -void synchronize_shrinkers(void)
> -{
> -	down_write(&shrinker_rwsem);
> -	up_write(&shrinker_rwsem);
> -}
> -EXPORT_SYMBOL(synchronize_shrinkers);
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
