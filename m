Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E774E32A7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Mar 2022 23:33:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWQaj-0001NG-1a; Mon, 21 Mar 2022 22:33:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nWQah-0001NA-PJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Mar 2022 22:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7qks1Y9da7JNFOX2vCMperCcV+OxEPpXUFUm/0eWTXY=; b=jgWW3Vm+DA+oQ3YqlbEolVXTSC
 q5U67AdTG32Y+Oar+R08SbMhLD/sNyCAGtv7EI2oxD1MlUgFEH2n+wrqmQ4W5MuUMriraWpbFEe6k
 Ar5RloUgEC/9F1AlmKKgeYQgEfIHqxrkTS9FfI/gQwgY14n1gZCZnymMqY8dmnbt03rM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7qks1Y9da7JNFOX2vCMperCcV+OxEPpXUFUm/0eWTXY=; b=a
 tXR3jNw2KcoUBYn7g/BL1Z7oJYDOo0Z53LZKUcNGlgjZXjOEAmEAM4JAfL6V3Xmi9BUGF/8IUV2kY
 7eepBvD31AFUSy8uWAleI3Y2GBlESwJ/qh0hyho18jS9ZKcjWLn9PtL6kMq4cr9tdJgdedu1lmHFa
 vF/qJvVHLs+Og924=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nWQae-0003LI-9j
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Mar 2022 22:33:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A3B961015
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Mar 2022 22:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C76C340E8;
 Mon, 21 Mar 2022 22:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647901997;
 bh=ZfsJa7KwB3etBDc/tSAcSW1LlMyxyzZu1Ck9qqHzboc=;
 h=From:To:Cc:Subject:Date:From;
 b=LgJWbODpxmSVsetElElfC/COlJBgeTo7bxwaViVtkvnY/BwCIctf0l/aPBfz3I8kf
 5/1Z/YkdPpEyfnE8am3xhYnTN7Fm6FhzU+76JOs6+DMU2BTGqmf4PNN7WNmmeJX1Mp
 FxsqcfhYnzRPEqI9yIXLI9egH6NzufNRZzXBytJy4GwBNcof4E9mp4l+ZW3HaStmY1
 yqxX7NhNGleknK7FbhCFZ5IX6gvIojmO1h+5RJEMxNKsZvhFdJ1tTVy9cJAA8mQxDP
 eWkjmvWxlQJpv8+gvSd7t0J/Ye2KUZvhL/OdOmAEPWRpCrwKtt7/0nowQTL0QOw0V1
 Cj1xzY+48+QZQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 21 Mar 2022 15:33:15 -0700
Message-Id: <20220321223315.3228326-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This was used in Android for a long time. Let's upstream it.
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/f2fs.h | 29
 ++++++++++++
 fs/f2fs/file.c | 43 ++++++++++++++--- include/trace/events/f2fs.h | 94
 +++++++++++++++++++++++++++++++++++++ 3 file [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nWQae-0003LI-9j
Subject: [f2fs-dev] [PATCH] f2fs: introduce data read/write showing path info
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This was used in Android for a long time. Let's upstream it.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h              | 29 ++++++++++++
 fs/f2fs/file.c              | 43 ++++++++++++++---
 include/trace/events/f2fs.h | 94 +++++++++++++++++++++++++++++++++++++
 3 files changed, 159 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3016b6354a68..95de749c9637 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4537,4 +4537,33 @@ static inline bool f2fs_block_unit_discard(struct f2fs_sb_info *sbi)
 #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
 #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
 
+/* Sizes an on-stack array, so careful if sizing this up ! */
+#define MAX_TRACE_PATHBUF_LEN	256
+
+static inline char *f2fs_get_pathname(char *buf, int len, struct inode *inode)
+{
+	char *path;
+	struct dentry *d;
+
+	/*
+	 * d_obtain_alias() will either iput() if it locates an existing
+	 * dentry or transfer the reference to the new dentry created.
+	 * So get an extra reference here.
+	 */
+	ihold(inode);
+	d = d_obtain_alias(inode);
+	if (likely(!IS_ERR(d))) {
+		path = dentry_path_raw(d, buf, len);
+		if (unlikely(IS_ERR(path))) {
+			strcpy(buf, "ERROR");
+			path = buf;
+		}
+		dput(d);
+	} else {
+		strcpy(buf, "ERROR");
+		path = buf;
+	}
+	return path;
+}
+
 #endif /* _LINUX_F2FS_H */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 68ddf4c7ca64..a6a952b7ff91 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4329,17 +4329,32 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
+	const loff_t pos = iocb->ki_pos;
+	const size_t count = iov_iter_count(to);
 	ssize_t ret;
 
 	if (!f2fs_is_compress_backend_ready(inode))
 		return -EOPNOTSUPP;
 
-	if (f2fs_should_use_dio(inode, iocb, to))
-		return f2fs_dio_read_iter(iocb, to);
+	if (trace_f2fs_dataread_start_enabled()) {
+		char *path, pathbuf[MAX_TRACE_PATHBUF_LEN];
+
+		path = f2fs_get_pathname(pathbuf,
+				MAX_TRACE_PATHBUF_LEN,
+				inode);
+		trace_f2fs_dataread_start(inode, pos, count,
+				current->pid, path,
+				current->comm);
+	}
 
-	ret = filemap_read(iocb, to, 0);
-	if (ret > 0)
-		f2fs_update_iostat(F2FS_I_SB(inode), APP_BUFFERED_READ_IO, ret);
+	if (f2fs_should_use_dio(inode, iocb, to)) {
+		ret = f2fs_dio_read_iter(iocb, to);
+	} else {
+		ret = filemap_read(iocb, to, 0);
+		if (ret > 0)
+			f2fs_update_iostat(F2FS_I_SB(inode), APP_BUFFERED_READ_IO, ret);
+	}
+	trace_f2fs_dataread_end(inode, pos, ret);
 	return ret;
 }
 
