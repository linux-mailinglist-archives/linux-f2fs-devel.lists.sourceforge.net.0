Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1D7BD944E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 14:11:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4nptGLkDGuYgIrbHVIR/8T+OK7eIYdpaW1uxmSYsr0=; b=CMUOkS1zfhiZcS41Upc+bWC+9g
	U5ca4ZCTJ6/6bL10INY9fZHTHwICG1aNYMi1GJJV7HH+jmcm55ZihAHyS5w1vZtfr2X+88LHvxFgO
	QpKV/yu0BhkZoCBDYmULpRD+2eIMPl82LqO5XSArccGKnUPtmtnavdh4iD/QQAqXAHrU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8dsg-0002D7-RD;
	Tue, 14 Oct 2025 12:11:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1v8dsf-0002Cl-35
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P26ywqsMnB1wfPCMRtpUS0xgTfcL9X0rkalZt4nakI0=; b=MSNDznKu9jZfIUMTY8zv7A/GxN
 AtTIVToNnqbLO+nkN5vdrHG6aor1Jm+0adIORk1i+G0zBfio7xVsdgAWgcl71PIdWunvGl64eOAnS
 VkQEAZJyCALj5oXAS1lXV0swwKPuWLF2BxaAnnJcinaMoDHJDBl6K/ir8jTIbHIzPr5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P26ywqsMnB1wfPCMRtpUS0xgTfcL9X0rkalZt4nakI0=; b=NmYU6Bz2RYCVcPmBv3xTn31fBq
 VAZfNg4e74JdAL5Tmbiao9imyEv1DqvfSnoSESSG0+LsGHTRaa9hE0x0Td2BN085cf173cdKwqYFD
 m1PGKTgyddg13fOnKFQijJ7+XGHZIJgj7ybq1zBQFTPYBoAyJhIw06zIseS++1hUO8cs=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8dsc-0001R8-BO for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:53 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20251014121138epoutp0394de4238a844ef8f6d1d48642421b14d~uWmYQWz1O0712807128epoutp03e
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 12:11:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20251014121138epoutp0394de4238a844ef8f6d1d48642421b14d~uWmYQWz1O0712807128epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760443898;
 bh=P26ywqsMnB1wfPCMRtpUS0xgTfcL9X0rkalZt4nakI0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IZEVWzpUM/VeejCxB/jGms73fEuWMwgHnd43yIQgt1GWnuFDZiPddMvQlfgmuselr
 P8CMZVovdo1GkWEFNVldpJQ8snOLCctSBP9XD24zoZGz9iz9Hp6oLEr1bJQ1M6v5Rr
 O61UQsByvXzJ7XsFA5175gAii6scO4d7O9zrDXY4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
 20251014121137epcas5p252ab21a6f213e2a3de40624cc4a06c89~uWmXXMLo33235432354epcas5p2t;
 Tue, 14 Oct 2025 12:11:37 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cmCkJ5szQz2SSKY; Tue, 14 Oct
 2025 12:11:36 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20251014121135epcas5p2aa801677c0561db10291c51d669873e2~uWmVjz9X22441424414epcas5p2q;
 Tue, 14 Oct 2025 12:11:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121131epsmtip1ababe9c4e8295da908008c77b52ba39e~uWmROln091256112561epsmtip1N;
 Tue, 14 Oct 2025 12:11:31 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, wangyufei@vivo.com
Date: Tue, 14 Oct 2025 17:38:45 +0530
Message-Id: <20251014120845.2361-17-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20251014121135epcas5p2aa801677c0561db10291c51d669873e2
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014121135epcas5p2aa801677c0561db10291c51d669873e2
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121135epcas5p2aa801677c0561db10291c51d669873e2@epcas5p2.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Implemented bdi_inc_writeback() to increase the writeback
 context count and called this function at XFS mount time to set the desired
 count. Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com> Signed-off-by:
 Anuj Gupta <anuj20.g@samsung.com> --- fs/xfs/xfs_super.c | 2 ++
 include/linux/backing-dev.h
 | 1 + mm/backing-dev.c | 58 ++++++++++ [...] 
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
X-Headers-End: 1v8dsc-0001R8-BO
Subject: [f2fs-dev] [PATCH v2 16/16] writeback: added XFS support for
 matching writeback count to allocation group count
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

