Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D4EC67B4F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Nov 2025 07:23:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COnwExJelgp4ta+4/h9lZpAD3fHLwpoCPFABTCms0vE=; b=XyslNiZvOI5Yz42cRr8msFu7pG
	KnBP2sGmX5atRpPGiuRlBFBKD8RGneNaqdRaBXDHLwsIYZXejdFg3UPqJ4pi5ooHx/2BKFKm3+lJN
	VBqGC6eJ02KjA6f+e9HLiAfubW4y5mDDcVYJ/0tHyGXnbLkR/INyg9R0oSsrm1y8lrDo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLF7R-0005nr-4V;
	Tue, 18 Nov 2025 06:23:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+0812c32a4ab075f64334+8122+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vLF7P-0005nZ-Bm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=maKopu2ueksKXHtq1fc6D/pIVzIQjjOXmEvWcRyAhDQ=; b=QRd3WXCJ0GG7WFwgd9NMPWgP06
 dGO2a00HAQ2e/ohhFjrvFcqH0MfmmlZYNRENyNBHX4r6Fn+8uQ0EB5rWpDRIJZRe89bca68Wj02pM
 wYlwQKVUj0oCFV+Ao5VX+VlhkE1o9sYrlmIkr2vSpM3jNJb/dQ2dp9FOnF84Ll62m2oE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=maKopu2ueksKXHtq1fc6D/pIVzIQjjOXmEvWcRyAhDQ=; b=GvnhkLS07fOsNpYas55PviL1R1
 CHSbybhKZa8j4FrtvLtqzRrMDxMrl2YrW2aPRDD8rMpoDvZtSCFgKb0ultUAue8XNq1alHTb9uvf+
 OUVDAAgznkRR9yUsBojlOXNsUuI0WhqsXq3sd/ZOlfSMe2bULuYeT19RFYu7EnZOW/OY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vLF7P-0007GW-Kz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=maKopu2ueksKXHtq1fc6D/pIVzIQjjOXmEvWcRyAhDQ=; b=rG7bh+ARUqJdOqoyrjC/caIkr3
 zZteJG5gaJIXz8GFA0EXypEhTWiAQQ7eMClmcognNt2wwpLAfmNh8PP0ePK6nRoJWxDpUrPvV5p6/
 FpYzw+rpQDSPMcLhQKxaIgVwqUIJROVcpY6Lg2dQ1o0wUT93P9KHVdRXFLCRFzg2CmxhDtS8a/fCp
 yygaSAhL5LCdxZQ/1PXF6TXdf7c56ME6fUu1J51jm3ZTbRQa4YntPWNeA2J8rteE2TXR7CRk58EBB
 SGK4eSyxUbnhMmumpQAakxdqFHw4Hdg59urW8c4pbEOtP4OGtsMzST82bZeUe9aZVi5t/14728de6
 fLdlvhiw==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vLF7E-0000000HUS0-1oBS; Tue, 18 Nov 2025 06:23:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Tue, 18 Nov 2025 07:21:54 +0100
Message-ID: <20251118062159.2358085-12-hch@lst.de>
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
 Content preview: While the pblk argument to fscrypt_zeroout_range is declared
 as a sector_t, it actually is interpreted as a logical block size unit, which
 is highly unusual. Switch to passing the 512 byte units that [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vLF7P-0007GW-Kz
Subject: [f2fs-dev] [PATCH 11/11] fscrypt: pass a real sector_t to
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

While the pblk argument to fscrypt_zeroout_range is declared as a
sector_t, it actually is interpreted as a logical block size unit, which
is highly unusual.  Switch to passing the 512 byte units that sector_t is
defined for.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/crypto/bio.c         | 6 ++----
 fs/ext4/inode.c         | 3 ++-
 fs/f2fs/file.c          | 2 +-
 include/linux/fscrypt.h | 4 ++--
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 4e9893664c0f..63bb53aeac4a 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -114,7 +114,7 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
  * fscrypt_zeroout_range() - zero out a range of blocks in an encrypted file
  * @inode: the file's inode
  * @pos: the first file logical offset (in bytes) to zero out
- * @pblk: the first filesystem physical block to zero out
+ * @sector: the first sector to zero out
  * @len: bytes to zero out
  *
  * Zero out filesystem blocks in an encrypted regular file on-disk, i.e. write
@@ -128,7 +128,7 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
  * Return: 0 on success; -errno on failure.
  */
 int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
-			  sector_t pblk, unsigned int len)
+			  sector_t sector, unsigned int len)
 {
 	const struct fscrypt_inode_info *ci = fscrypt_get_inode_info_raw(inode);
 	const unsigned int du_bits = ci->ci_data_unit_bits;
@@ -137,8 +137,6 @@ int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
 	const unsigned int du_per_page = 1U << du_per_page_bits;
 	u64 du_index = pos >> du_bits;
 	u64 du_remaining = len >> du_bits;
-	loff_t pos = (loff_t)lblk << inode->i_blkbits;
-	sector_t sector = pblk << (inode->i_blkbits - SECTOR_SHIFT);
 	struct page *pages[16]; /* write up to 16 pages at a time */
 	unsigned int nr_pages;
 	unsigned int i;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 3743260b70d4..d8a845da2881 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -403,7 +403,8 @@ int ext4_issue_zeroout(struct inode *inode, ext4_lblk_t lblk, ext4_fsblk_t pblk,
 
 	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
 		return fscrypt_zeroout_range(inode,
-				(loff_t)lblk << inode->i_blkbits, pblk,
+				(loff_t)lblk << inode->i_blkbits,
+				pblk << (inode->i_blkbits - SECTOR_SHIFT),
 				len << inode->i_blkbits);
 
 	ret = sb_issue_zeroout(inode->i_sb, pblk, len, GFP_NOFS);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 45ec6f83fcda..315816ac07be 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4143,7 +4143,7 @@ static int f2fs_secure_erase(struct block_device *bdev, struct inode *inode,
 	if (!ret && (flags & F2FS_TRIM_FILE_ZEROOUT)) {
 		if (IS_ENCRYPTED(inode))
 			ret = fscrypt_zeroout_range(inode,
-					(loff_t)off << inode->i_blkbits, block,
+					(loff_t)off << inode->i_blkbits, sector,
 					len << inode->i_blkbits);
 		else
 			ret = blkdev_issue_zeroout(bdev, sector, nr_sects,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 065f909ebda2..11464bf0a241 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -451,7 +451,7 @@ u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name);
 /* bio.c */
 bool fscrypt_decrypt_bio(struct bio *bio);
 int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
-			  sector_t pblk, unsigned int len);
+			  sector_t sector, unsigned int len);
 
 /* hooks.c */
 int fscrypt_file_open(struct inode *inode, struct file *filp);
@@ -756,7 +756,7 @@ static inline bool fscrypt_decrypt_bio(struct bio *bio)
 }
 
 static inline int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
-					sector_t pblk, unsigned int len)
+					sector_t sector, unsigned int len)
 {
 	return -EOPNOTSUPP;
 }
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
