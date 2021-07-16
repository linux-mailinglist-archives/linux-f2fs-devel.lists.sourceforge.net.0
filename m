Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBE93CB8EB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jul 2021 16:41:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4P1X-0002ie-JT; Fri, 16 Jul 2021 14:41:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m4P1V-0002iM-MY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TTukNAX5mpaGstElgSRKRQ+UO+gcSFHLK04fSoGfZpw=; b=MVrl//Tc/JxyuM7VePuqEFZ46M
 JwOfpcCric/pSdQR90rVhTcEy1mHIC5abP6emn6ehacqa9CNI7rdLxducmVY1iWB1MLxV1TXZQbHA
 YLydMatY0f9dt1EIA1LuvXBETAzP0dtGh60eKCwJLDDouBOVtcYiJTLWBzft1LD0LMyQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TTukNAX5mpaGstElgSRKRQ+UO+gcSFHLK04fSoGfZpw=; b=d/jkKV2yRfsI9KM4CMci6rnzKJ
 Guz57fg/zovUt6D7oGN5dFBHu+WZtZh5B4sIWJXcPCnP6hylShcGuuoRiXHJU9L9MngdqdSYu+Nib
 xNOR3Y2+ZTKuqoFsS74XNAD1I8rp2uWkqtxEx4mqWSJvbTW9zkqtqrAO3DcOMO5Q1BVU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4P1P-0004en-GB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:41:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E5E961404;
 Fri, 16 Jul 2021 14:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626446447;
 bh=4AdX2bJE2x9cvVYUnKuR/I++uGU3+MB3vzYu6IeuHxU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NWTviJbOiFoyzawLrUv/ZDlPkFMqjbS2jQj/kfy836Lm4XqWN1iCc4t0zuGvypRX0
 CqoJBaXxKVtnmgOh+yZK5p8EDb+qBcjVM+yVqT7wfGVRwrjWoDZgdslqFMolA0W3wl
 So/fKNnnQp/1BH3nxhDa7b1huuHDdHSpsli0xqKqIoXXp2XYbF74Zbt2Eui4DyzQ4L
 bsN43hqSN5plYEoxEK4fsfy2lgXU1ueKv8KWDddaj74CxSAxk/NM8kX6kQ8oVh926f
 r3axRiPhuOfquS/SdgJ1lUoObJbYWNv/dMwjYLD/kU1+D8gkvZmWm+Lw+35J2yk4OC
 HBWN+KlJKdh9w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Fri, 16 Jul 2021 09:39:15 -0500
Message-Id: <20210716143919.44373-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716143919.44373-1-ebiggers@kernel.org>
References: <20210716143919.44373-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m4P1P-0004en-GB
Subject: [f2fs-dev] [PATCH 5/9] f2fs: fix the f2fs_file_write_iter tracepoint
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Satya Tangirala <satyaprateek2357@gmail.com>,
 Changheun Lee <nanich.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Pass in the original position and count rather than the position and
count that were updated by the write.  Also use the correct types for
all arguments, in particular the file offset which was being truncated
to 32 bits on 32-bit platforms.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c              |  5 +++--
 include/trace/events/f2fs.h | 12 ++++++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 878b2460f79b..279252c7f7bc 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4282,6 +4282,8 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file_inode(file);
+	const loff_t orig_pos = iocb->ki_pos;
+	const size_t orig_count = iov_iter_count(from);
 	loff_t target_size;
 	int preallocated;
 	ssize_t ret;
@@ -4363,8 +4365,7 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 out_unlock:
 	inode_unlock(inode);
 out:
-	trace_f2fs_file_write_iter(inode, iocb->ki_pos,
-					iov_iter_count(from), ret);
+	trace_f2fs_file_write_iter(inode, orig_pos, orig_count, ret);
 	if (ret > 0)
 		ret = generic_write_sync(iocb, ret);
 	return ret;
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 56b113e3cd6a..bffb38622e9b 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -540,17 +540,17 @@ TRACE_EVENT(f2fs_truncate_partial_nodes,
 
 TRACE_EVENT(f2fs_file_write_iter,
 
-	TP_PROTO(struct inode *inode, unsigned long offset,
-		unsigned long length, int ret),
+	TP_PROTO(struct inode *inode, loff_t offset, size_t length,
+		 ssize_t ret),
 
 	TP_ARGS(inode, offset, length, ret),
 
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
 		__field(ino_t,	ino)
-		__field(unsigned long, offset)
-		__field(unsigned long, length)
-		__field(int,	ret)
+		__field(loff_t, offset)
+		__field(size_t, length)
+		__field(ssize_t, ret)
 	),
 
 	TP_fast_assign(
@@ -562,7 +562,7 @@ TRACE_EVENT(f2fs_file_write_iter,
 	),
 
 	TP_printk("dev = (%d,%d), ino = %lu, "
-		"offset = %lu, length = %lu, written(err) = %d",
+		"offset = %lld, length = %zu, written(err) = %zd",
 		show_dev_ino(__entry),
 		__entry->offset,
 		__entry->length,
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
