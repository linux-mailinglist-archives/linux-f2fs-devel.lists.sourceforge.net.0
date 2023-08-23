Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29643784EFC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Aug 2023 05:00:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qYe6B-0006Q8-Kz;
	Wed, 23 Aug 2023 02:59:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qYe6A-0006Q1-24
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Aug 2023 02:59:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Cc:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bhgEqLuvf9ApSnTvUwn1L76c2o2W1Ei/QD6yE6yt7Vo=; b=B9CkhU37whvgEQZJ1jRHYb4e2F
 cysbN89Im2X9EEHMp5UOqFoDOMwpoC0EEhao/TJsj+p5tK+LOSp5jYIpJrSnZbeceGrBG/rYxwsyw
 afoRc7TYlpbb5ieRBFTyN2db83QYUoxv2p5PDQtdd1bTDmolTNUbSIrGJXC34C6QIT8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Cc:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bhgEqLuvf9ApSnTvUwn1L76c2o2W1Ei/QD6yE6yt7Vo=; b=GJ/GCFxONpW+b94yydamd4kk2T
 riM3oGoYekBV/qaGtAK2TiAlcEx2NPMP4eT6VXBUfhd8YMtwBC6ma4OW877JWD3iiqZvkAZ/+0FIx
 QcUTJL3Tj8l67UkjQxXOi/rAwoh9yH3RO4YxJvQv5HCoWY50k3xgluyLUktK4vcB5mZU=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYe66-00Covp-8h for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Aug 2023 02:59:57 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1befe39630bso9174885ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Aug 2023 19:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1692759588; x=1693364388;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bhgEqLuvf9ApSnTvUwn1L76c2o2W1Ei/QD6yE6yt7Vo=;
 b=RzbIwpF/0rWWCHIbil/kmvbYsiH+zzV8cteo0NeX4iqS5Th3aMObOrBBZ5QIYYiYNO
 EzLvxXnwaU3C6HJ66DVx0SYeH6DBUUXE/parOT0tZRTGaLZHY6BYCVv0BWvKsae2+Z4V
 HEkSBtQA++hJt6hjIX8coUzQJXYdSMU0EhPZnC3wJk9rsU5aMcdQM2J2gdrxRnnAl7ZG
 8NIlks8SUC7HZyd+TSNVs6GUNYerNVLSzTLDuAq02G7Vh6n7NQtQV5W2S/tTxnIxqdnK
 Yk0AUrfOj+V8sxulrYV9L4sfBNDgKCkzUecP9KTfiIS3EGmzpdtRXoZ4mpHHvApm3vtv
 04iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692759588; x=1693364388;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bhgEqLuvf9ApSnTvUwn1L76c2o2W1Ei/QD6yE6yt7Vo=;
 b=QdRlzJtHOgg/9S/CS6XYoMrwC/piAZRWHD91zAnGyglUDRe2BrWgEhUPYJOMqACHHs
 g3YzMKAeXq/EDcAmkdCpz0Z5WyN4y70e/HpwLUxvRvM4d/fTI1j04eOeSFUCJIr1DVs0
 sA/eFxMLm90LhgGRjb1NVK0OPrPz9ZK3X2AWgC6dAt+EqEoeoycdvqWEfuOmTfwYBBhX
 qMBS1+ssslo3CCcWnc8vO7qs0XGHJwBT9qnjd7LMUbPG+5qhGeVZfWr36pYpCxho4Gr7
 HULXUVVE0l5qb/RTCBVEtM7oNzvrlLItF+CfV5U+7sA/bguLYUcDZ1CjKPANplqqHvET
 Mt1A==
X-Gm-Message-State: AOJu0YxtStc+YVucYXI+LSJRtnoAXqDaDoRhH5OleE6h0rEH/dG078ro
 c6UTbvjntgfrhFzSBL5ZZLSr3g==
X-Google-Smtp-Source: AGHT+IEfrTZGJtg+pRH2EfLUkWhGiT4SJbELosEEcEbXeeoUMWHqtsVXqJsCto+j1ri8qfTaL4v/sQ==
X-Received: by 2002:a17:90a:2f41:b0:26d:4ade:fcf0 with SMTP id
 s59-20020a17090a2f4100b0026d4adefcf0mr10521410pjd.4.1692759588304; 
 Tue, 22 Aug 2023 19:59:48 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1c25:884:3ed:e1db:b610?
 ([2408:8000:b001:1:1f:58ff:f102:103])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a17090a1fc200b00262ca945cecsm11045048pjz.54.2023.08.22.19.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 19:59:47 -0700 (PDT)
Message-ID: <63dc1d86-2a15-6b7e-f63a-63fccb25eae2@bytedance.com>
Date: Wed, 23 Aug 2023 10:59:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Content-Language: en-US
To: daniel@ffwll.ch
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-44-zhengqi.arch@bytedance.com>
 <ZOS+g51Yx9PsYkGU@phenom.ffwll.local>
