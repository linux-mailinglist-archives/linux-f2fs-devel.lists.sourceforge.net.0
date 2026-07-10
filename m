Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5fAxAE9mUWoOEAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 23:38:23 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4176E73F090
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 23:38:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=e1vT2wzD;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=CT+n4c4r;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="eoXaUN/e";
	dkim=fail ("body hash did not verify") header.d=meta.com header.s=s2048-2025-q2 header.b=An0itSPr;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRtd4+Vz4/rrqPCOdkTH57mJy+BFuk8o02GJ14QJ0B4=; b=e1vT2wzDWl8E5ZjbL39m0pROBK
	lMEppoCBuy6JiH4MfT5zmmyxyhVyCYiizst6BQ/RCX0OBH6wQyB3fpUT2XWLWFHpMlyswUAOQyc66
	VuJcdUBCTQ1PEWiEKWdyq+5cAWI1l+C0fiFuATeaNXVoz1OFrQV5EiOQ0n4ODCFALQgc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wiIvL-00056h-RI;
	Fri, 10 Jul 2026 21:38:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=5651d212ed=kbusch@meta.com>) id 1wiIvK-00056a-2K
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 21:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x8TxgEgZ50NKSAxdVZCc/M4ZywYRdPGr0pKf7nc2CgQ=; b=CT+n4c4rIQD80dWbgJI1qDgrnz
 bjVDCgpQLZE3+Ezqb1j2h4maE+M6T8o8ScDDGP212cynNGrU5t6YuY4oIzVVTkbDSRicVOMefnLrL
 YzsKg69zItqKYy5YPPDwTulljPxHZbwdbEJeIcqNA36L+uHvU3piJ7cPt9Y9SqgEol28=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x8TxgEgZ50NKSAxdVZCc/M4ZywYRdPGr0pKf7nc2CgQ=; b=eoXaUN/eTpopkQe3tBQTXcqTS6
 SspjWwraueShof48YZDsUsH+h9OwgAYawroNOEDSbCY9czLUFHvmRasHrWDjiPl5RbdMQyAbFQQMK
 tJpMol97NheaJDiWOUdxM+6A3QMqLvqBiZD/bpFHdObRZYbxBPmWqCtOsFnseI6vR+T0=;
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wiIvJ-0007sH-7Q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 21:38:18 +0000
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK4AOp2308718
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 10 Jul 2026 14:17:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=x8TxgEgZ50NKSAxdVZCc/M4ZywYRdPGr0pKf7nc2CgQ=; b=An0itSPr6HdN
 alBofYUTXgczOokCggBb2PmGRmCGZA0qsCcHyeVw+8b8A+QOsfY3wS93SAHonBLN
 BgHMePcimBGKvs9BTsYBtE5E2z2snDkfyNBsL/q8VNYmVz571EgcWnrnuHQBraTX
 oQAK5blH2R/vx54MsJGv5TRAYGp0lncBdEGI48a6by9TivoX+T8jTgTp0BQ/8iND
 FsfMrc4Fp9jfSUhRQUIpq2zYnvRw3JiOBQFbPMJnFoDgegaiBBns+jHNuZNUmwQG
 yZzT4PAs0v5ns4Luu0M2VEr7Cd7kXy7EacO50N4v0HKH0+DeOME71KAv6wDqC6qK
 bMSUz5MwTA==
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fa9djk4mv-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Jul 2026 14:17:23 -0700 (PDT)
Received: from twshared20290.04.snb2.facebook.com (2620:10d:c085:108::150d) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Fri, 10 Jul 2026 21:17:22 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
 id 5CDF324F006FB; Fri, 10 Jul 2026 14:06:47 -0700 (PDT)
To: <linux-block@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>,
 <linux-fsdevel@vger.kernel.org>, <linux-xfs@vger.kernel.org>
