Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B6680BA00
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Dec 2023 10:21:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCFzy-0007VZ-0u;
	Sun, 10 Dec 2023 09:21:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rCFzu-0007Uf-5X
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 09:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nzuKnedrEWC6imVBrtc3Ahv7ofZ1i17PF18F+M1hMpI=; b=A0LHmmpTmb/7tgrybK46fpuRbO
 suF5yZxMIIZ6GJDonqqrXh0Rmq4+Joc7rHQmpa8gXAP/YeUK60K8pzMuEjA1CB/lMBFqtj+Q5jVAk
 xsVEcpFEuainbqDt+9VNWPkWnhlQChyPbRcn40zrdMuH9yGoakV7alkWBLmjilkrLM5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nzuKnedrEWC6imVBrtc3Ahv7ofZ1i17PF18F+M1hMpI=; b=D4oDkCh0BG0lInN/nBfhjW1YIc
 feuX30ZUZxW5DICsRxGTpDen8j1f8zYxUQWN085VjvMEDlhGjYrWWYdFJEoj3DTIR9I727usQ6Mdm
 GkWrPwvze1BDnllCZnVok+7WaeHBqQ157w0b1YdD+IphuTNuZYKgGxfSb2n9jY0/yoTc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCFzq-0002n7-98 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 09:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B0E06CE0AC4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Dec 2023 09:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40CFC433C7;
 Sun, 10 Dec 2023 09:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702200055;
 bh=eUCNfxU2ZBnjWJhSbW0ed8WQRjl0G3WQDgSCqx5F8l4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CsAAwj/MMr5jSOHLX75QKHpCQxJtZVXufXnZ6XxIMswho/8WFi8muJOhFEAk0mBNc
 82vlvK36Hj45Wn+lAU52WNuPlO7MFhdvSjTgjBBwFUAh22Mjr1BnZ71MHQA/NSZiVO
 NQp+nEztmeLMTbKh9DaYeM6ztfhmTRbAgmQq6nbZoH6+BWj2/L5LX6hM/FyV+gUVeM
 3B5BxJ4kJ/+MsnVvRR+sNYzJfzdJv6pgxe0kxvwqbU1LvLMXxE/kxscHdcKZOtMWVg
 CMT6YQWKIS+EPzY5xwXZyEY97SJucA/U9M40cxsnrmCIqk53e5WtASetoCsJ+B5xd4
 pLncCxPkj9n2Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 10 Dec 2023 17:20:39 +0800
Message-Id: <20231210092040.3374741-5-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231210092040.3374741-1-chao@kernel.org>
References: <20231210092040.3374741-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Just cleanup,
 no logic changes. Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/data.c | 8 +++----- fs/f2fs/f2fs.h | 7 +++++++ fs/f2fs/gc.c |
 5 ++--- fs/f2fs/segment.c | 14 ++++ 4 files changed, 16 insertions(+), 18
 d [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rCFzq-0002n7-98
Subject: [f2fs-dev] [PATCH 5/6] f2fs: introduce
 f2fs_invalidate_internal_cache() for cleanup
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

Just cleanup, no logic changes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c    |  8 +++-----
 fs/f2fs/f2fs.h    |  7 +++++++
 fs/f2fs/gc.c      |  5 ++---
 fs/f2fs/segment.c | 14 ++++----------
 4 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d86419b01310..27015b7875ae 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1484,11 +1484,9 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	old_blkaddr = dn->data_blkaddr;
 	f2fs_allocate_data_block(sbi, NULL, old_blkaddr, &dn->data_blkaddr,
 				&sum, seg_type, NULL);
-	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO) {
-		invalidate_mapping_pages(META_MAPPING(sbi),
-					old_blkaddr, old_blkaddr);
-		f2fs_invalidate_compress_page(sbi, old_blkaddr);
-	}
+	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO)
+		f2fs_invalidate_internal_cache(sbi, old_blkaddr);
+
 	f2fs_update_data_blkaddr(dn, dn->data_blkaddr);
 	return 0;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 50e666ebd987..65294e3b0bef 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4613,6 +4613,13 @@ static inline bool f2fs_is_readonly(struct f2fs_sb_info *sbi)
 	return f2fs_sb_has_readonly(sbi) || f2fs_readonly(sbi->sb);
 }
 
+static inline void f2fs_invalidate_internal_cache(struct f2fs_sb_info *sbi,
+								block_t blkaddr)
+{
+	invalidate_mapping_pages(META_MAPPING(sbi), blkaddr, blkaddr);
+	f2fs_invalidate_compress_page(sbi, blkaddr);
+}
+
 #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
 #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2fbe16ad726f..405a6077bd83 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1380,9 +1380,8 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	memcpy(page_address(fio.encrypted_page),
 				page_address(mpage), PAGE_SIZE);
 	f2fs_put_page(mpage, 1);
-	invalidate_mapping_pages(META_MAPPING(fio.sbi),
-				fio.old_blkaddr, fio.old_blkaddr);
-	f2fs_invalidate_compress_page(fio.sbi, fio.old_blkaddr);
+
+	f2fs_invalidate_internal_cache(fio.sbi, fio.old_blkaddr);
 
 	set_page_dirty(fio.encrypted_page);
 	if (clear_page_dirty_for_io(fio.encrypted_page))
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 007ebb107236..61da26eb61cc 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2500,8 +2500,7 @@ void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr)
 	if (addr == NEW_ADDR || addr == COMPRESS_ADDR)
 		return;
 
-	invalidate_mapping_pages(META_MAPPING(sbi), addr, addr);
-	f2fs_invalidate_compress_page(sbi, addr);
+	f2fs_invalidate_internal_cache(sbi, addr);
 
 	/* add it into sit main buffer */
 	down_write(&sit_i->sentry_lock);
@@ -3562,11 +3561,8 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 reallocate:
 	f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
 			&fio->new_blkaddr, sum, type, fio);
-	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO) {
-		invalidate_mapping_pages(META_MAPPING(fio->sbi),
-					fio->old_blkaddr, fio->old_blkaddr);
-		f2fs_invalidate_compress_page(fio->sbi, fio->old_blkaddr);
-	}
+	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO)
+		f2fs_invalidate_internal_cache(fio->sbi, fio->old_blkaddr);
 
 	/* writeout dirty page into bdev */
 	f2fs_submit_page_write(fio);
@@ -3762,9 +3758,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		update_sit_entry(sbi, new_blkaddr, 1);
 	}
 	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO) {
-		invalidate_mapping_pages(META_MAPPING(sbi),
-					old_blkaddr, old_blkaddr);
-		f2fs_invalidate_compress_page(sbi, old_blkaddr);
+		f2fs_invalidate_internal_cache(sbi, old_blkaddr);
 		if (!from_gc)
 			update_segment_mtime(sbi, old_blkaddr, 0);
 		update_sit_entry(sbi, old_blkaddr, -1);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
