Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fe6IMq5kUWqMDwMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 23:31:26 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D05973EF2C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 23:31:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=UsknPPrw;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Pml+FHd9;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="BCsEjdZ/";
	dkim=fail ("body hash did not verify") header.d=meta.com header.s=s2048-2025-q2 header.b=pAzbPZI+;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWAVh6wzsYQohXmYVvLCe64GAQAi+w9PJhLUuJpOA3k=; b=UsknPPrwaXsso04dKftjrAcDEE
	Gmj5UEiAO9Ohvz+UZYuQX2tY+zrZS59dsln7wQSlP4lhqIWMvqi//n1XIZb7rUYJvmmyrHkDh38oz
	U9JU9qBdAqLZ3zE2K4dx3EL7lzU2J/zKfDV4D9jiYFkPKovDI2Abz2qVpbsrl+DAtbTA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wiIob-0007W2-MF;
	Fri, 10 Jul 2026 21:31:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=5651d212ed=kbusch@meta.com>) id 1wiIoa-0007Vw-BQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 21:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fBFW6r5qhutFJo5e1jNRGeTqFLwVtoEdyEwQDWofL+c=; b=Pml+FHd9osP1pHOKcmYgf6aj0C
 eJIs/QGVd5u03MSMrE5WIUm4I144BrLtMUvHB2t6/6jlcUi9vCEcI9EIMqzHsXdNcQq3oVcpDj+jG
 lOX7HuRN5IC4yiWRwTbwo92/waJN37u668T3009TH8WD+E8pX1TkYxaFBsXkfPBmz9I0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fBFW6r5qhutFJo5e1jNRGeTqFLwVtoEdyEwQDWofL+c=; b=BCsEjdZ/t1f66fy/UXIfG5deq2
 Q8c0W9lqcHfC/Wh35kS+zRjt5FmPUvenmza2QZQmzM0wtuaAnqAplxVU8jSNND+h7LVxCdDGh+Lkm
 2qdUF7iXRZYsLMxLuld/8HPrRuNp1AKXSe0053TRcgJjnxUtDnUNjQRGVtZFB92Obf2U=;
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]
 helo=mx0a-00082601.pphosted.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wiIoX-0007Xq-C5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 21:31:17 +0000
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66AK4HtE2117081
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 10 Jul 2026 14:22:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=fBFW6r5qhutFJo5e1jNRGeTqFLwVtoEdyEwQDWofL+c=; b=pAzbPZI+Y1Uu
 adkhk8uUc21ooj2i5+pk7eYatt6jhMcpcM2nnUTkIiaOe/nCFppJN4mXAWW7gtzz
 3NOL+h4oTGpQtXWwjvH8z67aADnSmZb8gsGQlpdGZTA90Vmuk5aBTbdSlawjQriC
 EdXHCyIKd5ofawhaF4ul8tyqi0l1EJI0FEi/FZwOcFSf3tNrKzX97GxHqqoHRylh
 MT9g3i3EVD1mT+nCcWUt7uViVz7iAeE9yhA4R1mhQ8U2lWzytDTELwVAqvgFCyyo
 t69nKC7FgnSPZ+J0i4TXZPRalchZ7m/v6NhYOnR8BNRZGXRuRK19xUthdHf07KaT
 mf9Wl5x6Ig==
Received: from mail.thefacebook.com ([163.114.134.16])
 by m0001303.ppops.net (PPS) with ESMTPS id 4fafb0rs67-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Jul 2026 14:22:24 -0700 (PDT)
Received: from twshared21331.34.frc3.facebook.com (2620:10d:c085:208::7cb7) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Fri, 10 Jul 2026 21:22:20 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
 id 6716624F006FF; Fri, 10 Jul 2026 14:06:47 -0700 (PDT)
To: <linux-block@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>,
 <linux-fsdevel@vger.kernel.org>, <linux-xfs@vger.kernel.org>
