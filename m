Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 198FFBD9415
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 14:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAS7FbsGkiv6CgwyowASgmKaMwIE0V0MZ+fssqGw45s=; b=fjrC1EiO69HsJn8WhzHMFE2bBT
	XSOJ/qLdoA0x/M73LyJC8nq/KHLd3HBQM1nnlQ1ljqGL0vd/Fi6FOQYss2R9V2SrgD5FEqtVSfx0q
	x0YqgMffGl3SfIVVbl3K0zUFOta01escD2Ly6jHBVGO5D2diEZu5jkMRtzl7DltP/aS0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8ds6-0000sm-SS;
	Tue, 14 Oct 2025 12:11:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1v8ds0-0000sR-0w
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gsFsMIu+qmP5Pk/U6/E+nZJ61/APVl3sjNSY2NmttmM=; b=nThKG9NsicvK5Gw5Ltxgm+i521
 pDTnGz/Zr7e2UJj93HdSuJ/C9fPmKOmaboCEpOtaDN8zM00bMlPBDwwm4WUIf6NS30OsygpTB6YI7
 D5HJTGThBrThkH/oyvQRNf9qrTi4iO55hVIF4gG7anKRWhRYjyc+GdB7FhEQ8ZV+uNUI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gsFsMIu+qmP5Pk/U6/E+nZJ61/APVl3sjNSY2NmttmM=; b=X5uWpynk35QySwtDo3QWhaSfvH
 osTbV3gnm61cssweEBXNXGlj8AZ4g75WYGDpreLAsdZU6igMSD7yOHTAAWo77y0CYVai1ZU4LEEsS
 znWKt43x8d1a396OHCpdOsrLfymgB5u8Bh0+t5Ri3142KoTBXUtP+GH4HVcl4otO9RE8=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8dry-0001Nf-ME for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:11 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20251014121059epoutp01749ed52e25d142e555d7891fa4812fc5~uWlzTsuBH1134011340epoutp01T
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 12:10:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20251014121059epoutp01749ed52e25d142e555d7891fa4812fc5~uWlzTsuBH1134011340epoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760443859;
 bh=gsFsMIu+qmP5Pk/U6/E+nZJ61/APVl3sjNSY2NmttmM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b3MP2PPQADA0hrQOZsvNMk5IqyvoGROiAsnT/N0hTNdssHWHiaozpoXzdpcNl/4nY
 aK//QNWUQ2GADLe9sOhTiSothJkAzC/Y6IHX6jQBZo5oxpejhWhMkIHsNmMlyxWPl7
 hV5ajXmyC+3hwqX4nk9gxZZfX2spne9pdDHx46dM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20251014121058epcas5p4efc8532b88fe6f0919db6df3984eaab5~uWlyadOAm1326113261epcas5p4x;
 Tue, 14 Oct 2025 12:10:58 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cmCjY1B5gz6B9m6; Tue, 14 Oct
 2025 12:10:57 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121056epcas5p1cd2a7fde9f54633b5a331f4553f88735~uWlw9E8x81946619466epcas5p12;
 Tue, 14 Oct 2025 12:10:56 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121048epsmtip19b929dbb834131481e70a8aeb346f9bb~uWlpts_jW1309013090epsmtip1H;
 Tue, 14 Oct 2025 12:10:48 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, wangyufei@vivo.com
Date: Tue, 14 Oct 2025 17:38:37 +0530
Message-Id: <20251014120845.2361-9-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20251014121056epcas5p1cd2a7fde9f54633b5a331f4553f88735
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014121056epcas5p1cd2a7fde9f54633b5a331f4553f88735
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121056epcas5p1cd2a7fde9f54633b5a331f4553f88735@epcas5p1.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Modified stats collection to collect stats for all the
 writeback
 contexts within a bdi. Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
 Signed-off-by: Anuj Gupta <anuj20.g@samsung.com> --- mm/backing-dev.c | 72
 ++++++++++++++++++++++++++++ 1 file changed, 42 in [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8dry-0001Nf-ME
Subject: [f2fs-dev] [PATCH v2 08/16] writeback: add support to collect stats
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
Cc: linux-nfs@vger.kernel.org, gost.dev@samsung.com, anuj20.g@samsung.com,
 vishak.g@samsung.com, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 kundan.kumar@samsung.com
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
index 754f2f6c6d7c..0a772d984ecf 100644
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
-	list_for_each_entry_rcu(wb, &bdi->wb_ctx[0]->wb_list, bdi_node) {
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
-	collect_wb_stats(stats, &bdi->wb_ctx[0]->wb);
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
-		   !list_empty(&bdi->bdi_list), bdi->wb_ctx[0]->wb.state);
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
-	list_for_each_entry_rcu(wb, &bdi->wb_ctx[0]->wb_list, bdi_node) {
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
