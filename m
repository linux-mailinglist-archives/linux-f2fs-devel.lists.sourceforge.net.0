Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA7D9283A4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jul 2024 10:25:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPeFt-0003Fu-IK;
	Fri, 05 Jul 2024 08:25:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s_min.jeong@samsung.com>) id 1sPeFs-0003Fo-AS
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jul 2024 08:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yjiQRI88LrEgQXuAT2KgD2ughIWt1fQ1A7RP58k7J2c=; b=dBaJZsLyLOvI5uxkEqM1bcC9fj
 RinpTFZikGG8m1t/tfIDVaSPeIqy28OneiG3bhJOkDYAFKVO+Rzs+K7LWrcjRICGZ5y4taOVKRMBY
 mDoNtjhhlUQQFDVRK9L0VP6yAGFcfU66njdiXI6S1u0btT4pd7V0yerKTvB2vs52fJ2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yjiQRI88LrEgQXuAT2KgD2ughIWt1fQ1A7RP58k7J2c=; b=e
 MtdbaiFwY6ImA+ucGZoAMOxpaInaZaJGBZ4F5BqRsO5Sq/lSf5Y/vjOxh+Hq0jP7hHTMNsu1MbR9D
 YZAIbYRQv5QI/l39nK+stPcPo/in8NhJOlArFO1Y0++oocXTJq6N7DVuZFJYLVXyBiyOLREC9E6iW
 SfwCdu1631M/E0GQ=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPeFs-0002zv-4O for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jul 2024 08:25:20 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20240705082512epoutp0390a0d539d9b40c113062eb46e697b716~fQ5o0DdC02208622086epoutp03H
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 Jul 2024 08:25:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20240705082512epoutp0390a0d539d9b40c113062eb46e697b716~fQ5o0DdC02208622086epoutp03H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1720167912;
 bh=yjiQRI88LrEgQXuAT2KgD2ughIWt1fQ1A7RP58k7J2c=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Jxi04vmTYWHQisaGxNAO70Q2M6JX7mljei6uRTxJtWEUM4R23uC0fagtvJ0UmSuyD
 um3blOlRqxt+ekkc/0lysq5wtPhVexIoStdVWJl8P5g5Ty1/POTsMrjv/hHGmNCK/O
 YIBLw+VAmLS3oRSGW2xSbZ3kZ9ty32AiSlAQA2+s=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240705082511epcas1p10cdb1a06d4257b48d6db75d1968c2e44~fQ5oinNMn1756817568epcas1p1U;
 Fri,  5 Jul 2024 08:25:11 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.240]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4WFmm7488Nz4x9Pt; Fri,  5 Jul
 2024 08:25:11 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 03.06.09910.7EDA7866; Fri,  5 Jul 2024 17:25:11 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240705082511epcas1p24b7b63d5e714a25213dbe07affa52f69~fQ5n6U0hh1315913159epcas1p23;
 Fri,  5 Jul 2024 08:25:11 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240705082511epsmtrp23c1de109b1ef9173de99959af431a8d5~fQ5n5ubAW2780227802epsmtrp2d;
 Fri,  5 Jul 2024 08:25:11 +0000 (GMT)
X-AuditID: b6c32a38-c9ffa700000226b6-97-6687ade7a06e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6A.40.29940.7EDA7866; Fri,  5 Jul 2024 17:25:11 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.98.34]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240705082511epsmtip2df6cc542e7a1643d3f4e762addc5c5e8~fQ5nu0crb2772627726epsmtip2X;
 Fri,  5 Jul 2024 08:25:11 +0000 (GMT)