Date: Fri, 10 Jul 2026 14:06:46 -0700
Message-ID: <20260710210646.3576365-6-kbusch@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260710210646.3576365-1-kbusch@meta.com>
References: <20260710210646.3576365-1-kbusch@meta.com>
MIME-Version: 1.0
X-FB-Internal: Safe
X-Proofpoint-GUID: bE8mCyExFIHdpDrAFdri3x1spD39_GKi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxNCBTYWx0ZWRfXy/PhryIMaN49
 6Sg5UQdFuukrVvbDSCQcS4/AhgMwtEy0KLyZAmF654pMRu7NZL7KZvYDwLCgbv1Tkeod2ZiSI+E
 azGuJ+Jhe6U9WS31iq+Uq4vpVtmUoVCOJiBKeuxTGqVVy9Z1hbbex9ttRsy4QOoCtGANnRcDM4J
 yb1pzHYCyEfuRLqCDWABvDd6a53cUQH063dvucYw8h1fWEQxWfiEcIK7ueF8FCVrJaP7K0t9Yup
 klcTbo5CquTbsbPiscpAiRH3cvART5vdbOx/mGvgsrXqoFHU7y/fa+X494MyApQNkeK+jlsz38M
 NytYVm+4JM+3yR51QRGieyGTsDXQRmCYoRV7zVW/P4PzzJCe0sliAmhfRzTBWWCOFXhq6X55CLy
 x4HM6fZjHwiLn7EwOAGW83wcvlDZYnm2C/yn3vAnRWMU7rSAntmMQFZbP9o3XBzCKVXMaux8ps0
 Qv9yOWhZpta6Cd680+Q==
X-Proofpoint-ORIG-GUID: bE8mCyExFIHdpDrAFdri3x1spD39_GKi
X-Authority-Analysis: v=2.4 cv=ca7iaHDM c=1 sm=1 tr=0 ts=6a516290 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_78whYxrdx1mplLwxq1U:22 a=VwQbUJbxAAAA:8 a=iTomd4heqAZg2W2pUTYA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxNCBTYWx0ZWRfX1CCvDK6A6LRt
 u5RTzJbUWlqWJ3ZPKHTQFqH3wIjsinYOmskOW63ELBMwTquCM/O1ZBfpx1Cn3H1QKzxxJhrghZS
 3kNtD8M/oiqZdUc3Pgz3h3p7fDgC6ho=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Keith Busch <kbusch@kernel.org> Fill in the direct io
 alignment attributes for regular files that support direct writes.
 Signed-off-by:
 Keith Busch <kbusch@kernel.org> --- fs/f2fs/file.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.153.30 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wiIoX-0007Xq-C5
Subject: [f2fs-dev] [PATCHv2 5/5] f2fs: report direct io attributes through
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-block@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:aalbersh@kernel.org,m:jack@suse.cz,m:tytso@mit.edu,m:kbusch@kernel.org,m:jaegeuk@kernel.org,m:cem@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,meta.com:s=s2048-2025-q2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,meta.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:mid,meta.com:replyto,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime];
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
X-Rspamd-Queue-Id: 0D05973EF2C

From: Keith Busch <kbusch@kernel.org>

Fill in the direct io alignment attributes for regular files that support
direct writes.

Signed-off-by: Keith Busch <kbusch@kernel.org>
---
 fs/f2fs/file.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4b52c56d71f07..230b0dca06251 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3452,6 +3452,25 @@ static int f2fs_ioc_setproject(struct inode *inode, __u32 projid)
 }
 #endif
 
+static void f2fs_fileattr_get_dio(struct inode *inode, struct file_kattr *fa)
+{
+	struct block_device *bdev;
+	unsigned int bsize;
+
+	if (!S_ISREG(inode->i_mode) || f2fs_force_buffered_io(inode, WRITE))
+		return;
+
+	bdev = inode->i_sb->s_bdev;
+	if (bdev)
+		bdev_fill_dio_attr(bdev, fa);
+
+	bsize = i_blocksize(inode);
+	fa->fsx_dio_mem_align = bsize;
+	fa->fsx_dio_offset_align = bsize;
+	fa->fsx_dio_read_offset_align = bsize;
+	fa->fsx_xflags |= FS_XFLAG_DIO;
+}
+
 int f2fs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 {
 	struct inode *inode = d_inode(dentry);
@@ -3472,6 +3491,7 @@ int f2fs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	if (f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
 		fa->fsx_projid = from_kprojid(&init_user_ns, fi->i_projid);
 
+	f2fs_fileattr_get_dio(inode, fa);
 	return 0;
 }
 
-- 
2.53.0-Meta



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
