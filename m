Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B384A78BC4F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Aug 2023 03:06:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qanB3-0002Yl-Mu;
	Tue, 29 Aug 2023 01:05:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3aETtZAYKANM2GDH3C5DD5A3.1DB@flex--drosen.bounces.google.com>)
 id 1qanB0-0002Yf-2B for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 01:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k6mRBiksVGifum3DnY8GTTTS5uzGHn+HmLVAlplihqc=; b=ghnXCxDQq8ltHTPgkI4bijkx4a
 vZ5fCchAuWyMtOC74d/0lpK28N/fh7EVnh/xc3rB6zsCURq0EgGl6E2Pe9znMiZ41mCDPkMSusfzb
 Gyo6W8gwbfCLNkDaBp+lnnixQ/bfUBdoBs3hE/sY4UzK2D0WfVlp6FVi2R1XdmPg0oAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k6mRBiksVGifum3DnY8GTTTS5uzGHn+HmLVAlplihqc=; b=ZetzdHUtXv1hsjlCYx3WA5uR7c
 5d/IhY8FEsVGJFYVVOPjLKuukO3A212mGowjUlO2BkYWlMc9QWWTR3EQW9bWFdQmpl8GsfWhLVl7Z
 andF6nT597HyI76gQw97xy77OWDAiJ9HEbQTrOzuRlkCUfxA1vhc7vnncl2idz4ipvVI=;
Received: from mail-yw1-f201.google.com ([209.85.128.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qanB0-001Tkn-Ey for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 01:05:51 +0000
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-58e4d2b7d16so57587587b3.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Aug 2023 18:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693271145; x=1693875945;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=k6mRBiksVGifum3DnY8GTTTS5uzGHn+HmLVAlplihqc=;
 b=Bhc/rC/ddF9FLddck0fDesPBPVz9XEkEQsSWAhM5kKrHsStIHOw+bKT8Ssu+IuCpEn
 HXpD6tIMkdGWelK4tzlgxpaQNUa+kYtpLXVSBOPBC+xyqj8l+DKHLcsxJKM36Mu5dwIE
 Jv2G5BuFFLjxXPZMK0BH/64pfxYtwzVbfaXwRhQSDw2uTcADWApLw4SRWp2abwKLhStE
 WuAPzDsqSoWrsiJxbhS1iiCY/vCk6YintjGBXXEdlr/7UOoTcw+lC/qjwDNcnR0DO0vN
 JjHYZIoliZ20cVl0hQyUBLFz6+hBQ7NAMcm7zczp28O8T150iyZUYkvwXpESwy3CPs65
 eKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693271145; x=1693875945;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k6mRBiksVGifum3DnY8GTTTS5uzGHn+HmLVAlplihqc=;
 b=MeQOHUFj96ISmOZoSYtWSbT4jn+QfQ0TH5lAuX5RktpQxnMwPyfpdAu1bb0s5cTZR5
 QhvJPisAH7WJIwpVMRuNi/1kOjX8PVudywY8bk0YNdUuiEKChA3ts0A7yw0Q1QGyBG11
 t2Z+HiaWrCwJ3cExypkjc55Au99NjdxkdKxMkT1jfNfO8VrIch7/xI6j8dpTwYvmBATE
 Ebls1O4PT2KDxktYL8Kjs7XgQPpcwnjcQkh0sZX6JFcFVKiiesCSJcL8vgPUjkQKaMEw
 PTVlLH1to2Pc6438VnyfTyXBN2p9ZSWPxGxvXeo1O2msHtw0BDdpsvAyZQ3PusuNcxwa
 z3vg==
X-Gm-Message-State: AOJu0YxL8ytc5/cwKVuzjYmzPoBUM4Q494XadOC4AgLAOCiZGhe/GBju
 xow7WBLnBdcl5cDbeT6ARRQ7OPxg7UJtZxWh0VzR6swcUhWwSrrriq1QPqg82HM6j+BuT0QOGAY
 etU5OXJIyYL5Uz62UcwMiOKdED/HcmPVXg4D5f4QhhGRtuOrDhrPcLbXE8qYU25DfPmYtGAOsDM
 CBcfsHL3I=
X-Google-Smtp-Source: AGHT+IEugGqDohNAvkiTLfi3A2ZA8xQjZ45TOQuSB5vdCHI62vreDayiTuQUEUaFVG0Q0Hmkuw7w2nuRsyE=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:d11f:7395:bc0b:a192])
 (user=drosen job=sendgmr) by 2002:a81:af16:0:b0:57a:793:7fb0 with SMTP id
 n22-20020a81af16000000b0057a07937fb0mr861899ywh.3.1693271144788; Mon, 28 Aug
 2023 18:05:44 -0700 (PDT)
Date: Mon, 28 Aug 2023 18:05:31 -0700
In-Reply-To: <20230829010536.3044883-1-drosen@google.com>
Mime-Version: 1.0
References: <20230829010536.3044883-1-drosen@google.com>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230829010536.3044883-3-drosen@google.com>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.201 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qanB0-001Tkn-Ey
Subject: [f2fs-dev] [PATCH v3 2/7] f2fs-tools: Refactor Orphan Block struct
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
 fsck/fsck.c             |  4 ++--
 fsck/main.c             |  1 +
 include/f2fs_fs.h       | 23 ++++++++++++++++++++---
 mkfs/f2fs_format_main.c |  1 +
 4 files changed, 24 insertions(+), 5 deletions(-)

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
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index b2b84dd..3a4b18c 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -355,6 +355,7 @@ static void f2fs_parse_options(int argc, char *argv[])
 
 	if (c.zoned_mode)
 		c.feature |= F2FS_FEATURE_BLKZONED;
+	check_block_struct_sizes();
 }
 
 #ifdef HAVE_LIBBLKID
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
