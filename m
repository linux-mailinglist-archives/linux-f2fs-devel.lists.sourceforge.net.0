Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WV4dEausTWrp8gEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 08 Jul 2026 03:49:31 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2891F720EB5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 08 Jul 2026 03:49:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=E0N42eh7;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=iReRC5SJ;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="L hYFzHp";
	dkim=fail ("body hash did not verify") header.d=meta.com header.s=s2048-2025-q2 header.b=FvBFwN5b;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9IBhx3uSCoptNNZ59grFkGKBS7sbKIdbNvuTKw8GT+c=; b=E0N42eh7WRrt7n9OcFG/nzvVmJ
	4krtQbhvzoib+5tJkeIhdlVSG/2JgVDXeYW1Q0eOptkJQRLibGM6sPJVMICEESmaWvAZf8O2T6D+y
	F2pFog478zev8Xm5fI92/c2WU0V59KPMS+tzN1DqaitTenYKZGi/PK981+Mro5yiO2j0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1whHPc-0000MB-DZ;
	Wed, 08 Jul 2026 01:49:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=56493de926=kbusch@meta.com>) id 1whHPa-0000M5-M9
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Jul 2026 01:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WmX7B5dJ+39POYiokelurwpKpRJDV2EEYvpyPDj0H/M=; b=iReRC5SJ0dCRZjx8PG29kHWnHS
 R2R7AhFtMCTQwsAYJp6xED1CacwYWIsJtoid98y5g34ikmRD2XgwZwtzaZf8mOzc32C3sm2YAvtnE
 NF5mSNyKw2E33w22TZvza1yBPQhQjv6TI0h6Cchh/NRHN3nS395t/9FvZxPG71X/lTLs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WmX7B5dJ+39POYiokelurwpKpRJDV2EEYvpyPDj0H/M=; b=L
 hYFzHpN7tGI0OOle/hjDrDepE92ACnaPqzR/0Zac6IFgk4grBkzHYvsOmdNfZM+opYO6CdW8fSuCQ
 LHIUD7Rthdb2HO+RkxxV8oznyqqLwr6B8zdyDP9SSPnAp10O0RCITeMN+29A91xdyDVCUmL4S3Jnd
 f6EZc3BrhI8rA1jc=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1whHPX-0002wd-15 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Jul 2026 01:49:16 +0000
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 667NTPqG1606081
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 7 Jul 2026 18:36:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=s2048-2025-q2; bh=WmX7B5dJ+39POYioke
 lurwpKpRJDV2EEYvpyPDj0H/M=; b=FvBFwN5b9pmiuofAFKsos6T/pvMcrlKL/G
 28Da9I7CU1OA8hvs+7usFpy/ecxXoaASayeayyX+5JmptOAM5UzVdN+0b3HjsSNf
 gQt1w45QTgFKRm0uTxn8GUE/Gz4z3VZFX4ZMYGrO+KlsDbcX1OhB/XgJ9zyh4gdx
 hmyTUpIzBF9kPQtXqkI0bnVJKc0PueKb4C2cZULqzG+nQrYKjS6EGsQAZBaPThPy
 Uvv9gnjoh6FLFTmWQ8q2YUXECyPc2gemNygQY0PKRIpFcR/pTATwjkH0+r5lGIvb
 qGR6dzkj0fmGH+TI/P26Q2cSy5aXDR2vSHSPxrqsf+4BJOB6H5Rg==
