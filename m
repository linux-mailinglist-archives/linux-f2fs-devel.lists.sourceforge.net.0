Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1556DC294
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Apr 2023 04:14:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1plh2y-0008GQ-S1;
	Mon, 10 Apr 2023 02:14:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1plh2w-0008GK-K1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 02:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ADmnYEY8KNAhOROyJ/F/ok/JfgesFrPCS6WIBfd35E=; b=KUjX9mrDk9Cr9/1P+w9NN8050A
 IIP7XG+iibqP3APUEE5k5gIxYYEp+XxgZIFbKI8gtPiheyxzB/4mdF+8AjOyAcB6sV2YEGPHj0YTE
 2a6nFsCCDmvCUYN4aEKCdQJRKzwHIAaKYmrQDjkakjcQr8iCn2LxtKfzuRzopu2qahqQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2ADmnYEY8KNAhOROyJ/F/ok/JfgesFrPCS6WIBfd35E=; b=M
 uekFL5wrFBrJ1dx4Lfp6bIm83gKDY7FFaQCJQr/2kQIdV3Nj08WbvySwzPy/5O10H7IechhxpnZS/
 ODaZQxVRX19yz5Zc8E8X6909oD/rRrQc+qQPSx4X/tYUDywZnh8nYrdrFCVkZ6a8h4ryCGPgwSdO1
 yY6filq7lBwnu/dw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1plh2u-002V3p-Mx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 02:14:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5467060C38
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Apr 2023 02:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918D1C433EF;
 Mon, 10 Apr 2023 02:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681092850;
 bh=pXSNSEY080dCZ45hxP1p6QKFX6fqVzj/5je/deUizYA=;
 h=From:To:Cc:Subject:Date:From;
 b=n0DnDTV39nOj54ijI8xX14a/fVfk9sb29YAwpg1Njihu112/Z2WuHhSez2wB3VT5+
 hDMhWrJ0w4tA2L4t7IM282Nh8c74N5OgCX2zCqgqrmIWR7qDHHK/m4FOfk1D8oCJKC
 yLs5EfczK6jb6+70E8GlxQhvpLO8V3hdnSHeXDpKHxXJE7jsmUFOu3SpV4BTuVdHN2
 SaLsZ/mG/9j9Gux99gVA4vf/XAfnj9XLdxddMh3/TWN/roBztJ17IdcJ2U+WJgnRjR
 2qB6HZSUggm50IScvP1fzkgbLudZvtJZIRDH3tVqajaIZI4FY6l/+zfrrZqN+hRMZF
 /i1a/H21BZKLQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 10 Apr 2023 10:14:02 +0800
Message-Id: <20230410021402.1833220-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: xfstest generic/019 reports a bug: kernel BUG at
 mm/filemap.c:1619!
 RIP: 0010:folio_end_writeback+0x8a/0x90 Call Trace:
 end_page_writeback+0x1c/0x60
 f2fs_write_end_io+0x199/0x420 bio_endio+0x104/0x180
 submit_bio_noacct+0xa5/0x510 submi [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1plh2u-002V3p-Mx
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid use-after-free for cached IPU
 bio
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

xfstest generic/019 reports a bug:

kernel BUG at mm/filemap.c:1619!
RIP: 0010:folio_end_writeback+0x8a/0x90
Call Trace:
 end_page_writeback+0x1c/0x60
 f2fs_write_end_io+0x199/0x420
 bio_endio+0x104/0x180
 submit_bio_noacct+0xa5/0x510
 submit_bio+0x48/0x80
 f2fs_submit_write_bio+0x35/0x300
 f2fs_submit_merged_ipu_write+0x2a0/0x2b0
 f2fs_write_single_data_page+0x838/0x8b0
 f2fs_write_cache_pages+0x379/0xa30
 f2fs_write_data_pages+0x30c/0x340
 do_writepages+0xd8/0x1b0
 __writeback_single_inode+0x44/0x370
 writeback_sb_inodes+0x233/0x4d0
 __writeback_inodes_wb+0x56/0xf0
 wb_writeback+0x1dd/0x2d0
 wb_workfn+0x367/0x4a0
 process_one_work+0x21d/0x430
 worker_thread+0x4e/0x3c0
 kthread+0x103/0x130
 ret_from_fork+0x2c/0x50

The root cause is: after cp_error is set, f2fs_submit_merged_ipu_write()
in f2fs_write_single_data_page() tries to flush IPU bio in cache, however
f2fs_submit_merged_ipu_write() missed to check validity of @bio parameter,
result in submitting random cached bio which belong to other IO context,
then it will cause use-after-free issue, fix it by adding additional
validity check.

Fixes: 0b20fcec8651 ("f2fs: cache global IPU bio")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8064df5f829d..b59b5c7096f3 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -874,6 +874,8 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
 	bool found = false;
 	struct bio *target = bio ? *bio : NULL;
 
+	f2fs_bug_on(sbi, !target && !page);
+
 	for (temp = HOT; temp < NR_TEMP_TYPE && !found; temp++) {
 		struct f2fs_bio_info *io = sbi->write_io[DATA] + temp;
 		struct list_head *head = &io->bio_list;
@@ -2902,7 +2904,8 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 
 	if (unlikely(f2fs_cp_error(sbi))) {
 		f2fs_submit_merged_write(sbi, DATA);
-		f2fs_submit_merged_ipu_write(sbi, bio, NULL);
+		if (bio && *bio)
+			f2fs_submit_merged_ipu_write(sbi, bio, NULL);
 		submitted = NULL;
 	}
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
