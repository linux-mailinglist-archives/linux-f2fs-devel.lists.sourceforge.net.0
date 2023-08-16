Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2780577D7D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Aug 2023 03:46:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qW5cc-00085e-T1;
	Wed, 16 Aug 2023 01:46:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <36SLcZAYKAMwv96Aw5y66y3w.u64@flex--drosen.bounces.google.com>)
 id 1qW5cb-00085Y-8T for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 01:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L4D7lyseRfeNGNPXt8iGTjc32JT/WjMSoEi0kpw6uDw=; b=i7QFa+C3qsgs/VoONjJ6TK7Lkp
 MPjGHkb0ICsAsrA9aOrA/3ZT9SJyHmFcMYugld9+EioXhKFCCJqxz5MNL3V6OtlDGFaO6HWz1ViVN
 QUSYuN549HoWpYpk2EE8FqjPNAvhqe0hF9Wu+XuDzhQjoAhnGtN6OdQUE4lohF305rMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L4D7lyseRfeNGNPXt8iGTjc32JT/WjMSoEi0kpw6uDw=; b=Rp88hcMkBJ7xoM4dCBK8Ov8Myx
 RrTiUBVXyZQw6pLIuEB/+Yx8wE8s4ZmQL5ylkV7T1Ufhaovv1sZG/myKPWZ+mmDHQp++DbrIIIfk7
 zlCTLP/Tr+WPaU4+1sY4HZVF4Q35ETKE+gAXv4itqMaMcUq+hSIxpL544T3WQPgpcdJ8=;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qW5cZ-006iI7-H5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 01:46:53 +0000
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-26b639eb9d9so3439319a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Aug 2023 18:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692150406; x=1692755206;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=L4D7lyseRfeNGNPXt8iGTjc32JT/WjMSoEi0kpw6uDw=;
 b=Nz55VNXyBQbxF6L9Ri+eZa/Kq3eAdPcW3xDU8KnzSm3U/2QzJeXSqFqrvmDE3/DUnT
 BF156BpO5F/bCV8a8UoKLaaLQUuf3QKUG5XhZFhbbHQbu61iDvYgWDg8r7eswIvoJOnM
 ssW05SjwOBMiyhRAKnMfXg+VLU3ryMoeJsnuVvSi01TdwzbVajOYKg4AxrQ952Lm8TOk
 sKCi6skKP1gF1hzCr0v9BQCz80IHLenaSbAhqwLL/WOHottLznCjuG59c7FACDWI0ej/
 9ILE7tGMCaiHcqjGenhjrag2r8kJE7NNxQy65Q9nhXUlDKvzs9DQWlGpI7SfhJOUKAR3
 wDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692150406; x=1692755206;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L4D7lyseRfeNGNPXt8iGTjc32JT/WjMSoEi0kpw6uDw=;
 b=D5/wpl8MQHAqS/KNIEJnm3dNVmg5+tXnbXcJsz9QKH9uIAz7IR7V1j4mTMBjlhiwIH
 2J6NOX+hjdo7yZmxGONQ8uFanRHn6PzrmjoIyE3GNOc+SCrg5GiQ8jn67vNg6HrsYBhq
 jADq2omAKD1cZH8KzCaV+agzqId8hi+1rLRNJSM+sEGeI1o049kMdn6ppDEQhi0ZKlKn
 j7bviWsBllLhCIqFfroSNUBwXjKo7geYqnklYEJdhPYCwu8bVP3psRzn7+A617kjm153
 wnfOUfFGCMTcdCWr3rZbJ3Ei8rkufxX+luveRcuE7h98w520C4F4AQi7GKvDaOrLRhaJ
 jTdg==
X-Gm-Message-State: AOJu0Ywtc9n69BAfv6htDWUwypYY1z+euCu8Q7fwzef+ZF2DrZAz1vYv
 yId7mcMbcu8ES0p9wfV9aZcsHnRNnYFmTm1LI7W2bvfHXsfZdvjnNHbmeYQzbRmkS11XJfBcUbf
 rh/0dSfzfA+6NdIf8rn2odaosN3XvCxXguq+r20jKz2LVMjkOV2TQREgpABX7Sn71p/DZ1UE5Yt
 hzFIkf/wE=
X-Google-Smtp-Source: AGHT+IHPKq4dxMpmFe1RHPEYqfZigCi4wfShOxZoTQXA5+b0ZOtDJl6Wc3Sm7OkPs2vHyantx3U8v3JOCkg=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:19fa:33cd:f272:37ec])
 (user=drosen job=sendgmr) by 2002:a25:748e:0:b0:d6b:7397:a16f with SMTP id
 p136-20020a25748e000000b00d6b7397a16fmr7184ybc.1.1692148457722; Tue, 15 Aug
 2023 18:14:17 -0700 (PDT)
Date: Tue, 15 Aug 2023 18:13:54 -0700
In-Reply-To: <20230816011359.1964484-1-drosen@google.com>
Mime-Version: 1.0
References: <20230816011359.1964484-1-drosen@google.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230816011359.1964484-3-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.73 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.73 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qW5cZ-006iI7-H5
Subject: [f2fs-dev] [PATCH 2/7] f2fs-tools: Refactor Orphan Block struct
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
2.41.0.694.ge786442a9b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
