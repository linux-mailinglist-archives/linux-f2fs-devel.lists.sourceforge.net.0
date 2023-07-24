Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 729C375F27A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 12:15:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNsaz-0000r3-8b;
	Mon, 24 Jul 2023 10:15:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNsat-0000qp-ET
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TtWMuwNQICElQwN/uI+F3WL3CTikAs+Dtp5goHq/uX4=; b=l3vcPPLYC0t5LTHpjoBmUc2+z1
 iA57hT1WFNLTzZAuec5OiztYVrUjh8G64vOegmKMUqf7ko5QPxzvW8se/JX6+5eisNRSgl0lhyDSw
 eL58Nf4oFcu3RQnqs/3/vd0+d0j/odvXFMFsu7ob+mI8KhFPQry27sIickUBOYAmk5sA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TtWMuwNQICElQwN/uI+F3WL3CTikAs+Dtp5goHq/uX4=; b=abk/pZPcm70gFD2etFJrriwC0q
 VOKhkfNSUAjj+d3Ua8xDhJhRUe4hGoOEIljGT7dx0z7o8K7MAmmEo5ZjFwZjE4flmyrseVer7XMBk
 YcsVeplQxdxhdGkwZLXzBykxBNTbZ8l1Wl0uUVixn+HHVchFFeWyQt7tBM1NupB8vA8U=;
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNsap-000Ppx-Pg for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:15:11 +0000
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3a3ee866e00so392187b6e.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 03:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690193701; x=1690798501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TtWMuwNQICElQwN/uI+F3WL3CTikAs+Dtp5goHq/uX4=;
 b=DzwTUQ8dtHMn0uPlhEX4It9PP69gB/GZVM+bv9dLj+l1QDmtHRhZEcWPa2fVohg4OF
 ztbUOqqreaVrpbGBHVkkAmQJ9xyuQFkGG0niRMgwzsLaqVuqFgHU0kasHKNsn4TOi8Qo
 L6IjS64vASpycedWJSTv5CTbij3p8ouzdDKZyMTDKBA0RgN575Ms/Hp21aH0AvgVqlV+
 SEKtU00uEM5m/GdNKsaxVL2VfeN8PQyWQtwFFV5/HOBYCtbZzN0ZdzXdooW52YwSXkd4
 vDdj513OgjZO2CmKfLPiiaAo/AIHuzgVGKhgEj9bYEVzpkKJ3+BwR+NLB/KhaFvlMqQM
 LS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690193701; x=1690798501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TtWMuwNQICElQwN/uI+F3WL3CTikAs+Dtp5goHq/uX4=;
 b=KzN98bON2vpzQSLIp6oo95mxvZywa1i1wwIy0hRYwFwizUR/U9mqFzQs9cxdC4Uc4U
 S32sFP7sy+/L3+CXVFh7P6Vn/k+7wgc/p55K/c1vQKDeLV77wAavv+Qrf6+DqzaGjLrp
 W+gFXxiTw1x6JuXXd7S95+pV/q3SwA45yNDnlCqS7MgeuF45qi9jO0Ylb3gcDcNivhCq
 w3q00oOzL47rpi1Hy+iQDb4Q7Nen3JrEnE72BGDQDaOqfDaaY+RwcqYV2nZnv3QHFyot
 ljUIuNMGT8aS9f0fe7eWiwRE8utpp85U2tnqbTQWeLciIDKKJyCH9UHn/+QiFkHugJ9u
 RnGg==
X-Gm-Message-State: ABy/qLZfjeQ1fMUoR+zbkpr/mi9IsnivWg3D32YBMQvn0oJxhvB4qLBQ
 S1oTxYuySE8thVybP/4cFpIq0ATm+rYhR0HD6JI=
X-Google-Smtp-Source: APBJJlE4z/oQr/nYJvsLLx4ZH1UH5CYL5idBHg9QqjGajgFE/t5dphI4tPFsRKn6N/RjSu5tdTiopA==
X-Received: by 2002:a17:902:ecd2:b0:1b8:b4f6:1327 with SMTP id
 a18-20020a170902ecd200b001b8b4f61327mr12289687plh.6.1690191990533; 
 Mon, 24 Jul 2023 02:46:30 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:46:30 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:14 +0800
Message-Id: <20230724094354.90817-8-zhengqi.arch@bytedance.com>
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
 Content preview: Use new APIs to dynamically allocate the xen-backend
 shrinker.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> ---
 drivers/xen/xenbus/xenbus_probe_backend.c
 | 17 +++++++++++------ 1 file changed, 11 insertions(+), 6 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.178 listed in list.dnswl.org]
X-Headers-End: 1qNsap-000Ppx-Pg
Subject: [f2fs-dev] [PATCH v2 07/47] xenbus/backend: dynamically allocate
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
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use new APIs to dynamically allocate the xen-backend shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/xen/xenbus/xenbus_probe_backend.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe_backend.c b/drivers/xen/xenbus/xenbus_probe_backend.c
index da96c260e26b..b4c3cf27af30 100644
--- a/drivers/xen/xenbus/xenbus_probe_backend.c
+++ b/drivers/xen/xenbus/xenbus_probe_backend.c
@@ -284,10 +284,7 @@ static unsigned long backend_shrink_memory_count(struct shrinker *shrinker,
 	return 0;
 }
 
-static struct shrinker backend_memory_shrinker = {
-	.count_objects = backend_shrink_memory_count,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *backend_memory_shrinker;
 
 static int __init xenbus_probe_backend_init(void)
 {
@@ -305,8 +302,16 @@ static int __init xenbus_probe_backend_init(void)
 
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
