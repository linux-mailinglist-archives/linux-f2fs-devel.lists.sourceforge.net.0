Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C196570A962
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 May 2023 18:57:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q0Pt7-0005pp-AO;
	Sat, 20 May 2023 16:57:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dhowells@redhat.com>) id 1q0A3E-0005Rf-M0
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 May 2023 00:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CaLAYOqJ2Anmir2KAA5gHQHUMXRYNU8ZFt/DqT/DIIs=; b=bXahn9J5LJIxxiO9BY26g6mZWu
 bkAyG9zNLay6PQkVG15VpGc16aW8/CdcnMoOL+wtaNugThr/qLOOoGhL9wcFdBIHJM2KnN8fRm9YV
 xn/Cl7RR7Oeu/GJBNFFgCSQ11V4TguPsf9TsVHuyPfT6CP7eN8kEwRGPinEfmLOu28Zw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CaLAYOqJ2Anmir2KAA5gHQHUMXRYNU8ZFt/DqT/DIIs=; b=IEeWw6kJYSB0dUx5I5ZZezzXBo
 7Lz/ahP6kQ0GpdKoP+GH49+uUr6QupsIVxhGbTfGuZbwkJa+8LHd4M7W4IRI106pZMiTZXqDElrzM
 dKqS7NVfSyrC/u40De631UHarDlnd44wlph3xJZ+1/JG5vGLFCaavkL+skWI7ggaOND4=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q0A38-00Dml3-OK for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 May 2023 00:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684540930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CaLAYOqJ2Anmir2KAA5gHQHUMXRYNU8ZFt/DqT/DIIs=;
 b=GRdg30LlBkK1AB+HcXib7J8hXUt5YY3Ag6dZXAAIzTnDFVV9VUB1NIzauiQRt4L2CqcQ4K
 kP2hGOgCltEUytKmT6NSWLt7vPcp4jzXlE7K3rmsH4iwIoJPY21uZqS+AO388NlSbHI6bV
 PCu2jGmCzWCSqSdcvqAtAi7ZoOUoHkA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-eV0FIEGwNWuHo-kvCpFXaA-1; Fri, 19 May 2023 20:01:54 -0400
X-MC-Unique: eV0FIEGwNWuHo-kvCpFXaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D6021C05AE3;
 Sat, 20 May 2023 00:01:53 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DFDE2026D49;
 Sat, 20 May 2023 00:01:51 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jens Axboe <axboe@kernel.dk>, Al Viro <viro@zeniv.linux.org.uk>,
 Christoph Hellwig <hch@infradead.org>
Date: Sat, 20 May 2023 01:00:38 +0100
Message-Id: <20230520000049.2226926-20-dhowells@redhat.com>
In-Reply-To: <20230520000049.2226926-1-dhowells@redhat.com>
References: <20230520000049.2226926-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Provide a splice_read stub for f2fs. This does some checks
 and tracing before calling filemap_splice_read() and will update the iostats
 afterwards. Direct I/O is handled by the caller. Signed-off-by: David Howells
 <dhowells@redhat.com> cc: Christoph Hellwig <hch@lst.de> cc: Al Viro
 <viro@zeniv.linux.org.uk>
 cc: Jens Axboe <axboe@kernel.dk> cc: Jaegeuk Kim <jaegeuk@kernel.org> cc:
 Ch [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q0A38-00Dml3-OK
Subject: [f2fs-dev] [PATCH v21 19/30] f2fs: Provide a splice-read stub
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
Cc: linux-block@vger.kernel.org, Hillf Danton <hdanton@sina.com>,
 Jan Kara <jack@suse.cz>, David Hildenbrand <david@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jeff Layton <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Provide a splice_read stub for f2fs.  This does some checks and tracing
before calling filemap_splice_read() and will update the iostats
afterwards.  Direct I/O is handled by the caller.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Christoph Hellwig <hch@lst.de>
cc: Al Viro <viro@zeniv.linux.org.uk>
cc: Jens Axboe <axboe@kernel.dk>
cc: Jaegeuk Kim <jaegeuk@kernel.org>
cc: Chao Yu <chao@kernel.org>
cc: linux-f2fs-devel@lists.sourceforge.net
cc: linux-fsdevel@vger.kernel.org
cc: linux-block@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/f2fs/file.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5ac53d2627d2..3fce122997ca 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4367,22 +4367,23 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	return ret;
 }
 
