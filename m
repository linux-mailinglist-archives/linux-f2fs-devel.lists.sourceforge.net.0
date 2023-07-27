Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AF9764A30
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 10:07:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOw22-0008NS-TM;
	Thu, 27 Jul 2023 08:07:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOw21-0008NH-HO
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ppdDbzxLfV7T8uyJ0+LWzuRMVQS50F9BO9dGotbDPbU=; b=XiwV69viYCkkomu/cgogd7j4c/
 jcshZTkxS4rqHAPMgyXQqeDNGIZMIN4AIb10fHS9h7ZWPcKOdJaEYCMcGkYVc4HCOTC+EAmLyutXr
 edcVycqsRHhK7OImHS5FuFzra8OS6KozAa2oua072Bsw7ke9/ArfDoIMvAcLSWI9NmRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ppdDbzxLfV7T8uyJ0+LWzuRMVQS50F9BO9dGotbDPbU=; b=AvMFY1jctVAgTmfeW/BI0LEkCz
 BVEnLdKkMS7/5xIrdldQq0EFdgl+nmjjmC9b59/etPUFDBhenkc0UvUdJeQEWFrjnOcbRmIwXIHT9
 2KYT9MBOpqzYe2AwQ8Q6oL1saMV4esWWCtu15YZZrYiZU0lcjv4jTR75myVR24VIf3vo=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOw1z-004LPp-TW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:07:32 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-686f74a8992so77379b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jul 2023 01:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445246; x=1691050046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ppdDbzxLfV7T8uyJ0+LWzuRMVQS50F9BO9dGotbDPbU=;
 b=KpqQJYQnD6XZcHjbv/+muTq0vlYb8upK5OWv1aGKt50KKzUi7i+JzF6oBUUsqnnZ8J
 r8wNd0ItebBMmbL+7PFob82/siVz2lcTITJgiPWkofH/9LJHrT7eh309V59HxxQ0mOlE
 DIoyoSTd+eeARDBsSwfCZZT+D1eJ9vMkwqGXz/n2dx2kEZLuZLLaNunG9PbX3wXH0AxZ
 KS3Doj3WekVbT+DS1JWdAAgXSNDy2XRSFj8TbzZy0Apg5FVE8T/dZYbRy2KedtCvtde/
 VVp4H8rT9xtwGwXR6cSDDmcPYDcWy0CdFKjtAgYv/8XnYUvwEF4uwit6TMoEpzOExIim
 mxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445246; x=1691050046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ppdDbzxLfV7T8uyJ0+LWzuRMVQS50F9BO9dGotbDPbU=;
 b=SMarOufoBA7CIZS/x1QIfshFn+0TJKIngjK/yuFpr79rpwksUT4tmqNzqhDw+21mLW
 cxWNhnD0p/I3VV8R8/ULJ0ChAH4ehOcg3fQ2E5aiZhTc478CYQe+5PZvdFndwbSDjuLG
 kw41dk/yyHNER1YxP7z7SHRz8H9y6Qycr3fGsNmgmHQVWI6/yfmVPcYrEROeW3otHmyd
 r/WFpOSY34BZkXmrbx96rZTvzxYqGRYM7/qCZZtU+C3C3q7U4Xrr7MRfAqtTw0PdL54Y
 qUvZluemk51d2vufadLUaoOLIc0Ix8pet2vYI3Uvg+MZebunyEGqkBL42O2owgua27mp
 UlsA==
X-Gm-Message-State: ABy/qLbqUcHkQqbysdHeCJIUL5pCtguh8QK2pKeJxZ6LrVBFvnObS7A1
 1DFoN1ct6rNLcf2GmNWxtOUBXA==
X-Google-Smtp-Source: APBJJlG6gnRngQzsFbw9KnzolcByCK3s/MKtuzn55eodinGMlyRsxgSHfIHEIFN3Q1pZ+W9H3PfVAg==
X-Received: by 2002:a05:6a00:2b90:b0:67d:308b:97ef with SMTP id
 dv16-20020a056a002b9000b0067d308b97efmr4583872pfb.2.1690445246349; 
 Thu, 27 Jul 2023 01:07:26 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:07:25 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Thu, 27 Jul 2023 16:04:21 +0800
Message-Id: <20230727080502.77895-9-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use new APIs to dynamically allocate the drm-ttm_pool
 shrinker.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> Reviewed-by: Muchun
 Song <songmuchun@bytedance.com> --- drivers/gpu/drm/ttm/ttm_pool.c | 23
 +++++++++++++++-------- 1 file changed, 15 insertions(+ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.175 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qOw1z-004LPp-TW
Subject: [f2fs-dev] [PATCH v3 08/49] drm/ttm: dynamically allocate the
 drm-ttm_pool shrinker
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
 linux-bcache@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use new APIs to dynamically allocate the drm-ttm_pool shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index cddb9151d20f..c9c9618c0dce 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -73,7 +73,7 @@ static struct ttm_pool_type global_dma32_uncached[MAX_ORDER + 1];
 
 static spinlock_t shrinker_lock;
 static struct list_head shrinker_list;
-static struct shrinker mm_shrinker;
+static struct shrinker *mm_shrinker;
 
 /* Allocate pages of size 1 << order with the given gfp_flags */
 static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
@@ -734,8 +734,8 @@ static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
 	struct shrink_control sc = { .gfp_mask = GFP_NOFS };
 
 	fs_reclaim_acquire(GFP_KERNEL);
-	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(&mm_shrinker, &sc),
-		   ttm_pool_shrinker_scan(&mm_shrinker, &sc));
+	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
+		   ttm_pool_shrinker_scan(mm_shrinker, &sc));
 	fs_reclaim_release(GFP_KERNEL);
 
 	return 0;
@@ -779,10 +779,17 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 			    &ttm_pool_debugfs_shrink_fops);
 #endif
 
-	mm_shrinker.count_objects = ttm_pool_shrinker_count;
-	mm_shrinker.scan_objects = ttm_pool_shrinker_scan;
-	mm_shrinker.seeks = 1;
-	return register_shrinker(&mm_shrinker, "drm-ttm_pool");
+	mm_shrinker = shrinker_alloc(0, "drm-ttm_pool");
+	if (!mm_shrinker)
+		return -ENOMEM;
+
+	mm_shrinker->count_objects = ttm_pool_shrinker_count;
+	mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
+	mm_shrinker->seeks = 1;
+
+	shrinker_register(mm_shrinker);
+
+	return 0;
 }
 
 /**
@@ -802,6 +809,6 @@ void ttm_pool_mgr_fini(void)
 		ttm_pool_type_fini(&global_dma32_uncached[i]);
 	}
 
-	unregister_shrinker(&mm_shrinker);
+	shrinker_free(mm_shrinker);
 	WARN_ON(!list_empty(&shrinker_list));
 }
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
