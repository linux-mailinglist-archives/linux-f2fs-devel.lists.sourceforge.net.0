Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C54764EF7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 11:13:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOx3s-0004XZ-0e;
	Thu, 27 Jul 2023 09:13:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOx3q-0004XN-9j
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 09:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ab3i02uMNDVjAVrJgavtDQnv7B+TbSMr9u4LPtdCXIk=; b=PlpWFCEdVBenAe/giM0tovH3rm
 KqmSzkjksEET/A/ptt5GHXdqacD5QiQAMFtClkKHsmVFoulG6qID0KIP+3Q0F2GGxHL6yAAJqVdVo
 r3eTLnBKj/uzqLoyPw2/7iu/ILV8KAfzTrDNPPNZYa+32UVtFvRzZ0fQaIYYaGtV7blg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ab3i02uMNDVjAVrJgavtDQnv7B+TbSMr9u4LPtdCXIk=; b=d+PXtAJrxEhJ+suKpRdflsu3x9
 YBAaSQbwVf9CMDv9HhH6OA1/cYt3VVToJWQYckvNkC67wPCRc2ZWVmBk7cJzNq6iutCwGt7yDP6yH
 GKdzfkhNhMPB5mDjR2DjfD6FumBDzY9WluTNWubxgIJ3ydP/4wo+6Z22teZhajyEEQuY=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOx3n-0007nv-8G for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 09:13:29 +0000
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-6862d4a1376so201868b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jul 2023 02:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690449201; x=1691054001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ab3i02uMNDVjAVrJgavtDQnv7B+TbSMr9u4LPtdCXIk=;
 b=DcofMrRnwJynNkdGxtjH9DqKXau2yqZGatjPtAtzn+O56nMmwXuVd7ToeAQUojKhyr
 PVIHt52Ove4HfRkW5Jz6nWPZD9BmVLc7SbBBPIeMe8wFyfKaQIk+EbU0k3nRPfOKNwBh
 oCNv2ZD1HFVJTkxvMKWyxXL9Onk9dGrGolbp1H25aJz81J4GYNUwPghcXVGUuE5zAHUa
 mP22aBPwBQ4pP/D5mY0ghxG8TnuQLNORwYORdeX0ZvQJ20+Z3LaIninEXnknTqruUQCo
 Za3jxS8cFIItCGBaY6f3hGkZx+gttPFDrR9vIxhOGVxid7Al6RP9znkmq9WOz9AcYgeV
 IdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690449201; x=1691054001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ab3i02uMNDVjAVrJgavtDQnv7B+TbSMr9u4LPtdCXIk=;
 b=BM/dBNz28DYiPCSu9dqE/fV0Xlyx/J+DU6rzTe8j9y2rinAx8a6s0SvKVPvGORCswi
 BWFBk5r4FB0d9MXBEx5wfy+9k93vB4W00RuhhqcsWBYIB7G6De5L8ClSvWNsYehzpbi8
 zfXZ5GTP7tJ7C5ZCqxM31xpX4e9PrjqPQLjQDIT6CbUcPxVjZ6afzSoOEUoFWYpThLmM
 TgjMJ9iHoTILrsJVLR/doLVL586hwJO1T4z7zrf5DGwMcUjEIfIiOzzeioRzx+RTEgbd
 Ac5x+j5YL/4Ub7O5UCq+BgabkSLweJG/4jhYAwFgnT62k1VoO4Rp0am1zXgYyUN+C8ja
 F7ng==
X-Gm-Message-State: ABy/qLZGN9bqpPAalpiH+tgRR8w0DCZTLBUqWn8e6sL20A4MzYyTtme/
 ymojmH4wT2qUXJRlF3YjOzpC/os8UswEwjb/y+0=
X-Google-Smtp-Source: APBJJlGBn5Xl2QFHzxgRMihSAaLd28csKz8Em946xGdOgBfe3ljiGqu5+YaMyvDFvdIkqmZPd3zpbQ==
X-Received: by 2002:a05:6a00:4792:b0:668:834d:4bd with SMTP id
 dh18-20020a056a00479200b00668834d04bdmr4787709pfb.0.1690449201600; 
 Thu, 27 Jul 2023 02:13:21 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a056a00165a00b006687b41c4dasm1017146pfc.110.2023.07.27.02.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 02:13:21 -0700 (PDT)
