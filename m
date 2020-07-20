Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 917D2227320
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jul 2020 01:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6P+4hOvXuQTVUIJl7+Hwtjugc8Ferv3p7QiKjl2ATAQ=; b=AhFeHNFss51ReV4WzrDz597sO
	3mKBG2oIvoO5Is2001bL6aGGXJcgbqy6VHfWhhWUjEcIWYCOd3RyKx8wpBy5bevaFoWAGwv5Vx/wk
	YoIsJDhcJJ50PVaRoglFmoY3oPP4ee59JDAvJcMjb8WvOBuAjh32IJnAr22sAlKz8vlXI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxfM5-0000TB-VN; Mon, 20 Jul 2020 23:37:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3yyoWXwYKAHgoWpuWpckkcha.Yki@flex--satyat.bounces.google.com>)
 id 1jxfM2-0000Sw-9l
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 23:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t24CFwj7eZURk4UC7tWBzhFCIdKtl5EAgLElefYpFNE=; b=CkhnqBamyXjryCsINVx9S42S4
 ujfJV/DabAGQV9Xr/Cxk0EWcy1OjQvs923ZxItAXd+jYhkB1t0PBiAfsTsnn//FDL4sSi2sqtZf+q
 i3A0HOQtlpmeY79n9hG9wOPyws0D70lkbMLpx1meS9fE1AR06jjajNnJMTrCTeVtoduqU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t24CFwj7eZURk4UC7tWBzhFCIdKtl5EAgLElefYpFNE=; b=YcB2AZ+ZahN6XWP52wW5NeiQZ0
 CfUqUciacX9dMFak+bJgmHlpqlz3VioqzTP3xuzBzm2R2/E32zERrLbt0s2NkSG5xi9hZRJP0vpW5
 UV0qiL6q9LrxToPN2UTMtEc++c4uZQfDQCUfeUtMnzxG3Q5B76lubZhazeyw9c/+G8AQ=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxfM1-00BOmm-4Z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 23:37:54 +0000
Received: by mail-yb1-f202.google.com with SMTP id d202so23437855ybh.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jul 2020 16:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=t24CFwj7eZURk4UC7tWBzhFCIdKtl5EAgLElefYpFNE=;
 b=GaSqESuQmG/FX3ZRcGOFu7fgGXrhxJFfKAhlwNTUj+EUo/QWtj1/gnsPkrnngQvj5V
 OCaCL4Arakh0xG2ANKdDLEK2Kr0jXfkjA314DNINIOX7PyCSqNdOENOjVR3HN4kRjoTe
 Ckb8M7zLSVBcNHHxkf0XEdBL3nyZUKDzbqsLy0nsi6qh9y4LiUD8gKQa0XiXwgNz/Cyr
 fM27fuLxzicL36J0NF1SZe8k2UzcoOG29PR0pMRcty8QEHHb0WlG2udOwmaG1Jnx/tIS
 xZsKBL0sO++BgwCN9/MpdLVM1BnHyGGslEvZ9vYx2BvrQsD1+skFNa+WEdXaeXOVsjEy
 Qucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=t24CFwj7eZURk4UC7tWBzhFCIdKtl5EAgLElefYpFNE=;
 b=UJW4jmxDBcO/LraO6DJJMDPXYXIscYlF4eUMApXrlCtLgck+WY30k7daVaDvFk0l7v
 OV3Pv9nxHqfm0H+qsX3yRuW0AtnhyYgMuKIBXnKbIK9ksStilM6c67gG73Qw6rdMmjC0
 AcPVlZZS+GHqq6U+ZP5MARJuQt86jDiIfzr59CGZCBpywF/pBvQboT7AS6Wd++Hzsv6D
 XXZUQ0Rpd8/CobHh6g7GRjl2sH5rc25u/TQfCZYFUzaFwcvEBz5bdJrPecasoG/0lqYr
 nYEYsR/tNzTStIGAglzbIMZyZyqp6VdngKPDyfhbeKTfdFiziZnPicR1ss458qsT5Uh2
 qpFQ==
