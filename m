Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ECD526777
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 May 2022 18:50:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npYUs-0006Lp-Ll; Fri, 13 May 2022 16:50:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1npYUr-0006Lj-Q9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 16:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZLAFf99532CHNJPcNcuhAWZeS7phpBEEDGX6Ztw83y0=; b=lC8w3j786fcctLO2eG8IrQGj+1
 Gp8+ki8mFHmsfHGGg2U5QZlsilJp9YohcewG832vDJP6F4AaL5uz6u4W3v2kjsVbZu9gufUpt69Aj
 y+PuTDl5ZEpnB1GU9GqO7HeKD01iOolLoPF7yU5U8sMz3VpAF+7kEhLMbZstFDGCns8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZLAFf99532CHNJPcNcuhAWZeS7phpBEEDGX6Ztw83y0=; b=F
 NzAeVMNjStNcl5T0H6ms573BvS/SRQtIdYl8Jc+ntuQocisjgAOa1ZK8yeT1rNLFrWQ0+onXxqQB2
 iq6xRxRS+ZOFUDfPZYj/k5/Nqn9+eMDvSb3uWLxa4xSqt0yEoXPF8Jq2/C+kZFMU8CnITH8T3nfBP
 o/AhVyd13aK8BeFw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npYUm-0007r9-B9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 16:50:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E8DE61F0F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 May 2022 16:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20168C34100;
 Fri, 13 May 2022 16:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652460615;
 bh=fNFiKxI17qwuDK6Nu9K9S8nCsAEYEXSB5OGhYy7G3Vs=;
 h=From:To:Cc:Subject:Date:From;
 b=BqxH6ALVYI/FaIfxvr2dqGKdfxdz4I8/hNNl+K3gt6yS3hA9gqNGg3d5lXbz7yF/H
 ljq9Tlv+zklPN3VIcLNsvsJaFUcJILOqSJ3iOAIRbHhtPRH1E/MNdwMV2NvQL1UR+C
 RnyZfgelq6ULp3lYRu893aqXhN0Cr2HRN1CN4/6nKls7tQnhNuTePkr/3Nqkd0eI/E
 4z8BOx4yirmYD3xFkNaD19Wo91h9Qw6uavkc3ktgskC+c0UZdRbxyE+ovNG+i8SK4E
 K+FYwbB+oCuol3uvGugCxcciWTd8SZwDlxYzl0v+iFmAVHjYPBjz34LQCYMXZ5jjW3
 7rNC1AFDky/dw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 13 May 2022 09:50:13 -0700
Message-Id: <20220513165013.4194214-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch fixes wrong segment/section print-outs.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fsck/mount.c | 2 ++ lib/libf2fs.c |
 3 +++ 2 files changed, 5 insertions(+) diff --git a/fsck/mount.c b/fsck/mount.c
 index b1e318f099f0..108e1238493d 100644 --- a/fsck/mount.c +++ b/fsck/mount.c
 @@ -1082,6 +1082,8 @@ int init_sb_info(struct f2fs_sb_info *sbi) } 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npYUm-0007r9-B9
Subject: [f2fs-dev] [PATCH] f2fs-tools: show segment/section layout correctly
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

This patch fixes wrong segment/section print-outs.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/mount.c  | 2 ++
 lib/libf2fs.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index b1e318f099f0..108e1238493d 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1082,6 +1082,8 @@ int init_sb_info(struct f2fs_sb_info *sbi)
 	}
 
 	total_sectors = get_sb(block_count) << sbi->log_sectors_per_block;
+	MSG(0, "Info: Segments per section = %d\n", sbi->segs_per_sec);
+	MSG(0, "Info: Sections per zone = %d\n", sbi->secs_per_zone);
 	MSG(0, "Info: total FS sectors = %"PRIu64" (%"PRIu64" MB)\n",
 				total_sectors, total_sectors >>
 						(20 - get_sb(log_sectorsize)));
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index afdbbbe17d84..961e70cb7b1b 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1272,6 +1272,9 @@ int f2fs_get_f2fs_info(void)
 
 	c.segs_per_zone = c.segs_per_sec * c.secs_per_zone;
 
+	if (c.func != MKFS)
+		return 0;
+
 	MSG(0, "Info: Segments per section = %d\n", c.segs_per_sec);
 	MSG(0, "Info: Sections per zone = %d\n", c.secs_per_zone);
 	MSG(0, "Info: sector size = %u\n", c.sector_size);
-- 
2.36.0.550.gb090851708-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
