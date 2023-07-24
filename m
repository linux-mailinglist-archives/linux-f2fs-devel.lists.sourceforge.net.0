Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5746975EF77
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 11:45:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNs8L-0006jh-Jw;
	Mon, 24 Jul 2023 09:45:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNs8J-0006jb-I1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 09:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ewD/GNBDsb9emQZc+crYJJhL9Ok7DRtPygkZmojk224=; b=YdMu+bsWtFdEUzBIehH9eOga/c
 9wAl7pJwDM+jZEsK5pE6O5M3qO1DL9sORKqpQsTWqtRHriEmh/PLeVrGeCpYdytu6sMZP98EzPNut
 a/r+M+UqpbhQLwg9KzJpmk60tVm28dSI/O1m7qU5bId53bwBlGqZwTrcSDV0PCkdvKnI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ewD/GNBDsb9emQZc+crYJJhL9Ok7DRtPygkZmojk224=; b=bIkRwvucpa7mFjLVs3secafsqJ
 VO/QFcmAq4M8kLYVWAQUYeOtqzlxajLikfn5GhDcev3+u59aScZkKQ0/HCJLjeXRHYFaRgjEsX9GA
 bhhp3mZs1YOozrGYiZ9YIfK98POlh6RP15QTu2AL5nyGIab3BvRZ3CaPwxb81BNjUdIo=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNs8G-000OIH-Ck for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 09:45:38 +0000
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-682eef7d752so1027589b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 02:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690191931; x=1690796731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ewD/GNBDsb9emQZc+crYJJhL9Ok7DRtPygkZmojk224=;
 b=DyvUb16iFXGbECeKR4Jj5b9Aqu7GqNXEePNkHat23I7b1VL4ke9XL7AFF21PJI8D03
 dadzrjq6WC5mtymsIwcgysKxt2IeQhVQYSg0yzEciG/3J3jMvvonWrabgIjT5cyrH4U0
 K1NmdQ2LZEMZR3X0ctjhZi8pkjfdY6FiANez7gH72dxDBt7t+C7AalBczQoExmv/leVd
 sjx5yitsqqA/ZPm80lkfCIhjuAfvEuRwNIJ4RlVw9F2GYFjyskW1Ygf/DVx+iz0W5Dlm
 41zeCUlShQCZl1UPIlyRzbY5fG4LbR2jBKDZp6zvisQp1bayYn113SLSSif4m+cEaf+t
 mhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690191931; x=1690796731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ewD/GNBDsb9emQZc+crYJJhL9Ok7DRtPygkZmojk224=;
 b=dvaRRr1SaaHbOdXxsJO/ptuHSdaMLNG1fXL4JUyiMXZKXJwXmh2n13Z/8J3pB/9DG3
 Tlk1ck2FNmVbg+Li8vLSTXnd4LxlqaVU+FhoEInhLov0RyJMrY/XiBf77vmSYDA6LmdX
 UweHuOVgAVnJnSzlCeq0lIrwZWWItE88RrX2nIm34p3m2mzD9MBv/IEj+mwtEGK/aq0u
 4Bb3QSETWjDfRnZoFiwxUB3vkb8t5Y5r2fgRE8pQo7Xjvkw0L5Pfnw6flaktPQa/blwt
 UD7xcUuU/D9DUHRopnkzppqJvI0ysy8nlTDjtTmpoSM4eGxyjIq10dHBM71wvw6XGmxP
 CV9w==
X-Gm-Message-State: ABy/qLbKPdnxL5etRXk4AMh4NCUOB2AsSBJpKXwz38EgYLgRfLDo6EuU
 U0BC0Cr8bBWXiX9YCrd8nNE16w==
X-Google-Smtp-Source: APBJJlF4hVHTEAcnrryQeIsWufK3e63a7rX2g1OMpnBMufUIHv2BcOagu97Dc7evIwstimu7xBX17w==
X-Received: by 2002:a17:902:e849:b0:1b8:35fa:cdcc with SMTP id
 t9-20020a170902e84900b001b835facdccmr12688015plg.5.1690191930816; 
 Mon, 24 Jul 2023 02:45:30 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:45:30 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:09 +0800
Message-Id: <20230724094354.90817-3-zhengqi.arch@bytedance.com>
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
 Content preview: The debugfs_remove_recursive() will wait for
 debugfs_file_put()
 to return, so the shrinker will not be freed when doing debugfs operations
 (such as shrinker_debugfs_count_show() and shrinker_debugfs_s [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qNs8G-000OIH-Ck
Subject: [f2fs-dev] [PATCH v2 02/47] mm: shrinker: remove redundant
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
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
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
---
 mm/shrinker_debug.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
index 3ab53fad8876..f1becfd45853 100644
--- a/mm/shrinker_debug.c
+++ b/mm/shrinker_debug.c
@@ -55,11 +55,6 @@ static int shrinker_debugfs_count_show(struct seq_file *m, void *v)
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
