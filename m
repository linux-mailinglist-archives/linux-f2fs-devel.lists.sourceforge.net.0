Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AB6AC7D66
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 May 2025 13:50:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfvnszITVJ9+Ylg06aM7SszWHQ++n29P1RU8n3Qw5ME=; b=ACKN89EoWu/vNDF+WUKze/oR3m
	qNJReZ0ELoslICIrKan8HZ22dAbvgGxNvkJ0IhjMR5OqHDV1geTw7Sx1zXrOW6NW8MPmHGbZTDE7C
	vtlrO8geHGl7dj15/i/r5Z8RyRVfuhtn2U9N9JlvoiJA212bRjmbr7kLAIUqs9czEBUE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKblo-0001MF-Up;
	Thu, 29 May 2025 11:50:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1uKblj-0001Ll-4n
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2pPW61Ci7mZ49EXMnfxOL8Bt7rnm4f37CanAIhRplY8=; b=BYJ/gKIhqw5pJAmRX9Gf5Bl4n4
 fb0f+o4euM1A/HvpwaHe6h6xJnSnScpa60SYOLvdgTzIe5yVpCFblxp+xcC7aC97JjxFByaMPebYP
 fGhOxcH2zfy59/u6F6U4Xlp6lpRsCdmfKPuVfZxXbZRcaEfiGc418SMJNREo+G3eXhWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2pPW61Ci7mZ49EXMnfxOL8Bt7rnm4f37CanAIhRplY8=; b=TaPGVHtmtp4VLgX6SpooEqmWwq
 hxDKibiSrRjL82xAnxxt/3IAwDD68jn+3leqo6Wu8U+7olnKknzNnZsjIyyrN5gxEgP45NCMoYuvA
 g2nkMtO7i6+C0VUAygtM1pzKIDd1iJX0Xlvite0oNXUsTYeEQ7q8tbI/LEjholYQn3c0=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKblh-0000xy-B4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:55 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250529113406epoutp034e74f55e2710270d5c4d6d03bf71e150~D-EM88Zgc1014110141epoutp03S
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 May 2025 11:34:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250529113406epoutp034e74f55e2710270d5c4d6d03bf71e150~D-EM88Zgc1014110141epoutp03S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748518446;
 bh=2pPW61Ci7mZ49EXMnfxOL8Bt7rnm4f37CanAIhRplY8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cKhvTnhyi2aD1jUbX8cC3lmov481UmPjElcsONOBAU9KoVHX4Y5oUtmQYIyyrjamo
 ZsG/HmjkgT/dM7upoItfFr8gAwFXmwXiCt9T5zAdRFuqlHPERPZpm53hh1D57HV3PN
 JZVn/Drf3TYwYdU9UGo6wYP4uWiMM3G4/A1k8CMk=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20250529113405epcas5p1f9353231e6995374c32ea1fd5aa6c3fa~D-EMbdi7T0737307373epcas5p16;
 Thu, 29 May 2025 11:34:05 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.179]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4b7PQh1x10z6B9m6; Thu, 29 May
 2025 11:34:04 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250529113249epcas5p38b29d3c6256337eadc2d1644181f9b74~D-DFraPsh0440004400epcas5p3V;
 Thu, 29 May 2025 11:32:49 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250529113249epsmtrp126243e34c6c4da550db410654938d7fd~D-DFqNfcq2108121081epsmtrp1Q;
 Thu, 29 May 2025 11:32:49 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-07-683845e186f8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 AB.82.19478.1E548386; Thu, 29 May 2025 20:32:49 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113245epsmtip28923533fe9c5db9468d6af7c110b6cf2~D-DByXQe82208622086epsmtip2v;
 Thu, 29 May 2025 11:32:45 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, p.raghav@samsung.com,
 da.gomez@samsung.com
