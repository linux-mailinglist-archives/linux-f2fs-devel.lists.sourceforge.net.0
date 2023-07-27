Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E7C764F37
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 11:18:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOx8H-0004jt-2n;
	Thu, 27 Jul 2023 09:18:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOx8F-0004jh-AB
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 09:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zDAeke9dPI5F1DLlt143+V+9EjjOTI/Ym3kFZW9NJks=; b=LOPpb+QW+VRBv97AUfLFC5/eqI
 IaIo4RywOLQbPR9SgGk++S8BJIWfug8a6azUTPWRevZEWWgnEzhOTh54hfcDjiPoww8jag7S1LcwT
 C2QFAOCPiyXYXljg5mver8OCoR7/C7eJElJf93VUcPCRREzH/sz/nx7LeNtr1pcBjVL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zDAeke9dPI5F1DLlt143+V+9EjjOTI/Ym3kFZW9NJks=; b=BLCu0AoEUFUT59kJTyeuiHps+3
 byL80mkqe3V0u0rauCwTbYiQiquPCIHEX+muphR/fPnYiJt/zbjEzoz/C1t/FC/J0bl6JKmzyS9DW
 2bcSj8JxOFQx0TgODTlwgYCvulQZZpeyj05sb/Mf0tJjy3zX2Iol1YNwdba5tGxTyrr4=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOx8A-004Pts-I4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 09:18:02 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1bb91c20602so949125ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jul 2023 02:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690449470; x=1691054270;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zDAeke9dPI5F1DLlt143+V+9EjjOTI/Ym3kFZW9NJks=;
 b=GMz7Ro63z/YezVqKkIH1jrxAzOT75QcUy09pRQPD7AgfWuYvUeuW5VEqNC1XIv9vFN
 mRwt8c6aGV8kgK9lP5FEKupjXOG/bSxCUR1Wt+sQMg8uYMaVdTfESuVXyke/16/L/yN6
 lgXVNg46bwMvdgDL/au4WPig1MVEHeG5wVY0ujpNjiLSHIkveiLIrECL7sZMPk2KN/og
 cOXK7BC9rcgfo0JQrpwRHwvNtz6wdTJySW4bqDUFHi4zdm4Oj9K7/OLBxIv3WQBH67f1
 OvlGd9tRajLpgSW70SF8ktMkDj4Bt1BHUDLO+7r2qg+4O9VtPvpOqNWx1A6uYkZBjzBr
 UEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690449470; x=1691054270;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zDAeke9dPI5F1DLlt143+V+9EjjOTI/Ym3kFZW9NJks=;
 b=IG5WFaPvT1nb9zly5ff1EwoiHqe/pF30nIgjEAlJt1xEZZlPh8hhRTlWgxnSYKN8x6
 N0EeQzB5N2ihBL3LzOklMRdpmQ1AglOnkRopywgZZXSWECu8mTp6Jx8PAqYkaIDkvPq1
 7oSKEyVVf0iUonsi/Azt7FhUrHxHjdhGNrXdE66Q4aF3apl9loosgdsNs6TQWKHivmAy
 M4y3S/p1lr8w32/b37QmiHft6cRNPV1Q+horj8D6c+maCTW9XJx4Ool9tOPHvb+ztKe3
 ZlKYxEOdTIVbLwyal+EoHviDYz0FF7VHzGidxr1Q2lwAlELXBOHR1KG1GJTKGMPgucus
 ZWKw==
X-Gm-Message-State: ABy/qLauolsXYYohvPaIU0hpe8a/XYLB3d/ugOZ4Nnd0JFP37Ydsb3Bw
 6fDzIDynroD5M5UomJCfH6ftEQ==
X-Google-Smtp-Source: APBJJlEO2aWJnLprK4RcTuXXptsAhhV2CWniExK2SV0FTWirST2PpjxVowXAUeeRM51pJjQHZWKeBg==
X-Received: by 2002:a17:902:dac6:b0:1b8:9fc4:2733 with SMTP id
 q6-20020a170902dac600b001b89fc42733mr5853252plx.3.1690449469696; 
 Thu, 27 Jul 2023 02:17:49 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ea8300b001b8c3c7b102sm1099792plb.127.2023.07.27.02.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 02:17:49 -0700 (PDT)
