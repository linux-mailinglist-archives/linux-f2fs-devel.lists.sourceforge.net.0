Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2C772D050
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 22:16:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8nxy-0000ar-Uf;
	Mon, 12 Jun 2023 20:16:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q8nxu-0000aY-OS
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 20:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ug1VxCEmHAqGISqkhoUB4D6Ip4k3KyuFNIlhKVmS6bk=; b=hcDt9PsCv2wH8nLAmoNX1z19nK
 wCp79vpumcFksGKfOJG4FHP3+jW2Lh+WZ6wEguZ4uJFiwDwYgrBWL0LZkG+rpdi+79oErZ1G0j2Lx
 HicKPhHvQ3ifBN39r0PMVGHUz8PgN1Udc+WcYFJ4i3/McgTxc7DR5RaN5hRMMxQ4wrWo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ug1VxCEmHAqGISqkhoUB4D6Ip4k3KyuFNIlhKVmS6bk=; b=N
 PcJNG3wb+NoUwSTIZcnuKYs0quK+HqDhWLJ+lfZLmObkAkE1hOJnv7joYVM1srF429RhAUXAxfJdb
 jAA4TDh63h2j++7j0KbI+vfSINHq56Lk/nGoLQJzu1qmVD6cWSPVzsqBFhTKIllvw/qIW8R5DFrHS
 kHztdYI4lPQJfOno=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8nxs-0012Ba-Tf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 20:16:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B188D62946
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jun 2023 20:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A04C433EF;
 Mon, 12 Jun 2023 20:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686600990;
 bh=IFNcl3Qr1j61HWEFzbLwNkndMDHFIaUy4E04xrmndB0=;
 h=From:To:Cc:Subject:Date:From;
 b=IsYOGsxQ+G+xE05S99c1FUqdnyA5A0r8/EhbCRuw0sMxfM3FubILmfAFyp76cq/P7
 zptzsxHFMYtBoVTdMsHEzTlfx5nOMGpzYDZcOMVuSxFFO5qlaafRO4cvD+Ur51UHCo
 LMWALzfw00GkhIrmQLLs1p5fPwVgIX3+bTK4aDMtLrHrv6YubXRfuZkdHHVs8cqYhn
 mkyexby7SIRqonCAREHNet3KtO304KOyHvkgKcEFngMWEDGSqFTiwpwM/91mFPhBOw
 Zsf9bKzZE5+ui8xZwBp3TqLbUgLiilTi+xgKwcO6Q/WXX98y57cbfJB49ar+ASFgGf
 WCFL45smMkm8g==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 12 Jun 2023 13:16:26 -0700
Message-ID: <20230612201626.3768393-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Let's avoid any confusion from assigning compress_level=0
 for LZ4HC and ZSTD. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 fs/f2fs/compress.c
 | 3 +-- fs/f2fs/f2fs.h | 2 ++ fs/f2fs/super.c | 12 +++++++----- 3 files
 changed, 10 insertions(+), 7 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8nxs-0012Ba-Tf
Subject: [f2fs-dev] [PATCH] f2fs: assign default compression level
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's avoid any confusion from assigning compress_level=0 for LZ4HC and ZSTD.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/compress.c |  3 +--
 fs/f2fs/f2fs.h     |  2 ++
 fs/f2fs/super.c    | 12 +++++++-----
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 1132d3cd8f33..438af59d3571 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -317,8 +317,6 @@ static const struct f2fs_compress_ops f2fs_lz4_ops = {
 #endif
 
 #ifdef CONFIG_F2FS_FS_ZSTD
-#define F2FS_ZSTD_DEFAULT_CLEVEL	1
-
 static int zstd_init_compress_ctx(struct compress_ctx *cc)
 {
 	zstd_parameters params;
@@ -327,6 +325,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 	unsigned int workspace_size;
 	unsigned char level = F2FS_I(cc->inode)->i_compress_level;
 
+	/* Need to remain this for backward compatibility */
 	if (!level)
 		level = F2FS_ZSTD_DEFAULT_CLEVEL;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4b249716ae7b..c61f728e1116 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1440,6 +1440,8 @@ struct compress_data {
 
 #define F2FS_COMPRESSED_PAGE_MAGIC	0xF5F2C000
 
+#define F2FS_ZSTD_DEFAULT_CLEVEL	1
+
 #define	COMPRESS_LEVEL_OFFSET	8
 
 /* compress context */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8fd23caa1ed9..7162e55c4eb4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -589,14 +589,12 @@ static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
 {
 #ifdef CONFIG_F2FS_FS_LZ4HC
 	unsigned int level;
-#endif
 
 	if (strlen(str) == 3) {
-		F2FS_OPTION(sbi).compress_level = 0;
+		F2FS_OPTION(sbi).compress_level = LZ4HC_DEFAULT_CLEVEL;
 		return 0;
 	}
 
-#ifdef CONFIG_F2FS_FS_LZ4HC
 	str += 3;
 
 	if (str[0] != ':') {
@@ -614,6 +612,10 @@ static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
 	F2FS_OPTION(sbi).compress_level = level;
 	return 0;
 #else
+	if (strlen(str) == 3) {
+		F2FS_OPTION(sbi).compress_level = 0;
+		return 0;
+	}
 	f2fs_info(sbi, "kernel doesn't support lz4hc compression");
 	return -EINVAL;
 #endif
@@ -627,7 +629,7 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
 	int len = 4;
 
 	if (strlen(str) == len) {
-		F2FS_OPTION(sbi).compress_level = 0;
+		F2FS_OPTION(sbi).compress_level = F2FS_ZSTD_DEFAULT_CLEVEL;
 		return 0;
 	}
 
@@ -640,7 +642,7 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
 	if (kstrtouint(str + 1, 10, &level))
 		return -EINVAL;
 
-	if (!level || level > zstd_max_clevel()) {
+	if (level < zstd_min_clevel() || level > zstd_max_clevel()) {
 		f2fs_info(sbi, "invalid zstd compress level: %d", level);
 		return -EINVAL;
 	}
-- 
2.41.0.162.gfafddb0af9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
