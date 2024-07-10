Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D8392D108
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jul 2024 13:52:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRVrd-0006v5-Iv;
	Wed, 10 Jul 2024 11:52:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s_min.jeong@samsung.com>) id 1sRVrc-0006uR-3o
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 11:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c5n/UByZUePQ6P5a5OPEpG605PoUTj8f9/67DLiQcfc=; b=S8YWykefghd71jcjs2lrvvvjRG
 ATjFllH8V84KMKvDzUq6EdVjNSN3TLDCl1C74buR75ARSPm9tEWR+LezRZtYnVGyVO/5MbUXtcEYN
 pYMuxXCuexwIMmFfPyivjLNN2OnX2BDB93WD6pVj8jopj+OcRU70cYUbHPEhnW4kB9Y0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c5n/UByZUePQ6P5a5OPEpG605PoUTj8f9/67DLiQcfc=; b=O
 0VskgRMxEG3halH8Zv+V7YtBkOFD8sTl/3OQoeKqicqzFZ63TJZuxlZw/gpcqPKksruvyYhWL/6fo
 PKWfzGC5Sr0xmSJMmnWpZFtOebtKdcvo9kZjJmcDf64VKKcDDoW9Hymp6A/XljiWfG9FOTS1AWUka
 lP0qK+dFlldBrVpM=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRVrc-0003bN-Iq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 11:52:01 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20240710115152epoutp036c44a0c381dd1cc322b66114cb02ff09~g18hG-yFw0979709797epoutp03p
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jul 2024 11:51:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20240710115152epoutp036c44a0c381dd1cc322b66114cb02ff09~g18hG-yFw0979709797epoutp03p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1720612312;
 bh=c5n/UByZUePQ6P5a5OPEpG605PoUTj8f9/67DLiQcfc=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Y/t1V8bOOlI2gZ4T6GSKLTbTZ9XdJWKXK5i9GL5hohSqMude2XKo8YAl88dAPs5DD
 92izUCqqcRlCLY0cwUA1k1pwEyk8+xC4bO2+Uq8SRwwXDl6xhwnDgi+ptTZUZXz8xb
 pZVLDRjb59o1dQekRfGB7Hww/WosgtMM05MJmkdQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240710115152epcas1p2f6439636838d8e3f13dcc9fbdb311f07~g18gwGyQ70796007960epcas1p2b;
 Wed, 10 Jul 2024 11:51:52 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.249]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4WJx6J0hmkz4x9Q1; Wed, 10 Jul
 2024 11:51:52 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 DB.BB.08602.7D57E866; Wed, 10 Jul 2024 20:51:51 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20240710115151epcas1p3a7dbc6b3f69375d64d51f32f4ce3d9a4~g18froSvE0041400414epcas1p3Y;
 Wed, 10 Jul 2024 11:51:51 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240710115151epsmtrp217c92a633c913dbf67c72da4601e16eb~g18fqOByo0777407774epsmtrp2Y;
 Wed, 10 Jul 2024 11:51:51 +0000 (GMT)
X-AuditID: b6c32a33-40dff7000000219a-eb-668e75d75fef
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 4C.C7.18846.7D57E866; Wed, 10 Jul 2024 20:51:51 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.98.34]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240710115151epsmtip2f2140da5c4bda4c870ef9f602e542a5b~g18fgX5fM1952319523epsmtip2j;
 Wed, 10 Jul 2024 11:51:51 +0000 (GMT)
