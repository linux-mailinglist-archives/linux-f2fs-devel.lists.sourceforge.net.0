Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A43BA7C43B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Apr 2025 21:55:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u0n8D-0004C3-9K;
	Fri, 04 Apr 2025 19:55:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1u0n8B-0004Bv-Kp
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Apr 2025 19:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zwgj395ajodfe4c6ojvFdoR0yT6FlsSXGPbOr5KeF/E=; b=N4vigO6FEMmD6WFyxw44I1Mhna
 i0XyVL8LOGDn79m4SHQSuW6d2zlrZy9wSqAMKBuy8coKJS6a5zWD6qq9lTdcy4LKnu0UIxvlNySiF
 jco/79FMUWP3aOCUfR2HmqO5I4lcytJ44cyXvKSrtTjDu8Tlq4wM1umK7zbDsrH4EU5c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zwgj395ajodfe4c6ojvFdoR0yT6FlsSXGPbOr5KeF/E=; b=V
 cscMKYwiHIHVPIa0ZsXaF/syvILvHEZiszh7HMknIl/LucxQFQIgcqmOrDE3OFD2DGnBhO32UgUOq
 COLKnjPJjdAKetHH9OFR0c0iuOvbHZnvr6QMICBLePMb4ZQIHxmDtYAi/FqMayS3P3hj7prPBePjv
 e8BcBnb8DM8LKwmY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u0n7w-0006iz-EF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Apr 2025 19:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 58BDA61139
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Apr 2025 19:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F32C4CEDD;
 Fri,  4 Apr 2025 19:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743796485;
 bh=2UlsTHi7AOc8miGOqZhj4VPJ8gnJHtkD07YzMrfULlg=;
 h=From:To:Cc:Subject:Date:From;
 b=CEx/U85jhoYAMt09WN2v5Ga+FezzbD2Dz5tMaeiDaquWBw0BMfPsEDsVjFdLPVm92
 4o2Y07hxNTgPv3ZSG6ryzQgaGNk2Zs5ae+h1pDop+MAbB1lW5GdupMzofjas0x0ozY
 hWXYsa6L3cJGv8nUP+yTvtDINa+2ji6aTzTxZdDraEieAPu5pRFPPam1esWAj9yY/R
 31+WkXtfgqzTomaDLBVWEeDai9GYo/0Le+fBNxS4V8530CuLL4KDbtlyFemTRSKSCW
 qJyjLnB5yqJq7Bd8JX4p0n4cwHPYs4uijlS+QaoPUdz/zQgvlNsSX9FeODtdHX7pqU
 exNpjk2u4UFcA==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  4 Apr 2025 19:54:42 +0000
Message-ID: <20250404195442.413945-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
MIME-Version: 1.0
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: No functional change. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- fs/f2fs/segment.h | 40 ++++++++++++++++++++++++ 1 file changed,
 24 insertions(+), 
 16 deletions(-) diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h index
 0465dc00b349..5fcb1f92d506 100644 --- a/fs/f2fs/segment.h +++
 b/fs/f2fs/segment.h
 @@ -429,7 +429,6 @@ static inline void __set_free(struct f2fs [...] 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u0n7w-0006iz-EF
Subject: [f2fs-dev] [PATCH] f2fs: clean up unnecessary indentation
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No functional change.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.h | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 0465dc00b349..5fcb1f92d506 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -429,7 +429,6 @@ static inline void __set_free(struct f2fs_sb_info *sbi, unsigned int segno)
 	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
 	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
 	unsigned int next;
-	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi);
 
 	spin_lock(&free_i->segmap_lock);
 	clear_bit(segno, free_i->free_segmap);
@@ -437,7 +436,7 @@ static inline void __set_free(struct f2fs_sb_info *sbi, unsigned int segno)
 
 	next = find_next_bit(free_i->free_segmap,
 			start_segno + SEGS_PER_SEC(sbi), start_segno);
-	if (next >= start_segno + usable_segs) {
+	if (next >= start_segno + f2fs_usable_segs_in_sec(sbi)) {
 		clear_bit(secno, free_i->free_secmap);
 		free_i->free_sections++;
 	}
@@ -463,22 +462,31 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
 	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
 	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
 	unsigned int next;
-	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi);
+	bool ret;
 
 	spin_lock(&free_i->segmap_lock);
-	if (test_and_clear_bit(segno, free_i->free_segmap)) {
-		free_i->free_segments++;
-
-		if (!inmem && IS_CURSEC(sbi, secno))
-			goto skip_free;
-		next = find_next_bit(free_i->free_segmap,
-				start_segno + SEGS_PER_SEC(sbi), start_segno);
-		if (next >= start_segno + usable_segs) {
-			if (test_and_clear_bit(secno, free_i->free_secmap))
-				free_i->free_sections++;
-		}
-	}
-skip_free:
+	ret = test_and_clear_bit(segno, free_i->free_segmap);
+	if (!ret)
+		goto unlock_out;
+
+	free_i->free_segments++;
+
+	if (!inmem && IS_CURSEC(sbi, secno))
+		goto unlock_out;
+
+	/* check large section */
+	next = find_next_bit(free_i->free_segmap,
+			     start_segno + SEGS_PER_SEC(sbi), start_segno);
+	if (next < start_segno + f2fs_usable_segs_in_sec(sbi))
+		goto unlock_out;
+
+	ret = test_and_clear_bit(secno, free_i->free_secmap);
+	if (!ret)
+		goto unlock_out;
+
+	free_i->free_sections++;
+
+unlock_out:
 	spin_unlock(&free_i->segmap_lock);
 }
 
-- 
2.49.0.504.g3bcea36a83-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
