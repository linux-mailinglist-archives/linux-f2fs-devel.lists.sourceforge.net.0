Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGCVB1qCqGmYvAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 20:04:58 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AF3206DA8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 20:04:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1KRrwZZbpeYLWzkK/9dLCzfg7cco9kDboYa/BIDKJ4=; b=AlZXRRUIj3D12ouMJJWTpRR2nb
	duskLsIYFnznvBgv13+z+YIEGOVVXKiYqDHLeQ9xrFqyEXhRU1GWrEllwvmr+z+VnCtNIcFyFeEH4
	oUuCVeWoYWPEzczHxOlWa5g62JNwHeiUILV5qw5uSYHGhJxKBG2lfKwVPEtQpEndZ5u0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxrWd-00012q-DV;
	Wed, 04 Mar 2026 19:04:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <agruenba@redhat.com>) id 1vxrWc-00012k-F1
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 19:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cjLvbwBfqfXiZnaMfS45T56EHtgzdALqjSiM9T5ouBw=; b=HYvyyOgp5gCeKUlLRiQvg8O35I
 2nd706h0SrXaMLv0aS37urKAwC0Crd65LbqS4F8Qh3yqt5EhBanXp1bITJuOaTco0kIyZMhpLayxg
 5ZbFrvxJZdQb/CIcmI7CHniSVMgVG/ozY4BhgLKxL4XCaWauGAlGnJr1IA1tase+TRwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cjLvbwBfqfXiZnaMfS45T56EHtgzdALqjSiM9T5ouBw=; b=D0AM/RKqwHnIdvL19ely9+otOP
 yN23jwBcshnkuClVI8a1eNfk/SphVvHjAcqS0+oGmcoWURyFFlBPmOeXrYqdtPmlySVxl89WXO74D
 iGK9sLYBlljPq3rrkHV+uPKu9SqSW1dmPK4dgug5AU5e0pGzHDct1zWrNgI+RUKzMDxU=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxrWb-0001WH-TW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 19:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772651084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjLvbwBfqfXiZnaMfS45T56EHtgzdALqjSiM9T5ouBw=;
 b=FzYsDoFHRHE5Sw4d2jeBFMpimHttxKa7wJ5zZzznSzshkXf2ufTNZ1ptq+xKZuzo5WLent
 vQVgXFpjhO2Ur6ved0lfGns5Ac2xf4Mw4ZkHdOXsgW/2WoJLLQTEKP1hW7/y6IDV9dWgeU
 yLlVmBU0a15e5KvWN1vYbNf4Fq7OYXA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-321--lemc0VmNrClkT2m_r8aQg-1; Wed,
 04 Mar 2026 14:04:42 -0500
X-MC-Unique: -lemc0VmNrClkT2m_r8aQg-1
X-Mimecast-MFC-AGG-ID: -lemc0VmNrClkT2m_r8aQg_1772651081
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A3448195605C; Wed,  4 Mar 2026 19:04:40 +0000 (UTC)
Received: from pasta.fast.eng.rdu2.dc.redhat.com (unknown [10.44.32.29])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D8CD81800576; Wed,  4 Mar 2026 19:04:37 +0000 (UTC)
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  4 Mar 2026 20:04:09 +0100
Message-ID: <20260304190424.291743-5-agruenba@redhat.com>
In-Reply-To: <20260304190424.291743-1-agruenba@redhat.com>
References: <20260304190424.291743-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 3gBn3qK86F6uIN0MBqKAkjOtW2iHUWheaxCq17UsbhE_1772651081
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Instead of setting bio->bi_status to BLK_STS_IOERR and
 calling
 bio_endio(bio), use the shorthand bio_io_error(bio). Created with Coccinelle
 using the following semantic patch: @@ struct bio *bio; @@ - bio->bi_status
 = BLK_STS_IOERR; - bio_endio(bio); + bio_io_error(bio); 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxrWb-0001WH-TW
