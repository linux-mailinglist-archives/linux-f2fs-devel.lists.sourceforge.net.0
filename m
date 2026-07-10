Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tqpJEhtmUWoFEAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 23:37:31 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C71A73F074
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 23:37:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=CbGJblDm;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="JpKc/kkW";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=DRIM5oZN;
	dkim=fail ("body hash did not verify") header.d=meta.com header.s=s2048-2025-q2 header.b="Ot4Lu/ZK";
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uPlInOkebatsBcg8Xwqxoj8n084+vvRqi7QUt0Lj3s=; b=CbGJblDmYoeqnL376dERHhJeVs
	rnW7cPEhtToeemwQ6fc+LyUOoDA4noKEcqcGJFPP7rmuADb5SGTV++2g55DLUBO2oTdjqQ6bA+txP
	IngJ9Ga6AN+8+x2o6vlFQ/ZUJjIoaqQg3sahRBEf7GFnZBf4xytvCPyFakaVs4Iziu6Y=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wiIuU-00054Z-Eq;
	Fri, 10 Jul 2026 21:37:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=5651d212ed=kbusch@meta.com>) id 1wiIuT-00054S-0V
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 21:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NS1QjaM7KqlyEkyaHi1hRKu76qygyqAC7YHvMQnkRIU=; b=JpKc/kkWziW6AZ6Am3JEDSbjNQ
 U7xELN/bVJYzXSLOVYKugDgWaJL/kCLKHKiEVOdMTXH78x85151AlDTRN0NwoLci9kLlbYBgHknOD
 h/nU+zTfcCwlGVv1k+a0o8+AZa4lLrEba39yRI9TdNAIf4dGlsl/wA32CivdNRC6gVv8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NS1QjaM7KqlyEkyaHi1hRKu76qygyqAC7YHvMQnkRIU=; b=DRIM5oZN/ZG7qRcBcUAFJqt8j8
 14M5DQRHISuKPpdpMgQLb4pP+8iiwfDnmx2hhgBdCEZiaokAorE+Jrpg21njetYpbFzVv6qP1s8dT
 BJ0HQVCq27NVCgDNnjCHhg9n8UOdZe2lbm3njGudaot8Ld+x0D6zysB8KlNZlxwcAK90=;
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]
 helo=mx0a-00082601.pphosted.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wiIuR-0007qr-HD for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 21:37:24 +0000
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66AK4Hsi2117081
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 10 Jul 2026 14:17:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=NS1QjaM7KqlyEkyaHi1hRKu76qygyqAC7YHvMQnkRIU=; b=Ot4Lu/ZKo32+
 M/R8XRizJRuVFbKdxo8YdR4tF9lGfQE6Evh1eE2/yGHI3KWzcOojKGnQSKXwhG2R
 zgje5s/LiwoaXC+aXkNA5/HOtzH5IUVHz1wjS4neNLi9p+hjI5LbHkdRhPEmLGEr
 QfYJzMw1yTNIC81moDSF0NM3p24UFtBgjp9HkbafeaSPq9noATtYD1Rivy+ZVGJ3
 bcaoUEBuwtO+z6xIzXfJhX4wq4/oQsXgdsDfL9GaJpTT2li0FRP6qG9R6LvsybfM
 B97QuXbV6RpdqBoxNXEIk5MIAOROdJPofYh0R7AaHGD8Ocon/ebRsh2OJmNNIm3c
 kW5gIN4yEQ==
Received: from mail.thefacebook.com ([163.114.134.16])
 by m0001303.ppops.net (PPS) with ESMTPS id 4fafb0rrhu-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Jul 2026 14:17:27 -0700 (PDT)
Received: from twshared4282.01.snb2.facebook.com (2620:10d:c085:108::150d) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Fri, 10 Jul 2026 21:17:22 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
 id 5128424F006F6; Fri, 10 Jul 2026 14:06:47 -0700 (PDT)
To: <linux-block@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>,
 <linux-fsdevel@vger.kernel.org>, <linux-xfs@vger.kernel.org>
