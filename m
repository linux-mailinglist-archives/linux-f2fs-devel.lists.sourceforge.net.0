Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9962F771FDA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 13:12:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSyAA-0003yM-QP;
	Mon, 07 Aug 2023 11:12:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qSyAA-0003yF-En
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y2Zq84YPu5W9umXtWflPPzaPyFOqe/t1tbhlrQuOI+E=; b=iGF+Tury+WZSEpLsoP6jVNSyKE
 l69wCd8AfgvtYJcq8DP3E8jY8jB1X4ezG8JN3zach4E6fzu6ronR4E2mkLiitY+Ip8AzCKdXN81Wl
 QJuLhGYNZd0qqxygrL/il1Z5DVEbtuZJI5i32CDSsZ8Ef7ZyFfKP90E0eygROEWp61u8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y2Zq84YPu5W9umXtWflPPzaPyFOqe/t1tbhlrQuOI+E=; b=jcpH2KpffEogDy9Z3z9J3LZCFm
 wB88ut7bcZ98OU7YReX98YSIPRfy1NadqYiQB54dfzlWp3lbrFkVrALBGITgLJxis6t52jWYv7+DJ
 O5R4LbDMkCzhV8iL52vMZJD2FfUdMK3wpCmNVRObSD17zGZdxUKCK92ATniubNQClHf4=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qSyA9-00FrbN-4N for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:12:38 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-268f6ba57b5so624104a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Aug 2023 04:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1691406751; x=1692011551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y2Zq84YPu5W9umXtWflPPzaPyFOqe/t1tbhlrQuOI+E=;
 b=Y3Gw/8I9wjDIixxDLIQ9R5eAEihH4V5EOGMa/tEQP2UVJcVR6XKMsoq0kNQA9Anemf
 f07XdP3K3VTdRiql0M+klRK3bCLbXjjp+xplnI9SAQQIK1LQ+ZTQ4iN7KAzzTyuvBW+2
 22vOneIjM2lcCre/t1Mc8DL07qt3h0LYO3V6dBXrNJ+ZsacS8/3b5gEWrOt6ylq3sp75
 +tN/NsYby1EhnscHKGVaTQLZ5Bd9+GL+XZMM1MIKbWLpVeAc6COrlmvCwmGvjTVu68WR
 OgVgTRpqhZcRZgjQYAuUYTgXANtTE72/EYkbNkp+iXkkiBUoh7hJkggb0sVF4vx/kVZQ
 USbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691406751; x=1692011551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y2Zq84YPu5W9umXtWflPPzaPyFOqe/t1tbhlrQuOI+E=;
 b=VjMccw7pg0lHStS4FpyKoyzLjOUfleOOQwTX+jYluM/TMcETHkzNQ9khea37d5c7dw
 d46M091pw+xkfB3jZo1awL8rJyhYV/ln44tTYPWoATlTOP0E1onZSfGRuraeuW4y8SXz
 +TQbcfMg1cexX+vHIqJVNVM1hyTll8a6+M4pk6v3FnwdwWuhmAbyrOe4d3ex4Vrkyama
 SX3qgM9tcFO6/fF5ddMU4ClMoZZvvYvCcxBAMARWHnaRAxgrjJx4N0kDmSmFqEYV8Gl0
 CsfPxJlopy3zG4f7C6fGcgq155jGpCmqwo++Y1t71nAIQ1zHvUMByF3iRPWlmVK7GNCP
 ukKQ==
X-Gm-Message-State: ABy/qLZ8j6ibPRO6EqydowAYbAhnUXSO/4w7XD0dqgUcHwOBOhGU0zQB
 kCkgj/TNe5cklLq0j/UnPUmL3w==
X-Google-Smtp-Source: APBJJlFA47zqmiKwpfw7q81pKFEqmAkA29wiqRNlMoLoIZqzioc4qMsA62pUfPaD7HBA/F0aUxQzvA==
X-Received: by 2002:a17:90a:6c97:b0:263:730b:f568 with SMTP id
 y23-20020a17090a6c9700b00263730bf568mr23062652pjj.3.1691406750926; 
 Mon, 07 Aug 2023 04:12:30 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:12:30 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 simon.horman@corigine.com, dlemoal@kernel.org
Date: Mon,  7 Aug 2023 19:09:00 +0800
Message-Id: <20230807110936.21819-13-zhengqi.arch@bytedance.com>
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
 Content preview:  Use new APIs to dynamically allocate the gfs2-qd shrinker.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> --- fs/gfs2/main.c |
 6 +++--- fs/gfs2/quota.c | 26 ++++++++++++++++++++------ fs/gfs2/quota.h
 | 3 ++- 3 files changed, 25 insertions(+), 10 deletio [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qSyA9-00FrbN-4N
Subject: [f2fs-dev] [PATCH v4 12/48] gfs2: dynamically allocate the gfs2-qd
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
index 632806c5ed67..d1e4d8ab8fa1 100644
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
+int __init gfs2_qd_shrinker_init(void)
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
+	shrinker_free(gfs2_qd_shrinker);
+}
 
 static u64 qd2index(struct gfs2_quota_data *qd)
 {
diff --git a/fs/gfs2/quota.h b/fs/gfs2/quota.h
index 21ada332d555..f0d54dcbbc75 100644
--- a/fs/gfs2/quota.h
+++ b/fs/gfs2/quota.h
@@ -59,7 +59,8 @@ static inline int gfs2_quota_lock_check(struct gfs2_inode *ip,
 }
 
 extern const struct quotactl_ops gfs2_quotactl_ops;
-extern struct shrinker gfs2_qd_shrinker;
+int __init gfs2_qd_shrinker_init(void);
+void gfs2_qd_shrinker_exit(void);
 extern struct list_lru gfs2_qd_lru;
 extern void __init gfs2_quota_hash_init(void);
 
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
