Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wkIHK6VdoGlSiwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 15:50:13 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 153EF1A7EAE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 15:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=me91S43xwu22vIv0ptuBMHifWNHxtWrCcxz59WyRE7g=; b=MXralPv8DPReyUSHH05bslrc5j
	BuxuFzH9rKDod0I8B05py5qxYgdokKaPxBqFPTsWzoZXitat3EHHSjogvkaoycSqgTI8+yLwCC10h
	EdzKfMDNoqt1O0cs/u94YnJWjKU9n9sJjDsLwHFk4IKp9SfoHfZBOysXFLEB0gEBQjpM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvcgs-0003q7-JG;
	Thu, 26 Feb 2026 14:50:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vvcgr-0003py-Pc for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 14:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SiNWzpJZ1Wfv02Erml8bTB6xkGMGQzWqEZOwAf2CgLQ=; b=NNBOs4TyPIe0qlFgCXcHjEMzRS
 hWrYU2m4CJtvlGX7eQNB23HSrkA709YexH1UAToXhXDKPKGmOgoHGb7QxaFPPHfWY+Is1332BJZKN
 bHYCBEayrFxVXlPtmWloTjrw87Z4twgkJ+JOGWNIhx08x5PweG6wzwChJSAVU53kpbKc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SiNWzpJZ1Wfv02Erml8bTB6xkGMGQzWqEZOwAf2CgLQ=; b=REo+D4T00fWy7dNoJ8ZxZBH3+p
 ox+JmRyLW7/kS8I21XIrq3EZnjsMdlvRfc0sSiGKm7YEXSokRPAxm7I7uFavqQcZSFGqieyXq78f0
 6pX8VhSxrtsEoQmFM+U4frFHAOi6lhcA0TZUDPt2bOVxk30OOxT1UV8doHDt/jxsyqEk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvcgr-0000Si-90 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 14:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=SiNWzpJZ1Wfv02Erml8bTB6xkGMGQzWqEZOwAf2CgLQ=; b=LGCVb2mwZ+4Q98nJp4KxIoJkUW
 1BgfxKsdGZg6e9CEoAzOe4jGYlwQNo5NfaCM/qiMjUK/bahtR65oIzyvjnaE/SR2uRxaEoj1mw1c3
 ++Vzf1pFBh7n5LAMvDlEM5XpN+iXZhixyo2KPCzaquRZ3o4A3timCEP3xzi5P45xjVSWAv+nMtt1j
 epf7D917rrx6diXpWQAnfKeieA5Vh18s8Riso6T2kSDTqFWGPrEEVizaXH8R4T/Y7NFsfszVzAkat
 lyJHkzGpqgQ8iik0rZQCfSi2pZX1eC0cAScIFcP2Vg2I/T0wMEZF+zGyRm/ZkoivkR12ZUHwfHkwO
 vWqqvZkg==;
Received: from [4.28.11.157] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vvcgg-00000006NcH-1qqF; Thu, 26 Feb 2026 14:49:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Thu, 26 Feb 2026 06:49:32 -0800
Message-ID: <20260226144954.142278-13-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226144954.142278-1-hch@lst.de>
References: <20260226144954.142278-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Range lengths are usually expressed as bytes in the VFS,
 switch
 fscrypt_zeroout_range to this convention. Signed-off-by: Christoph Hellwig
 <hch@lst.de> --- fs/crypto/bio.c | 10 +++++----- fs/ext4/inode.c | 3 ++-
 fs/f2fs/file.c | 2 +- include/linux/fscrypt.h | 6 +++--- 4 files changed,
 11 insertions(+), 10 [...] 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vvcgr-0000Si-90
Subject: [f2fs-dev] [PATCH 12/14] fscrypt: pass a byte length to
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
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 153EF1A7EAE
X-Rspamd-Action: no action

Range lengths are usually expressed as bytes in the VFS, switch
fscrypt_zeroout_range to this convention.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/crypto/bio.c         | 10 +++++-----
 fs/ext4/inode.c         |  3 ++-
 fs/f2fs/file.c          |  2 +-
 include/linux/fscrypt.h |  6 +++---
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index a4f4ee86c573..7d57ffb1e8c6 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -71,7 +71,7 @@ static void fscrypt_zeroout_range_end_io(struct bio *bio)
 
 static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
 					      loff_t pos, sector_t sector,
