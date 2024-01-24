Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E7C83AC66
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jan 2024 15:49:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSeZV-0005ud-Sp;
	Wed, 24 Jan 2024 14:49:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rSeZU-0005uX-VI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jan 2024 14:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NoY7DJuDPHI8qgW/09FUP1Tb83vItnk4ZQjFt+IveVU=; b=l7UNOzClQyis2zOvdVVmvp+IH5
 Qs+uliqcYYEkCRh0f8133eDdeWGtSlpssTSPs/RT9170D6WhZd4fTt0TCUFxngMm/YOWwdLLQqTQi
 CMaUO9GWjb45onqOsU/KHUwDINjO/F61/KRgXy6nGyAzfp2auxe/9mLg96dQfVa4HdIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NoY7DJuDPHI8qgW/09FUP1Tb83vItnk4ZQjFt+IveVU=; b=S
 wU8j1L0A3hqs2ocl2Gh6Ii5EePHLG3O3k6mIgjjJogFe1HA1krtMpSTIWcrXXH3BMByQ+DlIh0gxA
 WTILf0LqhYGCzYTn/rq4giYtKysxg9QANtKazWQ5WlKSrH893i87hl9X1Oz7apkEy3//qOLL1CoL2
 7jZXJNhO3haSBDc8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rSeZS-0000Ic-O6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jan 2024 14:49:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 898C0CE2986;
 Wed, 24 Jan 2024 14:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CECC433F1;
 Wed, 24 Jan 2024 14:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706107762;
 bh=wrZ8xW7UkYZOxzyfUsSQ27WNRFcJn00rozogY+4egik=;
 h=From:To:Cc:Subject:Date:From;
 b=ozvxQbs2hx8v1XXKc82x4SIPBaYV5sJ9tivRFo+j0ZnsPepSLYgTsegf5CsWISwaH
 72hxLcJZY3gW53fvG3uazQX4L94WvwQMB48t1lY97P2UY0jSkjcult8KFVYj4BO9lD
 hThJx+SV6k4tUHQ5gVlWwW4fPdD7zAOH3dVFnp9pcsNRzoDJc82uckZjTXrAG+vQlp
 8LM+YoLrWTvVWMx/VyQxQJWc6ky02ALA4KpLwTUyK14jPsxiY3SMgJldTykRKgNT7I
 cV7Tejfm2iW4misVc6JL2LIYGe7VieiZKdUoQ1uhkMexHAPhdRjctwZH3kmj0l/k/p
 4JWNKj//oU7Ag==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 24 Jan 2024 22:49:15 +0800
Message-Id: <20240124144915.19445-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  During recovery, if FAULT_BLOCK is on, it is possible that
 f2fs_reserve_new_block() will return -ENOSPC during recovery, then it may
 trigger panic. Also, if fault injection rate is 1 and only FAULT_BLOCK fault
 type is on, it may encounter deadloop in loop of block reservation. 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rSeZS-0000Ic-O6
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid potential panic during
 recovery
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
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

During recovery, if FAULT_BLOCK is on, it is possible that
f2fs_reserve_new_block() will return -ENOSPC during recovery,
then it may trigger panic.

Also, if fault injection rate is 1 and only FAULT_BLOCK fault
type is on, it may encounter deadloop in loop of block reservation.

Let's change as below to fix these issues:
- remove bug_on() to avoid panic.
- limit the loop count of block reservation to avoid potential
deadloop.

Fixes: 956fa1ddc132 ("f2fs: fix to check return value of f2fs_reserve_new_block()")
Reported-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h     |  5 +++++
 fs/f2fs/recovery.c | 33 ++++++++++++++++-----------------
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a62c7e037456..5993b721e92c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -76,6 +76,11 @@ struct f2fs_fault_info {
 
 extern const char *f2fs_fault_name[FAULT_MAX];
 #define IS_FAULT_SET(fi, type) ((fi)->inject_type & BIT(type))
+
+/* maximum retry count for injected failure */
+#define DEFAULT_FAILURE_RETRY_COUNT		8
+#else
+#define DEFAULT_FAILURE_RETRY_COUNT		1
 #endif
 
 /*
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index d0f24ccbd1ac..aad1d1a9b3d6 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -611,6 +611,19 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 	return 0;
 }
 
+static int f2fs_reserve_new_block_retry(struct dnode_of_data *dn)
+{
+	int i, err = 0;
+
+	for (i = DEFAULT_FAILURE_RETRY_COUNT; i > 0; i--) {
+		err = f2fs_reserve_new_block(dn);
+		if (!err)
+			break;
+	}
+
+	return err;
+}
+
 static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 					struct page *page)
 {
@@ -712,14 +725,8 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		 */
 		if (dest == NEW_ADDR) {
 			f2fs_truncate_data_blocks_range(&dn, 1);
-			do {
-				err = f2fs_reserve_new_block(&dn);
-				if (err == -ENOSPC) {
-					f2fs_bug_on(sbi, 1);
-					break;
-				}
-			} while (err &&
-				IS_ENABLED(CONFIG_F2FS_FAULT_INJECTION));
+
+			err = f2fs_reserve_new_block_retry(&dn);
 			if (err)
 				goto err;
 			continue;
@@ -727,16 +734,8 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 
 		/* dest is valid block, try to recover from src to dest */
 		if (f2fs_is_valid_blkaddr(sbi, dest, META_POR)) {
-
 			if (src == NULL_ADDR) {
-				do {
-					err = f2fs_reserve_new_block(&dn);
-					if (err == -ENOSPC) {
-						f2fs_bug_on(sbi, 1);
-						break;
-					}
-				} while (err &&
-					IS_ENABLED(CONFIG_F2FS_FAULT_INJECTION));
+				err = f2fs_reserve_new_block_retry(&dn);
 				if (err)
 					goto err;
 			}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