In-Reply-To: <ZOS+g51Yx9PsYkGU@phenom.ffwll.local>
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daniel, On 2023/8/22 21:56, Daniel Vetter wrote: > On Mon,
 Aug 07, 2023 at 07:09:31PM +0800, Qi Zheng wrote: >> Currently,
 the synchronize_shrinkers()
 is only used by TTM pool. It only >> requires that no shr [...] 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.8 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qYe66-00Covp-8h
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
From: Qi Zheng via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Zheng <zhengqi.arch@bytedance.com>
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
 daniel.vetter@ffwll.ch, muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Daniel,

On 2023/8/22 21:56, Daniel Vetter wrote:
> On Mon, Aug 07, 2023 at 07:09:31PM +0800, Qi Zheng wrote:
>> Currently, the synchronize_shrinkers() is only used by TTM pool. It only
>> requires that no shrinkers run in parallel.
>>
>> After we use RCU+refcount method to implement the lockless slab shrink,
>> we can not use shrinker_rwsem or synchronize_rcu() to guarantee that all
>> shrinker invocations have seen an update before freeing memory.
>>
>> So we introduce a new pool_shrink_rwsem to implement a private
>> synchronize_shrinkers(), so as to achieve the same purpose.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> 
> On the 5 drm patches (I counted 2 ttm and 3 drivers) for merging through
> some other tree (since I'm assuming that's how this will land):

Yeah, there are 5 drm patches: PATCH v4 07/48 23/48 24/48 25/48 43/48.

> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks for your review!

Qi

> 
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 15 +++++++++++++++
>>   include/linux/shrinker.h       |  2 --
>>   mm/shrinker.c                  | 15 ---------------
>>   3 files changed, 15 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>> index c9c9618c0dce..38b4c280725c 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -74,6 +74,7 @@ static struct ttm_pool_type global_dma32_uncached[MAX_ORDER + 1];
>>   static spinlock_t shrinker_lock;
>>   static struct list_head shrinker_list;
>>   static struct shrinker *mm_shrinker;
>> +static DECLARE_RWSEM(pool_shrink_rwsem);
>>   
>>   /* Allocate pages of size 1 << order with the given gfp_flags */
>>   static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>> @@ -317,6 +318,7 @@ static unsigned int ttm_pool_shrink(void)
>>   	unsigned int num_pages;
>>   	struct page *p;
>>   
>> +	down_read(&pool_shrink_rwsem);
>>   	spin_lock(&shrinker_lock);
>>   	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
>>   	list_move_tail(&pt->shrinker_list, &shrinker_list);
>> @@ -329,6 +331,7 @@ static unsigned int ttm_pool_shrink(void)
>>   	} else {
>>   		num_pages = 0;
>>   	}
>> +	up_read(&pool_shrink_rwsem);
>>   
>>   	return num_pages;
>>   }
>> @@ -572,6 +575,18 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>   }
>>   EXPORT_SYMBOL(ttm_pool_init);
>>   
>> +/**
>> + * synchronize_shrinkers - Wait for all running shrinkers to complete.
>> + *
>> + * This is useful to guarantee that all shrinker invocations have seen an
>> + * update, before freeing memory, similar to rcu.
>> + */
>> +static void synchronize_shrinkers(void)
>> +{
>> +	down_write(&pool_shrink_rwsem);
>> +	up_write(&pool_shrink_rwsem);
>> +}
>> +
>>   /**
>>    * ttm_pool_fini - Cleanup a pool
>>    *
>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>> index c55c07c3f0cb..025c8070dd86 100644
>> --- a/include/linux/shrinker.h
>> +++ b/include/linux/shrinker.h
>> @@ -103,8 +103,6 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
>>   void shrinker_register(struct shrinker *shrinker);
>>   void shrinker_free(struct shrinker *shrinker);
>>   
>> -extern void synchronize_shrinkers(void);
>> -
>>   #ifdef CONFIG_SHRINKER_DEBUG
>>   extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
>>   						  const char *fmt, ...);
>> diff --git a/mm/shrinker.c b/mm/shrinker.c
>> index 3ab301ff122d..a27779ed3798 100644
>> --- a/mm/shrinker.c
>> +++ b/mm/shrinker.c
>> @@ -650,18 +650,3 @@ void shrinker_free(struct shrinker *shrinker)
>>   	kfree(shrinker);
>>   }
>>   EXPORT_SYMBOL_GPL(shrinker_free);
>> -
>> -/**
>> - * synchronize_shrinkers - Wait for all running shrinkers to complete.
>> - *
>> - * This is equivalent to calling unregister_shrink() and register_shrinker(),
>> - * but atomically and with less overhead. This is useful to guarantee that all
>> - * shrinker invocations have seen an update, before freeing memory, similar to
>> - * rcu.
>> - */
>> -void synchronize_shrinkers(void)
>> -{
>> -	down_write(&shrinker_rwsem);
>> -	up_write(&shrinker_rwsem);
>> -}
>> -EXPORT_SYMBOL(synchronize_shrinkers);
>> -- 
>> 2.30.2
>>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
