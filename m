Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D90F75F2B3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 12:18:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNseW-0008P2-3H;
	Mon, 24 Jul 2023 10:18:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNseU-0008OV-KC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UBNhxmwoWFukUMFCa6L5K1ksS1zA9QvfN1MSwW+LOvg=; b=YgxzRwwADnisj//jjWPy3mKLKp
 2IPNLHcIUjckPTFSu+8FZghmHFfIa5dDs+26xLZerpSpoaRDyT/bCVYI51gpA/72n58RMA93Z/H5m
 9IXSxi1fgbXNCvaHaSi5jnGo0F/VjDqOOG9JOnDhrd7KYcSrvPTHdmviBqg9stUekfrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UBNhxmwoWFukUMFCa6L5K1ksS1zA9QvfN1MSwW+LOvg=; b=ILVJHFEijct7GddiAgq4Jl18Ee
 OtoT2CpIdVql6jN1bBQw7zX3zaaxUwVtX22blnpveCUeZG1wk0/2PoH4mSSZwht+zusu8bOth0ADo
 2US9YHOK2hIquvDqOaKDrpDMMVwY8tOgz9zNUraeFlztFPTz/5H64L0CQm5+XNTWlwdM=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNseO-0004ua-4d for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:18:51 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1bb85ed352bso2296175ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690193922; x=1690798722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UBNhxmwoWFukUMFCa6L5K1ksS1zA9QvfN1MSwW+LOvg=;
 b=QOZbBNwI9Vx2O1zGxjRv9l5miRHeFKSOXwGdDaiCv5dRgr6vV6t9LE0AAJgmhn/EHl
 PNSl5+MZ61X26FPRRtE0MsLO0333KmQRE4vPrHIYpe2yXUIl2rwOhiwYu88+LoR5TkZi
 dBRUSco28wX71bLxG6K0WsU6qetI0j70ksplc2EXEdaTrdU6J0DInQw74O1hOvKWkWTm
 myC5Q2YhPSetqfgt/RF54M3m3FMMCpfEDyT6JbBFLRZgmcdJr8hYQV/Jt4Bdp7JDZn1E
 4QUJxMdY+paUlZzT08s4gNXWEI7Jza7vgWJr64vZih+lvC3nb/fYUKmC3bxkgktB3XGE
 hciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690193922; x=1690798722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UBNhxmwoWFukUMFCa6L5K1ksS1zA9QvfN1MSwW+LOvg=;
 b=MX0hGuVpP5zIPgjOuINB2BmXf4PP2h1mkN89H+Ojq9YWj6lY2hM58oGd6TxFQmjhuq
 tKb3bTA5BgQSlhDAF0EiGB4a4aWB90M/StUZyBjlinBn7FBFjVBljpRnniNZKixHRGZx
 PxXczC3egV7e3SbzHeGD2+Wvy9dj1XSPba3h1ad0D5d0evJqqwH+IUWdWI7G9d24enxr
 Tp515IskMH8Co+hg77ZkcbYMmxWAcM7BuYFAvb9lmqGeDmOP40bsyC6WHCPC0pg4xgt4
 KJLuB0Hui79/lcdmbo6MQhzwK2LFIH6m52B0JrShjQW/O2AWE5UPUOhB28Rux1zWQxz5
 jVcA==
X-Gm-Message-State: ABy/qLbZjfbWGl/mlsP05VQ4yc67pyL0eR00cQlfVHhbGafxH8R01Vbr
 DBZFGQ6NU9776jkdhrQXENasx/y6Wj3rfTkNp6E=
X-Google-Smtp-Source: APBJJlF/3KLtCT6eHhEfIce84TGjlwCK5paHy95Ixo7dnPUARJYmTi5EEMpBHN4EFiKTP+Yjoiy13g==
X-Received: by 2002:a17:903:24f:b0:1b8:ac61:ffcd with SMTP id
 j15-20020a170903024f00b001b8ac61ffcdmr12333562plh.3.1690192038795; 
 Mon, 24 Jul 2023 02:47:18 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:47:18 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:18 +0800
