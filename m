Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B617B1FCD38
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 14:23:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlX6B-0008Og-GM; Wed, 17 Jun 2020 12:23:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1jlX6A-0008OZ-Ij
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 12:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k9vmYhSqrLe98zAalhmL1pWPeeHC8WRLETpp+m+bXHk=; b=d6FgrZuKmUd7udjQrBETYJNLD1
 XTPNWkRVLGNeImH+kcITraVFAAEozObbxvEM5/bDe/MbA85nO4ccOWnlcPcs8muKB0W1QzTjmR0eJ
 Z6HZYZ/PGaQMYxKLX5S0vAoPX5TS3rfXuxXLDYcjgBzC7Z0GadCPMUe4WcgOd8C2R+l4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=k9vmYhSqrLe98zAalhmL1pWPeeHC8WRLETpp+m+bXHk=; b=K
 00Bqebnu7XKy4Hc8elJ/rZceiutTzTKpn85aZmoEVbxbw4+8pokKZ3fvNbRov7ck2Y0wEFib3YYTR
 uQ9amX5AjruwGILB+kMeylsnmcZr73+T1N4zw3EgrEshXsXQorc6zvi7GSSD3GaKxwUDFre1OrKKg
 cmwFWj35TW7WPKAc=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlX66-006N2x-LE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 12:23:22 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C4AC25D8AB68C9856E66
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2020 20:23:10 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Wed, 17 Jun 2020
 20:23:07 +0800
From: Wang Xiaojun <wangxiaojun11@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 17 Jun 2020 20:30:12 +0800
Message-ID: <20200617123012.90643-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jlX66-006N2x-LE
Subject: [f2fs-dev] [PATCH] f2fs: use kfree() to free variables allocated by
 match_strdup()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use kfree() instead of kvfree() to free variables allocated
by match_strdup(). Because the memory is allocated with kmalloc
inside match_strdup().

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
---
 fs/f2fs/super.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 20e56b0fa46a..6298d4cf3112 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -348,7 +348,7 @@ static int f2fs_set_qf_name(struct super_block *sb, int qtype,
 	set_opt(sbi, QUOTA);
 	return 0;
 errout:
-	kvfree(qname);
+	kfree(qname);
 	return ret;
 }
 
@@ -360,7 +360,7 @@ static int f2fs_clear_qf_name(struct super_block *sb, int qtype)
 		f2fs_err(sbi, "Cannot change journaled quota options when quota turned on");
 		return -EINVAL;
 	}
-	kvfree(F2FS_OPTION(sbi).s_qf_names[qtype]);
+	kfree(F2FS_OPTION(sbi).s_qf_names[qtype]);
 	F2FS_OPTION(sbi).s_qf_names[qtype] = NULL;
 	return 0;
 }
@@ -494,10 +494,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			} else if (!strcmp(name, "sync")) {
 				F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_SYNC;
 			} else {
-				kvfree(name);
+				kfree(name);
 				return -EINVAL;
 			}
-			kvfree(name);
+			kfree(name);
 			break;
 		case Opt_disable_roll_forward:
 			set_opt(sbi, DISABLE_ROLL_FORWARD);
@@ -654,17 +654,17 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			if (!strcmp(name, "adaptive")) {
 				if (f2fs_sb_has_blkzoned(sbi)) {
 					f2fs_warn(sbi, "adaptive mode is not allowed with zoned block device feature");
-					kvfree(name);
+					kfree(name);
 					return -EINVAL;
 				}
 				F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
 			} else if (!strcmp(name, "lfs")) {
 				F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
 			} else {
-				kvfree(name);
+				kfree(name);
 				return -EINVAL;
 			}
-			kvfree(name);
+			kfree(name);
 			break;
 		case Opt_io_size_bits:
 			if (args->from && match_int(args, &arg))
@@ -790,10 +790,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			} else if (!strcmp(name, "fs-based")) {
 				F2FS_OPTION(sbi).whint_mode = WHINT_MODE_FS;
 			} else {
-				kvfree(name);
+				kfree(name);
 				return -EINVAL;
 			}
-			kvfree(name);
+			kfree(name);
 			break;
 		case Opt_alloc:
 			name = match_strdup(&args[0]);
@@ -805,10 +805,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			} else if (!strcmp(name, "reuse")) {
 				F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;
 			} else {
-				kvfree(name);
+				kfree(name);
 				return -EINVAL;
 			}
-			kvfree(name);
+			kfree(name);
 			break;
 		case Opt_fsync:
 			name = match_strdup(&args[0]);
@@ -822,10 +822,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				F2FS_OPTION(sbi).fsync_mode =
 							FSYNC_MODE_NOBARRIER;
 			} else {
-				kvfree(name);
+				kfree(name);
 				return -EINVAL;
 			}
-			kvfree(name);
+			kfree(name);
 			break;
 		case Opt_test_dummy_encryption:
 			ret = f2fs_set_test_dummy_encryption(sb, p, &args[0],
@@ -1250,7 +1250,7 @@ static void f2fs_put_super(struct super_block *sb)
 	mempool_destroy(sbi->write_io_dummy);
 #ifdef CONFIG_QUOTA
 	for (i = 0; i < MAXQUOTAS; i++)
-		kvfree(F2FS_OPTION(sbi).s_qf_names[i]);
+		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
 #endif
 	fscrypt_free_dummy_context(&F2FS_OPTION(sbi).dummy_enc_ctx);
 	destroy_percpu_info(sbi);
@@ -1754,7 +1754,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 				GFP_KERNEL);
 			if (!org_mount_opt.s_qf_names[i]) {
 				for (j = 0; j < i; j++)
-					kvfree(org_mount_opt.s_qf_names[j]);
+					kfree(org_mount_opt.s_qf_names[j]);
 				return -ENOMEM;
 			}
 		} else {
@@ -1879,7 +1879,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 #ifdef CONFIG_QUOTA
 	/* Release old quota file names */
 	for (i = 0; i < MAXQUOTAS; i++)
-		kvfree(org_mount_opt.s_qf_names[i]);
+		kfree(org_mount_opt.s_qf_names[i]);
 #endif
 	/* Update the POSIXACL Flag */
 	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
@@ -1900,7 +1900,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 #ifdef CONFIG_QUOTA
 	F2FS_OPTION(sbi).s_jquota_fmt = org_mount_opt.s_jquota_fmt;
 	for (i = 0; i < MAXQUOTAS; i++) {
-		kvfree(F2FS_OPTION(sbi).s_qf_names[i]);
+		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
 		F2FS_OPTION(sbi).s_qf_names[i] = org_mount_opt.s_qf_names[i];
 	}
 #endif
@@ -3811,7 +3811,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 free_options:
 #ifdef CONFIG_QUOTA
 	for (i = 0; i < MAXQUOTAS; i++)
-		kvfree(F2FS_OPTION(sbi).s_qf_names[i]);
+		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
 #endif
 	fscrypt_free_dummy_context(&F2FS_OPTION(sbi).dummy_enc_ctx);
 	kvfree(options);
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
