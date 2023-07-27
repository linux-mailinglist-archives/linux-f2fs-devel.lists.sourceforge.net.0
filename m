Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE132764A90
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 10:10:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOw50-0000GX-TV;
	Thu, 27 Jul 2023 08:10:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOw4y-0000GL-FA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uDu/4z0sff3MNLq2Hem41DvJLtW9HR7Ht2OY0+o3IBw=; b=NV3ROG3+7NbbJJUTcZeIS25yNb
 USwcAOpcnU7F0X2/VsOyMSiWIVbMBv6YzuCb5RaqxGKOgeISKyfajmwsWw5Yipwk/kN6s5iuJxRLE
 cs5+RWRPei7shyPplGGoGvAPpji7bPLMIaTuy0RITTRD3rfkK+spfTsHOT7li7qrIZbI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uDu/4z0sff3MNLq2Hem41DvJLtW9HR7Ht2OY0+o3IBw=; b=kU/MQH48cAXuai7Yn0S6x6KkdM
 Wv/6vNOAX+XoWfRr436B9dQp39Jg5jGyc5xejezpDLZ/Uo907v+ov/Tt71f99Xg6wIIFPAyspD4dY
 34xV5fppTL5CYlRhHWplfEZx8Vml+ZbPXZO2vw8tGu3XJsaZmWfVzOoIVxxmMGBCjZPE=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOw4w-0004e0-MA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:10:35 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-686f74a8992so77881b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jul 2023 01:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445429; x=1691050229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uDu/4z0sff3MNLq2Hem41DvJLtW9HR7Ht2OY0+o3IBw=;
 b=iVGfsyXkMcKNuSj4S4+ETT1e5FnNKRSLwcupS7aKQrOa2P/cg11EPb/fa7MepSVN0c
 souD70V3XZBCWCF1GY2G8kOBoazYK/GwCZP5iJVITEwRi2CFhPhtCnmN6NHRYDRfscjM
 ei11bn/3SqGlS2cI+uWxsIZ60GgV8/Th1+KRHAcGdOM/vcClXnAdg9IcKu5dXKtmCkaz
 1Uv1368bMlurEfH1GvebpNgAfjlYTQWl+OVWRYv+SAitVhKYxMqk7I6vstlqXAV5ZTFg
 13mCns35aGRuj+msRJnkqY3lYp1C9AqbhcZNDVttxslcFzKIxthPN+0g8mDIqHh31rTQ
 XhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445429; x=1691050229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uDu/4z0sff3MNLq2Hem41DvJLtW9HR7Ht2OY0+o3IBw=;
 b=J5xj7asec9ayVkfea2mNGM4ioqx23Xd3BHr0EMe4vD2Vw13j+YgNJ8L43os0Xy0yEK
 jDr6TR4UYY+YKqJQV6GdeBtX/txVqvI+nq6vqTKV8qJZ/xYD6cLsa8uKG1GkoWgGZ62e
 y26GTy1D5gCr8r6MACHzy3MRVkHNgDN9zC28q48prpM8qjX8odV7B38GA1DYietMkqF6
 rJrqPRMFMmschx5arj4oRgwYkZkpu3s/EeIYea2R79397+erBNzC0zMySETnfv1FmHO2
 xDnQLxhRRP6c/lFGrepx9NeMCpb6orOE4klx3ucwd9D8I4xs6MA1A0b9trK15vQTvArD
 6BdA==
X-Gm-Message-State: ABy/qLa0fybAgGbOLvfOe230AE7GCy1yTsrbunGCwLXYrEkIoHYKBMKe
 BN27EuOkVtRot4H98RIm9sKa9g==
X-Google-Smtp-Source: APBJJlHGswV8UzzwdSNooBFOlXCa2QxTNwcJjWEIeOA/B6KtVME+e61/tgitLanHgBraDSTbcyHPAw==
X-Received: by 2002:a05:6a20:1595:b0:137:30db:bc1e with SMTP id
 h21-20020a056a20159500b0013730dbbc1emr5696433pzj.3.1690445429121; 
 Thu, 27 Jul 2023 01:10:29 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:10:28 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Thu, 27 Jul 2023 16:04:36 +0800
Message-Id: <20230727080502.77895-24-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use new APIs to dynamically allocate the mm-shadow shrinker.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> --- mm/workingset.c
 | 27 ++++++++++++++ 1 file changed, 14 insertions(+), 13 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.172 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qOw4w-0004e0-MA
Subject: [f2fs-dev] [PATCH v3 23/49] mm: workingset: dynamically allocate
 the mm-shadow shrinker
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
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use new APIs to dynamically allocate the mm-shadow shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/workingset.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/mm/workingset.c b/mm/workingset.c
index da58a26d0d4d..3c53138903a7 100644
--- a/mm/workingset.c
+++ b/mm/workingset.c
@@ -763,13 +763,6 @@ static unsigned long scan_shadow_nodes(struct shrinker *shrinker,
 					NULL);
 }
 
-static struct shrinker workingset_shadow_shrinker = {
-	.count_objects = count_shadow_nodes,
-	.scan_objects = scan_shadow_nodes,
-	.seeks = 0, /* ->count reports only fully expendable nodes */
-	.flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE,
-};
-
 /*
  * Our list_lru->lock is IRQ-safe as it nests inside the IRQ-safe
  * i_pages lock.
@@ -778,9 +771,10 @@ static struct lock_class_key shadow_nodes_key;
 
 static int __init workingset_init(void)
 {
+	struct shrinker *workingset_shadow_shrinker;
 	unsigned int timestamp_bits;
 	unsigned int max_order;
-	int ret;
+	int ret = -ENOMEM;
 
 	BUILD_BUG_ON(BITS_PER_LONG < EVICTION_SHIFT);
 	/*
@@ -797,17 +791,24 @@ static int __init workingset_init(void)
 	pr_info("workingset: timestamp_bits=%d max_order=%d bucket_order=%u\n",
 	       timestamp_bits, max_order, bucket_order);
 
-	ret = prealloc_shrinker(&workingset_shadow_shrinker, "mm-shadow");
-	if (ret)
+	workingset_shadow_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE |
+						    SHRINKER_MEMCG_AWARE,
+						    "mm-shadow");
+	if (!workingset_shadow_shrinker)
 		goto err;
+
 	ret = __list_lru_init(&shadow_nodes, true, &shadow_nodes_key,
-			      &workingset_shadow_shrinker);
+			      workingset_shadow_shrinker);
 	if (ret)
 		goto err_list_lru;
-	register_shrinker_prepared(&workingset_shadow_shrinker);
+
+	workingset_shadow_shrinker->count_objects = count_shadow_nodes;
+	workingset_shadow_shrinker->scan_objects = scan_shadow_nodes;
+
+	shrinker_register(workingset_shadow_shrinker);
 	return 0;
 err_list_lru:
-	free_prealloced_shrinker(&workingset_shadow_shrinker);
+	shrinker_free(workingset_shadow_shrinker);
 err:
 	return ret;
 }
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