From: Sunmin Jeong <s_min.jeong@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Wed, 10 Jul 2024 20:51:43 +0900
Message-Id: <20240710115143.61315-1-s_min.jeong@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBKsWRmVeSWpSXmKPExsWy7bCmvu710r40g1svTSxOTz3LZDG1fS+j
 xZP1s5gtLi1yt1jQ+pvFYsu/I6wWCzY+YrSYsf8puwOHx4JNpR6bVnWyeexe8JnJo2/LKkaP
 z5vkAlijsm0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJz
 gC5RUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYFegVJ+YWl+al6+WlllgZGhgY
 mQIVJmRnHFx8kq3giG7F8ltX2RsYT6t2MXJwSAiYSDz4oNvFyMUhJLCDUWLj5FUsEM4nRomb
 r3azwjmfX69k72LkBOv4sOALO0RiJ6PEutZHCFWHNs0Gq2IT0JF4OPU2C4gtIqAucWrSUrC5
 zAJXGSXa9z0HSwgL2Etc3fMWrIFFQFViw5drrCA2r4CNxKlXjWwQ6+QlZl76zg4RF5Q4OfMJ
 WC8zULx562xmkKESApfYJfq+n2GFaHCR6F/4ggXCFpZ4dXwL1N1SEp/f7YUaWixxdP4Gdojm
 BkaJG19vQhXZSzS3NrOBgoZZQFNi/S59iGV8Eu++9rBCQoxXoqNNCKJaVaL70RJmCFtaYtmx
 g1BTPICmfAFbJSQQKzHj/GmmCYxys5C8MAvJC7MQli1gZF7FKJZaUJybnppsWGAIj8rk/NxN
 jOAkqGW8g/Hy/H96hxiZOBgPMUpwMCuJ8M6/0Z0mxJuSWFmVWpQfX1Sak1p8iNEUGKgTmaVE
 k/OBaTivJN7QxNLAxMzIxMLY0thMSZz3zJWyVCGB9MSS1OzU1ILUIpg+Jg5OqQam9XMWzg2R
 ZOEzPeF2lCtR2PlxJi+PxwWh3N2/HVcYS2a69uxRWvrB7cb/9N+1lw9eaZlrtmjD45IbfuGW
 k799ZdHLz3l7wNSVU/j7vi1MZvMKDD9uZZq1rfH+/Ks8PzPWeUa6/VcRTmMTvPPrzHqevU7H
 znwWrpc6U3Izu+C93HrvTRW1r63Fknw5b/JMeKP+2TSwOLkzSlFD/Fl8pe51t7eZ5h9+P/qv
 e2dR+aMEbn2Vn77tQSlX+xSaFy2aPT/t8s8aE+aw4PoMkzkxU75fXX7x75T+qSzPeZff+W65
 NF5CleW77qxtX2ZOD96W0nvL0ktoftqbe88U2me7LYzNU1CYzfjmf8wKy35Gs0IOJZbijERD
 Leai4kQANs2HSgsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLLMWRmVeSWpSXmKPExsWy7bCSvO710r40g3V7eC1OTz3LZDG1fS+j
 xZP1s5gtLi1yt1jQ+pvFYsu/I6wWCzY+YrSYsf8puwOHx4JNpR6bVnWyeexe8JnJo2/LKkaP
 z5vkAlijuGxSUnMyy1KL9O0SuDIOLj7JVnBEt2L5ravsDYynVbsYOTkkBEwkPiz4wt7FyMUh
 JLCdUWLLu1ssXYwcQAlpiWN/iiBMYYnDh4shSj4wSqy+vZwZpJdNQEfi4dTbLCC2iICmxJHO
 mWBzmAVuM0p8X9EOlhAWsJe4uuctO4jNIqAqseHLNVYQm1fARuLUq0Y2iCPkJWZe+s4OEReU
 ODnzCVgvM1C8eets5gmMfLOQpGYhSS1gZFrFKJpaUJybnptcYKhXnJhbXJqXrpecn7uJERyi
 WkE7GJet/6t3iJGJg/EQowQHs5II7/wb3WlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeZVzOlOE
 BNITS1KzU1MLUotgskwcnFINTAY1bIwtXn/t3lnPv+638eAsk5c6ngxsDXsMd1xIK3vFtkE7
 R0fh6fNqmQkh7mFZeaFrhW+c9mNcsspkh0D8nkv/391IN1tu26bpurJqZmvwp/qGOB4TsXff
 Z79u5juzjOnWj6jUgqc5dTu/9UdHX9yrvCHn07nuI5/ZbshOm/84JWF/qgT7XjHnQ2nXOXef
 muG69PubmRteHNirrr7+7RXWCatav+T+2vCmfpOqyX/Op98UO+9N1M0zfyZn23jf7axE5Rr9
 2fzvtFwls4Uuv9rzXrKmuS320OWZuTNvfM3k5V7yneFnTsI/jZl+fmyeVp/5TyneW/CIbUpP
 T9nhuO/Tqt+qF95ZXPXxKK/c0pVKLMUZiYZazEXFiQDElAokwAIAAA==
X-CMS-MailID: 20240710115151epcas1p3a7dbc6b3f69375d64d51f32f4ce3d9a4
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240710115151epcas1p3a7dbc6b3f69375d64d51f32f4ce3d9a4
References: <CGME20240710115151epcas1p3a7dbc6b3f69375d64d51f32f4ce3d9a4@epcas1p3.samsung.com>
X-Spam-Score: -0.3 (/)
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
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sRVrc-0003bN-Iq
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: use meta inode for GC of COW file
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
Reviewed-by: Chao Yu <chao@kernel.org>
---
v3:
- make the mapping variable to select a proper inode
v2:
- use union for cow inode to point to atomic inode

 fs/f2fs/data.c   |  2 +-
 fs/f2fs/f2fs.h   | 13 +++++++++++--
 fs/f2fs/file.c   |  3 +++
 fs/f2fs/gc.c     |  7 +++++--
 fs/f2fs/inline.c |  2 +-
 fs/f2fs/inode.c  |  3 ++-
 6 files changed, 23 insertions(+), 7 deletions(-)

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
index cb3006551ab5..724bbcb447d3 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1171,7 +1171,8 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 static int ra_data_block(struct inode *inode, pgoff_t index)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct address_space *mapping = inode->i_mapping;
+	struct address_space *mapping = f2fs_is_cow_file(inode) ?
+				F2FS_I(inode)->atomic_inode->i_mapping : inode->i_mapping;
 	struct dnode_of_data dn;
 	struct page *page;
 	struct f2fs_io_info fio = {
@@ -1260,6 +1261,8 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 static int move_data_block(struct inode *inode, block_t bidx,
 				int gc_type, unsigned int segno, int off)
 {
+	struct address_space *mapping = f2fs_is_cow_file(inode) ?
+				F2FS_I(inode)->atomic_inode->i_mapping : inode->i_mapping;
 	struct f2fs_io_info fio = {
 		.sbi = F2FS_I_SB(inode),
 		.ino = inode->i_ino,
@@ -1282,7 +1285,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 				CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
 
 	/* do not read out */
-	page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
+	page = f2fs_grab_cache_page(mapping, bidx, false);
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
