Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BFE85BC83
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 13:46:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcPVW-0007My-Tf;
	Tue, 20 Feb 2024 12:45:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcPVV-0007Mr-Cx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 12:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kloJxlT96gDbvxqb5PWNpTfvPyghWuN42yvYOBf1aKs=; b=UqH9HZETOPAYyvvyzsCVOf8hDs
 vCVU3z4LvBldQz7wvVkKLsPeqJ60/7WH18VQg3t3SxmNWJOWMMeD+DOGZIJvoAelKtvIl1I9lWXJn
 Qy4CNghn/Uj7wjA/34QIFNuiiSmQUrRmP5K5AeubKX0ZTm2pHa4VLhgzABm6L92JJDRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kloJxlT96gDbvxqb5PWNpTfvPyghWuN42yvYOBf1aKs=; b=Kv6URXu4b31Q/UA7KflAJZmOef
 XxojIIxmFxG6z8dKcNdhnjgN675jtzR1z9V3Q4fawkGR923acn0c7Y4yrGROEwLLVfmyY6cIjKGgy
 IfleTQTplPmdzBBUmBqc+uIKKIANqcQnQtRPrGVtlYd/nl8xCiBofnTdFKNxyfh470SA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcPVU-0007b3-02 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 12:45:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DE17060F84
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Feb 2024 12:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEB6C433F1;
 Tue, 20 Feb 2024 12:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708433151;
 bh=djwOOba0xhmuKwtaju9RvzKtfa29S99ymYRH2WrDa9s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MdI0zF02GeEJ4WoUpmBC08brGAsqKT2jkSye5APLl85SK4AtP2EK1INVPeBK6kQJ0
 5/ywhVXN0eolMW8ByRmgLLt0ncHcBD0BfDdhmtH4Y7FRGbF7lsHV6vFKfg5uDX/kMP
 GfmSFLO8yXYS/yl5dfm21IF3su9d04aJvKb2IVgU5QdgUJsrQwAf743Atc6noG+DGc
 88Bi1jV+dK5lqjcC6JVDYAfagYkVrawP9/mYfbiPwTrrKqbjvZIRBw7/WKGd8RE5PQ
 iELel8JNtiijBqJxH2bEpYLxufgxTkFjt/UT5pmuyLetJrW4qLSpuzDjTeUmaAg853
 4u0cmyo/foeIw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 20 Feb 2024 20:45:36 +0800
Message-Id: <20240220124537.11531-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240220124537.11531-1-chao@kernel.org>
References: <20240220124537.11531-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use NULL_ADDR macro to instead magic number for cleanup.
 Signed-off-by:
 Chao Yu <chao@kernel.org> --- fsck/fsck.c | 14 +++++++------- 1 file changed, 
 7 insertions(+), 7 deletions(-) diff --git a/fsck/fsck.c b/fsck/fsck.c index
 3461a52..14a9628 100644 --- a/fsck/fsck.c +++ b/fsck/fsck.c @@ -1071, 13 +1071,
 13
 @@ check_next: qf_szchk_type[cur_qtype] = QF_SZCHK_INLINE; block_t blkaddr
 [...] Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcPVU-0007b3-02
Subject: [f2fs-dev] [PATCH 2/3] f2fs-tools: use NULL_ADDR macro to instead
 magic number for cleanup
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

Use NULL_ADDR macro to instead magic number for cleanup.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 3461a52..14a9628 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1071,13 +1071,13 @@ check_next:
 			qf_szchk_type[cur_qtype] = QF_SZCHK_INLINE;
 		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs]);
 
-		if (blkaddr != 0) {
+		if (blkaddr != NULL_ADDR) {
 			ASSERT_MSG("[0x%x] wrong inline reserve blkaddr:%u",
 					nid, blkaddr);
 			if (c.fix_on) {
 				FIX_MSG("inline_data has wrong 0'th block = %x",
 								blkaddr);
-				node_blk->i.i_addr[ofs] = 0;
+				node_blk->i.i_addr[ofs] = NULL_ADDR;
 				node_blk->i.i_blocks = cpu_to_le64(*blk_cnt);
 				need_fix = 1;
 			}
@@ -1121,7 +1121,7 @@ check_next:
 			if (c.fix_on) {
 				FIX_MSG("inline_dentry has wrong 0'th block = %x",
 								blkaddr);
-				node_blk->i.i_addr[ofs] = 0;
+				node_blk->i.i_addr[ofs] = NULL_ADDR;
 				node_blk->i.i_blocks = cpu_to_le64(*blk_cnt);
 				need_fix = 1;
 			}
@@ -1161,8 +1161,8 @@ check_next:
 					node_blk->i.i_addr[ofs + idx] =
 							NULL_ADDR;
 					need_fix = 1;
-					FIX_MSG("[0x%x] i_addr[%d] = 0", nid,
-							ofs + idx);
+					FIX_MSG("[0x%x] i_addr[%d] = NULL_ADDR",
+							nid, ofs + idx);
 				}
 				continue;
 			}
@@ -1190,9 +1190,9 @@ check_next:
 			if (cur_qtype != -1 && blkaddr != NEW_ADDR)
 				qf_last_blkofs[cur_qtype] = child.pgofs;
 		} else if (c.fix_on) {
-			node_blk->i.i_addr[ofs + idx] = 0;
+			node_blk->i.i_addr[ofs + idx] = NULL_ADDR;
 			need_fix = 1;
-			FIX_MSG("[0x%x] i_addr[%d] = 0", nid, ofs + idx);
+			FIX_MSG("[0x%x] i_addr[%d] = NULL_ADDR", nid, ofs + idx);
 		}
 	}
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
