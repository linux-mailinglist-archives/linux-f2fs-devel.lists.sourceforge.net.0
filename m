Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4063ED3F1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Aug 2021 14:28:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFbj7-0006He-F7; Mon, 16 Aug 2021 12:28:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <frank.li@vivo.com>) id 1mFbj5-0006HY-08
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 12:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xQfbWbL4NOuPXUbBW7ftbBoEl5JD3poMqMz/5TbQrzU=; b=FKkFdVG5Ra7kmFamjDFU24J0k1
 0AInOGqYl9EpSy4kvJPunp5MfZx32shGh3Cx6XBOJd/xDww6MU2DaK3n/rF+Qnsw6uUSk5OpgOC02
 B/hAkB9i6WxowcaGwwX3xxjyoxOSGSL1Z8Foj0ZWlaOBn4P9nLUmIsohFW9q2ap9a+Yo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xQfbWbL4NOuPXUbBW7ftbBoEl5JD3poMqMz/5TbQrzU=; b=E
 kK2B/wJgdVXu4LeawMJxXgTpXlW8sMALOaodi1Aq5IkYfQB6iFlzIbHiYCh7cxEOK+HtfvQU62u/F
 6rkPlxH5Fi6Chs/kg3gt9nfClzXTElqw3zp3ED5z3hpJYM72z0iirygv+zRxQeHXXZ+pExHUot8Cx
 o8aypZE3+0ljm+LU=;
Received: from mail-m17636.qiye.163.com ([59.111.176.36])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFbiy-008GWB-Qk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 12:28:21 +0000
Received: from comdg01144022.vivo.xyz (unknown [218.104.188.165])
 by mail-m17636.qiye.163.com (Hmail) with ESMTPA id 936B6C400B1;
 Mon, 16 Aug 2021 20:28:08 +0800 (CST)
From: Yangtao Li <frank.li@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 16 Aug 2021 20:28:07 +0800
Message-Id: <20210816122807.71400-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUNPS0xWHU0ZTB4fHkxCQx
 hMVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NEk6Pyo4ET8CTBwMPBk0HTUB
 EyMwFBdVSlVKTUlCSkpNQ0NCSUxNVTMWGhIXVR0JGhUQVRcSOw0SDRRVGBQWRVlXWRILWUFZSUpD
 VUpLT1VKQ0NVSk1OWVdZCAFZQUlOS083Bg++
X-HM-Tid: 0a7b4eeef6b0d996kuws936b6c400b1
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.36 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mFbiy-008GWB-Qk
Subject: [f2fs-dev] [PATCH] f2fs: change value of recovery to bool
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Recovery has only two values, 0 and 1, let's change it to bool type.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8fecd3050ccd..98727e04d271 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3541,7 +3541,7 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
  */
 static int read_raw_super_block(struct f2fs_sb_info *sbi,
 			struct f2fs_super_block **raw_super,
-			int *valid_super_block, int *recovery)
+			int *valid_super_block, bool *recovery)
 {
 	struct super_block *sb = sbi->sb;
 	int block;
@@ -3559,7 +3559,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
 			f2fs_err(sbi, "Unable to read %dth superblock",
 				 block + 1);
 			err = -EIO;
-			*recovery = 1;
+			*recovery = true;
 			continue;
 		}
 
@@ -3569,7 +3569,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
 			f2fs_err(sbi, "Can't find valid F2FS filesystem in %dth superblock",
 				 block + 1);
 			brelse(bh);
-			*recovery = 1;
+			*recovery = true;
 			continue;
 		}
 
@@ -3784,15 +3784,16 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	int err;
 	bool skip_recovery = false, need_fsck = false;
 	char *options = NULL;
-	int recovery, i, valid_super_block;
+	int i, valid_super_block;
 	struct curseg_info *seg_i;
 	int retry_cnt = 1;
+	bool recovery;
 
 try_onemore:
 	err = -EINVAL;
 	raw_super = NULL;
 	valid_super_block = -1;
-	recovery = 0;
+	recovery = false;
 
 	/* allocate memory for f2fs-specific super block info */
 	sbi = kzalloc(sizeof(struct f2fs_sb_info), GFP_KERNEL);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