From: Sunmin Jeong <s_min.jeong@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Fri,  5 Jul 2024 17:25:03 +0900
Message-Id: <20240705082503.805358-1-s_min.jeong@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKKsWRmVeSWpSXmKPExsWy7bCmge7zte1pBn/+yFucnnqWyWJq+15G
 iyfrZzFbXFrkbrGg9TeLxZZ/R1gtFmx8xGgxY/9TdgcOjwWbSj02repk89i94DOTR9+WVYwe
 nzfJBbBGZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXm
 AF2ipFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwK9ArTswtLs1L18tLLbEyNDAw
 MgUqTMjOmLLqFGtBq1bFr09pDYzXlLoYOTkkBEwkLm9oY+ti5OIQEtjBKHFoxTQo5xOjxLp7
 TxghnG+MErM27WGBaTm/4DArRGIvUEvjZVaQBFhL8/EyEJtNQEfi4dTbYA0iAuoSpyYtZQFp
 YBa4yijRvu85WEJYwF7iy6TzzCA2i4CqxNwnO8DivAK2EkeOvGOC2CYvMfPSd3aIuKDEyZlP
 wGqYgeLNW2czgwyVELjELnFp430ghwPIcZE4tUEOoldY4tXxLewQtpTE53d72SDsYomj8zew
 Q/Q2MErc+HoTqsheorm1mQ1kDrOApsT6XfoQu/gk3n3tYYUYzyvR0SYEUa0q0f1oCTOELS2x
 7NhBdogSD4mXPy0gQRIr8WRvC/sERrlZSB6YheSBWQi7FjAyr2IUSy0ozk1PLTYsMIHHY3J+
 7iZGcPrTstjBOPftB71DjEwcjIcYJTiYlUR4pd43pwnxpiRWVqUW5ccXleakFh9iNAUG6URm
 KdHkfGACziuJNzSxNDAxMzKxMLY0NlMS5z1zpSxVSCA9sSQ1OzW1ILUIpo+Jg1OqgUlcsK56
 FWdSdRtn08Zp2o0Tee5t8Ld9U2i2I0PrtIi31YWvVs1GOTJunCtzX+dJfGCb9mP60mk/6nor
 LrQ0+CS95j2xMU9YyW3nYb814nobdzkuMVR0lr285IP8xbUC4kscrq/6c+r1sbPqPMsUVi32
 TJwx10x94aY+nTUsib3O3u+Nj+4S/JexeV5aSqn6P80JJ30uZ+lM61V/5HJjrbZcwbmJrz94
 6B9+tUhP3lLlkFaSClPpenPVv2f3Ofdud1+hoKhicMjjom9nuaROh8Gj1Qpa371lnBW8J6lm
 bys4uPxwSJrFTo0dexbLWE5vm7vsGcce13SV/W1zRZ9VW/uv/cmUOWdF/sQHMwx3pimxFGck
 GmoxFxUnAgA8oXEeCAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWy7bCSvO7zte1pBv/Pc1ucnnqWyWJq+15G
 iyfrZzFbXFrkbrGg9TeLxZZ/R1gtFmx8xGgxY/9TdgcOjwWbSj02repk89i94DOTR9+WVYwe
 nzfJBbBGcdmkpOZklqUW6dslcGVMWXWKtaBVq+LXp7QGxmtKXYycHBICJhLnFxxm7WLk4hAS
 2M0ocWXWfPYuRg6ghLTEsT9FEKawxOHDxRAlHxgl5m25zgTSyyagI/Fw6m0WEFtEQFPiSOdM
 dpAiZoHbjBLfV7SDJYQF7CW+TDrPDGKzCKhKzH2yAyzOK2ArceTIOyaII+QlZl76zg4RF5Q4
 OfMJWA0zULx562zmCYx8s5CkZiFJLWBkWsUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJ
 ERyoWpo7GLev+qB3iJGJg/EQowQHs5IIr9T75jQh3pTEyqrUovz4otKc1OJDjNIcLErivOIv
 elOEBNITS1KzU1MLUotgskwcnFINTK4WbpHHIz/fc1wnsUrPoWz+CqYSW51255fRnGKLLh11
 veOmxsmR+tfspHJwp9TC5bwLX53ilPYNtp2/cV0979yvhrJi+1/2/0rzZywS19TbV7r2uIe/
 5Oq4us45WVWOvU9Yur/c67jqxqV8b39L3+oCj+VainWsYS/Pz8xn92zO/KL79Jv79INGc/7e
 8r1XKvDuRrOrc6zYxx1Z+/ecfnPZrFA7vbssYqLtZ7vVV7YrVWz4dpRHQ1RucaXspNkTgn+x
 PVkXxs2stK7U41XwxMAuh6MpBfXaGQIzUm7v0rftbZ/f5sRztvBOp8RzL+tQibPzDVY8+6Vp
 ZnnAUzP4vvkCVr1zc5gFv1wIKDujxFKckWioxVxUnAgAhOw/HMMCAAA=
