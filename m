Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 253A153F22B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jun 2022 00:33:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyLIB-0002z5-Bq; Mon, 06 Jun 2022 22:33:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nyLI7-0002yz-Og
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jun 2022 22:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=izH+a4sO5oMqEl2hQu27DvQIXKCoHOMKMLmq0lgslfQ=; b=Q0y3JUcdJtY0WIk/VCxlI2KPQk
 gdWQrdi5Dm7mndOczk5K5fOD4CqoH7HaWaWXPf8klMu5A746Oz+iYWHgjpQ0wgKozBAt6UZR54Rzj
 Ii542rgrOM+MJ6IYuYsCwrcm84He7n7x0Ant8+HjgRCCc7X/vbS0wFZXjWFoe1Tg/I78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=izH+a4sO5oMqEl2hQu27DvQIXKCoHOMKMLmq0lgslfQ=; b=h
 t6H5sKZm1zvDNbqcnyNB/69BJvhVIQF7XS9bmRDQkPOEruuIMr/MI3CKyXIfB5KuhVbPzp3gH+tPl
 cDpEy+YPGXMIzJpCD1M9eajDyxGlrJW2VvO7yxbPaWuqD8fPJnBboO+jtJTw2BNggeh2qBsOV4Qxz
 jB3eM1wATFUk9L7s=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyLI7-007Tvz-Gz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jun 2022 22:33:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 69A0AB81C21
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Jun 2022 22:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9314C385A9;
 Mon,  6 Jun 2022 22:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654554815;
 bh=WcJjpRc7XzfSJON+fPuBoWVagfFjcoKPqQP19/5+bv8=;
 h=From:To:Cc:Subject:Date:From;
 b=NNiodLz/m6Zi8KxGG3tTKJSrlfBGdMozhDOIBYGnihFrBGavCwheeMQFPWfuih+dw
 mc77Rjl5Lgevb/VXycaaQk8srrnmnFl3PxcLiMJHCK02BoM+tbZvodVclp09RR9Yba
 leJ3Fx1JirygvSNsXJBMLBQuhBZrFq4/6N2QecdJ8PPL4ZQG4tWQstc8UCdh/aYJ5Q
 MXTN8LMzN9YOSKtOfYqXsCuz6WB6CJD47DW5FV5rEFSWKw74+bdrQWFaxP+DsXp2NL
 96HvspR+g3f/wQmr9ntQRWV3d9s/fEgkEgthf53MdAZQvzklmvYCNHGoSmjRTDVcKD
 SQGPK/Ch7FJBA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  6 Jun 2022 15:32:41 -0700
Message-Id: <20220606223241.12497-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Switch f2fs over
 to the functions that are replacing fscrypt_set_test_dummy_encryption(). Since
 f2fs hasn't been converted to the new mount API yet, this doesn't really
 provide a benefit for f2fs. But [...] 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nyLI7-007Tvz-Gz
Subject: [f2fs-dev] [PATCH RESEND v3] f2fs: use the updated
 test_dummy_encryption helper functions
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
Cc: linux-fscrypt@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Switch f2fs over to the functions that are replacing
fscrypt_set_test_dummy_encryption().  Since f2fs hasn't been converted
to the new mount API yet, this doesn't really provide a benefit for
f2fs.  But it allows fscrypt_set_test_dummy_encryption() to be removed.

Also take the opportunity to eliminate an #ifdef.

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---

Resending this since its prerequisites are upstream now.

 fs/f2fs/super.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 37221e94e5eff..3112fe92f9342 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/fs.h>
+#include <linux/fs_context.h>
 #include <linux/sched/mm.h>
 #include <linux/statfs.h>
 #include <linux/buffer_head.h>
@@ -492,9 +493,19 @@ static int f2fs_set_test_dummy_encryption(struct super_block *sb,
 					  bool is_remount)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-#ifdef CONFIG_FS_ENCRYPTION
+	struct fs_parameter param = {
+		.type = fs_value_is_string,
+		.string = arg->from ? arg->from : "",
+	};
+	struct fscrypt_dummy_policy *policy =
+		&F2FS_OPTION(sbi).dummy_enc_policy;
 	int err;
 
+	if (!IS_ENABLED(CONFIG_FS_ENCRYPTION)) {
+		f2fs_warn(sbi, "test_dummy_encryption option not supported");
+		return -EINVAL;
+	}
+
 	if (!f2fs_sb_has_encrypt(sbi)) {
 		f2fs_err(sbi, "Encrypt feature is off");
 		return -EINVAL;
@@ -506,12 +517,12 @@ static int f2fs_set_test_dummy_encryption(struct super_block *sb,
 	 * needed to allow it to be set or changed during remount.  We do allow
 	 * it to be specified during remount, but only if there is no change.
 	 */
-	if (is_remount && !F2FS_OPTION(sbi).dummy_enc_policy.policy) {
+	if (is_remount && !fscrypt_is_dummy_policy_set(policy)) {
 		f2fs_warn(sbi, "Can't set test_dummy_encryption on remount");
 		return -EINVAL;
 	}
-	err = fscrypt_set_test_dummy_encryption(
-		sb, arg->from, &F2FS_OPTION(sbi).dummy_enc_policy);
+
+	err = fscrypt_parse_test_dummy_encryption(&param, policy);
 	if (err) {
 		if (err == -EEXIST)
 			f2fs_warn(sbi,
@@ -524,12 +535,14 @@ static int f2fs_set_test_dummy_encryption(struct super_block *sb,
 				  opt, err);
 		return -EINVAL;
 	}
+	err = fscrypt_add_test_dummy_key(sb, policy);
+	if (err) {
+		f2fs_warn(sbi, "Error adding test dummy encryption key [%d]",
+			  err);
+		return err;
+	}
 	f2fs_warn(sbi, "Test dummy encryption mode enabled");
 	return 0;
-#else
-	f2fs_warn(sbi, "test_dummy_encryption option not supported");
-	return -EINVAL;
-#endif
 }
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
