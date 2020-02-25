Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEFC16BEA8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 11:27:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6XQj-0006AK-Gc; Tue, 25 Feb 2020 10:27:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j6XQg-00069E-52
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 10:27:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yh3yHc8FNRKMP5MovoaGUM7mVoAref2m5b26LjlsAEg=; b=HLkiPCzauslq/zFkiwCNeM0Sb7
 yNqFQYexPiL68E73bae669P5GKXGFxE/M0vvlTI77uGVJabm1pnUH/gnRYraoMK8sY/MYRE8UzSBL
 k68RXoKdhF4Y8Vt8MmWhBERsEoLQmiON5HYTHfWr9tQ4/k+rIOTVoqn038F1O6NF7u90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yh3yHc8FNRKMP5MovoaGUM7mVoAref2m5b26LjlsAEg=; b=S
 NODcBs8xVbvelF2/OIKKHnsoeRZwPKhtG1cRgiwIoPMzmsLnZK+uhJ3+kfvSqEB4IuRMIGXLncUyf
 hKyZEgGvcGtV8GdGzu1RbX2trSBoH9nGs2Z0pbmFKv7raQRmggh3KwZhX+7BiemU5152Udv9uG0z6
 KOEUdirXEvN6xfqQ=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6XQd-00FvAQ-Ap
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 10:27:05 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8C569BA817E84CD5D94D;
 Tue, 25 Feb 2020 18:26:55 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Tue, 25 Feb 2020 18:26:48 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 25 Feb 2020 18:26:46 +0800
Message-ID: <20200225102646.43367-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j6XQd-00FvAQ-Ap
Subject: [f2fs-dev] [PATCH] f2fs: fix to check i_compr_blocks correctly
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

inode.i_blocks counts based on 512byte sector, we need to convert
to 4kb sized block count before comparing to i_compr_blocks.

In addition, add to print message when sanity check on inode
compression configs failed.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/inode.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 156cc5ef3044..299611562f7e 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -291,13 +291,30 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 			fi->i_flags & F2FS_COMPR_FL &&
 			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
 						i_log_cluster_size)) {
-		if (ri->i_compress_algorithm >= COMPRESS_MAX)
+		if (ri->i_compress_algorithm >= COMPRESS_MAX) {
+			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
+				"compress algorithm: %u, run fsck to fix",
+				  __func__, inode->i_ino,
+				  ri->i_compress_algorithm);
 			return false;
-		if (le64_to_cpu(ri->i_compr_blocks) > inode->i_blocks)
+		}
+		if (le64_to_cpu(ri->i_compr_blocks) >
+				SECTOR_TO_BLOCK(inode->i_blocks)) {
+			f2fs_warn(sbi, "%s: inode (ino=%lx) hash inconsistent "
+				"i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
+				  __func__, inode->i_ino,
+				  le64_to_cpu(ri->i_compr_blocks),
+				  SECTOR_TO_BLOCK(inode->i_blocks));
 			return false;
+		}
 		if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
-			ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE)
+			ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
+			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
+				"log cluster size: %u, run fsck to fix",
+				  __func__, inode->i_ino,
+				  ri->i_log_cluster_size);
 			return false;
+		}
 	}
 
 	return true;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
