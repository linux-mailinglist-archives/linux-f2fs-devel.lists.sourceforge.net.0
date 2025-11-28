Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7F5C916EB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Nov 2025 10:25:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u0DaRhipJw4tWujKfJ0K2OVv9acTm0Cf8AW0uHT4kc4=; b=XYPCEBSZvu/+rCwESRFz07v0x4
	w9Dg3y4nC2RYefIHvuTWxHDFMDqU2NBFkdcYZySlwffz3EuaeWdOwSTjRHvWgXrnSWgtDJDC+esRQ
	Y41nFfyoGM4/pJq3JkJUuVNCwk9HRTMz6ojyfQh4BWK780XjAiGGCRrxtRsYLc7ByfDw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOujJ-0003KQ-56;
	Fri, 28 Nov 2025 09:25:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vOujH-0003KK-OI
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Nov 2025 09:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kp2Qdz8cITv+0AkaRvnAXbD5KNmGI/k1BNSzv9SWi5Q=; b=iEXW3wHsqGeJup/S+yy2Xf/AhX
 M+Cc0ihkL9zWH5QIg4GF9TGSEzrXcxegSp2yNmfzqQXa4iMCf2NkS/id1q3+ayy8isyroTCN9tNWW
 YjSVyBMbgaqUdkR/NlAQNzIKEL0/kEPZV8IIymoedOo9vQsS8jqiEfAahKZpEP3VuZ4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kp2Qdz8cITv+0AkaRvnAXbD5KNmGI/k1BNSzv9SWi5Q=; b=G
 WumSc7yMTNkh29neIlRHsDXdA55pPC21oUj11FJ6FtlH6mehnSgdHS+TbggKG1yOY+T+wOHLWfM2s
 jUnWesxF0C3Vo0fBCl4bqOfSDXTAYXo4jEj6p+Y705NUDf2AF0YsOTD1XCrmMMQ93E9N4ZA6YAyEg
 rbBgxeBNySlcUDwI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vOujH-0007kS-BJ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Nov 2025 09:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B509B60203
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Nov 2025 09:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC03C4CEF1;
 Fri, 28 Nov 2025 09:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764321916;
 bh=QwDyFbcLSb1sukYfwD0cJ2NJv7pmxdU8vjSc2z+8laA=;
 h=From:To:Cc:Subject:Date:From;
 b=XxPtV50b7r90A/uRvONglOCs+b8Ubzf40+hdwpuy6FwGytI8Mbn2s+YJMMtu3tXTY
 MFEpUYTM4FLA5uvEVoy7X9j9TJXLn89qLt9i/9ct/k7CAacw1OL6Cnn6BqKotBtAAl
 ycc+03uEMeSBI5BRtkucQkNJ8SVle3GWExDBwOkgx44JtxGG/c39qVh+qsirfAsOk8
 TWfsRcEi6gnoj5XMBkZ1ebLfiBrsOG2N0FgRBFWCm7dg1ynHDX+y1K8+qC6z/7ISjl
 sHlhWDtnUG9zK5oO8+B4WltL4TN9SiJBI8w7m7+M7Of+fVIovS5bJPOYklgSLnRLAV
 NspkfV8qppDIQ==
To: jaegeuk@kernel.org
Date: Fri, 28 Nov 2025 17:25:07 +0800
Message-ID: <20251128092507.1607278-1-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  w/ LFS mode, in get_left_section_blocks(),
 we should not account
 the blocks which were used before and now are invalided, otherwise those
 blocks will be counted as freed one in has_curseg_enough_space [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vOujH-0007kS-BJ
Subject: [f2fs-dev] [PATCH] f2fs: fix to not account invalid blocks in
 get_left_section_blocks()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

w/ LFS mode, in get_left_section_blocks(), we should not account the
blocks which were used before and now are invalided, otherwise those
blocks will be counted as freed one in has_curseg_enough_space(), result
in missing to trigger GC in time.

Cc: stable@kernel.org
Fixes: 249ad438e1d9 ("f2fs: add a method for calculating the remaining blocks in the current segment in LFS mode.")
Fixes: bf34c93d2645 ("f2fs: check curseg space before foreground GC")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 51eecb861a78..b08f18274440 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -612,10 +612,12 @@ static inline int reserved_sections(struct f2fs_sb_info *sbi)
 static inline unsigned int get_left_section_blocks(struct f2fs_sb_info *sbi,
 					enum log_type type, unsigned int segno)
 {
-	if (f2fs_lfs_mode(sbi) && __is_large_section(sbi))
-		return CAP_BLKS_PER_SEC(sbi) - SEGS_TO_BLKS(sbi,
-			(segno - GET_START_SEG_FROM_SEC(sbi, segno))) -
+	if (f2fs_lfs_mode(sbi)) {
+		unsigned int used_blocks = __is_large_section(sbi) ? SEGS_TO_BLKS(sbi,
+				(segno - GET_START_SEG_FROM_SEC(sbi, segno))) : 0;
+		return CAP_BLKS_PER_SEC(sbi) - used_blocks -
 			CURSEG_I(sbi, type)->next_blkoff;
+	}
 	return CAP_BLKS_PER_SEC(sbi) - get_ckpt_valid_blocks(sbi, segno, true);
 }
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
