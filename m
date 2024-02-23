Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8B5861E36
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Feb 2024 21:55:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rdcaF-0005c8-AC;
	Fri, 23 Feb 2024 20:55:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rdcaD-0005bt-Qs
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 20:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VEWOc3/qVc2KPcpTDw+ll2WDFuxPJYoyTKvqkHF9X/Q=; b=c4Jbq3G/18LyTNLEMvDckGCo0y
 xaMTrW28wOkrlMMFbn1YGg8HHYMdXVpR6GiJBTABAnncrv1UrxbWEtUeujtGUc57WvqPQFmA2hAKG
 nNMqPoFKabUnHHtqw4OqVteYJSeCJmn6tXHJXDAikiCBqsn+pfEs987/Qfe+hHPQuEIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VEWOc3/qVc2KPcpTDw+ll2WDFuxPJYoyTKvqkHF9X/Q=; b=G
 A8NfJfRkbMljDzL4faDP/6nEzM3PYGc8NIJIX1gKoHE5+4kuFM1GvoUUV2VW5ZShTq29cNPxNHKMq
 ozh1mkEAamKPaoApPwsK4MbtM7McboUL8lBrUeBxwb2mNZUxayaWlwgusjFe/9aTIaVDEgl4kWLVj
 3ffkyYNnKwoBIOkM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rdcaD-0002pP-0p for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 20:55:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6FF336178E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Feb 2024 20:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F407EC433F1;
 Fri, 23 Feb 2024 20:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708721737;
 bh=wi3u34VTGkwAs5nfIRnTyLTx4oN1qD3NGEQPACYbTI8=;
 h=From:To:Cc:Subject:Date:From;
 b=aU2nOLhPL/RgRvW9sZrWBoEMGkQMKGW41pCk2KlqkmzUhp/hX99bvOtMW1LhYDrRd
 UpXbRlEDrnjPSA3Z0KBG+IoFaWzSBmJB5x+OAf7GWurnmoXDD9q/kagKm6IOFreHzz
 zivFOs6zRM2qczbiEPefUbwQ7scYiP/8CYr1mRvTg+F+cnhc74lt0vVXBOuKVVfEr8
 VBkam+Zf9kUUPIV/XoXtvKMjO6CFCv7tkPcou25L5en85RW/vXwcC0McK1fxlaluYF
 R0/oJ/6kTuYdO9+fGO9js6zx5uU1LlNkAeML4+TgHU7wP4amKPogX86X9vGjFsbnL2
 136s3D2xeMrbg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 23 Feb 2024 12:55:31 -0800
Message-ID: <20240223205535.307307-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In cfd66bb715fd ("f2fs: fix deadloop in foreground GC"), we
 needed to check the number of blocks in a section instead of the segment.
 In addtion, let's check the entire node sections when checking the avaiable
 node block space. It does not match one to one per temperature, but currently
 we don't have exact dirty page count per tempe [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rdcaD-0002pP-0p
Subject: [f2fs-dev] [PATCH 1/5] f2fs: check number of blocks in a current
 section
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In cfd66bb715fd ("f2fs: fix deadloop in foreground GC"), we needed to check
the number of blocks in a section instead of the segment.

In addtion, let's check the entire node sections when checking the avaiable
node block space. It does not match one to one per temperature, but currently
we don't have exact dirty page count per temperature. Hence, use a rough
estimation.

Fixes: cfd66bb715fd ("f2fs: fix deadloop in foreground GC")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 3edd3809b6b5..15bf5edd9b3c 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -561,23 +561,23 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 			unsigned int node_blocks, unsigned int dent_blocks)
 {
 
-	unsigned int segno, left_blocks;
+	unsigned segno, left_blocks;
 	int i;
 
-	/* check current node segment */
+	/* check current node sections, which counts very roughly */
+	left_blocks = 0;
 	for (i = CURSEG_HOT_NODE; i <= CURSEG_COLD_NODE; i++) {
 		segno = CURSEG_I(sbi, i)->segno;
-		left_blocks = f2fs_usable_blks_in_seg(sbi, segno) -
-				get_seg_entry(sbi, segno)->ckpt_valid_blocks;
-
-		if (node_blocks > left_blocks)
-			return false;
+		left_blocks += CAP_BLKS_PER_SEC(sbi) -
+				get_ckpt_valid_blocks(sbi, segno, true);
 	}
+	if (node_blocks > left_blocks)
+		return false;
 
-	/* check current data segment */
+	/* check current data section for dentry blocks. */
 	segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
-	left_blocks = f2fs_usable_blks_in_seg(sbi, segno) -
-			get_seg_entry(sbi, segno)->ckpt_valid_blocks;
+	left_blocks = CAP_BLKS_PER_SEC(sbi) -
+			get_ckpt_valid_blocks(sbi, segno, true);
 	if (dent_blocks > left_blocks)
 		return false;
 	return true;
@@ -626,7 +626,7 @@ static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
 
 	if (free_secs > upper_secs)
 		return false;
-	else if (free_secs <= lower_secs)
+	if (free_secs <= lower_secs)
 		return true;
 	return !curseg_space;
 }
-- 
2.44.0.rc0.258.g7320e95886-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
