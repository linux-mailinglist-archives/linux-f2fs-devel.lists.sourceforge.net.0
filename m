Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D309D7855D4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Aug 2023 12:49:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qYlQF-0004iW-IW;
	Wed, 23 Aug 2023 10:49:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qYlQE-0004iP-S6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Aug 2023 10:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2AUkHVYDDBg67q+3OD0qFSazOfyxTAI2542TIz3rbns=; b=Zwvg6B622BFkiG5J9Jz3jIV+PE
 uRq8PaHpAW6FQne98yybyvXI+GMmptpJOSZSBbidTKSUVpSv60almrkpe2EPgIoHRYDhqfW/ZhCvy
 z8Kzg9HmbOjPYERu6FQkjPKv+YEeCjT29DWiNdGcbIHmnUX0TZR95lF6UFt2GRwLyyEA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2AUkHVYDDBg67q+3OD0qFSazOfyxTAI2542TIz3rbns=; b=jFyPaK2FOvJiCi1Szg3EbQ5HIx
 Ixc1+8gvvps5m7BSfQszlNgDUn5PzxdV+Ol5fqpjBEvys7On6t9Vh0rVNDVJXT7z5ge55rn6Dg0Sq
 71LhMrFx3SOc+5YR/xdIpqxF1UIO70nC12LvLr9a9cQ5mS2mYyuIVLM9vGtjW0WE4/N8=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYlQC-00D5kc-Pq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Aug 2023 10:49:11 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2BC0022238;
 Wed, 23 Aug 2023 10:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1692787739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2AUkHVYDDBg67q+3OD0qFSazOfyxTAI2542TIz3rbns=;
 b=ZXrZlNJ3g4AtXip0gcX9yOKeExtqThYsiSH/r5mRCx7snkGOAI4bxRyChbhpTyL+YexBdn
 bRYsTUSSyIdny4nYF6zpWcL5pY9mc1XOJHP7Tb+/3HMIMtj5otx7DOkSh/zpAhixApQL6x
 rd586/2JMwc1UfVFL6EJJw64zSt8XhI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1692787739;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2AUkHVYDDBg67q+3OD0qFSazOfyxTAI2542TIz3rbns=;
 b=m5WcXtUVe4h3za6ZijNlLIIyMKLAsIuwR1PjgVMTs0bVDdKI+wzWvV6vSq6kuDZNRA3ulW
 67bI0IDo7GpnJSAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D3C613592;
 Wed, 23 Aug 2023 10:48:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wV8iBxvk5WRzIAAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 23 Aug 2023 10:48:59 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 8D718A0799; Wed, 23 Aug 2023 12:48:57 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Date: Wed, 23 Aug 2023 12:48:34 +0200
Message-Id: <20230823104857.11437-23-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230818123232.2269-1-jack@suse.cz>
References: <20230818123232.2269-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284; i=jack@suse.cz;
 h=from:subject; bh=A8xzyyYYp7e3nycZMwh5um089G3sh6pF1T1fTnU+2b4=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBk5eQCpKEjjgiqB3ZA1c5TSrTxzQCLo0J9QrbxTBbl
 SsdwFCeJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZOXkAgAKCRCcnaoHP2RA2Yo7CA
 DYPCyhul0tth4sF/mXbVG+Z7Im4oaDJsjL/BvAEgOC/9sq+RuecArAuEaoYD1RvO49AHJHjPARmsuB
 xRWlPxNeZFWhePZeL17m7liT+2aykb1N9AsnJR1TSrr/HfCfMFNwsvnE3Hyo8H9hif+Ly/4DZubggh
 Xa1jU2D/7GK1eVnMKl0NqVABPx80+GL+4TiftnFI/vOMpIR4VnnB0M7fyH85Zv5zRWiTvUkrzEw5qa
 /CSDo9YDJ58zIAjq3QPYYLeBJ7E+3HCQwYsGT8/xlWjNrxCHYt040qaAeGvv9RjWXmh0krMUsBZW25
 yQ9TU9vP6WqA3ZX3kKiLlX9ddWdazR
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert f2fs to use bdev_open_by_dev/path() and pass the
 handle
 around. CC: Jaegeuk Kim <jaegeuk@kernel.org> CC: Chao Yu <chao@kernel.org>
 CC: linux-f2fs-devel@lists.sourceforge.net Acked-by: Christoph Hellwig
 <hch@lst.de>
 Signed-off-by: Jan Kara <jack@suse.cz> --- fs/f2f [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qYlQC-00D5kc-Pq
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
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
 Jan Kara <jack@suse.cz>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert f2fs to use bdev_open_by_dev/path() and pass the handle around.

CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Chao Yu <chao@kernel.org>
CC: linux-f2fs-devel@lists.sourceforge.net
Acked-by: Christoph Hellwig <hch@lst.de>
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
