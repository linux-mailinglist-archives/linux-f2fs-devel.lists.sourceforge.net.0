Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKZDDLIer2khOQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 20:25:38 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1BD23FD15
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 20:25:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67MgUGpDSNG5KetJkg9IIA/PMJxEFaddgSGgjzxB2hM=; b=YwhWcgmIsOKrOo+TivHt2xRXGh
	QhVxVJVWocAeNqbYsBUI7c0Q3iqCxXD2O8ZLWyyByV0Rt21OsuYPVJJ0AImhupTBfOmwCXizMTCDj
	ny9QB53sYO/17+TMpVzq1B5wCeH4Sb3k7SieMtys0+AxhqqkwUqxvPYjfmZ3pE28jNcw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzgER-000754-Ix;
	Mon, 09 Mar 2026 19:25:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1vzgE5-00070S-Qz
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 19:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WOAouRQBPHrvv3NJBvehjfwR8GdnGaplL/2/swE6Vgc=; b=LX0NVau/2di3+KlnnsMheMMJ2g
 PfPdNtPbFhOW+uiBzpCyzKdKrvLQksTrGkjubwXw43D4q+ZM6F/Qr/infJfz4BNeWNZ7mAK8P2NK/
 LrtdeUgy52TUDwU/t2Lsa7Hff4Sb8zImzFZ5MdAZhEFRgKLJ2d2jlR2ZjvCfZ0T7SpDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WOAouRQBPHrvv3NJBvehjfwR8GdnGaplL/2/swE6Vgc=; b=lgV/Ta2p6XGisVN6kUIiCWf94I
 8MuNZnOZAgJHoBGenqPu0hlyrpBi3S+PYBuwLyiJsfcGBHJyPe/RGbdEWvZWfrKvBfsgske9uczrM
 2DSgrgbUK5793dPBp2GORZqCNTU9m83qctaebh2fdbYSfXdhG692f9yF38hMIWnq4Npc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzgDu-0001GT-OY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 19:25:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 249DA60126;
 Mon,  9 Mar 2026 19:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5F1C2BC87;
 Mon,  9 Mar 2026 19:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773084291;
 bh=RlYkDpTl3L7JRNGfMg3zc69y29qErvg9Ohx+SmC3TQI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QuxSL5JTGiSZKKZvn+EzzX1yTO9kN1/qG268wLRUxfedwzNn0zI3S6Wb0la4j8DkS
 NC2499PBZ46HF4lqmTL3SfSO5/EuEAx3eVhLyMU/ZQhD8FDhk7cXWuPY9Bi1pupHpd
 Mly34mxqFJaE96U6ISo9HrWnL3DsJSPlVoH6xWiRqGdzkDYyM1fVRSfkgUNyQWAE7g
 U4vv7RX0Qyvr/8pg/TqO07F92oEhjILukPw46JaT4lfY9QWAGurhrpHHbuN1jVA5sd
 Vg4qOm5QcXUwuBb/d9VttLi4nW5VoaBPqjUOk8SaIpLrmZYfOhe+TpEUS4R+hyhd8L
 /qWHi8HoJrFUQ==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Mon,  9 Mar 2026 20:23:27 +0100
