Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E91BEC67B39
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Nov 2025 07:23:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tj1dpQOD1MARVwb/BVkSQ+7+aFcW+4Pa/BSnty+P+4=; b=XlVeY/3URJtstEJ9pTn4pK+E4R
	bgcgT7yUR9oxy7T7QakULFXW4LXHDgbwZ7GMMH8yeDPAHqqpSCvvu0mOdqiYM1hhF0pibBLGIQDVF
	RkDWxKVUZF0lQuRL1+5jEX7ffAPnhycBEJk1U3pMNN2iyKR9AnrHnXFoKNpPTA67TGcU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLF7J-00034B-9t;
	Tue, 18 Nov 2025 06:23:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+0812c32a4ab075f64334+8122+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vLF7H-000341-J6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G2zb3Q2fyVSCliM2H0fGzNDzGDdxeCfjnBDHQEp6ApQ=; b=ABu+rY/yrBcoW+vJFwMtsZwXgz
 CpP3kJftJLn1fEmGqImUmCcEIZSqZnXsGHT5xmTP4pHnnmKN2vXxZ5B0qa9K9AcjaO2A5xmNwHqnm
 PyEbQCEj+JphvR8twGblitEYy4kPOil6A1IZHaLPCbYK723h7rwXRl55AT4uP/1/rr1g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G2zb3Q2fyVSCliM2H0fGzNDzGDdxeCfjnBDHQEp6ApQ=; b=Zw0okLwUF3737R9cWGIal/0xOA
 HabG2e/6K7Q84l8W1qq5RnDg7wf32VWIQHgnzMjktb4olPy5nbHYVc2INTT9kJP5wvf51fWbzjOz7
 f8j0tUhtJ3BZT0UiqGZLVeWROcKkog/MgCU2SWHBIrFZi+8Pvnwji88vcIaqlC5/gPOc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vLF7H-0007Fo-2T for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=G2zb3Q2fyVSCliM2H0fGzNDzGDdxeCfjnBDHQEp6ApQ=; b=nTDutz6+Z8LtXzEP+vHWwbwu8s
 px7nF7SjtWbcHcEY6JuU0K5iUjMtmx+yi/bv2PrQ7DkXG55Dy0/Z9ihmHjuH2J6XLS6XX0S9flB6T
 OUmc7TkHJV83OvKvpEqcguD8VvjZ8+9JSBz5nVjfqrNBQOq688Jxl4WY45UdjIYe2FoZvyVmX22RH
 v3SJr/Z+CHcGBP2hI181hcEpDjovAk+cIpoFqWTX4KUqESt+CmhpTqOZABU9iF9t4GtebdH/O2MjL
 F6mS+T3LOqrYIudjk5NIwmcKkc3tesgxKwjLEa6jonHSh++67MwRwUQU44Vd5VG5ZqDbbtXi9eEPl
 jKKq68IQ==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vLF75-0000000HURD-3vFW; Tue, 18 Nov 2025 06:22:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Tue, 18 Nov 2025 07:21:52 +0100
Message-ID: <20251118062159.2358085-10-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251118062159.2358085-1-hch@lst.de>
References: <20251118062159.2358085-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Logical offsets into an inode are usually expresssed as bytes
 in the VFS. Switch fscrypt_zeroout_range to that convention. Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/crypto/bio.c | 6 +++--- fs/ext4/inode.c
 | 3 ++- fs/f2fs/file.c | 4 +++- include/linux/fscrypt.h | 4 ++-- 4 files
 changed, 10 insertions(+), 7 delet [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vLF7H-0007Fo-2T
Subject: [f2fs-dev] [PATCH 09/11] fscrypt: pass a byte offset to
 fscrypt_zeroout_range
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
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Logical offsets into an inode are usually expresssed as bytes in the VFS.
Switch fscrypt_zeroout_range to that convention.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/crypto/bio.c         | 6 +++---
 fs/ext4/inode.c         | 3 ++-
 fs/f2fs/file.c          | 4 +++-
 include/linux/fscrypt.h | 4 ++--
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index be751bcd2976..235dd1c3d443 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -113,7 +113,7 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
 /**
  * fscrypt_zeroout_range() - zero out a range of blocks in an encrypted file
  * @inode: the file's inode
- * @lblk: the first file logical block to zero out
+ * @pos: the first file logical offset (in bytes) to zero out
  * @pblk: the first filesystem physical block to zero out
  * @len: number of blocks to zero out
  *
@@ -127,7 +127,7 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
  *
  * Return: 0 on success; -errno on failure.
  */
-int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
+int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
 			  sector_t pblk, unsigned int len)
 {
 	const struct fscrypt_inode_info *ci = fscrypt_get_inode_info_raw(inode);
@@ -135,7 +135,7 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 	const unsigned int du_size = 1U << du_bits;
 	const unsigned int du_per_page_bits = PAGE_SHIFT - du_bits;
 	const unsigned int du_per_page = 1U << du_per_page_bits;
-	u64 du_index = (u64)lblk << (inode->i_blkbits - du_bits);
+	u64 du_index = pos >> du_bits;
 	u64 du_remaining = (u64)len << (inode->i_blkbits - du_bits);
 	loff_t pos = (loff_t)lblk << inode->i_blkbits;
 	sector_t sector = pblk << (inode->i_blkbits - SECTOR_SHIFT);
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index e99306a8f47c..209d326b8be9 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -402,7 +402,8 @@ int ext4_issue_zeroout(struct inode *inode, ext4_lblk_t lblk, ext4_fsblk_t pblk,
 	int ret;
 
 	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
-		return fscrypt_zeroout_range(inode, lblk, pblk, len);
+		return fscrypt_zeroout_range(inode,
+				(loff_t)lblk << inode->i_blkbits, pblk, len);
 
 	ret = sb_issue_zeroout(inode->i_sb, pblk, len, GFP_NOFS);
 	if (ret > 0)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ffa045b39c01..150c3eb15f51 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4142,7 +4142,9 @@ static int f2fs_secure_erase(struct block_device *bdev, struct inode *inode,
 
 	if (!ret && (flags & F2FS_TRIM_FILE_ZEROOUT)) {
 		if (IS_ENCRYPTED(inode))
-			ret = fscrypt_zeroout_range(inode, off, block, len);
+			ret = fscrypt_zeroout_range(inode,
+					(loff_t)off << inode->i_blkbits, block,
+					len);
 		else
 			ret = blkdev_issue_zeroout(bdev, sector, nr_sects,
 					GFP_NOFS, 0);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 5b86d7d0d367..065f909ebda2 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -450,7 +450,7 @@ u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name);
 
 /* bio.c */
 bool fscrypt_decrypt_bio(struct bio *bio);
-int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
+int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
 			  sector_t pblk, unsigned int len);
 
 /* hooks.c */
@@ -755,7 +755,7 @@ static inline bool fscrypt_decrypt_bio(struct bio *bio)
 	return true;
 }
 
-static inline int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
+static inline int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
 					sector_t pblk, unsigned int len)
 {
 	return -EOPNOTSUPP;
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