Date: Thu, 29 May 2025 16:44:59 +0530
Message-Id: <20250529111504.89912-9-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529111504.89912-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRmVeSWpSXmKPExsWy7bCSvO5DV4sMg+9PJSy2rdvNbjFn/Ro2
 iwvrVjNatO78z2LRNOEvs8Xqu/1sFq8Pf2K0OD31LJPFlkv2Fu8vb2OyWH1zDaPFlmP3GC0u
 P+Gz2D39H6vFzQM7mSxWrj7KZDF7ejOTxZP1s5gttn75ympxaZG7xZ69J1ks7q35z2px4cBp
 VosbE54yWjzbvZHZ4vPSFnaLg6c62C0+zQUacv7vcVaL3z/msDnIeZxaJOGxc9Zddo/NK7Q8
 Lp8t9di0qpPNY9OnSeweJ2b8ZvF4sXkmo8fuBZ+ZPHbfbGDzOHexwuP9vqtsHn1bVjF6TJ1d
 73FmwRF2jxXTLjIFCEVx2aSk5mSWpRbp2yVwZbx4sZW94IJ8xZwJZ9kaGFdJdjFyckgImEjc
 fbSeuYuRi0NIYDujxIW1M1kgEjISu+/uZIWwhSVW/nvODlH0kVHi7vU3QA4HB5uArsSPplCQ
 uIjATWaJc2fPgDUwC/xjlNj9SgfEFhYIlZi1qBVsKIuAqsTkO8+ZQGxeAVuJidOXQi2Tl5h5
 6Ts7iM0pYCexaMlXRhBbCKhm6c21LBD1ghInZz5hgZgvL9G8dTbzBEaBWUhSs5CkFjAyrWIU
 TS0ozk3PTS4w1CtOzC0uzUvXS87P3cQITgpaQTsYl63/q3eIkYmD8RCjBAezkghvk71ZhhBv
 SmJlVWpRfnxRaU5q8SFGaQ4WJXFe5ZzOFCGB9MSS1OzU1ILUIpgsEwenVAMTd4b24eTzz/J/
 X/sTeNk1ZMqq3InvPv6afuN/7uG6s+szXC4GFjBHSK2Q/+Di/zv7GnfPBgcfga2Jp/n6Q+R+
 OzTJqG2pqvDR0G6QZEr1fHlz8tqnX48ldeXdPb9mqePyVzuK+m8pissWRtZ4vv1+6xvvOvPt
 a9PXK30We66z4MbrhY1lbvtuTXq2YMrV65r/K5ay/D70+f5V+RNLbBb3+AcmftzG6FLzpFVa
 XUvd137BtLawFYLnWK4XTOy48pxf1alwUdAdh/oXdUei3Lii65jz2AymSRiV8AssTt9XKF2Z
 tPxlQ2KFcP75/qSbqr08783UtpUcYTd757Y44s2zQJM/MXzzJnFdvN647d9FJZbijERDLeai
 4kQAQW8tcXkDAAA=
X-CMS-MailID: 20250529113249epcas5p38b29d3c6256337eadc2d1644181f9b74
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529113249epcas5p38b29d3c6256337eadc2d1644181f9b74
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113249epcas5p38b29d3c6256337eadc2d1644181f9b74@epcas5p3.samsung.com>
X-Headers-End: 1uKblh-0000xy-B4
Subject: [f2fs-dev] [PATCH 08/13] writeback: add support to collect stats
 for all writeback ctxs
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
Cc: linux-nfs@vger.kernel.org, gost.dev@samsung.com,
 Anuj Gupta <anuj20.g@samsung.com>, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Kundan Kumar <kundan.kumar@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Modified stats collection to collect stats for all the writeback
contexts within a bdi.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 mm/backing-dev.c | 72 ++++++++++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 5479e2d34160..d416122e2914 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -50,6 +50,7 @@ struct wb_stats {
 	unsigned long nr_written;
 	unsigned long dirty_thresh;
 	unsigned long wb_thresh;
+	unsigned long state;
 };
 
 static struct dentry *bdi_debug_root;
@@ -81,6 +82,7 @@ static void collect_wb_stats(struct wb_stats *stats,
 	stats->nr_dirtied += wb_stat(wb, WB_DIRTIED);
 	stats->nr_written += wb_stat(wb, WB_WRITTEN);
 	stats->wb_thresh += wb_calc_thresh(wb, stats->dirty_thresh);
+	stats->state |= wb->state;
 }
 
 #ifdef CONFIG_CGROUP_WRITEBACK
