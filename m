Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3368B40D596
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Sep 2021 11:09:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQnOY-0005U3-7i; Thu, 16 Sep 2021 09:09:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mQnOR-0005TO-Fp
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 09:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=grVnxltHY2J0afqjWo9PlvhFhuZkNZgma0sYVTkbjEs=; b=ihDnoCzY2sqJbkQQ3NWtVIEcc0
 BeJUuVNMYzNIWNZW0YwNVUC+wSNHA7Z2oaHqYjHjNZkUI5+mo/pP9j+HdY2dAB+Jlm/wjx5gxpbfv
 liB9VF7Dbh4WiDuMDzNnf2pj2r71QPEIIfhzFJyK0zctcFAbtVtPBCpfz18WANCdKgaA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=grVnxltHY2J0afqjWo9PlvhFhuZkNZgma0sYVTkbjEs=; b=J
 R0MFo2NZWng/ejtxBUtoMHl4ZQVx08bJt7gubVIWLX+ApHMF3YB9mzZR/K2rurL1E6A3NAheBYzXS
 BAFCKxvezGuXnD8nmtHhIlV95ExVbBTpF8y9CWR6LFWZCSWyYORoGLVKBefb24X/48ZypMq0lPAzr
 Y5fBbjBJGbucGOnM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQnOM-00CZ8S-Ok
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 09:09:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DA7C60F93;
 Thu, 16 Sep 2021 09:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631783349;
 bh=97WnehG029XDtPsDQa1+PYmnlyuYrpfaBA6X7Pg/NQ0=;
 h=From:To:Cc:Subject:Date:From;
 b=m2cm1xOdEqeL2YAbx1PmE8I1LCuZx7UdK9oUAABgSNzTkyWwj1Iy4McropjiGvOPh
 3+RAB92ikbTgpWjqHN0EGnYSTwN/HblSWTK/BIW2tSVBJ4Q2mm5915lOlCcuExqIyB
 /4dh9Ij0+mat7Rh5ZAl3MH065QkcS4EqsFfq/8c3k3WHaWgwaj8vutHGPYPS53rwwv
 h8mTs0+gCY0TFa9GpanANCVp0MpIwfV8ynJuMACUBHYf22SdQv33fncEOAiE7p1yib
 u7cuFjpCJDSDkxzvPluA0ygYskFy+Vr9o8LFFTCsK5EsGLIiB2DnG4HVzb0TanlGyL
 SRKcmmOXj4K3g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 16 Sep 2021 17:09:03 +0800
Message-Id: <20210916090903.18427-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables f2fs_balance_fs_bg() to check all
 metadatas'
 dirty threshold rather than just checking node block's, so that checkpoint()
 from background can be triggered more frequently to avoid h [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mQnOM-00CZ8S-Ok
Subject: [f2fs-dev] [PATCH v2] f2fs: introduce excess_dirty_threshold()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch enables f2fs_balance_fs_bg() to check all metadatas' dirty
threshold rather than just checking node block's, so that checkpoint()
from background can be triggered more frequently to avoid heaping up
too much dirty metadatas.

Threshold value by default:
race with foreground ops	single type	global
No				16MB		24MB
Yes				24MB		36MB

In addtion, let f2fs_balance_fs_bg() be aware of roll-forward sapce
as well as fsync().

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix to use f2fs_space_for_roll_forward() correctly pointed out
by Jaegeuk
 fs/f2fs/f2fs.h    |  3 +++
 fs/f2fs/node.h    |  5 -----
 fs/f2fs/segment.c | 23 +++++++++++++++++++++--
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 58311eda4ce9..2e26b9e95ac5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -561,6 +561,9 @@ enum {
 
 #define MAX_DIR_RA_PAGES	4	/* maximum ra pages of dir */
 
+/* dirty segments threshold for triggering CP */
+#define DEFAULT_DIRTY_THRESHOLD		4
+
 /* for in-memory extent cache entry */
 #define F2FS_MIN_EXTENT_LEN	64	/* minimum extent length */
 
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index ff14a6e5ac1c..18b98cf0465b 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -138,11 +138,6 @@ static inline bool excess_cached_nats(struct f2fs_sb_info *sbi)
 	return NM_I(sbi)->nat_cnt[TOTAL_NAT] >= DEF_NAT_CACHE_THRESHOLD;
 }
 
-static inline bool excess_dirty_nodes(struct f2fs_sb_info *sbi)
-{
-	return get_pages(sbi, F2FS_DIRTY_NODES) >= sbi->blocks_per_seg * 8;
-}
-
 enum mem_type {
 	FREE_NIDS,	/* indicates the free nid list */
 	NAT_ENTRIES,	/* indicates the cached nat entry */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6cfbd62262f2..ceb20e91e125 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -529,6 +529,25 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	}
 }
 
+static inline bool excess_dirty_threshold(struct f2fs_sb_info *sbi)
+{
+	int factor = rwsem_is_locked(&sbi->cp_rwsem) ? 3 : 2;
+	unsigned int dents = get_pages(sbi, F2FS_DIRTY_DENTS);
+	unsigned int qdata = get_pages(sbi, F2FS_DIRTY_QDATA);
+	unsigned int nodes = get_pages(sbi, F2FS_DIRTY_NODES);
+	unsigned int meta = get_pages(sbi, F2FS_DIRTY_META);
+	unsigned int imeta = get_pages(sbi, F2FS_DIRTY_IMETA);
+	unsigned int threshold = sbi->blocks_per_seg * factor *
+					DEFAULT_DIRTY_THRESHOLD;
+	unsigned int global_threshold = threshold * 3 / 2;
+
+	if (dents >= threshold || qdata >= threshold ||
+		nodes >= threshold || meta >= threshold ||
+		imeta >= threshold)
+		return true;
+	return dents + qdata + nodes + meta + imeta >  global_threshold;
+}
+
 void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
 {
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
@@ -547,8 +566,8 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
 	else
 		f2fs_build_free_nids(sbi, false, false);
 
-	if (excess_dirty_nats(sbi) || excess_dirty_nodes(sbi) ||
-		excess_prefree_segs(sbi))
+	if (excess_dirty_nats(sbi) || excess_dirty_threshold(sbi) ||
+		excess_prefree_segs(sbi) || !f2fs_space_for_roll_forward(sbi))
 		goto do_sync;
 
 	/* there is background inflight IO or foreground operation recently */
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
