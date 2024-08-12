Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF9894EF3C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Aug 2024 16:13:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdVnJ-0000Nk-Tw;
	Mon, 12 Aug 2024 14:13:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sdVnH-0000Nc-I1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Aug 2024 14:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A7rTqX4bjiS57zDBaOkeT7jcor1NZ5CdF7IXaHdJUhk=; b=SjfVNnevFWQXr35y46r07InA+X
 Ma5hYLr496u2pAdf9SlTax1hGhC2s8YB+RATdCAjbpONUF4uYXnr2grWrgEtV7BoxRzmBg+wuyJRV
 7br1gNYTz6df2qnBDjwBrR4rQOJ+hywJGJIa1dKTe/E5cETMVSGxLI5h0Qa9IxsDSksc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=A7rTqX4bjiS57zDBaOkeT7jcor1NZ5CdF7IXaHdJUhk=; b=X
 upP0u7Hd5m62KJoutNTpBamQHbDKT9q1qUbDnQApY5/oSmVUOQdX2EwcFpXTB2Ot2kcm/J42Np5F+
 Soc0rYbNF1BVawOlrHuYyiNic824/dKGnS2v4GFI1m6CygN3DkgYWwdyx3q1kuYMXIgjNiuBhAEPP
 gxgFG9LI1XYqkgsg=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdVnG-0002Im-OR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Aug 2024 14:13:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EB733CE0EAD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Aug 2024 14:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1EBC32782;
 Mon, 12 Aug 2024 14:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723471973;
 bh=7gSDC/cYVMwFkYxC7WG5mpNOT6P1rABfpHlISArbjQQ=;
 h=From:To:Cc:Subject:Date:From;
 b=h2Nhj3jY4l1WBltCi6rXWlfN2AIuo1Nr+RsYBAU/6mTIoTTDAUZwWcpy7HF0Cw0tR
 PGcw/vZHLFAzLjHoaxfVCzGDfUiG+min1ofn4ehWim4NZ1UmvC+zKdGJVZ+1jAHien
 rZwdXE1IENLkJp3fw365NkcU9WxhNnsfKrImxH83n3G1o4JFZTY4JeRokq/yOWZRJN
 8355OUaAkmCkvfDBnzU5nq7zMCcZLEhZQg1iAaJ/Y/hRksYx+ox+V0A0qe3ckv/ju2
 JmFqtOYEKqnuZx0riNenL0VjxCjNaz702q1p7pKvrTrxOM7OYmrRlgTXnTYCDns05R
 IuxqzAx56LAaw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 12 Aug 2024 22:12:42 +0800
Message-Id: <20240812141242.4159033-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Soft IRQ Thread - f2fs_write_end_io - f2fs_defragment_range
 - set_page_private_gcing - type = WB_DATA_TYPE(page, false); : assign type
 w/ F2FS_WB_CP_DATA due to page_private_gcing() is true - dec_page [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sdVnG-0002Im-OR
Subject: [f2fs-dev] [PATCH] f2fs: fix to wait page writeback before setting
 gcing flag
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

Soft IRQ				Thread
- f2fs_write_end_io
					- f2fs_defragment_range
					 - set_page_private_gcing
 - type = WB_DATA_TYPE(page, false);
 : assign type w/ F2FS_WB_CP_DATA
 due to page_private_gcing() is true
  - dec_page_count() w/ wrong type
  - end_page_writeback()

Value of F2FS_WB_CP_DATA reference count may become negative under above
race condition, the root cause is we missed to wait page writeback before
setting gcing page private flag, let's fix it.

Fixes: 2d1fe8a86bf5 ("f2fs: fix to tag gcing flag on page during file defragment")
Fixes: 4961acdd65c9 ("f2fs: fix to tag gcing flag on page during block migration")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index eaa39c50f782..56e27e305600 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2817,6 +2817,8 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 				goto clear_out;
 			}
 
+			f2fs_wait_on_page_writeback(page, DATA, true, true);
+
 			set_page_dirty(page);
 			set_page_private_gcing(page);
 			f2fs_put_page(page, 1);
@@ -4217,6 +4219,8 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
 		/* It will never fail, when page has pinned above */
 		f2fs_bug_on(F2FS_I_SB(inode), !page);
 
+		f2fs_wait_on_page_writeback(page, DATA, true, true);
+
 		set_page_dirty(page);
 		set_page_private_gcing(page);
 		f2fs_put_page(page, 1);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
