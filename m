Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMWhOEVZlWnQPAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 07:16:37 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6CC1535E3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 07:16:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJdAMew2UjAxJutk/Xac2w+bsjiyiTeIyRc6tbdzQ4g=; b=dy3KuD7Ntpa4qW6KF7jkkAqfgH
	ldSMz0wpnp+TCfcD+aAe/z6tdP0Tj4sVnnuyjUjS/tAr4UnN2YLgPuVxm6+8rxG9+DlOMP58Zt0U+
	pm4LOpZV6yGFf0tXpklGixTQlkIeX6VFaMVpkFAITQ0Di/YpcIHSmmsGAtUfTN3HbI1U=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vsarT-0006hf-9A;
	Wed, 18 Feb 2026 06:16:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b7a6f314dcfbee4e7dbb+8214+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vsarS-0006hQ-3C for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 06:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VcvKWVedtLFNeUePzxyg9ziacX2X2/mCVUWs+sJncbQ=; b=ZE7ETWIlxdl33QmPvmHcfylkdU
 72CXsRm4uWPAkEXB9FEQLOwjuTS6mWnygrlpQdQ7vfq+l6ilEEcXUQWZZfBEi+5vHofSRFKzTrG9t
 IVhWMQ1P6QHpTFOrHXwMmcP75EgHGrzvhysK+gkxxRr7gVQbFb+p31uXNOPcRWhjB/0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VcvKWVedtLFNeUePzxyg9ziacX2X2/mCVUWs+sJncbQ=; b=dGWOUSLLqifBIqHu9zyYeysTfR
 DMccK+vUffP4SP9s7QSekULOyPPlg07ISi3lAu2ANJEKV3NMIQDL63SlzWJWkgG38Nk+rG9ynEMd5
 8Nzjv8S9htVapdncW9DIYNF+792ErVFYBMNvmSSCKMMKgOcxn26lMGP0+vldWb872hZU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vsarS-0006LU-1G for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 06:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=VcvKWVedtLFNeUePzxyg9ziacX2X2/mCVUWs+sJncbQ=; b=ST4LAGdabcaNmy0VRLTitYXFkw
 mWwVBPp/gsZnpmmZpcS3jTLT0J0zb/LeFcDvjjb2vaPjTgm8hVa1eN15hdxJLqTrBkHw5q2jx+kX9
 DcbGDFq5rlqmfFmzARyHN+VH5F4fGRdL6XeWWLKpcylokcrUSKP3qcpV2mlaBvrG7QnSy5WEgwnK9
 dCY538bIGaf0x6wTTQ5a2nzG9Our6GukIF6hgN+xeSovhmIXee0IWOVxSQWRNz7CdWGrio77F9f4L
 COMGec3wOCeL6+BXgjacgK0r5dd0Rg88sRJBbq0LtewcMBycNbsNsW/xTs9pAdd8tnoB+ly9AWNO2
 ZIefMhQg==;
Received: from [2001:4bb8:2dc:9863:1842:9381:9c0f:de32] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vsarG-00000009Lim-3CYJ; Wed, 18 Feb 2026 06:16:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Wed, 18 Feb 2026 07:14:47 +0100
Message-ID: <20260218061531.3318130-10-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218061531.3318130-1-hch@lst.de>
References: <20260218061531.3318130-1-hch@lst.de>
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
X-Headers-End: 1vsarS-0006LU-1G
Subject: [f2fs-dev] [PATCH 9/9] fscrypt: pass a real sector_t to
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lst.de:mid,lst.de:email]
X-Rspamd-Queue-Id: 5E6CC1535E3
X-Rspamd-Action: no action

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
index cea931620c04..45fe74aa8366 100644
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
index 675ef741cb30..d0028d6d3de1 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -406,7 +406,8 @@ int ext4_issue_zeroout(struct inode *inode, ext4_lblk_t lblk, ext4_fsblk_t pblk,
 
 	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
 		return fscrypt_zeroout_range(inode,
-				(loff_t)lblk << inode->i_blkbits, pblk,
+				(loff_t)lblk << inode->i_blkbits,
+				pblk << (inode->i_blkbits - SECTOR_SHIFT),
 				len << inode->i_blkbits);
 
 	ret = sb_issue_zeroout(inode->i_sb, pblk, len, GFP_NOFS);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5b7013f7f6a1..ad435dea656a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4163,7 +4163,7 @@ static int f2fs_secure_erase(struct block_device *bdev, struct inode *inode,
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
