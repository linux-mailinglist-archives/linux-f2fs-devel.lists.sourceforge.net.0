Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17310764EB4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 11:09:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOwzm-0004GH-MZ;
	Thu, 27 Jul 2023 09:09:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOwzk-0004G8-Dh
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 09:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4HPzHhawuqBHwf73jZH4M+rJ1h4rzhX4x1A5fzulUtE=; b=VVgRgAQQ7wbzuDy7cqFzwQ7ZAZ
 UEcrJ0QFlPTBoUzzBIup9NQcKabsAzc2qfSZSZf64Vp35G9gJqVOyxnrbaMsr9ipYDJ/75+n125ys
 rjd173XsEd5APdjkBEHL81L6TPdx+glT/CHMXfWVrccyBX6lMnwqyvy/pPpEYIAzcqhg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4HPzHhawuqBHwf73jZH4M+rJ1h4rzhX4x1A5fzulUtE=; b=c9Zm1bKfmkdsaQrEISSlkUOUBH
 Os1aWAOi9Dz0vrwOJpxtcHb3CsZHfiw4Duw/Aq0dW8lXS3WEkhrvLQnt5waFIm/vk1bO3SyNP1J8c
 790miE73AKTZGuHXWe61/E02edOX2kY04HiEPD20Zyg3qK80Gjo5g4Bx0+hfK0sl+sKA=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOwzf-004PQk-AY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 09:09:15 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-66d6a9851f3so176807b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jul 2023 02:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690448946; x=1691053746;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4HPzHhawuqBHwf73jZH4M+rJ1h4rzhX4x1A5fzulUtE=;
 b=XVbZZB1bCuIddvCOd7ZdoZjiMRRT7dPd70cLEHChe028013CtZN4CJhyjaofMQGOCp
 aGQjkAdZJwrw0kO7FWCF+3wJu4Bs3hfpCHjXHte7v9cy4EJx3v2HSegV5fKDUggsvKcE
 rfw3ctmBIqNX3YVyLliz70Ow03c79YTqviRSUBhyV37ISoYoH05fZe12pteMem3zIYaK
 h5yTEuui+F8UDLetCnDn4Wd0BNAlUwOjTRf0Uzpr8uRBgvycDrHuoECz5/KoSjtrxNcd
 VFQA9eIykS0N+Aj/4rgCWZN2Q01gf7n56+E22JNqNX6qv8VxHS7PwBWWAHU3NZ4I85Kn
 Kvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690448946; x=1691053746;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4HPzHhawuqBHwf73jZH4M+rJ1h4rzhX4x1A5fzulUtE=;
 b=MyYntXRyiE1eswPrQCA8eba3ecIhgFYBkrXWVtuIbpQkkPvojqCjiyyM18cL2Jazyb
 UOl/WkAJ+U63juaeW4IH6K6VYWBMKeaRz+L3/md8Jkk5p1WUuMLYBqM17oJ5T3XEDw9k
 Tz+ta/kuv7xm7a+sEJq/S94F+tnd1e49I9+RukmPn04qr5vEyQzMmthYqYrc7qfOu3jd
 477hJwHqZoxEajYUJREO/X1H49olVbG22NfobsXJIy+yxw/vQhgb5SMpIYGUhY0Zfddi
 B7BL2qPD3LwHvpsYc8gdGyeBYhlXXAwXXAoRTDEBnvyDX+7tfVoXOc9z+IZgxxU3EWk9
 INWA==
X-Gm-Message-State: ABy/qLafkrUP0dwKbR57ICKLv5UvkpPKfgYJzw0FRTktjri/+w6yPGoq
 e570USUKI61wz3dlJiGmiznZuA==
