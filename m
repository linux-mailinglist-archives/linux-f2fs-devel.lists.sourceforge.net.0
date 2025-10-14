Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F27BD93FA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 14:10:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0NpNxIW2hwH0/lbOzCCMqRAlOKHL0ysxSoIowUdoHI=; b=SIRGLgwvaxHjQ5jy0XRgIaRMso
	FscEo210eKsYzk0++wIE9yjYJKmLqszRYWUsGJKatU55PyRu36ecWVNb7RMAoJcpJTGm4p/kEnigd
	j+g5JYSQXJybHjuTagkRA/YBmmoBcKqT99n5j29ocB5v+6h/q6JA5OGf2TpB5uHTJBqw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8drX-0000qS-9g;
	Tue, 14 Oct 2025 12:10:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1v8drV-0000qL-Vq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rKJH8bwqA59RYOc+B5sM49aSVlRkW4PvNX4CEB13cCo=; b=H09RPWklCTXsdgRCh7AEzw41tE
 uAVlsdQ6v3dbqUjHIl6E9xmuViCibO/1SOGaOcUibE9uSaxglaWE8kKC0iTy+1z0RiJ5r1aON4cBq
 CfUnuTPRTCFe4nqMVO8zvwNJSRkhg5zuVtY1gxryr/63G9U5/QODV2usgJUmrp3c9wLs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rKJH8bwqA59RYOc+B5sM49aSVlRkW4PvNX4CEB13cCo=; b=LQWn/hM6XgcyXyeI42SDH1TiO1
 kPj3E61NXsN1Ln17fpSFE+pjlydaSyKFvbrLb5PPZ59NngmLjtH2FMwrlojath3AbZ+Q/UPyhNm9s
 YAj/IiBrwlbSnKmMkmn+cfWbHgbBadpHpM8GJHh9uBxMOnweE/vlI9wbukR6Y1n4Rg9w=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8drV-0001M9-2X for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:10:41 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20251014121034epoutp01a5e666af52d0c49853a2ec7096a07161~uWlcDFRVa1133811338epoutp01E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 12:10:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20251014121034epoutp01a5e666af52d0c49853a2ec7096a07161~uWlcDFRVa1133811338epoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760443834;
 bh=rKJH8bwqA59RYOc+B5sM49aSVlRkW4PvNX4CEB13cCo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W05Y14rePZ8RFgXUzU42idAHG2tHyqnxyTHEGnyOuTLnJCR/PBRpmpxJAYeWIdafb
 wDeLhW0PSZ/QiE4Za8cKFfPoUyj6W/ieVWNi+AasoDHJtSKXrhQXMrBrzXsJ31gnd4
 J5rZ2dJ/Xi23b+2H3bT+d4wVB81A2+1H8pW1F1c4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20251014121033epcas5p1d8391adbcd15cb4c8848b8cb66b6cfeb~uWlbWfGcV0673806738epcas5p1Z;
 Tue, 14 Oct 2025 12:10:33 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.90]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cmCj42h5Qz6B9mF; Tue, 14 Oct
 2025 12:10:32 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20251014121031epcas5p37b0c4e23a7ad2d623ba776498f795fb0~uWlZtq5xY0650006500epcas5p33;
 Tue, 14 Oct 2025 12:10:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121026epsmtip1b892e5a7d3af784888e5b4d33982dd8f~uWlVOMbrO1256112561epsmtip1n;
 Tue, 14 Oct 2025 12:10:26 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, wangyufei@vivo.com
