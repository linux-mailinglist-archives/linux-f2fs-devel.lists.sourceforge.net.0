Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AAD7470E0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Jul 2023 14:22:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qGf3M-0006Zm-62;
	Tue, 04 Jul 2023 12:22:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qGf3J-0006Zf-Iz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Jul 2023 12:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DCGhF7aG0ICnzzcrmQsOj1iUvKcFg3KjYUt2ITpurKA=; b=c+8+IJWNn1ZkY9cmL3VkuLBLW2
 S7mvd/iHYvIr7FmPGeCQ+qsckityjVmoRogokXBqNkAT3QXe+9aW9/iQQZLT0EfOHZfCvuddEOZM2
 scPfUT3J0gFenmB4hsEZbDpJ+XqyjAEBr/5A3N3LrV7LXhHys9sgvh5OHlOhPn1mpdTU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DCGhF7aG0ICnzzcrmQsOj1iUvKcFg3KjYUt2ITpurKA=; b=ZWe6EJHA3YfQlGJvCa7c2Ef/I0
 HULu4DkETrdgXI5tRBoT8DIW7Vumy0KWT3eDD/xuwIFSAjpbp/SneMDTFZFc6MSNrX94jDQfsLvmA
 uv37fBJAwjoT9JtSmHhSV3vDz0nMSJyTMuEgUfCbosaae4mj2GnRmeQofA4/G5hov/Z0=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qGf3F-0004yL-1p for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Jul 2023 12:22:40 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9D49D2056F;
 Tue,  4 Jul 2023 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1688473346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCGhF7aG0ICnzzcrmQsOj1iUvKcFg3KjYUt2ITpurKA=;
 b=JYTQ4Qndf0rmIHWQ/Wge5YOAxgITvuWtSC+X+uxM8Ag+eytWbHShbtJoizWkc8GONChhT7
 p+utlJCTK2JVn8+gf1M81Ir3Ds/I6wyAgcdJr6tv5z/C6VS1s5Icc2yeOcpoLNLajRekEt
 gtjyL1ikbFFqwFlfuaOkKDGf2HguPMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1688473346;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCGhF7aG0ICnzzcrmQsOj1iUvKcFg3KjYUt2ITpurKA=;
 b=7D4V23So0uda/luweBJxz11yl0lwco62tjFcKIjQ32NHEUu3+82UVHdsD4yrGrO9DrtUEl
 UHyuEvTZ+i1sFfCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8ADC613A26;
 Tue,  4 Jul 2023 12:22:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DyrgIQIPpGRZMAAAMHmgww
 (envelope-from <jack@suse.cz>); Tue, 04 Jul 2023 12:22:26 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 2B6E1A0787; Tue,  4 Jul 2023 14:22:25 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-block@vger.kernel.org>
Date: Tue,  4 Jul 2023 14:21:51 +0200
Message-Id: <20230704122224.16257-24-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230629165206.383-1-jack@suse.cz>
References: <20230629165206.383-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324; i=jack@suse.cz;
 h=from:subject; bh=zY0vQIFWwXxZ7RHzAEqG6D4bDjhEcI3Cdr6fuyrfZKs=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBkpA7fQhkJvnMF8uP9W/ZbXYDJIo2ZlL1tAVBNnpLc
 tGLTdAmJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZKQO3wAKCRCcnaoHP2RA2ZwFB/
 9x2FfXI23LL9d4U0StfRUPWhB/1bRuiDcFEymT2N8DWjxiyNYTYniv/hG+AYiVk5fvwKPVPLtbeCWR
 SwTc296AoMYNt6OYTs5omCWTDrrGuU7/N9IyGZKlPDDKWCFlGUhR+GoQYC+p2MgWPo4MUyF/p5QXx9
 NTG2SMoLXGFMMBE83HivzaIzqr84ckWTYdCbrXp32tkCttJqnAZrTdFSb3SPxL+PwNS5C+wpdyY/Xu
 xdpcXqd3W62aPcYj8imMu2V2aEknQm1o4YfBnsQ6cKANu+lft0AJ6gIdJkDd7ZjKRDtSZWL009oOjG
 lWB+GrHroIZAeQODGJDj4/Yp3JjPOY
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert f2fs to use blkdev_get_handle_by_dev/path() and pass
 the handle around. CC: Jaegeuk Kim <jaegeuk@kernel.org> CC: Chao Yu
 <chao@kernel.org>
 CC: linux-f2fs-devel@lists.sourceforge.net Signed-off-by: Jan Kara
 <jack@suse.cz>
 --- fs/f2fs/f2fs.h | 1 + fs/f2fs/super.c | 18 +++++ [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qGf3F-0004yL-1p
Subject: [f2fs-dev] [PATCH 24/32] f2fs: Convert to
 blkdev_get_handle_by_dev/path()
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert f2fs to use blkdev_get_handle_by_dev/path() and pass the handle
around.

CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Chao Yu <chao@kernel.org>
CC: linux-f2fs-devel@lists.sourceforge.net
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/super.c | 18 +++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d211ee89c158..680874adb265 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1227,6 +1227,7 @@ struct f2fs_bio_info {
 #define FDEV(i)				(sbi->devs[i])
 #define RDEV(i)				(raw_super->devs[i])
 struct f2fs_dev_info {
+	struct bdev_handle *bdev_handle;
 	struct block_device *bdev;
 	char path[MAX_PATH_LEN];
 	unsigned int total_segments;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e34197a70dc1..570364954578 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1538,7 +1538,7 @@ static void destroy_device_list(struct f2fs_sb_info *sbi)
 	int i;
 
 	for (i = 0; i < sbi->s_ndevs; i++) {
-		blkdev_put(FDEV(i).bdev, sbi->sb->s_type);
+		blkdev_handle_put(FDEV(i).bdev_handle);
 #ifdef CONFIG_BLK_DEV_ZONED
 		kvfree(FDEV(i).blkz_seq);
 #endif
@@ -4024,9 +4024,9 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 
 		if (max_devices == 1) {
 			/* Single zoned block device mount */
-			FDEV(0).bdev =
-				blkdev_get_by_dev(sbi->sb->s_bdev->bd_dev, mode,
-						  sbi->sb->s_type, NULL);
+			FDEV(0).bdev_handle = blkdev_get_handle_by_dev(
+					sbi->sb->s_bdev->bd_dev,
+					mode, sbi->sb->s_type, NULL);
 		} else {
 			/* Multi-device mount */
 			memcpy(FDEV(i).path, RDEV(i).path, MAX_PATH_LEN);
@@ -4044,13 +4044,13 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 					(FDEV(i).total_segments <<
 					sbi->log_blocks_per_seg) - 1;
 			}
-			FDEV(i).bdev = blkdev_get_by_path(FDEV(i).path, mode,
-							  sbi->sb->s_type,
-							  NULL);
+			FDEV(i).bdev_handle = blkdev_get_handle_by_path(
+				FDEV(i).path, mode, sbi->sb->s_type, NULL);
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
