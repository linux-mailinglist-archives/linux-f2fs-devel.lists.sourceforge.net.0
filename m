Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD18A85F7E6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Feb 2024 13:19:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rd82l-0002Sy-1L;
	Thu, 22 Feb 2024 12:19:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rd82j-0002Sr-RJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 12:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1+JK4WVLIkawlA+4DRsNdo3qHG1oONosg29W+Nu+dJI=; b=DBu463wFV4z3rUoS+/B7pheoC0
 IEy13p20INaMpKtbQSizebFPplXtqfwDLADFaSP9zhlePXbBp+gleNMhO4FOEUqTGA3tyUX8bCR8r
 GnSuIlo8RBgtZdS9YJa+JIISzeVyKy6Y8i5wsF/gh2+4U86hiw/4z7n6lKK9ejZgR5aM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1+JK4WVLIkawlA+4DRsNdo3qHG1oONosg29W+Nu+dJI=; b=ctZWb089IzreBCcZcPgOoRiEVF
 delbXawNgsRN46ARQnA2SXJ6VfAmeogRjxq12Kqt9HOksjDXDvWxlygilkUtV+TZW4dbl/vWMq3L9
 yHVhIwBnw996ptCOhEpLIFMQvy4VmS/HptxKp/sAK8KLYGECBptpY6dI6kRqu8fXBn6M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rd82i-0003Ue-9q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 12:19:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 42E1461802
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Feb 2024 12:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1AEC43390;
 Thu, 22 Feb 2024 12:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708604343;
 bh=UBGAWY7QBAf6w4r+D7RUjGAJRqIj79Menb0OJmr4XXg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X20vHx/MBMMZ9nbQR/BWo7scTGZoMiocWVi8XVG4+OvGHF7/2fY+wuifhcYWYiVEB
 ZhuGf9JD6G6eOp1Vn9Eq8eUOW5WYx5c47nQFFqCcID+CZAziyakODU/e5Je+xdtrBb
 t6gQTyKPqiH/5Tw5ZbfBZzX8qLeNI/eZC7TZ62EeOSCpO4xYY97Ee28kMJEWxnn++w
 2TJog2bmir0d4VzHaq2oKeAACSLr09o0krBNqJH+gc0MUPzYu+JdglCZRuACek91hn
 XeLiUZhX+J6EbunerVYYgqWkdnCpH+uV8IT59d3MOalDNjtcm4DuOcX2y6oI4J3xXa
 vgMovY33b0kVg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 22 Feb 2024 20:18:51 +0800
Message-Id: <20240222121851.883141-4-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240222121851.883141-1-chao@kernel.org>
References: <20240222121851.883141-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use it to simulate no free segment case during block
 allocation. Signed-off-by: Chao Yu <chao@kernel.org> ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 1 + Documentation/filesystems/f2fs.rst | 1 + fs/f2fs/f2fs.h | 1 +
 fs/f2fs/segment.c | 5 +++++ fs/f2fs/super.c | 1 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rd82i-0003Ue-9q
Subject: [f2fs-dev] [PATCH 4/4] f2fs: introduce FAULT_NO_SEGMENT
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use it to simulate no free segment case during block allocation.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 1 +
 Documentation/filesystems/f2fs.rst      | 1 +
 fs/f2fs/f2fs.h                          | 1 +
 fs/f2fs/segment.c                       | 5 +++++
 fs/f2fs/super.c                         | 1 +
 5 files changed, 9 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 15044d7d4977..96b54259a02a 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -718,6 +718,7 @@ Description:	Support configuring fault injection type, should be
 		FAULT_LOCK_OP                    0x000020000
 		FAULT_BLKADDR_VALIDITY           0x000040000
 		FAULT_BLKADDR_CONSISTENCE        0x000080000
+		FAULT_NO_SEGMENT                 0x000100000
 		===========================      ===========
 
 What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 1b3b73aa3ab9..bc074b8eedbb 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -205,6 +205,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_LOCK_OP                    0x000020000
 			 FAULT_BLKADDR_VALIDITY           0x000040000
 			 FAULT_BLKADDR_CONSISTENCE        0x000080000
+			 FAULT_NO_SEGMENT                 0x000100000
 			 ===========================      ===========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6390c3d551cb..fdc9a4dc981d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -62,6 +62,7 @@ enum {
 	FAULT_LOCK_OP,
 	FAULT_BLKADDR_VALIDITY,
 	FAULT_BLKADDR_CONSISTENCE,
+	FAULT_NO_SEGMENT,
 	FAULT_MAX,
 };
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 71f523431e87..8ad88d5d4d1d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2653,6 +2653,11 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 
 	spin_lock(&free_i->segmap_lock);
 
+	if (time_to_inject(sbi, FAULT_NO_SEGMENT)) {
+		ret = -ENOSPC;
+		goto out_unlock;
+	}
+
 	if (!new_sec && ((*newseg + 1) % SEGS_PER_SEC(sbi))) {
 		segno = find_next_zero_bit(free_i->free_segmap,
 			GET_SEG_FROM_SEC(sbi, hint + 1), *newseg + 1);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index bb056700b459..dc4fb9a661f2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -63,6 +63,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_LOCK_OP]			= "lock_op",
 	[FAULT_BLKADDR_VALIDITY]	= "invalid blkaddr",
 	[FAULT_BLKADDR_CONSISTENCE]	= "inconsistent blkaddr",
+	[FAULT_NO_SEGMENT]		= "no free segment",
 };
 
 void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
