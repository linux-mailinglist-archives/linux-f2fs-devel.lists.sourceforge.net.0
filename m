Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aiwpMgC1SmoiGgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 05 Jul 2026 21:48:16 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6D270B201
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 05 Jul 2026 21:48:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=N01EI2qS;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=UYIa129K;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=TktW1sfF;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=P0OsLQrb;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opSaUb90wgpB/QPKSYWI2mRwbhxSbKOqOPUOpv8MgYM=; b=N01EI2qS9G3axEm8kzDMhIWibH
	JaQ0tduVo5oPrZjXlQW8qB0V2tq+DTW3l/ivnDg2HohHJcvCmwUW2u/Uih9CJcGhGEsHJ3y5DFAE9
	SEphfdXdN7LFOazSRvXtyIH1fXiwX59gqRu/mrsbKvJgT1VgOabI5MR0rWgucBKifuZw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wgSp1-0004Qq-N3;
	Sun, 05 Jul 2026 19:48:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wgSoh-0004QB-Cl
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 05 Jul 2026 19:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gfpz689V4pGfz5uZs3AyGXvqPghKUAJ1Vdt7trKNrUY=; b=UYIa129K+oDrHfW3NoivrY4cJB
 Rw1X/QJgnAHGAHxJCuGlfGnK+BWSeyIA3dwi2ry7B17Pj+A0YEmgWN0TGwSqtS4eIu1t8WqnZgkW6
 yYGpJcxYUy+S1wXCqjub+jiO6jE3fl8ZnszihB9ndmZ0gj3N3i+SA2qij9YQGPbvFJ9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gfpz689V4pGfz5uZs3AyGXvqPghKUAJ1Vdt7trKNrUY=; b=TktW1sfFzmW75wuHQDsaeVVeK8
 vwEIcdsyqtQn0MgVpFyh2GOWC/ReAFXFmddK8BdF6RJ1ccs6S2PJnVI78hRFSodCTF4oIwN+Eu1pk
 MJBPMBTeHkr7FjoCKZvhjSSxUPmhVM2IdmdETkQyHl+KKy1yc8ROygum3sPENoEGAp2k=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wgSod-0001BX-Tu for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 05 Jul 2026 19:47:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2699A42DA7;
 Sun,  5 Jul 2026 19:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DBC1F00A3D;
 Sun,  5 Jul 2026 19:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783280863;
 bh=gfpz689V4pGfz5uZs3AyGXvqPghKUAJ1Vdt7trKNrUY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=P0OsLQrbKtGJbOjVdbuc6CA9XXOCTVbHVydNKM0DKH9f/LFbP/+VpH6I1ORHGvRqB
 rfYalun3Yy6GEPe5Hs+eUmiqkJ6V/Kd5YEErN6EtnBB4rMU784hkT3yw0KyXhSdcv0
 mAUuiJFK+L93CMT7AXzG6PITXfdpBTT20C0LN+AfvcG/PFP8pTmbCEWhnvD/xJaC31
 7Do5PYFE8KJaNgM2J8axm/OZ+6JPlWa8hkwRyAOvzCz5QydanVQsgqaLLRisgOSimq
 BWEQumtKNeqtyGhvu1j9kXWPWHiyVi2K8ba0/WhD5QXUBHqID/2LdjudLs5K4rxsaQ
 dBAm3ldcD71wQ==
To: linux-fscrypt@vger.kernel.org
Date: Sun,  5 Jul 2026 12:45:41 -0700
Message-ID: <20260705194555.75030-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260705194555.75030-1-ebiggers@kernel.org>
References: <20260705194555.75030-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32 with s_blocksize !=
 PAGE_SIZE
 works only with the fs-layer implementation of file contents encryption,
 not blk-crypto. This is a problem for standardizing on blk-cry [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wgSod-0001BX-Tu
Subject: [f2fs-dev] [PATCH v2 04/17] fscrypt: Fully disallow IV_INO_LBLK_32
 with s_blocksize != PAGE_SIZE
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-fscrypt@vger.kernel.org,m:ritesh.list@gmail.com,m:tytso@mit.edu,m:yi.zhang@huawei.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:ebiggers@kernel.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,huawei.com,lists.sourceforge.net,vger.kernel.org,dilger.ca,linux.ibm.com,linux.alibaba.com,kernel.org,suse.cz,lst.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E6D270B201

FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32 with s_blocksize != PAGE_SIZE works
only with the fs-layer implementation of file contents encryption, not
blk-crypto.  This is a problem for standardizing on blk-crypto.

Fortunately, no one should be using this combination anyway.  It doesn't
make sense because the entire point of IV_INO_LBLK_32 is to support
inline encryption hardware that is limited to 32-bit DUNs.

Thus, fully disallow IV_INO_LBLK_32 with s_blocksize != PAGE_SIZE.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 Documentation/filesystems/fscrypt.rst |  3 +++
 fs/crypto/inline_crypt.c              | 13 -------------
 fs/crypto/policy.c                    | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index c0dd35f1af12..92b8f311e211 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -336,6 +336,9 @@ per I/O request and may have only a small number of keyslots.  This
 format results in some level of IV reuse, so it should only be used
 when necessary due to hardware limitations.
 
+IV_INO_LBLK_32 is supported only when the filesystem block size is
+equal to the page size.
+
 Key identifiers
 ---------------
 
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index aaf71f6068b0..83dea8bc2c8c 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -112,19 +112,6 @@ int fscrypt_select_encryption_impl(struct fscrypt_inode_info *ci,
 	if (!(sb->s_flags & SB_INLINECRYPT))
 		return 0;
 
-	/*
-	 * When a page contains multiple logically contiguous filesystem blocks,
-	 * some filesystem code only calls fscrypt_mergeable_bio() for the first
-	 * block in the page. This is fine for most of fscrypt's IV generation
-	 * strategies, where contiguous blocks imply contiguous IVs. But it
-	 * doesn't work with IV_INO_LBLK_32. For now, simply exclude
-	 * IV_INO_LBLK_32 with blocksize != PAGE_SIZE from inline encryption.
-	 */
-	if ((fscrypt_policy_flags(&ci->ci_policy) &
-	     FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32) &&
-	    sb->s_blocksize != PAGE_SIZE)
-		return 0;
-
 	/*
 	 * On all the filesystem's block devices, blk-crypto must support the
 	 * crypto configuration that the file would use.
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index f40fb5924e75..a7322dba7557 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -177,6 +177,23 @@ static bool supported_iv_ino_lblk_policy(const struct fscrypt_policy_v2 *policy,
 			     type, sb->s_id);
 		return false;
 	}
+
+	/*
+	 * IV_INO_LBLK_32 isn't compatible with inline encryption when
+	 * s_blocksize != PAGE_SIZE.  In that case the DUN can wrap around in
+	 * the middle of a page, but sometimes fscrypt_mergeable_bio() is called
+	 * only for the first block per page.  Since IV_INO_LBLK_32 exists only
+	 * to support inline encryption hardware that is limited to 32-bit DUNs,
+	 * just disallow IV_INO_LBLK_32 with s_blocksize != PAGE_SIZE entirely.
+	 */
+	if ((policy->flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32) &&
+	    sb->s_blocksize != PAGE_SIZE) {
+		fscrypt_warn(inode,
+			     "Can't use %s policy on filesystem '%s' with block size != PAGE_SIZE",
+			     type, sb->s_id);
+		return false;
+	}
+
 	return true;
 }
 
-- 
2.54.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
