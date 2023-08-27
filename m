Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 587BA789F64
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Aug 2023 15:36:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qaFwQ-0006wY-NF;
	Sun, 27 Aug 2023 13:36:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qaFwP-0006wQ-Hq
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 13:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NAMtHKwgj081g8lIPVs72MliioxtTYHj7D9CTN85ELE=; b=DbNu9wHy37BVTv7nqj81DmLDf2
 Z0db1cR8DloiKNZZBM90TSOG6l/mzbOv5FTYBea5Xmyt+ugXPdNSydNcp3/rU9YKrbDvDCPKnlY8g
 v8kIjewrJByJOo9WlctjlCE3kbE6I8R16BFLF0fFeYv/3CI5KnBlSdSSJr/oyTZ8FLTs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NAMtHKwgj081g8lIPVs72MliioxtTYHj7D9CTN85ELE=; b=RaV5fdVsM9aZ+NuVnaK4QiswLN
 l5ToojXtb6Hbrnfh99zLi+uwoKtO+6IBcgQztOaeBWABpAI2TjXBiJch//gmHbVSjhBr5jjDU+xxt
 3RBknt0/ki7u40rsDQsAnDsZizg75gHaNNLn5v+2klpbBWK7SJRE1BXttI/qgagj7mBc=;
Received: from out-247.mta1.migadu.com ([95.215.58.247])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qaFwP-00H3zg-EN for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 13:36:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693143386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NAMtHKwgj081g8lIPVs72MliioxtTYHj7D9CTN85ELE=;
 b=u7n0PP5Y7t8pZAzx+5IbBJkZfY9azRKTfFVD9LVMOb4Thl+C2D6j0w7wWcMlmzcA25L4C8
 zEudurGp2ODbmGylA6BsBPQ9105gr52QFoDr/T1ABSTboWT6yVGzUbuarS4ljsFfYjiAKI
 tkX7K8GiO8NfI2EeGspOsslEfgzb2IA=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Sun, 27 Aug 2023 21:28:35 +0800
Message-Id: <20230827132835.1373581-12-hao.xu@linux.dev>
In-Reply-To: <20230827132835.1373581-1-hao.xu@linux.dev>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Hao Xu <howeyxu@tencent.com> This add support for
 getdents64
 to io_uring, acting exactly like the syscall: the directory is iterated from
 it's current's position as stored in the file struct, and the file's position
 is updated ex [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qaFwP-00H3zg-EN
Subject: [f2fs-dev] [PATCH 11/11] io_uring: add support for getdents
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hao Xu <howeyxu@tencent.com>

This add support for getdents64 to io_uring, acting exactly like the
syscall: the directory is iterated from it's current's position as
stored in the file struct, and the file's position is updated exactly as
if getdents64 had been called.

For filesystems that support NOWAIT in iterate_shared(), try to use it
first; if a user already knows the filesystem they use do not support
nowait they can force async through IOSQE_ASYNC in the sqe flags,
avoiding the need to bounce back through a useless EAGAIN return.

Co-developed-by: Dominique Martinet <asmadeus@codewreck.org>
Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 include/uapi/linux/io_uring.h |  1 +
 io_uring/fs.c                 | 53 +++++++++++++++++++++++++++++++++++
 io_uring/fs.h                 |  3 ++
 io_uring/opdef.c              |  8 ++++++
 4 files changed, 65 insertions(+)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index 8e61f8b7c2ce..3896397a1998 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -240,6 +240,7 @@ enum io_uring_op {
 	IORING_OP_URING_CMD,
 	IORING_OP_SEND_ZC,
 	IORING_OP_SENDMSG_ZC,
+	IORING_OP_GETDENTS,
 
 	/* this goes last, obviously */
 	IORING_OP_LAST,
diff --git a/io_uring/fs.c b/io_uring/fs.c
index f6a69a549fd4..04711feac4e6 100644
--- a/io_uring/fs.c
+++ b/io_uring/fs.c
@@ -47,6 +47,12 @@ struct io_link {
 	int				flags;
 };
 
+struct io_getdents {
+	struct file			*file;
+	struct linux_dirent64 __user	*dirent;
+	unsigned int			count;
+};
+
 int io_renameat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 {
 	struct io_rename *ren = io_kiocb_to_cmd(req, struct io_rename);
@@ -291,3 +297,50 @@ void io_link_cleanup(struct io_kiocb *req)
 	putname(sl->oldpath);
 	putname(sl->newpath);
 }
+
+int io_getdents_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
+{
+	struct io_getdents *gd = io_kiocb_to_cmd(req, struct io_getdents);
+
+	if (READ_ONCE(sqe->off))
+		return -EINVAL;
+
+	gd->dirent = u64_to_user_ptr(READ_ONCE(sqe->addr));
+	gd->count = READ_ONCE(sqe->len);
+
+	return 0;
+}
+
+int io_getdents(struct io_kiocb *req, unsigned int issue_flags)
+{
+	struct io_getdents *gd = io_kiocb_to_cmd(req, struct io_getdents);
+	struct file *file = req->file;
+	unsigned long getdents_flags = 0;
+	bool force_nonblock = issue_flags & IO_URING_F_NONBLOCK;
+	bool locked;
+	int ret;
+
+	if (force_nonblock) {
+		if (!(file->f_flags & O_NONBLOCK) &&
+		    !(file->f_mode & FMODE_NOWAIT))
+			return -EAGAIN;
+
+		getdents_flags = DIR_CONTEXT_F_NOWAIT;
+	}
+
+	ret = file_pos_lock_nowait(file, force_nonblock);
+	if (ret == -EAGAIN)
+		return ret;
+	locked = ret;
+
+	ret = vfs_getdents(file, gd->dirent, gd->count, getdents_flags);
+	if (locked)
+		file_pos_unlock(file);
+
+	if (ret == -EAGAIN && force_nonblock)
+		return -EAGAIN;
+
+	io_req_set_res(req, ret, 0);
+	return 0;
+}
+
diff --git a/io_uring/fs.h b/io_uring/fs.h
index 0bb5efe3d6bb..f83a6f3a678d 100644
--- a/io_uring/fs.h
+++ b/io_uring/fs.h
@@ -18,3 +18,6 @@ int io_symlinkat(struct io_kiocb *req, unsigned int issue_flags);
 int io_linkat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
 int io_linkat(struct io_kiocb *req, unsigned int issue_flags);
 void io_link_cleanup(struct io_kiocb *req);
+
+int io_getdents_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
+int io_getdents(struct io_kiocb *req, unsigned int issue_flags);
diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index 3b9c6489b8b6..1bae6b2a8d0b 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -428,6 +428,11 @@ const struct io_issue_def io_issue_defs[] = {
 		.prep			= io_eopnotsupp_prep,
 #endif
 	},
+	[IORING_OP_GETDENTS] = {
+		.needs_file		= 1,
+		.prep			= io_getdents_prep,
+		.issue			= io_getdents,
+	},
 };
 
 
@@ -648,6 +653,9 @@ const struct io_cold_def io_cold_defs[] = {
 		.fail			= io_sendrecv_fail,
 #endif
 	},
+	[IORING_OP_GETDENTS] = {
+		.name			= "GETDENTS",
+	},
 };
 
 const char *io_uring_get_opcode(u8 opcode)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
