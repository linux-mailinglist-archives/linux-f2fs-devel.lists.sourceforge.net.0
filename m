Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5D727DC2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jun 2023 13:04:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7DR7-000702-K1;
	Thu, 08 Jun 2023 11:04:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+69acd89764e6999cdd63+7228+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q7DR6-0006zs-C3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BWc5z9HT4dUA9mjQNGkIg08JFiqviKFgFc2kwBdnmvA=; b=LvJv/A6yU6ExdrZ6m1FDlDxTFB
 TG0QpAdJ7TO8Pq+KZvQ4eDD7ebZQj2tXXqET/1gNJbfuS4z7WeJcweuvmpowoD2D2sFmN5XK1on5L
 ncQ4lD+3V9Pkfj+yqpiH4xbxlr/Nsocw6BPMkHq2vutGS5m4HeBRj5xrDKYxYh+rIHAM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BWc5z9HT4dUA9mjQNGkIg08JFiqviKFgFc2kwBdnmvA=; b=GwsI8zzZRjUNyQ33Uva7xAddNy
 rbYMYSmfRDxbPB2nNdPMNzGuOXI9NISJExjBDIyDYuvRzq/Smd901IcmK61sMpxDGY64vexQ4mLZr
 J4Pg7QBdA7ukbcryvb68BvDT0441GMto306r97mv4HuUuphI+arAp4TxiKmWcvdkRvdU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q7DR5-0000Ps-HI for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=BWc5z9HT4dUA9mjQNGkIg08JFiqviKFgFc2kwBdnmvA=; b=DSaSxe/TisXuiNZhOR1TgSi7tx
 33lAtkUXPMOr9WQm9Z+HhNKEJGoeKJSluj7uhXRCmimH7VoHS0E0fvUNcZ7UiWxsb/tBtz6fXhZlr
 GE9jtxC+Q8FoQSEQz+4vk9nOOH8BTAjfrUuFLcHba2SvPuPGZNkEv8QjVxkATSDkihbdNi6umKqVB
 7p2NEvk5EAeqwWcAKAwVWRbUBkG4tyEy/NutpgRnWrvU0mWTHAqNh1aG3veS9lJl/Zm3XwnRRN4uy
 kPNwBnK5dcXc2ETiMnCmg0liMCPKVYmWiFEJ6OPE/jhf6OnfgqyBEoO+PrWwml+/G7QKTlQlKNK+/
 sLCUxnmg==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q7DQR-00921s-1m; Thu, 08 Jun 2023 11:03:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  8 Jun 2023 13:02:39 +0200
Message-Id: <20230608110258.189493-12-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230608110258.189493-1-hch@lst.de>
References: <20230608110258.189493-1-hch@lst.de>
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
 Content preview: holder is just an on-stack pointer that can easily be reused
 by other calls,
 replace it with a static variable that doesn't change. Signed-off-by:
 Christoph Hellwig <hch@lst.de> Reviewed-by: Hannes Reinecke <hare@suse.de>
 --- kernel/power/swap.c | 5 +++-- 1 file changed, 3 insertions(+),
 2 deletions(-)
 Content analysis details:   (-2.1 points, 6.0 required)
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q7DR5-0000Ps-HI
Subject: [f2fs-dev] [PATCH 11/30] swsusp: don't pass a stack address to
 blkdev_get_by_path
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
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

holder is just an on-stack pointer that can easily be reused by other calls,
replace it with a static variable that doesn't change.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 kernel/power/swap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/power/swap.c b/kernel/power/swap.c
index 81aec3b2c60510..b03ff1a33c7f68 100644
--- a/kernel/power/swap.c
+++ b/kernel/power/swap.c
@@ -1510,6 +1510,8 @@ int swsusp_read(unsigned int *flags_p)
 	return error;
 }
 
+static void *swsusp_holder;
+
 /**
  *      swsusp_check - Check for swsusp signature in the resume device
  */
@@ -1517,14 +1519,13 @@ int swsusp_read(unsigned int *flags_p)
 int swsusp_check(bool snapshot_test)
 {
 	int error;
-	void *holder;
 	fmode_t mode = FMODE_READ;
 
 	if (snapshot_test)
 		mode |= FMODE_EXCL;
 
 	hib_resume_bdev = blkdev_get_by_dev(swsusp_resume_device,
-					    mode, &holder, NULL);
+					    mode, &swsusp_holder, NULL);
 	if (!IS_ERR(hib_resume_bdev)) {
 		set_blocksize(hib_resume_bdev, PAGE_SIZE);
 		clear_page(swsusp_header);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
