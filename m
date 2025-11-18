Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF051C67B3C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Nov 2025 07:23:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LIJ+MtBeWlk+erIaNtgNw8xlzxDFsD605JH0YfkxzM=; b=M3KH6omCv8+FYz535c6BqxVVnY
	3HeLbgiidzOHNASHkJ6oaRceI4Lc9OdiOv9lQyiUKYohzDfB7jCu9qIZ+UskV87Yw0bXngbpShjfh
	bgcjVoQbLNa31jNOj/mUf+di5rWbTBAjxqqbv0mhABMQa/6rsYNlJTaL4JDNEyWhQTyA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLF7I-0001Yp-CB;
	Tue, 18 Nov 2025 06:23:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+0812c32a4ab075f64334+8122+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vLF7H-0001Yh-51 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZZkZjOQnGyIUghYGVRozjYOsML6G45CL7u5dxj9Y0EA=; b=m2lXkDARe4SQ6kI5YWVOEQevp+
 HX6vutejAS7eCcZ87Som2qto450JZ0rffFLZ+B1NbxMgPPV9ZhYaFneWoVXjvWXicz44clr+zJCDq
 a/QjMoCmcKge2X9iiq56fr1kWwwziuuOby0u4KWVJwveL7F+JEIzejwhnZ2Io+zj3u8M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZZkZjOQnGyIUghYGVRozjYOsML6G45CL7u5dxj9Y0EA=; b=EYb/vRGWvEhtpMg/odD1hWnCpv
 GCgWiDuQ9sICJvmAStMCNdI522Z5Nb2qOhE0hisgD4rvp6lp0xc5Whdt8LW6tzCKupMhxNfrXVHOe
 MCoXs1qkZNa4wk8GKwjpugYgK+pd4+Z5Z0hQRiIykojc6/KbV6aaCnhdyWd0SIgL7j8s=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vLF7G-0007Fm-Lz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 06:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ZZkZjOQnGyIUghYGVRozjYOsML6G45CL7u5dxj9Y0EA=; b=2Ml19sqAktZtwBKiLfjaJ0xyNL
 zpHZ/h+EH1BFP0ecXlUAz95B4puJdWSp6HZWem4P6mCBF238XrPn4oiAD07rC1ADqYfx6U65JJ3oV
 O0/+lgv5xTpy7fVQ5OILy5Rp2QUmAgbxEWyPYLEnRBq5hjSbS8AKcgEZAbZRqlvNIc5Q+M+vMh071
 OJTvCcyU4ynuj+zclqApLxPe1PLEiy34+NFOVEm5VgkFjIeTEb86zLOqzow0YRTWeKuv0i/TCJXPg
 MG7vaQYV9zdijOpUIdDIWkXzJob+EdD54li4lHAxxxiHDf3GO23Q98/H3QpaGe+r+o0OE150HQazw
 IKbtsw5g==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vLF7A-0000000HURc-0pK9; Tue, 18 Nov 2025 06:22:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Tue, 18 Nov 2025 07:21:53 +0100
Message-ID: <20251118062159.2358085-11-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251118062159.2358085-1-hch@lst.de>
References: <20251118062159.2358085-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Range lengths are usually expressed as bytes in the VFS,
 switch
 fscrypt_zeroout_range to this convention. Signed-off-by: Christoph Hellwig
 <hch@lst.de> --- fs/crypto/bio.c | 6 +++--- fs/ext4/inode.c | 3 ++-
 fs/f2fs/file.c
 | 2 +- 3 files changed, 6 insertions(+), 5 deletions(-) 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vLF7G-0007Fm-Lz
Subject: [f2fs-dev] [PATCH 10/11] fscrypt: pass a byte length to
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

Range lengths are usually expressed as bytes in the VFS, switch
fscrypt_zeroout_range to this convention.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/crypto/bio.c | 6 +++---
 fs/ext4/inode.c | 3 ++-
 fs/f2fs/file.c  | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 235dd1c3d443..4e9893664c0f 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -115,7 +115,7 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
  * @inode: the file's inode
  * @pos: the first file logical offset (in bytes) to zero out
  * @pblk: the first filesystem physical block to zero out
- * @len: number of blocks to zero out
+ * @len: bytes to zero out
  *
  * Zero out filesystem blocks in an encrypted regular file on-disk, i.e. write
  * ciphertext blocks which decrypt to the all-zeroes block.  The blocks must be
@@ -136,7 +136,7 @@ int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
 	const unsigned int du_per_page_bits = PAGE_SHIFT - du_bits;
 	const unsigned int du_per_page = 1U << du_per_page_bits;
 	u64 du_index = pos >> du_bits;
-	u64 du_remaining = (u64)len << (inode->i_blkbits - du_bits);
+	u64 du_remaining = len >> du_bits;
 	loff_t pos = (loff_t)lblk << inode->i_blkbits;
 	sector_t sector = pblk << (inode->i_blkbits - SECTOR_SHIFT);
 	struct page *pages[16]; /* write up to 16 pages at a time */
@@ -151,7 +151,7 @@ int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
 
 	if (fscrypt_inode_uses_inline_crypto(inode))
 		return fscrypt_zeroout_range_inline_crypt(inode, pos, sector,
-				len << inode->i_blkbits);
+				len);
 
 	BUILD_BUG_ON(ARRAY_SIZE(pages) > BIO_MAX_VECS);
 	nr_pages = min_t(u64, ARRAY_SIZE(pages),
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 209d326b8be9..3743260b70d4 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -403,7 +403,8 @@ int ext4_issue_zeroout(struct inode *inode, ext4_lblk_t lblk, ext4_fsblk_t pblk,
 
 	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
 		return fscrypt_zeroout_range(inode,
-				(loff_t)lblk << inode->i_blkbits, pblk, len);
+				(loff_t)lblk << inode->i_blkbits, pblk,
+				len << inode->i_blkbits);
 
 	ret = sb_issue_zeroout(inode->i_sb, pblk, len, GFP_NOFS);
 	if (ret > 0)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 150c3eb15f51..45ec6f83fcda 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4144,7 +4144,7 @@ static int f2fs_secure_erase(struct block_device *bdev, struct inode *inode,
 		if (IS_ENCRYPTED(inode))
 			ret = fscrypt_zeroout_range(inode,
 					(loff_t)off << inode->i_blkbits, block,
-					len);
+					len << inode->i_blkbits);
 		else
 			ret = blkdev_issue_zeroout(bdev, sector, nr_sects,
 					GFP_NOFS, 0);
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
