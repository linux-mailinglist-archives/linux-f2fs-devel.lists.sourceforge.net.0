Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6326F749B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 May 2023 21:52:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puezl-0004Pn-Dk;
	Thu, 04 May 2023 19:52:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1puezk-0004Ph-6P
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 19:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z1KvI3f7Npsoc8Pg3lL/Sfst/b3/RZi9HZ31MPItIZg=; b=nCCzCySonk5QrJnfrrCSPwMDIs
 uzXGBs5bzzBoYPBP9Q0BUF8Z7pFHxx5yIc8XXb33Fb/FOvJTojy0jiGvFX/dkLDSD7TKUFIQDCH+c
 e2kznk7LlmiLnUMcmxSPY41pey1hozkx0P6i6Qq4bEiI7WH0RS1eRumu2V/H6VTiHMmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z1KvI3f7Npsoc8Pg3lL/Sfst/b3/RZi9HZ31MPItIZg=; b=JWgEPA94lecnqb9ZINhStJNlMK
 LCBUZHyzjv0v3nS3ZvDnbsTx0mJSLT4b0MGXzkVpM85h7P817gVmxKFf5ULYfX5lQC2atkAB6boG1
 On6fHZVePD1tpwK2xOrTVv1RslUmIrea61euXFCsVFEjug8UWNM5980Dn198kFN0n9a8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puezk-00EKye-EV for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 19:52:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1664763888
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  4 May 2023 19:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F393C4339B;
 Thu,  4 May 2023 19:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683229918;
 bh=7tGG+NOlssfu/NITwNH5Vwr/UrNSkYrA8md/wSgniNg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e5jOnoINVrRgTNCga6MqeQ8HW3myP6CLY83kgjFSx9EOGTtGXOFUf9SBrc0O5vPvg
 qxIFgw13ZmgEOfCplzxCV/nrpJxEERjgUeAdW7n2IwowZA8D5ZGZLEGS4rbauPcN6l
 /JKuW5qFGcIwEyBs7hO30tEQYZo9+KOQOKg9KEecBB9cxH33scS2VcjDv2xIUaWOHE
 2KNnTxQisczejPtnVPgRcDBehM56OYUwEY5EqFfgUsi8c+fOGcs+7rYK7ufIM1R5b/
 4dO3Uu4kyxrAtdSHgr/wxkkhQsRNIS4dexLkPTC5TtMNwSSY/5AOB2548lzzyn0tny
 2z8I1vt4hy9fQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  4 May 2023 15:51:28 -0400
Message-Id: <20230504195132.3808946-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504195132.3808946-1-sashal@kernel.org>
References: <20230504195132.3808946-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 c9b3649a934d131151111354bcbb638076f03a30
 ] xfstest generic/361 reports a bug as below: 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puezk-00EKye-EV
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 11/13] f2fs: fix to drop all dirty
 pages during umount() if cp_error is set
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit c9b3649a934d131151111354bcbb638076f03a30 ]

xfstest generic/361 reports a bug as below:

f2fs_bug_on(sbi, sbi->fsync_node_num);

kernel BUG at fs/f2fs/super.c:1627!
RIP: 0010:f2fs_put_super+0x3a8/0x3b0
Call Trace:
 generic_shutdown_super+0x8c/0x1b0
 kill_block_super+0x2b/0x60
 kill_f2fs_super+0x87/0x110
 deactivate_locked_super+0x39/0x80
 deactivate_super+0x46/0x50
 cleanup_mnt+0x109/0x170
 __cleanup_mnt+0x16/0x20
 task_work_run+0x65/0xa0
 exit_to_user_mode_prepare+0x175/0x190
 syscall_exit_to_user_mode+0x25/0x50
 do_syscall_64+0x4c/0x90
 entry_SYSCALL_64_after_hwframe+0x72/0xdc

During umount(), if cp_error is set, f2fs_wait_on_all_pages() should
not stop waiting all F2FS_WB_CP_DATA pages to be writebacked, otherwise,
fsync_node_num can be non-zero after f2fs_wait_on_all_pages() causing
this bug.

In this case, to avoid deadloop in f2fs_wait_on_all_pages(), it needs
to drop all dirty pages rather than redirtying them.

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/checkpoint.c | 12 ++++++++++--
 fs/f2fs/data.c       |  3 ++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index a563de5ccd217..621e0d4f1fbf5 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -273,8 +273,15 @@ static int __f2fs_write_meta_page(struct page *page,
 
 	trace_f2fs_writepage(page, META);
 
-	if (unlikely(f2fs_cp_error(sbi)))
+	if (unlikely(f2fs_cp_error(sbi))) {
+		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
+			ClearPageUptodate(page);
+			dec_page_count(sbi, F2FS_DIRTY_META);
+			unlock_page(page);
+			return 0;
+		}
 		goto redirty_out;
+	}
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		goto redirty_out;
 	if (wbc->for_reclaim && page->index < GET_SUM_BLOCK(sbi, 0))
@@ -1185,7 +1192,8 @@ void f2fs_wait_on_all_pages_writeback(struct f2fs_sb_info *sbi)
 		if (!get_pages(sbi, F2FS_WB_CP_DATA))
 			break;
 
-		if (unlikely(f2fs_cp_error(sbi)))
+		if (unlikely(f2fs_cp_error(sbi) &&
+			!is_sbi_flag_set(sbi, SBI_IS_CLOSE)))
 			break;
 
 		io_schedule_timeout(5*HZ);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 56b2dadd623b2..419586809cef6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1885,7 +1885,8 @@ static int __write_data_page(struct page *page, bool *submitted,
 		 * don't drop any dirty dentry pages for keeping lastest
 		 * directory structure.
 		 */
-		if (S_ISDIR(inode->i_mode))
+		if (S_ISDIR(inode->i_mode) &&
+				!is_sbi_flag_set(sbi, SBI_IS_CLOSE))
 			goto redirty_out;
 		goto out;
 	}
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
