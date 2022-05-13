Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 692DC526D71
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 May 2022 01:21:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npear-0004cm-2e; Fri, 13 May 2022 23:21:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1npeap-0004ce-Bn
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 23:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ti7ys2/KIN7QituyZTCJAR8ZFFHnqZcJdqyMYwyLacU=; b=OcJtwpmCmTlpMh6TI0v7W/KCLD
 jVu6v1kiWZsbPOgfLZUH8cB5uEFfxOVaxaRx8zAwR4oJMo+gsrnCF3tLCXLPp6Ptem/G96Mix6hNl
 6UQRn0R3PC0Ygx77CoRrm5zLncASFAmRSaDzAflHncdLq4KFImz94Y7hrCjKHbyNds70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ti7ys2/KIN7QituyZTCJAR8ZFFHnqZcJdqyMYwyLacU=; b=ZrYNlB4QNsdsIxSZS177aqft3h
 bUrtgVVRwLdHsg+jwfK5z6iNUHc4ktboquqiU/bL+UTuGWmQNBHaUVakhQgIBE92lhGWNQiLQiZ+I
 1jwFwYrlVPSVI3f4X/1sAUUE0+flpfSIdM3G27SE3Zycs8lsQhBLxDMqcq2wsLoGnwn0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npeao-0005Jk-3D
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 23:21:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5C17618CF;
 Fri, 13 May 2022 23:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE84C3411A;
 Fri, 13 May 2022 23:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652484056;
 bh=EyKf7j3uVG38CtsPiz6Z+ffuEuCxBF8XO/5PoI3A4wQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZCPSywhblhgVP6TmsJZp1U4aRoeTYn1inyFmM03kvIOUL1+oia5WIehjVD7w+17G7
 7N/CaV9RdU77hxa3zxAjE57nFmSamo1D++PyK/q6wcCUzTqjP8FzyJOf8z8HGsP6OJ
 dRqSgyvi0oG7gbazaWUhBX+lPEq+IUtI31SdULjzMFY9JASqYSSsW0A+1QYv0rggxY
 Edpcvjx7i8T1iijOjnJ9EQjYx9ImcaqYrqcIyaxIlg9GN7cvM4IUKtErYLNcWVRK4u
 7xMVGo1PgDSd/VsZZLNohHfNfoN015UHofCBfnlauxGnib0Qhnajj8wZFsVgmhSuWy
 IoS49W75XC4EA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 13 May 2022 16:16:04 -0700
Message-Id: <20220513231605.175121-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513231605.175121-1-ebiggers@kernel.org>
References: <20220513231605.175121-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Switch f2fs over
 to the functions that are replacing fscrypt_set_test_dummy_encryption(). Since
 f2fs hasn't been converted to the new mount API yet, this doesn't really
 provide a benefit for f2fs. But [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npeao-0005Jk-3D
Subject: [f2fs-dev] [PATCH v3 4/5] f2fs: use the updated
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
Cc: Lukas Czerner <lczerner@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Switch f2fs over to the functions that are replacing
fscrypt_set_test_dummy_encryption().  Since f2fs hasn't been converted
to the new mount API yet, this doesn't really provide a benefit for
f2fs.  But it allows fscrypt_set_test_dummy_encryption() to be removed.

Also take the opportunity to eliminate an #ifdef.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/super.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6f69491aa5731..c08cbe0dfcd85 100644
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
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
