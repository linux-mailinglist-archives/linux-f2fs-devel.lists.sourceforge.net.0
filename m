Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFC7CF0840
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 03:08:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8D5ujoFRmew7j1MVAKlb9pML14ddMMzirUQzeUQukQ=; b=Pq4ml20mb4YulffoBXSq0q/XMO
	kGg3ghaVEJI2PlDQDICmwOLa+V3OpBKr6H/EaTstRhxP9FLafHkhIfyHFLOorfuLoW8bSnlBkx+ir
	bydzxmL2oZNZqX9/1SDFKWjIs8gJHLGrK1iukxOZIOkdaS2VPQzRrua4uN3dHzLT+5E8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcDXk-00070O-Vx;
	Sun, 04 Jan 2026 02:08:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vcDXj-0006zy-Of
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/6gRj0d7hShDenZGInQSMjbDl356wvx8hDrc2oAgKLQ=; b=bTXthtni7Zh7QGL994W3QDb8Fg
 sCBq62wmjJoyvDdyJWZEhzoNTgKb+xl3wYeux9jFUAr/kcnl6KLacDiN3ztOrqQBg3z9IWdhh3zXI
 LXEpkp5STCwwPjaG7jBkKvexsWb0bDG/xsnOzDWgkwGMClq2KMvc/VrpyecaaS8INIks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/6gRj0d7hShDenZGInQSMjbDl356wvx8hDrc2oAgKLQ=; b=JTvP5fJJ1P5pKCOTdIQzW9d4Y4
 ZWtTA3Qf/W5EqMvF+OqNL790qwEnlkWnnBZvn1L3sxuci8nMimw+2xmGYuByjSb4hTYRPtX6plEVG
 Pn6jIelUGLLrt29tY4cGyiJ3leFVGOFgGw1C5YV7jOZvwC3pfgpDIFhU2W5jBxv8c1LE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcDXk-0005oS-3s for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D1DFD44357
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  4 Jan 2026 02:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86DDC113D0;
 Sun,  4 Jan 2026 02:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767492501;
 bh=i04Bk13G8JvXw51LzcCEHT7YmJ8DM1rKYrGoAlPDpsM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EHQ46Rts0nqU+KkTAPgrAVZY0RKJTLK2tOcLcCiLNsIB3n5T/0zPicnRX2bQo6vdu
 Yo0gRHBdWtn0hdDhd1x21eMtyiaXXGQiGlrg6YScbchRtzAukYIgiEbtvC8/tCl4fI
 VcsKjIJNmcbTzXQKdMA7U6qtJFbIyf4yZBhN/N4E4IzBg78uuP/rHfmfaxTTDlx5ec
 Bq0L70tlLOO73xszSc9zVpIYkvbFDokd0sdIOba8gZfzbkxSbM+IKXleNukaqMPglo
 +/1xlbHNZZ7KkSxUQHYpy9F2cgP+zsoIeAEpVt8zDwpmVeW1brFQmns1Dc6RJ9wvLj
 OKbluwts/qEiQ==
To: jaegeuk@kernel.org
Date: Sun,  4 Jan 2026 10:07:28 +0800
Message-ID: <20260104020729.1064529-13-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20260104020729.1064529-1-chao@kernel.org>
References: <20260104020729.1064529-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch introduce a new fault type FAULT_LOCK_TIMEOUT,
 it can be used to inject timeout into lock duration. Timeout type can be set
 via /sys/fs/f2fs/<disk>/inject_timeout_type Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- Documentation/ABI/testing/sysfs-fs-f2fs | 1 +
 Documentation/filesystems/f2fs.rst
 | 1 + fs/f2fs/checkpoint.c | 3 +++ fs/f2fs/f2fs.h | 1 + fs/f2fs/super.c |
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcDXk-0005oS-3s
Subject: [f2fs-dev] [PATCH 13/14] f2fs: introduce FAULT_LOCK_TIMEOUT
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduce a new fault type FAULT_LOCK_TIMEOUT, it can
be used to inject timeout into lock duration.

Timeout type can be set via /sys/fs/f2fs/<disk>/inject_timeout_type

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 1 +
 Documentation/filesystems/f2fs.rst      | 1 +
 fs/f2fs/checkpoint.c                    | 3 +++
 fs/f2fs/f2fs.h                          | 1 +
 fs/f2fs/super.c                         | 1 +
 5 files changed, 7 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index de5a80124e04..4b0bec3c0746 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -743,6 +743,7 @@ Description:	Support configuring fault injection type, should be
 		FAULT_INCONSISTENT_FOOTER        0x00200000
 		FAULT_ATOMIC_TIMEOUT             0x00400000 (1000ms)
 		FAULT_VMALLOC                    0x00800000
+		FAULT_LOCK_TIMEOUT               0x01000000 (1000ms)
 		===========================      ==========
 
 What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 2d71efa7db7a..33d2166ac6b7 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -217,6 +217,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			     FAULT_INCONSISTENT_FOOTER        0x00200000
 			     FAULT_ATOMIC_TIMEOUT             0x00400000 (1000ms)
 			     FAULT_VMALLOC                    0x00800000
+			     FAULT_LOCK_TIMEOUT               0x01000000 (1000ms)
 			     ===========================      ==========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 86656231ce83..f2ab5ba8fb6a 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -63,6 +63,9 @@ static inline void trace_lock_elapsed_time_end(struct f2fs_rwsem *sem,
 	if (!lc->lock_trace)
 		return;
 
+	if (time_to_inject(sem->sbi, FAULT_LOCK_TIMEOUT))
+		f2fs_io_schedule_timeout_killable(DEFAULT_FAULT_TIMEOUT);
+
 	get_lock_elapsed_time(&tts);
 
 	total_time = div_u64(tts.total_time - lc->ts.total_time, npm);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8c0ce9fd954f..4f8eb1292ebf 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -65,6 +65,7 @@ enum {
 	FAULT_INCONSISTENT_FOOTER,
 	FAULT_ATOMIC_TIMEOUT,
 	FAULT_VMALLOC,
+	FAULT_LOCK_TIMEOUT,
 	FAULT_MAX,
 };
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9e41fe39dbf6..1915d194153e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -69,6 +69,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_INCONSISTENT_FOOTER]	= "inconsistent footer",
 	[FAULT_ATOMIC_TIMEOUT]		= "atomic timeout",
 	[FAULT_VMALLOC]			= "vmalloc",
+	[FAULT_LOCK_TIMEOUT]		= "lock timeout",
 };
 
 int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