X-Google-Smtp-Source: APBJJlGcM2GBnp4i4GpCfKYembVJdmGwthtzp39QltAoTiMbksVAbVCn2LuGL8UI/2xPGfcHp3vTrQ==
X-Received: by 2002:a05:6a20:1595:b0:137:30db:bc1e with SMTP id
 h21-20020a056a20159500b0013730dbbc1emr5836590pzj.3.1690448945731; 
 Thu, 27 Jul 2023 02:09:05 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a635551000000b00563ea47c948sm930669pgm.53.2023.07.27.02.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 02:09:05 -0700 (PDT)
Message-ID: <8951e9da-15ae-f05e-a9a4-a9354249cee2@bytedance.com>
Date: Thu, 27 Jul 2023 17:08:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: en-US
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-17-zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-17-zhengqi.arch@bytedance.com>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/27 16:04,
 Qi Zheng wrote: > Use new APIs to dynamically
 allocate the nfsd-filecache shrinker. > > Signed-off-by: Qi Zheng
 <zhengqi.arch@bytedance.com>
 > Reviewed-by: Muchun Song <songmuchun@ [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.169 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qOwzf-004PQk-AY
Subject: Re: [f2fs-dev] [PATCH v3 16/49] nfsd: dynamically allocate the
 nfsd-filecache shrinker
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2023/7/27 16:04, Qi Zheng wrote:
> Use new APIs to dynamically allocate the nfsd-filecache shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   fs/nfsd/filecache.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
> index ee9c923192e0..872eb9501965 100644
> --- a/fs/nfsd/filecache.c
> +++ b/fs/nfsd/filecache.c
> @@ -521,11 +521,7 @@ nfsd_file_lru_scan(struct shrinker *s, struct shrink_control *sc)
>   	return ret;
>   }
>   
> -static struct shrinker	nfsd_file_shrinker = {
> -	.scan_objects = nfsd_file_lru_scan,
> -	.count_objects = nfsd_file_lru_count,
> -	.seeks = 1,
> -};
> +static struct shrinker *nfsd_file_shrinker;
>   
>   /**
>    * nfsd_file_cond_queue - conditionally unhash and queue a nfsd_file
> @@ -746,12 +742,18 @@ nfsd_file_cache_init(void)
>   		goto out_err;
>   	}
>   
> -	ret = register_shrinker(&nfsd_file_shrinker, "nfsd-filecache");
> -	if (ret) {
> -		pr_err("nfsd: failed to register nfsd_file_shrinker: %d\n", ret);
> +	nfsd_file_shrinker = shrinker_alloc(0, "nfsd-filecache");
> +	if (!nfsd_file_shrinker) {

Here should set ret to -ENOMEM, will fix.

> +		pr_err("nfsd: failed to allocate nfsd_file_shrinker\n");
>   		goto out_lru;
>   	}
>   
> +	nfsd_file_shrinker->count_objects = nfsd_file_lru_count;
> +	nfsd_file_shrinker->scan_objects = nfsd_file_lru_scan;
> +	nfsd_file_shrinker->seeks = 1;
> +
> +	shrinker_register(nfsd_file_shrinker);
> +
>   	ret = lease_register_notifier(&nfsd_file_lease_notifier);
>   	if (ret) {
>   		pr_err("nfsd: unable to register lease notifier: %d\n", ret);
> @@ -774,7 +776,7 @@ nfsd_file_cache_init(void)
>   out_notifier:
>   	lease_unregister_notifier(&nfsd_file_lease_notifier);
>   out_shrinker:
> -	unregister_shrinker(&nfsd_file_shrinker);
> +	shrinker_free(nfsd_file_shrinker);
>   out_lru:
>   	list_lru_destroy(&nfsd_file_lru);
>   out_err:
> @@ -891,7 +893,7 @@ nfsd_file_cache_shutdown(void)
>   		return;
>   
>   	lease_unregister_notifier(&nfsd_file_lease_notifier);
> -	unregister_shrinker(&nfsd_file_shrinker);
> +	shrinker_free(nfsd_file_shrinker);
>   	/*
>   	 * make sure all callers of nfsd_file_lru_cb are done before
>   	 * calling nfsd_file_cache_purge


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
