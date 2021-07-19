Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A583CEB2E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jul 2021 20:51:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5YM6-0007Yk-Ac; Mon, 19 Jul 2021 18:51:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1m5YM4-0007YO-Lw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 18:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DWPpeG4YTd7iA3pqRdjiPHQTD1P2DwtZAxH6hobEyC8=; b=daLfx6Uee9REB9eWtsDEk6QMPE
 vDi2u7Xhid1wibcBHmMFye4VDFtGM3o9Mo4zOOz4Lu2gVRyjOT2XKbdAbBodD/1oNy8cW3h90GT27
 /LgcR8Ff9sMO5q3KphdTNJ3So3x7cjPxQg4j7Vc5A+GFTOuTptO0CyrXnAoiympK9k7I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DWPpeG4YTd7iA3pqRdjiPHQTD1P2DwtZAxH6hobEyC8=; b=UC6BHosNTWVPreMCNMFF2WpTo0
 f5Lyr3vnP8KdM49xc1dL07qjfpi2KCxG0h0ikhCy/rHCNNWFX6Shv50tzpRZJlGuJxSTVHxmrkhMv
 UrCh6kLVXANsX2mr0TOfOR/FWVtYoc4d9lMq25RvWbdNzYPMQ8+zfRSWTSQPZmH+Gqjc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5YM3-0001sV-EY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 18:51:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF94360232;
 Mon, 19 Jul 2021 18:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626720657;
 bh=Fmxur8PEGRLFcvvTlqSw+qeFZN6toa/D9x3oxGIYtV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mjRkn/wrE7kcIz31q88YK5VW5qKuTdF0qwIJVqijiq/h43RkIQJvHsS28bHrsM/Qa
 KVKFB3thixzFnn2XqQ6heQ4SuDrxvdoz55IPzHcVB+PTiT5VMWZYG0hTtvI2T5wwwG
 eZ7wS52RkMGUVekTsEPgVmjxLU3+If43xqu2TamG1mCCKjGJAPugJnpvNHBq/Fvjos
 mGGdP5TF9bD5LYmBw3UMCJpGhmM+tA9ixIBeH29wRJ9cf6TgETTHMTIdfBQe8XiU5g
 qebN2lkgHkHmuzPX5EMsARgUdLUsLhY9jaJd/AZXsalEUnKmCgfU2A4ZiCF+FpzJp1
 pxbvVnkad5Ntw==
Date: Mon, 19 Jul 2021 11:50:55 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YPXJj+63rNtcnGdy@google.com>
References: <20210714231850.2567509-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714231850.2567509-1-jaegeuk@kernel.org>
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m5YM3-0001sV-EY
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: let's keep writing IOs on
 SBI_NEED_FSCK
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
Cc: stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SBI_NEED_FSCK is an indicator that fsck.f2fs needs to be triggered, so it
is not fully critical to stop any IO writes. So, let's allow to write data
instead of reporting EIO forever given SBI_NEED_FSCK, but do keep OPU.

Fixes: 955772787667 ("f2fs: drop inplace IO if fs status is abnormal")
Cc: <stable@kernel.org> # v5.13+
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 v2 from v1:
  - use OPU in the NEED_FSCK case.

 fs/f2fs/data.c    | 2 ++
 fs/f2fs/segment.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d2cf48c5a2e4..ba120d55e9b1 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2498,6 +2498,8 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 		return true;
 	if (f2fs_is_atomic_file(inode))
 		return true;
+	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
+		return true;
 
 	/* swap file is migrating in aligned write mode */
 	if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
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
2.32.0.402.g57bb445576-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
