Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GmbxOe9kUWqpDwMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 23:32:31 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF1B73EF7C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 23:32:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Jxc5+YP3;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=KOdiF388;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=eC5xH+A9;
	dkim=fail ("body hash did not verify") header.d=meta.com header.s=s2048-2025-q2 header.b=YPwm8hGk;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q87olRzB+dvC9Wo0xN9fAZSQ10aUx93Eys8RE86DC3s=; b=Jxc5+YP31jNNBuk/SPOQ+32R5U
	LmjBVrt+tRJ3QwAEUG6Gv6uzwUXuw8kNgciUANPP5MLrTZLiflA0YfVd41kEyQ/jfNA4FlnDnJAvT
	jEm/8Gp2xaEmOApjFOtUGK1xeZkGKQB0qv8pPd18HPlESTjdUxyVfTPmWPO4U6nVtN90=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wiIpc-0004OF-Ta;
	Fri, 10 Jul 2026 21:32:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=5651d212ed=kbusch@meta.com>) id 1wiIpb-0004O0-PF
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 21:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ra2M14mPjMEDwZtVI1Y4/LFgJcvxGANhXPScPmJWN0=; b=KOdiF388hankRPQR+02gz4VJII
 Q29u2PlrL17GsPirLtnmF3JYM8GX7tTdOuvS89x6Gbr7s40SSb2F3CmG9DLVo1KfgRcC+s1m+vyz1
 lD45hMHkdtpHNG+z0oP5XS+HUVB1VTLlAchjFqdye77taDNmB1E+dWNNTCbqIq2AEGqQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2ra2M14mPjMEDwZtVI1Y4/LFgJcvxGANhXPScPmJWN0=; b=eC5xH+A9uMONpBSTG7dSR/lmvI
 jmBXghwvVpd6zJAhJ5oBj/Zc7xU1lFY8+2oXOEqkHpUPW1AXmDpZ5G01mdg4IWoSmD0qRDMB/S8eW
 N4HNNv0QH4EytjPkq18NRy49NCncHw/ZZVI7xuN0y+UmkcRwjfOZd1UhjJ9H7JaQ5sHQ=;
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]
 helo=mx0a-00082601.pphosted.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wiIpb-0007aL-Vt for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 21:32:24 +0000
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66AK4BrV2116977
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 10 Jul 2026 14:22:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=2ra2M14mPjMEDwZtVI1Y4/LFgJcvxGANhXPScPmJWN0=; b=YPwm8hGkNags
 M8mgdioBCyh0E1DdmwOyquzs/9fSMb0JyEfcZrL8NUwndTL5aTD2H/vJtEllH7oG
 XouRNg3WNgDTaFaNRBad1s8wTwN3vW2L8f/BzDDmF6cIRyr1Im5vP3NIea4Eo2O/
 0mYc/hORdUyc+al6rmt93mXljY4gjRRO6O9I5BCXyE+1sqcufuOO+++wSjh/Iy15
 Z5beoej/l5D7ztBRst5EPSPhNCQuKgeM0lUOEOF05KbdgcaVZVLAz7VWbQ7YkLdd
 3UugrGnI98n4YtUPp/QnuBfLAbp3chlXRgbffETMf1XFw5p6JTXLF0Ddtg3ggW0P
 K3ojrZdufw==
Received: from mail.thefacebook.com ([163.114.134.16])
 by m0001303.ppops.net (PPS) with ESMTPS id 4fafb0rs68-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Jul 2026 14:22:21 -0700 (PDT)
Received: from twshared17991.01.snb2.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Fri, 10 Jul 2026 21:22:19 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
 id 651C524F006FE; Fri, 10 Jul 2026 14:06:47 -0700 (PDT)
To: <linux-block@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>,
 <linux-fsdevel@vger.kernel.org>, <linux-xfs@vger.kernel.org>
