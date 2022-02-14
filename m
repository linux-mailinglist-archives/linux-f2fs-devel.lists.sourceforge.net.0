Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 535214B5E3A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Feb 2022 00:27:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nJkkh-0002gA-4x; Mon, 14 Feb 2022 23:27:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nJkkg-0002g4-2C
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Feb 2022 23:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9IIx0LQWr081jNj7HmwL8Hmd1S086L+PZITp/22IHdk=; b=dQNxwpgXIiSbwH/W/WTtRFgtlu
 BzRVGkNQVd2R/ErAetf/FUq3YVdX14ajjC9nY4OaXqcsHajt5m4vXYyBgM+mepHvIq6Kf0C0utQ6l
 utZ68F7zPv/89QD/2uppRmyNmrcIsf3Ai4DY2kyP17pyso4WHrdXm+Cuv7y3rbYqqW+U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9IIx0LQWr081jNj7HmwL8Hmd1S086L+PZITp/22IHdk=; b=C/0YjoGJ21Q1MSeGfPkXX3g5Sb
 z2mKvJ5XfkyYh06y5+XjjQCNoGM2kZkT2BWyGejACi0qn2CvkRt1X1PVraWbUtFPnsf2Tl07W7NS4
 Fo1LOcQzjnc1vYrQo9x5p2vqZhQbFj8q6/BZ77hIxEWXfIFx+Hfq2cFJ05gRx5bHTQJI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nJkkc-0026FQ-SD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Feb 2022 23:27:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74AB06151E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Feb 2022 23:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8FEC340E9;
 Mon, 14 Feb 2022 23:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644881236;
 bh=1rUwvY875LcPgPbddOenVKZ0pqUKLLYVQWdprK8vuL4=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=sg5q9SmFqYCq11rnUvanZEhYF70xWXNghcej86iEvOPdn/vYIFSdX+F6od7INs+Gq
 8yCRumER+hZcvhojrZdS4vcXR3dY5YpuK92+RCfHXcC2XtqAToa9lg67NjItD+Bbh4
 ZZ6FeRyXnVykXry3LI0jGIo4j1vw35m5888XL11OicovXysXJUyqkYttapcRRKQZ2B
 GNaW3VI0NCQmoPYvQArKiJ7GZbbpHi0i/tFJFnI03PEYDjfO37Uw/AwBNtfNcYNjuw
 /oHTirlYJ+lLOxohfuZYSpjds1bRqH6oYxHDHglCz7sESUEMCtTDYwBEubm28X4nUT
 fFRE7svXBU6Dw==