Message-ID: <961f6055-a395-8490-4c22-765a30668460@bytedance.com>
Date: Thu, 27 Jul 2023 17:13:07 +0800
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
 <20230727080502.77895-28-zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-28-zhengqi.arch@bytedance.com>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/27 16:04,
 Qi Zheng wrote: > In preparation for implementing
 lockless slab shrink, use new APIs to > dynamically allocate the dm-bufio
 shrinker, so that it can be freed > asynchronously using [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.181 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qOx3n-0007nv-8G
Subject: Re: [f2fs-dev] [PATCH v3 27/49] dm: dynamically allocate the
 dm-bufio shrinker
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
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the dm-bufio shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct dm_bufio_client.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   drivers/md/dm-bufio.c | 26 +++++++++++++++-----------
>   1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
> index bc309e41d074..5a9124b83d53 100644
> --- a/drivers/md/dm-bufio.c
> +++ b/drivers/md/dm-bufio.c
> @@ -963,7 +963,7 @@ struct dm_bufio_client {
>   
>   	sector_t start;
>   
> -	struct shrinker shrinker;
> +	struct shrinker *shrinker;
>   	struct work_struct shrink_work;
>   	atomic_long_t need_shrink;
>   
> @@ -2368,7 +2368,7 @@ static unsigned long dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink
>   {
>   	struct dm_bufio_client *c;
>   
> -	c = container_of(shrink, struct dm_bufio_client, shrinker);
> +	c = shrink->private_data;
>   	atomic_long_add(sc->nr_to_scan, &c->need_shrink);
>   	queue_work(dm_bufio_wq, &c->shrink_work);
>   
> @@ -2377,7 +2377,7 @@ static unsigned long dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink
>   
>   static unsigned long dm_bufio_shrink_count(struct shrinker *shrink, struct shrink_control *sc)
>   {
> -	struct dm_bufio_client *c = container_of(shrink, struct dm_bufio_client, shrinker);
> +	struct dm_bufio_client *c = shrink->private_data;
>   	unsigned long count = cache_total(&c->cache);
>   	unsigned long retain_target = get_retain_buffers(c);
>   	unsigned long queued_for_cleanup = atomic_long_read(&c->need_shrink);
> @@ -2490,15 +2490,19 @@ struct dm_bufio_client *dm_bufio_client_create(struct block_device *bdev, unsign
>   	INIT_WORK(&c->shrink_work, shrink_work);
>   	atomic_long_set(&c->need_shrink, 0);
>   
> -	c->shrinker.count_objects = dm_bufio_shrink_count;
> -	c->shrinker.scan_objects = dm_bufio_shrink_scan;
> -	c->shrinker.seeks = 1;
> -	c->shrinker.batch = 0;
> -	r = register_shrinker(&c->shrinker, "dm-bufio:(%u:%u)",
> -			      MAJOR(bdev->bd_dev), MINOR(bdev->bd_dev));
> -	if (r)
> +	c->shrinker = shrinker_alloc(0, "dm-bufio:(%u:%u)",
> +				     MAJOR(bdev->bd_dev), MINOR(bdev->bd_dev));
> +	if (!c->shrinker)

Here should set r to -ENOMEM, will fix.

>   		goto bad;
>   
> +	c->shrinker->count_objects = dm_bufio_shrink_count;
> +	c->shrinker->scan_objects = dm_bufio_shrink_scan;
> +	c->shrinker->seeks = 1;
> +	c->shrinker->batch = 0;
> +	c->shrinker->private_data = c;
> +
> +	shrinker_register(c->shrinker);
> +
>   	mutex_lock(&dm_bufio_clients_lock);
>   	dm_bufio_client_count++;
>   	list_add(&c->client_list, &dm_bufio_all_clients);
> @@ -2537,7 +2541,7 @@ void dm_bufio_client_destroy(struct dm_bufio_client *c)
>   
>   	drop_buffers(c);
>   
> -	unregister_shrinker(&c->shrinker);
> +	shrinker_free(c->shrinker);
>   	flush_work(&c->shrink_work);
>   
>   	mutex_lock(&dm_bufio_clients_lock);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
