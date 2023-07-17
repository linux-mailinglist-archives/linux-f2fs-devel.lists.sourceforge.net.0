Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F49756BB2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Jul 2023 20:18:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLSna-0002Yn-Px;
	Mon, 17 Jul 2023 18:18:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qLSnX-0002YW-C6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 18:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n/vTrkDYH9vpglUpblutmcIAc5rxsFN9dPqywBayICI=; b=gip/AfFkMcVTY99F+42W4/ZX7b
 3dqFFOHBwDzxJgu6NuexxF1TgOvWgWR3VV2onDBm8K6ZJXMQgBrZoDs8D2YGcthOTBkRYrins/Q7u
 WE4WSzz1ukKFHYtyxOEFPNzsb4wfGau38NOCVLe/b4uAVK3VVfLeWdTWS+dg+OUzFmjg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=n/vTrkDYH9vpglUpblutmcIAc5rxsFN9dPqywBayICI=; b=m
 1IxRXgqT8XiGzDHiMJIv00NRkmOF+iDG1fF5tR0JRGQJJMaNHPFu9XWmnmIJ/nidr4Yl7psim18Qa
 HvmEsIzdRIvN59lypaoBWwgGERDqnTQKB1z+A45W57y1Rq4R7M1s73+IAe5ldwh+hvYOaYx8MgYB2
 gmtnKHwYj7PhHOWw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qLSnV-00AzVT-HT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 18:18:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E905E60FD4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Jul 2023 18:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDA1C433C8;
 Mon, 17 Jul 2023 18:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689617887;
 bh=JQ6N+7PzPDS1PWbPki2OZKlMyodLGJahEwwRRCfMiBM=;
 h=From:To:Cc:Subject:Date:From;
 b=dtxwtXlA+MEqH8nqT+/MHxG8Z5VX4pq6ddEbK3cio8Y5fLmIlIM4b86FpZ9mOg5zM
 4/zmfUKGthe5KIvtfhtMGEknDEoHaFTPtrLBTJEr1cqibG0CLh2oEZuNX6yx9htY6e
 3F0CN9GwwVumYG1ViKUakLYRz8ktxHihG7j3hicUQT6KEKt9bwtCYzoGhXeM9rtfPz
 SmIb6Md1bboK1jczV0mR/wQkljZ89Ga7+TWBO0cE729h3lIICc1keHHYgUM0gONlWU
 wmPV69//ebIqDfGtV2f/IUN9gEMfESHVu8dV2Nr42Fv2SES6IcyImpV2mU2Qhm1j5V
 TMijW+9DVw2LA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 17 Jul 2023 11:18:05 -0700
Message-ID: <20230717181805.285894-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In file included from external/f2fs-tools/lib/nls_utf8.c:29:
 external/f2fs-tools/include/f2fs_fs.h:1781:44: error: call to undeclared
 function 'S_ISDIR'; ISO C99 and later do not support implicit func [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qLSnV-00AzVT-HT
Subject: [f2fs-dev] [PATCH] f2fs-tools: quick fix for Android build
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

In file included from external/f2fs-tools/lib/nls_utf8.c:29:
external/f2fs-tools/include/f2fs_fs.h:1781:44: error: call to undeclared function 'S_ISDIR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
        raw_node->i.i_current_depth = cpu_to_le32(S_ISDIR(mode) ? 1 : 0);

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/f2fs_fs.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 2f632593696a..7e7db229b9a4 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1359,7 +1359,9 @@ enum FILE_TYPE {
 
 #define LINUX_S_IFMT  00170000
 #define LINUX_S_IFREG  0100000
+#define LINUX_S_IFDIR  0040000
 #define LINUX_S_ISREG(m)	(((m) & LINUX_S_IFMT) == LINUX_S_IFREG)
+#define LINUX_S_ISDIR(m)	(((m) & LINUX_S_IFMT) == LINUX_S_IFDIR)
 
 /* from f2fs/segment.h */
 enum {
@@ -1778,10 +1780,10 @@ static inline void f2fs_init_inode(struct f2fs_super_block *sb,
 	raw_node->i.i_generation = 0;
 	raw_node->i.i_xattr_nid = 0;
 	raw_node->i.i_flags = 0;
-	raw_node->i.i_current_depth = cpu_to_le32(S_ISDIR(mode) ? 1 : 0);
+	raw_node->i.i_current_depth = cpu_to_le32(LINUX_S_ISDIR(mode) ? 1 : 0);
 	raw_node->i.i_dir_level = DEF_DIR_LEVEL;
 	raw_node->i.i_mode = cpu_to_le16(mode);
-	raw_node->i.i_links = cpu_to_le32(S_ISDIR(mode) ? 2 : 1);
+	raw_node->i.i_links = cpu_to_le32(LINUX_S_ISDIR(mode) ? 2 : 1);
 
 	/* for dentry block in directory */
 	raw_node->i.i_size = cpu_to_le64(1 << get_sb(log_blocksize));
-- 
2.41.0.255.g8b1d071c50-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
