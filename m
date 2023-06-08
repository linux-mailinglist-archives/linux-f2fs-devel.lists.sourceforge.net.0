Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 749CA727D9C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jun 2023 13:03:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7DQY-0007gz-9u;
	Thu, 08 Jun 2023 11:03:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+69acd89764e6999cdd63+7228+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q7DQV-0007gm-Fk for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BmFZdJDxSYPrPp/5b46O5wB0cxwTyzebO+dineKE9zs=; b=In4G0PcdLGo7bfVrCCFZ8M5d1W
 //PPGcpdfXvSlQN5liIutnCqGniO77wKbzOYDrbWgpwtlwyBHEVEAiR2gZBOgpBbCd26lve61pqac
 nsHzK19acjBa+ANULkfaPoKs1TLMsZWK/cKle4aT0IoH4fJ8BVI/o3qPY/QI58w+vn+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BmFZdJDxSYPrPp/5b46O5wB0cxwTyzebO+dineKE9zs=; b=EE+CxDD1LaD7SJ7a6besssSnV2
 kRx93pnjZRefdkp6IeWYu2YprryzHxC8t2Oedd2DeBcfE6oZbKS8BhuuCSmT4aFzrWxhU/CuPefO9
 uuYOQqgxoNi2SiNAVztQe2aFdnYlZ0hAotLcLv750rRIREO0vmyFUyaM/DVtzhFylbPs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q7DQU-00Eduv-Ni for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=BmFZdJDxSYPrPp/5b46O5wB0cxwTyzebO+dineKE9zs=; b=sEDimAvob7MsJTQnU0rfHCx94d
 TdllY86Cgn+v1SVN38tEQDXX4gAk1rNeoTKW+8ZlBOTi/fywSiY5VFvHOx7wywJCeRwbpr6Rc5OV2
 Qn35jAilebfCm5iZIKh9BpxnZdW2qf98gnQnauyg93xz9gkg41imSWuTTWRGc3tIDKoALBp91G9o6
 jZsvNijnfwJ0q/ZfIKAWaR1RGACVCLSBIRby5PljwCv8yIUptjEY0m+/nxG7gZzBPDoR9qSPQzpaj
 hSrlKhYfDXptX12/RipQ3OpNcjhXiay/LkgB3ISIbEhcYS8IEk/HBewUsKErT7gnhsGpw60ix5iXa
 C9QR9LAA==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q7DQ8-0091fh-0H; Thu, 08 Jun 2023 11:03:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  8 Jun 2023 13:02:32 +0200
Message-Id: <20230608110258.189493-5-hch@lst.de>
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
 Content preview:  cdrom_close_write is empty, and the for_data flag it is keyed
 off is never set. Remove all this clutter. Signed-off-by: Christoph Hellwig
 <hch@lst.de> Reviewed-by: Phillip Potter <phil@philpotter.co.uk> Reviewed-by:
 Hannes Reinecke <hare@suse.de> Acked-by: Christian Brauner
 <brauner@kernel.org> --- drive [...] 
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
X-Headers-End: 1q7DQU-00Eduv-Ni
Subject: [f2fs-dev] [PATCH 04/30] cdrom: remove the unused cdrom_close_write
 release code
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

cdrom_close_write is empty, and the for_data flag it is keyed off is
never set.  Remove all this clutter.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Phillip Potter <phil@philpotter.co.uk>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Acked-by: Christian Brauner <brauner@kernel.org>
---
 drivers/cdrom/cdrom.c | 15 ---------------
 include/linux/cdrom.h |  1 -
 2 files changed, 16 deletions(-)

diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
index 245e5bbb05d41c..08abf1ffede002 100644
--- a/drivers/cdrom/cdrom.c
+++ b/drivers/cdrom/cdrom.c
@@ -978,15 +978,6 @@ static void cdrom_dvd_rw_close_write(struct cdrom_device_info *cdi)
 	cdi->media_written = 0;
 }
 
-static int cdrom_close_write(struct cdrom_device_info *cdi)
-{
-#if 0
-	return cdrom_flush_cache(cdi);
-#else
-	return 0;
-#endif
-}
-
 /* badly broken, I know. Is due for a fixup anytime. */
 static void cdrom_count_tracks(struct cdrom_device_info *cdi, tracktype *tracks)
 {
@@ -1282,12 +1273,6 @@ void cdrom_release(struct cdrom_device_info *cdi, fmode_t mode)
 	opened_for_data = !(cdi->options & CDO_USE_FFLAGS) ||
 		!(mode & FMODE_NDELAY);
 
-	/*
-	 * flush cache on last write release
-	 */
-	if (CDROM_CAN(CDC_RAM) && !cdi->use_count && cdi->for_data)
-		cdrom_close_write(cdi);
-
 	cdo->release(cdi);
 	if (cdi->use_count == 0) {      /* last process that closes dev*/
 		if (opened_for_data &&
diff --git a/include/linux/cdrom.h b/include/linux/cdrom.h
index 4aea8c82d16971..0a5db0b0c958a1 100644
--- a/include/linux/cdrom.h
+++ b/include/linux/cdrom.h
@@ -61,7 +61,6 @@ struct cdrom_device_info {
 	__u8 last_sense;
 	__u8 media_written;		/* dirty flag, DVD+RW bookkeeping */
 	unsigned short mmc3_profile;	/* current MMC3 profile */
-	int for_data;
 	int (*exit)(struct cdrom_device_info *);
 	int mrw_mode_page;
 	__s64 last_media_change_ms;
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
