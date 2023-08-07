Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C5F7720AB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 13:17:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSyEO-0008Ll-VH;
	Mon, 07 Aug 2023 11:16:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qSyE5-0008KL-VT
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nhs5C6wYTK112tB0Y3rKeCsMBEmGx3fQoCnqZ3HCCLA=; b=F7bJJY0K8golmChP3LYxP5vWuv
 2PkSjzIo7Sys1hFCp/0NFYvYhR2I3X4hiQ5Z6QzvEQL8AFyeL7sYgDMEOTKqca5dvhE6giRhMTXus
 1NCZPvwdhvpSHIdckzwyo4M9eacqY2bEdGkkqS0B6788DljULTFvtJ8h1gPgnlq/onuo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nhs5C6wYTK112tB0Y3rKeCsMBEmGx3fQoCnqZ3HCCLA=; b=Mg2MBk6zeUGdX3hP2Z5OM4ELFE
 u0MZ3RPjGbVlHVUQHrRGqxeKFTIfJRDI8JuQbO3PRN2idiPtLvwVAUuXVRI6o8nukbpIwSHXClbUd
 7yxYEWMF8sjqiCI4/nWW68CuiE+W0Z0onnlWX8LvhHxZDS5/Scj2jKtRbc3A3x3JBSxw=;
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qSyE4-00FrpM-8c for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:16:40 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-268663fb09cso631717a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Aug 2023 04:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1691406994; x=1692011794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nhs5C6wYTK112tB0Y3rKeCsMBEmGx3fQoCnqZ3HCCLA=;
 b=VutXoqIYPXtXpdtpLBT8bT2urW1s48myud5I+McDwEBCa9rsQtPimBr+YUFUzsT97Y
 MjfZoj9VTU5fQdJYfMy4Yv9+fpoIS3NFbuatZ84CQCYl8H9eWSOHmEJiwCeaGu2opion
 jdT+b5LnvY412zroG7MGUq7fLqOt080kwGO2vU4AXzRlkef5xzEfjXjzk3KbTMiuBQm9
 X5miROMvoH95e1ANj7PpglZT3M6nqFHwr/l7jXhn2TxbPNm1IYfgnlH3CAsHhpdGLp2V
 N9EQiXy6+755vxTQtpjB+rXzevwen4FSNuxTXEorqPqLUTQJulIk6PKsXEt+umpl0/zu
 QYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691406994; x=1692011794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nhs5C6wYTK112tB0Y3rKeCsMBEmGx3fQoCnqZ3HCCLA=;
 b=K1nL+C5YycsqfJrgqGo0ygugu+lX9jzsa6kK1WZST2lT95jWS+U37O1RJBM1Edaa06
 JYFPcoiqYxZXqv6ZzZpqOqshYELrDJXG3WS2RFbHSq321ySSYMVkc7PzQJAgfx+WfqXg
 egumvC5OAG9OL3dyUDuxdPennOxVIsw78ruZT0w3HFGZ1v1nDiArTnEQ2XR4UqE2B8Ka
 19jOdSfdGszSWVP/99gZiLrXvhwdVwTigND+hb0yh7IVVv1ar5sKQ12QZiIT8s8HdgNg
 TwsC5GDe793qYkfj1OQH1j/tPe7cOrqCBcS6cQCN8L24f2y1/UXoGbQrvWtsMmkANzYd
 vBJQ==
X-Gm-Message-State: AOJu0YxatKd9G8lw3qFvZgWz4ileqS+yG7n3lk9j9XrO1sU1HBtqhzxa
 N6UF36KIYloyBhjb2lG3nzlbwA==
X-Google-Smtp-Source: AGHT+IF623rMYCfdnVm3rDQUM9QMv5wRA4teIiBc32f8XUPEVkH5VguN8eCSFu0xAaU5upe3gsVL9w==
X-Received: by 2002:a17:90a:6701:b0:269:32c7:24dc with SMTP id
 n1-20020a17090a670100b0026932c724dcmr6035493pjj.0.1691406994765; 
 Mon, 07 Aug 2023 04:16:34 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:16:34 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 simon.horman@corigine.com, dlemoal@kernel.org
Date: Mon,  7 Aug 2023 19:09:19 +0800
Message-Id: <20230807110936.21819-32-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In preparation for implementing lockless slab shrink, use
 new APIs to dynamically allocate the virtio-balloon shrinker, so that it can
 be freed asynchronously using kfree_rcu(). Then it doesn't need t [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qSyE4-00FrpM-8c
Subject: [f2fs-dev] [PATCH v4 31/48] virtio_balloon: dynamically allocate
 the virtio-balloon shrinker
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

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the virtio-balloon shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct virtio_balloon.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/virtio/virtio_balloon.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 5b15936a5214..82e6087073a9 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -111,7 +111,7 @@ struct virtio_balloon {
 	struct virtio_balloon_stat stats[VIRTIO_BALLOON_S_NR];
 
 	/* Shrinker to return free pages - VIRTIO_BALLOON_F_FREE_PAGE_HINT */
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 	/* OOM notifier to deflate on OOM - VIRTIO_BALLOON_F_DEFLATE_ON_OOM */
 	struct notifier_block oom_nb;
@@ -816,8 +816,7 @@ static unsigned long shrink_free_pages(struct virtio_balloon *vb,
 static unsigned long virtio_balloon_shrinker_scan(struct shrinker *shrinker,
 						  struct shrink_control *sc)
 {
-	struct virtio_balloon *vb = container_of(shrinker,
-					struct virtio_balloon, shrinker);
+	struct virtio_balloon *vb = shrinker->private_data;
 
 	return shrink_free_pages(vb, sc->nr_to_scan);
 }
@@ -825,8 +824,7 @@ static unsigned long virtio_balloon_shrinker_scan(struct shrinker *shrinker,
 static unsigned long virtio_balloon_shrinker_count(struct shrinker *shrinker,
 						   struct shrink_control *sc)
 {
-	struct virtio_balloon *vb = container_of(shrinker,
-					struct virtio_balloon, shrinker);
+	struct virtio_balloon *vb = shrinker->private_data;
 
 	return vb->num_free_page_blocks * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
 }
@@ -847,16 +845,23 @@ static int virtio_balloon_oom_notify(struct notifier_block *nb,
 
 static void virtio_balloon_unregister_shrinker(struct virtio_balloon *vb)
 {
-	unregister_shrinker(&vb->shrinker);
+	shrinker_free(vb->shrinker);
 }
 
 static int virtio_balloon_register_shrinker(struct virtio_balloon *vb)
 {
-	vb->shrinker.scan_objects = virtio_balloon_shrinker_scan;
-	vb->shrinker.count_objects = virtio_balloon_shrinker_count;
-	vb->shrinker.seeks = DEFAULT_SEEKS;
+	vb->shrinker = shrinker_alloc(0, "virtio-balloon");
+	if (!vb->shrinker)
+		return -ENOMEM;
 
-	return register_shrinker(&vb->shrinker, "virtio-balloon");
+	vb->shrinker->scan_objects = virtio_balloon_shrinker_scan;
+	vb->shrinker->count_objects = virtio_balloon_shrinker_count;
+	vb->shrinker->seeks = DEFAULT_SEEKS;
+	vb->shrinker->private_data = vb;
+
+	shrinker_register(vb->shrinker);
+
+	return 0;
 }
 
 static int virtballoon_probe(struct virtio_device *vdev)
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