Implemented bdi_inc_writeback() to increase the writeback context
count and called this function at XFS mount time to set the desired
count.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/xfs/xfs_super.c          |  2 ++
 include/linux/backing-dev.h |  1 +
 mm/backing-dev.c            | 58 +++++++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index b3ec9141d902..aa97b59f53c6 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -1783,6 +1783,8 @@ xfs_fs_fill_super(
 	if (error)
 		goto out_free_sb;
 
+	bdi_inc_writeback(sb->s_bdi, mp->m_sb.sb_agcount);
+
 	/*
 	 * V4 support is undergoing deprecation.
 	 *
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index 14f53183b8d1..89a465e1964f 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -40,6 +40,7 @@ void wb_start_background_writeback(struct bdi_writeback *wb);
 void wb_workfn(struct work_struct *work);
 
 void wb_wait_for_completion(struct wb_completion *done);
+int bdi_inc_writeback(struct backing_dev_info *bdi, int nwriteback);
 
 extern spinlock_t bdi_lock;
 extern struct list_head bdi_list;
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 5bfb9bf3ce52..e450b3a9b952 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -1219,6 +1219,64 @@ struct backing_dev_info *bdi_alloc(int node_id)
 }
 EXPORT_SYMBOL(bdi_alloc);
 
+int bdi_inc_writeback(struct backing_dev_info *bdi, int nwritebacks)
+{
+	struct bdi_writeback_ctx **wb_ctx;
+	int ret = 0;
+
+	if (nwritebacks <= bdi->nr_wb_ctx)
+		return ret;
+
+	wb_ctx = kcalloc(nwritebacks, sizeof(struct bdi_writeback_ctx *),
+			 GFP_KERNEL);
+	if (!wb_ctx)
+		return -ENOMEM;
+
+	for (int i = 0; i < bdi->nr_wb_ctx; i++)
+		wb_ctx[i] = bdi->wb_ctx[i];
+
+	for (int i = bdi->nr_wb_ctx; i < nwritebacks; i++) {
+		wb_ctx[i] = (struct bdi_writeback_ctx *)
+			kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
+		if (!wb_ctx[i]) {
+			pr_err("Failed to allocate %d", i);
+			while (--i >= bdi->nr_wb_ctx)
+				kfree(wb_ctx[i]);
+			kfree(wb_ctx);
+			return -ENOMEM;
+		}
+		INIT_LIST_HEAD(&wb_ctx[i]->wb_list);
+		init_waitqueue_head(&wb_ctx[i]->wb_waitq);
+
+#ifdef CONFIG_CGROUP_WRITEBACK
+		INIT_RADIX_TREE(&wb_ctx[i]->cgwb_tree, GFP_ATOMIC);
+		init_rwsem(&wb_ctx[i]->wb_switch_rwsem);
+#endif
+		ret = wb_init(&wb_ctx[i]->wb, wb_ctx[i], bdi, GFP_KERNEL);
+		if (!ret) {
+#ifdef CONFIG_CGROUP_WRITEBACK
+			wb_ctx[i]->wb.memcg_css = &root_mem_cgroup->css;
+			wb_ctx[i]->wb.blkcg_css = blkcg_root_css;
+#endif
+		} else {
+			while (--i >= bdi->nr_wb_ctx)
+				kfree(wb_ctx[i]);
+			kfree(wb_ctx);
+			return ret;
+		}
+		cgwb_bdi_register(bdi, wb_ctx[i]);
+		set_bit(WB_registered, &wb_ctx[i]->wb.state);
+	}
+
+	spin_lock_bh(&bdi_lock);
+	kfree(bdi->wb_ctx);
+	bdi->wb_ctx = wb_ctx;
+	bdi->nr_wb_ctx = nwritebacks;
+	spin_unlock_bh(&bdi_lock);
+	return 0;
+}
+EXPORT_SYMBOL(bdi_inc_writeback);
+
 static struct rb_node **bdi_lookup_rb_node(u64 id, struct rb_node **parentp)
 {
 	struct rb_node **p = &bdi_tree.rb_node;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