Date: Tue, 14 Oct 2025 17:38:33 +0530
Message-Id: <20251014120845.2361-5-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20251014121031epcas5p37b0c4e23a7ad2d623ba776498f795fb0
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014121031epcas5p37b0c4e23a7ad2d623ba776498f795fb0
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121031epcas5p37b0c4e23a7ad2d623ba776498f795fb0@epcas5p3.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Affine inode to a writeback context. This helps in minimizing
 the filesytem fragmentation due to inode being processed by different threads.
 To support parallel writeback,
 wire up a new superblock operation get_inode_wb_ctx().
 Filesystems can override this callback and select desired writeback context
 for a inode. FS can use the wb context [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8drV-0001M9-2X
Subject: [f2fs-dev] [PATCH v2 04/16] writeback: affine inode to a writeback
 ctx within a bdi
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

Affine inode to a writeback context. This helps in minimizing the
filesytem fragmentation due to inode being processed by different
threads.

To support parallel writeback, wire up a new superblock operation
get_inode_wb_ctx(). Filesystems can override this callback and select
desired writeback context for a inode. FS can use the wb context based
on its geometry and also use 64 bit inode numbers.

If a filesystem doesn't implement this callback, it defaults to
DEFALT_WB_CTX = 0, maintaining its original behavior.

An example implementation for XFS is provided, where XFS selects the
writeback context based on its Allocation Group number.

Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
---
 fs/fs-writeback.c           |  3 ++-
 fs/xfs/xfs_super.c          | 13 +++++++++++++
 include/linux/backing-dev.h |  5 ++++-
 include/linux/fs.h          |  1 +
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 0715a7617391..56c048e22f72 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -265,7 +265,8 @@ void __inode_attach_wb(struct inode *inode, struct folio *folio)
 {
 	struct backing_dev_info *bdi = inode_to_bdi(inode);
 	struct bdi_writeback *wb = NULL;
-	struct bdi_writeback_ctx *bdi_writeback_ctx = bdi->wb_ctx[0];
+	struct bdi_writeback_ctx *bdi_writeback_ctx =
+						fetch_bdi_writeback_ctx(inode);
 
 	if (inode_cgwb_enabled(inode)) {
 		struct cgroup_subsys_state *memcg_css;
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index bb0a82635a77..b3ec9141d902 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -53,6 +53,7 @@
 #include <linux/magic.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
+#include <linux/backing-dev.h>
 
 static const struct super_operations xfs_super_operations;
 
@@ -1294,6 +1295,17 @@ xfs_fs_show_stats(
 	return 0;
 }
 
+static struct bdi_writeback_ctx *
+xfs_get_inode_wb_ctx(
+	struct inode		*inode)
+{
+	struct xfs_inode *ip = XFS_I(inode);
+	struct backing_dev_info *bdi = inode_to_bdi(inode);
+	xfs_agino_t agno = XFS_INO_TO_AGNO(ip->i_mount, ip->i_ino);
+
+	return bdi->wb_ctx[agno % bdi->nr_wb_ctx];
+}
+
 static const struct super_operations xfs_super_operations = {
 	.alloc_inode		= xfs_fs_alloc_inode,
 	.destroy_inode		= xfs_fs_destroy_inode,
@@ -1310,6 +1322,7 @@ static const struct super_operations xfs_super_operations = {
 	.free_cached_objects	= xfs_fs_free_cached_objects,
 	.shutdown		= xfs_fs_shutdown,
 	.show_stats		= xfs_fs_show_stats,
+	.get_inode_wb_ctx       = xfs_get_inode_wb_ctx,
 };
 
 static int
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index 951ab5497500..59bbb69d300c 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -148,6 +148,7 @@ static inline bool mapping_can_writeback(struct address_space *mapping)
 	return inode_to_bdi(mapping->host)->capabilities & BDI_CAP_WRITEBACK;
 }
 
+#define DEFAULT_WB_CTX 0
 #define for_each_bdi_wb_ctx(bdi, wbctx) \
 	for (int __i = 0; __i < (bdi)->nr_wb_ctx \
 		&& ((wbctx) = (bdi)->wb_ctx[__i]) != NULL; __i++)
@@ -157,7 +158,9 @@ fetch_bdi_writeback_ctx(struct inode *inode)
 {
 	struct backing_dev_info *bdi = inode_to_bdi(inode);
 
-	return bdi->wb_ctx[0];
+	if (inode->i_sb->s_op->get_inode_wb_ctx)
+		return inode->i_sb->s_op->get_inode_wb_ctx(inode);
+	return bdi->wb_ctx[DEFAULT_WB_CTX];
 }
 
 #ifdef CONFIG_CGROUP_WRITEBACK
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 754fec84f350..5199b0d49fa5 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2379,6 +2379,7 @@ struct super_operations {
 	 */
 	int (*remove_bdev)(struct super_block *sb, struct block_device *bdev);
 	void (*shutdown)(struct super_block *sb);
+	struct bdi_writeback_ctx *(*get_inode_wb_ctx)(struct inode *inode);
 };
 
 /*
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
