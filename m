Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9AB760649
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jul 2023 05:05:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qO8Mn-0003MD-UL;
	Tue, 25 Jul 2023 03:05:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qO8Me-0003Lj-55
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jul 2023 03:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=niSMZqBCvW/Me9jsMaxXz5gtuZ44llk1Ot3soT0LhIs=; b=i9dmBjONRklN12I532rPdjCK07
 WJ1XPk1T1NQQzjN3gLpsnlboFP6yp+fUxSH951qhaBe2gd9+kxhZLOuf+kbaRSWs1PXwbPFEf09Hb
 mLjRh18b6KIQ+ZPAqinDd2+s+lL7FLSKe2Mx0+2iDOffoTqhh3NBuSSKHBVlFdkyp5EY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=niSMZqBCvW/Me9jsMaxXz5gtuZ44llk1Ot3soT0LhIs=; b=Ty0hkY4wsSB/jjOLbR+Yi0k5i1
 YaD9yvT5w3PtIw5ktk7eXVo3vR1u2PLsAXmKIdO/JpLpPOZpbhBpZ+yVhz75KKNw39rqHbyhax3N+
 HNvIaCh8G7OzdRFobCaXMRV6wWqiy2qtqsgeRPgosDaM01byaknsth+QoMAPxz/SjnYc=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qO8Mc-0000ap-BH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jul 2023 03:05:30 +0000
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6864c144897so1189007b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 20:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690254325; x=1690859125;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=niSMZqBCvW/Me9jsMaxXz5gtuZ44llk1Ot3soT0LhIs=;
 b=FniJo6cfZiXO48N3LrJPbrRtsXuGwEsrxL+rPNcNzpIfBU8e0vwfaKRVcngIxQ6/Nq
 uV6IwXjWItzg/7IWT04hxNl0ft8u0yvH7EyRJ6POcXsP6dFyjR2vvuievKT7V7wXKj9i
 Hs4OFXg82m4uyRZZDGIHYrUPf7Daiin7owJFDMH9ALFzGhGiMR/jo54iE9PQ2yCszEax
 GduXKZlfrLf0f1lI69b+SeFKsM1fBAPgAwEi9/QiPJB5pr3rcwSAawR7U6Bt6cbBHX1B
 l+6jljnScvspLgnoIuyzCCNBX+9PGgFUwcZiZbmROS7agCNCVVXov8LOv0CsZfjvTopq
 9j6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690254325; x=1690859125;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=niSMZqBCvW/Me9jsMaxXz5gtuZ44llk1Ot3soT0LhIs=;
 b=VUd9VU3CtJzPHBkmDFQB3CeJYUmfT+wjHDrxq3wYdaO1/trqqp7j95iApHASAWo0ux
 ogsP/fMDFGXl9MXbmIIpxE5yP2YcMYjoljpunkAl641wvr2dQGd+JXhLhHiOxbJr3CZ0
 Lp1luzAUMf/jeaVUVwEcmaqUTGm32rtNW9Dsfq5cKQAsq5ZblwM7uB/UBIxSUdLbAQSK
 6z0hK19kd0l8/60xSOy3GOFchtQc893OgV4FR6OA3NDt0QNb7loAmnpdGnvqv4W8k+CR
 6BuI6AOrDHvAdo7fi/cluSLm+SdsMt5kMwIk7nDHv4A4XbdEKIUhKGX79AaatzxBog3W
 4adA==
X-Gm-Message-State: ABy/qLYO6cObBGQdWW1P/c+wcHqkyydEi4Bnl3aiQ+lZxnCRhQH43b/s
 uGCjspvRUv0QUhUy7EF9Fo8VXA==
X-Google-Smtp-Source: APBJJlFB/cQTGj3IlIfGF+HAM8hU50IJB+Lr29ujA3cHbbDSAB3N90HdGCOpa8iydTeMw+f8qxyL2Q==
X-Received: by 2002:a17:90a:1d46:b0:268:abc:83d5 with SMTP id
 u6-20020a17090a1d4600b002680abc83d5mr6012554pju.4.1690254324674; 
 Mon, 24 Jul 2023 20:05:24 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1c25:884:3ed:e1db:b610?
 ([2408:8000:b001:1:1f:58ff:f102:103])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a17090aba8a00b002681d44071csm2043968pjr.46.2023.07.24.20.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 20:05:24 -0700 (PDT)
Message-ID: <6049aa99-aa47-5137-f66e-350bc4723914@bytedance.com>
Date: Tue, 25 Jul 2023 11:05:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: en-US
To: Steven Price <steven.price@arm.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-25-zhengqi.arch@bytedance.com>
 <cdd08c9e-81d3-a85f-5426-5db738aa73ec@arm.com>
