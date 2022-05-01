Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B26E95161F5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 May 2022 07:13:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nl1tJ-0001cL-WF; Sun, 01 May 2022 05:13:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nl1tF-0001bh-CF
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 May 2022 05:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5CoeRvUMcu+Dj7auxcqJCgwRNM3BnLFMHC8re5GrgdQ=; b=g91CIJvABoal2YeaTXR8wpTMNr
 TCGc2u9Ixhi6pq64WcBmWsN/ZQLlxy5KGvBpwTxaXW+wIhZC/IBLb2q0+BfqAmMDpd3WFrVunF2NM
 byZ4D1seKB2wsodF954OkHtX99hyQtSc6e7u7VLt2r46vrlYnPK+pxJMvs1AarWqoJuk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5CoeRvUMcu+Dj7auxcqJCgwRNM3BnLFMHC8re5GrgdQ=; b=byB9WmDea0useG2a9qGmdBMPbC
 LWfEaEKe0IU1q1IiY08JkwDyVu+PwWA+31MhLNkkWuShx8qs7+vJ6UoM0beNgFK9hPb9BjmfpH6nR
 eToGLcj5eNDeU2a2nCLz3m7UOyzHVY45l4D+pda1GQ4RevC+cSv27Kk4iKtAHsriyLqo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nl1tD-00FPch-9D
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 May 2022 05:13:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6FE99611B0;
 Sun,  1 May 2022 05:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DC8C385B5;
 Sun,  1 May 2022 05:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651381967;
 bh=lZT1gByo3Y9Ub5T0TA1IR1XBzyPH8WZkJ9F8N3p3es0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T1+iweG7jBy7ELy5r7MYHZHjHcu7ab9qUVX9z9mtOopxiYXR3GmtbIVHrvfIq0eIG
 7PUhfBXIP7yVu5kYBw+5KGjR8vunqyY5dBv9I5zbDqqXj5vR5fD73Fvzhe/DmCweL+
 hIDnU0LhqOzYEcD4HGGLbF04ArCT6/dF2S5HXYOnnKv4OHPE4T3UxKUUCudovpcqQX
 Pr6d8ah7kthYGLA3m18muKEZv3nOOZ8lo1tg78FTiZWkRAC6xvBzXpIUP0VHU9yTRF
 36AIHnGOB0/DP2Qxwk9hYgm0lsUXf87CYWnKEukWlweCR0i1deBNzR6/UHH+wX6ak/
 IJtWAQr466irQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 30 Apr 2022 22:08:53 -0700
Message-Id: <20220501050857.538984-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220501050857.538984-1-ebiggers@kernel.org>
References: <20220501050857.538984-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Factor out a
 function
 that builds the fscrypt_key_specifier for an fscrypt_policy. Before this
 was only needed when finding the key for a file, but now it will also be needed
 for test_dummy_encryption [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nl1tD-00FPch-9D
Subject: [f2fs-dev] [PATCH v2 3/7] fscrypt: factor out
 fscrypt_policy_to_key_spec()
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
Cc: Jeff Layton <jlayton@kernel.org>, Lukas Czerner <lczerner@redhat.com>,
 Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Factor out a function that builds the fscrypt_key_specifier for an
fscrypt_policy.  Before this was only needed when finding the key for a
file, but now it will also be needed for test_dummy_encryption support.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h |  2 ++
 fs/crypto/keysetup.c        | 20 +++-----------------
 fs/crypto/policy.c          | 20 ++++++++++++++++++++
 3 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 5b0a9e6478b5d..f32d0ee91e70e 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -621,6 +621,8 @@ int fscrypt_setup_v1_file_key_via_subscribed_keyrings(struct fscrypt_info *ci);
 
 bool fscrypt_policies_equal(const union fscrypt_policy *policy1,
 			    const union fscrypt_policy *policy2);
+int fscrypt_policy_to_key_spec(const union fscrypt_policy *policy,
+			       struct fscrypt_key_specifier *key_spec);
 bool fscrypt_supported_policy(const union fscrypt_policy *policy_u,
 			      const struct inode *inode);
 int fscrypt_policy_from_context(union fscrypt_policy *policy_u,
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index eede186b04ce3..571d220d6e226 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -425,23 +425,9 @@ static int setup_file_encryption_key(struct fscrypt_info *ci,
 	if (err)
 		return err;
 
-	switch (ci->ci_policy.version) {
-	case FSCRYPT_POLICY_V1:
-		mk_spec.type = FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR;
-		memcpy(mk_spec.u.descriptor,
-		       ci->ci_policy.v1.master_key_descriptor,
-		       FSCRYPT_KEY_DESCRIPTOR_SIZE);
-		break;
-	case FSCRYPT_POLICY_V2:
-		mk_spec.type = FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER;
-		memcpy(mk_spec.u.identifier,
-		       ci->ci_policy.v2.master_key_identifier,
-		       FSCRYPT_KEY_IDENTIFIER_SIZE);
-		break;
-	default:
-		WARN_ON(1);
-		return -EINVAL;
-	}
+	err = fscrypt_policy_to_key_spec(&ci->ci_policy, &mk_spec);
+	if (err)
+		return err;
 
 	key = fscrypt_find_master_key(ci->ci_inode->i_sb, &mk_spec);
 	if (IS_ERR(key)) {
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index ed3d623724cdd..2a11276913a98 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -32,6 +32,26 @@ bool fscrypt_policies_equal(const union fscrypt_policy *policy1,
 	return !memcmp(policy1, policy2, fscrypt_policy_size(policy1));
 }
 
+int fscrypt_policy_to_key_spec(const union fscrypt_policy *policy,
+			       struct fscrypt_key_specifier *key_spec)
+{
+	switch (policy->version) {
+	case FSCRYPT_POLICY_V1:
+		key_spec->type = FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR;
+		memcpy(key_spec->u.descriptor, policy->v1.master_key_descriptor,
+		       FSCRYPT_KEY_DESCRIPTOR_SIZE);
+		return 0;
+	case FSCRYPT_POLICY_V2:
+		key_spec->type = FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER;
+		memcpy(key_spec->u.identifier, policy->v2.master_key_identifier,
+		       FSCRYPT_KEY_IDENTIFIER_SIZE);
+		return 0;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+}
+
 static const union fscrypt_policy *
 fscrypt_get_dummy_policy(struct super_block *sb)
 {
-- 
2.36.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
