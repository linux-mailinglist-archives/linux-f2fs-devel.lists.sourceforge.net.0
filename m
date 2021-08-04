Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E8D3DFA05
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Aug 2021 05:30:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mB7bZ-00074p-Nu; Wed, 04 Aug 2021 03:30:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mB7bY-00073k-A3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Aug 2021 03:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DlCU1AxqdAd3jnYXeqEMMuGVGtnmciswnrXealZc25c=; b=nNm+H/nFWbc+tuq167Cvdxd9K8
 PlqwHYVfY8zBhY0Xfx6gNReNqtCNMt7x0BKUFzugAS43FEpdkXkqRXLpWL0qh/ZFph9onSj+mOGgU
 o0OR67wCHyt9vYujbnK1NmNvgd65c3weHxN3gkeexASKCdIvtSkF0qXlmzYrK5+EnMnk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DlCU1AxqdAd3jnYXeqEMMuGVGtnmciswnrXealZc25c=; b=Y
 8J52RZ+jVE19FcpX5LODSKOc875T6VgiPftatAa/o+nT2J9rKI/6ibKrgE38NsUUv0xq9U2J1HwJD
 X2rHLbguCA1ljAjrpRCPWA8H7aXNlf3VuUQCi5eQ+noA5G6IT32S3BicHtB4DbzJmYF/oHyQXeJLv
 DI+zxuwpxYjlc4a4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mB7bV-00BfKZ-PK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Aug 2021 03:30:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01ACA61037;
 Wed,  4 Aug 2021 03:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628047791;
 bh=1iL1o2YZoGnWri3qeq+tQMAVLFgEuBeM6zTEgcD8x/0=;
 h=From:To:Cc:Subject:Date:From;
 b=BD4cCTnKHQ733Bo8SGheKl2MDcYfKXSpnoyI0seWn8Alagwcn3g+96Iz2Y28enleF
 NLlbvBJuabETpj8/cc2wf0aCJsYpE9g9UcUQX1ZrGcnSZXoLsRp31qcG7AaAQeNks+
 p1s4Gr4xqJnXWVb83WiAh4TDmGPjG+zkNL1JsNRXl1wQ402czpwtQKo/cjb2egTikC
 7hZsylN0GyKHbhLMeA67WL/GoO53ZUdpIK9nIcXx1UfbAsCPJUzXvNBdG/hgvsRZOp
 5AUAq0VjIzypOyD5oR0Zrl7yQMGXHB2ceZ94TH+FVRNw64pPM3w79PAfJInFf7p313
 Lkobbreq8o45g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed,  4 Aug 2021 11:29:46 +0800
Message-Id: <20210804032946.1416807-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mB7bV-00BfKZ-PK
Subject: [f2fs-dev] [PATCH v4] f2fs: reduce the scope of setting fsck tag
 when de->name_len is zero
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yangtao Li <frank.li@vivo.com>

I recently found a case where de->name_len is 0 in f2fs_fill_dentries()
easily reproduced, and finally set the fsck flag.

Thread A			Thread B
- f2fs_readdir
 - f2fs_read_inline_dir
  - ctx->pos = d.max
				- f2fs_add_dentry
				 - f2fs_add_inline_entry
				  - do_convert_inline_dir
				 - f2fs_add_regular_entry
- f2fs_readdir
 - f2fs_fill_dentries
  - set_sbi_flag(sbi, SBI_NEED_FSCK)

Process A opens the folder, and has been reading without closing it.
During this period, Process B created a file under the folder (occupying
multiple f2fs_dir_entry, exceeding the d.max of the inline dir). After
creation, process A uses the d.max of inline dir to read it again, and
it will read that de->name_len is 0.

And Chao pointed out that w/o inline conversion, the race condition still
can happen as below:

dir_entry1: A
dir_entry2: B
dir_entry3: C
free slot: _
ctx->pos: ^

Thread A is traversing directory,
ctx-pos moves to below position after readdir() by thread A:
AAAABBBB___
        ^

Then thread B delete dir_entry2, and create dir_entry3.

Thread A calls readdir() to lookup dirents starting from middle
of new dirent slots as below:
AAAACCCCCC_
        ^
In these scenarios, the file system is not damaged, and it's hard to
avoid it. But we can bypass tagging FSCK flag if:
a) bit_pos (:= ctx->pos % d->max) is non-zero and
b) before bit_pos moves to first valid dir_entry.

Fixes: ddf06b753a85 ("f2fs: fix to trigger fsck if dirent.name_len is zero")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
[Chao: clean up description]
Reviewed-by: Chao Yu <chao@kernel.org>
---
v4:
- clean up description a bit
- fix code style issue
 fs/f2fs/dir.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-) 
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 456651682daf..c250bf46ef5e 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -1000,6 +1000,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(d->inode);
 	struct blk_plug plug;
 	bool readdir_ra = sbi->readdir_ra == 1;
+	bool found_valid_dirent = false;
 	int err = 0;
 
 	bit_pos = ((unsigned long)ctx->pos % d->max);
@@ -1014,13 +1015,15 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 
 		de = &d->dentry[bit_pos];
 		if (de->name_len == 0) {
+			if (found_valid_dirent || !bit_pos) {
+				printk_ratelimited(
+					"%sF2FS-fs (%s): invalid namelen(0), ino:%u, run fsck to fix.",
+					KERN_WARNING, sbi->sb->s_id,
+					le32_to_cpu(de->ino));
+				set_sbi_flag(sbi, SBI_NEED_FSCK);
+			}
 			bit_pos++;
 			ctx->pos = start_pos + bit_pos;
-			printk_ratelimited(
-				"%sF2FS-fs (%s): invalid namelen(0), ino:%u, run fsck to fix.",
-				KERN_WARNING, sbi->sb->s_id,
-				le32_to_cpu(de->ino));
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			continue;
 		}
 
@@ -1063,6 +1066,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 			f2fs_ra_node_page(sbi, le32_to_cpu(de->ino));
 
 		ctx->pos = start_pos + bit_pos;
+		found_valid_dirent = true;
 	}
 out:
 	if (readdir_ra)
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
