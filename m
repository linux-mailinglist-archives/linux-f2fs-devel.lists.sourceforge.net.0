Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E132141432
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2020 23:36:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/V2BMJvAQZ4KPIRenp5mX5T5cZYbXVSogeZUdrQjZjg=; b=JlpoQaNd7E2vbdaKqylYs/MA6
	FidK6X0RO+s/GL6+QhZOKTuBQ3yb7rKRmEffngt4+vwphOufl2ONFjly7QwV7Uu++3rVGAU5qDMza
	V+5UpIXuTfmwXvWsu4diXlwkIceQ4NShJp1JexnSY3D2hM5DTYU2XtErcp5jTDbxdEb5I=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isaDy-0007Ay-OK; Fri, 17 Jan 2020 22:36:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3aSoiXgYKAD4iwtxjslttlqj.htr@flex--drosen.bounces.google.com>)
 id 1isaDx-0007An-RR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 22:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q4rBdwTpu0kgcesfAqettRZRoe3eJIs+PO2/oZPudMI=; b=bvV2P20U8EiftN8+LyyR2dMax
 /2BHTArtbp/XXWhgIJUSJA9lMHEWfgCJqdGgDtebXd9JP8BsnoV5JDGo5hJ6IrT3Oon+Lul2euTvG
 kXhb9poEvBYOvoklVL3yUgCRsk7AqUQGAP60Lq6Sm1+ffqbVuYyHgNOjnU+/7fb+ZlBD8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q4rBdwTpu0kgcesfAqettRZRoe3eJIs+PO2/oZPudMI=; b=hwqxFtWcqN85C74u3MI1c8+gXG
 bC01SAMoqrhQbysJcrciBSE1KJ/HtNNRJV2iTysNS+bxBz4b9B5+6FQvoERe1KJvWNvWlwIU/zjkD
 ckyngzW/twP4SwRzAHQZ4oEiU+py8zaO+jKbK5rpfBaEXfu/mCichDpoTzr50zX4zp6c=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1isaDu-00Bk6Z-Uv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 22:36:17 +0000
Received: by mail-yb1-f201.google.com with SMTP id b144so9979018ybg.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Jan 2020 14:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Q4rBdwTpu0kgcesfAqettRZRoe3eJIs+PO2/oZPudMI=;
 b=HgH/cjvrF4Zia0V0+IeU5NYRKU1aapr1ropmrp6wIQEhHKtyjKZuynqRYZXyB6R0iK
 M2gvpJkEsO67KRph9gY05tFOH+FqKAIxduQZ1V9cE1pI6KCoFEgF5hiXeUyBak4o5CHB
 pC2wEBiQBi7O2M65FW7rjDF5NwtzLRJEXal88aPC8G+3EUBIwKRyt9hrc0SevGsO2q9V
 ZhhpNLkkikMSEdps2HlgtM/v/nAVY60CZKzDcl1eyYCbY8yr3hu3NggL9wcq8AT0cych
 /o5RTDmU82+mRI5AKUX31wCwtJqLzhwEPgaDpYSI+MsIUhkkkYw3NWF7A95mbwJx1ey0
 itxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Q4rBdwTpu0kgcesfAqettRZRoe3eJIs+PO2/oZPudMI=;
 b=Hrlo+/BOoglIXESRLUVlr9ne+xs6CAL3l+ASEVpId4YqR5E5S93H2o+BO2pMneWJEa
 qjPOEA+R9n8vO7tlbcDqI7+B1ZEAo4yy2l3azcbp7TojYIup92oGpStf+gBdX+Xo2IT4
 hVlfslTP1bSysfdor2zfQfNL+n6QilkgU8BN1Do79n76yBGiD4+nNWPthqc8HsOU3f8A
 laIgwRcBH84Bo7jSdcOU0pP80AxIABRnruE1F7adynriqV6bz5UjqPr34qsXVnPjwpx6
 /oDSbLLzqFlgQDq807jPDxYYDXHrmzaYNXupLsJhwpX8XhvP/430LLCKs9OcE1np3PkI
 Z3fw==
X-Gm-Message-State: APjAAAW4SeXcGRq34+5NmBtrDbKariOonv48BCPYfFv1mB1fRh0wZJSm
 dLDTUdyVkjQeyLZs8OKmsJP9AoI0bvM=
X-Google-Smtp-Source: APXvYqxzCff7DvKzBojWKyAGZ3dq8QFpSmD6KoOeo/TuurTUuCeKd0w8VmzzbGwNUGOYIzxOpi9DPxWBE9M=
X-Received: by 2002:ab0:48cf:: with SMTP id y15mr24885192uac.26.1579297385289; 
 Fri, 17 Jan 2020 13:43:05 -0800 (PST)
Date: Fri, 17 Jan 2020 13:42:41 -0800
In-Reply-To: <20200117214246.235591-1-drosen@google.com>
Message-Id: <20200117214246.235591-5-drosen@google.com>
Mime-Version: 1.0
References: <20200117214246.235591-1-drosen@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1isaDu-00Bk6Z-Uv
Subject: [f2fs-dev] [PATCH v3 4/9] fscrypt: Only create hash key when needed
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If a directory isn't casefolded, it doesn't need the hash key. Skip
deriving it unless we enable it later.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/crypto/keysetup.c |  2 +-
 fs/crypto/policy.c   | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 7445ab76e0b32..c0db9e8d31f15 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -217,7 +217,7 @@ static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
 	if (err)
 		return err;
 
-	if (S_ISDIR(ci->ci_inode->i_mode)) {
+	if (S_ISDIR(ci->ci_inode->i_mode) && IS_CASEFOLDED(ci->ci_inode)) {
 		err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
 					  HKDF_CONTEXT_FNAME_HASH_KEY,
 					  ci->ci_nonce,
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 2cd9a940d8f46..632ca355e1184 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -10,6 +10,7 @@
  * Modified by Eric Biggers, 2019 for v2 policy support.
  */
 
+#include <linux/key-type.h>
 #include <linux/random.h>
 #include <linux/string.h>
 #include <linux/mount.h>
@@ -591,6 +592,8 @@ int fscrypt_ioc_setflags_prepare(struct inode *inode,
 				 unsigned int flags)
 {
 	union fscrypt_policy policy;
+	struct fscrypt_info *ci;
+	struct fscrypt_master_key *mk;
 	int err;
 
 	/*
@@ -603,6 +606,28 @@ int fscrypt_ioc_setflags_prepare(struct inode *inode,
 			return err;
 		if (policy.version != FSCRYPT_POLICY_V2)
 			return -EINVAL;
+		err = fscrypt_require_key(inode);
+		if (err)
+			return err;
+		ci = inode->i_crypt_info;
+		if (ci->ci_hash_key_initialized)
+			return 0;
+		mk = ci->ci_master_key->payload.data[0];
+		down_read(&mk->mk_secret_sem);
+		if (!is_master_key_secret_present(&mk->mk_secret)) {
+			err = -ENOKEY;
+		} else {
+			err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
+						  HKDF_CONTEXT_FNAME_HASH_KEY,
+						  ci->ci_nonce,
+						  FS_KEY_DERIVATION_NONCE_SIZE,
+						  (u8 *)&ci->ci_hash_key,
+						  sizeof(ci->ci_hash_key));
+		}
+		up_read(&mk->mk_secret_sem);
+		if (err)
+			return err;
+		ci->ci_hash_key_initialized = true;
 	}
 
 	return 0;
-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
