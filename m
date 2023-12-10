Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F8680B9FD
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Dec 2023 10:21:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCFzu-0000yB-Km;
	Sun, 10 Dec 2023 09:21:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rCFzt-0000xw-64
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 09:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GyDb89B1pBnoGazvPcFqJJ0tUhQM56Cu+onPhqysOEw=; b=K8gQrrMN7XkqBMs20xU9Tw8WTZ
 HAzXxYreiBEJDWixDzJg547OBlOXqN24QaHneo+xxRXJ4i/fNt+Q16pIoNCPOlTHBsS4jsPoZiolR
 gKQGtwrOGDcY6mlYv3I7ti/vaQoXxiZ6SieUVOXUDdDFmHM5MZP2JCBUzUBiv/7g1rB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GyDb89B1pBnoGazvPcFqJJ0tUhQM56Cu+onPhqysOEw=; b=Rq4terXh2PCfJgrV0OvhJLkmFW
 f8yzfupf5sk3U75u/kxBDG99vVZgjARuuKeS/asqtbyHS3MxFYHTtLiZLjp4TJBxtRBZclJpYDOs9
 6YsCpVO9RDXYVRCm1kbOWdfXPL4YhZk0puQR0WYRfK5ACPZF631ZxDC//GtuwMn8ncIE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCFzo-0002np-Vd for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 09:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 62292B80A37
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Dec 2023 09:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79378C433C9;
 Sun, 10 Dec 2023 09:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702200056;
 bh=BjltPLVDTqSnWr9yrzT9LGYq3m8ffUZKi+SKLGr20ZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ym7Re/0FEavQLP5slXvCbzQnjUi0GthG8VNGQYE+0JCOAMo6vdFGa4yWxtFKBBzo3
 b1s0tJK5bocfJeWdBsmpfuyemVDJJWqf6BaiM9QDqjAHBAXweky3SETt+rHTBNGVMD
 7Amm0TM0/D8srUZdU6RgfWOMdmOwVKjEftXL+v77Luu2sxU2iTW+5Y7R2+2KEbmE1S
 QDzfhjJtM0OxeYJqF5SUZSRpiUp6oHlG7O8KAEDt3y3a0eCrlzhb3nc54QEtPEWt4R
 xtWISNMIzEDZAbAL/4SZEEIZlWnbaFCHkMj0nWfjql0rGhlWYkHysZ1F0YrkF0EKAm
 UwBaF0MGJNWvQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 10 Dec 2023 17:20:40 +0800
Message-Id: <20231210092040.3374741-6-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231210092040.3374741-1-chao@kernel.org>
References: <20231210092040.3374741-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds to support tracepoint for
 f2fs_vm_page_mkwrite(), 
 meanwhile it prints more details for trace_f2fs_filemap_fault().
 Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/file.c | 25 ++++++++++++++
 include/trace/events/f2fs.h
 | 39 ++++++++++++++++++++++++ 2 files changed, 41 insertions(+), 23 d [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rCFzo-0002np-Vd
Subject: [f2fs-dev] [PATCH 6/6] f2fs: add tracepoint for
 f2fs_vm_page_mkwrite()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds to support tracepoint for f2fs_vm_page_mkwrite(),
meanwhile it prints more details for trace_f2fs_filemap_fault().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c              | 25 ++++++++++++++----------
 include/trace/events/f2fs.h | 39 ++++++++++++++++++++++++-------------
 2 files changed, 41 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3c7e6bfc1265..60290940018d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -46,7 +46,7 @@ static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
 		f2fs_update_iostat(F2FS_I_SB(inode), inode,
 					APP_MAPPED_READ_IO, F2FS_BLKSIZE);
 
-	trace_f2fs_filemap_fault(inode, vmf->pgoff, (unsigned long)ret);
+	trace_f2fs_filemap_fault(inode, vmf->pgoff, vmf->vma->vm_flags, ret);
 
 	return ret;
 }
@@ -59,26 +59,29 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	struct dnode_of_data dn;
 	bool need_alloc = true;
 	int err = 0;
+	vm_fault_t ret;
 
 	if (unlikely(IS_IMMUTABLE(inode)))
 		return VM_FAULT_SIGBUS;
 
