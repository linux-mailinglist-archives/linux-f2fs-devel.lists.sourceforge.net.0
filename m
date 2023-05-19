Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5704D709089
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 May 2023 09:42:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzukg-0003O1-Pj;
	Fri, 19 May 2023 07:42:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dhowells@redhat.com>) id 1pzuke-0003Nu-Sf
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 07:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r5qDgkT4BMNnpU06yXa6htF6MTIyeI5iJgctjYsdWto=; b=Ve4nWkEQinnXLAy1EkAzNn569p
 L7qdwPEh05Kf3ATUHlvadkNXH7crDpj6iqVQEv/f9ad8Z5NNXRtm6IgZ0pnnjA8MkJ682sRaZcJBZ
 CcYVCK7xl8eoq21nfgicsTouNuutiUKWxMlYEp6/PU9tNuUUu1YXjvrJJBDq+UxYxbmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r5qDgkT4BMNnpU06yXa6htF6MTIyeI5iJgctjYsdWto=; b=HFKfuIlq8FbM6nT+ClxGvN6hjs
 58WpsBV9XVwPWqJ/P8b9nRK/4uaw2FWI5fs0mW5oFVfNp1Sn+UBlou71RGEatY570vxepYQ6I3t5i
 mXHTUWYyj2lJPZ0mWCJJoDjWbVZnDgGIFVZkm1LBspy3isxoQzAsDTqHQN/zvBmsTx2I=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzuka-00D6bg-7P for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 07:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684482122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r5qDgkT4BMNnpU06yXa6htF6MTIyeI5iJgctjYsdWto=;
 b=Y0ycKK5T6mVqGYUc5QLGVd2+jHvV9iK/dLjQ6P/eQEy6BptA3gjSe9YoDu/eeiIKtRMP5J
 /oCfVw2PqeEg/Ghg636pegW2kEwH9huZifPtyTFmsRjSeh76byiHrNb3nyz+K9P6J+JPhY
 kYZTG1EsfMXPmVpCBlTzerWxyi95Cm0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-UwmqYBTZNaOSEg7543TOgw-1; Fri, 19 May 2023 03:41:56 -0400
X-MC-Unique: UwmqYBTZNaOSEg7543TOgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABE8E1C04B50;
 Fri, 19 May 2023 07:41:55 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 367671121314;
 Fri, 19 May 2023 07:41:53 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jens Axboe <axboe@kernel.dk>, Al Viro <viro@zeniv.linux.org.uk>,
 Christoph Hellwig <hch@infradead.org>
Date: Fri, 19 May 2023 08:40:31 +0100
Message-Id: <20230519074047.1739879-17-dhowells@redhat.com>
In-Reply-To: <20230519074047.1739879-1-dhowells@redhat.com>
References: <20230519074047.1739879-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Provide a splice_read stub for f2fs. This does some checks
 and tracing before proceeding and will switch from direct-I/O to buffered
 I/O if forced or if misaligned. It also updates the iostats after d [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzuka-00D6bg-7P
Subject: [f2fs-dev] [PATCH v20 16/32] f2fs: Provide a splice-read stub
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
before proceeding and will switch from direct-I/O to buffered I/O if forced
or if misaligned.  It also updates the iostats after doing a buffered I/O.

[Note: I wonder if I should only do the tracing if I call
filemap_splice_read() as direct_splice_read() will call
f2fs_file_read_iter().]

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
 fs/f2fs/file.c | 68 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 60 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5ac53d2627d2..3723387f4a87 100644
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
@@ -4413,6 +4415,55 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
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
+	if (in->f_flags & O_DIRECT) {
+		if (f2fs_force_buffered_io(inode, READ))
+			goto buffered;
+
+		/*
+		 * Direct I/O not aligned to the disk's logical_block_size will
+		 * be attempted, but will fail with -EINVAL.
+		 *
+		 * f2fs additionally requires that direct I/O be aligned to the
+		 * filesystem block size, which is often a stricter
+		 * requirement.  However, f2fs traditionally falls back to
+		 * buffered I/O on requests that are logical_block_size-aligned
+		 * but not fs-block aligned.
+		 *
+		 * The below logic implements this behavior.
+		 */
+		if (!IS_ALIGNED(pos, i_blocksize(inode)) &&
+		    IS_ALIGNED(pos, bdev_logical_block_size(inode->i_sb->s_bdev)))
+			goto buffered;
+		ret = direct_splice_read(in, ppos, pipe, len, flags);
+		goto done;
+	}
+
+buffered:
+	ret = filemap_splice_read(in, ppos, pipe, len, flags);
+	if (ret > 0)
+		f2fs_update_iostat(F2FS_I_SB(inode), inode,
+				   APP_BUFFERED_READ_IO, ret);
+
+done:
+	if (trace_f2fs_dataread_end_enabled())
+		trace_f2fs_dataread_end(inode, pos, ret);
+	return ret;
+}
+
 static ssize_t f2fs_write_checks(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct file *file = iocb->ki_filp;
@@ -4714,7 +4765,8 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ret = preallocated;
 	} else {
 		if (trace_f2fs_datawrite_start_enabled())
-			f2fs_trace_rw_file_path(iocb, orig_count, WRITE);
+			f2fs_trace_rw_file_path(iocb->ki_filp, iocb->ki_pos,
+						orig_count, WRITE);
 
 		/* Do the actual write. */
 		ret = dio ?
@@ -4919,7 +4971,7 @@ const struct file_operations f2fs_file_operations = {
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