X-CMS-MailID: 20240705082511epcas1p24b7b63d5e714a25213dbe07affa52f69
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240705082511epcas1p24b7b63d5e714a25213dbe07affa52f69
References: <CGME20240705082511epcas1p24b7b63d5e714a25213dbe07affa52f69@epcas1p2.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In case of the COW file,
 new updates and GC writes are already
 separated to page caches of the atomic file and COW file. As some cases that
 use the meta inode for GC, there are some race issues betwee [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.33 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.33 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sPeFs-0002zv-4O
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: use meta inode for GC of COW file
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
Cc: daehojeong@google.com, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Sungjong Seo <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In case of the COW file, new updates and GC writes are already
separated to page caches of the atomic file and COW file. As some cases
that use the meta inode for GC, there are some race issues between a
foreground thread and GC thread.

To handle them, we need to take care when to invalidate and wait
writeback of GC pages in COW files as the case of using the meta inode.
Also, a pointer from the COW inode to the original inode is required to
check the state of original pages.

For the former, we can solve the problem by using the meta inode for GC
of COW files. Then let's get a page from the original inode in
move_data_block when GCing the COW file to avoid race condition.

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Cc: stable@vger.kernel.org #v5.19+
Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>
---
v2:
- use union for cow inode to point to atomic inode
 fs/f2fs/data.c   |  2 +-
 fs/f2fs/f2fs.h   | 13 +++++++++++--
 fs/f2fs/file.c   |  3 +++
 fs/f2fs/gc.c     | 12 ++++++++++--
 fs/f2fs/inline.c |  2 +-
 fs/f2fs/inode.c  |  3 ++-
 6 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9a213d03005d..f6b1782f965a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2606,7 +2606,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 		return true;
 	if (IS_NOQUOTA(inode))
 		return true;
-	if (f2fs_is_atomic_file(inode))
+	if (f2fs_used_in_atomic_write(inode))
 		return true;
 	/* rewrite low ratio compress data w/ OPU mode to avoid fragmentation */
 	if (f2fs_compressed_file(inode) &&
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 796ae11c0fa3..4a8621e4a33a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -843,7 +843,11 @@ struct f2fs_inode_info {
 	struct task_struct *atomic_write_task;	/* store atomic write task */
 	struct extent_tree *extent_tree[NR_EXTENT_CACHES];
 					/* cached extent_tree entry */
-	struct inode *cow_inode;	/* copy-on-write inode for atomic write */
+	union {
+		struct inode *cow_inode;	/* copy-on-write inode for atomic write */
+		struct inode *atomic_inode;
+					/* point to atomic_inode, available only for cow_inode */
+	};
 
 	/* avoid racing between foreground op and gc */
 	struct f2fs_rwsem i_gc_rwsem[2];
@@ -4263,9 +4267,14 @@ static inline bool f2fs_post_read_required(struct inode *inode)
 		f2fs_compressed_file(inode);
 }
 
+static inline bool f2fs_used_in_atomic_write(struct inode *inode)
+{
+	return f2fs_is_atomic_file(inode) || f2fs_is_cow_file(inode);
+}
+
 static inline bool f2fs_meta_inode_gc_required(struct inode *inode)
 {
-	return f2fs_post_read_required(inode) || f2fs_is_atomic_file(inode);
+	return f2fs_post_read_required(inode) || f2fs_used_in_atomic_write(inode);
 }
 
 /*
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e4a7cff00796..547e7ec32b1f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2183,6 +2183,9 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 
 		set_inode_flag(fi->cow_inode, FI_COW_FILE);
 		clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
+
+		/* Set the COW inode's atomic_inode to the atomic inode */
+		F2FS_I(fi->cow_inode)->atomic_inode = inode;
 	} else {
 		/* Reuse the already created COW inode */
 		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index cb3006551ab5..61913fcefd9e 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1186,7 +1186,11 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	};
 	int err;
 
-	page = f2fs_grab_cache_page(mapping, index, true);
+	if (f2fs_is_cow_file(inode))
+		page = f2fs_grab_cache_page(F2FS_I(inode)->atomic_inode->i_mapping,
+						index, true);
+	else
+		page = f2fs_grab_cache_page(mapping, index, true);
 	if (!page)
 		return -ENOMEM;
 
@@ -1282,7 +1286,11 @@ static int move_data_block(struct inode *inode, block_t bidx,
 				CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
 
 	/* do not read out */
-	page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
+	if (f2fs_is_cow_file(inode))
+		page = f2fs_grab_cache_page(F2FS_I(inode)->atomic_inode->i_mapping,
+						bidx, false);
+	else
+		page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
 	if (!page)
 		return -ENOMEM;
 
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 1fba5728be70..cca7d448e55c 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -16,7 +16,7 @@
 
 static bool support_inline_data(struct inode *inode)
 {
-	if (f2fs_is_atomic_file(inode))
+	if (f2fs_used_in_atomic_write(inode))
 		return false;
 	if (!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))
 		return false;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 7a3e2458b2d9..18dea43e694b 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -804,8 +804,9 @@ void f2fs_evict_inode(struct inode *inode)
 
 	f2fs_abort_atomic_write(inode, true);
 
-	if (fi->cow_inode) {
+	if (fi->cow_inode && f2fs_is_cow_file(fi->cow_inode)) {
 		clear_inode_flag(fi->cow_inode, FI_COW_FILE);
+		F2FS_I(fi->cow_inode)->atomic_inode = NULL;
 		iput(fi->cow_inode);
 		fi->cow_inode = NULL;
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
