Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2001B789EF0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Aug 2023 15:32:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qaFsN-0008US-V6;
	Sun, 27 Aug 2023 13:32:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qaFsM-0008UM-7J
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 13:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e5tdpTadoLYdZJB8cQ8K1ymkQcAcLx9XJrtCjJGJaVs=; b=czwhmG34/jpEmgEcljJhQ6GVEM
 sWM0K4NU8f7S0ujYVcV9fnUcfE0fb2aaxqYJFMgv7H3vfe/IA4oVIegkdxG+05FpeXH/DBn8xzZlI
 g83nch7SDWAtxsR6AqN7pzyoInBWYaqzzCmQSGkZAqxb1XQAjT4ZeojNEZpzuEOutcx0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e5tdpTadoLYdZJB8cQ8K1ymkQcAcLx9XJrtCjJGJaVs=; b=b/+SvS9FpFxw09jFYhBsc8BLAE
 Fizb6Zpr4Fg5OegNfaCsFdye1UhSgXGv0/eNR/pF9IS1thY+IKdXJdomdQcs1GKfkenk4LWQh1Hua
 Xv8tpDgOyL2SYFNRD9Yn/FycfnM4ZAckLtwgvbdakY6w26uX1rQQzCGJuiuLHJmWoR5E=;
Received: from out-250.mta1.migadu.com ([95.215.58.250])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qaFsL-0005fj-LU for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 13:32:22 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693143134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5tdpTadoLYdZJB8cQ8K1ymkQcAcLx9XJrtCjJGJaVs=;
 b=w2Ynrlkl0lrPBgOEZvZgZsAroI/SroVLk9P1ruoBqvhkruN+yY2MpcktHEbfNgoWJ1BBu4
 4ubUBExoqQaaP8jDC6A2V4vWqXAbneLZ+BhAJSfP0lzTzlCZEFFPuxh0PF54TbtDSMupEM
 g0UMdnFp1J3UGmAIMamiGdfpc/ghYvs=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Sun, 27 Aug 2023 21:28:27 +0800
Message-Id: <20230827132835.1373581-4-hao.xu@linux.dev>
In-Reply-To: <20230827132835.1373581-1-hao.xu@linux.dev>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Hao Xu <howeyxu@tencent.com> The flags will allow
 passing
 DIR_CONTEXT_F_NOWAIT to iterate() implementations that support it (as signaled
 through FMODE_NWAIT in file->f_mode) Notes: - considered using IOCB_NOWAIT
 but if we add more flags later it would be confusing to keep track of which
 values are valid,
 use dedicated flags - might want to check ctx.flags & DIR_CONTEXT_F_
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qaFsL-0005fj-LU
Subject: [f2fs-dev] [PATCH 03/11] vfs: add nowait flag for struct dir_context
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

The flags will allow passing DIR_CONTEXT_F_NOWAIT to iterate()
implementations that support it (as signaled through FMODE_NWAIT
in file->f_mode)

Notes:
- considered using IOCB_NOWAIT but if we add more flags later it
would be confusing to keep track of which values are valid, use
dedicated flags
- might want to check ctx.flags & DIR_CONTEXT_F_NOWAIT is only set
when file->f_mode & FMODE_NOWAIT in iterate_dir() as e.g. WARN_ONCE?

Co-developed-by: Dominique Martinet <asmadeus@codewreck.org>
Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/internal.h      | 2 +-
 fs/readdir.c       | 6 ++++--
 include/linux/fs.h | 8 ++++++++
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index b1f66e52d61b..7508d485c655 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -311,4 +311,4 @@ void mnt_idmap_put(struct mnt_idmap *idmap);
 struct linux_dirent64;
 
 int vfs_getdents(struct file *file, struct linux_dirent64 __user *dirent,
-		 unsigned int count);
+		 unsigned int count, unsigned long flags);
diff --git a/fs/readdir.c b/fs/readdir.c
index 9592259b7e7f..b80caf4c9321 100644
--- a/fs/readdir.c
+++ b/fs/readdir.c
@@ -358,12 +358,14 @@ static bool filldir64(struct dir_context *ctx, const char *name, int namlen,
  * @file    : pointer to file struct of directory
  * @dirent  : pointer to user directory structure
  * @count   : size of buffer
+ * @flags   : additional dir_context flags
  */
 int vfs_getdents(struct file *file, struct linux_dirent64 __user *dirent,
-		 unsigned int count)
+		 unsigned int count, unsigned long flags)
 {
 	struct getdents_callback64 buf = {
 		.ctx.actor = filldir64,
+		.ctx.flags = flags,
 		.count = count,
 		.current_dir = dirent
 	};
@@ -395,7 +397,7 @@ SYSCALL_DEFINE3(getdents64, unsigned int, fd,
 	if (!f.file)
 		return -EBADF;
 
-	error = vfs_getdents(f.file, dirent, count);
+	error = vfs_getdents(f.file, dirent, count, 0);
 
 	fdput_pos(f);
 	return error;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 6867512907d6..f3e315e8efdd 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1719,8 +1719,16 @@ typedef bool (*filldir_t)(struct dir_context *, const char *, int, loff_t, u64,
 struct dir_context {
 	filldir_t actor;
 	loff_t pos;
+	unsigned long flags;
 };
 
+/*
+ * flags for dir_context flags
+ * DIR_CONTEXT_F_NOWAIT: Request non-blocking iterate
+ *                       (requires file->f_mode & FMODE_NOWAIT)
+ */
+#define DIR_CONTEXT_F_NOWAIT	(1 << 0)
+
 /*
  * These flags let !MMU mmap() govern direct device mapping vs immediate
  * copying more easily for MAP_PRIVATE, especially for ROM filesystems.
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