Date: Fri, 10 Jul 2026 14:06:43 -0700
Message-ID: <20260710210646.3576365-3-kbusch@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260710210646.3576365-1-kbusch@meta.com>
References: <20260710210646.3576365-1-kbusch@meta.com>
MIME-Version: 1.0
X-FB-Internal: Safe
X-Proofpoint-GUID: tGcKjmXs-mecWFUqGH36h4zTOtteI7I_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxNCBTYWx0ZWRfX+yE818+IUpUw
 gNIr70KD5AQU8Zola7ic7IsuPFd2Ijxupv6hO4Jpx4RtkQdaCNVlRoylZ7YtcbrpiwV/qrXbSDT
 FMWiAHLvWCKanzdT++v1LI/oJCNdLVFFvkp8nb8fKVxl9oO7cjoLj1oay4aabaenw9Z7V+aImxZ
 FN7hAjL56fI3CSEFHSBwRqdjR/46qGJPRnzeAlyY+pWNr3wZD8vDaGP0FSvkkyCP401DieF3Tq+
 zb3lE9H4ICwiNBnawpp7lyzAnbM+4G7uFZgtY5a20DlzJ8ocgejJ/A5tvshyycaNLA8L7qiCVnb
 rv0S+aHzt6sIAyS9KwjE9dLGll3I1FFUqFaqUKwzMPN5711In7skN/LN1PjL9AlZgccsWk7YHFs
 tyz69QFLd9uIUa7xO/HbSa3f5cS93ocowGCp8X+8UJ/1+FLCq1S7xX9xUUgj+u42Di3PHs/2Wfr
 w7SxcEQE83zWgm07qAw==
X-Proofpoint-ORIG-GUID: tGcKjmXs-mecWFUqGH36h4zTOtteI7I_
X-Authority-Analysis: v=2.4 cv=ca7iaHDM c=1 sm=1 tr=0 ts=6a516167 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_78whYxrdx1mplLwxq1U:22 a=VwQbUJbxAAAA:8 a=m71_QMC5m3MnXAGbFz4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxNCBTYWx0ZWRfX8p4EwO/Lbxxu
 qz13iLQMVP8B0GMuEfFxCNZu2d5sj9Cus6WFt2ObE50ra45t856VKD/nZXEJkT9FzyjROkoA34B
 rwfNauoU28784apXhQjYjIi7pZnP2Ws=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Keith Busch <kbusch@kernel.org> Add
 bdev_fill_dio_attr()
 to fill the file_attr direct io alignment fields from a block device's queue
 limits,
 so filesystems can share the derivation. Use it to report the attributes
 for block devices [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.153.30 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wiIuR-0007qr-HD
Subject: [f2fs-dev] [PATCHv2 2/5] block: report direct io attributes through
 file_getattr
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
From: Keith Busch via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Keith Busch <kbusch@meta.com>
Cc: axboe@kernel.dk, brauner@kernel.org, aalbersh@kernel.org, jack@suse.cz,
 tytso@mit.edu, Keith Busch <kbusch@kernel.org>, jaegeuk@kernel.org,
 cem@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux-block@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:aalbersh@kernel.org,m:jack@suse.cz,m:tytso@mit.edu,m:kbusch@kernel.org,m:jaegeuk@kernel.org,m:cem@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,meta.com:s=s2048-2025-q2];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:mid,meta.com:replyto,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,meta.com:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[kbusch@meta.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C71A73F074

From: Keith Busch <kbusch@kernel.org>

Add bdev_fill_dio_attr() to fill the file_attr direct io alignment
fields from a block device's queue limits, so filesystems can share the
derivation. Use it to report the attributes for block devices opened
directly.

Signed-off-by: Keith Busch <kbusch@kernel.org>
---
 block/bdev.c           | 37 +++++++++++++++++++++++++++++++++++++
 fs/file_attr.c         |  6 +++++-
 include/linux/blkdev.h | 14 ++++++++++++++
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/block/bdev.c b/block/bdev.c
index 85ce57bd2ae4f..3b56f6696d3a3 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -28,6 +28,7 @@
 #include <linux/part_stat.h>
 #include <linux/uaccess.h>
 #include <linux/stat.h>
+#include <linux/fileattr.h>
 #include "../fs/internal.h"
 #include "blk.h"
 
@@ -1353,6 +1354,42 @@ void bdev_statx(const struct path *path, struct kstat *stat, u32 request_mask)
 	blkdev_put_no_open(bdev);
 }
 
