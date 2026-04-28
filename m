Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH6hK2Vx8GldTgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Apr 2026 10:35:49 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 119634803FF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Apr 2026 10:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTuDslgv72vEL/r+629EQo8mHXY9tJWema7GSeXoAQA=; b=HamWZdcO25mm/DFlO3ohMhoyk2
	xOFK9Dyur/85qgC7MCwL+/cGKr4ZGMT0k4p1M5awn63ZhhO+7GZAzezl1cIjjmxll69Fz7yD2VEgq
	yEeTe/Q32yCKXp/rYSgIw+PeHsWBDRqLyFzr2dTUXI2+KFL7Khr9Y5HwdhBVdT8gqs9Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wHdv4-00082a-5I;
	Tue, 28 Apr 2026 08:35:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1wHdum-0007sQ-19
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Apr 2026 08:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kC0dTJr5N/yRcCFpwXCrZ6ciX6j/wCH4ONuotfSr2eo=; b=Wla8BNfKCJWqBFq8vde8+CEnTI
 mq1qTOuaBJcb+OMVE5oJnC3hWiBMndAef1BJ55FYCz987stH9U6vrm8gOPK6tkO9VdcGriik2DHTd
 B/S3wJTo0WoUx+oQxNy4CZy3STk/9KUSmQgcVHvDfwC3PJrwJ0uHHOzMAXRFmxwVBqbg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kC0dTJr5N/yRcCFpwXCrZ6ciX6j/wCH4ONuotfSr2eo=; b=J46l5J3Oy7NtXgFKh7/9oqFkbA
 qUPvfhgB3bztcU9zqP8sW2yzCOzyjfyddOBvF+19G3b8YuS5OTG0Z70nzEGIxwQuY0xOFGc8087u2
 zESO66S3U4fft/VA+eSIpkbpJY7rTc8Wre/639B7iWGU+tYsK9/Ht4gSSsialJtz0HI8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wHduO-0004im-Lz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Apr 2026 08:35:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1DF9360141;
 Tue, 28 Apr 2026 08:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50984C2BCB6;
 Tue, 28 Apr 2026 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777365297;
 bh=JXHTSbqvbrxVG3d7HPfzTq0FVlIRscym93k2ZVkiAFc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hNJaJCKTYIXQdqZyyO8JvaQuYr2jeCmFp2z9M3tgEnh46MJGQRDZ4LeTprSIMeicL
 HCnqZnUt4V0QooRbaV9TmI23k47UVck44ean3PDncrm8OyL+4JTMZuyamCREcPQQJW
 a+ln/AXVHA0DY5c/p3HTdgfpbLwJptu0R5711J8wd4no53+naB/tytLIYWHrJbeYu4
 A1iRQkR+ICeEGo6tWDyMsbzRP3ZaR9yLdEINzUuYG/Z7/t9g/LT8y766BLOngS4ZCh
 gUwxLkbT5N4lADekOYr+WwH4GzECOGaGViVAOAcenjUlb/BpBtNc7c3cIjrlVLe9EN
 AvJIPoYrmLuhg==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Tue, 28 Apr 2026 10:33:27 +0200
