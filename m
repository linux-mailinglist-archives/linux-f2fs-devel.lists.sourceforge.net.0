Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C93347891CE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Aug 2023 00:44:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZfXR-0001JL-HY;
	Fri, 25 Aug 2023 22:44:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3vC7pZAYKAOsQebfRaTbbTYR.PbZ@flex--drosen.bounces.google.com>)
 id 1qZfXP-0001JE-8I for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ShRdC5A3bR6rHaA/6FNIrg6nwVFYVodqV+8HYnCddrk=; b=Wg1+e2FrA9dk6XZr1Xlqej+nQJ
 40EB0Q4XkDIz5eSEJUYsVBo8aqxLS4lQSOtDCf33vpf+/miqNZgq8ajc+4XTBI39Pbkc+RbWKdSh7
 uyiabPW0PlAO2NesqQklJhFnmkGxpeX9g2Er6lsx4QnMMBAYP4GRrE4t70G1wUFf2p9M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ShRdC5A3bR6rHaA/6FNIrg6nwVFYVodqV+8HYnCddrk=; b=eqUg6Qv2UWuhHnZ7t3gUAoA0rB
 rdYKR+LLY24lgCu992nTnN24TyyEIRFLFBN+TXcxRJR55OFvqA/kcAQc+NZbmZC6wLKM34o33+zbp
 RnSR5+040qYbEYCUGmBgfOcBoPst5uiMfkH/RMdEqw5pqY8BRScnUwI3f3V4fgHOTstw=;
Received: from mail-yw1-f202.google.com ([209.85.128.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZfXO-00FcAZ-Gb for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:44:19 +0000
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-58daaa2ba65so21394227b3.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 15:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693003453; x=1693608253;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ShRdC5A3bR6rHaA/6FNIrg6nwVFYVodqV+8HYnCddrk=;
 b=Pyog3vC5V1PzggN1LxO/3FcIqbaNtRet4b5lZ9a9REHC+h8AGuwulZMUcwmRYqXGFR
 7M7PZ4Ewk1dKsbL/Hq+dgusMkmnNvVU6xyWefnwVgrBSt8hK2yKbgPPY0pGA4HDdzF9v
 cp9X9LIzW2pGI6ybyIbZBEXXWuFkscCZ+RMLqWwGComD2rGzMeZ9Lc8xo7yYRlwFJllF
 9VIF7y/bz5pJJIauDdnLOydl4o2udnwojd61uapcsYuAU4/MI26dTcBiKkAbqy59IZMY
 5Sf2XG4k8G+r9AO/r3phZAl8a3A9EqSEd1ScTJyIjpImpbyf89vYRzZGm0gRnCmmuAdv
 9fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693003453; x=1693608253;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ShRdC5A3bR6rHaA/6FNIrg6nwVFYVodqV+8HYnCddrk=;
 b=dDHTgipqWPWbZYL1FpREizHNZ+NtlZ+iNQgEeH/8nJhGyEEBnGDSdYoEeCmOI81CO9
 z26qrdJAVKMtacJQ6/ZRRrTgl1BnZ//ACI8MXFfyRfg2wdw/GbtwEjtYGIyo725yiDN6
 jQXes8XEwC4ze1WYVBQ5IJ/w5b+rThuxnhOmZgKipuSDNYb/T0eqNniYtJw6Jla9aaX+
 WPYlYRQI1iHomINcSJz83oQNbv9IuQAWCDW2DTzVn7pDr8BDRnLg66dsKIkqNuyW0uaL
 nQ7P2CX1yNIEUWRY9axhVyzew53RmBkoaOPMe3zlK9WHq9QK9GusXkBABXnChvrsyXYS
 /m3Q==
X-Gm-Message-State: AOJu0Yw/sDXNOLvSAyQCMdhGWYdW4GEQ9RMoHvGafkEZdHUA3Yq8vo2n
 fx28D90N0KqS+WAUKP6EA3kl8hC1DQwFzx4/ZNWbFsPr8nIJGl1Neq5e0ihyN1uczX82HwnKNC+
 nX+MYCArWS84CO7q9LDzhPVP498Y3epbyAX/hl4EkicTUGHEcJtCrzDbuX0TM6CZbc+mOVJCGkB
 WrluSsn1s=
X-Google-Smtp-Source: AGHT+IFooFidhbnje531JHymQoG9BjF/o2BTWliLr+g5ir9pEEiDlSBIfnMiHgbMvFLKKB/YykfhY981Db4=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:ad1d:adc4:c021:b463])
 (user=drosen job=sendgmr) by 2002:a25:d2c4:0:b0:d47:5cc3:9917 with SMTP id
 j187-20020a25d2c4000000b00d475cc39917mr554577ybg.9.1693003452798; Fri, 25 Aug
 2023 15:44:12 -0700 (PDT)