Date: Fri, 10 Jul 2026 14:06:45 -0700
Message-ID: <20260710210646.3576365-5-kbusch@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260710210646.3576365-1-kbusch@meta.com>
References: <20260710210646.3576365-1-kbusch@meta.com>
MIME-Version: 1.0
X-FB-Internal: Safe
X-Proofpoint-GUID: ArDk2KYl1C-oQYaUmP8I9Wz77IzuodcF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxNCBTYWx0ZWRfX29Cyeqz9O0Sb
 V8ocbXS/FExY9QEm8w35Os9WERq0xZUV2H7OUYa/2R5f5fq5yAXSkceuaAWfTBk3hnnFJ5IFCRV
 69aNih9WCp3boWgxZpchAaCshGdH2hpBpmsdR5I0ztIbomDD16rUX00YIkNgPQwTMlPUxJQBKbD
 /YughSwy8aJ7lbn9JOyPqg3PEEjZLJOQ2e6m95WzFIHpZ7CaHgvZTz9TxLfkLExknm3FNYqzP2R
 re30+Ul+IKgMrvK9PV8/Q3uegpSdNwx+Zz8GMNNjo/tZst79lMIGULMmvQeBFa1auEuAbzCdHyr
 LAFrX1ns7k0uxMP3U3hy8WEjV9tOJnO14MHTuV0UqN+M+F5MWuu+J9Xc1h4Ro03pNHfAKEzcKEM
 eq80ZCWIdlpiBbehKavYPC1FAp3Y0XEuH3YQnwtlSCMrSzirlE2j7kP78L4GSX20mJFvIYunu8M
 l2GrRBX7Hby/cZBox5A==
X-Proofpoint-ORIG-GUID: ArDk2KYl1C-oQYaUmP8I9Wz77IzuodcF
X-Authority-Analysis: v=2.4 cv=ca7iaHDM c=1 sm=1 tr=0 ts=6a51628d cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_78whYxrdx1mplLwxq1U:22 a=VwQbUJbxAAAA:8 a=Rmsuq2NR91XQagnBW_8A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxNCBTYWx0ZWRfX3hVZwBwKWGD/
 +mdbA5s0A8ft1q6xwSQfxOrAFGKtwtt8UsoIuaCkG54VWwAizVfryx189Dy/zfWmhvo/dxjSNIf
 ffJxSaQmLKfvY+CuszL59dXJSoSNcH0=
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
 alignment attributes for regular files, using the block helper and overriding
 the offset alignment for the cases where ext4 requires filesystem block
 alignment.
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
X-Headers-End: 1wiIpb-0007aL-Vt
Subject: [f2fs-dev] [PATCHv2 4/5] ext4: report direct io attributes through
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
X-Rspamd-Queue-Id: 2CF1B73EF7C

From: Keith Busch <kbusch@kernel.org>

Fill in the direct io alignment attributes for regular files, using the
block helper and overriding the offset alignment for the cases where ext4
requires filesystem block alignment.

Signed-off-by: Keith Busch <kbusch@kernel.org>
---
 fs/ext4/ioctl.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index c8387e6a2c6e9..01617edff17a8 100644
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
@@ -992,6 +993,27 @@ static long ext4_ioctl_group_add(struct file *file,
 	return err;
 }
 
+static void ext4_fileattr_get_dio(struct inode *inode, struct file_kattr *fa)
+{
+	u32 dio_align;
+
+	if (!S_ISREG(inode->i_mode))
+		return;
+
+	dio_align = ext4_dio_alignment(inode);
+	if (!dio_align)
+		return;
+
+	bdev_fill_dio_attr(inode->i_sb->s_bdev, fa);
+	if (dio_align != 1) {
+		fa->fsx_dio_mem_align = dio_align;
+		fa->fsx_dio_offset_align = dio_align;
+		fa->fsx_dio_read_offset_align = dio_align;
+	}
+
+	fa->fsx_xflags |= FS_XFLAG_DIO;
+}
+
 int ext4_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 {
 	struct inode *inode = d_inode(dentry);
@@ -1005,6 +1027,7 @@ int ext4_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	if (ext4_has_feature_project(inode->i_sb))
 		fa->fsx_projid = from_kprojid(&init_user_ns, ei->i_projid);
 
+	ext4_fileattr_get_dio(inode, fa);
 	return 0;
 }
 
-- 
2.53.0-Meta



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
