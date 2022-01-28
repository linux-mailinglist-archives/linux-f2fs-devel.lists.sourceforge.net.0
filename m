Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2419249F08A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jan 2022 02:28:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nDG3T-0008Ot-9J; Fri, 28 Jan 2022 01:27:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nDG3R-0008Ok-Nv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 01:27:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CYhmosdZALATfJX3+TnpfY8eUYaCmqxDWxFJS8Ol4gc=; b=J4au1AneqMhVkaB0neVzjX+Otz
 3TIWx8TCyenxJZ7OI0P5haN7kHrEOaH4mKEbBDmTKT67nsbyjJ4kI/aMwqquFHBfkDvrceZMLZm/d
 EV4GgkcPvztImIOT8AcHna4Cu2vqfwtVSd2A+wBnnFspL0rYw7beBOcoqfIEjYOYp6eE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CYhmosdZALATfJX3+TnpfY8eUYaCmqxDWxFJS8Ol4gc=; b=ZcehuUf6sSBaiPa+/VE9puSFcD
 ZHMwotqL58I4yc+PLQIfhBWDhemTrboUV97jqIdMahYL8FzKTxZUFOBw1t1r5G5BTiQUEjDQPBLVa
 vwA2JggUjnmrBuOosX2PO2QcjA9q04OVg4Ab70ICQeIzArCpvKAbvMGQvyXwknnnKEkA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nDG3P-00037U-Eu
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 01:27:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8C1861D9B;
 Fri, 28 Jan 2022 01:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E36C340E4;
 Fri, 28 Jan 2022 01:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643333263;
 bh=1DLj8KHTHp8d5WdiUPuZOplV4Q5vuq4iZQ+JC0nHJ2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sifa83s71AP+NEqGPXQ/5S92TYI3+oItVpDEaB/zM4U7IG/Phqxl7cKbkNTJMCcdM
 bf///GlSxnROcERpWqOJnBvLcEP8+e3lzDeKQqcmZ/oJD1Qb71s+egXTZ208pOABI/
 1ISVx27fNyNNEZ9DW/iPyLY1kzgw+HmRiGu0SsshajEzgLlW4n7gBCh+2fg9TR31Iy
 COwN/6oumyYRY/WJcIb1/4aEMsCAekeXJa2V806YdfIaZOgwmVd2vQ6VivQad+AtRE
 oOcOafl34matWgXYicLVuS/pcR46n+6v3OMDvqbEl6vWVFuCfyIfLi+xNUmB50k+at
 Mloh98egdQ82Q==
Date: Thu, 27 Jan 2022 17:27:40 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: NeilBrown <neilb@suse.de>
Message-ID: <YfNGjMZWrlJURRuR@google.com>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
 <164325158957.29787.2116312603613564596.stgit@noble.brown>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <164325158957.29787.2116312603613564596.stgit@noble.brown>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: I saw some missing cases. Could you please consider this
 instead? And,
 please fix "f2f2:" to "f2fs:". --- fs/f2fs/compress.c | 4 +--- fs/f2fs/data.c
 | 13 ++++++------- fs/f2fs/f2fs.h | 6 ++++++ fs/f2fs/segment.c | 8 +++-----
 fs/f2fs/super.c | 6 ++---- 5 files changed, 18 insertions(+), 19 deletions(-)
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nDG3P-00037U-Eu
Subject: Re: [f2fs-dev] [PATCH 4/9] f2f2: replace some congestion_wait()
 calls with io_schedule_timeout()
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, drbd-dev@lists.linbit.com,
 Paolo Valente <paolo.valente@linaro.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 linux-block@vger.kernel.org, linux-nilfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jeff Layton <jlayton@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I saw some missing cases. Could you please consider this instead?
And, please fix "f2f2:" to "f2fs:".

---
 fs/f2fs/compress.c |  4 +---
 fs/f2fs/data.c     | 13 ++++++-------
 fs/f2fs/f2fs.h     |  6 ++++++
 fs/f2fs/segment.c  |  8 +++-----
 fs/f2fs/super.c    |  6 ++----
 5 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 67bac2792e57..6b22d407a4a4 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1505,9 +1505,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 				if (IS_NOQUOTA(cc->inode))
 					return 0;
 				ret = 0;
-				cond_resched();
-				congestion_wait(BLK_RW_ASYNC,
-						DEFAULT_IO_TIMEOUT);
+				f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 				goto retry_write;
 			}
 			return ret;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0f124e8de1d4..c9285c88cb85 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3046,13 +3046,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					goto next;
 				} else if (ret == -EAGAIN) {
 					ret = 0;
-					if (wbc->sync_mode == WB_SYNC_ALL) {
-						cond_resched();
-						congestion_wait(BLK_RW_ASYNC,
-							DEFAULT_IO_TIMEOUT);
-						goto retry_write;
-					}
-					goto next;
+					if (wbc->sync_mode != WB_SYNC_ALL)
+						goto next;
+
+					f2fs_io_schedule_timeout(
+						DEFAULT_IO_TIMEOUT);
+					goto retry_write;
 				}
 				done_index = page->index + 1;
 				done = 1;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6ddb98ff0b7c..dbd650a5a8fc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4501,6 +4501,12 @@ static inline bool f2fs_block_unit_discard(struct f2fs_sb_info *sbi)
 	return F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK;
 }
 
+static inline void f2fs_io_schedule_timeout(long timeout)
+{
+	set_current_state(TASK_UNINTERRUPTIBLE);
+	io_schedule_timeout(timeout);
+}
+
 #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
 #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 56211e201d51..885b27d7e491 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -313,8 +313,7 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi, bool gc_failure)
 skip:
 		iput(inode);
 	}
-	congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
-	cond_resched();
+	f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 	if (gc_failure) {
 		if (++looped >= count)
 			return;
@@ -803,8 +802,7 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi)
 		do {
 			ret = __submit_flush_wait(sbi, FDEV(i).bdev);
 			if (ret)
-				congestion_wait(BLK_RW_ASYNC,
-						DEFAULT_IO_TIMEOUT);
+				f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 		} while (ret && --count);
 
 		if (ret) {
@@ -3137,7 +3135,7 @@ static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
 			blk_finish_plug(&plug);
 			mutex_unlock(&dcc->cmd_lock);
 			trimmed += __wait_all_discard_cmd(sbi, NULL);
-			congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+			f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 			goto next;
 		}
 skip:
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9af6c20532ec..f484a839fc52 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2135,8 +2135,7 @@ static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 	/* we should flush all the data to keep data consistency */
 	do {
 		sync_inodes_sb(sbi->sb);
-		cond_resched();
-		congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+		f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 	} while (get_pages(sbi, F2FS_DIRTY_DATA) && retry--);
 
 	if (unlikely(retry < 0))
@@ -2504,8 +2503,7 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 							&page, &fsdata);
 		if (unlikely(err)) {
 			if (err == -ENOMEM) {
-				congestion_wait(BLK_RW_ASYNC,
-						DEFAULT_IO_TIMEOUT);
+				f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 				goto retry;
 			}
 			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
-- 
2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
