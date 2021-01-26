Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4942A3041FF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 16:15:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4Q47-00038R-PB; Tue, 26 Jan 2021 15:15:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b7a2078c382f6036dc0e+6365+infradead.org+hch@casper.srs.infradead.org>)
 id 1l4Q46-000389-KS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jUX/nPv36iBJWdAHLrELJid7jXvEdNR6cRFF7NPxZ3A=; b=cKtTFpVQozUcR9SdBOmgh2FjTu
 kMs0RxKCkzJhmy60crhza1tbpfyQxcWLsqfA8MZw23/8G4IrlCNKEu0irEBxdiSiiIEa17dFhw+zW
 UXFhoGFvg+Omjq7pSkLNnSpBl/QBxnOYhXfSym9N25qNcRFo2XBeptfN6aeaMtn/BN1k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jUX/nPv36iBJWdAHLrELJid7jXvEdNR6cRFF7NPxZ3A=; b=Pxb39Il0EJU1cP+L3rUBit8Lb0
 5SumUrGvJxJfnjFdf/5GD7TL6AKLKOdC9OYCmjehgf7lpkmN+2oOucnXvEssy/QjIIMkv+A1o32uP
 r3Cd5EDvbnN0HmctYuRaPNArvYcdtfAjuBlf6ke8JdYx7PmZHlsHu6iMnJTdMbkrqVS8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4Q3z-006lQ5-RC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=jUX/nPv36iBJWdAHLrELJid7jXvEdNR6cRFF7NPxZ3A=; b=IpTioxravckm1qWlFlhuTXqcRU
 NUrQRXmnYaUUkiw+vad9k9lpdmMyYrpgXEgukSClL8PPJYRMAlC6PbXKGyHzkg4QgCq5ytPbIctU0
 Wu+AAg1vTUjodle4xRBeGFJxUuV90SjBomvdcXWoLsGxNckVxTg/NO0lV2QQg3NnOBl2C8ucoaGEh
 e1e0LT8AvFm3CKPyjDORVskFTIoraKd9UA3fA3R7jCx0mHdzlJoYhJv4fTxkNjiCdEnjZjfhVcdEP
 wpDTJ0dmomAG1DDIPybWzoJF6Nb0MGrzyoAKs8QVsymaQzhznpqBFzqeBp8JY+LKtIDBeAIgk0+OS
 j0VgL1sQ==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l4Pxm-005nbR-LQ; Tue, 26 Jan 2021 15:09:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:40 +0100
Message-Id: <20210126145247.1964410-11-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126145247.1964410-1-hch@lst.de>
References: <20210126145247.1964410-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l4Q3z-006lQ5-RC
Subject: [f2fs-dev] [PATCH 10/17] drbd: remove drbd_req_make_private_bio
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
Cc: Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org, dm-devel@redhat.com,
 drbd-dev@lists.linbit.com, Naohiro Aota <naohiro.aota@wdc.com>,
 linux-nilfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 linux-nfs@vger.kernel.org, Coly Li <colyli@suse.de>,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-block@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Open code drbd_req_make_private_bio in the two callers to prepare
for further changes.  Also don't bother to initialize bi_next as the
bio code already does that that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_req.c    |  5 ++++-
 drivers/block/drbd/drbd_req.h    | 12 ------------
 drivers/block/drbd/drbd_worker.c |  5 ++++-
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index ea0f31ab334361..9dbb660a7d7c8e 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -30,7 +30,10 @@ static struct drbd_request *drbd_req_new(struct drbd_device *device, struct bio
 		return NULL;
 	memset(req, 0, sizeof(*req));
 
-	drbd_req_make_private_bio(req, bio_src);
+	req->private_bio = bio_clone_fast(bio_src, GFP_NOIO, &drbd_io_bio_set);
+	req->private_bio->bi_private = req;
+	req->private_bio->bi_end_io = drbd_request_endio;
+
 	req->rq_state = (bio_data_dir(bio_src) == WRITE ? RQ_WRITE : 0)
 		      | (bio_op(bio_src) == REQ_OP_WRITE_SAME ? RQ_WSAME : 0)
 		      | (bio_op(bio_src) == REQ_OP_WRITE_ZEROES ? RQ_ZEROES : 0)
diff --git a/drivers/block/drbd/drbd_req.h b/drivers/block/drbd/drbd_req.h
index 55bb0f8721faa3..511f39a08de453 100644
--- a/drivers/block/drbd/drbd_req.h
+++ b/drivers/block/drbd/drbd_req.h
@@ -256,18 +256,6 @@ enum drbd_req_state_bits {
 #define MR_WRITE       1
 #define MR_READ        2
 
-static inline void drbd_req_make_private_bio(struct drbd_request *req, struct bio *bio_src)
-{
-	struct bio *bio;
-	bio = bio_clone_fast(bio_src, GFP_NOIO, &drbd_io_bio_set);
-
-	req->private_bio = bio;
-
-	bio->bi_private  = req;
-	bio->bi_end_io   = drbd_request_endio;
-	bio->bi_next     = NULL;
-}
-
 /* Short lived temporary struct on the stack.
  * We could squirrel the error to be returned into
  * bio->bi_iter.bi_size, or similar. But that would be too ugly. */
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 02044ab7f767d5..64563bfdf0da02 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -1523,8 +1523,11 @@ int w_restart_disk_io(struct drbd_work *w, int cancel)
 	if (bio_data_dir(req->master_bio) == WRITE && req->rq_state & RQ_IN_ACT_LOG)
 		drbd_al_begin_io(device, &req->i);
 
-	drbd_req_make_private_bio(req, req->master_bio);
+	req->private_bio = bio_clone_fast(req->master_bio, GFP_NOIO,
+					  &drbd_io_bio_set);
 	bio_set_dev(req->private_bio, device->ldev->backing_bdev);
+	req->private_bio->bi_private = req;
+	req->private_bio->bi_end_io = drbd_request_endio;
 	submit_bio_noacct(req->private_bio);
 
 	return 0;
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
