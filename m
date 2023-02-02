Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E736876D9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 08:56:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNUSb-0003Pj-Kb;
	Thu, 02 Feb 2023 07:56:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pNUSa-0003Pd-BO
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 07:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0nCIp5n8tZD0HRjjNynsbU6tSVUGJ4HVBaDeE4Nh7xk=; b=nNMv8YevPXMZr1R8NSfRYwkdQu
 EBJ/9e9JxE+OnqOyMZ+j2mjnCZGnVfzA40HH2YEy0GzmCm1bXsj+KHY0MMv4uKGaF4otzwXKFLkX7
 pSLJIZ+/sH8WDLKsv1oygdf06u3N6DA3AlKOa1jj9gnVX7a046JBmvHA/sVh7AAijUUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0nCIp5n8tZD0HRjjNynsbU6tSVUGJ4HVBaDeE4Nh7xk=; b=B
 gL2SCxTo1W/XOkZdq/MljcDwkCttl17KtkykJKmXI9mr9jRs5Q6J/6CYQsz+cV5HPBeAuIIpaZ+uu
 Rzzn8ypYll6eUM/v8xyD2dlcCX1eQdfa9xEnX552EBm9k56RkFMq/zEQf2nxRL5+7goX/X6DWnEGV
 XCicI/ftbr8ofTNs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNUSY-008Etp-A6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 07:56:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E518961883
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Feb 2023 07:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D744FC433D2;
 Thu,  2 Feb 2023 07:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675324595;
 bh=dv9BqB8uztzDNyULq7HYb6Wrix1gHnGg7UunhYDeX1k=;
 h=From:To:Cc:Subject:Date:From;
 b=ISoy8oJNDFzc5m3knB8ad+XUn6zTZBwSfqU+uj9A09rAfhdjmtrIjNqh8tiY1gdWi
 5aEU0iJN/wBgdgXOwZ6Oou1/wqGXz/OP/KM+Dp7DTinbQr4BpsqWNacQwCP0w6A/ZH
 MEl4qpCbeDIblkJCIuTQjTFaDdhPOWU9qJnXMIovQ/YPmgJaegfvJUC6sF4AIv9dvk
 7nml95LwEXSGKUYDWtclHz/fXk2Vn5CD8dsDB+HFliWEOHa2s5fg/KbkqFSDY7LCJw
 FVB+qi2rTtjKOrAuIeTAZ16SoMeOBQDpoJIkmnFXRVe/EZM2SdHEqSSJ8jFLQuP+FG
 9gHhm6NfJa0eA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  2 Feb 2023 15:56:25 +0800
Message-Id: <20230202075625.3512623-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Keep sanity_check_raw_super flow in fsck.f2fs being
 consistent
 w/ sanity_check_raw_super() in f2fs kernel module, otherwise, it outputs
 different error information when mounting/fscking the same image [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNUSY-008Etp-A6
Subject: [f2fs-dev] [PATCH] fsck.f2fs: relocate chksum verification step
 during f2fs_do_mount()
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

Keep sanity_check_raw_super flow in fsck.f2fs being consistent w/
sanity_check_raw_super() in f2fs kernel module, otherwise, it outputs
different error information when mounting/fscking the same image which
contains corrupted superblock.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 25b7f3b..2a87759 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -866,16 +866,16 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 	unsigned int segment_count, segs_per_sec, secs_per_zone, segs_per_zone;
 	unsigned int total_sections, blocks_per_seg;
 
-	if ((get_sb(feature) & F2FS_FEATURE_SB_CHKSUM) &&
-					verify_sb_chksum(sb))
-		return -1;
-
 	if (F2FS_SUPER_MAGIC != get_sb(magic)) {
 		MSG(0, "Magic Mismatch, valid(0x%x) - read(0x%x)\n",
 			F2FS_SUPER_MAGIC, get_sb(magic));
 		return -1;
 	}
 
+	if ((get_sb(feature) & F2FS_FEATURE_SB_CHKSUM) &&
+					verify_sb_chksum(sb))
+		return -1;
+
 	blocksize = 1 << get_sb(log_blocksize);
 	if (F2FS_BLKSIZE != blocksize) {
 		MSG(0, "Invalid blocksize (%u), supports only 4KB\n",
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
