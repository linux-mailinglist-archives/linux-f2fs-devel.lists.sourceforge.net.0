Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF6ABD9421
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 14:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJJgxfIOcv6vcI1X15IEzL/AgVmUvfmiAvm16HgRyKo=; b=E7dg9leAMHMmK6CqFyhg7EBE+3
	FFSeJKUJzK2pGzC4u65auCJVG8c3QSNw7rlY5bqDSdn67o7FdLcde46MZB7ERx4pcdk+wtkbTBqTY
	vSeYDN2+W3lTextktJEVKmIsM1o8uctmtk8Fmal5Kk2/AmITL5vOnKTD4JTL9E6evHq0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8dsC-0007EK-61;
	Tue, 14 Oct 2025 12:11:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1v8dsA-0007EA-MB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C/LvlMlwmoGn4EEu6fl0YJvh1Z+uAYGGiSNYbvlUAoI=; b=Wa53ixaIGSe0QTmBal7qxzPVab
 RqB3SPUf4uyMhG52Sqe60BZN5klWAFsR6SPR9t35AP+gQakrN49JKUcxStJfJTBa42aQ3EoUSHtyY
 Mxh5iCzpciK9qkEFX2ATSHsspeE1jk0nq0wIJzl+kgzoYyH8lSjDwP7T/loo62wdXGE0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C/LvlMlwmoGn4EEu6fl0YJvh1Z+uAYGGiSNYbvlUAoI=; b=GLBRMQ2XHHN0xzxNEeDDbW13/9
 ZIFhSc2fLBQBQbTlB0fmcj4Me1ndPL4twhiGnX5plzjOQzpyPjd93aan+56xzCVvi5Khk8LX4qC7t
 1t4FC4QhRLQcEGDGbYkCSkuyiXys0EJBQfRA1ghbtvzMTK+RVeJ4awd3nuhr6xl/RtZc=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8ds9-0001Ok-R7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:22 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20251014121110epoutp03a46c79f47d7af97718ebcf7c849cc2ee~uWl9sWlJA0713707137epoutp03Y
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 12:11:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20251014121110epoutp03a46c79f47d7af97718ebcf7c849cc2ee~uWl9sWlJA0713707137epoutp03Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760443870;
 bh=C/LvlMlwmoGn4EEu6fl0YJvh1Z+uAYGGiSNYbvlUAoI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KXVPMq6jumEvwP9xqK7fm9mUMAbJiNK54aw0VeA0ye1OrdsNFmudi3+eNXjyAN9eg
 knmPQEJ8BSMV8cbjaas8eY15dU0ZsO3N1/+Zw7B2LCsMCXMK1LOOJ0Raw+uq5Vh7fJ
 Q9NCarmAfG2p6B70i8TY7JBDYb8+k/W2PwHFLh2c=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20251014121109epcas5p1450a20b2fb1624046b50ace88f3a111f~uWl8-9sfY3122231222epcas5p1L;
 Tue, 14 Oct 2025 12:11:09 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cmCjm3nKMz6B9m6; Tue, 14 Oct
 2025 12:11:08 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121108epcas5p1d68e41bdb1d51ae137b9bb22a7d16fd1~uWl7o_jJZ1447514475epcas5p1s;
 Tue, 14 Oct 2025 12:11:08 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121102epsmtip1b866f23363f52d9d5531fb176e70bee4~uWl27p7SL1256112561epsmtip1F;
 Tue, 14 Oct 2025 12:11:02 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, wangyufei@vivo.com
Date: Tue, 14 Oct 2025 17:38:39 +0530
Message-Id: <20251014120845.2361-11-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20251014121108epcas5p1d68e41bdb1d51ae137b9bb22a7d16fd1
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014121108epcas5p1d68e41bdb1d51ae137b9bb22a7d16fd1
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121108epcas5p1d68e41bdb1d51ae137b9bb22a7d16fd1@epcas5p1.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Made a helper to fetch writeback context to which an inode
 is affined. Use it to perform writeback related operations. Signed-off-by:
 Kundan Kumar <kundan.kumar@samsung.com> Signed-off-by: Anuj Gupta
 <anuj20.g@samsung.com>
 --- fs/fuse/file.c | 7 +++---- include/linux/backing-dev.h | 17
 +++++++++++++++++ 2 files change [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8ds9-0001Ok-R7
Subject: [f2fs-dev] [PATCH v2 10/16] fuse: add support for multiple
 writeback contexts in fuse
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

Made a helper to fetch writeback context to which an inode is affined.
Use it to perform writeback related operations.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/fuse/file.c              |  7 +++----
 include/linux/backing-dev.h | 17 +++++++++++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 8c823a661139..9c7f0e4b741f 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1823,7 +1823,6 @@ static void fuse_writepage_finish(struct fuse_writepage_args *wpa)
 	struct fuse_args_pages *ap = &wpa->ia.ap;
 	struct inode *inode = wpa->inode;
 	struct fuse_inode *fi = get_fuse_inode(inode);
-	struct backing_dev_info *bdi = inode_to_bdi(inode);
 	int i;
 
 	for (i = 0; i < ap->num_folios; i++) {
@@ -1833,8 +1832,8 @@ static void fuse_writepage_finish(struct fuse_writepage_args *wpa)
 		 * contention and noticeably improves performance.
 		 */
 		iomap_finish_folio_write(inode, ap->folios[i], 1);
-		dec_wb_stat(&bdi->wb_ctx[0]->wb, WB_WRITEBACK);
-		wb_writeout_inc(&bdi->wb_ctx[0]->wb);
+		bdi_wb_stat_mod(inode, -1);
+		bdi_wb_writeout_inc(inode);
 	}
 
 	wake_up(&fi->page_waitq);
@@ -2017,7 +2016,7 @@ static void fuse_writepage_args_page_fill(struct fuse_writepage_args *wpa, struc
 	ap->descs[folio_index].offset = offset;
 	ap->descs[folio_index].length = len;
 
-	inc_wb_stat(&inode_to_bdi(inode)->wb_ctx[0]->wb, WB_WRITEBACK);
+	bdi_wb_stat_mod(inode, 1);
 }
 
 static struct fuse_writepage_args *fuse_writepage_args_setup(struct folio *folio,
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index bb35f8fa4973..fb042e593c16 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -46,6 +46,9 @@ extern struct list_head bdi_list;
 
 extern struct workqueue_struct *bdi_wq;
 
+static inline struct bdi_writeback_ctx *
+fetch_bdi_writeback_ctx(struct inode *inode);
+
 static inline bool wb_has_dirty_io(struct bdi_writeback *wb)
 {
 	return test_bit(WB_has_dirty_io, &wb->state);
@@ -103,6 +106,20 @@ static inline s64 wb_stat_sum(struct bdi_writeback *wb, enum wb_stat_item item)
 
 extern void wb_writeout_inc(struct bdi_writeback *wb);
 
+static inline void bdi_wb_stat_mod(struct inode *inode, s64 amount)
+{
+	struct bdi_writeback_ctx *bdi_wb_ctx = fetch_bdi_writeback_ctx(inode);
+
+	wb_stat_mod(&bdi_wb_ctx->wb, WB_WRITEBACK, amount);
+}
+
+static inline void bdi_wb_writeout_inc(struct inode *inode)
+{
+	struct bdi_writeback_ctx *bdi_wb_ctx = fetch_bdi_writeback_ctx(inode);
+
+	wb_writeout_inc(&bdi_wb_ctx->wb);
+}
+
 /*
  * maximal error of a stat counter.
  */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
