Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2700412B40E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Dec 2019 11:45:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ikn7U-0008UY-Rc; Fri, 27 Dec 2019 10:45:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ikn7T-0008UR-Gg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Dec 2019 10:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3FtAE9eYn2Emrh1xLABAaAB8Fm4FMhvlOng+g1L7eKk=; b=hQKfIbIi3W60gRUdiJbekY3lwb
 Fz+mYqbbFlHyHOZNUbjQyOpZr+dhGR/QbdgKPqeG7Rg3N6QiNhWQa4wOdxq1CC6v93b3BcJ1hhzcX
 1Au1I+fQ/vxjosC4V9Qy2fHXiVk5K0e8H31m9oCGHr6/JKZjfEdwimoERbowBuhyYuLE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3FtAE9eYn2Emrh1xLABAaAB8Fm4FMhvlOng+g1L7eKk=; b=h
 a1e///JX1t2ImfLaPnfwcRkLpJ1x8wGMjMkQmVvnTr1pnfDa/U4VBuf0zftQELlzgexI2Zv1P4Qlo
 OiiYG/ATDzY+n5OhuTCeLVgmJnynd8l75UJjtCyPCIJ8tR1Sklpjye/YO5gFxCYExcaRCkK3jNqQF
 uubVnFW2sHHwANEM=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ikn7P-00FEo5-I8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Dec 2019 10:45:23 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 07909F06EFC9B69146BE;
 Fri, 27 Dec 2019 18:45:11 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Fri, 27 Dec 2019 18:45:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 27 Dec 2019 18:44:56 +0800
Message-ID: <20191227104456.24528-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxquestions.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ikn7P-00FEo5-I8
Subject: [f2fs-dev] [PATCH] f2fs: fix to add swap extent correctly
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Youling reported in mailing list:

https://www.linuxquestions.org/questions/linux-newbie-8/the-file-system-f2fs-is-broken-4175666043/

https://www.linux.org/threads/the-file-system-f2fs-is-broken.26490/

There is a test case can corrupt f2fs image:
- dd if=/dev/zero of=/swapfile bs=1M count=4096
- chmod 600 /swapfile
- mkswap /swapfile
- swapon --discard /swapfile

The root cause is f2fs_swap_activate() intends to return zero value
to setup_swap_extents() to enable SWP_FS mode (swap file goes through
fs), in this flow, setup_swap_extents() setups swap extent with wrong
block address range, result in discard_swap() erasing incorrect address.

Because f2fs_swap_activate() has pinned swapfile, its data block
address will not change, it's safe to let swap to handle IO through
raw device, so we can get rid of SWAP_FS mode and initial swap extents
inside f2fs_swap_activate(), by this way, later discard_swap() can trim
in right address range.

Fixes: 4969c06a0d83 ("f2fs: support swap file w/ DIO")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 19cd03450066..ee4d3d284379 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3608,7 +3608,8 @@ int f2fs_migrate_page(struct address_space *mapping,
 
 #ifdef CONFIG_SWAP
 /* Copied from generic_swapfile_activate() to check any holes */
-static int check_swap_activate(struct file *swap_file, unsigned int max)
+static int check_swap_activate(struct swap_info_struct *sis,
+				struct file *swap_file, sector_t *span)
 {
 	struct address_space *mapping = swap_file->f_mapping;
 	struct inode *inode = mapping->host;
@@ -3619,6 +3620,8 @@ static int check_swap_activate(struct file *swap_file, unsigned int max)
 	sector_t last_block;
 	sector_t lowest_block = -1;
 	sector_t highest_block = 0;
+	int nr_extents = 0;
+	int ret;
 
 	blkbits = inode->i_blkbits;
 	blocks_per_page = PAGE_SIZE >> blkbits;
@@ -3630,7 +3633,8 @@ static int check_swap_activate(struct file *swap_file, unsigned int max)
 	probe_block = 0;
 	page_no = 0;
 	last_block = i_size_read(inode) >> blkbits;
-	while ((probe_block + blocks_per_page) <= last_block && page_no < max) {
+	while ((probe_block + blocks_per_page) <= last_block &&
+			page_no < sis->max) {
 		unsigned block_in_page;
 		sector_t first_block;
 
@@ -3670,13 +3674,27 @@ static int check_swap_activate(struct file *swap_file, unsigned int max)
 				highest_block = first_block;
 		}
 
+		/*
+		 * We found a PAGE_SIZE-length, PAGE_SIZE-aligned run of blocks
+		 */
+		ret = add_swap_extent(sis, page_no, 1, first_block);
+		if (ret < 0)
+			goto out;
+		nr_extents += ret;
 		page_no++;
 		probe_block += blocks_per_page;
 reprobe:
 		continue;
 	}
-	return 0;
-
+	ret = nr_extents;
+	*span = 1 + highest_block - lowest_block;
+	if (page_no == 0)
+		page_no = 1;	/* force Empty message */
+	sis->max = page_no;
+	sis->pages = page_no - 1;
+	sis->highest_bit = page_no - 1;
+out:
+	return ret;
 bad_bmap:
 	pr_err("swapon: swapfile has holes\n");
 	return -EINVAL;
@@ -3701,14 +3719,14 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
 	if (f2fs_disable_compressed_file(inode))
 		return -EINVAL;
 
-	ret = check_swap_activate(file, sis->max);
-	if (ret)
+	ret = check_swap_activate(sis, file, span);
+	if (ret < 0)
 		return ret;
 
 	set_inode_flag(inode, FI_PIN_FILE);
 	f2fs_precache_extents(inode);
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
-	return 0;
+	return ret;
 }
 
 static void f2fs_swap_deactivate(struct file *file)
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
