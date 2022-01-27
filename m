Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CC049D84E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jan 2022 03:48:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nCupe-0002eM-S2; Thu, 27 Jan 2022 02:48:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nCupd-0002dY-IT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 02:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VLryoRKmUuPESAB8QyVLfrgvCJTCmPKkdu4P/OX5YBg=; b=Pre9JlltW7vWV/joTLYxxf4eHw
 lTOHr7t82hwJI+te6rltOVj3x42LM/1revoiasMbvlWkdvm0oUzPEGaKuLh8QPXOCHJYZs2+bXxOv
 Sc6MzK5TN3jv9vHq7nUzmwTK2bazdzfnuZiaCdru4CSJi/TzgCr4PJgg5+nevcaRYl5k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VLryoRKmUuPESAB8QyVLfrgvCJTCmPKkdu4P/OX5YBg=; b=P7BhJb24Pk6VCkIRcZWycGfClY
 HE5XFbVN30AqQq5ubc5Ky0JcSbPIMkGoeh6hcEUTSZO7nsfxSTDkJ6QACOP3d9G+jJwW9vBzmb1Cw
 7/Wf6DS/2VumQOyj7hCYEmYBEUCOIXVPzpiUOiiF2vVGnKjcBEa30OZa6eewR0SntEro=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1nCupb-00FTPs-KJ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 02:48:16 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6B0A521959;
 Thu, 27 Jan 2022 02:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643251689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLryoRKmUuPESAB8QyVLfrgvCJTCmPKkdu4P/OX5YBg=;
 b=Qti4P3eej7SwU9djhiMhUMgJ1ckOKm8O/J1pSaUAEHDRhQb1izQ4dQZrO97++mAvn3WVVr
 T2k2nCp5oMqLD8x4f8vee6NJClS2lg1UPexxPkHMg0zJIBN6c452+a+u50wURMgo/tIfRv
 rD3QIr1LCF3psUh7SWng5ZjcDzYoDdQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643251689;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLryoRKmUuPESAB8QyVLfrgvCJTCmPKkdu4P/OX5YBg=;
 b=uJ63TZZVZJQxUDYCfYcbm2ZGgBe9Q6Vwcu+8BWf/uQNpUEqXNKCc6PHt7MlRhE+A1sBtn6
 UgWYWcQsDNRd9WCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E9B1C13E46;
 Thu, 27 Jan 2022 02:47:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8ZsrKd4H8mH6KwAAMHmgww
 (envelope-from <neilb@suse.de>); Thu, 27 Jan 2022 02:47:58 +0000
From: NeilBrown <neilb@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Jan 2022 13:46:29 +1100
Message-ID: <164325158957.29787.2116312603613564596.stgit@noble.brown>
In-Reply-To: <164325106958.29787.4865219843242892726.stgit@noble.brown>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As congestion is no longer tracked,
 contestion_wait() is effectively
 equivalent to io_schedule_timeout(). It isn't clear to me what these
 contestion_wait()
 calls are waiting for, so I cannot change th [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nCupb-00FTPs-KJ
Subject: [f2fs-dev] [PATCH 4/9] f2f2: replace some congestion_wait() calls
 with io_schedule_timeout()
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
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As congestion is no longer tracked, contestion_wait() is effectively
equivalent to io_schedule_timeout().
It isn't clear to me what these contestion_wait() calls are waiting
for, so I cannot change them to wait for some particular event.
So simply change them to io_schedule_timeout(), which will have
exactly the same behaviour.

Signed-off-by: NeilBrown <neilb@suse.de>
---
 fs/f2fs/segment.c |   14 ++++++++------
 fs/f2fs/super.c   |    8 ++++----
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1dabc8244083..78e3fbc24e77 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -313,8 +313,8 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi, bool gc_failure)
 skip:
 		iput(inode);
 	}
-	congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
-	cond_resched();
+	set_current_state(TASK_UNINTERRUPTIBLE);
+	io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 	if (gc_failure) {
 		if (++looped >= count)
 			return;
@@ -802,9 +802,10 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi)
 
 		do {
 			ret = __submit_flush_wait(sbi, FDEV(i).bdev);
-			if (ret)
-				congestion_wait(BLK_RW_ASYNC,
-						DEFAULT_IO_TIMEOUT);
+			if (ret) {
+				set_current_state(TASK_UNINTERRUPTIBLE);
+				io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+			}
 		} while (ret && --count);
 
 		if (ret) {
@@ -3133,7 +3134,8 @@ static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
 			blk_finish_plug(&plug);
 			mutex_unlock(&dcc->cmd_lock);
 			trimmed += __wait_all_discard_cmd(sbi, NULL);
-			congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+			set_current_state(TASK_UNINTERRUPTIBLE);
+			io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 			goto next;
 		}
 skip:
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 76e6a3df9aba..ae8dcbb71596 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2135,8 +2135,8 @@ static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 	/* we should flush all the data to keep data consistency */
 	do {
 		sync_inodes_sb(sbi->sb);
-		cond_resched();
-		congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 	} while (get_pages(sbi, F2FS_DIRTY_DATA) && retry--);
 
 	if (unlikely(retry < 0))
@@ -2504,8 +2504,8 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 							&page, &fsdata);
 		if (unlikely(err)) {
 			if (err == -ENOMEM) {
-				congestion_wait(BLK_RW_ASYNC,
-						DEFAULT_IO_TIMEOUT);
+				set_current_state(TASK_UNINTERRUPTIBLE);
+				io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 				goto retry;
 			}
 			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