Received: from maileast.thefacebook.com ([163.114.135.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4f8y8xpxhw-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Jul 2026 18:36:16 -0700 (PDT)
Received: from twshared2511.04.snb2.facebook.com (2620:10d:c0a8:1b::2d) by
 mail.thefacebook.com (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Wed, 8 Jul 2026 01:36:13 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
 id 89A0824B668F9; Tue,  7 Jul 2026 18:19:13 -0700 (PDT)
To: <linux-block@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>,
 <linux-fsdevel@vger.kernel.org>, <linux-xfs@vger.kernel.org>
Date: Tue, 7 Jul 2026 18:18:43 -0700
Message-ID: <20260708011843.1036846-1-kbusch@meta.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-FB-Internal: Safe
X-Proofpoint-GUID: -b5s4zCvlnyCOYl9qc4SKuSpJbA50TyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDAxNCBTYWx0ZWRfX0QsRaiKBJVsJ
 I5aUlV2VE2+4YkI718eXr5HEy2GCu3NQucYwpCpTFX75luxKYxVN5uQKwZ39F/P8/39O4BipyW/
 bE+Cfz3xnKit6hIcSjA74GjDRLsSmvZVnFMvHqLGCqSwxBJGsvgyaySi3tCpNab1sDf0bm5K4mY
 VzthM0HwO1RfYMvdDZRiTDilruHIBeiESidaFcxGtBAhFoOLq1dicW/KKu2csjk+mzpSTIK0Z/m
 FLrY5DFw4i/rxLTpiEDGHNpdUxGenFkY5Kx+wuqTJr1sTyHOUcL6zM80wxA81DFxwZlbwgxBkFY
 /6I9B2BqpIxE9mdZ+9G/LqcY/E/fEdK/4iMwiZozSZD4ie59y5xbFV9HuW1E9ainRtaeLHkuPEy
 dknj3lrMDYUazeYGlKSTnjbbLD6TJIYlsL88nX/u7EHQE9S2pg4wq3PdS5BBOAbSkTPscQuOGUB
 2zIMOIgBdxszQKudrTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDAxNCBTYWx0ZWRfXxV+KvQSFmeiO
 HBjvzypA4p0B4locoBZgGVUepNVLmKnxOyuWjBM50wCb6ZLWfvj1wM5aW3h4ur3KpoEqUH/2pHW
 QnkR+SjXZ/t48uEgVORli9+WTMwvwm4=
X-Proofpoint-ORIG-GUID: -b5s4zCvlnyCOYl9qc4SKuSpJbA50TyM
X-Authority-Analysis: v=2.4 cv=e8M2j6p/ c=1 sm=1 tr=0 ts=6a4da990 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=8elwO82fXORLTBIkMd32:22 a=VwQbUJbxAAAA:8 a=x8z3rCZMdUOG9FrYzOQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Keith Busch <kbusch@kernel.org> Memory alignment
 constraints
 for direct io can vary depending on the backing storage hardware. Provide
 support through file_getattr to report the attributes necessary for
 applications to know how to c [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [67.231.145.42 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.145.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1whHPX-0002wd-15
Subject: [f2fs-dev] [PATCH] fs: report direct io constraints through
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
 Christoph Hellwig <hch@lst.de>, tytso@mit.edu, Keith Busch <kbusch@kernel.org>,
 jaegeuk@kernel.org, cem@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-block@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:aalbersh@kernel.org,m:jack@suse.cz,m:hch@lst.de,m:tytso@mit.edu,m:kbusch@kernel.org,m:jaegeuk@kernel.org,m:cem@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,meta.com:s=s2048-2025-q2];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,meta.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[kbusch@meta.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2891F720EB5

From: Keith Busch <kbusch@kernel.org>

Memory alignment constraints for direct io can vary depending on the
backing storage hardware. Provide support through file_getattr to report
the attributes necessary for applications to know how to construct valid
read and write requests.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Keith Busch <kbusch@kernel.org>
---
 block/bdev.c             | 27 +++++++++++++++++++++++++++
 fs/ext4/ioctl.c          | 22 ++++++++++++++++++++++
 fs/f2fs/file.c           | 16 ++++++++++++++++
 fs/file_attr.c           | 16 ++++++++++++++--
 fs/xfs/xfs_ioctl.c       | 16 ++++++++++++++++
 include/linux/blkdev.h   | 12 ++++++++++++
 include/linux/fileattr.h | 10 ++++++++--
 include/uapi/linux/fs.h  | 10 +++++++++-
 8 files changed, 124 insertions(+), 5 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index 85ce57bd2ae4f..5b3e27339854e 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -28,6 +28,7 @@
 #include <linux/part_stat.h>
 #include <linux/uaccess.h>
 #include <linux/stat.h>
+#include <linux/fileattr.h>
 #include "../fs/internal.h"
 #include "blk.h"
 
@@ -1353,6 +1354,32 @@ void bdev_statx(const struct path *path, struct kstat *stat, u32 request_mask)
 	blkdev_put_no_open(bdev);
 }
 
+/*
+ * Handle DIO alignment for block devices via fileattr.
+ */
+void bdev_fileattr(const struct inode *inode, struct file_kattr *fa)
+{
+	struct block_device *bdev;
+
+	memset(fa, 0, sizeof(*fa));
+	fa->fsx_valid = true;
+	fa->flags_valid = true;
+
+	bdev = blkdev_get_no_open(inode->i_rdev, false);
+	if (!bdev)
+		return;
+
+	fa->fsx_dio_mem_align = bdev_dma_alignment(bdev) + 1;
+	fa->fsx_dio_offset_align = bdev_logical_block_size(bdev);
+	fa->fsx_dio_read_offset_align = bdev_logical_block_size(bdev);
+	fa->fsx_dio_virt_boundary_align = bdev_virt_boundary_alignment(bdev);
+	fa->fsx_max_segments = bdev_max_segments(bdev);
+	fa->fsx_xflags |= FS_XFLAG_DIO;
+
+	blkdev_put_no_open(bdev);
+}
+EXPORT_SYMBOL_GPL(bdev_fileattr);
+
 bool disk_live(struct gendisk *disk)
 {
 	return !inode_unhashed(BD_INODE(disk->part0));
diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index c8387e6a2c6e9..70b25f9e0ad5a 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -21,6 +21,7 @@
 #include <linux/iversion.h>
 #include <linux/fileattr.h>
 #include <linux/uuid.h>
+#include <linux/blkdev.h>
 #include "ext4_jbd2.h"
 #include "ext4.h"
 #include <linux/fsmap.h>
@@ -1005,6 +1006,27 @@ int ext4_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	if (ext4_has_feature_project(inode->i_sb))
 		fa->fsx_projid = from_kprojid(&init_user_ns, ei->i_projid);
 
+	if (S_ISREG(inode->i_mode)) {
+		u32 dio_align = ext4_dio_alignment(inode);
+
+		if (dio_align != 0) {
+			struct block_device *bdev = inode->i_sb->s_bdev;
+
+			if (dio_align == 1) {
+				fa->fsx_dio_mem_align = bdev_dma_alignment(bdev) + 1;
+				fa->fsx_dio_offset_align = bdev_logical_block_size(bdev);
+				fa->fsx_dio_read_offset_align = bdev_logical_block_size(bdev);
+			} else {
+				fa->fsx_dio_mem_align = dio_align;
+				fa->fsx_dio_offset_align = dio_align;
+				fa->fsx_dio_read_offset_align = dio_align;
+			}
+			fa->fsx_dio_virt_boundary_align = bdev_virt_boundary_alignment(bdev);
+			fa->fsx_max_segments = bdev_max_segments(bdev);
+			fa->fsx_xflags |= FS_XFLAG_DIO;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4b52c56d71f07..72036ef1d7a8a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3472,6 +3472,22 @@ int f2fs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	if (f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
 		fa->fsx_projid = from_kprojid(&init_user_ns, fi->i_projid);
 
+	if (S_ISREG(inode->i_mode)) {
+		unsigned int bsize = i_blocksize(inode);
+		struct block_device *bdev = inode->i_sb->s_bdev;
+
+		if (!f2fs_force_buffered_io(inode, WRITE)) {
+			fa->fsx_dio_mem_align = bsize;
+			fa->fsx_dio_offset_align = bsize;
+			fa->fsx_dio_read_offset_align = bsize;
+			if (bdev) {
+				fa->fsx_dio_virt_boundary_align = bdev_virt_boundary_alignment(bdev);
+				fa->fsx_max_segments = bdev_max_segments(bdev);
+			}
+			fa->fsx_xflags |= FS_XFLAG_DIO;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/fs/file_attr.c b/fs/file_attr.c
index bfb00d256dd56..09804ef9901b8 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -7,6 +7,7 @@
 #include <linux/export.h>
 #include <linux/syscalls.h>
 #include <linux/namei.h>
+#include <linux/blkdev.h>
 
 #include "internal.h"
 
@@ -88,8 +89,12 @@ int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	struct inode *inode = d_inode(dentry);
 	int error;
 
-	if (!inode->i_op->fileattr_get)
-		return -ENOIOCTLCMD;
+	if (!inode->i_op->fileattr_get) {
+		if (!S_ISBLK(inode->i_mode))
+			return -ENOIOCTLCMD;
+		bdev_fileattr(inode, fa);
+		return 0;
+	}
 
 	error = security_inode_file_getattr(dentry, fa);
 	if (error)
@@ -110,6 +115,11 @@ static void fileattr_to_file_attr(const struct file_kattr *fa,
 	fattr->fa_nextents = fa->fsx_nextents;
 	fattr->fa_projid = fa->fsx_projid;
 	fattr->fa_cowextsize = fa->fsx_cowextsize;
+	fattr->fa_dio_mem_align = fa->fsx_dio_mem_align;
+	fattr->fa_dio_offset_align = fa->fsx_dio_offset_align;
+	fattr->fa_dio_read_offset_align = fa->fsx_dio_read_offset_align;
+	fattr->fa_dio_virt_boundary_align = fa->fsx_dio_virt_boundary_align;
+	fattr->fa_max_segments = fa->fsx_max_segments;
 }
 
 /**
@@ -145,6 +155,8 @@ static int file_attr_to_fileattr(const struct file_attr *fattr,
 
 	if (fattr->fa_xflags & ~mask)
 		return -EINVAL;
+	if (fattr->fa_pad)
+		return -EINVAL;
 
 	fileattr_fill_xflags(fa, fattr->fa_xflags & ~FS_XFLAG_RDONLY_MASK);
 	fa->fsx_extsize = fattr->fa_extsize;
diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index 1b53701bebea1..15e14d1525281 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -49,6 +49,7 @@
 
 #include <linux/mount.h>
 #include <linux/fileattr.h>
+#include <linux/blkdev.h>
 
 /* Return 0 on success or positive error */
 int
@@ -517,6 +518,21 @@ xfs_fill_fsxattr(
 		fa->fsx_nextents = xfs_iext_count(ifp);
 	else
 		fa->fsx_nextents = xfs_ifork_nextents(ifp);
+
+	if (whichfork == XFS_DATA_FORK && S_ISREG(VFS_I(ip)->i_mode)) {
+		struct xfs_buftarg *target = xfs_inode_buftarg(ip);
+		struct block_device *bdev = target->bt_bdev;
+
+		fa->fsx_dio_mem_align = bdev_dma_alignment(bdev) + 1;
+		fa->fsx_dio_read_offset_align = bdev_logical_block_size(bdev);
+		if (xfs_is_cow_inode(ip))
+			fa->fsx_dio_offset_align = xfs_inode_alloc_unitsize(ip);
+		else
+			fa->fsx_dio_offset_align = fa->fsx_dio_read_offset_align;
+		fa->fsx_dio_virt_boundary_align = bdev_virt_boundary_alignment(bdev);
+		fa->fsx_max_segments = bdev_max_segments(bdev);
+		fa->fsx_xflags |= FS_XFLAG_DIO;
+	}
 }
 
 STATIC int
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 9213a5716f95a..5e83572d15286 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1607,6 +1607,16 @@ static inline unsigned int bdev_dma_alignment(struct block_device *bdev)
 	return queue_dma_alignment(bdev_get_queue(bdev));
 }
 
+static inline unsigned long bdev_virt_boundary_mask(struct block_device *bdev)
+{
+	return bdev_get_queue(bdev)->limits.virt_boundary_mask;
+}
+
+static inline unsigned int bdev_virt_boundary_alignment(struct block_device *bdev)
+{
+	return bdev_virt_boundary_mask(bdev) + 1;
+}
+
 static inline unsigned int
 blk_lim_dma_alignment_and_pad(struct queue_limits *lim)
 {
@@ -1805,6 +1815,8 @@ int sync_blockdev_range(struct block_device *bdev, loff_t lstart, loff_t lend);
 int sync_blockdev_nowait(struct block_device *bdev);
 void sync_bdevs(bool wait);
 void bdev_statx(const struct path *path, struct kstat *stat, u32 request_mask);
+struct file_kattr;
+void bdev_fileattr(const struct inode *inode, struct file_kattr *fa);
 void printk_all_partitions(void);
 int __init early_lookup_bdev(const char *pathname, dev_t *dev);
 #else
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 58044b5980162..9eca31b8289fe 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -17,11 +17,11 @@
 /* Read-only inode flags */
 #define FS_XFLAG_RDONLY_MASK \
 	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR | FS_XFLAG_VERITY | \
-	 FS_XFLAG_CASEFOLD | FS_XFLAG_CASENONPRESERVING)
+	 FS_XFLAG_CASEFOLD | FS_XFLAG_CASENONPRESERVING | FS_XFLAG_DIO)
 
 /* Flags to indicate valid value of fsx_ fields */
 #define FS_XFLAG_VALUES_MASK \
-	(FS_XFLAG_EXTSIZE | FS_XFLAG_COWEXTSIZE)
+	(FS_XFLAG_EXTSIZE | FS_XFLAG_COWEXTSIZE | FS_XFLAG_DIO)
 
 /* Flags for directories */
 #define FS_XFLAG_DIRONLY_MASK \
@@ -49,6 +49,12 @@ struct file_kattr {
 	u32	fsx_nextents;	/* nextents field value (get)	*/
 	u32	fsx_projid;	/* project identifier (get/set) */
 	u32	fsx_cowextsize;	/* CoW extsize field value (get/set)*/
+	/* struct file_attr dio alignment: */
+	u32	fsx_dio_mem_align;
+	u32	fsx_dio_offset_align;
+	u32	fsx_dio_read_offset_align;
+	u32	fsx_dio_virt_boundary_align;
+	u32	fsx_max_segments;
 	/* selectors: */
 	bool	flags_valid:1;
 	bool	fsx_valid:1;
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index bd87262f2e349..2716fc6fefd6b 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -229,10 +229,17 @@ struct file_attr {
 	__u32 fa_nextents;	/* nextents field value (get)   */
 	__u32 fa_projid;	/* project identifier (get/set) */
 	__u32 fa_cowextsize;	/* CoW extsize field value (get/set) */
+	__u32 fa_dio_mem_align;	/* memory buffer alignment for direct I/O (get) */
+	__u32 fa_dio_offset_align;	/* file offset alignment for direct I/O (get) */
+	__u32 fa_dio_read_offset_align;	/* file offset alignment for direct I/O reads (get) */
+	__u32 fa_dio_virt_boundary_align;	/* virtual boundary alignment for direct I/O (get) */
+	__u32 fa_max_segments;	/* max number of segments for direct I/O (get) */
+	__u32 fa_pad;		/* padding for 8-byte alignment */
 };
 
 #define FILE_ATTR_SIZE_VER0 24
-#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
+#define FILE_ATTR_SIZE_VER1 48
+#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
 
 /*
  * Flags for the fsx_xflags field
@@ -261,6 +268,7 @@ struct file_attr {
  */
 #define FS_XFLAG_CASEFOLD	0x00040000	/* case-insensitive lookups */
 #define FS_XFLAG_CASENONPRESERVING 0x00080000	/* case not preserved */
+#define FS_XFLAG_DIO		0x00100000	/* DIO alignment info valid */
 #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
 
 /* the read-only stuff doesn't really belong here, but any other place is
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
