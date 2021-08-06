Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 739163E1FA8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 02:05:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBnMB-0007T4-Gr; Fri, 06 Aug 2021 00:04:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mBnMA-0007Sx-Jq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 00:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vUyw4xxuuSio5WbPBEiqy9ufbMP7/NUXryxiD0dsuGk=; b=Q9UgAZnilmYNp/8rGUindxNvtS
 D1ZsNw7jJt/DhZPU5QZz8TeOIB4P6E07N2tC+7AKVNCyZqfd/cqVDV3hs9KvCUevzHAkXUWxxAtEF
 hoTqPVfm8Y61hJ7edihtlRmK29QFZgcR6zjjlcryGKDP8mfG5CPM/hEFvkr1sB6KA9BI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vUyw4xxuuSio5WbPBEiqy9ufbMP7/NUXryxiD0dsuGk=; b=C
 eruiH55Q9zELGrOSYLmaxBJG89/OhikhYMrvEPMZlbr+t6U5P/6NsuKICx3WgRLx7jcqDfvctKP0C
 1wpMr+vnzemLXwSXoBlKjE1rBGG6JBlX2D//lvk+Z2tE/rI1V+VA7VFVapv4BnjhiXx2JkUzYOn8Y
 bu0CWhBvx6eZ+thw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBnM4-00027Q-EB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 00:04:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABE7A61052;
 Fri,  6 Aug 2021 00:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628208287;
 bh=QykvfTGAsHjcJkODsRfvQvK4CqPrbWy32hloEXfurhA=;
 h=From:To:Cc:Subject:Date:From;
 b=Y6qZbVIX80Alj2b+SBYn7CXmak3lj4TsKPuetxF5dGtOz1p9mv7w6SibFxSdYky4A
 Vonx9jUmNt/EFzErXVflU3lwlkfx+SmniN5KjyN9ncs+xn4XuHOYVAVLMpPqbZxtx0
 fbHbp3GgpGSq6WsGRvWk9JpdXgFe6kkTO/xRX6jPASuFFyZT8aQLwCirfkzZ4fPKag
 MKaDDRMc+GW2RGGCK1MXm7KDSO63vS9E2e2xbs3ooaGmEDfyNFmD+X7+ailEOYDgoa
 aZVSf7l7vlscBMFN20mVNUUBvjlGSdJATKNZ2spC40XI6Y3Vc9kg1AXzVQHirE7a9U
 LNI4j5UfwXSTg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri,  6 Aug 2021 08:04:37 +0800
Message-Id: <20210806000437.39917-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mBnM4-00027Q-EB
Subject: [f2fs-dev] [PATCH] f2fs: fix to do sanity check for sb/cp fields
 correctly
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
Cc: stable@kernel.org, Chao Yu <chao.yu@linux.dev>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch fixes below problems of sb/cp sanity check:
- in sanity_check_raw_superi(), it missed to consider log header
blocks while cp_payload check.
- in f2fs_sanity_check_ckpt(), it missed to check nat_bits_blocks.

Cc: <stable@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 84cd085020cd..9e0e3c998142 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3264,11 +3264,13 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		return -EFSCORRUPTED;
 	}
 
-	if (le32_to_cpu(raw_super->cp_payload) >
-				(blocks_per_seg - F2FS_CP_PACKS)) {
-		f2fs_info(sbi, "Insane cp_payload (%u > %u)",
+	if (le32_to_cpu(raw_super->cp_payload) >=
+				(blocks_per_seg - F2FS_CP_PACKS -
+				NR_CURSEG_PERSIST_TYPE)) {
+		f2fs_info(sbi, "Insane cp_payload (%u >= %u)",
 			  le32_to_cpu(raw_super->cp_payload),
-			  blocks_per_seg - F2FS_CP_PACKS);
+			  blocks_per_seg - F2FS_CP_PACKS -
+			  NR_CURSEG_PERSIST_TYPE);
 		return -EFSCORRUPTED;
 	}
 
@@ -3304,6 +3306,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	unsigned int cp_pack_start_sum, cp_payload;
 	block_t user_block_count, valid_user_blocks;
 	block_t avail_node_count, valid_node_count;
+	unsigned int nat_blocks, nat_bits_bytes, nat_bits_blocks;
 	int i, j;
 
 	total = le32_to_cpu(raw_super->segment_count);
@@ -3434,6 +3437,17 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 		return 1;
 	}
 
+	nat_blocks = nat_segs << log_blocks_per_seg;
+	nat_bits_bytes = nat_blocks / BITS_PER_BYTE;
+	nat_bits_blocks = F2FS_BLK_ALIGN((nat_bits_bytes << 1) + 8);
+	if (__is_set_ckpt_flags(ckpt, CP_NAT_BITS_FLAG) &&
+		(cp_payload + F2FS_CP_PACKS +
+		NR_CURSEG_PERSIST_TYPE + nat_bits_blocks >= blocks_per_seg)) {
+		f2fs_warn(sbi, "Insane cp_payload: %u, nat_bits_blocks: %u)",
+			  cp_payload, nat_bits_blocks);
+		return -EFSCORRUPTED;
+	}
+
 	if (unlikely(f2fs_cp_error(sbi))) {
 		f2fs_err(sbi, "A bug case: need to run fsck");
 		return 1;
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