-					      unsigned int len)
+					      u64 len)
 {
 	struct fscrypt_zero_done done = {
 		.pending	= ATOMIC_INIT(1),
@@ -115,7 +115,7 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
  * @inode: the file's inode
  * @pos: the first file position (in bytes) to zero out
  * @pblk: the first filesystem physical block to zero out
- * @len: number of blocks to zero out
+ * @len: bytes to zero out
  *
  * Zero out filesystem blocks in an encrypted regular file on-disk, i.e. write
  * ciphertext blocks which decrypt to the all-zeroes block.  The blocks must be
@@ -128,7 +128,7 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
  * Return: 0 on success; -errno on failure.
  */
 int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
-			  sector_t pblk, unsigned int len)
+			  sector_t pblk, u64 len)
 {
 	const struct fscrypt_inode_info *ci = fscrypt_get_inode_info_raw(inode);
 	const unsigned int du_bits = ci->ci_data_unit_bits;
@@ -136,7 +136,7 @@ int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
 	const unsigned int du_per_page_bits = PAGE_SHIFT - du_bits;
 	const unsigned int du_per_page = 1U << du_per_page_bits;
 	u64 du_index = pos >> du_bits;
-	u64 du_remaining = (u64)len << (inode->i_blkbits - du_bits);
+	u64 du_remaining = len >> du_bits;
 	sector_t sector = pblk << (inode->i_blkbits - SECTOR_SHIFT);
 	struct page *pages[16]; /* write up to 16 pages at a time */
 	unsigned int nr_pages;
@@ -150,7 +150,7 @@ int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
 
 	if (fscrypt_inode_uses_inline_crypto(inode))
 		return fscrypt_zeroout_range_inline_crypt(inode, pos, sector,
-				len << inode->i_blkbits);
+				len);
 
 	BUILD_BUG_ON(ARRAY_SIZE(pages) > BIO_MAX_VECS);
 	nr_pages = min_t(u64, ARRAY_SIZE(pages),
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 945613c95ffa..675ef741cb30 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -406,7 +406,8 @@ int ext4_issue_zeroout(struct inode *inode, ext4_lblk_t lblk, ext4_fsblk_t pblk,
 
 	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
 		return fscrypt_zeroout_range(inode,
-				(loff_t)lblk << inode->i_blkbits, pblk, len);
+				(loff_t)lblk << inode->i_blkbits, pblk,
+				len << inode->i_blkbits);
 
 	ret = sb_issue_zeroout(inode->i_sb, pblk, len, GFP_NOFS);
 	if (ret > 0)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 239c2666ceb5..5b7013f7f6a1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4164,7 +4164,7 @@ static int f2fs_secure_erase(struct block_device *bdev, struct inode *inode,
 		if (IS_ENCRYPTED(inode))
 			ret = fscrypt_zeroout_range(inode,
 					(loff_t)off << inode->i_blkbits, block,
-					len);
+					len << inode->i_blkbits);
 		else
 			ret = blkdev_issue_zeroout(bdev, sector, nr_sects,
 					GFP_NOFS, 0);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 9fc15e1fbe57..90ac62fda926 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -450,8 +450,8 @@ u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name);
 
 /* bio.c */
 bool fscrypt_decrypt_bio(struct bio *bio);
-int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
-			  sector_t pblk, unsigned int len);
+int fscrypt_zeroout_range(const struct inode *inode, loff_t pos, sector_t pblk,
+			  u64 len);
 
 /* hooks.c */
 int fscrypt_file_open(struct inode *inode, struct file *filp);
@@ -756,7 +756,7 @@ static inline bool fscrypt_decrypt_bio(struct bio *bio)
 }
 
 static inline int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
-					sector_t pblk, unsigned int len)
+					sector_t pblk, u64 len)
 {
 	return -EOPNOTSUPP;
 }
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
