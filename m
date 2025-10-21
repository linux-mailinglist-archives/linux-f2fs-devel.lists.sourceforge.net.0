Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF85BF4F56
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 09:28:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqKOee++4754T7StBzhQod4glyoXHZugtc0NK1R0+bY=; b=I36guTxn0w0x/IlbsDo2OLZizh
	NrbQqCZaWr1Jo+jC2Vqcu7dLYm731FZRZJbNeCat1HuLKwTGxPjdG56DaqmLdvWQGG6PcYGXfP8Ep
	RestwlVJsrdsrt+XU+9YDHVO8tVJvRtm0LxPcVb/EtGQlNl95NKRiPnv1KBXkLmoJyCg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vB6mu-0008DY-Hs;
	Tue, 21 Oct 2025 07:28:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=382e81130=mngyadam@amazon.de>)
 id 1vB6mt-0008DR-CV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xox3qTc8hYU6L3c6JXOuETVCy0yWRIpRqh99YwnzkOo=; b=l89TJ/XafWUeXnyWcPT5o11ejM
 KZ1ZqtOviPMYU9Sa12ViGRtDF4BD3ZKl9HfLoOMWTNhKSyEz6j3YyMLsybhAvcKXd3t3tIJkWYTIY
 ELHic2UNc18T+GcLSViVLpODS1zjNYe9p6yhZ6pK+3lWCq18nmjr7TWryy+YIhtISQmc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xox3qTc8hYU6L3c6JXOuETVCy0yWRIpRqh99YwnzkOo=; b=Zdy6D9tX174D7wZCmWawqkcTx7
 RiPEzKJQrn/w63RoyN3AcxAmXx2PQfXnu3a3gpiK+I1SlBd1YodA9WEFZyOaK0DOLUH8CJOxwNRAz
 rRf1rszIBGuKbLzpc8c23/u23vw/4BLlVLqojfrU08ZR8x5sOfyzQNApPSi0ZMnMpH6Y=;
Received: from fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 ([63.178.132.221]) by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vB6mr-0007dS-Qk for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
 t=1761031685; x=1792567685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xox3qTc8hYU6L3c6JXOuETVCy0yWRIpRqh99YwnzkOo=;
 b=rE4aSVS5PffDNOf1A0j9LKn8EiRnS/ur/eyrAbcW2mxuUsJtBwHLW1C1
 QNurmf2NEgtzd3u0SmA7RmGn04EBITikawtS/tOBttL4ANQJn9At9oVYt
 Wceb0HPeCpCk7yflQ/oZwraKhFgXDYZpbzCsJjwQqRNHrnoK84yHLJmKk
 GQPzjL+0yU+u0Vc7lvTrHhS3wjUOOcqipWXeB1D9M/ULRglRgwrZpooTM
 GXfbrryQDDEvfELikBa6KX67tFRNm/0RDu8SYKmRcHqKv4gFjobfZmJ5P
 8BL6izNJgULolG5BZIuMgPncX/agRJfBY9BVnfkXtiN83WSHeWYLIll2y Q==;
X-CSE-ConnectionGUID: 6VGIvb/dQ++kJKWLFnmwYA==
X-CSE-MsgGUID: OwKsQXoZQsikLSKYYlhXrA==
X-IronPort-AV: E=Sophos;i="6.19,244,1754956800"; 
   d="scan'208";a="3828837"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
 by internal-fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:11:57 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:11098]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.17.8:2525]
 with esmtp (Farcaster)
 id 6cec1b60-3232-473d-9f64-4d0e631f5a13; Tue, 21 Oct 2025 07:11:57 +0000 (UTC)
X-Farcaster-Flow-ID: 6cec1b60-3232-473d-9f64-4d0e631f5a13
Received: from EX19D013EUB004.ant.amazon.com (10.252.51.92) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 21 Oct 2025 07:11:57 +0000
Received: from dev-dsk-mngyadam-1c-cb3f7548.eu-west-1.amazon.com
 (10.253.107.175) by EX19D013EUB004.ant.amazon.com (10.252.51.92) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Tue, 21 Oct 2025
 07:11:48 +0000
