Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7BEA87E95
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Apr 2025 13:12:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4HjW-0002nB-40;
	Mon, 14 Apr 2025 11:12:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u4HjU-0002n5-VF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 11:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z1SyZ/TCSkD+3E2aLaSEVTVo+AVYcEdY28lgC9vRGBA=; b=ZUymLJe76FA/5IsknnRES7vyxZ
 2hCXaHUZmNnia54Y76A8BNpuDE3i9U4BNQ+eNPELJdRXo2Z5T60bG2G6NFE+4VRs/dzfYC25SDCOW
 N9Rnycva/66byy6Y/sRDtZMjm9tKVrN/LJnlCODobeBmrfQ9YEsWXtAsfHv7UtysUYcM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=z1SyZ/TCSkD+3E2aLaSEVTVo+AVYcEdY28lgC9vRGBA=; b=O
 d2QSYVahfcm1R6fKt0OWp5BfxW/dCBvedFWtXcQa5GkcAfs7Wba/1aJhjI6CrD9ESvZOCM7vHdyS5
 BUczx0K5z7UyHFoYpHGVUgpzuEILjKqJttqBLesTFf9pouaQvYv+hNC+u2OO7SOBpazhHxFeZSZgN
 2nSPelcmMfZzHFp8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u4HjF-0006n3-M7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 11:12:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A1607A49D12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Apr 2025 11:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B560C4CEEB;
 Mon, 14 Apr 2025 11:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744629107;
 bh=AWZkY/Jmbk+3K5z2T/ZeGZWV8Q4Jl+AxMR2Ak2g7/Hw=;
 h=From:To:Cc:Subject:Date:From;
 b=fZ+frt2ieanJUeuN6ICZngXL4eIe+evjK6hseQ1jELA6xTOXqFlb0jbN38TCfLA7k
 Fgrth0EstY6x7Tf/KWcfBbPrmYH3ynJuqyOGrbD2QcgP74V5tbpmti1+Z9JnbdHT5j
 3VWzqIVc5632hxv4q2WpiJVF2ZLAL/lf2BkRUNOQ/dl9/CUWGqAj6gk6Cv0eR5zCdW
 ZKnbam6Qn9mX6P7O9VPQWRjAG6tuAxjKGQtKmRmKBThGzSvD7LmbOrS9C7E8w/YajW
 /s8bgjpR/CS2Vq62F7so+Y6KlTXP+zDKAyjLh7kENMCC2C4T8fRC55jvR23r4Hzjbk
 7miMCxJLZu10w==
To: jaegeuk@kernel.org
Date: Mon, 14 Apr 2025 19:11:41 +0800
Message-ID: <20250414111141.735081-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  w/ below testcase, resize will generate a corrupted image
 which contains inconsistent metadata: touch img truncate -s
 $((512*1024*1024*1024))
 img mkfs.f2fs -f img $((256*1024*1024)) resize.f2fs -s img -t
 $((1024*1024*1024)) mount img /mnt/f2fs 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u4HjF-0006n3-M7
Subject: [f2fs-dev] [PATCH] resize.f2fs: fix to always change metadata for
 expand resize
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

w/ below testcase, resize will generate a corrupted image which
contains inconsistent metadata:

touch img
truncate -s $((512*1024*1024*1024)) img
mkfs.f2fs -f img $((256*1024*1024))
resize.f2fs -s img -t $((1024*1024*1024))
mount img /mnt/f2fs

[   31.725200] F2FS-fs (loop0): Wrong bitmap size: sit: 192, sit_blk_cnt:4762
[   31.728441] F2FS-fs (loop0): Failed to get valid F2FS checkpoint

The root cause is safe mode (via -s option) is not compatible
w/ expand resize, due to in safe mode, we will keep all parameters
related to NAT, SIT, SSA area, e.g. sit_bitmap_size, however, we
will update segment_count_main according new partition size, result
in there is no enough sit_bitmap and SIT blocks to address the
entire block address of new partition.

Adding a check condition to avoid expanding partition in safe
mode, and change manual accordingly.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/resize.c     | 12 ++++++++----
 man/resize.f2fs.8 |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/fsck/resize.c b/fsck/resize.c
index 1ab7d75..58914ec 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -756,18 +756,22 @@ int f2fs_resize(struct f2fs_sb_info *sbi)
 
 	/* may different sector size */
 	if ((c.target_sectors * c.sector_size >>
-			get_sb(log_blocksize)) < get_sb(block_count))
+			get_sb(log_blocksize)) < get_sb(block_count)) {
 		if (!c.safe_resize) {
 			ASSERT_MSG("Nothing to resize, now only supports resizing with safe resize flag\n");
 			return -1;
 		} else {
 			return f2fs_resize_shrink(sbi);
 		}
-	else if (((c.target_sectors * c.sector_size >>
+	} else if (((c.target_sectors * c.sector_size >>
 			get_sb(log_blocksize)) > get_sb(block_count)) ||
-			c.ignore_error)
+			c.ignore_error) {
+		if (c.safe_resize) {
+			ASSERT_MSG("Expanding resize doesn't support safe resize flag");
+			return -1;
+		}
 		return f2fs_resize_grow(sbi);
-	else {
+	} else {
 		MSG(0, "Nothing to resize.\n");
 		return 0;
 	}
diff --git a/man/resize.f2fs.8 b/man/resize.f2fs.8
index bdda4fd..5b6daf5 100644
--- a/man/resize.f2fs.8
+++ b/man/resize.f2fs.8
@@ -69,7 +69,7 @@ Skip caution dialogue and resize partition directly.
 Specify support write hint.
 .TP
 .BI \-s
-Enable safe resize.
+Enable safe resize, it can only be used w/ shrink resize.
 .TP
 .BI \-V
 Print the version number and exit.
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
