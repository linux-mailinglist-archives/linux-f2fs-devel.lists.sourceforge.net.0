Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2757778CD4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Aug 2023 13:05:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qUPxH-0005el-Fh;
	Fri, 11 Aug 2023 11:05:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qUPxF-0005eb-Uq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Aug 2023 11:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZxloC2aNuNh+I9TyXlePCyzE1Yd0mrW064xgIfzrgPI=; b=VSjFvyk5EHzTr9JCEAarD/i8RR
 pStiT749pVvTWtI5yupbDy3X/i1WMeK2steCBI9jtZbffBzMyiXWH3kRQU+zGYpvbySg/3N3TyNCK
 TnMoF/Pn78Po4nufhdKjBE65I9uUc8RakTzpNn5F2RBhIn/d08UolE+AhfmK2IAfoLKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZxloC2aNuNh+I9TyXlePCyzE1Yd0mrW064xgIfzrgPI=; b=PwcOJu34tivkuzDSDppPGMiEsJ
 LYbhiNNZa47dYaLq4a0P7dsAjmrkfhpocb7eGV+aq2kMgcjOKAiN46WiZ0O8BHL99NiiC+8oEFgyG
 POhJYY+ueOKyo3X6hyu7WLt/Dhq8pEsGU5JuHgui4yHt52QzmEbSIChsxPrrEmF4+qos=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qUPxD-00015g-RI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Aug 2023 11:05:16 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 56FCE1F8A4;
 Fri, 11 Aug 2023 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691751906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZxloC2aNuNh+I9TyXlePCyzE1Yd0mrW064xgIfzrgPI=;
 b=mgBexqvGGXhYIvZpDO+h+RSeZSZvRuVoGRabY6qrZ6lr2J7kjuGoOz5DaNZCJe2x+bx23N
 XaNUwsPwYKOgal3UBswPCjqMGeMtig+6rkum6BjLhOLJZPrqrIH4Lt3viQPKcJszRC1+2v
 nyioYgZKrgfFqOvPZCVzDBUJMk23c3o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691751906;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZxloC2aNuNh+I9TyXlePCyzE1Yd0mrW064xgIfzrgPI=;
 b=V6OZVccO//IOpDNky8QrXYh0AlQjJpKzEkXYApB+dxTKiS56VtzWQPraD16FLOySq0XjGn
 yxQdXMma1ewxBjBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 462AB13A95;
 Fri, 11 Aug 2023 11:05:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XrTPEOIV1mRqRQAAMHmgww
 (envelope-from <jack@suse.cz>); Fri, 11 Aug 2023 11:05:06 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 4581EA0797; Fri, 11 Aug 2023 13:05:05 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Fri, 11 Aug 2023 13:04:54 +0200
Message-Id: <20230811110504.27514-23-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230810171429.31759-1-jack@suse.cz>
References: <20230810171429.31759-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2242; i=jack@suse.cz;
 h=from:subject; bh=gXhkH4DHBaWcCLU4mZG3eLeDQyPPEcfvTwTt9MBb0vI=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBk1hXWp7/Zc8HF73Mv8jDbfnCCGN8lBP9y2bBtqjCQ
 9sC1F2aJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZNYV1gAKCRCcnaoHP2RA2a5eB/
 wLf6nAu6TkEA4dk2EF3PqULDVlx3dhwNNIGvkWpa4/5lc5sbGHtZ0v0K7vK555uacVX16s9jiozhLP
 AEh3nIDG59WvvqOzW3dLBugQfYzFx3Q5gNDXFJSdbkOMoOOt14FtmCTikuXEVJJ9/GbQ9yjprSLke0
 pFyuPIZ3fEh0drhWARB3grIQp1pbZDiiJ3p18dh3Hm9CUoFdF3eN/LDfmLTnjcX5yJyDn6Ze2bYgJe
 xiQwowJYj9kUVNj8RbwxFsVhjBok/9VfYwiShXCRZSmHXUzLbk0mGbSaNv+mJg1wDwf4IgRW9XtXV6
 8tlezwXcFPoSOOQIle3foL2UytnRD6
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert f2fs to use bdev_open_by_dev/path() and pass the
 handle
 around. CC: Jaegeuk Kim <jaegeuk@kernel.org> CC: Chao Yu <chao@kernel.org>
 CC: linux-f2fs-devel@lists.sourceforge.net Signed-off-by: Jan Kara
 <jack@suse.cz>
 --- fs/f2fs/f2fs.h | 1 + fs/f2fs/super.c | 17 +++++ [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qUPxD-00015g-RI
Subject: [f2fs-dev] [PATCH 23/29] f2fs: Convert to bdev_open_by_dev/path()
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
Cc: Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert f2fs to use bdev_open_by_dev/path() and pass the handle around.

CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Chao Yu <chao@kernel.org>
CC: linux-f2fs-devel@lists.sourceforge.net
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/super.c | 17 +++++++++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e18272ae3119..2ec6c10df636 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1234,6 +1234,7 @@ struct f2fs_bio_info {
 #define FDEV(i)				(sbi->devs[i])
 #define RDEV(i)				(raw_super->devs[i])
 struct f2fs_dev_info {
+	struct bdev_handle *bdev_handle;
 	struct block_device *bdev;
 	char path[MAX_PATH_LEN];
 	unsigned int total_segments;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index aa1f9a3a8037..885dcbd81859 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1561,7 +1561,7 @@ static void destroy_device_list(struct f2fs_sb_info *sbi)
 	int i;
 
 	for (i = 0; i < sbi->s_ndevs; i++) {
-		blkdev_put(FDEV(i).bdev, sbi->sb);
+		bdev_release(FDEV(i).bdev_handle);
 #ifdef CONFIG_BLK_DEV_ZONED
 		kvfree(FDEV(i).blkz_seq);
 #endif
@@ -4196,9 +4196,9 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 
 		if (max_devices == 1) {
 			/* Single zoned block device mount */
-			FDEV(0).bdev =
-				blkdev_get_by_dev(sbi->sb->s_bdev->bd_dev, mode,
-						  sbi->sb, NULL);
+			FDEV(0).bdev_handle = bdev_open_by_dev(
+					sbi->sb->s_bdev->bd_dev, mode, sbi->sb,
+					NULL);
 		} else {
 			/* Multi-device mount */
 			memcpy(FDEV(i).path, RDEV(i).path, MAX_PATH_LEN);
@@ -4216,12 +4216,13 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 					(FDEV(i).total_segments <<
 					sbi->log_blocks_per_seg) - 1;
 			}
-			FDEV(i).bdev = blkdev_get_by_path(FDEV(i).path, mode,
-							  sbi->sb, NULL);
+			FDEV(i).bdev_handle = bdev_open_by_path(FDEV(i).path,
+					mode, sbi->sb, NULL);
 		}
-		if (IS_ERR(FDEV(i).bdev))
-			return PTR_ERR(FDEV(i).bdev);
+		if (IS_ERR(FDEV(i).bdev_handle))
+			return PTR_ERR(FDEV(i).bdev_handle);
 
+		FDEV(i).bdev = FDEV(i).bdev_handle->bdev;
 		/* to release errored devices */
 		sbi->s_ndevs = i + 1;
 
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
