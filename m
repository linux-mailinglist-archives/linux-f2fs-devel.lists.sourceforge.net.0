Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6478C771FB0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 13:11:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSy9P-0001qh-5y;
	Mon, 07 Aug 2023 11:11:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qSy9M-0001qV-I5
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bO4yc6b0222dRNj48HoFyPuU9QjRVolFKKVhhMGpLKw=; b=hb4pRAeJa7Mk2rm3qJFHLY1R54
 L24zVLwmkcO5tifWXz0iPos00RuYG3vUdY9txBI7+zqtSbRSWVQamEkVcRnUpLY1o3my4X3uEOpe1
 bGr875cAYAsBsjJx2G31IiemScB2DzLRKosaU5g8OX9xSQtt1eDIif/4seDzC8rKfBR4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bO4yc6b0222dRNj48HoFyPuU9QjRVolFKKVhhMGpLKw=; b=ReGAg4s38IemVjfUniXx6OGBB1
 AxKQin6ahGt8Hgo3CTTCNPw9+5xDHHh3WssZNJeVWuvsizjoLJERiE2sB7DXSdqiDTsDdyrx4pI3N
 2sgAfz8pWo0uHfy/gh5WVgcDKjan42wq0XpGk92ty041rF5MB7ReRP+LWwFUXkGVykpM=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qSy9J-0007hF-Df for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:11:49 +0000
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-5643140aa5fso525259a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Aug 2023 04:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1691406698; x=1692011498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bO4yc6b0222dRNj48HoFyPuU9QjRVolFKKVhhMGpLKw=;
 b=V+0c3qPhJ3OvHdRK0zt0jjicV8eIk4mcEJBfZa3lpQkwu54lWNVPIEieS4PtRydxoC
 SOQosWaNmtA5ijvBvBTHzjmbD0d0j9BAeGMmaW/jH6uvD6Ej2n/njXM3uIqGlzrBkh1f
 4pNHqPhVUKAnLp7tAzH1vcGObvmfuMOiL8NrO6wDjhRhzYUa1svLTbbXU3r4juxNC7M+
 zvZ3SM7T/9w0Je9dQGJ4Z6qlkuAYn1bir+6JxlC1Qr6arztdDyFiMoqBolNxM3VBbd9i
 jsX4xXrnwmvTP/fkwCWNcOiK6G4rP96fjoeNSyiOnE04LmSKfInS+5dfsRm42DUoM8bY
 LffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691406698; x=1692011498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bO4yc6b0222dRNj48HoFyPuU9QjRVolFKKVhhMGpLKw=;
 b=H/OGCq44U2qZnUah/vOevgZ6dqgM3JaaDctYP2o4QxpX6uMUMyRnl1Z/OOSoSNliA2
 qCkq6V+mhNDuvDVzyejjtpq6lXeKLfOgT8grxYt/1EgCHe+CmNozgvmfbL3bkazJ8b19
 7K+v0YiI4J0bEIVeJ7RNQeCUqq4AkmuMFYaJae6q5EM+PY9hfRBQ4PTwwM1w3Rw+LepP
 d09aesGHt5ewnnLuAagpHGEL+J+7uI9bn1hCb/czGVTNynpRYlqoEyZymZfE8sixnKaP
 3b7zaaTHJYQv+vLpXMZJUj909EJi6rTvxaicy4qBw/yrOO65JOj/p+MTNq2RIZczqqgh
 LgUw==
X-Gm-Message-State: ABy/qLYJZKDU1h4GBk2myei1aAnhmdPRk/QBjlHRpVcITZ78q4IYkXSm
 7T4LAFcPMIhu8mEoiqPGXkst+A==
X-Google-Smtp-Source: APBJJlHTPEiI4d70NxX2nHst3XkAfiDRggXx1NmGRpA10Zf8iDezZWW8ih32EzxQIqpHPiYHvUOM5w==
X-Received: by 2002:a17:90a:1f83:b0:268:3dc6:f0c5 with SMTP id
 x3-20020a17090a1f8300b002683dc6f0c5mr25027705pja.0.1691406698603; 
 Mon, 07 Aug 2023 04:11:38 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:11:38 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 simon.horman@corigine.com, dlemoal@kernel.org
Date: Mon,  7 Aug 2023 19:08:56 +0800
Message-Id: <20230807110936.21819-9-zhengqi.arch@bytedance.com>
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
 Content preview: Use new APIs to dynamically allocate the xen-backend
 shrinker.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> Reviewed-by: Muchun
 Song <songmuchun@bytedance.com> --- drivers/xen/xenbus/xenbus_probe_backend.c
 | 18 +++++++++++------- 1 file changed, 11 insert [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
X-Headers-End: 1qSy9J-0007hF-Df
Subject: [f2fs-dev] [PATCH v4 08/48] xenbus/backend: dynamically allocate
 the xen-backend shrinker
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

Use new APIs to dynamically allocate the xen-backend shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/xen/xenbus/xenbus_probe_backend.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe_backend.c b/drivers/xen/xenbus/xenbus_probe_backend.c
index da96c260e26b..929c41a5ccee 100644
--- a/drivers/xen/xenbus/xenbus_probe_backend.c
+++ b/drivers/xen/xenbus/xenbus_probe_backend.c
@@ -284,13 +284,9 @@ static unsigned long backend_shrink_memory_count(struct shrinker *shrinker,
 	return 0;
 }
 
-static struct shrinker backend_memory_shrinker = {
-	.count_objects = backend_shrink_memory_count,
-	.seeks = DEFAULT_SEEKS,
-};
-
 static int __init xenbus_probe_backend_init(void)
 {
+	struct shrinker *backend_memory_shrinker;
 	static struct notifier_block xenstore_notifier = {
 		.notifier_call = backend_probe_and_watch
 	};
@@ -305,8 +301,16 @@ static int __init xenbus_probe_backend_init(void)
 
 	register_xenstore_notifier(&xenstore_notifier);
 
-	if (register_shrinker(&backend_memory_shrinker, "xen-backend"))
-		pr_warn("shrinker registration failed\n");
+	backend_memory_shrinker = shrinker_alloc(0, "xen-backend");
+	if (!backend_memory_shrinker) {
+		pr_warn("shrinker allocation failed\n");
+		return 0;
+	}
+
+	backend_memory_shrinker->count_objects = backend_shrink_memory_count;
+	backend_memory_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(backend_memory_shrinker);
 
 	return 0;
 }
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
