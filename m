Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C90299B73
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Oct 2020 00:51:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kXCGz-0000JE-O3; Mon, 26 Oct 2020 23:51:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1kXCGx-0000Iv-RB
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 23:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qHUdLXVErMbGelZOAuqWxxoRrWGEVMeU7Iw5vOUsBkc=; b=AVDszLR6epLLMevp821M8tn0gN
 aKRv2AWgRAhVhILVYj7qJ7iG7yql0YQSDHLwstmDOafU8+t7sLAzQphEaaApHaGNobCRzUlCqv/eg
 2IxX/irLPNa94DT7l03K3jWJjoLURoX2hd3H7ZaX16fSeqbxjIdwx2bLZr6321wp3Rgc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qHUdLXVErMbGelZOAuqWxxoRrWGEVMeU7Iw5vOUsBkc=; b=PpoWecFmGZlFOW0or2mp9KV6Rw
 jyt0pAoj4wqRiAooJOxJs+LSNba0j5GSedNq5p6gSkop5Qhw7TDn3Dkw5fV1ID2Ikw2mJxexAm+I2
 KCtqugmsqKBNw1DITUzyTydgKpsXyzKCIhMZYhVhKZ6jbBWrYbrmQ9KvhbyHQ9Z0PVSU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kXCGm-008C5o-0q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 23:51:31 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB4FD221F7;
 Mon, 26 Oct 2020 23:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603756274;
 bh=DriNn/C243SA7vKnjcnOtZOi+39F3FDPSQWb2qe5UWE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k7QMhEoIUJL9ZBVBOGKlsdVTngbqoblQAJ2exMar1dYTc9obtWHS4cWxngSr0Vli5
 AJy80mkRJGzRBCWAgVRf47b1tD+y2w6Usjpe18xbPZZatdAhYVZjFyLeSUAHdXWenh
 fZOQWUL126IO8TlmVGuNFbvoci6msEzcAxc0gy/0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 26 Oct 2020 19:48:24 -0400
Message-Id: <20201026234905.1022767-106-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026234905.1022767-1-sashal@kernel.org>
References: <20201026234905.1022767-1-sashal@kernel.org>
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
X-Headers-End: 1kXCGm-008C5o-0q
Subject: [f2fs-dev] [PATCH AUTOSEL 5.9 106/147] f2fs: fix to set
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
index 66969ae852b97..84c67409b1c96 100644
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