Date: Mon, 14 Feb 2022 15:27:15 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YgrlUzJyvgrFSREc@google.com>
References: <20220212142023.2508247-1-jaegeuk@kernel.org>
 <20220212142023.2508247-2-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220212142023.2508247-2-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If one read IO is always failing,
 we can fall into an infinite
 loop in f2fs_sync_dirty_inodes. This happens during xfstests/generic/475.
 [ 142.803335] Buffer I/O error on dev dm-1, logical block 8388592, async
 page read ... [ 382.887210] submit_bio_noacct+0xdd/0x2a0 [ 382.887213]
 submit_bio+0x80/0x110 [ 382.887223] __submit_bio+0x4d/0x [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nJkkc-0026FQ-SD
Subject: Re: [f2fs-dev] [PATCH 2/2 v2] f2fs: avoid an infinite loop in
 f2fs_sync_dirty_inodes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If one read IO is always failing, we can fall into an infinite loop in
f2fs_sync_dirty_inodes. This happens during xfstests/generic/475.

[  142.803335] Buffer I/O error on dev dm-1, logical block 8388592, async page read
...
[  382.887210]  submit_bio_noacct+0xdd/0x2a0
[  382.887213]  submit_bio+0x80/0x110
[  382.887223]  __submit_bio+0x4d/0x300 [f2fs]
[  382.887282]  f2fs_submit_page_bio+0x125/0x200 [f2fs]
[  382.887299]  __get_meta_page+0xc9/0x280 [f2fs]
[  382.887315]  f2fs_get_meta_page+0x13/0x20 [f2fs]
[  382.887331]  f2fs_get_node_info+0x317/0x3c0 [f2fs]
[  382.887350]  f2fs_do_write_data_page+0x327/0x6f0 [f2fs]
[  382.887367]  f2fs_write_single_data_page+0x5b7/0x960 [f2fs]
[  382.887386]  f2fs_write_cache_pages+0x302/0x890 [f2fs]
[  382.887405]  ? preempt_count_add+0x7a/0xc0
[  382.887408]  f2fs_write_data_pages+0xfd/0x320 [f2fs]
[  382.887425]  ? _raw_spin_unlock+0x1a/0x30
[  382.887428]  do_writepages+0xd3/0x1d0
[  382.887432]  filemap_fdatawrite_wbc+0x69/0x90
[  382.887434]  filemap_fdatawrite+0x50/0x70
[  382.887437]  f2fs_sync_dirty_inodes+0xa4/0x270 [f2fs]
[  382.887453]  f2fs_write_checkpoint+0x189/0x1640 [f2fs]
[  382.887469]  ? schedule_timeout+0x114/0x150
[  382.887471]  ? ttwu_do_activate+0x6d/0xb0
[  382.887473]  ? preempt_count_add+0x7a/0xc0
[  382.887476]  kill_f2fs_super+0xca/0x100 [f2fs]
[  382.887491]  deactivate_locked_super+0x35/0xa0
[  382.887494]  deactivate_super+0x40/0x50
[  382.887497]  cleanup_mnt+0x139/0x190
[  382.887499]  __cleanup_mnt+0x12/0x20
[  382.887501]  task_work_run+0x64/0xa0
[  382.887505]  exit_to_user_mode_prepare+0x1b7/0x1c0
[  382.887508]  syscall_exit_to_user_mode+0x27/0x50
[  382.887510]  do_syscall_64+0x48/0xc0
[  382.887513]  entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Change log from v1:
  - fix a regression to report EIO too early

 fs/f2fs/checkpoint.c | 13 ++++++++-----
 fs/f2fs/f2fs.h       |  3 +++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 203a1577942d..56c81c68ef71 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1059,13 +1059,13 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type)
 	struct inode *inode;
 	struct f2fs_inode_info *fi;
 	bool is_dir = (type == DIR_INODE);
-	unsigned long ino = 0;
+	unsigned long ino = 0, retry_count = DEFAULT_RETRY_SYNC_DIR_COUNT;
 
 	trace_f2fs_sync_dirty_inodes_enter(sbi->sb, is_dir,
 				get_pages(sbi, is_dir ?
 				F2FS_DIRTY_DENTS : F2FS_DIRTY_DATA));
 retry:
-	if (unlikely(f2fs_cp_error(sbi))) {
+	if (unlikely(f2fs_cp_error(sbi) || (is_dir && !retry_count))) {
 		trace_f2fs_sync_dirty_inodes_exit(sbi->sb, is_dir,
 				get_pages(sbi, is_dir ?
 				F2FS_DIRTY_DENTS : F2FS_DIRTY_DATA));
@@ -1096,10 +1096,13 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type)
 
 		iput(inode);
 		/* We need to give cpu to another writers. */
-		if (ino == cur_ino)
-			cond_resched();
-		else
+		if (ino == cur_ino) {
+			retry_count--;
+			io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+		} else {
+			retry_count = DEFAULT_RETRY_SYNC_DIR_COUNT;
 			ino = cur_ino;
+		}
 	} else {
 		/*
 		 * We should submit bio, since it exists several
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c9515c3c54fd..f40ef7b61965 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -577,6 +577,9 @@ enum {
 /* maximum retry quota flush count */
 #define DEFAULT_RETRY_QUOTA_FLUSH_COUNT		8
 
+/* maximum retry sync dirty inodes */
+#define DEFAULT_RETRY_SYNC_DIR_COUNT	3000
+
 #define F2FS_LINK_MAX	0xffffffff	/* maximum link count per file */
 
 #define MAX_DIR_RA_PAGES	4	/* maximum ra pages of dir */
-- 
2.35.1.265.g69c8d7142f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