Date: Fri, 10 Jul 2026 14:06:44 -0700
Message-ID: <20260710210646.3576365-4-kbusch@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260710210646.3576365-1-kbusch@meta.com>
References: <20260710210646.3576365-1-kbusch@meta.com>
MIME-Version: 1.0
X-FB-Internal: Safe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxNCBTYWx0ZWRfX4aJE/MmmHDqU
 +gxEnrys0uaKxVRuEgxxMhPWUU609CyR3KfNDD3JDbZTopCqO+rM2WMOOnCuzLvxx2cfVEXhHSI
 lxAqWP72/rP9fCl69v8LF7bHTMVOJTA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxNCBTYWx0ZWRfX9N2tmNhsdhBX
 Lo4uxsrOu01TDfJanJej98sZoQjklVTn+sAlMaiyzNF+D7iMOL5nWZH6lzG6C3MLAtSEith8oEZ
 emyFgUNVY2sZDSantGc0iYFoauzlGziYzzUjE5XBhfNkhP52SnR3UhC6EX6y8H/QZmMgWKRx6Jw
 ycJ0hlOrM3D3sFe3wkbhPZg31fpu2FiSuk6CyylWHjQLa3V6NJ4turRP2TUS9n32bgLa2huheos
 4RvlY2bGzpbqTTHgFfxgwnEtFIP+vjV7GCa30Zb6HeXeF7qwfmXNPPGpPReb1EZLIVIKXf5C03/
 4Bx+n7g3VIA9Fj2/78zcvZcSzcMHmhPqzqbCIvNWet5wsLYnXLIdUVpkO4S72WEy4hr7UdbGgCN
 8PjML1z9avBV9SAJlfeG5xh8c6cGFVwd9cEYbwZFjGAXanVAvDgUsbElB8pp0UYQe7oBR87haFO
 77/aYIgy8Esin8qsx2w==
X-Authority-Analysis: v=2.4 cv=ToHWQjXh c=1 sm=1 tr=0 ts=6a516163 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=jCddH8ec0KUNCymVuxII:22 a=VwQbUJbxAAAA:8 a=aFTrS7NZ_-S66cRtsDsA:9
X-Proofpoint-ORIG-GUID: swD0IksBHfG0rHlYtR3mJWbKkxvuY2cE
X-Proofpoint-GUID: swD0IksBHfG0rHlYtR3mJWbKkxvuY2cE
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
 Content preview: From: Keith Busch <kbusch@kernel.org> Fill in the direct io
 alignment attributes for regular files, reporting the larger write alignment
 for CoW inodes. Signed-off-by: Keith Busch <kbusch@kernel.org> ---
 fs/xfs/xfs_ioctl.c
 | 26 ++++++++++++++++++++++++++ 1 file changed, 26 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.153.30 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: meta.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wiIvJ-0007sH-7Q
Subject: [f2fs-dev] [PATCHv2 3/5] xfs: report direct io attributes through
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
X-Rspamd-Queue-Id: 4176E73F090

From: Keith Busch <kbusch@kernel.org>

Fill in the direct io alignment attributes for regular files, reporting
the larger write alignment for CoW inodes.

Signed-off-by: Keith Busch <kbusch@kernel.org>
---
 fs/xfs/xfs_ioctl.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index 1b53701bebea1..d585242a8fe9f 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -49,6 +49,7 @@
 
 #include <linux/mount.h>
 #include <linux/fileattr.h>
+#include <linux/blkdev.h>
 
 /* Return 0 on success or positive error */
 int
@@ -468,6 +469,29 @@ xfs_ioc_rtgroup_geometry(
  * Linux extended inode flags interface.
  */
 
+static void
+xfs_fill_fsxattr_dio(
+	struct xfs_inode	*ip,
+	int			whichfork,
+	struct file_kattr	*fa)
+{
+	struct xfs_buftarg *target;
+
+	if (whichfork != XFS_DATA_FORK || !S_ISREG(VFS_I(ip)->i_mode))
+		return;
+
+	target = xfs_inode_buftarg(ip);
+	bdev_fill_dio_attr(target->bt_bdev, fa);
+	/*
+	 * CoW inodes must write whole allocation units out of place, so report
+	 * the larger write alignment while leaving the smaller read alignment
+	 * from the queue limits in place.
+	 */
+	if (xfs_is_cow_inode(ip))
+		fa->fsx_dio_offset_align = xfs_inode_alloc_unitsize(ip);
+	fa->fsx_xflags |= FS_XFLAG_DIO;
+}
+
 static void
 xfs_fill_fsxattr(
 	struct xfs_inode	*ip,
@@ -517,6 +541,8 @@ xfs_fill_fsxattr(
 		fa->fsx_nextents = xfs_iext_count(ifp);
 	else
 		fa->fsx_nextents = xfs_ifork_nextents(ifp);
+
+	xfs_fill_fsxattr_dio(ip, whichfork, fa);
 }
 
 STATIC int
-- 
2.53.0-Meta



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