@@ -4637,14 +4652,28 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	/* Possibly preallocate the blocks for the write. */
 	target_size = iocb->ki_pos + iov_iter_count(from);
 	preallocated = f2fs_preallocate_blocks(iocb, from, dio);
-	if (preallocated < 0)
+	if (preallocated < 0) {
 		ret = preallocated;
-	else
+	} else {
+		if (trace_f2fs_datawrite_start_enabled()) {
+			char *path, pathbuf[MAX_TRACE_PATHBUF_LEN];
+
+			path = f2fs_get_pathname(pathbuf,
+					MAX_TRACE_PATHBUF_LEN,
+					inode);
+			trace_f2fs_datawrite_start(inode, orig_pos, orig_count,
+					current->pid, path,
+					current->comm);
+		}
 		/* Do the actual write. */
 		ret = dio ?
 			f2fs_dio_write_iter(iocb, from, &may_need_sync):
 			f2fs_buffered_write_iter(iocb, from);
 
+		if (trace_f2fs_datawrite_end_enabled())
+			trace_f2fs_datawrite_end(inode, orig_pos, ret);
+	}
+
 	/* Don't leave any preallocated blocks around past i_size. */
 	if (preallocated && i_size_read(inode) < target_size) {
 		f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index f701bb23f83c..11f6b7147be2 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -2068,6 +2068,100 @@ TRACE_EVENT(f2fs_fiemap,
 		__entry->ret)
 );
 
+DECLARE_EVENT_CLASS(f2fs__rw_start,
+
+	TP_PROTO(struct inode *inode, loff_t offset, int bytes,
+			pid_t pid, char *pathname, char *command),
+
+	TP_ARGS(inode, offset, bytes, pid, pathname, command),
+
+	TP_STRUCT__entry(
+		__string(pathbuf, pathname)
+		__field(loff_t, offset)
+		__field(int, bytes)
+		__field(loff_t, i_size)
+		__string(cmdline, command)
+		__field(pid_t, pid)
+		__field(ino_t, ino)
+	),
+
+	TP_fast_assign(
+		/*
+		 * Replace the spaces in filenames and cmdlines
+		 * because this screws up the tooling that parses
+		 * the traces.
+		 */
+		__assign_str(pathbuf, pathname);
+		(void)strreplace(__get_str(pathbuf), ' ', '_');
+		__entry->offset = offset;
+		__entry->bytes = bytes;
+		__entry->i_size = i_size_read(inode);
+		__assign_str(cmdline, command);
+		(void)strreplace(__get_str(cmdline), ' ', '_');
+		__entry->pid = pid;
+		__entry->ino = inode->i_ino;
+	),
+
+	TP_printk("entry_name %s, offset %llu, bytes %d, cmdline %s,"
+		" pid %d, i_size %llu, ino %lu",
+		__get_str(pathbuf), __entry->offset, __entry->bytes,
+		__get_str(cmdline), __entry->pid, __entry->i_size,
+		(unsigned long) __entry->ino)
+);
+
+DECLARE_EVENT_CLASS(f2fs__rw_end,
+
+	TP_PROTO(struct inode *inode, loff_t offset, int bytes),
+
+	TP_ARGS(inode, offset, bytes),
+
+	TP_STRUCT__entry(
+		__field(ino_t,	ino)
+		__field(loff_t,	offset)
+		__field(int,	bytes)
+	),
+
+	TP_fast_assign(
+		__entry->ino		= inode->i_ino;
+		__entry->offset		= offset;
+		__entry->bytes		= bytes;
+	),
+
+	TP_printk("ino %lu, offset %llu, bytes %d",
+		(unsigned long) __entry->ino,
+		__entry->offset, __entry->bytes)
+);
+
+DEFINE_EVENT(f2fs__rw_start, f2fs_dataread_start,
+
+	TP_PROTO(struct inode *inode, loff_t offset, int bytes,
+		pid_t pid, char *pathname, char *command),
+
+	TP_ARGS(inode, offset, bytes, pid, pathname, command)
+);
+
+DEFINE_EVENT(f2fs__rw_end, f2fs_dataread_end,
+
+	TP_PROTO(struct inode *inode, loff_t offset, int bytes),
+
+	TP_ARGS(inode, offset, bytes)
+);
+
+DEFINE_EVENT(f2fs__rw_start, f2fs_datawrite_start,
+
+	TP_PROTO(struct inode *inode, loff_t offset, int bytes,
+		pid_t pid, char *pathname, char *command),
+
+	TP_ARGS(inode, offset, bytes, pid, pathname, command)
+);
+
+DEFINE_EVENT(f2fs__rw_end, f2fs_datawrite_end,
+
+	TP_PROTO(struct inode *inode, loff_t offset, int bytes),
+
+	TP_ARGS(inode, offset, bytes)
+);
+
 #endif /* _TRACE_F2FS_H */
 
  /* This part must be outside protection */
-- 
2.35.1.894.gb6a874cedc-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
