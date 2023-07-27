Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6566A764EDB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 11:11:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOx1k-0007sI-5C;
	Thu, 27 Jul 2023 09:11:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOx1i-0007sC-BC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 09:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cACJ3NT7rSPHksG1CSCDv/QZVUluNTqq4KXvaW886oI=; b=RvlzboM1BxRVxPRq1fj+RiD2Th
 +7bW6BebXNtSPhZ3t6D5jTK6egJESi2k4tN1ls0AQNz1p1SMbiyIAzXTKQI1jUibq2bDTflAd6akK
 oAb6ZTgq3R2sCk0kkj6VwApS9/e6A1LHJr3D2IFikPNJSOlbXCpoktpfjcLu0bm2PoCE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cACJ3NT7rSPHksG1CSCDv/QZVUluNTqq4KXvaW886oI=; b=GT4e+AcmV4+K5kc1krhnW8CnLI
 SVGTG4+fHMhYC1HRbdI6oPOKBGQbHwv/1LsYLl9+q1hNND9ByYRfq+clQCtF/6VTYzhkWL9saKXEy
 jNFYoq1MwQner5+Q8d2vwWMuxc669YeTOPipl9FSi0lb4L5p/s4dtk4wtlMCamRiUTCQ=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOx1h-004PXC-M2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 09:11:19 +0000
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-66d6a9851f3so177068b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jul 2023 02:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690449072; x=1691053872;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cACJ3NT7rSPHksG1CSCDv/QZVUluNTqq4KXvaW886oI=;
 b=lKnOasFRjAEbGh7P40XbzLKtOkahlmVFUDvqCWW3ZgaRuzNJSwp4sTaKgMwNwz+Jpc
 hA4nVDJPH5aqf4q8bVxcWLUkzXpK23oeAFnlJRwJaEUIleLrrgs7btXzJpx3+9HaPfQV
 hGIP/T6lERVA8hpdk6KZN9Q4J/+wilHe5ZItz/9QQ1qHO3gv2Y4k+BaS5cDcOKz/WLAL
 6NaRvNv6KF2mZ19RDXY6rbQZ5sQKyx2Yj2LrfaBgxjqmYdHbumQCN0WmWtbB+gjDIGzm
 PXmUTQGLOY5T8H3PnVo3H27NG4eQhipuKvHt4yAhK97ujnI+IJGqA8lmlUO0fy4wYeay
 +oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690449072; x=1691053872;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cACJ3NT7rSPHksG1CSCDv/QZVUluNTqq4KXvaW886oI=;
 b=HRxsG8uv/LaMy9/PTKJGivUQ2FmGa0HEhqhUmCyYn0EhW2gPmviGbx9dhmigviSQzC
 t06k1mng6+N4Ec5a7ZPPgjvCmHMje3eqWOZeXG1x4UFl8I5lJLIDVo/gkw7nczMOyhvq
 uevWvvk0n2kUDyv/GXq0HQVPFvVuBo74yDmNkp22K7PNl3yF+opW7PS9CzEY2xvobpE/
 m+jZexRhIjZ0hKMHM+zQYNWGgZU35xb+CpDQY2v5odAO9gCNRIchl7DhVCVkMBIwQzyk
 GtjXsv7gxTfgZwoJdUk2D+fcWqg0UtfDmmCEnJQg6oye3ep5Ox8ScHjDnfN/MoS3o6tJ
 q71A==
X-Gm-Message-State: ABy/qLYj6wzk+eUm0UhUSaRDcZCqrDqHtFH2F7xds47xMZPfm92KTFVU
 MQg6iw09vRDAuJahycyv7biYOA==
X-Google-Smtp-Source: APBJJlFfFWIsc+pfSeu4dzuDSzimKXTbXaekoL0gFKsbHel8kB/qljY4u0PtyM2mUW/wDh3jQGEPVg==
X-Received: by 2002:a05:6a00:2d82:b0:675:8627:a291 with SMTP id
 fb2-20020a056a002d8200b006758627a291mr4692915pfb.3.1690449072033; 
 Thu, 27 Jul 2023 02:11:12 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 h4-20020aa786c4000000b00682a99b01basm1038080pfo.0.2023.07.27.02.11.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 02:11:11 -0700 (PDT)
Message-ID: <1eb30b9e-c43b-b81e-4d96-5d6fa4f2894a@bytedance.com>
Date: Thu, 27 Jul 2023 17:10:57 +0800
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
 <20230727080502.77895-23-zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-23-zhengqi.arch@bytedance.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/27 16:04,
 Qi Zheng wrote: > Use new APIs to dynamically
 allocate the sunrpc_cred shrinker. > > Signed-off-by: Qi Zheng
 <zhengqi.arch@bytedance.com>
 > Reviewed-by: Muchun Song <songmuchun@byt [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qOx1h-004PXC-M2
Subject: Re: [f2fs-dev] [PATCH v3 22/49] sunrpc: dynamically allocate the
 sunrpc_cred shrinker
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
> Use new APIs to dynamically allocate the sunrpc_cred shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   net/sunrpc/auth.c | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/net/sunrpc/auth.c b/net/sunrpc/auth.c
> index 2f16f9d17966..6b898b1be6f5 100644
> --- a/net/sunrpc/auth.c
> +++ b/net/sunrpc/auth.c
> @@ -861,11 +861,7 @@ rpcauth_uptodatecred(struct rpc_task *task)
>   		test_bit(RPCAUTH_CRED_UPTODATE, &cred->cr_flags) != 0;
>   }
>   
> -static struct shrinker rpc_cred_shrinker = {
> -	.count_objects = rpcauth_cache_shrink_count,
> -	.scan_objects = rpcauth_cache_shrink_scan,
> -	.seeks = DEFAULT_SEEKS,
> -};
> +static struct shrinker *rpc_cred_shrinker;
>   
>   int __init rpcauth_init_module(void)
>   {
> @@ -874,9 +870,16 @@ int __init rpcauth_init_module(void)
>   	err = rpc_init_authunix();
>   	if (err < 0)
>   		goto out1;
> -	err = register_shrinker(&rpc_cred_shrinker, "sunrpc_cred");
> -	if (err < 0)
> +	rpc_cred_shrinker = shrinker_alloc(0, "sunrpc_cred");
> +	if (!rpc_cred_shrinker)

Here should set err to -ENOMEM, will fix.

>   		goto out2;
> +
> +	rpc_cred_shrinker->count_objects = rpcauth_cache_shrink_count;
> +	rpc_cred_shrinker->scan_objects = rpcauth_cache_shrink_scan;
> +	rpc_cred_shrinker->seeks = DEFAULT_SEEKS;
> +
> +	shrinker_register(rpc_cred_shrinker);
> +
>   	return 0;
>   out2:
>   	rpc_destroy_authunix();
> @@ -887,5 +890,5 @@ int __init rpcauth_init_module(void)
>   void rpcauth_remove_module(void)
>   {
>   	rpc_destroy_authunix();
> -	unregister_shrinker(&rpc_cred_shrinker);
> +	shrinker_free(rpc_cred_shrinker);
>   }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
