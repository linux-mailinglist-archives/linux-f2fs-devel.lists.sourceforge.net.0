Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C2762EE0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 09:55:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOZMt-00075j-9J;
	Wed, 26 Jul 2023 07:55:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1qOZMr-00075d-Dc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 07:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+zeJUC9bLKU1rvuVX6lYw88hUmzqKAeHPtzffozeycY=; b=kB0a7ZlBuDSkGm8t7gVFCTj4f7
 wJktz5xOulXp2mQ8m8C42sBKzt1/vQbvwJZLIBIAiVGtyMU3U/zHHmz6v6Cd7jFSOJWYIAexFQcGu
 VISMsRCJ3I2cgasH7mXYQUyAmd6F8NuWy44bDrgA5JfPodXLAUulLRF1NuuO4qwE7rKo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+zeJUC9bLKU1rvuVX6lYw88hUmzqKAeHPtzffozeycY=; b=nVqMBRWKsek53WcGpl/kbUf7K2
 ij0V5V0uxcOT9KipITZoQenKGdUnbTEQhwRwYpZOUB8ecVhdfsYCnkuItp7AsdPMmw4Z2UXZSAw4u
 RB0d2LNrxwUnjOmlVvcKjHZN0adJcRvztbzLG455OKYd//x4eaBFZwAN0LiG2MOnADVg=;
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOZMm-0001hc-Sr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 07:55:33 +0000
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-6b9ec15e014so5458142a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Jul 2023 00:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1690358123; x=1690962923;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+zeJUC9bLKU1rvuVX6lYw88hUmzqKAeHPtzffozeycY=;
 b=tQkjuO/usivJ3RBq44gzsD3OW42P6HEhmKx6ZmHYG+qsV4KahzCqaUwHz0NWww3Ac5
 I3wrDF7C2a8MLABSU3zM/m+YQuExAriyP3OvCV3EmyL//P870DGAvj2S0PPPqtBTFF8t
 6wY5rAoX3lby66aU7pxb84h2p4FU72yeRR3N05KiVqSsl8zesakdzIEnrltyonwUXUhN
 QHwdse5+hUBqvb2dz1EDPap6rB88Tj2O1G0CnCCUvNBuQKKOYD1lGpEBsfPWBQmw2ot4
 6wjhB3r9fNAISzkmPAZ5Ac6UR2HDPA9Vw5k8XVwSe4Dp9Ht0pR1r0UUJeWfQTSIWDDvm
 UVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690358123; x=1690962923;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zeJUC9bLKU1rvuVX6lYw88hUmzqKAeHPtzffozeycY=;
 b=AajpKmGU5+VOETTuxA6zZUiJIhm9WSsmVOXHvEJ5aYNdQsxXoFZpazpn4fG7fXEG23
 71QBoXJwJDoQfaMYYHhiKWDM4TC83j5j8cyodSZE6RlJrUFB9DLFXyELKarBF5SIz0ls
 qzj5vcIjWZ4uicEXHgh2mF8t4J5xiRi6oOeWwIa1bKR8AR/1yiP+sPn1qcco1smB+pDF
 G7x7y1FyrAKLXmLbUKQw2GRwuRa0GzIYY9wTdgx3EZLCmaDVktnv8dLWlqlOAAOQYyN1
 /vnQhHtyeIB/hks/iCna/CNDQouS/irxfTw8kmdm2vei5v6pO7Nmtz4H1nlXblaRlvAH
 bbOA==
X-Gm-Message-State: ABy/qLYVKA9pxtk45v6pnmyd3BJzlNd87c5YQCswFg5OLV1R01FkpL5B
 9G8cu4yFZfVusN/mwlEF3/tTfXl+QGFI/aIeAAw=
X-Google-Smtp-Source: APBJJlH5b0OufxURLtAQUAf05ozn4hmRBD/Qn/v7OHyNHGefhP7kmXIN/eqXKV4z4NaYW1ZZNRUFVA==
X-Received: by 2002:a05:6a00:a0d:b0:67a:a906:9edb with SMTP id
 p13-20020a056a000a0d00b0067aa9069edbmr1921084pfh.30.1690356367307; 
 Wed, 26 Jul 2023 00:26:07 -0700 (PDT)
Received: from dread.disaster.area (pa49-186-119-116.pa.vic.optusnet.com.au.
 [49.186.119.116]) by smtp.gmail.com with ESMTPSA id
 r5-20020a62e405000000b00666e649ca46sm10751809pfh.101.2023.07.26.00.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:26:06 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qOYuK-00AfFC-0I;
 Wed, 26 Jul 2023 17:26:04 +1000
Date: Wed, 26 Jul 2023 17:26:04 +1000
To: Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <ZMDKjBCZH6+OP5gW@dread.disaster.area>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-4-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230724094354.90817-4-zhengqi.arch@bytedance.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jul 24, 2023 at 05:43:10PM +0800, Qi Zheng wrote:
 > Currently, the shrinker instances can be divided into the following three
 > types: > > a) global shrinker instance statically defined in the [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.41 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.41 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qOZMm-0001hc-Sr
Subject: Re: [f2fs-dev] [PATCH v2 03/47] mm: shrinker: add infrastructure
 for dynamically allocating shrinker
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
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, brauner@kernel.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 24, 2023 at 05:43:10PM +0800, Qi Zheng wrote:
> Currently, the shrinker instances can be divided into the following three
> types:
> 
> a) global shrinker instance statically defined in the kernel, such as
>    workingset_shadow_shrinker.
> 
> b) global shrinker instance statically defined in the kernel modules, such
>    as mmu_shrinker in x86.
> 
> c) shrinker instance embedded in other structures.
> 
> For case a, the memory of shrinker instance is never freed. For case b,
> the memory of shrinker instance will be freed after synchronize_rcu() when
> the module is unloaded. For case c, the memory of shrinker instance will
> be freed along with the structure it is embedded in.
> 
> In preparation for implementing lockless slab shrink, we need to
> dynamically allocate those shrinker instances in case c, then the memory
> can be dynamically freed alone by calling kfree_rcu().
> 
> So this commit adds the following new APIs for dynamically allocating
> shrinker, and add a private_data field to struct shrinker to record and
> get the original embedded structure.
> 
> 1. shrinker_alloc()
> 
> Used to allocate shrinker instance itself and related memory, it will
> return a pointer to the shrinker instance on success and NULL on failure.
> 
> 2. shrinker_free_non_registered()
> 
> Used to destroy the non-registered shrinker instance.

This is a bit nasty

> 
> 3. shrinker_register()
> 
> Used to register the shrinker instance, which is same as the current
> register_shrinker_prepared().
> 
> 4. shrinker_unregister()

rename this "shrinker_free()" and key the two different freeing
cases on the SHRINKER_REGISTERED bit rather than mostly duplicating
the two.

void shrinker_free(struct shrinker *shrinker)
{
	struct dentry *debugfs_entry = NULL;
	int debugfs_id;

	if (!shrinker)
		return;

	down_write(&shrinker_rwsem);
	if (shrinker->flags & SHRINKER_REGISTERED) {
		list_del(&shrinker->list);
		debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
	} else if (IS_ENABLED(CONFIG_SHRINKER_DEBUG)) {
		kfree_const(shrinker->name);
	}

	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
		unregister_memcg_shrinker(shrinker);
	up_write(&shrinker_rwsem);

	if (debugfs_entry)
		shrinker_debugfs_remove(debugfs_entry, debugfs_id);

	kfree(shrinker->nr_deferred);
	kfree(shrinker);
}
EXPORT_SYMBOL_GPL(shrinker_free);

-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