To: <stable@vger.kernel.org>
Date: Tue, 21 Oct 2025 09:03:41 +0200
Message-ID: <20251021070353.96705-8-mngyadam@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021070353.96705-2-mngyadam@amazon.de>
References: <20251021070353.96705-2-mngyadam@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [10.253.107.175]
X-ClientProxiedBy: EX19D045UWA003.ant.amazon.com (10.13.139.46) To
 EX19D013EUB004.ant.amazon.com (10.252.51.92)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Christoph Hellwig <hch@lst.de> commit
 727cfe976758b79f8d2f8051c75a5ccb14539a56
 upstream. Open code __generic_file_write_iter to remove the indirect call
 into ->direct_IO and to prepare using the iomap based write code. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vB6mr-0007dS-Qk
Subject: [f2fs-dev] [PATCH 6.1 6/8] block: open code
 __generic_file_write_iter for blkdev writes
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
From: Mahmoud Adam via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mahmoud Adam <mngyadam@amazon.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, nagy@khwaternagy.com,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Christoph Hellwig <hch@lst.de>, linux-nilfs@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Christoph Hellwig <hch@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le
 Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Ryusuke
 Konishi <konishi.ryusuke@gmail.com>, Jens Axboe <axboe@kernel.dk>, Christian
 Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 gregkh@linuxfoundation.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Luis
 Chamberlain <mcgrof@kernel.org>, Anna Schumaker <anna@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Christoph Hellwig <hch@lst.de>

commit 727cfe976758b79f8d2f8051c75a5ccb14539a56 upstream.

Open code __generic_file_write_iter to remove the indirect call into
->direct_IO and to prepare using the iomap based write code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Christian Brauner <brauner@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Link: https://lore.kernel.org/r/20230801172201.1923299-4-hch@lst.de
Signed-off-by: Jens Axboe <axboe@kernel.dk>
[fix contextual changes]
Signed-off-by: Mahmoud Adam <mngyadam@amazon.de>
---
 block/fops.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index b02fe200c3ecd0..fb7a57ed42d995 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -515,6 +515,30 @@ static int blkdev_close(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+static ssize_t
+blkdev_direct_write(struct kiocb *iocb, struct iov_iter *from)
+{
+	size_t count = iov_iter_count(from);
+	ssize_t written;
+
+	written = kiocb_invalidate_pages(iocb, count);
+	if (written) {
+		if (written == -EBUSY)
+			return 0;
+		return written;
+	}
+
+	written = blkdev_direct_IO(iocb, from);
+	if (written > 0) {
+		kiocb_invalidate_post_direct_write(iocb, count);
+		iocb->ki_pos += written;
+		count -= written;
+	}
+	if (written != -EIOCBQUEUED)
+		iov_iter_revert(from, count - iov_iter_count(from));
+	return written;
+}
+
 /*
  * Write data to the block device.  Only intended for the block device itself
  * and the raw driver which basically is a fake block device.
@@ -524,7 +548,8 @@ static int blkdev_close(struct inode *inode, struct file *filp)
  */
 static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
-	struct block_device *bdev = iocb->ki_filp->private_data;
+	struct file *file = iocb->ki_filp;
+	struct block_device *bdev = file->private_data;
 	struct inode *bd_inode = bdev->bd_inode;
 	loff_t size = bdev_nr_bytes(bdev);
 	struct blk_plug plug;
@@ -553,7 +578,23 @@ static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	}
 
 	blk_start_plug(&plug);
-	ret = __generic_file_write_iter(iocb, from);
+	ret = file_remove_privs(file);
+	if (ret)
+		return ret;
+
+	ret = file_update_time(file);
+	if (ret)
+		return ret;
+
+	if (iocb->ki_flags & IOCB_DIRECT) {
+		ret = blkdev_direct_write(iocb, from);
+		if (ret >= 0 && iov_iter_count(from))
+			ret = direct_write_fallback(iocb, from, ret,
+					generic_perform_write(iocb, from));
+	} else {
+		ret = generic_perform_write(iocb, from);
+	}
+
 	if (ret > 0)
 		ret = generic_write_sync(iocb, ret);
 	iov_iter_reexpand(from, iov_iter_count(from) + shorted);
-- 
2.47.3




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
