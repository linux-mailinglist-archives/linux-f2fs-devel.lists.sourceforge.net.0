Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB89D3C945A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jul 2021 01:19:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m3o9w-0008Uu-PZ; Wed, 14 Jul 2021 23:19:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1m3o9v-0008Um-3W
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Jul 2021 23:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xd3JDUAAJoq2Ies4rf5gq8hoTQsuvdhZU8OrstZw0E4=; b=nCt0MeeOnJ0KIHToOFHNTQeNSs
 965Tk4Dhe6W/xR93Dr3Ca97JWKMU/8QpnrjGD6jBuZGUa9t4wXCbvsCjx6mg36m+yWiphofU1ChYJ
 /qsnIQj4Ox1s73MBstJktHl3re0xt7rXxEpqychmmKetemFse1Mjwmv1tdjWtHbsqVcI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Xd3JDUAAJoq2Ies4rf5gq8hoTQsuvdhZU8OrstZw0E4=; b=a
 Gg4CjIchm8mE6539wZt0mL2bY46qj4kCQDK1OC6BRU1i//qbjAzqXJiUgQU2tx7zIE+bmceMAUOpq
 0OHtUar/oqa1q2LU3KZ4tTiI3/pbl2zqYbz2+VVxisTpuWgLf1bnldrK4G5Vdf4swcH4q3upOsq+S
 i4kQaMGk+v/brAY0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m3o9j-008Z5O-5Y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Jul 2021 23:19:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 512066136E;
 Wed, 14 Jul 2021 23:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626304734;
 bh=7ibYkMa/Q/QRDj3MQt3Cl24drEViJhJqRnCGjYpxIHQ=;
 h=From:To:Cc:Subject:Date:From;
 b=F10JlT0arMKc1w9jpjBvlC8MdN0dv2pvzJX2g8QZ4wF4w7y1CYduAQdwjJXVANBYt
 cTdzkVnI4f+0vOCD8HyAiuiR8xcE6+KiOyEV1N0vQv+Jd+qU4F02blA7lPVxH94m8H
 5FX/CUOoSlVgp2VkAsonkccFGL8lSSTw2+0lhvWuS3oj2NDUrq0rVzGMTYannmyLcT
 b2kzz/LQVAVDvj2Qm3wuvkL1dPgFue/NI0B88BZ0f1FvCrXmjPConh63ON7XonqmI5
 VLnhJO+RQjxOW3uodo4RcyRtVC3YENIxHj3EfZgOSRQ/fn5zSw4R9KStbEdJhU4NAa
 h5sMSqnEe/9mA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 14 Jul 2021 16:18:50 -0700
Message-Id: <20210714231850.2567509-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
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
X-Headers-End: 1m3o9j-008Z5O-5Y
Subject: [f2fs-dev] [PATCH] f2fs: let's keep writing IOs on SBI_NEED_FSCK
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SBI_NEED_FSCK is an indicator that fsck.f2fs needs to be triggered, so it
is not fully critical to stop any IO writes. So, let's allow to write data
instead of reporting EIO forever given SBI_NEED_FSCK.

Fixes: 955772787667 ("f2fs: drop inplace IO if fs status is abnormal")
Cc: <stable@kernel.org> # v5.13+
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 15cc89eef28d..f9b7fb785e1d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3563,7 +3563,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		goto drop_bio;
 	}
 
-	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK) || f2fs_cp_error(sbi)) {
+	if (f2fs_cp_error(sbi)) {
 		err = -EIO;
 		goto drop_bio;
 	}
-- 
2.32.0.93.g670b81a890-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