Message-Id: <20230724094354.90817-12-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use new APIs to dynamically allocate the gfs2-qd shrinker.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> --- fs/gfs2/main.c |
 6 +++--- fs/gfs2/quota.c | 26 ++++++++++++++++++++------ fs/gfs2/quota.h
 | 3 ++- 3 files changed, 25 insertions(+), 10 deletio [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qNseO-0004ua-4d
Subject: [f2fs-dev] [PATCH v2 11/47] gfs2: dynamically allocate the gfs2-qd
 shrinker
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

Use new APIs to dynamically allocate the gfs2-qd shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/gfs2/main.c  |  6 +++---
 fs/gfs2/quota.c | 26 ++++++++++++++++++++------
 fs/gfs2/quota.h |  3 ++-
 3 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
index afcb32854f14..e47b1cc79f59 100644
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@ -147,7 +147,7 @@ static int __init init_gfs2_fs(void)
 	if (!gfs2_trans_cachep)
 		goto fail_cachep8;
 
-	error = register_shrinker(&gfs2_qd_shrinker, "gfs2-qd");
+	error = gfs2_qd_shrinker_init();
 	if (error)
 		goto fail_shrinker;
 
@@ -196,7 +196,7 @@ static int __init init_gfs2_fs(void)
 fail_wq2:
 	destroy_workqueue(gfs_recovery_wq);
 fail_wq1:
-	unregister_shrinker(&gfs2_qd_shrinker);
+	gfs2_qd_shrinker_exit();
 fail_shrinker:
 	kmem_cache_destroy(gfs2_trans_cachep);
 fail_cachep8:
@@ -229,7 +229,7 @@ static int __init init_gfs2_fs(void)
 
 static void __exit exit_gfs2_fs(void)
 {
-	unregister_shrinker(&gfs2_qd_shrinker);
+	gfs2_qd_shrinker_exit();
 	gfs2_glock_exit();
 	gfs2_unregister_debugfs();
 	unregister_filesystem(&gfs2_fs_type);
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 704192b73605..bc9883cea847 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -186,13 +186,27 @@ static unsigned long gfs2_qd_shrink_count(struct shrinker *shrink,
 	return vfs_pressure_ratio(list_lru_shrink_count(&gfs2_qd_lru, sc));
 }
 
-struct shrinker gfs2_qd_shrinker = {
-	.count_objects = gfs2_qd_shrink_count,
-	.scan_objects = gfs2_qd_shrink_scan,
-	.seeks = DEFAULT_SEEKS,
-	.flags = SHRINKER_NUMA_AWARE,
-};
+static struct shrinker *gfs2_qd_shrinker;
+
+int gfs2_qd_shrinker_init(void)
+{
+	gfs2_qd_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "gfs2-qd");
+	if (!gfs2_qd_shrinker)
+		return -ENOMEM;
+
+	gfs2_qd_shrinker->count_objects = gfs2_qd_shrink_count;
+	gfs2_qd_shrinker->scan_objects = gfs2_qd_shrink_scan;
+	gfs2_qd_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(gfs2_qd_shrinker);
 
+	return 0;
+}
+
+void gfs2_qd_shrinker_exit(void)
+{
+	shrinker_unregister(gfs2_qd_shrinker);
+}
 
 static u64 qd2index(struct gfs2_quota_data *qd)
 {
diff --git a/fs/gfs2/quota.h b/fs/gfs2/quota.h
index 21ada332d555..f9cb863373f7 100644
--- a/fs/gfs2/quota.h
+++ b/fs/gfs2/quota.h
@@ -59,7 +59,8 @@ static inline int gfs2_quota_lock_check(struct gfs2_inode *ip,
 }
 
 extern const struct quotactl_ops gfs2_quotactl_ops;
-extern struct shrinker gfs2_qd_shrinker;
+int gfs2_qd_shrinker_init(void);
+void gfs2_qd_shrinker_exit(void);
 extern struct list_lru gfs2_qd_lru;
 extern void __init gfs2_quota_hash_init(void);
 
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
