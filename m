Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 546FA80BA5B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Dec 2023 12:36:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCI6T-00078x-L3;
	Sun, 10 Dec 2023 11:36:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rCI6R-00078k-LB
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 11:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jcL7Yex4CvXuPOOYTfHIYu62fStL4uVqhA/YSylsCCc=; b=ekMY7cONZ5cP8C5AyFSbTzOFlh
 EN1oE94hycwKFvtyAkBIk+8ZD4miPhnfsNOyT3c3LDDeHXgjrrP+kd8qp9fdXoyREG2DYgLzYTW6e
 mVdODk0sVwvXnSxvtcKvEtbpPOhXc0XrNfYcSpotcPWhDpY5pDmlQXftMTlxdEOALiE0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jcL7Yex4CvXuPOOYTfHIYu62fStL4uVqhA/YSylsCCc=; b=U0dgnSELgkprC1d9blJNSo4Y/i
 GYvWkSTqpeQ6gbqZFg/gUfHDfzHmJCp2NSKkbCCcQVfrNjn2Mhy3qYXMhFX9d3HFxXFb+3pf/E+u9
 u4/Ly9jQVk7ZvyUDjVY/85m8qG8f79D4ieFpu9/bJtjhJK4Z4/jSxbNAr0+deDOGvhMg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCI6R-0000U5-H9 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 11:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0B8BB60C5B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Dec 2023 11:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E864C433C9;
 Sun, 10 Dec 2023 11:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702208161;
 bh=dLds5jvPY7Yl05BDqmaObZ0ySYYRFXngO3CypVRgnUI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f0r5UZOClT+qxOhTdmYQ5XIChARJWxNgHecNvTNmjAykLquVh3aAgFAyVWKqs2xep
 qZREYMfFsuYh0dUfNi9MHVzHXWebCXChp9SK6Bjbc20Y8MSlastnbfp3NIJF/6s5Cx
 KAxkucpK0lghl+M4lfsuwHNlpRYHfo14s6Z/OMF7Ld/ewODQSRj0sBvPw3lfXk+riR
 wizq5S8I54LwWIrKPmNy3ZcJlpE6KTcZ8M/77szdlhGFcTOtmeEZoblhMNagdh9KdM
 W3SwghyJX35n9dRggoyvpJS9YhzTpPa8PGq3Exvx/H48b6W1pGCOrwjVZ83ZbmJvvC
 9UdldAVXXF8Hg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 10 Dec 2023 19:35:43 +0800
Message-Id: <20231210113547.3412782-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231210113547.3412782-1-chao@kernel.org>
References: <20231210113547.3412782-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If inode is compressed, but not encrypted, it missed to call
 f2fs_wait_on_block_writeback() to wait for GCed page writeback in IPU write
 path. Thread A GC-Thread - f2fs_gc - do_garbage_collect - gc_data_segment
 - move_data_block - f2fs_submit_page_write migrate normal cluster's block
 via meta_inode's page cache - f2fs_write_single_data_page [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rCI6R-0000U5-H9
Subject: [f2fs-dev] [PATCH 2/6] f2fs: fix to wait on block writeback for
 post_read case
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

If inode is compressed, but not encrypted, it missed to call
f2fs_wait_on_block_writeback() to wait for GCed page writeback
in IPU write path.

Thread A				GC-Thread
					- f2fs_gc
					 - do_garbage_collect
					  - gc_data_segment
					   - move_data_block
					    - f2fs_submit_page_write
					     migrate normal cluster's block via
					     meta_inode's page cache
- f2fs_write_single_data_page
 - f2fs_do_write_data_page
  - f2fs_inplace_write_data
   - f2fs_submit_page_bio

IRQ
- f2fs_read_end_io
					IRQ
					old data overrides new data due to
					out-of-order GC and common IO.
					- f2fs_read_end_io

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 27015b7875ae..dce8defdf4c7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2556,9 +2556,6 @@ int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
 
 	page = fio->compressed_page ? fio->compressed_page : fio->page;
 
-	/* wait for GCed page writeback via META_MAPPING */
-	f2fs_wait_on_block_writeback(inode, fio->old_blkaddr);
-
 	if (fscrypt_inode_uses_inline_crypto(inode))
 		return 0;
 
@@ -2745,6 +2742,10 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		goto out_writepage;
 	}
 
+	/* wait for GCed page writeback via META_MAPPING */
+	if (fio->post_read)
+		f2fs_wait_on_block_writeback(inode, fio->old_blkaddr);
+
 	/*
 	 * If current allocation needs SSR,
 	 * it had better in-place writes for updated data.
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
