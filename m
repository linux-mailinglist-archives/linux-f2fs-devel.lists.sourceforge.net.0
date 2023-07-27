Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F28764A16
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 10:06:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOw1L-00088u-Re;
	Thu, 27 Jul 2023 08:06:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOw1G-00086Q-0N
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ddhCZTkz2TFo7oGCFzg4uU7nrLecafIDKLLill2eh8=; b=mLM6ztMTPpUTSDOkk0k/VbHIed
 hESQ2PEyGvRC0QSEzW7XX9dKK5vfg4vmeFCtWPTf20G7Fgg3goLHzjhBUQRmtgXQVOqIWBd6yHxPC
 THFgQZSEV1zWaZwxX4B2rWDpRPpqje0dIuRI2Ldsb0RTvJhZ23ghhHTA2/b5pDQZU6Jw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5ddhCZTkz2TFo7oGCFzg4uU7nrLecafIDKLLill2eh8=; b=MF0WlKmFSbcyk8Coy7nMTxi2R4
 b4ivvoZfccL5dlOUAUD7US8S9AO9yQC5niCKgkA/GZ8vVK/Fk0BY2ncDtKyvVlboAwIIWd3Ue+CNs
 nI9Ccg3s8RARu2yQ8yzgkBShQOT4jzCRnbd8OdW2wqkUS0btByTrJ/byrLjkqTi5mumU=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOw1C-004LMF-5S for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:06:46 +0000
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-6862d4a1376so188277b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jul 2023 01:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445196; x=1691049996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ddhCZTkz2TFo7oGCFzg4uU7nrLecafIDKLLill2eh8=;
 b=EEgKRQyP19rDGzyMkxrAyrND65/av9N1ZEpraFKdjf5iHd/PgC9Uhy/xnwzeo3ff8l
 m3TJD5UzpvFEDeBzcRtJtOD/qHmmEUSLFJuussVMd7PAkAK7iQKGftfC2f44nNeUEfJr
 mKle0CkHpRLYz5sWKpGW6Zb4t5WjMo/pANabwTgogYiGmsOD2+fKJGiw7ZJ36fC4jq2K
 1KqECLKCfE0K//MR+hlNLb+3ZgY7viYlU4DaknQaSi+VFe2dV+fDBnzCaNkdmNFv1cVa
 f6nuMbduVm+LsREYRbVVclCckYchB0Qi+6OZAWegvIeaDdeHomKe1HhIBSolAxF7uDUX
 dSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445196; x=1691049996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ddhCZTkz2TFo7oGCFzg4uU7nrLecafIDKLLill2eh8=;
 b=NhvZcYy8PG+8pUvtOhS2CODb3YDkLK9z/YW3k2F3/X8J7lAUwWwBAEAxFKnItqlaOI
 S/vqv31/gXrVZAEwUWglDJaHsuwmjmA8dB05Htft0PKZWCe+6H5s8jNCHJoiqm19tzqX
 z1tw73SC3QFsfwjhyGRbG2sWHEi7waqOnqOXaWsWVzixIZfwOA0E73APWcZuNRkWZTcy
 L5CZ0OPgPwZMbSOM58fhTHku0CNKbkuz63NvAX6v5CZCwElJ5lwm6VWe1dSR6EJiINV/
 1dcqQbHx0dwzDhikLRYZNjamFzM6GZNlrBYRqFf3IBDxHCJj8obUTkuWoMl2DzXBMw+y
 bhYw==
X-Gm-Message-State: ABy/qLYQGmknLUIvM7v02G8ubF1FANZWnBrVeRJQR7TQQha8OZvjQBHu
 d3cwMT9oiJBmDQUXqTJETuaQtQ==
X-Google-Smtp-Source: APBJJlGC9GcjpF//RTfgHk/e3ibfMuX5WCzda5QO/QIZ+yDcAz1vV0DX9dFwhd70yzWPOAQ384luFQ==
X-Received: by 2002:a05:6a21:6da1:b0:134:1671:6191 with SMTP id
 wl33-20020a056a216da100b0013416716191mr5882289pzb.0.1690445196605; 
 Thu, 27 Jul 2023 01:06:36 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:06:36 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Thu, 27 Jul 2023 16:04:17 +0800
Message-Id: <20230727080502.77895-5-zhengqi.arch@bytedance.com>
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
 Content preview: The debugfs_remove_recursive() will wait for
 debugfs_file_put()
 to return, so the shrinker will not be freed when doing debugfs operations
 (such as shrinker_debugfs_count_show() and shrinker_debugfs_s [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qOw1C-004LMF-5S
Subject: [f2fs-dev] [PATCH v3 04/49] mm: shrinker: remove redundant
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
