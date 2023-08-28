Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DC478B284
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Aug 2023 16:04:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qacr6-0003gG-Fu;
	Mon, 28 Aug 2023 14:04:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qacr2-0003g9-OF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 14:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PgUOe7jlThSXOevv/q7GfcgMJW23C1btzunsJ7kUX7Y=; b=R3SAii8Y+yViqoFWfYNW8Ls3lJ
 CdUfeFhWYmfa+MzdtB7rlcBNLiGhGpnzOZ8Ep8zVy6Gi5An7e41MhWTi7+qOEbN/MP6TH8pBIXPO9
 x+Qa2zS4SQ6msqTVxfHiYY+KuI1oesLeVABeFMjUoNqil7WCJLs3k372VzHrA9PfjMz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PgUOe7jlThSXOevv/q7GfcgMJW23C1btzunsJ7kUX7Y=; b=jgihEl04Q3prz3gPUGrT647XzD
 dy//FqWSWaVaPGF1mkd2VYrNdhDXCdxqBxElOqHEYIrzXOg+PKClgRbJNMTbs7+ekYhAPxB0c8+6U
 RqFiEL/m2lEty42al+2hMAaaJzFvuurgJFhgjKDrrx+WaDv5bleZqJ4VI2TTQMuxIjxo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qacr3-000oNy-6l for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 14:04:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 93130648DD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Aug 2023 14:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC948C433C9;
 Mon, 28 Aug 2023 14:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693231467;
 bh=f4hmSgSOl/WVTXPEKDNSnKlH4/2yov+TX2iMMY7IA4Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b8Wj07gI/g/O9qcP2we66ARXQXmRJvil5y8pL7H2GiyLjJkKrTrxymWoYtvmDmYmj
 pLeNELmV1ffI0hnTVjVUEUKtPAZD4wk8W3I9KSrONeBecs6V7agzrZFfAoc2Mteup5
 iZ3haCpylhrAYFx1PRQsm1tmRDnrbwLNPeCRmhw45FQM4+w9vpkVXLjqxDd0o/2wmL
 cyzJLsVCYzYBtqKt5Yosphi2kDT0L3KywRQvB0Kwc9sjpWGN+Fr4gcbpJxtJ4ktbDT
 jAhzTks8y1Op6YMFpiRWXBXy4WePcllqP8zamU7D2x1kb5+HPKyc6D0FOk3asofH0l
 w7mhNGD+URr7w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 28 Aug 2023 22:04:17 +0800
Message-Id: <20230828140417.2951796-4-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230828140417.2951796-1-chao@kernel.org>
References: <20230828140417.2951796-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  With below script,
 redundant compress extension will be parsed
 and added by parse_options(), because parse_options() doesn't check whether
 the extension is existed or not,
 fix it. 1. mount -t f2fs -o compress_extension=so
 /dev/vdb /mnt/f2fs 2. mount -t f2fs -o remount, compress_extension=so /mnt/f2fs
 3. mount|grep f2fs 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qacr3-000oNy-6l
Subject: [f2fs-dev] [PATCH 4/4] f2fs: compress: fix to avoid redundant
 compress extension
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

With below script, redundant compress extension will be parsed and added
by parse_options(), because parse_options() doesn't check whether the
extension is existed or not, fix it.

1. mount -t f2fs -o compress_extension=so /dev/vdb /mnt/f2fs
2. mount -t f2fs -o remount,compress_extension=so /mnt/f2fs
3. mount|grep f2fs

/dev/vdb on /mnt/f2fs type f2fs (...,compress_extension=so,compress_extension=so,...)

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Fixes: 151b1982be5d ("f2fs: compress: add nocompress extensions support")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8d9d2ee7f3c7..68895be6407f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -547,6 +547,29 @@ static int f2fs_set_test_dummy_encryption(struct super_block *sb,
 }
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
+static bool is_compress_extension_exist(struct f2fs_sb_info *sbi,
+					const char *new_ext, bool is_ext)
+{
+	unsigned char (*ext)[F2FS_EXTENSION_LEN];
+	int ext_cnt;
+	int i;
+
+	if (is_ext) {
+		ext = F2FS_OPTION(sbi).extensions;
+		ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
+	} else {
+		ext = F2FS_OPTION(sbi).noextensions;
+		ext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
+	}
+
+	for (i = 0; i < ext_cnt; i++) {
+		if (!strcasecmp(new_ext, ext[i]))
+			return true;
+	}
+
+	return false;
+}
+
 /*
  * 1. The same extension name cannot not appear in both compress and non-compress extension
  * at the same time.
@@ -1149,6 +1172,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				return -EINVAL;
 			}
 
+			if (is_compress_extension_exist(sbi, name, true)) {
+				kfree(name);
+				break;
+			}
+
 			strcpy(ext[ext_cnt], name);
 			F2FS_OPTION(sbi).compress_ext_cnt++;
 			kfree(name);
@@ -1173,6 +1201,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				return -EINVAL;
 			}
 
+			if (is_compress_extension_exist(sbi, name, false)) {
+				kfree(name);
+				break;
+			}
+
 			strcpy(noext[noext_cnt], name);
 			F2FS_OPTION(sbi).nocompress_ext_cnt++;
 			kfree(name);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
