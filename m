Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C2810B247
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Nov 2019 16:18:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZz5U-0003G5-9s; Wed, 27 Nov 2019 15:18:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <agruenba@redhat.com>) id 1iZz5S-0003Fs-T2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Nov 2019 15:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MKRMqYZcMSPOI1ZGGK/kSwrsQZTCaWDdryNtYrwk8A4=; b=X4jyUk3hvJhjCzWYnsmGkVBORE
 uNppWLrQqPDsRpTI6wTUF63jBcn+VZZmTfbjvrCgjGSekhcEc20NRd/aKwNkfbvSF8qEW769Hl+0n
 qowvhrfbh4lBppKUzjyaZw2nk4buAGCLNHeucthmd1PP3W86+4XoVUD384cux3bzh19g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MKRMqYZcMSPOI1ZGGK/kSwrsQZTCaWDdryNtYrwk8A4=; b=Q
 y8IyfDtJAJjThgFeTWVrS0emP/SPR9AoeMJg3UOgWgIhOsh+t3t5ejaMol/k8x48JZBuNW140TysU
 QMvMwWxmR7+uF5gZMSP1Boo1g3SNWb+qdXqSpajoJievh4a8AAvxnTw45UbosjvzMyT0JBkd0wAJs
 IcOpVguonpcGQ0Mc=;
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1iZz5Q-00FGIW-Jl
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Nov 2019 15:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574867910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MKRMqYZcMSPOI1ZGGK/kSwrsQZTCaWDdryNtYrwk8A4=;
 b=MTwMRqNu+MeR4QaIT5ScdTi3FY3q4TIbuScZCw7D1Q/tdgkXeTHJIgVCon5MbH5HY3Smfk
 kwpurQunGpQ/srUNR5GqysQLb5Cd1g5u2UjmQ4/O/Ads1THgydWuoyLyKy2gV5YnApSEIr
 nAjbrGSucYE0aWx0G5+mXCDgafrGAco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-GM3JGt2IPoeXL76p6qeU6w-1; Wed, 27 Nov 2019 10:18:26 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA8C11007271;
 Wed, 27 Nov 2019 15:18:22 +0000 (UTC)
Received: from max.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 477BF1001DE1;
 Wed, 27 Nov 2019 15:18:14 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Nov 2019 16:18:11 +0100
Message-Id: <20191127151811.9229-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: GM3JGt2IPoeXL76p6qeU6w-1
X-Mimecast-Spam-Score: 0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iZz5Q-00FGIW-Jl
Subject: [f2fs-dev] [PATCH] fs: Fix page_mkwrite off-by-one errors
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
Cc: linux-xfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Theodore Ts'o <tytso@mit.edu>, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Richard Weinberger <richard@nod.at>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Christoph Hellwig <hch@infradead.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix a check in block_page_mkwrite meant to determine whether an offset
is within the inode size.  This error has spread to several filesystems
and to iomap_page_mkwrite, so fix those instances as well.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

---

This patch has a trivial conflict with commit "iomap: Fix overflow in
iomap_page_mkwrite" in Darrick's iomap pull request for 5.5:

  https://lore.kernel.org/lkml/20191125190907.GN6219@magnolia/
---
 fs/buffer.c            | 2 +-
 fs/ceph/addr.c         | 2 +-
 fs/ext4/inode.c        | 2 +-
 fs/f2fs/file.c         | 2 +-
 fs/iomap/buffered-io.c | 2 +-
 fs/ubifs/file.c        | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 86a38b979323..152d391858d4 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2465,7 +2465,7 @@ int block_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf,
 	lock_page(page);
 	size = i_size_read(inode);
 	if ((page->mapping != inode->i_mapping) ||
-	    (page_offset(page) > size)) {
+	    (page_offset(page) >= size)) {
 		/* We overload EFAULT to mean page got truncated */
 		ret = -EFAULT;
 		goto out_unlock;
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 7ab616601141..9fa0729ece41 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1575,7 +1575,7 @@ static vm_fault_t ceph_page_mkwrite(struct vm_fault *vmf)
 	do {
 		lock_page(page);
 
-		if ((off > size) || (page->mapping != inode->i_mapping)) {
+		if ((off >= size) || (page->mapping != inode->i_mapping)) {
 			unlock_page(page);
 			ret = VM_FAULT_NOPAGE;
 			break;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 516faa280ced..6dd4efe2fb63 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -6224,7 +6224,7 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
 	lock_page(page);
 	size = i_size_read(inode);
 	/* Page got truncated from under us? */
-	if (page->mapping != mapping || page_offset(page) > size) {
+	if (page->mapping != mapping || page_offset(page) >= size) {
 		unlock_page(page);
 		ret = VM_FAULT_NOPAGE;
 		goto out;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 29bc0a542759..3436be01af45 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -71,7 +71,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	down_read(&F2FS_I(inode)->i_mmap_sem);
 	lock_page(page);
 	if (unlikely(page->mapping != inode->i_mapping ||
-			page_offset(page) > i_size_read(inode) ||
+			page_offset(page) >= i_size_read(inode) ||
 			!PageUptodate(page))) {
 		unlock_page(page);
 		err = -EFAULT;
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index e25901ae3ff4..d454dbab5133 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1041,7 +1041,7 @@ vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops)
 	lock_page(page);
 	size = i_size_read(inode);
 	if ((page->mapping != inode->i_mapping) ||
-	    (page_offset(page) > size)) {
+	    (page_offset(page) >= size)) {
 		/* We overload EFAULT to mean page got truncated */
 		ret = -EFAULT;
 		goto out_unlock;
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index cd52585c8f4f..ca0148ec77e6 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1564,7 +1564,7 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	lock_page(page);
 	if (unlikely(page->mapping != inode->i_mapping ||
-		     page_offset(page) > i_size_read(inode))) {
+		     page_offset(page) >= i_size_read(inode))) {
 		/* Page got truncated out from underneath us */
 		goto sigbus;
 	}
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
