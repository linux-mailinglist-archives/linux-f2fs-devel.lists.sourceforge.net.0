Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B8F37B0F3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 23:44:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgaAx-0003FF-M4; Tue, 11 May 2021 21:44:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lgaAj-0003Ef-4F
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 21:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9FuhVWzL49HuAsTdVY7He650LNH1O81ziyQiFRbdETA=; b=Ho4BEP1kMHPHKE1VtMuYbtznY9
 j7RPbLELUUlIMoRX1zPkIbNZObadj7ROdRlqexwgNRHB8DStN3cQmbSud0PRVOuWt428T/x6nQUZo
 qcole+xJXEln8a+bVVttgwqp4MPkRqdNZ7kgFDKlxAHsh+tzxgXHg7OgQB4cDHUAMUj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9FuhVWzL49HuAsTdVY7He650LNH1O81ziyQiFRbdETA=; b=F
 IPBVpEmGLFBOB6P4taM3kmcrqwvbOHjurv2CfmXdWi10dWuiTbAmvdNW3R9qNnWdeu4gvvMCAtAHG
 yZvU5Xtg2Uttn2hNT0TYdPe7UtYAC8Ygrxe5kPdDi2oUUOrCYGN0ZXeVPnoLaqCtROc+HkwBlJFv3
 ynT1+lncu7IYYJ28=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgaAb-0002zd-3n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 21:44:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 703CC61628;
 Tue, 11 May 2021 21:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620769430;
 bh=uJajgRSXFIg/kSkTCl0T5ZiXJbHhBXOs6OX0ybiOsEY=;
 h=From:To:Cc:Subject:Date:From;
 b=mp6pyOM2YCKKNxFP69P7FNDyfOyRcnYxSN90nen0RTmSlTxPATnY4tAt1YfjQU8rN
 Gh4WuDYdnktfntrcpxkt7CCLfhwLDllQIunIDTTL0lBNAfvNleZeEeo77AfIZxcv6f
 gSvRX7BH35f6Q6RIVeonZG2Lxu6g2/wdcRn4LXNyis95Oi9LH+VnSVhOXlhx+NzEJw
 1wmheJMyhXkF209QMPizJVrgPIJEUu1LWv3qm1ATngPtLaBrC9wQUoM4emY/fJuxkD
 +yD/1qx6Vrcm6S5H7bvzAFsqCAB1JHMxkDHzH/0mhYwK+P1SrpbU6qajpi6gwPJiWR
 bTP/+jNgtuQzw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 11 May 2021 14:43:37 -0700
Message-Id: <20210511214337.2857522-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
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
X-Headers-End: 1lgaAb-0002zd-3n
Subject: [f2fs-dev] [PATCH] f2fs: avoid swapon failure by giving a warning
 first
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel test robot <oliver.sang@intel.com>
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
 fs/f2fs/data.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 33e56ae84e35..041f2d9ec972 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3833,9 +3833,13 @@ static int f2fs_is_file_aligned(struct inode *inode)
 
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
+			f2fs_warn(sbi, "Swapfile does not align to section: \n"
+				"\t1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate()");
 		}
 
 		cur_lblock += nr_pblocks;
-- 
2.31.1.607.g51e8a6a459-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
