Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD474D5844
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Mar 2022 03:43:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nSVFE-0000i6-OQ; Fri, 11 Mar 2022 02:43:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nSVFD-0000i0-R5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Mar 2022 02:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3ki3cvlIZwki8zWCxfG4XlIz3HcGOUC3S0yJauBug+Y=; b=Qj9pV0uj6r+qdvO8eAZH7LXIV4
 7OaTngNtK/1RAaZmvf9HUwluDhAus9rfuiv8UFNQ+TR7IMDA5psmDRwxLj5wZTbVDjdNq1a8s51ds
 aenxam2/DthE62t6lQK89ehNd4S71iSFuvnAaXWcuVeJjUeIuNDAB4hekxo9j6khlSg4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3ki3cvlIZwki8zWCxfG4XlIz3HcGOUC3S0yJauBug+Y=; b=D
 7GHhlCEE10vOfkVaYWgH98ySuScLTVxQITEda8C5sK2ZPngXczgaDhaJkFECquksNv8mItrzrmnQu
 S9E3krE+7LyDTviQLtkQdwkG0JydzY/BMSwWvQpJ4kPGoFdzbzVEhL2YvBFDRz53aobUNRzlcWRP2
 flYyc1QosHIIDuW4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nSVFB-00BcQZ-O1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Mar 2022 02:43:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4474060A29;
 Fri, 11 Mar 2022 02:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1692C340E8;
 Fri, 11 Mar 2022 02:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646966571;
 bh=jMF+7A91O+CmShR7jtuBs7wudx+hHvkwGcYaTfViQeg=;
 h=From:To:Cc:Subject:Date:From;
 b=BgA8wgE2jmR6CmyR9PfBrZu+Y/t8HwTk2AZDQZm/cKKaTHSDmBlMJ62flLj0xhey+
 1n24qoD4fYv+II0qVmEuV6bQRI0PxgK4AAYM8+54BpQ9voQ6oOImfbFguS0jicREdD
 nDpGa1DQqEB4R6kmgG5BW2tsXlpf8EVjd8K0teyQzQsgpkVKFpznwHrGgAVK+XOqP8
 ZmPz+V85hjEJlHWRjigIZHbbQdOGg7BahewIj2aIhZF8LRIDPPmRWRq6r9yxsJnk1Q
 zZcXWubdBnSaVupyHvrLwOWE6qMO3jZNsfFMggIx9GKBSgGVJwi2RzyIFFe1Flqj2x
 N0OJ1u8dtgNXQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 11 Mar 2022 10:42:40 +0800
Message-Id: <20220311024240.3700299-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If whint_mode=fs-based, for direct write IO,
 it needs to override
 bio.bi_write_hint with the hint provided by filesystem. Fixes: 0cdd31953967
 ("f2fs: support passing down write hints given by users to block layer")
 Cc: Hyunchul Lee <cheol.lee@lge.com> Signed-off-by: Chao Yu <chao.yu@oppo.com>
 --- fs/f2fs/f2fs.h | 1 + fs/ [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nSVFB-00BcQZ-O1
Subject: [f2fs-dev] [PATCH] f2fs: fix to override bi_write_hint in fs-based
 whint_mode
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
Cc: Hyunchul Lee <cheol.lee@lge.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If whint_mode=fs-based, for direct write IO, it needs to override
bio.bi_write_hint with the hint provided by filesystem.

Fixes: 0cdd31953967 ("f2fs: support passing down write hints given by users to block layer")
Cc: Hyunchul Lee <cheol.lee@lge.com>
Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/f2fs.h    |  1 +
 fs/f2fs/file.c    | 21 +++++++++++++++++++++
 fs/f2fs/segment.c | 17 +++++++++++------
 3 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 68d791ec8b27..01d1393b8f83 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3629,6 +3629,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 			block_t old_addr, block_t new_addr,
 			unsigned char version, bool recover_curseg,
 			bool recover_newaddr);
+int f2fs_get_segment_temp(int seg_type);
 void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 			block_t old_blkaddr, block_t *new_blkaddr,
 			struct f2fs_summary *sum, int type,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d5c3273c6efe..9a1c4f69a39a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4458,6 +4458,26 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
 	return ret;
 }
 
+
+static void f2fs_dio_submit_io(const struct iomap_iter *iter, struct bio *bio,
+							  loff_t file_offset)
+{
+	struct inode *inode = iter->inode;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+
+	if (F2FS_OPTION(sbi).whint_mode == WHINT_MODE_FS) {
+		int seg_type = f2fs_rw_hint_to_seg_type(bio->bi_write_hint);
+		enum temp_type temp = f2fs_get_segment_temp(seg_type);
+
+		/*
+		 * in fs-based whint_mode, override bi_write_hint w/
+		 * the hint provided by filesystem.
+		 */
+		bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
+	}
+	submit_bio(bio);
+}
+
 static int f2fs_dio_write_end_io(struct kiocb *iocb, ssize_t size, int error,
 				 unsigned int flags)
 {
@@ -4472,6 +4492,7 @@ static int f2fs_dio_write_end_io(struct kiocb *iocb, ssize_t size, int error,
 
 static const struct iomap_dio_ops f2fs_iomap_dio_write_ops = {
 	.end_io = f2fs_dio_write_end_io,
+	.submit_io = f2fs_dio_submit_io,
 };
 
 static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 012524db7437..20aa9f11de5e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3397,6 +3397,15 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 	}
 }
 
+int f2fs_get_segment_temp(int seg_type)
+{
+	if (IS_HOT(seg_type))
+		return HOT;
+	else if (IS_WARM(seg_type))
+		return WARM;
+	return COLD;
+}
+
 static int __get_segment_type(struct f2fs_io_info *fio)
 {
 	int type = 0;
@@ -3415,12 +3424,8 @@ static int __get_segment_type(struct f2fs_io_info *fio)
 		f2fs_bug_on(fio->sbi, true);
 	}
 
-	if (IS_HOT(type))
-		fio->temp = HOT;
-	else if (IS_WARM(type))
-		fio->temp = WARM;
-	else
-		fio->temp = COLD;
+	fio->temp = f2fs_get_segment_temp(type);
+
 	return type;
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
