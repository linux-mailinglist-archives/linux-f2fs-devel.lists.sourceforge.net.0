Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB166C16AFD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Oct 2025 20:55:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aJ9UPT4PzVCqS4Sw6BIKU88kPSsJGrjISOdtLW5TOCA=; b=eA6M5bw4fNaV2VfF/I1HMlwFo2
	OcFd3kPUlJPBbq1jDFpRHtBH8p8JvcLn1T6XAMaOlFskL5d3f5WyN0Nvcog0LfVQv3k5XTipZenoh
	VBn11lKNwgTW0fRTjRA50HjYY7UZQTsYCkLXm8mJ+znEHPqUFAyuYKfqMUeSqwsmtv4k=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDpmP-0002EH-9r;
	Tue, 28 Oct 2025 19:54:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vDpmN-0002E2-R5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Oct 2025 19:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OM4QgFtwNrFInMw0qmv6iouhT2Hng8s7DaJg1T3HnJY=; b=IFq52H5U/FN4n0lsNXcJm2Thx9
 ALUnNAJAY2WSQMpe7co056s3etqHrB0m+v4Kh/Wxm5nezE/nJbIBiu9zMKloGNlIMuy3W3t4CFvDv
 pR6fK11/Nv1iVp+0mZfp3VdowXaMaekTpSr+OEDlZFr5QmqArHc56TI8Kav1kKThpyKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OM4QgFtwNrFInMw0qmv6iouhT2Hng8s7DaJg1T3HnJY=; b=D
 iozUHdAo22DW+foOrXkAageegs39Xoourx+ZwpYCRY3Xh0dmouYxhuYhJm1sUrsqsULQzWsaFdKq0
 bQV4Y8xxgItmYtOSbL1Z64bzAWQjtq96sO3CZP5ZZSGikjSXCxYWFcM51zMRzGfFR4QeN31hKNkZk
 jSB5AzHXKnVvb2kc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDpmO-0003Wz-68 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Oct 2025 19:54:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 801F2612C5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Oct 2025 19:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8B7C4CEE7;
 Tue, 28 Oct 2025 19:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761681286;
 bh=sLuFwvAwHUNO/skdE7BzrktYPRAzXyoh3REUgst9oAM=;
 h=From:To:Cc:Subject:Date:From;
 b=En50DAfURMwXsnoO7ty2KsDNFEjyMIKRKv83LzWhaGEwphyfErYT9jDhE8kZx78vh
 kvCCpMWW4uLtZN/bi9mSSJtQw7/wNqe6HrW53e40W6gEV8Y2tJ3fDMVHsa/zyQcWsL
 rW2NHErauKIyGnpIezZG0fLiURuQpLtXiwHKIE+MvpS8/qdP9pmI8Y0Hbmu06OFrmG
 j/wDKnOUVaM3PsQ8VwsK0m+w9wYdUdqLM18ioVCkjbz6+7cYI31ABz42zaOZSa++os
 1RmG0YjIihIRyTs9Fp+9/eWg7c+4eMJeb/fqS3FSMC7iy6B8KvzktN/rK4ZGeeQehb
 Fm0nChBPrKTsA==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 28 Oct 2025 19:54:44 +0000
Message-ID: <20251028195444.3181203-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This adds a tracepoint in the fadvise call path.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/file.c | 2 ++
 include/trace/events/f2fs.h
 | 32 ++++++++++++++++++++++++++++++++ 2 files changed, 34 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDpmO-0003Wz-68
Subject: [f2fs-dev] [PATCH] f2fs: add fadvise tracepoint
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This adds a tracepoint in the fadvise call path.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c              |  2 ++
 include/trace/events/f2fs.h | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6d42e2d28861..4a81089c5df3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5288,6 +5288,8 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
 	struct inode *inode = file_inode(filp);
 	int err;
 
+	trace_f2fs_fadvise(inode, offset, len, advice);
+
 	if (advice == POSIX_FADV_SEQUENTIAL) {
 		if (S_ISFIFO(inode->i_mode))
 			return -ESPIPE;
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index edbbd869078f..b7f5317b5980 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -586,6 +586,38 @@ TRACE_EVENT(f2fs_file_write_iter,
 		__entry->ret)
 );
 
+TRACE_EVENT(f2fs_fadvise,
+
+	TP_PROTO(struct inode *inode, loff_t offset, loff_t len, int advice),
+
+	TP_ARGS(inode, offset, len, advice),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(ino_t,	ino)
+		__field(loff_t, size)
+		__field(loff_t,	offset)
+		__field(loff_t,	len)
+		__field(int,	advice)
+	),
+
+	TP_fast_assign(
+		__entry->dev	= inode->i_sb->s_dev;
+		__entry->ino	= inode->i_ino;
+		__entry->size	= inode->i_size;
+		__entry->offset	= offset;
+		__entry->len	= len;
+		__entry->advice	= advice;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %lu, i_size = %lld offset:%llu, len:%llu, advise:%d",
+		show_dev_ino(__entry),
+		(unsigned long long)__entry->size,
+		__entry->offset,
+		__entry->len,
+		__entry->advice)
+);
+
 TRACE_EVENT(f2fs_map_blocks,
 	TP_PROTO(struct inode *inode, struct f2fs_map_blocks *map, int flag,
 		 int ret),
-- 
2.51.1.851.g4ebd6896fd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