-	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED))
-		return VM_FAULT_SIGBUS;
+	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
+		err = -EIO;
+		goto out;
+	}
 
 	if (unlikely(f2fs_cp_error(sbi))) {
 		err = -EIO;
-		goto err;
+		goto out;
 	}
 
 	if (!f2fs_is_checkpoint_ready(sbi)) {
 		err = -ENOSPC;
-		goto err;
+		goto out;
 	}
 
 	err = f2fs_convert_inline_inode(inode);
 	if (err)
-		goto err;
+		goto out;
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (f2fs_compressed_file(inode)) {
@@ -86,7 +89,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 		if (ret < 0) {
 			err = ret;
-			goto err;
+			goto out;
 		} else if (ret) {
 			need_alloc = false;
 		}
@@ -153,13 +156,15 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, F2FS_BLKSIZE);
 	f2fs_update_time(sbi, REQ_TIME);
 
-	trace_f2fs_vm_page_mkwrite(page, DATA);
 out_sem:
 	filemap_invalidate_unlock_shared(inode->i_mapping);
 
 	sb_end_pagefault(inode->i_sb);
-err:
-	return vmf_fs_error(err);
+out:
+	ret = vmf_fs_error(err);
+
+	trace_f2fs_vm_page_mkwrite(inode, page->index, vmf->vma->vm_flags, ret);
+	return ret;
 }
 
 static const struct vm_operations_struct f2fs_file_vm_ops = {
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 479d26eae22f..7ed0fc430dc6 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1369,13 +1369,6 @@ DEFINE_EVENT(f2fs__page, f2fs_set_page_dirty,
 	TP_ARGS(page, type)
 );
 
-DEFINE_EVENT(f2fs__page, f2fs_vm_page_mkwrite,
-
-	TP_PROTO(struct page *page, int type),
-
-	TP_ARGS(page, type)
-);
-
 TRACE_EVENT(f2fs_replace_atomic_write_block,
 
 	TP_PROTO(struct inode *inode, struct inode *cow_inode, pgoff_t index,
@@ -1413,30 +1406,50 @@ TRACE_EVENT(f2fs_replace_atomic_write_block,
 		__entry->recovery)
 );
 
-TRACE_EVENT(f2fs_filemap_fault,
+DECLARE_EVENT_CLASS(f2fs_mmap,
 
-	TP_PROTO(struct inode *inode, pgoff_t index, unsigned long ret),
+	TP_PROTO(struct inode *inode, pgoff_t index,
+			vm_flags_t flags, vm_fault_t ret),
 
-	TP_ARGS(inode, index, ret),
+	TP_ARGS(inode, index, flags, ret),
 
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
 		__field(ino_t,	ino)
 		__field(pgoff_t, index)
-		__field(unsigned long, ret)
+		__field(vm_flags_t, flags)
+		__field(vm_fault_t, ret)
 	),
 
 	TP_fast_assign(
 		__entry->dev	= inode->i_sb->s_dev;
 		__entry->ino	= inode->i_ino;
 		__entry->index	= index;
+		__entry->flags	= flags;
 		__entry->ret	= ret;
 	),
 
-	TP_printk("dev = (%d,%d), ino = %lu, index = %lu, ret = %lx",
+	TP_printk("dev = (%d,%d), ino = %lu, index = %lu, flags: %s, ret: %s",
 		show_dev_ino(__entry),
 		(unsigned long)__entry->index,
-		__entry->ret)
+		__print_flags(__entry->flags, "|", FAULT_FLAG_TRACE),
+		__print_flags(__entry->ret, "|", VM_FAULT_RESULT_TRACE))
+);
+
+DEFINE_EVENT(f2fs_mmap, f2fs_filemap_fault,
+
+	TP_PROTO(struct inode *inode, pgoff_t index,
+			vm_flags_t flags, vm_fault_t ret),
+
+	TP_ARGS(inode, index, flags, ret)
+);
+
+DEFINE_EVENT(f2fs_mmap, f2fs_vm_page_mkwrite,
+
+	TP_PROTO(struct inode *inode, pgoff_t index,
+			vm_flags_t flags, vm_fault_t ret),
+
+	TP_ARGS(inode, index, flags, ret)
 );
 
 TRACE_EVENT(f2fs_writepages,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
