Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C9775F149
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 11:56:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNsIq-0006ws-H5;
	Mon, 24 Jul 2023 09:56:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNsIo-0006wl-A7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 09:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ztwb9n/1dXh113w/8xubUIoix8VXd/5rqVT4RvFn/tw=; b=Rib2L4j6XXGkeXGeW0DCW6isSK
 IDU/9TDpH/WchTb2ayMUI6YrdrC3Bdxw55/WJHp9wmUC6v91mUpGBvvp4CcYbBbFve9vtv09YDlus
 kKAb6M55ZFmV+QoOCfJSgYBN8stVifudD4k36TsUo5LQ+8GFIRaJdrhxtNAyImmYFmLo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ztwb9n/1dXh113w/8xubUIoix8VXd/5rqVT4RvFn/tw=; b=EkJycCx6SF3IO1h1m6pKiTHVqE
 Eb2O2ZH/8sZyZbJP8ZwAcYxz+hlHhmE2iqt5sDOU1pk7kZmn5SlE8fP9kGAZCMY6+kcj5TstNNmvG
 KNCGW7TJ90aZE4+rU0GSFzYCPhO7mlAFNcKMYeEWl5n9cX6V7jfJFIA9tV1AX3nUCDos=;
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNsIo-000Oml-6F for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 09:56:30 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-6b9de4b0c1aso638936a34.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 02:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690192584; x=1690797384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ztwb9n/1dXh113w/8xubUIoix8VXd/5rqVT4RvFn/tw=;
 b=i2AY79f9q2KY9F5g4hYGF4+Tn1hRyFHBx8jG0TFZ8GGp9voWdqd22s8J05HZYIuKXf
 mM0i86J/t4UujTChkd9Gg8odNVKjYgQs+gNqH9tUv8aOj2fs7SEQCxWwl3nGze0PotcT
 beAfxrWvVYcDD8WarcnrsLB6M0VG1Yzhm31WF5tjPup2uGfCKH8VuToczMATAMKKRxLq
 5xAuv7BG008Yj3Jm2lbAY/ZnGRN2kxwn66823u6qS7TWLZxz6w3L4wZrHS1j6+s5u33I
 KwDvG0Rt8Nt6CYJwTdXRc8yfdzDF9lYc8hs4AIMGA9cxpk67gGZFrLXBa/fNqGJtPg2r
 EHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690192584; x=1690797384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ztwb9n/1dXh113w/8xubUIoix8VXd/5rqVT4RvFn/tw=;
 b=Z4Hgm+I/1cFtV03ru7ZzYsg7ls/fZHu1DPIu8DrvO19A5GHbfOdFEj7KpokPcv82SG
 XJ7GCXZiCHlmdaMNUHshVNG0nZHOc2DwTj+wme9EmPuwQtZ4yP0mFLifxdfOQ9h4jtDV
 PGeQQsmCR2egqw8R3jM3tX1XUTwSP8wI7kfJOybOJMe58NxZNDl0fJFgnOiMEzssV2Yf
 T3f8vxCiB0rn0JhN5TgX7DGpni/ryzz8l7j/lHfycqsF+Fu2PAFTHS/3PejETcXqQMKM
 Xwe+zfoS7VM64UuWkvdwulN1U7Jr9GAwlopHEECCU6B5Zm1vnY59cjAEritNYgRTNPpr
 2TyA==
X-Gm-Message-State: ABy/qLYDQO6ZSJA0p2ODrLt3pqvUYYVe7ZO5MIvc7LtakOV25Yvhye9K
 mBurebo/swGEYsTLLIiGjcx+roVfUMFXMxx3SyE=
X-Google-Smtp-Source: APBJJlHRxCFTSeAmJPIiRwzXlrngv0y6n5gqphR6YCBFCcMRvGq0CtVM2WuFHUMj7p5y6QUWxkmpXA==
X-Received: by 2002:a17:902:dad1:b0:1b8:aded:524c with SMTP id
 q17-20020a170902dad100b001b8aded524cmr12538511plx.1.1690192086608; 
 Mon, 24 Jul 2023 02:48:06 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:48:06 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:22 +0800
Message-Id: <20230724094354.90817-16-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use new APIs to dynamically allocate the dquota-cache
 shrinker.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> --- fs/quota/dquot.c
 | 17 ++++++++++------- 1 file changed, 10 insertions(+), 7 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.51 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.51 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qNsIo-000Oml-6F
Subject: [f2fs-dev] [PATCH v2 15/47] quota: dynamically allocate the
 dquota-cache shrinker
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

Use new APIs to dynamically allocate the dquota-cache shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/quota/dquot.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
index e8232242dd34..6cb2d8911bc3 100644
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c
@@ -791,11 +791,7 @@ dqcache_shrink_count(struct shrinker *shrink, struct shrink_control *sc)
 	percpu_counter_read_positive(&dqstats.counter[DQST_FREE_DQUOTS]));
 }
 
-static struct shrinker dqcache_shrinker = {
-	.count_objects = dqcache_shrink_count,
-	.scan_objects = dqcache_shrink_scan,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *dqcache_shrinker;
 
 /*
  * Safely release dquot and put reference to dquot.
@@ -2991,8 +2987,15 @@ static int __init dquot_init(void)
 	pr_info("VFS: Dquot-cache hash table entries: %ld (order %ld,"
 		" %ld bytes)\n", nr_hash, order, (PAGE_SIZE << order));
 
-	if (register_shrinker(&dqcache_shrinker, "dquota-cache"))
-		panic("Cannot register dquot shrinker");
+	dqcache_shrinker = shrinker_alloc(0, "dquota-cache");
+	if (!dqcache_shrinker)
+		panic("Cannot allocate dquot shrinker");
+
+	dqcache_shrinker->count_objects = dqcache_shrink_count;
+	dqcache_shrinker->scan_objects = dqcache_shrink_scan;
+	dqcache_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(dqcache_shrinker);
 
 	return 0;
 }
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
