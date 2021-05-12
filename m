Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D0337B4C6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 06:00:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgg3I-0002el-PN; Wed, 12 May 2021 04:00:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lgg3H-0002ee-S8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 04:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tKtmrpLAIYsrmFJD8gA3kUCAu8KUefzDCBkaucIStYI=; b=JFgHFaW/YBrqnWHqBF2VdVOER/
 9IDTM2Tyxtguw5nnmlewQOfPtdiNscDl/OgJm1q9sWqAzT4Sl/QywB2NEwvXuvxB9Ora4nSjpdWXa
 kD0NgwFfk2SfXliL2wOZuJaZiKasGjnIN1cPZRwYkVqniKxlJs87hMqptvHLilHwL6YQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tKtmrpLAIYsrmFJD8gA3kUCAu8KUefzDCBkaucIStYI=; b=Ly7r4Ftx9QLQAKY7AVL+melyoC
 Ylwb7pPzBOuxFx38UD3rsAWYgVxWDGsZLEbfGSfA/jJEVQUa0iHD368CXrKOK6ptqt7jjtZG8q/7X
 8xz1FLOYBHjR6d1zJPPmV32m3lEHlrhOGLEPWblrYwuZAKG8Zsm2uhUCWyiCvI+l2RWs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgg35-000115-BJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 04:00:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B7736143A;
 Wed, 12 May 2021 04:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620792032;
 bh=cjqAoPxV3C3vu9F4/M1vGSY/ZX1NLSzuT2Uq5VG+/A8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IpoClDe/HNSxM4Vxmnw2VaUGj6qBsi15ErdVcXrg8mORCERnNkwrPURdwUC6zJaFz
 Zj/4HaKBxx4WVPPTt/bcsDmWbOUO/7WrwqRCTFHJiIIckQOMNN21qTVnkjwvl9faUW
 9Gco/LegGP2L/mWXF0VGfehMSCq6zMy5SvrlLMOqDWNisLGB57RwBcx1BJb4ViKWj+
 KpKAJi/v7EVcHmIPx/4hjS05Ugv+s57QcJEudCx6bloxog0cPHl4T9L9XZ1WnWvR1m
 djZOK8fFYlr3bf3dx0oY6zg2qxC4v1EcFOXfQQortjZI/LITrPBt5u2hm5i9/w7HOd
 jp0cUkBBgBBfw==
Date: Tue, 11 May 2021 21:00:30 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YJtS3qEDFIzqc5Ki@google.com>
References: <20210511214337.2857522-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210511214337.2857522-1-jaegeuk@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lgg35-000115-BJ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid swapon failure by giving a
 warning first
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
Cc: kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The final solution can be migrating blocks to form a section-aligned file
internally. Meanwhile, let's ask users to do that when preparing the swap
file initially like:
1) create()
2) ioctl(F2FS_IOC_SET_PIN_FILE)
3) fallocate()

Reported-by: kernel test robot <oliver.sang@intel.com>
Fixes: 36e4d95891ed ("f2fs: check if swapfile is section-alligned")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
v2:
 - fix to warn out once
 - cover check_swap_activate_fast

 fs/f2fs/data.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 33e56ae84e35..41e260680b27 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3801,6 +3801,7 @@ static int f2fs_is_file_aligned(struct inode *inode)
 	block_t pblock;
 	unsigned long nr_pblocks;
 	unsigned int blocks_per_sec = BLKS_PER_SEC(sbi);
+	unsigned int not_aligned = 0;
 	int ret = 0;
 
 	cur_lblock = 0;
@@ -3833,13 +3834,20 @@ static int f2fs_is_file_aligned(struct inode *inode)
 
 		if ((pblock - main_blkaddr) & (blocks_per_sec - 1) ||
 			nr_pblocks & (blocks_per_sec - 1)) {
-			f2fs_err(sbi, "Swapfile does not align to section");
-			ret = -EINVAL;
-			goto out;
+			if (f2fs_is_pinned_file(inode)) {
+				f2fs_err(sbi, "Swapfile does not align to section");
+				ret = -EINVAL;
+				goto out;
+			}
+			not_aligned++;
 		}
 
 		cur_lblock += nr_pblocks;
 	}
+	if (not_aligned)
+		f2fs_warn(sbi, "Swapfile (%u) is not align to section: \n"
+			"\t1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate()",
+			not_aligned);
 out:
 	return ret;
 }
@@ -3858,6 +3866,7 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
 	int nr_extents = 0;
 	unsigned long nr_pblocks;
 	unsigned int blocks_per_sec = BLKS_PER_SEC(sbi);
+	unsigned int not_aligned = 0;
 	int ret = 0;
 
 	/*
@@ -3896,9 +3905,12 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
 
 		if ((pblock - SM_I(sbi)->main_blkaddr) & (blocks_per_sec - 1) ||
 				nr_pblocks & (blocks_per_sec - 1)) {
-			f2fs_err(sbi, "Swapfile does not align to section");
-			ret = -EINVAL;
-			goto out;
+			if (f2fs_is_pinned_file(inode)) {
+				f2fs_err(sbi, "Swapfile does not align to section");
+				ret = -EINVAL;
+				goto out;
+			}
+			not_aligned++;
 		}
 
 		if (cur_lblock + nr_pblocks >= sis->max)
@@ -3927,6 +3939,11 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
 	sis->max = cur_lblock;
 	sis->pages = cur_lblock - 1;
 	sis->highest_bit = cur_lblock - 1;
+
+	if (not_aligned)
+		f2fs_warn(sbi, "Swapfile (%u) is not align to section: \n"
+			"\t1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate()",
+			not_aligned);
 out:
 	return ret;
 }
-- 
2.31.1.607.g51e8a6a459-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
