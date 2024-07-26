Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 185DD93CE27
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2024 08:28:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sXERB-00016D-IT;
	Fri, 26 Jul 2024 06:28:22 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1sXER3-00015x-8t
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 06:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JePmhWwbpDb2lVaZ0LCCNxYRnZpU//4ckNCai9uQ1Us=; b=Bk51emXld+6mEVcOFLCG3KkKdo
 oli4dJN1XIDjKfJ1C9XXX4R7VvxecE6k9m4PG1qQ5pFgugNYVWwE4pDHkrT7PDt1kRy2gOr5EuOBA
 5PzRq5dgfn2X/OY90YtrqxvdiqfIEErxdwaNBwu4DHBsSQLDL9h+bu8DmOoSyNg0xWvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JePmhWwbpDb2lVaZ0LCCNxYRnZpU//4ckNCai9uQ1Us=; b=S
 uFjKKB79AVU7WhxiI0SlDSMEorAewefIGUXYboNbmk7Ge4y3zvpKyYlHaM4GYLmxX+MTveW22kbAT
 vIVsGMjrK/CYtYkxiVZ7kehwiTEWF8xlTY/BueANLfDcD3p1eP7w1JtchfQyMZLXhWOnAT8sOGBcm
 v/ztV3+a3EdPR9MQ=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sXER2-0001mI-GW for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 06:28:13 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 46Q6RgvF069514;
 Fri, 26 Jul 2024 14:27:42 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4WVd2J4C4Xz2Lk7m3;
 Fri, 26 Jul 2024 14:22:00 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Fri, 26 Jul 2024 14:27:40 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 26 Jul 2024 14:27:26 +0800
Message-ID: <1721975246-32345-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 46Q6RgvF069514
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This is a supplement to commit 6d1451bf7f84 ("f2fs: fix to
 use per-inode maxbytes") for some missed cases, also cleanup redundant code
 in f2fs_llseek. Cc: Chengguang Xu <cgxu519@mykernel.net> Signed-off-by: Zhiguo
 Niu <zhiguo.niu@unisoc.com> --- v2: use Macro F2FS_BLK_TO_BYTES --- ---
 fs/f2fs/data.c
 | 4 ++-- fs/f2fs/file.c | 7 ++----- fs/f2fs/verity [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [222.66.158.135 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1sXER2-0001mI-GW
Subject: [f2fs-dev] [PATCH V2] f2fs: fix to use per-inode maxbytes and
 cleanup
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a supplement to commit 6d1451bf7f84 ("f2fs: fix to use per-inode maxbytes")
for some missed cases, also cleanup redundant code in f2fs_llseek.

Cc: Chengguang Xu <cgxu519@mykernel.net>
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
v2: use Macro F2FS_BLK_TO_BYTES
---
---
 fs/f2fs/data.c   | 4 ++--
 fs/f2fs/file.c   | 7 ++-----
 fs/f2fs/verity.c | 5 +++--
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a2c3d39..e9570f4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1938,7 +1938,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 
 	inode_lock_shared(inode);
 
-	maxbytes = max_file_blocks(inode) << F2FS_BLKSIZE_BITS;
+	maxbytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
 	if (start > maxbytes) {
 		ret = -EFBIG;
 		goto out;
@@ -2063,7 +2063,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 static inline loff_t f2fs_readpage_limit(struct inode *inode)
 {
 	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
-		return inode->i_sb->s_maxbytes;
+		return F2FS_BLK_TO_BYTES(max_file_blocks(inode));
 
 	return i_size_read(inode);
 }
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6c62f76..41ef3ad 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -432,7 +432,7 @@ static bool __found_offset(struct address_space *mapping,
 static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 {
 	struct inode *inode = file->f_mapping->host;
-	loff_t maxbytes = inode->i_sb->s_maxbytes;
+	loff_t maxbytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
 	struct dnode_of_data dn;
 	pgoff_t pgofs, end_offset;
 	loff_t data_ofs = offset;
@@ -514,10 +514,7 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 static loff_t f2fs_llseek(struct file *file, loff_t offset, int whence)
 {
 	struct inode *inode = file->f_mapping->host;
-	loff_t maxbytes = inode->i_sb->s_maxbytes;
-
-	if (f2fs_compressed_file(inode))
-		maxbytes = max_file_blocks(inode) << F2FS_BLKSIZE_BITS;
+	loff_t maxbytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
 
 	switch (whence) {
 	case SEEK_SET:
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index f7bb0c5..83310b5 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -74,7 +74,7 @@ static int pagecache_write(struct inode *inode, const void *buf, size_t count,
 	struct address_space *mapping = inode->i_mapping;
 	const struct address_space_operations *aops = mapping->a_ops;
 
-	if (pos + count > inode->i_sb->s_maxbytes)
+	if (pos + count > F2FS_BLK_TO_BYTES(max_file_blocks(inode)))
 		return -EFBIG;
 
 	while (count) {
@@ -237,7 +237,8 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
 	pos = le64_to_cpu(dloc.pos);
 
 	/* Get the descriptor */
-	if (pos + size < pos || pos + size > inode->i_sb->s_maxbytes ||
+	if (pos + size < pos ||
+	    pos + size > F2FS_BLK_TO_BYTES(max_file_blocks(inode)) ||
 	    pos < f2fs_verity_metadata_pos(inode) || size > INT_MAX) {
 		f2fs_warn(F2FS_I_SB(inode), "invalid verity xattr");
 		f2fs_handle_error(F2FS_I_SB(inode),
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