+/*
+ * Fill the direct I/O alignment attributes derived from a block device's
+ * queue limits.  Filesystems override the offset alignments as needed and
+ * set FS_XFLAG_DIO once they have decided direct I/O is supported.
+ */
+void bdev_fill_dio_attr(struct block_device *bdev, struct file_kattr *fa)
+{
+	fa->fsx_dio_mem_align = bdev_dma_alignment(bdev) + 1;
+	fa->fsx_dio_offset_align = bdev_logical_block_size(bdev);
+	fa->fsx_dio_read_offset_align = bdev_logical_block_size(bdev);
+	fa->fsx_dio_virt_boundary_align = bdev_virt_boundary_alignment(bdev);
+	fa->fsx_dio_offset_align_max_vecs = bdev_max_segments(bdev);
+}
+EXPORT_SYMBOL_GPL(bdev_fill_dio_attr);
+
+/*
+ * Handle DIO alignment for block devices via fileattr.
+ */
+int bdev_fileattr(const struct inode *inode, struct file_kattr *fa)
+{
+	struct block_device *bdev;
+
+	bdev = blkdev_get_no_open(inode->i_rdev, false);
+	if (!bdev)
+		return -ENODEV;
+
+	memset(fa, 0, sizeof(*fa));
+	bdev_fill_dio_attr(bdev, fa);
+	fa->fsx_valid = true;
+	fa->flags_valid = true;
+	fa->fsx_xflags |= FS_XFLAG_DIO;
+
+	blkdev_put_no_open(bdev);
+	return 0;
+}
+
 bool disk_live(struct gendisk *disk)
 {
 	return !inode_unhashed(BD_INODE(disk->part0));
diff --git a/fs/file_attr.c b/fs/file_attr.c
index b37a55f54a449..b637eff9081aa 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -7,6 +7,7 @@
 #include <linux/export.h>
 #include <linux/syscalls.h>
 #include <linux/namei.h>
+#include <linux/blkdev.h>
 
 #include "internal.h"
 
@@ -88,13 +89,16 @@ int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	struct inode *inode = d_inode(dentry);
 	int error;
 
-	if (!inode->i_op->fileattr_get)
+	if (!inode->i_op->fileattr_get && !S_ISBLK(inode->i_mode))
 		return -ENOIOCTLCMD;
 
 	error = security_inode_file_getattr(dentry, fa);
 	if (error)
 		return error;
 
+	if (!inode->i_op->fileattr_get)
+		return bdev_fileattr(inode, fa);
+
 	return inode->i_op->fileattr_get(dentry, fa);
 }
 EXPORT_SYMBOL(vfs_fileattr_get);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 9213a5716f95a..2d435fadfdcb9 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1607,6 +1607,17 @@ static inline unsigned int bdev_dma_alignment(struct block_device *bdev)
 	return queue_dma_alignment(bdev_get_queue(bdev));
 }
 
+static inline unsigned long bdev_virt_boundary_mask(struct block_device *bdev)
+{
+	return bdev_get_queue(bdev)->limits.virt_boundary_mask;
+}
+
+static inline unsigned int
+bdev_virt_boundary_alignment(struct block_device *bdev)
+{
+	return bdev_virt_boundary_mask(bdev) + 1;
+}
+
 static inline unsigned int
 blk_lim_dma_alignment_and_pad(struct queue_limits *lim)
 {
@@ -1805,6 +1816,9 @@ int sync_blockdev_range(struct block_device *bdev, loff_t lstart, loff_t lend);
 int sync_blockdev_nowait(struct block_device *bdev);
 void sync_bdevs(bool wait);
 void bdev_statx(const struct path *path, struct kstat *stat, u32 request_mask);
+struct file_kattr;
+void bdev_fill_dio_attr(struct block_device *bdev, struct file_kattr *fa);
+int bdev_fileattr(const struct inode *inode, struct file_kattr *fa);
 void printk_all_partitions(void);
 int __init early_lookup_bdev(const char *pathname, dev_t *dev);
 #else
-- 
2.53.0-Meta



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
