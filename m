Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F4A231F2E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jul 2020 15:22:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k0m2n-0002uS-Og; Wed, 29 Jul 2020 13:22:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1k0m2k-0002uI-OR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jul 2020 13:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K/+JemGahTDJRKqL8W6Ja5EXCUXKsS+u4UrvQQNfusg=; b=iIeOZkGBFrfGax4AulJNJlnVv6
 DJ51FqT5g57fMY/O1kl0yTO50PLsyfd4yBBOJRH1JzdJlfsuw4FG2NnS+GBHP9VcmVAU2C6Ddusji
 zGJbvVde+0lFoY8MNJwU6mlgpfTqKZD4WgIfvnXmLUkH/z14tr/8rKUphC0uLuT924z8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K/+JemGahTDJRKqL8W6Ja5EXCUXKsS+u4UrvQQNfusg=; b=a4vPJsZq/O6sZv/qbPHorUzqUS
 tUlnVPki27/WBUCyBlSvTu/TkNviJZ93rcot+6KF/j4+iBwP2xPOpS6A/S+C80UtORLsmNdZ8cXis
 3ULcPX/EdgrK0iMvDwWrK9+CypK1dbEdH0OmuDw+l1GK6rZ/CIOyjuOVMGfZ0ybCqJgo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k0m2Z-00DQIx-Dq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jul 2020 13:22:50 +0000
Received: from localhost.localdomain (unknown [49.65.247.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 445C420829;
 Wed, 29 Jul 2020 13:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596028953;
 bh=2nO1aS9EUs24pPVkavg7mosszYZtF5AQTrcRye3PWI0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sTlBironlpJOkLWkS4ZrSH2Cu33V9KhUh0n/hJq7JEr8gq7JDcAhG/+zYxjMpjsFG
 DCVIplbZTbeV/GfSaktdtqs6o/uAGR0dYQb74POhIZK1bG8T30wmjPXao2v+iCmSzc
 edDC3+n4lGO/vK66ZnwBn1TAaTqKt2JLhLLRPJLk=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 29 Jul 2020 21:21:36 +0800
Message-Id: <20200729132136.11134-2-chao@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200729132136.11134-1-chao@kernel.org>
References: <20200729132136.11134-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k0m2Z-00DQIx-Dq
Subject: [f2fs-dev] [PATCH 2/2] f2fs: compress: disable compression mount
 option if compression is off
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

From: Chao Yu <yuchao0@huawei.com>

If CONFIG_F2FS_FS_COMPRESSION is off, don't allow to configure or
show compression related mount option.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/super.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5e0a3eeb8ca4..cdca2087dba0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -460,9 +460,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	substring_t args[MAX_OPT_ARGS];
+#ifdef CONFIG_F2FS_FS_COMPRESSION
 	unsigned char (*ext)[F2FS_EXTENSION_LEN];
+	int ext_cnt;
+#endif
 	char *p, *name;
-	int arg = 0, ext_cnt;
+	int arg = 0;
 	kuid_t uid;
 	kgid_t gid;
 	int ret;
@@ -853,6 +856,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_checkpoint_enable:
 			clear_opt(sbi, DISABLE_CHECKPOINT);
 			break;
+#ifdef CONFIG_F2FS_FS_COMPRESSION
 		case Opt_compress_algorithm:
 			if (!f2fs_sb_has_compression(sbi)) {
 				f2fs_err(sbi, "Compression feature if off");
@@ -918,6 +922,13 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			F2FS_OPTION(sbi).compress_ext_cnt++;
 			kfree(name);
 			break;
+#else
+		case Opt_compress_algorithm:
+		case Opt_compress_log_size:
+		case Opt_compress_extension:
+			f2fs_info(sbi, "compression options not supported");
+			break;
+#endif
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
 				 p);
@@ -1608,7 +1619,9 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_NOBARRIER)
 		seq_printf(seq, ",fsync_mode=%s", "nobarrier");
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
 	f2fs_show_compress_options(seq, sbi->sb);
+#endif
 	return 0;
 }
 
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