Date: Fri, 25 Aug 2023 15:43:55 -0700
In-Reply-To: <20230825224400.2206278-1-drosen@google.com>
Mime-Version: 1.0
References: <20230825224400.2206278-1-drosen@google.com>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230825224400.2206278-3-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This splits off access to the orphan block's footer into a
 macro call as its location is dependent on block size. Because of this, you
 should use F2FS_BLKSIZE instead of sizeof(struct f2fs_orphan_bloc [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.202 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.202 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qZfXO-00FcAZ-Gb
Subject: [f2fs-dev] [PATCH v2 2/7] f2fs-tools: Refactor Orphan Block struct
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This splits off access to the orphan block's footer into a macro call
as its location is dependent on block size. Because of this, you should
use F2FS_BLKSIZE instead of sizeof(struct f2fs_orphan_block)

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fsck/fsck.c       |  4 ++--
 fsck/main.c       |  1 +
 include/f2fs_fs.h | 23 ++++++++++++++++++++---
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 78ffdb6..e0dce16 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2058,7 +2058,7 @@ int fsck_chk_orphan_node(struct f2fs_sb_info *sbi)
 		u32 new_entry_count = 0;
 
 		ASSERT(ret >= 0);
-		entry_count = le32_to_cpu(orphan_blk->entry_count);
+		entry_count = le32_to_cpu(F2FS_ORPHAN_BLOCK_FOOTER(orphan_blk)->entry_count);
 
 		for (j = 0; j < entry_count; j++) {
 			nid_t ino = le32_to_cpu(orphan_blk->ino[j]);
@@ -2094,7 +2094,7 @@ int fsck_chk_orphan_node(struct f2fs_sb_info *sbi)
 		}
 		if (f2fs_dev_is_writable() && c.fix_on &&
 				entry_count != new_entry_count) {
-			new_blk->entry_count = cpu_to_le32(new_entry_count);
+			F2FS_ORPHAN_BLOCK_FOOTER(new_blk)->entry_count = cpu_to_le32(new_entry_count);
 			ret = dev_write_block(new_blk, start_blk + i);
 			ASSERT(ret >= 0);
 		}
diff --git a/fsck/main.c b/fsck/main.c
index 3690c74..15e2e4e 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -803,6 +803,7 @@ void f2fs_parse_options(int argc, char *argv[])
 			return;
 	}
 
+	check_block_struct_sizes();
 	/* print out error */
 	switch (err) {
 	case EWRONG_OPT:
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 6975143..c5b1e26 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -21,6 +21,7 @@
 #define __SANE_USERSPACE_TYPES__       /* For PPC64, to get LL64 types */
 #endif
 
+#include <assert.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <sys/stat.h>
@@ -855,8 +856,19 @@ static_assert(sizeof(struct f2fs_checkpoint) == 192, "");
  */
 #define F2FS_ORPHANS_PER_BLOCK	((F2FS_BLKSIZE - 4 * sizeof(__le32)) / sizeof(__le32))
 
+/*
+ * On disk layout is:
+ * __le32 ino[F2FS_ORPHANS_PER_BLOCK];
+ * struct f2fs_ophan_block_footer
+ *
+ * Do NOT use sizeof, use F2FS_BLKSIZE instead
+ */
 struct f2fs_orphan_block {
-	__le32 ino[F2FS_ORPHANS_PER_BLOCK];	/* inode numbers */
+	__le32 ino[0];	/* F2FS_ORPHANS_PER_BLOCK inode numbers */
+};
+#define F2FS_ORPHAN_BLOCK_FOOTER(blk) ((struct orphan_block_footer *)&(blk)->ino[F2FS_ORPHANS_PER_BLOCK])
+
+struct orphan_block_footer {
 	__le32 reserved;	/* reserved */
 	__le16 blk_addr;	/* block index in current CP */
 	__le16 blk_count;	/* Number of orphan inode blocks in CP */
@@ -864,8 +876,6 @@ struct f2fs_orphan_block {
 	__le32 check_sum;	/* CRC32 for orphan inode block */
 };
 
-static_assert(sizeof(struct f2fs_orphan_block) == F2FS_BLKSIZE, "");
-
 /*
  * For NODE structure
  */
@@ -1956,4 +1966,11 @@ extern char *f2fs_encoding2str(const int encoding);
 extern int f2fs_get_encoding_flags(int encoding);
 extern int f2fs_str2encoding_flags(char **param, __u16 *flags);
 
+static inline void check_block_struct_sizes(void)
+{
+	/* Check Orphan Block Size */
+	assert(F2FS_ORPHANS_PER_BLOCK * sizeof(__le32)
+			+ sizeof(struct orphan_block_footer) == F2FS_BLKSIZE);
+}
+
 #endif	/*__F2FS_FS_H */
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