Message-ID: <20260309192355.176980-13-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260309192355.176980-1-aalbersh@kernel.org>
References: <20260309192355.176980-1-aalbersh@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Introduce XFS_DIFLAG2_VERITY for inodes with fsverity. This
 flag indicates that inode has fs-verity enabled (i.e. descriptor exist, tree
 is built and file is read-only). Introduce XFS_SB_FEAT_RO_COMPAT_VERITY for
 filesystems having fsverity inodes. As on-disk changes applies to fsverity
 inodes only, let older kernels read-only access. This will be enabled in
 the furth [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzgDu-0001GT-OY
Subject: [f2fs-dev] [PATCH v4 12/25] xfs: introduce fsverity on-disk changes
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
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: BD1BD23FD15
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
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

Introduce XFS_DIFLAG2_VERITY for inodes with fsverity. This flag
indicates that inode has fs-verity enabled (i.e. descriptor exist,
tree is built and file is read-only).

Introduce XFS_SB_FEAT_RO_COMPAT_VERITY for filesystems having
fsverity inodes. As on-disk changes applies to fsverity inodes only, let
older kernels read-only access. This will be enabled in the further
patch after full fsverity support.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/libxfs/xfs_format.h     | 8 +++++++-
 fs/xfs/libxfs/xfs_inode_buf.c  | 8 ++++++++
 fs/xfs/libxfs/xfs_inode_util.c | 2 ++
 fs/xfs/libxfs/xfs_sb.c         | 2 ++
 fs/xfs/xfs_iops.c              | 2 ++
 fs/xfs/xfs_mount.h             | 2 ++
 6 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index 779dac59b1f3..d67b404964fc 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -374,6 +374,7 @@ xfs_sb_has_compat_feature(
 #define XFS_SB_FEAT_RO_COMPAT_RMAPBT   (1 << 1)		/* reverse map btree */
 #define XFS_SB_FEAT_RO_COMPAT_REFLINK  (1 << 2)		/* reflinked files */
 #define XFS_SB_FEAT_RO_COMPAT_INOBTCNT (1 << 3)		/* inobt block counts */
+#define XFS_SB_FEAT_RO_COMPAT_VERITY   (1 << 4)		/* fs-verity */
 #define XFS_SB_FEAT_RO_COMPAT_ALL \
 		(XFS_SB_FEAT_RO_COMPAT_FINOBT | \
 		 XFS_SB_FEAT_RO_COMPAT_RMAPBT | \
@@ -1230,16 +1231,21 @@ static inline void xfs_dinode_put_rdev(struct xfs_dinode *dip, xfs_dev_t rdev)
  */
 #define XFS_DIFLAG2_METADATA_BIT	5
 
+/* inodes sealed with fs-verity */
+#define XFS_DIFLAG2_VERITY_BIT		6
+
 #define XFS_DIFLAG2_DAX		(1ULL << XFS_DIFLAG2_DAX_BIT)
 #define XFS_DIFLAG2_REFLINK	(1ULL << XFS_DIFLAG2_REFLINK_BIT)
 #define XFS_DIFLAG2_COWEXTSIZE	(1ULL << XFS_DIFLAG2_COWEXTSIZE_BIT)
 #define XFS_DIFLAG2_BIGTIME	(1ULL << XFS_DIFLAG2_BIGTIME_BIT)
 #define XFS_DIFLAG2_NREXT64	(1ULL << XFS_DIFLAG2_NREXT64_BIT)
 #define XFS_DIFLAG2_METADATA	(1ULL << XFS_DIFLAG2_METADATA_BIT)
+#define XFS_DIFLAG2_VERITY	(1ULL << XFS_DIFLAG2_VERITY_BIT)
 
 #define XFS_DIFLAG2_ANY \
 	(XFS_DIFLAG2_DAX | XFS_DIFLAG2_REFLINK | XFS_DIFLAG2_COWEXTSIZE | \
-	 XFS_DIFLAG2_BIGTIME | XFS_DIFLAG2_NREXT64 | XFS_DIFLAG2_METADATA)
+	 XFS_DIFLAG2_BIGTIME | XFS_DIFLAG2_NREXT64 | XFS_DIFLAG2_METADATA | \
+	 XFS_DIFLAG2_VERITY)
 
 static inline bool xfs_dinode_has_bigtime(const struct xfs_dinode *dip)
 {
diff --git a/fs/xfs/libxfs/xfs_inode_buf.c b/fs/xfs/libxfs/xfs_inode_buf.c
index a017016e9075..c5822d938d81 100644
--- a/fs/xfs/libxfs/xfs_inode_buf.c
+++ b/fs/xfs/libxfs/xfs_inode_buf.c
@@ -756,6 +756,14 @@ xfs_dinode_verify(
 	    !xfs_has_rtreflink(mp))
 		return __this_address;
 
+	/* only regular files can have fsverity */
+	if (flags2 & XFS_DIFLAG2_VERITY) {
+		if (!xfs_has_verity(mp))
+			return __this_address;
+		if ((mode & S_IFMT) != S_IFREG)
+			return __this_address;
+	}
+
 	if (xfs_has_zoned(mp) &&
 	    dip->di_metatype == cpu_to_be16(XFS_METAFILE_RTRMAP)) {
 		if (be32_to_cpu(dip->di_used_blocks) > mp->m_sb.sb_rgextents)
diff --git a/fs/xfs/libxfs/xfs_inode_util.c b/fs/xfs/libxfs/xfs_inode_util.c
index 551fa51befb6..6b1e20a4bb9b 100644
--- a/fs/xfs/libxfs/xfs_inode_util.c
+++ b/fs/xfs/libxfs/xfs_inode_util.c
@@ -126,6 +126,8 @@ xfs_ip2xflags(
 			flags |= FS_XFLAG_DAX;
 		if (ip->i_diflags2 & XFS_DIFLAG2_COWEXTSIZE)
 			flags |= FS_XFLAG_COWEXTSIZE;
+		if (ip->i_diflags2 & XFS_DIFLAG2_VERITY)
+			flags |= FS_XFLAG_VERITY;
 	}
 
 	if (xfs_inode_has_attr_fork(ip))
diff --git a/fs/xfs/libxfs/xfs_sb.c b/fs/xfs/libxfs/xfs_sb.c
index 38d16fe1f6d8..4401a5f16344 100644
--- a/fs/xfs/libxfs/xfs_sb.c
+++ b/fs/xfs/libxfs/xfs_sb.c
@@ -165,6 +165,8 @@ xfs_sb_version_to_features(
 		features |= XFS_FEAT_REFLINK;
 	if (sbp->sb_features_ro_compat & XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
 		features |= XFS_FEAT_INOBTCNT;
+	if (sbp->sb_features_ro_compat & XFS_SB_FEAT_RO_COMPAT_VERITY)
+		features |= XFS_FEAT_VERITY;
 	if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_FTYPE)
 		features |= XFS_FEAT_FTYPE;
 	if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_SPINODES)
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 208543e57eda..ca369eb96561 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1415,6 +1415,8 @@ xfs_diflags_to_iflags(
 		flags |= S_NOATIME;
 	if (init && xfs_inode_should_enable_dax(ip))
 		flags |= S_DAX;
+	if (xflags & FS_XFLAG_VERITY)
+		flags |= S_VERITY;
 
 	/*
 	 * S_DAX can only be set during inode initialization and is never set by
diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
index 61c71128d171..c746bc90cf3e 100644
--- a/fs/xfs/xfs_mount.h
+++ b/fs/xfs/xfs_mount.h
@@ -385,6 +385,7 @@ typedef struct xfs_mount {
 #define XFS_FEAT_EXCHANGE_RANGE	(1ULL << 27)	/* exchange range */
 #define XFS_FEAT_METADIR	(1ULL << 28)	/* metadata directory tree */
 #define XFS_FEAT_ZONED		(1ULL << 29)	/* zoned RT device */
+#define XFS_FEAT_VERITY		(1ULL << 30)	/* fs-verity */
 
 /* Mount features */
 #define XFS_FEAT_NOLIFETIME	(1ULL << 47)	/* disable lifetime hints */
@@ -442,6 +443,7 @@ __XFS_HAS_FEAT(exchange_range, EXCHANGE_RANGE)
 __XFS_HAS_FEAT(metadir, METADIR)
 __XFS_HAS_FEAT(zoned, ZONED)
 __XFS_HAS_FEAT(nolifetime, NOLIFETIME)
+__XFS_HAS_FEAT(verity, VERITY)
 
 static inline bool xfs_has_rtgroups(const struct xfs_mount *mp)
 {
-- 
2.51.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