Subject: [f2fs-dev] [PATCH 4/4] bio: use bio_io_error more often
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
From: Andreas Gruenbacher via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: dm-devel@lists.linux.dev, Andreas Gruenbacher <agruenba@redhat.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: A8AF3206DA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:agruenba@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,m:hch@lst.de,m:drbd-dev@lists.linbit.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[agruenba@redhat.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

Instead of setting bio->bi_status to BLK_STS_IOERR and calling
bio_endio(bio), use the shorthand bio_io_error(bio).

Created with Coccinelle using the following semantic patch:

@@
struct bio *bio;
@@
- bio->bi_status = BLK_STS_IOERR;
- bio_endio(bio);
+ bio_io_error(bio);

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 block/fops.c                  | 3 +--
 drivers/block/drbd/drbd_int.h | 3 +--
 drivers/md/bcache/bcache.h    | 3 +--
 drivers/md/bcache/request.c   | 6 ++----
 drivers/md/dm-mpath.c         | 3 +--
 drivers/md/dm-writecache.c    | 3 +--
 fs/f2fs/segment.c             | 3 +--
 7 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index bb6642b45937..9547f656904d 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -218,8 +218,7 @@ static ssize_t __blkdev_direct_IO(struct kiocb *iocb, struct iov_iter *iter,
 
 		ret = blkdev_iov_iter_get_pages(bio, iter, bdev);
 		if (unlikely(ret)) {
-			bio->bi_status = BLK_STS_IOERR;
-			bio_endio(bio);
+			bio_io_error(bio);
 			break;
 		}
 		if (iocb->ki_flags & IOCB_NOWAIT) {
diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index f6d6276974ee..32639e8ea72a 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1491,8 +1491,7 @@ static inline void drbd_submit_bio_noacct(struct drbd_device *device,
 	__release(local);
 	if (!bio->bi_bdev) {
 		drbd_err(device, "drbd_submit_bio_noacct: bio->bi_bdev == NULL\n");
-		bio->bi_status = BLK_STS_IOERR;
-		bio_endio(bio);
+		bio_io_error(bio);
 		return;
 	}
 
diff --git a/drivers/md/bcache/bcache.h b/drivers/md/bcache/bcache.h
index ec9ff9715081..e0c9d9eef0a0 100644
--- a/drivers/md/bcache/bcache.h
+++ b/drivers/md/bcache/bcache.h
@@ -947,8 +947,7 @@ static inline void closure_bio_submit(struct cache_set *c,
 {
 	closure_get(cl);
 	if (unlikely(test_bit(CACHE_SET_IO_DISABLE, &c->flags))) {
-		bio->bi_status = BLK_STS_IOERR;
-		bio_endio(bio);
+		bio_io_error(bio);
 		return;
 	}
 	submit_bio_noacct(bio);
diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
index 3fa3b13a410f..0f6fa0a2920b 100644
--- a/drivers/md/bcache/request.c
+++ b/drivers/md/bcache/request.c
@@ -1178,8 +1178,7 @@ void cached_dev_submit_bio(struct bio *bio)
 
 	if (unlikely((d->c && test_bit(CACHE_SET_IO_DISABLE, &d->c->flags)) ||
 		     dc->io_disable)) {
-		bio->bi_status = BLK_STS_IOERR;
-		bio_endio(bio);
+		bio_io_error(bio);
 		return;
 	}
 
@@ -1283,8 +1282,7 @@ void flash_dev_submit_bio(struct bio *bio)
 	struct bcache_device *d = bio->bi_bdev->bd_disk->private_data;
 
 	if (unlikely(d->c && test_bit(CACHE_SET_IO_DISABLE, &d->c->flags))) {
-		bio->bi_status = BLK_STS_IOERR;
-		bio_endio(bio);
+		bio_io_error(bio);
 		return;
 	}
 
diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index 7cb7bb6233b6..bf4927f58d7f 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -712,8 +712,7 @@ static void process_queued_bios(struct work_struct *work)
 		r = __multipath_map_bio(m, bio, mpio);
 		switch (r) {
 		case DM_MAPIO_KILL:
-			bio->bi_status = BLK_STS_IOERR;
-			bio_endio(bio);
+			bio_io_error(bio);
 			break;
 		case DM_MAPIO_REQUEUE:
 			bio->bi_status = BLK_STS_DM_REQUEUE;
diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 98bd945f6da7..78a730a9b1ef 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -1876,8 +1876,7 @@ static void __writecache_writeback_pmem(struct dm_writecache *wc, struct writeba
 		if (WC_MODE_FUA(wc))
 			bio->bi_opf |= REQ_FUA;
 		if (writecache_has_error(wc)) {
-			bio->bi_status = BLK_STS_IOERR;
-			bio_endio(bio);
+			bio_io_error(bio);
 		} else if (unlikely(!bio_sectors(bio))) {
 			bio->bi_status = BLK_STS_OK;
 			bio_endio(bio);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6a97fe76712b..2dac0cbb5540 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4101,8 +4101,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 	if (fio->bio && *(fio->bio)) {
 		struct bio *bio = *(fio->bio);
 
-		bio->bi_status = BLK_STS_IOERR;
-		bio_endio(bio);
+		bio_io_error(bio);
 		*(fio->bio) = NULL;
 	}
 	return err;
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
