Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2566970935E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 May 2023 11:36:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzwWz-000503-JD;
	Fri, 19 May 2023 09:36:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+aecf67361b95543ec79f+7208+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pzwWx-0004zq-PT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 09:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TKBAB7v33dbYW3H4NRpBXoH9tha0ccQ02cfBeOuFf/4=; b=fQjfcGmM4b+LLNcroH2fb7U0/r
 XzjN5isPOqX2OjqSck6n56D7MIGC2qttKi6eaZiJBGsRQuwUSf0HfX0mpX14oA79hjpCORguYeN0f
 GVdT8+HqGAGVZoUMsnStl+vzuN83ph67ZKOkHZ/FyZiqF2KxcVqTadN63zbjl4UJd3Ks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TKBAB7v33dbYW3H4NRpBXoH9tha0ccQ02cfBeOuFf/4=; b=BKxW4/azj/FEh5Y9d2Jh7YBMG7
 MG+JKIistNWxp/7bRwnq0fWx/Fg3E8WcgkGj9QEotUjAln35op0qB8pl0vCxHI95p6gLRBRrvkT0a
 5KyMjOGRNndamB6bm0EZnilgZBeoGFwWXX/JAfz7ueauTysPezUtwcIkriHVgbz6muXE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzwWx-0007WC-JC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 09:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TKBAB7v33dbYW3H4NRpBXoH9tha0ccQ02cfBeOuFf/4=; b=jBbC+jMl9D3UjfJN7p2yKZDP/I
 WbBFLIN3Q/AJih3OxKSHbTD9vT/F1tJobu4KuSjWuiUGnD5rFBmeuEaeD/Iu5pzKBe+WoF0cJV/pR
 aHdHe3VblJTeUN80/WZVfFkLjN2xPcAqkhJGTHlmMCBAXleLOTmJaaYavT1/S9aM9V0FApxTI8BsN
 kq2VaEl7CyULWIrWWkY30KLE99zxPFDr6mlVbG53PUvDT0Owj+1Oafd0P6BmL8cNhjdjQCmT8ZUKw
 mgdHI+yL0Zy6QHpBrK9tCvQI2IS8OZd316ApM4Rm2MZrQDKXQ1/k3sGBk62SyeqnLCKYpmESn7t8M
 izw91Nrw==;
Received: from [2001:4bb8:188:3dd5:e8d0:68bb:e5be:210a] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pzwWh-00Fjj0-1m; Fri, 19 May 2023 09:35:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Fri, 19 May 2023 11:35:19 +0200
Message-Id: <20230519093521.133226-12-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519093521.133226-1-hch@lst.de>
References: <20230519093521.133226-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Both callers of fuse_perform_write need to updated ki_pos,
 move it into common code. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 fs/fuse/file.c | 25 +++++++++++ 1 file changed, 11 insertions(+),
 14 deletions(-)
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pzwWx-0007WC-JC
Subject: [f2fs-dev] [PATCH 11/13] fuse: update ki_pos in fuse_perform_write
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Both callers of fuse_perform_write need to updated ki_pos, move it into
common code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/fuse/file.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 89d97f6188e05e..fd2f27f2144750 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1329,7 +1329,10 @@ static ssize_t fuse_perform_write(struct kiocb *iocb,
 	fuse_write_update_attr(inode, pos, res);
 	clear_bit(FUSE_I_SIZE_UNSTABLE, &fi->state);
 
-	return res > 0 ? res : err;
+	if (!res)
+		return err;
+	iocb->ki_pos += res;
+	return res;
 }
 
 static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
@@ -1378,42 +1381,36 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		goto out;
 
 	if (iocb->ki_flags & IOCB_DIRECT) {
-		loff_t pos = iocb->ki_pos;
 		written = generic_file_direct_write(iocb, from);
 		if (written < 0 || !iov_iter_count(from))
 			goto out;
 
-		pos += written;
-
-		written_buffered = fuse_perform_write(iocb, mapping, from, pos);
+		written_buffered = fuse_perform_write(iocb, mapping, from,
+						      iocb->ki_pos);
 		if (written_buffered < 0) {
 			err = written_buffered;
 			goto out;
 		}
-		endbyte = pos + written_buffered - 1;
+		endbyte = iocb->ki_pos + written_buffered - 1;
 
-		err = filemap_write_and_wait_range(file->f_mapping, pos,
+		err = filemap_write_and_wait_range(file->f_mapping,
+						   iocb->ki_pos,
 						   endbyte);
 		if (err)
 			goto out;
 
 		invalidate_mapping_pages(file->f_mapping,
-					 pos >> PAGE_SHIFT,
+					 iocb->ki_pos >> PAGE_SHIFT,
 					 endbyte >> PAGE_SHIFT);
 
 		written += written_buffered;
-		iocb->ki_pos = pos + written_buffered;
+		iocb->ki_pos += written_buffered;
 	} else {
 		written = fuse_perform_write(iocb, mapping, from, iocb->ki_pos);
-		if (written >= 0)
-			iocb->ki_pos += written;
 	}
 out:
 	current->backing_dev_info = NULL;
 	inode_unlock(inode);
-	if (written > 0)
-		written = generic_write_sync(iocb, written);
-
 	return written ? written : err;
 }
 
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