In-Reply-To: <cdd08c9e-81d3-a85f-5426-5db738aa73ec@arm.com>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Steven, On 2023/7/24 19:17,
 Steven Price wrote: > On 24/07/2023
 10:43, Qi Zheng wrote: >> In preparation for implementing lockless slab shrink,
 use new APIs to >> dynamically allocate the drm-panfrost shrinke [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.176 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qO8Mc-0000ap-BH
Subject: Re: [f2fs-dev] [PATCH v2 24/47] drm/panfrost: dynamically allocate
 the drm-panfrost shrinker
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
 x86@kernel.org, cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, paulmck@kernel.org, linux-arm-msm@vger.kernel.org,
 brauner@kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 yujie.liu@intel.com, vbabka@suse.cz, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, tytso@mit.edu, netdev@vger.kernel.org,
 muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Steven,

On 2023/7/24 19:17, Steven Price wrote:
> On 24/07/2023 10:43, Qi Zheng wrote:
>> In preparation for implementing lockless slab shrink, use new APIs to
>> dynamically allocate the drm-panfrost shrinker, so that it can be freed
>> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
>> read-side critical section when releasing the struct panfrost_device.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> One nit below, but otherwise:
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
>>   drivers/gpu/drm/panfrost/panfrost_drv.c       |  6 +++-
>>   drivers/gpu/drm/panfrost/panfrost_gem.h       |  2 +-
>>   .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 32 ++++++++++++-------
>>   4 files changed, 27 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>> index b0126b9fbadc..e667e5689353 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>> @@ -118,7 +118,7 @@ struct panfrost_device {
>>   
>>   	struct mutex shrinker_lock;
>>   	struct list_head shrinker_list;
>> -	struct shrinker shrinker;
>> +	struct shrinker *shrinker;
>>   
>>   	struct panfrost_devfreq pfdevfreq;
>>   };
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> index bbada731bbbd..f705bbdea360 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> @@ -598,10 +598,14 @@ static int panfrost_probe(struct platform_device *pdev)
>>   	if (err < 0)
>>   		goto err_out1;
>>   
>> -	panfrost_gem_shrinker_init(ddev);
>> +	err = panfrost_gem_shrinker_init(ddev);
>> +	if (err)
>> +		goto err_out2;
>>   
>>   	return 0;
>>   
>> +err_out2:
>> +	drm_dev_unregister(ddev);
>>   err_out1:
>>   	pm_runtime_disable(pfdev->dev);
>>   	panfrost_device_fini(pfdev);
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
>> index ad2877eeeccd..863d2ec8d4f0 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
>> @@ -81,7 +81,7 @@ panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
>>   void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping);
>>   void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
>>   
>> -void panfrost_gem_shrinker_init(struct drm_device *dev);
>> +int panfrost_gem_shrinker_init(struct drm_device *dev);
>>   void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
>>   
>>   #endif /* __PANFROST_GEM_H__ */
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
>> index bf0170782f25..9a90dfb5301f 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
>> @@ -18,8 +18,7 @@
>>   static unsigned long
>>   panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
>>   {
>> -	struct panfrost_device *pfdev =
>> -		container_of(shrinker, struct panfrost_device, shrinker);
>> +	struct panfrost_device *pfdev = shrinker->private_data;
>>   	struct drm_gem_shmem_object *shmem;
>>   	unsigned long count = 0;
>>   
>> @@ -65,8 +64,7 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
>>   static unsigned long
>>   panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>>   {
>> -	struct panfrost_device *pfdev =
>> -		container_of(shrinker, struct panfrost_device, shrinker);
>> +	struct panfrost_device *pfdev = shrinker->private_data;
>>   	struct drm_gem_shmem_object *shmem, *tmp;
>>   	unsigned long freed = 0;
>>   
>> @@ -97,13 +95,24 @@ panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>>    *
>>    * This function registers and sets up the panfrost shrinker.
>>    */
>> -void panfrost_gem_shrinker_init(struct drm_device *dev)
>> +int panfrost_gem_shrinker_init(struct drm_device *dev)
>>   {
>>   	struct panfrost_device *pfdev = dev->dev_private;
>> -	pfdev->shrinker.count_objects = panfrost_gem_shrinker_count;
>> -	pfdev->shrinker.scan_objects = panfrost_gem_shrinker_scan;
>> -	pfdev->shrinker.seeks = DEFAULT_SEEKS;
>> -	WARN_ON(register_shrinker(&pfdev->shrinker, "drm-panfrost"));
>> +
>> +	pfdev->shrinker = shrinker_alloc(0, "drm-panfrost");
>> +	if (!pfdev->shrinker) {
>> +		WARN_ON(1);
> 
> I don't think this WARN_ON is particularly useful - if there's a failed
> memory allocation we should see output from the kernel anyway. And we're
> changing the semantics from "continue just without a shrinker" (which
> argueably justifies the warning) to "probe fails, device doesn't work"
> which will be obvious to the user so I don't feel we need the additional
> warn.

Make sense. Will delete this WARN_ON() in the next version.

Thanks,
Qi

> 
>> +		return -ENOMEM;
>> +	}
>> +
>> +	pfdev->shrinker->count_objects = panfrost_gem_shrinker_count;
>> +	pfdev->shrinker->scan_objects = panfrost_gem_shrinker_scan;
>> +	pfdev->shrinker->seeks = DEFAULT_SEEKS;
>> +	pfdev->shrinker->private_data = pfdev;
>> +
>> +	shrinker_register(pfdev->shrinker);
>> +
>> +	return 0;
>>   }
>>   
>>   /**
>> @@ -116,7 +125,6 @@ void panfrost_gem_shrinker_cleanup(struct drm_device *dev)
>>   {
>>   	struct panfrost_device *pfdev = dev->dev_private;
>>   
>> -	if (pfdev->shrinker.nr_deferred) {
>> -		unregister_shrinker(&pfdev->shrinker);
>> -	}
>> +	if (pfdev->shrinker)
>> +		shrinker_unregister(pfdev->shrinker);
>>   }
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
