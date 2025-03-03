Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A47BEA4B676
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 04:24:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1towPp-0003os-Tr;
	Mon, 03 Mar 2025 03:24:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1towPo-0003oj-Je
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SPaEFBOc6ReKDEztQBArwXm2fAZvxk2aZ7JGRWxo4/4=; b=P9L5comGJjbt09WOCFcGykSw0p
 abEzslled28dWOCD1eHKgKfTyUJCYv1r1iGGyJ5h8ViEr9H4xVLPnRAWAAUGrXIlde/U9motUy8gM
 8vF5sFKS7kHEXEJHXwZFP0qXJCQ0DXGCIsBV6FOq6CRpXXgaGscwPCTsJOc86vAcdnKw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SPaEFBOc6ReKDEztQBArwXm2fAZvxk2aZ7JGRWxo4/4=; b=m
 8T6xZLy/ErAsnHvBJx3JJIZ1yu6Y83AfP5e4pvj82v8y8fuBD4YCqog+fVdwdUeCTOg5Re7PAfIhx
 x/fREtiB0IIWQcQZrdQ+VRXgTQtCcvIY48OYE2U0+n7swENM8OgSo3BMmYDtgz2CC5g0fnBMD3l8j
 X9RK+gKESQdL0a14=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1towPj-0005ZV-CG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:24:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 287975C5422;
 Mon,  3 Mar 2025 03:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40B9C4CED6;
 Mon,  3 Mar 2025 03:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740972248;
 bh=RB8f6v1FChOFx3oTiK9roU5+20gBklSvWNyNHoGVju4=;
 h=From:To:Cc:Subject:Date:From;
 b=VM6JpyElOBLl2jwsohZHzQmfDKiugxIRGBK2jUeETXUOwLFXwf41KVd/xGQC2NDGz
 gkNhVKuuqY+LLysDXo7ojkX3LtwXbW7vAy0F/3zaIvvcgcImRyQGi9IbmZw6kBx6qc
 l/M4enfHdXEuezwfslqXJ8EqhpI/N0d4ztqqLdpNtbP7YVbkeDZkY9ySfXoLrZieXq
 P0Ub65CilqHwtVC9GAVa/mLCdEWZSbpjn0R7bKQasc/k46/546dNApBJJCSoS3ugQi
 Q68TFUDuGp1S3NO7UWq/HWkda5X5Qx2f8GQSr4MIp+S4C3gSkA1cuEl0mYM/2qb1iU
 406wkj5jA60mw==
To: jaegeuk@kernel.org
Date: Mon,  3 Mar 2025 11:23:29 +0800
Message-ID: <20250303032329.1309786-1-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Jan Prusakowski reported a kernel hang issue as below: When
 running xfstests on linux-next kernel (6.14.0-rc3, 6.12) I encountered a
 problem in generic/475 test where fsstress process gets blocked in
 __f2fs_write_data_pages() and the test hangs. The optio [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1towPj-0005ZV-CG
Subject: [f2fs-dev] [PATCH] f2fs: fix potential deadloop in
 prepare_compress_overwrite()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Jan Prusakowski <jprusakowski@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jan Prusakowski reported a kernel hang issue as below:

When running xfstests on linux-next kernel (6.14.0-rc3, 6.12) I
encountered a problem in generic/475 test where fsstress process
gets blocked in __f2fs_write_data_pages() and the test hangs.
The options I used are:

MKFS_OPTIONS  -- -O compression -O extra_attr -O project_quota -O quota /dev/vdc
MOUNT_OPTIONS -- -o acl,user_xattr -o discard,compress_extension=* /dev/vdc /vdc

INFO: task kworker/u8:0:11 blocked for more than 122 seconds.
      Not tainted 6.14.0-rc3-xfstests-lockdep #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:0    state:D stack:0     pid:11    tgid:11    ppid:2      task_flags:0x4208160 flags:0x00004000
Workqueue: writeback wb_workfn (flush-253:0)
Call Trace:
 <TASK>
 __schedule+0x309/0x8e0
 schedule+0x3a/0x100
 schedule_preempt_disabled+0x15/0x30
 __mutex_lock+0x59a/0xdb0
 __f2fs_write_data_pages+0x3ac/0x400
 do_writepages+0xe8/0x290
 __writeback_single_inode+0x5c/0x360
 writeback_sb_inodes+0x22f/0x570
 wb_writeback+0xb0/0x410
 wb_do_writeback+0x47/0x2f0
 wb_workfn+0x5a/0x1c0
 process_one_work+0x223/0x5b0
 worker_thread+0x1d5/0x3c0
 kthread+0xfd/0x230
 ret_from_fork+0x31/0x50
 ret_from_fork_asm+0x1a/0x30
 </TASK>

The root cause is: once generic/475 starts toload error table to dm
device, f2fs_prepare_compress_overwrite() will loop reading compressed
cluster pages due to IO error, meanwhile it has held .writepages lock,
it can block all other writeback tasks.

Let's fix this issue w/ below changes:
- add f2fs_handle_page_eio() in prepare_compress_overwrite() to
detect IO error.
- detect cp_error earler in f2fs_read_multi_pages().

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Reported-by: Jan Prusakowski <jprusakowski@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c |  1 +
 fs/f2fs/data.c     | 10 ++++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 985690d81a82..9b94810675c1 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1150,6 +1150,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 		f2fs_compress_ctx_add_page(cc, page_folio(page));
 
 		if (!PageUptodate(page)) {
+			f2fs_handle_page_eio(sbi, page_folio(page), DATA);
 release_and_retry:
 			f2fs_put_rpages(cc);
 			f2fs_unlock_rpages(cc, i + 1);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f1554a5a3d7a..09437dbd1b42 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2190,6 +2190,12 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	int i;
 	int ret = 0;
 
+	if (unlikely(f2fs_cp_error(sbi))) {
+		ret = -EIO;
+		from_dnode = false;
+		goto out_put_dnode;
+	}
+
 	f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
 
 	last_block_in_file = F2FS_BYTES_TO_BLK(f2fs_readpage_limit(inode) +
@@ -2233,10 +2239,6 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	if (ret)
 		goto out;
 
-	if (unlikely(f2fs_cp_error(sbi))) {
-		ret = -EIO;
-		goto out_put_dnode;
-	}
 	f2fs_bug_on(sbi, dn.data_blkaddr != COMPRESS_ADDR);
 
 skip_reading_dnode:
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
