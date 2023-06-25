Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF3273CFBB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jun 2023 11:29:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDM3A-0007K3-Jm;
	Sun, 25 Jun 2023 09:28:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qDM39-0007Jw-BI
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 09:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YhWKKahOYPQ43uve/NtHgwi6Os53ZNN074b8kaGpFgo=; b=MxRCx+UmeqjrVCca/wIovPLaew
 BD1ngAZFbTTeYjLqEplQUvY0F6WpCBtFO9OpjiwCVjmQVnJr+0dtchHQqcpTUIWgF/i/uf4Ph2CuY
 zFXPLE3kowGALpB+DnsQ3H6pRqFXWs19YibRxobG058y5QZx7X8qC3+KlNWQkh/gXhPo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YhWKKahOYPQ43uve/NtHgwi6Os53ZNN074b8kaGpFgo=; b=P
 500ltQHvr0AZiKVauGOyjZfo4itEIFNUgkU0Gzoe1V1p+tq0vrXoAi6dPthmNALasWBlwLP8OAzPj
 pcyxwjf0taFlgpkrvS5JnncpqACNcd+5OR/tzguVUr+Lp66RXB3tUbtxCM2C6OeLooOtAiqmHAcOW
 vndcOOXBzhk53WJY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qDM38-0000o2-0G for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 09:28:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A00660A57
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 25 Jun 2023 09:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D20C433C0;
 Sun, 25 Jun 2023 09:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687685324;
 bh=XOCBo769pojfHKL4fhwdoGVIkWUIGJa9W9/o62f5gBg=;
 h=From:To:Cc:Subject:Date:From;
 b=h+885cEYlvGTYerKe5XPFJ6FX4zVLoigq2K2TWKqY3Q4jqO+zjmg4BoksqoXENenU
 xzGtZUHXMCgZGHiFnQdWwZQ7ds9beISkbmrrbH+vGQTe75vrQ6qQJi4ASj+jV1zqiL
 0qFoyuTxkzzt/SNO7qxv60BBziDrvPWia3gZnBRmlNTFoxeO1mZtmZzCkw8FIbsJQb
 xDX9KONF62YSwpMmoGB4kFBGxu+E8enPcyP5VYGR+qqqXpX15ny5UPfvIuDP9AaFQI
 +6lsl/j6bEwLlIkgeJ1PnLBYlgIFW14QNOObfq5zxkPBl/LzCb5Ykc5O/fKjwLSRbB
 KWMHy4sxE0hiQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 25 Jun 2023 17:28:32 +0800
Message-Id: <20230625092832.2936779-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Previously,
 fsck fixes summary entry and writeback last summary
 block into SSA area, however, it missed to flush summary cache in CP area,
 result in repair failure. This patch fixes to call ASSERT_MSG() for such
 case, in order to trigger additional checkpoint during fsck_verify(), so that
 last fixed summary entry can be persisted correctly. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qDM38-0000o2-0G
Subject: [f2fs-dev] [PATCH] fsck.f2fs: fix to call ASSERT_MSG() in
 is_valid_ssa_{data, node}_blk()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, fsck fixes summary entry and writeback last summary block into
SSA area, however, it missed to flush summary cache in CP area, result in
repair failure.

This patch fixes to call ASSERT_MSG() for such case, in order to trigger
additional checkpoint during fsck_verify(), so that last fixed summary
entry can be persisted correctly.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index a4db2a3..051510f 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -171,7 +171,7 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_info *sbi, u32 nid,
 		need_fix = 1;
 		se = get_seg_entry(sbi, segno);
 		if(IS_NODESEG(se->type)) {
-			FIX_MSG("Summary footer indicates a node segment: 0x%x", segno);
+			ASSERT_MSG("Summary footer indicates a node segment: 0x%x", segno);
 			sum_blk->footer.entry_type = SUM_TYPE_NODE;
 		} else {
 			ret = -EINVAL;
@@ -197,7 +197,7 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_info *sbi, u32 nid,
 			ASSERT_MSG("Invalid node seg summary\n");
 			ret = -EINVAL;
 		} else {
-			FIX_MSG("Set node summary 0x%x -> [0x%x] [0x%x]",
+			ASSERT_MSG("Set node summary 0x%x -> [0x%x] [0x%x]",
 						segno, nid, blk_addr);
 			sum_entry->nid = cpu_to_le32(nid);
 			need_fix = 1;
@@ -296,7 +296,7 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 		need_fix = 1;
 		se = get_seg_entry(sbi, segno);
 		if (IS_DATASEG(se->type)) {
-			FIX_MSG("Summary footer indicates a data segment: 0x%x", segno);
+			ASSERT_MSG("Summary footer indicates a data segment: 0x%x", segno);
 			sum_blk->footer.entry_type = SUM_TYPE_DATA;
 		} else {
 			ret = -EINVAL;
@@ -329,7 +329,7 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 			/* delete wrong index */
 			ret = -EINVAL;
 		} else {
-			FIX_MSG("Set data summary 0x%x -> [0x%x] [0x%x] [0x%x]",
+			ASSERT_MSG("Set data summary 0x%x -> [0x%x] [0x%x] [0x%x]",
 					segno, parent_nid, version, idx_in_node);
 			sum_entry->nid = cpu_to_le32(parent_nid);
 			sum_entry->version = version;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