Message-ID: <20260428083332.768693-22-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260428083332.768693-1-aalbersh@kernel.org>
References: <20260428083332.768693-1-aalbersh@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Report corrupted fsverity descriptor through health system.
 Reviewed-by: Darrick J. Wong <djwong@kernel.org> Reviewed-by: Christoph
 Hellwig
 <hch@lst.de> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org> ---
 fs/xfs/libxfs/xfs_fs.h | 1 + fs/xfs/libxfs/xfs_ [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wHduO-0004im-Lz
Subject: [f2fs-dev] [PATCH v9 21/22] xfs: introduce health state for
 corrupted fsverity metadata
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, hch@lst.de, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 119634803FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

Report corrupted fsverity descriptor through health system.

Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/libxfs/xfs_fs.h     |  1 +
 fs/xfs/libxfs/xfs_health.h |  4 +++-
 fs/xfs/xfs_fsverity.c      | 13 ++++++++++---
 fs/xfs/xfs_health.c        |  1 +
 4 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_fs.h b/fs/xfs/libxfs/xfs_fs.h
index ebf17a0b0722..cece31ecee81 100644
--- a/fs/xfs/libxfs/xfs_fs.h
+++ b/fs/xfs/libxfs/xfs_fs.h
@@ -422,6 +422,7 @@ struct xfs_bulkstat {
 #define XFS_BS_SICK_SYMLINK	(1 << 6)  /* symbolic link remote target */
 #define XFS_BS_SICK_PARENT	(1 << 7)  /* parent pointers */
 #define XFS_BS_SICK_DIRTREE	(1 << 8)  /* directory tree structure */
+#define XFS_BS_SICK_FSVERITY	(1 << 9)  /* fsverity metadata */
 
 /*
  * Project quota id helpers (previously projid was 16bit only
diff --git a/fs/xfs/libxfs/xfs_health.h b/fs/xfs/libxfs/xfs_health.h
index 1d45cf5789e8..932b447190da 100644
--- a/fs/xfs/libxfs/xfs_health.h
+++ b/fs/xfs/libxfs/xfs_health.h
@@ -104,6 +104,7 @@ struct xfs_rtgroup;
 /* Don't propagate sick status to ag health summary during inactivation */
 #define XFS_SICK_INO_FORGET	(1 << 12)
 #define XFS_SICK_INO_DIRTREE	(1 << 13)  /* directory tree structure */
+#define XFS_SICK_INO_FSVERITY	(1 << 14)  /* fsverity metadata */
 
 /* Primary evidence of health problems in a given group. */
 #define XFS_SICK_FS_PRIMARY	(XFS_SICK_FS_COUNTERS | \
@@ -140,7 +141,8 @@ struct xfs_rtgroup;
 				 XFS_SICK_INO_XATTR | \
 				 XFS_SICK_INO_SYMLINK | \
 				 XFS_SICK_INO_PARENT | \
-				 XFS_SICK_INO_DIRTREE)
+				 XFS_SICK_INO_DIRTREE | \
+				 XFS_SICK_INO_FSVERITY)
 
 #define XFS_SICK_INO_ZAPPED	(XFS_SICK_INO_BMBTD_ZAPPED | \
 				 XFS_SICK_INO_BMBTA_ZAPPED | \
diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
index 298d712b5ba2..82f5ca542c97 100644
--- a/fs/xfs/xfs_fsverity.c
+++ b/fs/xfs/xfs_fsverity.c
@@ -84,16 +84,23 @@ xfs_fsverity_get_descriptor(
 		return error;
 
 	desc_size = be32_to_cpu(d_desc_size);
-	if (XFS_IS_CORRUPT(mp, desc_size > FS_VERITY_MAX_DESCRIPTOR_SIZE))
+	if (XFS_IS_CORRUPT(mp, desc_size > FS_VERITY_MAX_DESCRIPTOR_SIZE)) {
+		xfs_inode_mark_sick(XFS_I(inode), XFS_SICK_INO_FSVERITY);
 		return -ERANGE;
-	if (XFS_IS_CORRUPT(mp, desc_size > desc_size_pos))
+	}
+
+	if (XFS_IS_CORRUPT(mp, desc_size > desc_size_pos)) {
+		xfs_inode_mark_sick(XFS_I(inode), XFS_SICK_INO_FSVERITY);
 		return -ERANGE;
+	}
 
 	if (!buf_size)
 		return desc_size;
 
-	if (XFS_IS_CORRUPT(mp, desc_size > buf_size))
+	if (XFS_IS_CORRUPT(mp, desc_size > buf_size)) {
+		xfs_inode_mark_sick(XFS_I(inode), XFS_SICK_INO_FSVERITY);
 		return -ERANGE;
+	}
 
 	desc_pos = round_down(desc_size_pos - desc_size, blocksize);
 	error = fsverity_pagecache_read(inode, buf, desc_size, desc_pos);
diff --git a/fs/xfs/xfs_health.c b/fs/xfs/xfs_health.c
index 239b843e83d4..be66760fb120 100644
--- a/fs/xfs/xfs_health.c
+++ b/fs/xfs/xfs_health.c
@@ -625,6 +625,7 @@ static const struct ioctl_sick_map ino_map[] = {
 	{ XFS_SICK_INO_DIR_ZAPPED,	XFS_BS_SICK_DIR },
 	{ XFS_SICK_INO_SYMLINK_ZAPPED,	XFS_BS_SICK_SYMLINK },
 	{ XFS_SICK_INO_DIRTREE,	XFS_BS_SICK_DIRTREE },
+	{ XFS_SICK_INO_FSVERITY,	XFS_BS_SICK_FSVERITY },
 };
 
 /* Fill out bulkstat health info. */
-- 
2.51.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
