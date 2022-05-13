Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6237E526D70
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 May 2022 01:21:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npear-0005mD-US; Fri, 13 May 2022 23:21:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1npeaq-0005m1-9S
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 23:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f4rW08l5ENhFE9aVDLfyD6IW+e0cNP4SgqcqW+Dz1Ug=; b=WrCKeXj5KS4YtkIQ8Zk86Xx/WO
 Oh/UNl38R7c+iefPuSHvCzL4TC0xq85UNwMZkOt4zREyDiQs1KLpWtJFyxV/guRaRP1/lCn3LAJyA
 gMzIMEeJ81IP3qVASaO84Vm02PZ8/XACENHgFVs98JjAzbmVUNpTutd/NCfiGQx9tWE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f4rW08l5ENhFE9aVDLfyD6IW+e0cNP4SgqcqW+Dz1Ug=; b=J6Kgx8rHwsCLV3zr845FAcwO8i
 J8hTis6S88o6wP2ORpo2bQbp9nx+c7k4HudMSxbchCF3RGt7UWZ1mwv9M8TtQvWcdlY0+gXILwg7/
 I5w7Lvz88wOyMeskY0MFtk9lZtC1o4pl+kOi7/O/Ec2Y2TpN9zjpY5xZUvcGoIX749S4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npeak-00BPOu-DV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 23:21:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F9F3618F9;
 Fri, 13 May 2022 23:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04CFC34119;
 Fri, 13 May 2022 23:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652484056;
 bh=5M/AZsC8gJLP8HFVo/AGzWoR7VyDQEAa1r6XJg17fJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nBkGJ+jTPn1NfvTN0PGMha6IDJgbcGKh0m9rtJZ3KB71/1QIMddlyvbm2nTpQEKou
 YC9QgCZu75rOyw9JieGTFp9HE22DK5RnzOiEZp94UcwE+YrJKrYdvn1uUC7GKiYgAP
 sA+MOjPNUTM/F+q4vVip2idiw/v3t0XQ5Ge3ypoc7/TmSSNxwYPtj6KfGv3waAUPD7
 s5rF6utZjnHPVlyGOv5kwa2s8K8lUW+rSTq7Iqgp447Y5RmEyZeusYSHA/qSOlbzOI
 /nK+VAXo4yfE4Ouh4iY1z1IiWI0DPptR/ivziccPYM8+q6TbQSUevLTRHPxrgfbxBF
 rJN/TAG1ue4ZA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 13 May 2022 16:16:05 -0700
Message-Id: <20220513231605.175121-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513231605.175121-1-ebiggers@kernel.org>
References: <20220513231605.175121-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Now that all its
 callers have been converted to fscrypt_parse_test_dummy_encryption() and
 fscrypt_add_test_dummy_key()
 instead, fscrypt_set_test_dummy_encryption() can be removed. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1npeak-00BPOu-DV
Subject: [f2fs-dev] [PATCH v3 5/5] fscrypt: remove
 fscrypt_set_test_dummy_encryption()
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
Cc: Lukas Czerner <lczerner@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that all its callers have been converted to
fscrypt_parse_test_dummy_encryption() and fscrypt_add_test_dummy_key()
instead, fscrypt_set_test_dummy_encryption() can be removed.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/policy.c      | 13 -------------
 include/linux/fscrypt.h |  2 --
 2 files changed, 15 deletions(-)

diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 5f858cee1e3b0..d0a8921577def 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -802,19 +802,6 @@ bool fscrypt_dummy_policies_equal(const struct fscrypt_dummy_policy *p1,
 }
 EXPORT_SYMBOL_GPL(fscrypt_dummy_policies_equal);
 
-/* Deprecated, do not use */
-int fscrypt_set_test_dummy_encryption(struct super_block *sb, const char *arg,
-				      struct fscrypt_dummy_policy *dummy_policy)
-{
-	struct fs_parameter param = {
-		.type = fs_value_is_string,
-		.string = arg ? (char *)arg : "",
-	};
-	return fscrypt_parse_test_dummy_encryption(&param, dummy_policy) ?:
-		fscrypt_add_test_dummy_key(sb, dummy_policy);
-}
-EXPORT_SYMBOL_GPL(fscrypt_set_test_dummy_encryption);
-
 /**
  * fscrypt_show_test_dummy_encryption() - show '-o test_dummy_encryption'
  * @seq: the seq_file to print the option to
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 099b881e63e49..11db6d61d4244 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -284,8 +284,6 @@ int fscrypt_parse_test_dummy_encryption(const struct fs_parameter *param,
 				    struct fscrypt_dummy_policy *dummy_policy);
 bool fscrypt_dummy_policies_equal(const struct fscrypt_dummy_policy *p1,
 				  const struct fscrypt_dummy_policy *p2);
-int fscrypt_set_test_dummy_encryption(struct super_block *sb, const char *arg,
-				struct fscrypt_dummy_policy *dummy_policy);
 void fscrypt_show_test_dummy_encryption(struct seq_file *seq, char sep,
 					struct super_block *sb);
 static inline bool
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
