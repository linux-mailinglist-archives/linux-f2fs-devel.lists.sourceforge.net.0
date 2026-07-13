Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DxuHKglQVGoHkgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 04:40:09 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C3746B0B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 04:40:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=XUz7a4Mb;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=eEfvt+Lk;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="L/KtL9lz";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=gUXac9pB;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53KYXUFI3HCQJAfRZQVvN7L1o6H4eudRB0wgoLB05mM=; b=XUz7a4MbKD04f/RrlERQzIc0z/
	a2DElkDBwc0cJYivilYnhiB9zNA4LFVQUl5ZNua5OILileeHHbDiJHYl8QiiJHmZkAGpUJhYrvO9r
	0rIRIpJwTKn9MJ/Xge90LQUQ7Upmz7mhc3WI77C6cC8s57a0mqBS4VWNitoVUS+TIUxg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wj6aU-0003yc-TX;
	Mon, 13 Jul 2026 02:40:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wj6aS-0003y2-E6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 02:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RpeHAoXwbljfB1aW+j0UuZMJgwf+yxoIhVBiwkRssAE=; b=eEfvt+LkEMIA2wgcZMnUgGOgDq
 7nGSuPJL7X6Q11V2oOK5UhrF7Rcmwn8IRI3YujnIZSCECjCMAirP3K/L7jakxDZPHvkkYGAz0KGK4
 H2Eax8582B0k1TjsUoYRGCkdVWyZJI+LG145miY6qVcZD20leSc8iK6iH3pQ1chQcLAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RpeHAoXwbljfB1aW+j0UuZMJgwf+yxoIhVBiwkRssAE=; b=L/KtL9lzzEdsnA+lKH/fFPtUaX
 giJ/4ia92tlzzvEuyiljFIZ6pk+8DUEqvNnYIjX5zH1zwloj9pjNIBBh0V/jIWDi0jgkhV7mZrQSZ
 hzKkHlpkfpd6pI1gvWmyeZZHtghaX3zeJiMd9Jd6TA+Z9qf2q2L5e/2HNXKJiq3ALwGk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wj6aQ-0003Cz-GX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 02:40:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D4C7E600AA;
 Mon, 13 Jul 2026 02:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B661F000E9;
 Mon, 13 Jul 2026 02:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783910391;
 bh=RpeHAoXwbljfB1aW+j0UuZMJgwf+yxoIhVBiwkRssAE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=gUXac9pBQIedxAwL31cbu3Z7nZ/Ij8tzZaeDijERELeT1IoMVAYimCF3BMm7Mx5Au
 eROt15+6ObKBDVLgWbhZvzFwwLrkKPryUmkZP0e+/DyXhB2OrP7XMWtrJi7xf91S7D
 l+oqZBA0KKy0t9siySv86ziVlMZDnwMSkUr0lueU7f8igaplVQV74LoqpDQV8ef5iJ
 OTk0Nv1eI6FduDv1qAAtbrNk6VEvM5cZIGjQdlgN6K/dVQSlryes/cLH8zHGQuMhgq
 Tfut0LWAdj+GYWR/vCgU15tnaoFhPNHCAhNPlTIMzt8sPqJrsx+9pEpQ2AuOoqNA5z
 wvERhrfRCAfww==
To: linux-fscrypt@vger.kernel.org
Date: Sun, 12 Jul 2026 22:37:04 -0400
Message-ID: <20260713023708.9245-14-ebiggers@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713023708.9245-1-ebiggers@kernel.org>
References: <20260713023708.9245-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On block-based filesystems, fscrypt file contents encryption
 is now always implemented using blk-crypto. This implementation supports
 direct I/O. Therefore, fscrypt_dio_supported() now always returns true, except
 in the edge case where statx(STATX_DIOALIGN) is called on an encrypted regular
 file that hasn't had its key set up. But that was real [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wj6aQ-0003Cz-GX
Subject: [f2fs-dev] [PATCH v3 13/17] fscrypt: Remove fscrypt_dio_supported()
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhang Yi <yi.zhang@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-fscrypt@vger.kernel.org,m:ritesh.list@gmail.com,m:tytso@mit.edu,m:yi.zhang@huawei.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:ebiggers@kernel.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,huawei.com,lists.sourceforge.net,vger.kernel.org,dilger.ca,linux.ibm.com,linux.alibaba.com,kernel.org,suse.cz,lst.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A4C3746B0B

On block-based filesystems, fscrypt file contents encryption is now
always implemented using blk-crypto.  This implementation supports
direct I/O.

Therefore, fscrypt_dio_supported() now always returns true, except in
the edge case where statx(STATX_DIOALIGN) is called on an encrypted
regular file that hasn't had its key set up.  But that was really a
workaround rather than the desired behavior, so we can disregard it.

