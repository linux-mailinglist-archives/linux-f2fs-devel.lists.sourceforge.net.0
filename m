Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52543C76E04
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 02:42:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j8SLjt/KgXXjoNPkH9me7Lh2XqK1tl31CiZmAYorWCY=; b=izE3K7AZjnf4oJK/62yvcFF8kq
	I9HtTG1WwYBlf32lBSmBl4mKuJyRajfA7XrUM87EJ5onk60dKURGfqtlDKyaTIx4IhU0XOoljpJFJ
	a7/NoU43p52Wzpd/+SzAjO6jNEq/VzYzX+P9kZPXvbVcmI1SkNLAEW6vG3Bo49DerraM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMGAE-0003qL-IZ;
	Fri, 21 Nov 2025 01:42:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vMGAD-0003q7-7W
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 01:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uel6u2m6m2rH/vo9WVbOcnft/0hpm0yuhiyYz5CRlb0=; b=GDbUwSEfeIMlP2YTFBRDP53bCB
 9O/rm2Zecs3nj2B+SNpIl6kYnRqdIxZ++bVoF62yZUi9+Fa64G4paXSsnWuy97zXaO6nKmH44HHAa
 Ic8KYaNhvIHu3gz9ZNsQfaURa7jseRiymBoGIFlgMc1zm6APluBXegZRhDIYcAsC2Puk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uel6u2m6m2rH/vo9WVbOcnft/0hpm0yuhiyYz5CRlb0=; b=Y
 NmM54HeOKsFbwmYE7/oqvi/oqfEMFwvCXOc/N5tOp+YsmNaHo0zDmTtV88UyoXX7k3iWS6Ojro9t2
 dFjR2JyQIJtO6T7nfrePa2jQhIOjnYvRkDXcS9dXN06CQvjniu4iMTDtn+5JFGk98Jc5Ofc+SEWKm
 WhZ7BVUO21ayfK4s=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMGAD-0005RJ-H4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 01:42:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1BADA42DB1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Nov 2025 01:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE1FC4CEF1;
 Fri, 21 Nov 2025 01:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763689327;
 bh=H5IeIodtSnxgkULtRM08GYwKpOM7MhVP+ZZoALsPL/Q=;
 h=From:To:Cc:Subject:Date:From;
 b=iCkKQt8uBHQqOEyvzmKYLwKjFQWdZxszn4TFQRfEpvAfDeag6BOjewlJsecYa3txz
 2jS37Gxdp65o6RjRyH7gLls+e0cgm0GM5e25C6q6Z9R7cJtHZyj/g4XZSjC4z74ZV3
 MPU40EBxaXGOPp0mzX7XepfISIay0Xbt05tkkOLLEdGLyQwQs1cgv4ptpZDC1IXkrS
 JK6kMf2tkm0MtBKfyMrqaM/Dn/4v431WiZX6bzO7MrMdMN4T6BNrp/Nth06/kac96w
 qF+F2v7dTlO4a2/fKNDE93pJItOVpd3zjF/gE3L/pfKzOeB/mLjv7DULUrx3xmLmjh
 fYo5SguULawew==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 21 Nov 2025 01:42:01 +0000
Message-ID: <20251121014202.1969909-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch boosts readahead for POSIX_FADV_WILLNEED.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/data.c | 61
 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h | 1 + fs/f2fs/file.c | 9 +++++--- 3 files changed, 68 insertio
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMGAD-0005RJ-H4
Subject: [f2fs-dev] [PATCH 1/2] f2fs: improve readahead for
 POSIX_FADV_WILLNEED
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

This patch boosts readahead for POSIX_FADV_WILLNEED.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h |  1 +
 fs/f2fs/file.c |  9 +++++---
 3 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a0433c8a4d84..d95974d79fb3 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2710,6 +2710,67 @@ static void f2fs_readahead(struct readahead_control *rac)
 	f2fs_mpage_readpages(inode, rac, NULL);
 }
 
+int f2fs_readahead_pages(struct file *file, loff_t offset, loff_t len)
+{
+	struct inode *inode = file_inode(file);
+	struct address_space *mapping = file->f_mapping;
+	pgoff_t start_index = offset >> PAGE_SHIFT;
+	loff_t endbyte = offset + len;
+	pgoff_t end_index;
+	unsigned long nrpages;
+	unsigned long ra_pages = (16 * 1024 * 1024) / PAGE_SIZE;
+	DEFINE_READAHEAD(ractl, NULL, &file->f_ra, mapping, start_index);
+
+	if (!S_ISREG(inode->i_mode))
+		return -EOPNOTSUPP;
+
+	/* Should be read only. */
+	if (!(file->f_mode & FMODE_READ))
+		return -EBADF;
+
+	/* Do not support compressed file for large folio. */
+	if (f2fs_compressed_file(inode))
+		return -EINVAL;
+
+	if (!mapping || len < 0)
+		return -EINVAL;
+
+	if (unlikely(!mapping->a_ops->read_folio && !mapping->a_ops->readahead))
+		return -EINVAL;
+
+	/* Load extent cache at the first readahead. */
+	f2fs_precache_extents(inode);
+
+	/*
+	 * Careful about overflows. Len == 0 means "as much as possible".  Use
+	 * unsigned math because signed overflows are undefined and UBSan
+	 * complains.
+	 */
+	if (!len || endbyte > i_size_read(inode) || endbyte < len)
+		endbyte = i_size_read(inode) - 1;
+	else
+		endbyte--;		/* inclusive */
+
+	/* First and last PARTIAL page! */
+	end_index = endbyte >> PAGE_SHIFT;
+
+	if (start_index > end_index)
+		return 0;
+
+	nrpages = end_index - start_index + 1;
+
+	while (nrpages) {
+		unsigned long this_chunk = min(nrpages, ra_pages);
+
+		ractl.ra->ra_pages = this_chunk;
+
+		page_cache_sync_ra(&ractl, this_chunk << 1);
+
+		nrpages -= this_chunk;
+	}
+	return 0;
+}
+
 int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
 {
 	struct inode *inode = fio_inode(fio);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3340db04a7c2..934287cc5624 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4047,6 +4047,7 @@ int f2fs_init_bio_entry_cache(void);
 void f2fs_destroy_bio_entry_cache(void);
 void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
 			  enum page_type type);
+int f2fs_readahead_pages(struct file *file, loff_t offset, loff_t len);
 int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi);
 void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type);
 void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d7047ca6b98d..b6f71efd6d2a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5305,9 +5305,12 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
 		filp->f_mode &= ~FMODE_RANDOM;
 		spin_unlock(&filp->f_lock);
 		return 0;
-	} else if (advice == POSIX_FADV_WILLNEED && offset == 0) {
-		/* Load extent cache at the first readahead. */
-		f2fs_precache_extents(inode);
+	} else if (advice == POSIX_FADV_WILLNEED) {
+		if (offset == 0 && len == -1) {
+			f2fs_precache_extents(inode);
+			return 0;
+		}
+		return f2fs_readahead_pages(filp, offset, len);
 	}
 
 	err = generic_fadvise(filp, offset, len, advice);
-- 
2.52.0.487.g5c8c507ade-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