-static void f2fs_trace_rw_file_path(struct kiocb *iocb, size_t count, int rw)
+static void f2fs_trace_rw_file_path(struct file *file, loff_t pos, size_t count,
+				    int rw)
 {
-	struct inode *inode = file_inode(iocb->ki_filp);
+	struct inode *inode = file_inode(file);
 	char *buf, *path;
 
 	buf = f2fs_getname(F2FS_I_SB(inode));
 	if (!buf)
 		return;
-	path = dentry_path_raw(file_dentry(iocb->ki_filp), buf, PATH_MAX);
+	path = dentry_path_raw(file_dentry(file), buf, PATH_MAX);
 	if (IS_ERR(path))
 		goto free_buf;
 	if (rw == WRITE)
-		trace_f2fs_datawrite_start(inode, iocb->ki_pos, count,
+		trace_f2fs_datawrite_start(inode, pos, count,
 				current->pid, path, current->comm);
 	else
-		trace_f2fs_dataread_start(inode, iocb->ki_pos, count,
+		trace_f2fs_dataread_start(inode, pos, count,
 				current->pid, path, current->comm);
 free_buf:
 	f2fs_putname(buf);
@@ -4398,7 +4399,8 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		return -EOPNOTSUPP;
 
 	if (trace_f2fs_dataread_start_enabled())
-		f2fs_trace_rw_file_path(iocb, iov_iter_count(to), READ);
+		f2fs_trace_rw_file_path(iocb->ki_filp, iocb->ki_pos,
+					iov_iter_count(to), READ);
 
 	if (f2fs_should_use_dio(inode, iocb, to)) {
 		ret = f2fs_dio_read_iter(iocb, to);
@@ -4413,6 +4415,30 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	return ret;
 }
 
+static ssize_t f2fs_file_splice_read(struct file *in, loff_t *ppos,
+				     struct pipe_inode_info *pipe,
+				     size_t len, unsigned int flags)
+{
+	struct inode *inode = file_inode(in);
+	const loff_t pos = *ppos;
+	ssize_t ret;
+
+	if (!f2fs_is_compress_backend_ready(inode))
+		return -EOPNOTSUPP;
+
+	if (trace_f2fs_dataread_start_enabled())
+		f2fs_trace_rw_file_path(in, pos, len, READ);
+
+	ret = filemap_splice_read(in, ppos, pipe, len, flags);
+	if (ret > 0)
+		f2fs_update_iostat(F2FS_I_SB(inode), inode,
+				   APP_BUFFERED_READ_IO, ret);
+
+	if (trace_f2fs_dataread_end_enabled())
+		trace_f2fs_dataread_end(inode, pos, ret);
+	return ret;
+}
+
 static ssize_t f2fs_write_checks(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct file *file = iocb->ki_filp;
@@ -4714,7 +4740,8 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ret = preallocated;
 	} else {
 		if (trace_f2fs_datawrite_start_enabled())
-			f2fs_trace_rw_file_path(iocb, orig_count, WRITE);
+			f2fs_trace_rw_file_path(iocb->ki_filp, iocb->ki_pos,
+						orig_count, WRITE);
 
 		/* Do the actual write. */
 		ret = dio ?
@@ -4919,7 +4946,7 @@ const struct file_operations f2fs_file_operations = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl	= f2fs_compat_ioctl,
 #endif
-	.splice_read	= generic_file_splice_read,
+	.splice_read	= f2fs_file_splice_read,
 	.splice_write	= iter_file_splice_write,
 	.fadvise	= f2fs_file_fadvise,
 };



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