Message-ID: <df02ac8e-b9b3-1582-7d11-fb5ab54f2e64@bytedance.com>
Date: Thu, 27 Jul 2023 17:17:36 +0800
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
 <20230727080502.77895-35-zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-35-zhengqi.arch@bytedance.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/27 16:04,
 Qi Zheng wrote: > In preparation for implementing
 lockless slab shrink, use new APIs to > dynamically allocate the ext4-es
 shrinker, so that it can be freed > asynchronously using [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qOx8A-004Pts-I4
Subject: Re: [f2fs-dev] [PATCH v3 34/49] ext4: dynamically allocate the
 ext4-es shrinker
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
> dynamically allocate the ext4-es shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct ext4_sb_info.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   fs/ext4/ext4.h           |  2 +-
>   fs/ext4/extents_status.c | 22 ++++++++++++----------
>   2 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index 1e2259d9967d..82397bf0b33e 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -1657,7 +1657,7 @@ struct ext4_sb_info {
>   	__u32 s_csum_seed;
>   
>   	/* Reclaim extents from extent status tree */
> -	struct shrinker s_es_shrinker;
> +	struct shrinker *s_es_shrinker;
>   	struct list_head s_es_list;	/* List of inodes with reclaimable extents */
>   	long s_es_nr_inode;
>   	struct ext4_es_stats s_es_stats;
> diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
> index 9b5b8951afb4..74bb64fadbc4 100644
> --- a/fs/ext4/extents_status.c
> +++ b/fs/ext4/extents_status.c
> @@ -1596,7 +1596,7 @@ static unsigned long ext4_es_count(struct shrinker *shrink,
>   	unsigned long nr;
>   	struct ext4_sb_info *sbi;
>   
> -	sbi = container_of(shrink, struct ext4_sb_info, s_es_shrinker);
> +	sbi = shrink->private_data;
>   	nr = percpu_counter_read_positive(&sbi->s_es_stats.es_stats_shk_cnt);
>   	trace_ext4_es_shrink_count(sbi->s_sb, sc->nr_to_scan, nr);
>   	return nr;
> @@ -1605,8 +1605,7 @@ static unsigned long ext4_es_count(struct shrinker *shrink,
>   static unsigned long ext4_es_scan(struct shrinker *shrink,
>   				  struct shrink_control *sc)
>   {
> -	struct ext4_sb_info *sbi = container_of(shrink,
> -					struct ext4_sb_info, s_es_shrinker);
> +	struct ext4_sb_info *sbi = shrink->private_data;
>   	int nr_to_scan = sc->nr_to_scan;
>   	int ret, nr_shrunk;
>   
> @@ -1690,14 +1689,17 @@ int ext4_es_register_shrinker(struct ext4_sb_info *sbi)
>   	if (err)
>   		goto err3;
>   
> -	sbi->s_es_shrinker.scan_objects = ext4_es_scan;
> -	sbi->s_es_shrinker.count_objects = ext4_es_count;
> -	sbi->s_es_shrinker.seeks = DEFAULT_SEEKS;
> -	err = register_shrinker(&sbi->s_es_shrinker, "ext4-es:%s",
> -				sbi->s_sb->s_id);
> -	if (err)
> +	sbi->s_es_shrinker = shrinker_alloc(0, "ext4-es:%s", sbi->s_sb->s_id);
> +	if (!sbi->s_es_shrinker)

Here should set err to -ENOMEM, will fix.

>   		goto err4;
>   
> +	sbi->s_es_shrinker->scan_objects = ext4_es_scan;
> +	sbi->s_es_shrinker->count_objects = ext4_es_count;
> +	sbi->s_es_shrinker->seeks = DEFAULT_SEEKS;
> +	sbi->s_es_shrinker->private_data = sbi;
> +
> +	shrinker_register(sbi->s_es_shrinker);
> +
>   	return 0;
>   err4:
>   	percpu_counter_destroy(&sbi->s_es_stats.es_stats_shk_cnt);
> @@ -1716,7 +1718,7 @@ void ext4_es_unregister_shrinker(struct ext4_sb_info *sbi)
>   	percpu_counter_destroy(&sbi->s_es_stats.es_stats_cache_misses);
>   	percpu_counter_destroy(&sbi->s_es_stats.es_stats_all_cnt);
>   	percpu_counter_destroy(&sbi->s_es_stats.es_stats_shk_cnt);
> -	unregister_shrinker(&sbi->s_es_shrinker);
> +	shrinker_free(sbi->s_es_shrinker);
>   }
>   
>   /*


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