X-Gm-Message-State: AOAM531/pobUAShvafIxEfH6dZIWC6pFqei+iVbNL1V86G9PXuEh9pVO
 JmPVnVbRwg1Qv1tInoQ1Pcj62EsgDrQ=
X-Google-Smtp-Source: ABdhPJwDsMMJwPLHK9Bp+Cwu9CfcdZpjyQWJiHRkZx1avD2YLM3cw3lkr8Pd/tl4V7GYFevYfYj6wMk5AGY=
X-Received: by 2002:a25:a441:: with SMTP id f59mr37237298ybi.412.1595288267387; 
 Mon, 20 Jul 2020 16:37:47 -0700 (PDT)
Date: Mon, 20 Jul 2020 23:37:35 +0000
In-Reply-To: <20200720233739.824943-1-satyat@google.com>
Message-Id: <20200720233739.824943-4-satyat@google.com>
Mime-Version: 1.0
References: <20200720233739.824943-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.2 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxfM1-00BOmm-4Z
Subject: [f2fs-dev] [PATCH v4 3/7] iomap: support direct I/O with fscrypt
 using blk-crypto
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-xfs@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Wire up iomap direct I/O with the fscrypt additions for direct I/O.
This allows ext4 to support direct I/O on encrypted files when inline
encryption is enabled.

This change consists of two parts:

- Set a bio_crypt_ctx on bios for encrypted files, so that the file
  contents get encrypted (or decrypted).

- Ensure that encryption data unit numbers (DUNs) are contiguous within
  each bio.  Use the new function fscrypt_limit_io_pages() for this,
  since the iomap code works directly with logical ranges and thus
  doesn't have a chance to call fscrypt_mergeable_bio() on each page.

Note that fscrypt_limit_io_pages() is normally a no-op, as normally the
DUNs simply increment along with the logical blocks.  But it's needed to
handle an edge case in one of the fscrypt IV generation methods.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/iomap/direct-io.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index ec7b78e6feca..12064daa3e3d 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -6,6 +6,7 @@
 #include <linux/module.h>
 #include <linux/compiler.h>
 #include <linux/fs.h>
+#include <linux/fscrypt.h>
 #include <linux/iomap.h>
 #include <linux/backing-dev.h>
 #include <linux/uio.h>
@@ -183,11 +184,16 @@ static void
 iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
 		unsigned len)
 {
+	struct inode *inode = file_inode(dio->iocb->ki_filp);
 	struct page *page = ZERO_PAGE(0);
 	int flags = REQ_SYNC | REQ_IDLE;
 	struct bio *bio;
 
 	bio = bio_alloc(GFP_KERNEL, 1);
+
+	/* encrypted direct I/O is guaranteed to be fs-block aligned */
+	WARN_ON_ONCE(fscrypt_needs_contents_encryption(inode));
+
 	bio_set_dev(bio, iomap->bdev);
 	bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
 	bio->bi_private = dio;
@@ -253,6 +259,7 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 		ret = nr_pages;
 		goto out;
 	}
+	nr_pages = fscrypt_limit_io_pages(inode, pos, nr_pages);
 
 	if (need_zeroout) {
 		/* zero out from the start of the block to the write offset */
@@ -270,6 +277,8 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 		}
 
 		bio = bio_alloc(GFP_KERNEL, nr_pages);
+		fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
+					  GFP_KERNEL);
 		bio_set_dev(bio, iomap->bdev);
 		bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
 		bio->bi_write_hint = dio->iocb->ki_hint;
@@ -306,9 +315,10 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 		dio->size += n;
 		copied += n;
 
-		nr_pages = iov_iter_npages(dio->submit.iter, BIO_MAX_PAGES);
 		iomap_dio_submit_bio(dio, iomap, bio, pos);
 		pos += n;
+		nr_pages = iov_iter_npages(dio->submit.iter, BIO_MAX_PAGES);
+		nr_pages = fscrypt_limit_io_pages(inode, pos, nr_pages);
 	} while (nr_pages);
 
 	/*
-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