Thus, fscrypt_dio_supported() is no longer needed.  Remove it.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/crypto/inline_crypt.c | 43 ----------------------------------------
 fs/ext4/inode.c          | 11 ++--------
 fs/f2fs/file.c           |  6 +-----
 include/linux/fscrypt.h  |  7 -------
 4 files changed, 3 insertions(+), 64 deletions(-)

diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 685815fa71a6..14c8af322c2f 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -298,49 +298,6 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 }
 EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio);
 
-/**
- * fscrypt_dio_supported() - check whether DIO (direct I/O) is supported on an
- *			     inode, as far as encryption is concerned
- * @inode: the inode in question
- *
- * Return: %true if there are no encryption constraints that prevent DIO from
- *	   being supported; %false if DIO is unsupported.  (Note that in the
- *	   %true case, the filesystem might have other, non-encryption-related
- *	   constraints that prevent DIO from actually being supported.  Also, on
- *	   encrypted files the filesystem is still responsible for only allowing
- *	   DIO when requests are filesystem-block-aligned.)
- */
-bool fscrypt_dio_supported(struct inode *inode)
-{
-	int err;
-
-	/* If the file is unencrypted, no veto from us. */
-	if (!fscrypt_needs_contents_encryption(inode))
-		return true;
-
-	/*
-	 * We only support DIO with inline crypto, not fs-layer crypto.
-	 *
-	 * To determine whether the inode is using inline crypto, we have to set
-	 * up the key if it wasn't already done.  This is because in the current
-	 * design of fscrypt, the decision of whether to use inline crypto or
-	 * not isn't made until the inode's encryption key is being set up.  In
-	 * the DIO read/write case, the key will always be set up already, since
-	 * the file will be open.  But in the case of statx(), the key might not
-	 * be set up yet, as the file might not have been opened yet.
-	 */
-	err = fscrypt_require_key(inode);
-	if (err) {
-		/*
-		 * Key unavailable or couldn't be set up.  This edge case isn't
-		 * worth worrying about; just report that DIO is unsupported.
-		 */
-		return false;
-	}
-	return true;
-}
-EXPORT_SYMBOL_GPL(fscrypt_dio_supported);
-
 /**
  * fscrypt_limit_io_blocks() - limit I/O blocks to avoid discontiguous DUNs
  * @inode: the file on which I/O is being done
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 567d62032bc5..0e21a2a0faa7 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -6147,11 +6147,8 @@ u32 ext4_dio_alignment(struct inode *inode)
 		return 0;
 	if (ext4_has_inline_data(inode))
 		return 0;
-	if (IS_ENCRYPTED(inode)) {
-		if (!fscrypt_dio_supported(inode))
-			return 0;
+	if (IS_ENCRYPTED(inode))
 		return i_blocksize(inode);
-	}
 	return 1; /* use the iomap defaults */
 }
 
@@ -6170,11 +6167,7 @@ int ext4_getattr(struct mnt_idmap *idmap, const struct path *path,
 		stat->btime.tv_nsec = ei->i_crtime.tv_nsec;
 	}
 
-	/*
-	 * Return the DIO alignment restrictions if requested.  We only return
-	 * this information when requested, since on encrypted files it might
-	 * take a fair bit of work to get if the file wasn't opened recently.
-	 */
+	/* Return the DIO alignment restrictions if requested. */
 	if ((request_mask & STATX_DIOALIGN) && S_ISREG(inode->i_mode)) {
 		u32 dio_align = ext4_dio_alignment(inode);
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4b52c56d71f0..089759366cdc 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -950,8 +950,6 @@ static bool f2fs_force_buffered_io(struct inode *inode, int rw)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
-	if (!fscrypt_dio_supported(inode))
-		return true;
 	if (fsverity_active(inode))
 		return true;
 	if (f2fs_compressed_file(inode))
@@ -996,9 +994,7 @@ int f2fs_getattr(struct mnt_idmap *idmap, const struct path *path,
 	}
 
 	/*
-	 * Return the DIO alignment restrictions if requested.  We only return
-	 * this information when requested, since on encrypted files it might
-	 * take a fair bit of work to get if the file wasn't opened recently.
+	 * Return the DIO alignment restrictions if requested.
 	 *
 	 * f2fs sometimes supports DIO reads but not DIO writes.  STATX_DIOALIGN
 	 * cannot represent that, so in that case we report no DIO support.
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 8d19b95150f1..43bafdd67dd7 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -870,8 +870,6 @@ void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
 bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 			   loff_t pos);
 
-bool fscrypt_dio_supported(struct inode *inode);
-
 u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk, u64 nr_blocks);
 
 #else /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
@@ -887,11 +885,6 @@ static inline bool fscrypt_mergeable_bio(struct bio *bio,
 	return true;
 }
 
-static inline bool fscrypt_dio_supported(struct inode *inode)
-{
-	return !fscrypt_needs_contents_encryption(inode);
-}
-
 static inline u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk,
 					  u64 nr_blocks)
 {
-- 
2.55.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
