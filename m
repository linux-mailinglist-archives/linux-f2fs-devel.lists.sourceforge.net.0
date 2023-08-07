Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD00771F75
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 13:10:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSy8I-0003sM-Gs;
	Mon, 07 Aug 2023 11:10:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qSy8H-0003sF-G8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v13l7IPlOPgFsnMxGKXfyNRR5BVZeBzBNEaAsOIHoYU=; b=DTFsAEH6Nfnag7AjEkcYj4xF9q
 IMI2G5e5Q3TrAV4fviPtmvj6cwI4UId0EBjciVdiOIijTdFaSG88b60lCBD0rWsG+VKNcxWsRn7ua
 oh1BUMcZREE++reNjtKVUfWoYGMH88UePohsJ5QO5Ot4IBayRq3bl+oT/hDKPb+34GQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v13l7IPlOPgFsnMxGKXfyNRR5BVZeBzBNEaAsOIHoYU=; b=HIYqAy1oAuGYgdF07iIwfw3o1V
 y63hpQIoigR103n+xv3uQqNEvDrEMRcpesFFLHbCdVtIfhtyTjafvX+W/sjhh8s8v447PaV9nCnHy
 N9mcivfjIl7gKpntGxkUflPPt/aAWpq2L600yeDg9mKa72co8QYPc94aRnbnLyNVRKWY=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qSy8G-00FrVV-Qv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:10:41 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-265c94064b8so592310a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Aug 2023 04:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1691406635; x=1692011435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v13l7IPlOPgFsnMxGKXfyNRR5BVZeBzBNEaAsOIHoYU=;
 b=kCYTaRcfjrYSEt8G3Tw1f1acTO5J6yxn7oF0SsGLa85MduwVEgH5omvSEO969tp3LA
 wpvSUu2A7//qJL2ilMqNB9PtHKQAFVNRC9oXX6TEGsUMhNv4mOxpl2C1YAZnVZpulCYe
 yLDYKwIJ4bAvkX2QuqtJJDYUJRh6vr19t7PfH+lhQ++ji8JDwdveN3FzqnpipfKLqAIG
 dvafeOsYb5J4XciY9gtlA1gSl238AIRfFhWaOJMr5WdeT5BLHH+Cl6s3+MJ/6Htxm+Cq
 sbYQtf3+i0mELZ2fQ4kGZP1NFS47ge8l8Znqj7GoIxgmAjgbPULzYpOui4TUq64XmvYi
 qgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691406635; x=1692011435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v13l7IPlOPgFsnMxGKXfyNRR5BVZeBzBNEaAsOIHoYU=;
 b=cE3vqNcG1BzaEBSOJ4G8XJRv8LlcksQciCsNQGNSddKeLouNs/7CoDMMfAMwIv3ai0
 ayXlWvYZvy6le/h1iY2IsJvZ+pjfWmu8ipeJxBnv920b+I7ewm8o767NeMcDkFPaOR2/
 pT52RwpsKC1OrtQSaDIo5QDtPGxvgK3SnzvAW3Gxex8EHVtxriC8ki3j4YTY0yoChyXI
 XTBV0UT8lF6YLfoFdGaG278iMJjBuZuTcDEq26BsupiSfdSHeFPKoDCrkmM7hKgNAd4p
 Qbuej7197xbV896CwFGoZ8aaMUT0E1ikl1GKlDQ3h9VUs0EXDSI0r2QAiALZYg79L2vl
 RdUg==
X-Gm-Message-State: AOJu0YyBCqaaB9mYhNNoIorOD9lEhjMNoPh+Sijkut53U/9TxLWrCjBG
 WC4+PC+Ws9GqZrd1jLX4MjhuLg==
X-Google-Smtp-Source: AGHT+IFtRmyHpiiF2qszY30g7vYVkD2mnACy5d4vfrtyjmwLjyswWFf77Xamslud93nGDOipc3oAlA==
X-Received: by 2002:a17:90a:69c4:b0:269:34a6:d4ca with SMTP id
 s62-20020a17090a69c400b0026934a6d4camr6363728pjj.0.1691406635181; 
 Mon, 07 Aug 2023 04:10:35 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:10:34 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 simon.horman@corigine.com, dlemoal@kernel.org
Date: Mon,  7 Aug 2023 19:08:51 +0800
Message-Id: <20230807110936.21819-4-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The debugfs_remove_recursive() will wait for
 debugfs_file_put()
 to return, so the shrinker will not be freed when doing debugfs operations
 (such as shrinker_debugfs_count_show() and shrinker_debugfs_s [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.46 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qSy8G-00FrVV-Qv
Subject: [f2fs-dev] [PATCH v4 03/48] mm: shrinker: remove redundant
 shrinker_rwsem in debugfs operations
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

The debugfs_remove_recursive() will wait for debugfs_file_put() to return,
so the shrinker will not be freed when doing debugfs operations (such as
shrinker_debugfs_count_show() and shrinker_debugfs_scan_write()), so there
is no need to hold shrinker_rwsem during debugfs operations.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/shrinker_debug.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
index 3ab53fad8876..61702bdc1af4 100644
--- a/mm/shrinker_debug.c
+++ b/mm/shrinker_debug.c
@@ -49,17 +49,12 @@ static int shrinker_debugfs_count_show(struct seq_file *m, void *v)
 	struct mem_cgroup *memcg;
 	unsigned long total;
 	bool memcg_aware;
-	int ret, nid;
+	int ret = 0, nid;
 
 	count_per_node = kcalloc(nr_node_ids, sizeof(unsigned long), GFP_KERNEL);
 	if (!count_per_node)
 		return -ENOMEM;
 
-	ret = down_read_killable(&shrinker_rwsem);
-	if (ret) {
-		kfree(count_per_node);
-		return ret;
-	}
 	rcu_read_lock();
 
 	memcg_aware = shrinker->flags & SHRINKER_MEMCG_AWARE;
@@ -92,7 +87,6 @@ static int shrinker_debugfs_count_show(struct seq_file *m, void *v)
 	} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)) != NULL);
 
 	rcu_read_unlock();
-	up_read(&shrinker_rwsem);
 
 	kfree(count_per_node);
 	return ret;
@@ -117,7 +111,6 @@ static ssize_t shrinker_debugfs_scan_write(struct file *file,
 	struct mem_cgroup *memcg = NULL;
 	int nid;
 	char kbuf[72];
-	ssize_t ret;
 
 	read_len = size < (sizeof(kbuf) - 1) ? size : (sizeof(kbuf) - 1);
 	if (copy_from_user(kbuf, buf, read_len))
@@ -146,12 +139,6 @@ static ssize_t shrinker_debugfs_scan_write(struct file *file,
 		return -EINVAL;
 	}
 
-	ret = down_read_killable(&shrinker_rwsem);
-	if (ret) {
-		mem_cgroup_put(memcg);
-		return ret;
-	}
-
 	sc.nid = nid;
 	sc.memcg = memcg;
 	sc.nr_to_scan = nr_to_scan;
@@ -159,7 +146,6 @@ static ssize_t shrinker_debugfs_scan_write(struct file *file,
 
 	shrinker->scan_objects(shrinker, &sc);
 
-	up_read(&shrinker_rwsem);
 	mem_cgroup_put(memcg);
 
 	return size;
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
