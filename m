Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 153A175F0CF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 11:54:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNsGX-0004zz-LQ;
	Mon, 24 Jul 2023 09:54:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNsGV-0004zt-MA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 09:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vu9DfqGDIkVtY7CS+mn/8y6VlhAfp+/Q2ofuaCWar5Q=; b=URDnVe3X0pLimdjEpHfth45yiv
 frNgLtcFx4tdkdwm7yuKPpMFwba5yDd6BaiDL9qs4vsLnUg8GChlBSdtxY0+V6WOXghmMTFZw9VyG
 ABNvtLBeflBRUV5RqtQXIXBlOX2K3liL2AXqZcqaz3cvkIhBmGWetlIMwM6erKX/qrGY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vu9DfqGDIkVtY7CS+mn/8y6VlhAfp+/Q2ofuaCWar5Q=; b=JJe3Dwovs1BETu1+0F0S+5UVfL
 /UzcY4Yn/+CTw5SKgLSYI2nQshxbL2JQ3cQl8toOe7qc6EjA00KNzqGOWXiW5OcZc3rKmx57A5CcM
 GMVYtt2n5MShBvDw8a0aXdtN+HHzgCbR5fsGUWo/x4gPxqooczgZqS8jQlkyEQ1xGRHc=;
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNsGV-000Oe7-VV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 09:54:08 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6b9da57da6bso287698a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690192442; x=1690797242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vu9DfqGDIkVtY7CS+mn/8y6VlhAfp+/Q2ofuaCWar5Q=;
 b=kFRqo331OmGZJfFhbnH/oMhF2BfETPvQ8Z7YbmntMqNMabx+WUaRwkUHJLTQs13iZL
 PA8XQGEnPpXzgIpgIlvVS3DjPWj3iyMdQhOk8oIyjY+srM14S8NflRpQ271F4kcbsVjT
 I5LtaYjPELtnfLD6XWluXIT/q7dryc05FunuVdmB2JqqQznM+f+Y35wyucWIuTJtnJT0
 rPQ73cg0inYBpgiit9yZTbamJBfvIuvqgwJCKvVvtCz0ieko1TDO6Mige6FvyWGtl9cP
 Q8taTdFqOo9EogzGsFCeBGOeNrSH+iyBZsOGiQJN9YmaSmnQq5gvF1RC+4kiS30KGwtl
 mipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690192442; x=1690797242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vu9DfqGDIkVtY7CS+mn/8y6VlhAfp+/Q2ofuaCWar5Q=;
 b=AbnEAGnRVDX9D2IpbhXlGtm2YL7s2q9+ipu+ebdxl30cuHeLZiNKPxhUBghMOtCXqO
 GW+Dy7tIish/cBBVL4uP6HwaMOpB4Erx8JkArYZ8ftlRj4PO7NLXlXd+8yYLoby6qKDE
 i8MH+71Ue+du3D+UjpEw/HMtmzUCQq4ajHhTHWn7qpTZIPqt/QOWnCx4fPq89DbKL2v4
 T1HPzn4e6CBS3GLrsj/9xNoq04MOJmLkVGnf5m90oDdC4zleuAPJGL99f9EYir/Cs/fi
 IJaDTqcFSSODq/647FIHdyN6QhfM9S37RZR325NNcsp5jjmVdi2D88/u3FtXkGoOs9mZ
 V1+w==
X-Gm-Message-State: ABy/qLaHsu8xfqQfxQBLzx75PlUh5jXk7Pf/YCnKCqvpz28Wy6HaOA7v
 Im3Qpz4CRZk0HxmXFFdCRNZrm7MIZlHn5pGVDYM=
X-Google-Smtp-Source: APBJJlGrsdFKJ71ukJT79kDa1W+M4ztJszdSUa3mf2ArYfnWEb5YwD/wtpSbLXe4wEi7ibAUftTBwg==
X-Received: by 2002:a17:902:ecd2:b0:1b8:b4f6:1327 with SMTP id
 a18-20020a170902ecd200b001b8b4f61327mr12288935plh.6.1690191966684; 
 Mon, 24 Jul 2023 02:46:06 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:46:06 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:12 +0800
Message-Id: <20230724094354.90817-6-zhengqi.arch@bytedance.com>
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
 Content preview: Use new APIs to dynamically allocate the android-binder
 shrinker.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> ---
 drivers/android/binder_alloc.c
 | 31 +++++++++++++++++++ 1 file changed, 19 insertions(+), 12 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.42 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qNsGV-000Oe7-VV
Subject: [f2fs-dev] [PATCH v2 05/47] binder: dynamically allocate the
 android-binder shrinker
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

Use new APIs to dynamically allocate the android-binder shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/android/binder_alloc.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index e3db8297095a..019981d65e1e 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -1053,11 +1053,7 @@ binder_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 			    NULL, sc->nr_to_scan);
 }
 
-static struct shrinker binder_shrinker = {
-	.count_objects = binder_shrink_count,
-	.scan_objects = binder_shrink_scan,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *binder_shrinker;
 
 /**
  * binder_alloc_init() - called by binder_open() for per-proc initialization
@@ -1077,19 +1073,30 @@ void binder_alloc_init(struct binder_alloc *alloc)
 
 int binder_alloc_shrinker_init(void)
 {
-	int ret = list_lru_init(&binder_alloc_lru);
+	int ret;
 
-	if (ret == 0) {
-		ret = register_shrinker(&binder_shrinker, "android-binder");
-		if (ret)
-			list_lru_destroy(&binder_alloc_lru);
+	ret = list_lru_init(&binder_alloc_lru);
+	if (ret)
+		return ret;
+
+	binder_shrinker = shrinker_alloc(0, "android-binder");
+	if (!binder_shrinker) {
+		list_lru_destroy(&binder_alloc_lru);
+		return -ENOMEM;
 	}
-	return ret;
+
+	binder_shrinker->count_objects = binder_shrink_count;
+	binder_shrinker->scan_objects = binder_shrink_scan;
+	binder_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(binder_shrinker);
+
+	return 0;
 }
 
 void binder_alloc_shrinker_exit(void)
 {
-	unregister_shrinker(&binder_shrinker);
+	shrinker_unregister(binder_shrinker);
 	list_lru_destroy(&binder_alloc_lru);
 }
 
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
