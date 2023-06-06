Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CEC723963
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 09:40:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6RJK-0003Nk-9n;
	Tue, 06 Jun 2023 07:40:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c7f58ba0a08136e81302+7226+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q6RJJ-0003Ne-Qy for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 07:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FfW9DuqWcqftCK2V6shZmYbcTRlwjUtw9gvZaCo9uwY=; b=ZUGhuFsjuLC7UP030EFpYfTsN7
 rjsGiTwffmTcNHTdmlmtCse/kJyJ7yZyZsZ3AkCyG9zghQk7Jk7wRhzS7Dj3gMUVvf4QVUIMWo38U
 9XTYfvAlHMQ58o6zzJrAPOW58rU1tzLvQQy9IKU8+0B+vEPomYU+1W4P30SdL5d2ujJc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FfW9DuqWcqftCK2V6shZmYbcTRlwjUtw9gvZaCo9uwY=; b=LbwiwRm52JcdcFtqv7d4yN0SPR
 95vDy88DCA3j3TTYB8dBOkuZ2ctthe819zfYzkz0bGAx48TWBcEzPQJsIyi53EpqlMeL0VqSqQWxj
 rNIUpujtr/ltAp+LAndaTIbqXhQEeGgzX7oLjEMSAfqP7z5LgrDyvFlkuMaH4GhAl0SI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6RJJ-0003an-QS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 07:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FfW9DuqWcqftCK2V6shZmYbcTRlwjUtw9gvZaCo9uwY=; b=4IsKSEVIFLiRaOu49nM5+2+Atx
 sWynEbtjaTBj4wCpEyskc+AVpK9xBK2MyKKGe4FYbxvhjaC5LimsABd4cvkv1jv+VhxiAcI8wHrul
 BQ2EKZrYRElZjwKKlbsbcfmSdhaNX3g7h/PXGWfGeexe2oLRsJNFeu/fB50MxFxZbLVXR6FJPlChH
 THp/dF/6FsqG8FhQ5IEhDUSDTpOKU/RFO7wrS/JncAebuXfCX6h84SO3T0Bcu0BqepXfa25O/ttFX
 SKqzGH4GKjuqqkUpWzm3dwGyXzwy+CxxbeOKtT2njKDlzxoOMJNzaZg2vjCZzLeLKN98TI5RxOZKb
 Rt27q2sw==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q6RIt-000Z8r-0R; Tue, 06 Jun 2023 07:40:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  6 Jun 2023 09:39:30 +0200
Message-Id: <20230606073950.225178-12-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230606073950.225178-1-hch@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Make the function name match the method name. Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- block/fops.c | 4 ++-- 1 file changed,
 2 insertions(+), 2 deletions(-) diff --git a/block/fops.c b/block/fops.c index
 6a3087b750a6cd..26af2b39c758e1 100644 --- a/block/fops.c +++ b/block/fops.c
 @@ -500,7 +500,7 @@ static int blkdev_open(struct inode *inode, struct file
 * [...] Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q6RJJ-0003an-QS
Subject: [f2fs-dev] [PATCH 11/31] block: rename blkdev_close to
 blkdev_release
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Make the function name match the method name.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/fops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index 6a3087b750a6cd..26af2b39c758e1 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -500,7 +500,7 @@ static int blkdev_open(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-static int blkdev_close(struct inode *inode, struct file *filp)
+static int blkdev_release(struct inode *inode, struct file *filp)
 {
 	struct block_device *bdev = filp->private_data;
 
@@ -677,7 +677,7 @@ static long blkdev_fallocate(struct file *file, int mode, loff_t start,
 
 const struct file_operations def_blk_fops = {
 	.open		= blkdev_open,
-	.release	= blkdev_close,
+	.release	= blkdev_release,
 	.llseek		= blkdev_llseek,
 	.read_iter	= blkdev_read_iter,
 	.write_iter	= blkdev_write_iter,
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
