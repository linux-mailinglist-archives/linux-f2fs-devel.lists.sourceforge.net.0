Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E0B3B0EA3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jun 2021 22:22:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lvmuw-0000Z2-5K; Tue, 22 Jun 2021 20:22:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lvmup-0000Yc-57
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Jun 2021 20:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MEYnojIGZMqWRGMmAMN0M3nk6s1lUzkL/OjZ6RHSKeg=; b=AM2zolE+NEPlBEYyfvUZMC6mCl
 5PEmucDLXQK3k1AEznRZAVukvh87xy3knwTbTxAXLsJOejza213XTn4plpVaVngPWz8fYiRHxeXM0
 vgSE8sNJNH1yD4wOKu/GhHNzEIQaVLJrMlZgzkJO34/UyZ/5h9S0y3uoVH8+JpTWwdk4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MEYnojIGZMqWRGMmAMN0M3nk6s1lUzkL/OjZ6RHSKeg=; b=A
 b1R6bcRUuHzaVUcoXkXVGW872aHLxlXoJ0fLKwNXpOqRJpoTGWGlTdvSfC5Syx84r5zhb2cFO0kmP
 4BbjHXeK3LAjRs3CwIv+5W8ip4fIVebUfKxC/E6naLU3VMPe7LVYnxpG0mZd0K9IR3qnP9/dR3hpo
 jKNePzlWCtbtaTjw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lvmui-0001qr-Ka
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Jun 2021 20:22:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFCE260724;
 Tue, 22 Jun 2021 20:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624393339;
 bh=YiAxCf6fiPnI8bJy6wNlmJjhebzXdmJijGBXG3hEx18=;
 h=From:To:Cc:Subject:Date:From;
 b=VJPJNCa91bYO3PAPUjo+cmmgiNiUJDqIm/6/Nmu2Q1QEsR/BFZncuFlhEu83yyRsY
 SDuIiSiqiIbDM1Qz6PDf+fTWq19Dpz/cNr23wQRstLowvNuwyfhgBcGWvBEmnMorPh
 gW4uEjj/QUr/oadnOrhGTCY0Nz1ZBVICmqL88+QNipdx4FtiHuOZ0MK814hNxhQvIq
 kT31lJTh9YamuD2X23XVe9Wfd4sBSrEAtaKfeosoj29LjMiWOYvyWRqg1CcOzyWw/d
 ZCFiIUElBPjYWPvonRAxvA3UkVS/nK2D6aDk+4TvMlUQV13Q5epIzG1gPnB7eNK5+R
 z7lIMUi/LFRFw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 22 Jun 2021 13:22:17 -0700
Message-Id: <20210622202217.3864743-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lvmui-0001qr-Ka
Subject: [f2fs-dev] [PATCH] f2fs: remove false alarm on iget failure during
 GC
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

This patch removes setting SBI_NEED_FSCK when GC gets an error on f2fs_iget,
since f2fs_iget can give ENOMEM and others by race condition.
If we set this critical fsck flag, we'll get EIO during fsync via the below
code path.

In f2fs_inplace_write_data(),

	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK) || f2fs_cp_error(sbi)) {
		err = -EIO;
		goto drop_bio;
	}

Fixes: 9557727876674 ("f2fs: drop inplace IO if fs status is abnormal")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/gc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index da5947b30142..0e42ee5f7770 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1451,10 +1451,8 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 		if (phase == 3) {
 			inode = f2fs_iget(sb, dni.ino);
-			if (IS_ERR(inode) || is_bad_inode(inode)) {
-				set_sbi_flag(sbi, SBI_NEED_FSCK);
+			if (IS_ERR(inode) || is_bad_inode(inode))
 				continue;
-			}
 
 			if (!down_write_trylock(
 				&F2FS_I(inode)->i_gc_rwsem[WRITE])) {
-- 
2.32.0.288.g62a8d224e6-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
