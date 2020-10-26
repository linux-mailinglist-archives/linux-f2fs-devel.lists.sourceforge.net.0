Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 247E1299BF0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Oct 2020 00:54:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kXCJp-0000mV-Gg; Mon, 26 Oct 2020 23:54:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1kXCJn-0000mE-Sy
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 23:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dMOFyYKzcXfDAXFNN03stH+G2JpMB8zl7jn1M+H8Idc=; b=j6akg09VLDwoz6TxD1xF1n4weH
 +iKtmaJwwhhJe36PdpcKJ3KfDzLYSbWCmDpeAMZOM8ig4PS0Z51hetCxTBtq/but7k785awbRGgII
 Sr5cHq2SlJ4XSX16sBzw7S9MmXGAYvEc9yRJYHl+ZiXDUvF8a/3DW5kGKIG1cvsppULY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dMOFyYKzcXfDAXFNN03stH+G2JpMB8zl7jn1M+H8Idc=; b=HZRg65naZr1ijnWVyixeA6e02l
 oRwuo8GaTlTCBrUDDN7jV9iQjvtljkIafOchkt5lAhtRuiNCyoBgOJbV9mYrkalZ0illCwFuRC43o
 vj9cVyWJx7ztax0dWcqe+7d88XvsSirN7oDnnbcIRr94thHJSKQDar83DLR/FxD62New=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kXCJe-008CF5-9Z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 23:54:27 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FCD2221FA;
 Mon, 26 Oct 2020 23:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603756445;
 bh=dbIidrHvO2LTZ1rtd68b6hEu80AhIwSMM0OmTrHsQ/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cu3jCKoj/KPfng9JBS5B/VZU0QdNQoN3Cav6gmw7WCJmHNuubPsgZuMEW+GPajtIi
 HkGsh3M4LOGWwmj43wRFtAZQNr+3YImFYBGcVH6t4sE8+6N9Rj7ttkvNpnB2FDzXst
 wO0IRO6LCnv96Te7taKh7i3c8SxzmpPrYUv0Zm2U=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 26 Oct 2020 19:51:30 -0400
Message-Id: <20201026235205.1023962-98-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026235205.1023962-1-sashal@kernel.org>
References: <20201026235205.1023962-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kXCJe-008CF5-9Z
Subject: [f2fs-dev] [PATCH AUTOSEL 5.8 098/132] f2fs: fix to set
 SBI_NEED_FSCK flag for inconsistent inode
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit d662fad143c0470ad7f46ea7b02da539f613d7d7 ]

If compressed inode has inconsistent fields on i_compress_algorithm,
i_compr_blocks and i_log_cluster_size, we missed to set SBI_NEED_FSCK
to notice fsck to repair the inode, fix it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/inode.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 44582a4db513e..657a39c82e57d 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -292,6 +292,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
 						i_log_cluster_size)) {
 		if (ri->i_compress_algorithm >= COMPRESS_MAX) {
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
 				"compress algorithm: %u, run fsck to fix",
 				  __func__, inode->i_ino,
@@ -300,6 +301,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		}
 		if (le64_to_cpu(ri->i_compr_blocks) >
 				SECTOR_TO_BLOCK(inode->i_blocks)) {
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			f2fs_warn(sbi, "%s: inode (ino=%lx) has inconsistent "
 				"i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
 				  __func__, inode->i_ino,
@@ -309,6 +311,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		}
 		if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
 			ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
 				"log cluster size: %u, run fsck to fix",
 				  __func__, inode->i_ino,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
