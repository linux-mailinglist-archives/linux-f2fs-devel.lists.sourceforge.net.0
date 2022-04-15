Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FBD502185
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Apr 2022 06:53:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfDxj-0002a2-4M; Fri, 15 Apr 2022 04:53:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+2d633663de0085320ac7+6809+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nfDxf-0002Zm-ED; Fri, 15 Apr 2022 04:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6JVZQz23Gg3oLV4oYc05UwmOH+nGeMd1Qpin5+I9KgM=; b=JGPi2lY46RRiPU+pHxvN2cRWhi
 A9VVgfKzf7l9S4YQzic80lFuFwNBY2T29pQVDfsXXyzZw6DkrgZ4yvST4S1NH41IKojkCDNNXoxhs
 2geQw6oB6dnEBHR+9lasfUgtZhA4yf4jACh0TqDZpu5yM8K8BOakUzH9PDVcd56dV6Tc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6JVZQz23Gg3oLV4oYc05UwmOH+nGeMd1Qpin5+I9KgM=; b=FFIYcYD7gjmD+0KdJOOxkOehsb
 aKVyojWnfpzBzK7SyO5DQN9fu7TOydFLY80J2DWofLyr5zH6dRbiUcDG41u0ErXOndz2T1vAdJJ8a
 3Rlp6VMq85ZPj65etqnWcDYzhaHn3OX+wJVfo07QFGziLvyrWkEkM6OtnnJjJziERgwo=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfDxe-0001p3-Ay; Fri, 15 Apr 2022 04:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6JVZQz23Gg3oLV4oYc05UwmOH+nGeMd1Qpin5+I9KgM=; b=p4/UQY65J530pBrFxSnyzz+s1S
 20vQFpTrN15G6NO5F9VDuyGriDpCNyWjbyKgPkMSrLLko0Q4FtJ1eCzi+YOgwapAyJib+3l/z0nqL
 +NYMVQXNHIEHx4U8dz9u48TnCqPcYXyNXVQmQKYJgAexB2zuX97VLPbrU2HmJIKE7g1fg+Kmpeu2X
 7In2j9JZDuGthZuxusAdOOuAjghMTjSwC/AdUlo5SnfFd1vgrm4uEPQ78/HVr7y9+RCydI3REXKPH
 s1r/AwsdOouUPRQPQY3Kuv+Zv/88cYk9RfHpmYADsU3re53XPeDNlC3OFKsZfaMhZuxBpfzjqoDMO
 ifzKUlSQ==;
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDxP-008OnZ-2m; Fri, 15 Apr 2022 04:53:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 15 Apr 2022 06:52:33 +0200
Message-Id: <20220415045258.199825-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
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
 Content preview: The SCSI target drivers is a consumer of the block layer and
 shoul d generally work on struct block_device. Signed-off-by: Christoph
 Hellwig
 <hch@lst.de> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
 --- drivers/target/target_core_device.c | 5 +++--
 drivers/target/target_core_file.c | 7 ++++- [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nfDxe-0001p3-Ay
Subject: [f2fs-dev] [PATCH 02/27] target: pass a block_device to
 target_configure_unmap_from_queue
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
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The SCSI target drivers is a consumer of the block layer and shoul
d generally work on struct block_device.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 drivers/target/target_core_device.c  | 5 +++--
 drivers/target/target_core_file.c    | 7 ++++---
 drivers/target/target_core_iblock.c  | 2 +-
 include/target/target_core_backend.h | 4 ++--
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
index fa866acef5bb2..3a1ec705cd80b 100644
--- a/drivers/target/target_core_device.c
+++ b/drivers/target/target_core_device.c
@@ -834,9 +834,10 @@ struct se_device *target_alloc_device(struct se_hba *hba, const char *name)
  * in ATA and we need to set TPE=1
  */
 bool target_configure_unmap_from_queue(struct se_dev_attrib *attrib,
-				       struct request_queue *q)
+				       struct block_device *bdev)
 {
-	int block_size = queue_logical_block_size(q);
+	struct request_queue *q = bdev_get_queue(bdev);
+	int block_size = bdev_logical_block_size(bdev);
 
 	if (!blk_queue_discard(q))
 		return false;
diff --git a/drivers/target/target_core_file.c b/drivers/target/target_core_file.c
index 8190b840065f3..8d191fdc33217 100644
--- a/drivers/target/target_core_file.c
+++ b/drivers/target/target_core_file.c
@@ -134,10 +134,11 @@ static int fd_configure_device(struct se_device *dev)
 	 */
 	inode = file->f_mapping->host;
 	if (S_ISBLK(inode->i_mode)) {
-		struct request_queue *q = bdev_get_queue(I_BDEV(inode));
+		struct block_device *bdev = I_BDEV(inode);
+		struct request_queue *q = bdev_get_queue(bdev);
 		unsigned long long dev_size;
 
-		fd_dev->fd_block_size = bdev_logical_block_size(I_BDEV(inode));
+		fd_dev->fd_block_size = bdev_logical_block_size(bdev);
 		/*
 		 * Determine the number of bytes from i_size_read() minus
 		 * one (1) logical sector from underlying struct block_device
@@ -150,7 +151,7 @@ static int fd_configure_device(struct se_device *dev)
 			dev_size, div_u64(dev_size, fd_dev->fd_block_size),
 			fd_dev->fd_block_size);
 
-		if (target_configure_unmap_from_queue(&dev->dev_attrib, q))
+		if (target_configure_unmap_from_queue(&dev->dev_attrib, bdev))
 			pr_debug("IFILE: BLOCK Discard support available,"
 				 " disabled by default\n");
 		/*
diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index 87ede165ddba4..b886ce1770bfd 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -119,7 +119,7 @@ static int iblock_configure_device(struct se_device *dev)
 	dev->dev_attrib.hw_max_sectors = queue_max_hw_sectors(q);
 	dev->dev_attrib.hw_queue_depth = q->nr_requests;
 
-	if (target_configure_unmap_from_queue(&dev->dev_attrib, q))
+	if (target_configure_unmap_from_queue(&dev->dev_attrib, bd))
 		pr_debug("IBLOCK: BLOCK Discard support available,"
 			 " disabled by default\n");
 
diff --git a/include/target/target_core_backend.h b/include/target/target_core_backend.h
index 675f3a1fe6139..773963a1e0b53 100644
--- a/include/target/target_core_backend.h
+++ b/include/target/target_core_backend.h
@@ -14,7 +14,7 @@
 #define TRANSPORT_FLAG_PASSTHROUGH_ALUA		0x2
 #define TRANSPORT_FLAG_PASSTHROUGH_PGR          0x4
 
-struct request_queue;
+struct block_device;
 struct scatterlist;
 
 struct target_backend_ops {
@@ -117,7 +117,7 @@ sense_reason_t passthrough_parse_cdb(struct se_cmd *cmd,
 bool target_sense_desc_format(struct se_device *dev);
 sector_t target_to_linux_sector(struct se_device *dev, sector_t lb);
 bool target_configure_unmap_from_queue(struct se_dev_attrib *attrib,
-				       struct request_queue *q);
+				       struct block_device *bdev);
 
 static inline bool target_dev_configured(struct se_device *se_dev)
 {
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
