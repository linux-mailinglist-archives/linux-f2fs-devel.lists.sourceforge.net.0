Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D3721A8B0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jul 2020 22:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KgyIkRFAWKsJEznRqcpo+924w2VGy20g3gwLA1eWYDc=; b=VCcyBkRzYwOEe6oDqcYqApt6P
	GLWqIZq0Z6ZcPsDRO5WHbE8AtVuyGKlinI65fk6CN+w4D6jTmNMG+R/aCmPjhjTk2ogr2P3EWxzBC
	bcIf/XR2I/HHxS9awBe9DKusbQR+UAA2DEWFIo63AoOitmatGugaSU06pRxAyk9ZQ2G5s=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtcri-0000YG-IH; Thu, 09 Jul 2020 20:09:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3cHQHXwYKAHUlTmrTmZhhZeX.Vhf@flex--satyat.bounces.google.com>)
 id 1jtcrg-0000Xq-Sc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 20:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F8Vh+2Oj0e1Bz4p4CaEpLpu89IEB8oilLTMr2JnBHtA=; b=VKqDi7Fz3YDChirDCDJyEUezA
 jNFd8ADBt3MzPwuM8NGVVsjbFvVbQtfTC6xER+CKbNwf/c1HIAnXl3JUHUPUokqi04zLPd7Q54r3e
 iWAm9q5EdzQE3etidehgZXiM8uNIcBm/DBxoydeZENe6y1buDr6PQUM7FJrrWq2Lm7r70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F8Vh+2Oj0e1Bz4p4CaEpLpu89IEB8oilLTMr2JnBHtA=; b=eYA+HGw+7O1zzpeo8q4j7+3xja
 FT9FXir50OJHzjU+OQaOhuu4FlDj68wIIUTPByF+uK8j4Vn+otG/0U47gGy9U5N8QJN2EmIBJPrvk
 Ni26tTIAgnVAEMe679fqw6hy8fgy+Co3DEHpkAZZfD39y4WL8M4WHfkKoy4gfdeiyOp0=;
Received: from mail-qk1-f201.google.com ([209.85.222.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtcrf-00CVTZ-MK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 20:09:52 +0000
Received: by mail-qk1-f201.google.com with SMTP id o26so2670552qko.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Jul 2020 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=F8Vh+2Oj0e1Bz4p4CaEpLpu89IEB8oilLTMr2JnBHtA=;
 b=n/XchN266fqGBoCIT70QRrbSKL8BhsIGh3atkfrL+0wfDq/ITuCBBAwQFiwD29zrHo
 RjO2JizNIiO3Rvwi0LtaaItm6GvUOons1saevQ9aIy9GCDsecu+O5x3aZvIqzhIwt6Ap
 jwBA+lkwIT8AlS4+zuBI2BDea413RQdLMek8QcT8+eMzDoxlqYty2NGOEtoAgG3ViD5k
 uLRAbg36Cjuz6m/+QQmmfQPX3S/WRrOaid2M3uJ0/+vad0TZ6VHnsBsCgxr4A4AoOHK0
 omL+w4IbITj0XhF1IO0CaTO2QXaxuLEqIMNw+IgjiorB+/s2cF9r9dCip0/PmtPIZn/l
 w6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=F8Vh+2Oj0e1Bz4p4CaEpLpu89IEB8oilLTMr2JnBHtA=;
 b=pX/5ryWbuVW7p7df24Qv1kbFxss9E2rfEw4+8NtxRqKT1/fxYTNF6w31tD3fQCjJAj
 uBVcoSp2gDv9DkDdr6stARQL5F2/cURWLejM8MoaFsLEHqLJEZiBYof5cC6qSMDaDq5g
 UqmZKYs3c/wczdhwsU1FBkyBD5zoXZ2sUwO5LllA8VOszAf0X+z8SSY1rCOZIrrBT6+m
 Qr5BRgHF0JWvOAmF0ZH5gcVnw3OQ/HN2StgCPnGw6Z8leZxaQrYp3A8uctz07FzeAKkE
 aozwTqKEmBAzxI3sXfHjmzFCp9ouX34VwMPLn+zTASyltf5JCHB6oHbkyI6Jgzb7gnoU
 gwPQ==
X-Gm-Message-State: AOAM531bcyNaH0QqE5gOpX1Jrdmm3KeE08umMC5vSab2t9cJI8Y0j+GO
 NMFdBjdV1w0QW0x4vguo//gyGy9+RAU=
X-Google-Smtp-Source: ABdhPJwgF0eduoVEqL+5EnB4NT5k175DYmVz+vnVdiaT3ayIkgmltIZBeFIoEPNUTNM+7geNefWVH9TuAAQ=
X-Received: by 2002:a17:902:a50c:: with SMTP id
 s12mr41269918plq.119.1594324080790; 
 Thu, 09 Jul 2020 12:48:00 -0700 (PDT)
Date: Thu,  9 Jul 2020 19:47:49 +0000
In-Reply-To: <20200709194751.2579207-1-satyat@google.com>
Message-Id: <20200709194751.2579207-4-satyat@google.com>
Mime-Version: 1.0
References: <20200709194751.2579207-1-satyat@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.201 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtcrf-00CVTZ-MK
Subject: [f2fs-dev] [PATCH 3/5] iomap: support direct I/O with fscrypt using
 blk-crypto
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
Cc: Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Wire up iomap direct I/O with the fscrypt additions for direct I/O,
and set bio crypt contexts on bios when appropriate.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/iomap/direct-io.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index ec7b78e6feca..1e123d785199 100644
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
@@ -183,11 +184,14 @@ static void
 iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
 		unsigned len)
 {
+	struct inode *inode = file_inode(dio->iocb->ki_filp);
 	struct page *page = ZERO_PAGE(0);
 	int flags = REQ_SYNC | REQ_IDLE;
 	struct bio *bio;
 
 	bio = bio_alloc(GFP_KERNEL, 1);
+	fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
+				  GFP_KERNEL);
 	bio_set_dev(bio, iomap->bdev);
 	bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
 	bio->bi_private = dio;
@@ -253,6 +257,7 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 		ret = nr_pages;
 		goto out;
 	}
+	nr_pages = fscrypt_limit_dio_pages(inode, pos, nr_pages);
 
 	if (need_zeroout) {
 		/* zero out from the start of the block to the write offset */
@@ -270,6 +275,8 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 		}
 
 		bio = bio_alloc(GFP_KERNEL, nr_pages);
+		fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
+					  GFP_KERNEL);
 		bio_set_dev(bio, iomap->bdev);
 		bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
 		bio->bi_write_hint = dio->iocb->ki_hint;
@@ -307,6 +314,7 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 		copied += n;
 
 		nr_pages = iov_iter_npages(dio->submit.iter, BIO_MAX_PAGES);
+		nr_pages = fscrypt_limit_dio_pages(inode, pos, nr_pages);
 		iomap_dio_submit_bio(dio, iomap, bio, pos);
 		pos += n;
 	} while (nr_pages);
-- 
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
