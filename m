Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4472F8B341F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Apr 2024 11:34:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s0Hy1-0008AO-Tr;
	Fri, 26 Apr 2024 09:34:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s0Hy0-0008AA-C8
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Apr 2024 09:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a2t32aY/G09n6pbZpGkd6rEMhEmG8zQtVjcL/nWtfr4=; b=lIoLDSeiCwUEgHCPMl4KxgDb77
 Fpg0XM3tFtKSStYh6SDyypQsdn620R6MrxrO89KfkQUhTWpLgAiDtPXU0F96k0ZdL1A47xLzEe+x5
 Kap1NTaqKD8x0KAUS5jQ7qr/dHwiUMzQAgOIVREPW+lEhSHfa7l2q0Mnh0Kjqum5FTAE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=a2t32aY/G09n6pbZpGkd6rEMhEmG8zQtVjcL/nWtfr4=; b=Z
 ZXfjcUabP3cGK+23Ms2famj7Iutusl2LIWF6zX17Tc7wj8q08IKPnyeeQ7doc5kpV2PXpoU4kg4mx
 SM40pw/HQlDnPUAjZO1rWNhhn7lw7QkME63OvhvRUbMEfNQp2IdET+EM1T6rCq28rMkcxhO07xdm3
 +1u+Ue98nwd6tPIY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s0Hxz-0004wk-F2 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Apr 2024 09:34:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 82E5962030;
 Fri, 26 Apr 2024 09:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821A3C113CD;
 Fri, 26 Apr 2024 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714124038;
 bh=HF9FygCkrUCOWv1FRx+lwLlEuJ62OvrqDXz7ynsbe8s=;
 h=From:To:Cc:Subject:Date:From;
 b=jVQjZxoL58daYHJEOErMTjYz+2gxxdXEQDbVkU1O+yBl0YDklLpTtxyKQAySLlFdX
 lZ5XS2LtUwv1aaf3xZ46QaKH0xD94sScQdmhdWxw/EIVZdwVc8WNE1z6czWGpMjMaD
 JDUlWHm3W0CAXueuuKp0XAYcQlbJ3pHO84nS/m08Eu2y4zdUB8RSef/pG2Ude5UOCH
 yMj/hYMM/gIIkwimjjO/itS/WyfvfaABPm1ptvfbp3M92Mv+J0KXlVz4QiZLrN/t48
 QUxgGinOY9QdRXima3utm8VPqpy1/XslL12yD5KU0x0O+x2hm2pGv4HaCBgHlh8a8Y
 JRyuZPb7/ZhvQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 26 Apr 2024 17:33:48 +0800
Message-Id: <20240426093348.377018-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If active_log is not 6, we never use WARM_DATA segment, let's
 avoid allocating WARM_DATA segment for direct IO. Signed-off-by: Yunlei He
 <heyunlei@oppo.com> Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/data.c
 | 3 ++- fs/f2fs/f2fs.h | 2 +- fs/f2fs/file.c | 5 +++-- fs/f2fs/segment.c
 | 11 +++++++++-- 4 fil [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s0Hxz-0004wk-F2
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid allocating WARM_DATA segment
 for direct IO
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

If active_log is not 6, we never use WARM_DATA segment, let's
avoid allocating WARM_DATA segment for direct IO.

Signed-off-by: Yunlei He <heyunlei@oppo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c    |  3 ++-
 fs/f2fs/f2fs.h    |  2 +-
 fs/f2fs/file.c    |  5 +++--
 fs/f2fs/segment.c | 11 +++++++++--
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index bee1e45f76b8..0c516c653f05 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4179,7 +4179,8 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	map.m_lblk = bytes_to_blks(inode, offset);
 	map.m_len = bytes_to_blks(inode, offset + length - 1) - map.m_lblk + 1;
 	map.m_next_pgofs = &next_pgofs;
-	map.m_seg_type = f2fs_rw_hint_to_seg_type(inode->i_write_hint);
+	map.m_seg_type = f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
+						inode->i_write_hint);
 	if (flags & IOMAP_WRITE)
 		map.m_may_create = true;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e8ff301eaf32..6dd50a6075c0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3747,7 +3747,7 @@ int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
 void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
 int __init f2fs_create_segment_manager_caches(void);
 void f2fs_destroy_segment_manager_caches(void);
-int f2fs_rw_hint_to_seg_type(enum rw_hint hint);
+int f2fs_rw_hint_to_seg_type(struct f2fs_sb_info *sbi, enum rw_hint hint);
 enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
 			enum page_type type, enum temp_type temp);
 unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 856a5d3bd6bf..23601d747716 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4643,7 +4643,8 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 
 	map.m_may_create = true;
 	if (dio) {
-		map.m_seg_type = f2fs_rw_hint_to_seg_type(inode->i_write_hint);
+		map.m_seg_type = f2fs_rw_hint_to_seg_type(sbi,
+						inode->i_write_hint);
 		flag = F2FS_GET_BLOCK_PRE_DIO;
 	} else {
 		map.m_seg_type = NO_CHECK_TYPE;
@@ -4696,7 +4697,7 @@ static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
 {
 	struct inode *inode = iter->inode;
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	int seg_type = f2fs_rw_hint_to_seg_type(inode->i_write_hint);
+	int seg_type = f2fs_rw_hint_to_seg_type(sbi, inode->i_write_hint);
 	enum temp_type temp = f2fs_get_segment_temp(seg_type);
 
 	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8313d6aeaf41..94f3380be04c 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3358,8 +3358,14 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
 	return err;
 }
 
-int f2fs_rw_hint_to_seg_type(enum rw_hint hint)
+int f2fs_rw_hint_to_seg_type(struct f2fs_sb_info *sbi, enum rw_hint hint)
 {
+	if (F2FS_OPTION(sbi).active_logs == 2)
+		return CURSEG_HOT_DATA;
+	else if (F2FS_OPTION(sbi).active_logs == 4)
+		return CURSEG_COLD_DATA;
+
+	/* active_log == 6 */
 	switch (hint) {
 	case WRITE_LIFE_SHORT:
 		return CURSEG_HOT_DATA;
@@ -3499,7 +3505,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 				is_inode_flag_set(inode, FI_HOT_DATA) ||
 				f2fs_is_cow_file(inode))
 			return CURSEG_HOT_DATA;
-		return f2fs_rw_hint_to_seg_type(inode->i_write_hint);
+		return f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
+						inode->i_write_hint);
 	} else {
 		if (IS_DNODE(fio->page))
 			return is_cold_node(fio->page) ? CURSEG_WARM_NODE :
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