@@ -89,22 +91,27 @@ static void bdi_collect_stats(struct backing_dev_info *bdi,
 			      struct wb_stats *stats)
 {
 	struct bdi_writeback *wb;
+	struct bdi_writeback_ctx *bdi_wb_ctx;
 
 	rcu_read_lock();
-	list_for_each_entry_rcu(wb, &bdi->wb_ctx_arr[0]->wb_list, bdi_node) {
-		if (!wb_tryget(wb))
-			continue;
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx)
+		list_for_each_entry_rcu(wb, &bdi_wb_ctx->wb_list, bdi_node) {
+			if (!wb_tryget(wb))
+				continue;
 
-		collect_wb_stats(stats, wb);
-		wb_put(wb);
-	}
+			collect_wb_stats(stats, wb);
+			wb_put(wb);
+		}
 	rcu_read_unlock();
 }
 #else
 static void bdi_collect_stats(struct backing_dev_info *bdi,
 			      struct wb_stats *stats)
 {
-	collect_wb_stats(stats, &bdi->wb_ctx_arr[0]->wb);
+	struct bdi_writeback_ctx *bdi_wb_ctx;
+
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx)
+		collect_wb_stats(stats, &bdi_wb_ctx->wb);
 }
 #endif
 
@@ -150,7 +157,7 @@ static int bdi_debug_stats_show(struct seq_file *m, void *v)
 		   stats.nr_io,
 		   stats.nr_more_io,
 		   stats.nr_dirty_time,
-		   !list_empty(&bdi->bdi_list), bdi->wb_ctx_arr[0]->wb.state);
+		   !list_empty(&bdi->bdi_list), stats.state);
 
 	return 0;
 }
@@ -195,35 +202,40 @@ static int cgwb_debug_stats_show(struct seq_file *m, void *v)
 {
 	struct backing_dev_info *bdi = m->private;
 	struct bdi_writeback *wb;
+	struct bdi_writeback_ctx *bdi_wb_ctx;
 	unsigned long background_thresh;
 	unsigned long dirty_thresh;
+	struct wb_stats stats;
 
 	global_dirty_limits(&background_thresh, &dirty_thresh);
+	stats.dirty_thresh = dirty_thresh;
 
 	rcu_read_lock();
-	list_for_each_entry_rcu(wb, &bdi->wb_ctx_arr[0]->wb_list, bdi_node) {
-		struct wb_stats stats = { .dirty_thresh = dirty_thresh };
-
-		if (!wb_tryget(wb))
-			continue;
-
-		collect_wb_stats(&stats, wb);
-
-		/*
-		 * Calculate thresh of wb in writeback cgroup which is min of
-		 * thresh in global domain and thresh in cgroup domain. Drop
-		 * rcu lock because cgwb_calc_thresh may sleep in
-		 * cgroup_rstat_flush. We can do so here because we have a ref.
-		 */
-		if (mem_cgroup_wb_domain(wb)) {
-			rcu_read_unlock();
-			stats.wb_thresh = min(stats.wb_thresh, cgwb_calc_thresh(wb));
-			rcu_read_lock();
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
+		list_for_each_entry_rcu(wb, &bdi_wb_ctx->wb_list, bdi_node) {
+			if (!wb_tryget(wb))
+				continue;
+
+			collect_wb_stats(&stats, wb);
+
+			/*
+			 * Calculate thresh of wb in writeback cgroup which is
+			 * min of thresh in global domain and thresh in cgroup
+			 * domain. Drop rcu lock because cgwb_calc_thresh may
+			 * sleep in cgroup_rstat_flush. We can do so here
+			 * because we have a ref.
+			 */
+			if (mem_cgroup_wb_domain(wb)) {
+				rcu_read_unlock();
+				stats.wb_thresh = min(stats.wb_thresh,
+						      cgwb_calc_thresh(wb));
+				rcu_read_lock();
+			}
+
+			wb_stats_show(m, wb, &stats);
+
+			wb_put(wb);
 		}
-
-		wb_stats_show(m, wb, &stats);
-
-		wb_put(wb);
 	}
 	rcu_read_unlock();
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
