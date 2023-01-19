Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1C26731D8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 07:36:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIOXd-0000zF-Lw;
	Thu, 19 Jan 2023 06:36:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+d6c99cb0ec1a2cfa7d20+7088+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pIOXa-0000yx-2g for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RaIJOL3tZjwnjJLMQegT6UdG+T8F6w/K41EghEUnqso=; b=AJqqWO7hzw3+M7RytedaRavnov
 iE17VmnHqMiTv3S46X6/Jk7Xi9ByHpzUiKT/1/FF65oMBUir3zpYwhrUmfLlyMiLtJsCmar6sE+XL
 YFgfwIX+LNiWK0W+W2vkzoRzmlg2glRg8j6QmITwow8WaLWXt2Cuufh2+ybDZHYOPuCQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RaIJOL3tZjwnjJLMQegT6UdG+T8F6w/K41EghEUnqso=; b=CHIApXBcojvpNFqNDMo2BaGkLv
 KbLhLW5177Qd6AFYTp5UjVg3M7XoQrePZgJCBfYLIB8zT3T2IoJamXRclUknhD0oQdror1FPYA5i2
 yFlFt8bDeLhO1+wpz9qu/StkKY0bzFxTRCrPOEveCULKWJCuOaQcHtGJlHjtHrivJpPk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIOXW-0001dc-Sm for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RaIJOL3tZjwnjJLMQegT6UdG+T8F6w/K41EghEUnqso=; b=WDsWKycwyhzt1i8Vd8nRRyYus+
 xiOjr2vznU6YWtjn9QomlxDUeKaavEPBfNd8BwLv8rFs8Hv3/Zh2XDHfdlOibkdu3N0Y9IAQBZ6eR
 HGhXQfG4kHT+VdWLenhr6nTizMABcwJnjA0OiuBUO+hNqqfCnUzhPWsIKPzZoEQE6Hp7n9wn7camf
 c0yU8kt6HUvGmoFXob3VoEQLo7W2KAZkfN7p59kWvp2+aztNISzG40OR1wm/gbri7VWFm0JN0iSny
 0kXs5F9F9Lr3dzkFx/zU9nFHWCaQfjRh6tategyvDsELMcBkndTWKkBxpxWDvjXDXGH90tMWykzgN
 e7IMXg2w==;
Received: from [2001:4bb8:19a:2039:96fe:c1ec:dda2:41a3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pIOXR-003kbz-1S; Thu, 19 Jan 2023 06:36:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 19 Jan 2023 07:36:21 +0100
Message-Id: <20230119063625.466485-5-hch@lst.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119063625.466485-1-hch@lst.de>
References: <20230119063625.466485-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Factor the logic to log a path for reads and writs into a
 helper shared between the read_iter and write_iter methods. Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/f2fs/file.c | 60 +++++++++++++++++++++
 1 file changed, 25 insertions(+), 35 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pIOXW-0001dc-Sm
Subject: [f2fs-dev] [PATCH 4/8] f2fs: factor the read/write tracing logic
 into a helper
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Factor the logic to log a path for reads and writs into a helper
shared between the read_iter and write_iter methods.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/file.c | 60 +++++++++++++++++++++-----------------------------
 1 file changed, 25 insertions(+), 35 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f5c1b78149540c..305be6ac024196 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4340,6 +4340,27 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	return ret;
 }
 
+static void f2fs_trace_rw_file_path(struct kiocb *iocb, size_t count, int rw)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+	char *buf, *path;
+
+	buf = f2fs_kmalloc(F2FS_I_SB(inode), PATH_MAX, GFP_KERNEL);
+	if (!buf)
+		return;
+	path = dentry_path_raw(file_dentry(iocb->ki_filp), buf, PATH_MAX);
+	if (IS_ERR(path))
+		goto free_buf;
+	if (rw == WRITE)
+		trace_f2fs_datawrite_start(inode, iocb->ki_pos, count,
+				current->pid, path, current->comm);
+	else
+		trace_f2fs_dataread_start(inode, iocb->ki_pos, count,
+				current->pid, path, current->comm);
+free_buf:
+	kfree(buf);
+}
+
 static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
@@ -4349,24 +4370,9 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	if (!f2fs_is_compress_backend_ready(inode))
 		return -EOPNOTSUPP;
 
-	if (trace_f2fs_dataread_start_enabled()) {
-		char *p = f2fs_kmalloc(F2FS_I_SB(inode), PATH_MAX, GFP_KERNEL);
-		char *path;
-
-		if (!p)
-			goto skip_read_trace;
+	if (trace_f2fs_dataread_start_enabled())
+		f2fs_trace_rw_file_path(iocb, iov_iter_count(to), READ);
 
-		path = dentry_path_raw(file_dentry(iocb->ki_filp), p, PATH_MAX);
-		if (IS_ERR(path)) {
-			kfree(p);
-			goto skip_read_trace;
-		}
-
-		trace_f2fs_dataread_start(inode, pos, iov_iter_count(to),
-					current->pid, path, current->comm);
-		kfree(p);
-	}
-skip_read_trace:
 	if (f2fs_should_use_dio(inode, iocb, to)) {
 		ret = f2fs_dio_read_iter(iocb, to);
 	} else {
@@ -4672,24 +4678,8 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	if (preallocated < 0) {
 		ret = preallocated;
 	} else {
-		if (trace_f2fs_datawrite_start_enabled()) {
-			char *p = f2fs_kmalloc(F2FS_I_SB(inode),
-						PATH_MAX, GFP_KERNEL);
-			char *path;
-
-			if (!p)
-				goto skip_write_trace;
-			path = dentry_path_raw(file_dentry(iocb->ki_filp),
-								p, PATH_MAX);
-			if (IS_ERR(path)) {
-				kfree(p);
-				goto skip_write_trace;
-			}
-			trace_f2fs_datawrite_start(inode, orig_pos, orig_count,
-					current->pid, path, current->comm);
-			kfree(p);
-		}
-skip_write_trace:
+		f2fs_trace_rw_file_path(iocb, orig_count, WRITE);
+
 		/* Do the actual write. */
 		ret = dio ?
 			f2fs_dio_write_iter(iocb, from, &may_need_sync) :
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
