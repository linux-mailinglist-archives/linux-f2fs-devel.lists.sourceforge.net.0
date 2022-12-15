Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7C864D659
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Dec 2022 07:07:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5hPD-0003Ja-LQ;
	Thu, 15 Dec 2022 06:07:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p5hPB-0003JU-TX
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 06:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AMA/Vy8dBfeHhDc3zSfju1teksnVluPaKP2rLYJpQLA=; b=QMYdSKjiehwptvbPwcqRq7HZDe
 gSZRk4ZFm0Ivup6NEHo4Wli5AaT0SnoYjMcU5j9DNBm/hP4zxGVyTpeel/lBiyTDUito4Zltncu7H
 GUwusmR/QVWPM2i3TU/+I4fepaOei20Ve/pXp9/6VmpZImS7UOcOKYp9Yg7o95n7KwuQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AMA/Vy8dBfeHhDc3zSfju1teksnVluPaKP2rLYJpQLA=; b=K
 NoHQlDEWlWO0kgjaS9l7GY4s8JKohaGpUe+IIUYC8uegh0zti/atDnISr/ttfW4hqZk1lROiBJXSM
 sLSeRUfrxylnoGLQBjz9/kruFAzOUaqICNzGsRJJxlcO9NQtXLINIoeIryozjZFQEjMT+8mpnkQ2p
 k/ib3KNGy0mqicqo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5hP8-000DP0-Ic for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 06:07:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8ACCF61D00
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Dec 2022 06:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB02C433EF;
 Thu, 15 Dec 2022 06:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671084451;
 bh=0NfiFGHwkJcI8GSlY2A4QfANtLqFrxyrmqMzhDsZ/xc=;
 h=From:To:Cc:Subject:Date:From;
 b=gpvHGCZ8lTCvgxjC5Q4uB9Op/tcFUsTagOu1u1dPeR5vjVpkk38ebnaALGp3g5Ljf
 skLYRpkWsR7Y+7SKulZytW4qMHP99pZ9yWm7D3O7utIk/P5nF9DJr0WhtGoddaEDbm
 kxeplIwvM0ybFMd91BZ8dCPJmj8rFqInKKbQcsdYSwaGUSDB/dBfvpz3x4Pe6UzErX
 2V9KwDIpkuM6sZzg5+gnRyTRE2B/HwIOf3NsC7Apms1D1QVAYbqYfgN626jUWe1/RT
 YPI/+dp0jry6vUDOfdImprs0iKx9mJ1mRno62UlLuAGRSOtdLO438UpTRoRKZmO3Ni
 WW+16V/FTsLpg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 15 Dec 2022 14:05:06 +0800
Message-Id: <20221215060506.3454508-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: After below changes: commit 14db0b3c7b83 ("fscrypt: stop
 using
 PG_error to track error status") commit 98dc08bae678 ("fsverity: stop using
 PG_error to track error status") There is no place in f2fs we will set
 PG_error
 flag in page, let's remove other PG_error usage in f2fs, as a step towards
 freeing the PG_error flag for other uses. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5hP8-000DP0-Ic
Subject: [f2fs-dev] [PATCH] f2fs: avoid to check PG_error flag
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

After below changes:
commit 14db0b3c7b83 ("fscrypt: stop using PG_error to track error status")
commit 98dc08bae678 ("fsverity: stop using PG_error to track error status")

There is no place in f2fs we will set PG_error flag in page, let's remove
other PG_error usage in f2fs, as a step towards freeing the PG_error flag
for other uses.

Cc: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c    | 2 --
 fs/f2fs/gc.c      | 1 -
 fs/f2fs/inline.c  | 1 -
 fs/f2fs/node.c    | 3 ---
 fs/f2fs/segment.c | 1 -
 5 files changed, 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6e43e19c7d1c..78e8745b91c5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2700,7 +2700,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 			goto out_writepage;
 
 		set_page_writeback(page);
-		ClearPageError(page);
 		f2fs_put_dnode(&dn);
 		if (fio->need_lock == LOCK_REQ)
 			f2fs_unlock_op(fio->sbi);
@@ -2736,7 +2735,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		goto out_writepage;
 
 	set_page_writeback(page);
-	ClearPageError(page);
 
 	if (fio->compr_blocks && fio->old_blkaddr == COMPRESS_ADDR)
 		f2fs_i_compr_blocks_update(inode, fio->compr_blocks - 1, false);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6e2cae3d2e71..43c461b80209 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1365,7 +1365,6 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		dec_page_count(fio.sbi, F2FS_DIRTY_META);
 
 	set_page_writeback(fio.encrypted_page);
-	ClearPageError(page);
 
 	fio.op = REQ_OP_WRITE;
 	fio.op_flags = REQ_SYNC;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 21a495234ffd..08e302d32118 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -174,7 +174,6 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 
 	/* write data page to try to make data consistent */
 	set_page_writeback(page);
-	ClearPageError(page);
 	fio.old_blkaddr = dn->data_blkaddr;
 	set_inode_flag(dn->inode, FI_HOT_DATA);
 	f2fs_outplace_write_data(dn, &fio);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index dde4c0458704..558b318f7316 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1650,7 +1650,6 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 	}
 
 	set_page_writeback(page);
-	ClearPageError(page);
 
 	fio.old_blkaddr = ni.blk_addr;
 	f2fs_do_write_node_page(nid, &fio);
@@ -2079,8 +2078,6 @@ int f2fs_wait_on_node_pages_writeback(struct f2fs_sb_info *sbi,
 		spin_unlock_irqrestore(&sbi->fsync_node_lock, flags);
 
 		f2fs_wait_on_page_writeback(page, NODE, true, false);
-		if (TestClearPageError(page))
-			ret = -EIO;
 
 		put_page(page);
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 25ddea478fc1..0134d8c166e9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3423,7 +3423,6 @@ void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct page *page,
 		fio.op_flags &= ~REQ_META;
 
 	set_page_writeback(page);
-	ClearPageError(page);
 	f2fs_submit_page_write(&fio);
 
 	stat_inc_meta_count(sbi, page->index);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
