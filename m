Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DE61177C6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 21:51:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iePzu-0001vh-6u; Mon, 09 Dec 2019 20:51:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iePzs-0001vT-Rd
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 20:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jXX4h7Qzo4yNng4F9K6FYQTD45lqdcTt0vG9dFMgCPY=; b=iQx/9jeXQuM3z2EwSxFtSFZEXN
 AsWnJhfeSz+UDZiq5ceEfOCV2MSk39WX1N83xZQ+xtGm8LH7qmpPzqtwuFXhvJoq367Pq6lfncgM7
 0pZjK7GwIPpxs1J5BfIFp3YsUlUSBYiMDck3+v5MsPt51QLSOrAmKgMxfkDCZwYx4EnY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jXX4h7Qzo4yNng4F9K6FYQTD45lqdcTt0vG9dFMgCPY=; b=Z
 ytW7yK41LbYa1pQpbVy/O1PblZtX50cnNu4XdEW5yZO6nXtRahd8WDTKnS0IQOddbA+hIz87Xvz0+
 kVCz4OQHjfwhI2M/tJXwzmycmE5DUR/a/OOI0Qhab9G8pGMfrQXSD4L4sPXH/Sap4/gM1gzCWn/cf
 bYplqI41BdV2BzWs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iePzq-00FoP5-T0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 20:51:12 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20B4E2068E;
 Mon,  9 Dec 2019 20:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575924660;
 bh=oCaaWnTFgChg9u4LKnle9ELlHgCeHYXQyxSgx1NPH1E=;
 h=From:To:Cc:Subject:Date:From;
 b=2c87cQA+9qJ3QJ73oMKaGjjmI69neV7VyZ/4P1heGa9J5RJTYUspnEA/Pby9verd2
 8tsl6+f+6tLT2LyJYcBJjmJFo7F+EL+Neh3REDU6qcnK5Of2l6yNaiq+hEmiLUCb6B
 FqSRQ0p4YDK6aYEbtYVxr+bQCFsuhHh6ApHcVL7A=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  9 Dec 2019 12:50:21 -0800
Message-Id: <20191209205021.231767-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iePzq-00FoP5-T0
Subject: [f2fs-dev] [PATCH] fscrypt: introduce
 fscrypt_needs_contents_encryption()
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add a function fscrypt_needs_contents_encryption() which takes an inode
and returns true if it's an encrypted regular file and the kernel was
built with fscrypt support.

This will allow replacing duplicated checks of IS_ENCRYPTED() &&
S_ISREG() on the I/O paths in ext4 and f2fs, while also optimizing out
unneeded code when !CONFIG_FS_ENCRYPTION.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/fscrypt.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index cb18b5fbcef92..2a29f56b1a1cb 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -72,6 +72,21 @@ static inline bool fscrypt_has_encryption_key(const struct inode *inode)
 	return READ_ONCE(inode->i_crypt_info) != NULL;
 }
 
+/**
+ * fscrypt_needs_contents_encryption() - check whether an inode needs
+ *					 contents encryption
+ *
+ * Return: %true iff the inode is an encrypted regular file and the kernel was
+ * built with fscrypt support.
+ *
+ * If you need to know whether the encrypt bit is set even when the kernel was
+ * built without fscrypt support, you must use IS_ENCRYPTED() directly instead.
+ */
+static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
+{
+	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode);
+}
+
 static inline bool fscrypt_dummy_context_enabled(struct inode *inode)
 {
 	return inode->i_sb->s_cop->dummy_context &&
@@ -269,6 +284,11 @@ static inline bool fscrypt_has_encryption_key(const struct inode *inode)
 	return false;
 }
 
+static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
+{
+	return false;
+}
+
 static inline bool fscrypt_dummy_context_enabled(struct inode *inode)
 {
 	return false;
-- 
2.24.0.393.g34dc348eaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
