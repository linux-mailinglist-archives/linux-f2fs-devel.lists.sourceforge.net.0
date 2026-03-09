Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M23CCxOjrmmaHAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 11:38:11 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5501023739C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 11:38:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/z2f417A/9hhoMeNRQqXKBIC93xS3Ac1l8Uxzk+SskI=; b=WeIO2E2RCLNCYl6G47AvPiktDf
	vEjFrRHsiiaXMyuInsaT7ktqacPqd9uJTJ2dRDm3m+kmz0gRAG5eM/3sdikqoukfmgrXvgtwyOqCI
	//YwMVhvfwP20Oj5v5P9htwplplrW+to9bzb7kNuuoSrlvW5TwN5GrHoJ1KukFZvdOPU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzXzv-0004pa-SY;
	Mon, 09 Mar 2026 10:38:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <william.allentx@gmail.com>) id 1vzXzr-0004oz-QL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 10:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C40mOQiFhCho9b1ncDKXUwUmuyOAb3ID3hm31CJf4pM=; b=KXAzSHIwKyEE+sGQX219rl93oa
 ri8wPyTL8EiB2TjleSCf+Vo9DBXMRPebMNnmRq7Cx/xGlttzVFCwSWivHpSm1z09yOBl9KFXYYQEp
 /uvtu769moP6pND2rpxg60uyoMkJg9jqudL00O5EafPy9ZI7b3H/jmKVTfq9RG6hzbeI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C40mOQiFhCho9b1ncDKXUwUmuyOAb3ID3hm31CJf4pM=; b=M/4iwJq+L9Cul670T6uvvH0sh1
 YIxZLiB4znwF/mIesR+xd9bkTx+WEGnGfonBIBdwb4eDkigsEs3yIT3sT/pZBO4jS+dnvvPOvfqcD
 g8OqGXbQ9BbDff7/hpk7audTzeEU7HhvQMQgC5bSHQumaO96DxMU31NC8cc3cdTOATbY=;
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vzXzr-0008Fz-7g for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 10:38:00 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-7d556c1a79eso12861663a34.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Mar 2026 03:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773052668; x=1773657468; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C40mOQiFhCho9b1ncDKXUwUmuyOAb3ID3hm31CJf4pM=;
 b=PI7H1fN6Exic5XTaaybKzVXNWV8biloABeNZYW5Lv4UzwaugH506SVtyScSrd/tMrL
 fgrBQ0pmsgvIluStDMAxCJymux132x55Ze5BN1nmAncVOfSN3gjJPLKHBOFdoqiYD5at
 o0Cc+eORbfAVNW7nzWJt8iqVRpM5Xy4fLSPZ0qc4CCgRW8gJUM1Jmiqa3mBLkpS7CXZL
 0FS6ixoxNr0+lZjITk/gkq89dx0j1/4sNQ5WBSQ2pjxBhO6aZYm5NZnSUnHCcudwQi+t
 4iMN0tM5D98jRkyLrWP9jP74ceBRP22eU8r3ZElKe/XE3vBPfDAFyvA8DLUAVnnBhWtz
 gdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773052668; x=1773657468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C40mOQiFhCho9b1ncDKXUwUmuyOAb3ID3hm31CJf4pM=;
 b=HlQ3hTnUj5n9ODkbOvu0x+jeOX8NKJ23dnZqyvcn8NtKl6tbEYZaS3qt3y1RliyDXW
 1ksgFeZLmQpqaxdyczITjq7/xaxfE2rNgDI2C5EtvyxW6nrei9rb/jQOwLgFQgSWy79p
 XrCJ5ZbrYY8M99K/KNoZTklfYZ7uW5z99VQ23gp0ZmeJj6f3A3vvhqS5SUluNSlvAypy
 zoZkM56uhYqs2O4+4Fl+4Y666EwMZpHQTw5AsSxxkOkzjxpYSImjfSDnpVTFkd3DNRgH
 X+ambUf7deTtMxOP56Ak00ESBpNqYx0Jgb0Tyls58/g0KjQkN0e39AonfAzsDcoMjqNH
 mOrA==
X-Gm-Message-State: AOJu0YylL0y1PcGRWmT6U8zmupI8eLtJzfyDp12Ln6IPVXDyd9gJfX41
 TDV7U5NPz51/m9AdNu3U9C9FTkskxzb0RCYQMN55g9Pxz7L9M1PgFNV5xo8petmN
X-Gm-Gg: ATEYQzx+JTIABvEZKtvn+6W7WZMOm6q7/5cAwghcrUpy6ZY1hCtEOQfpzpDPOl+/3yd
 Ixehd7fzUVQTpPfC1uvdpuQwer7Dj/b4EDaGI2EZENPLaRpogRXqNXjOs8kGGcTLwR4l2C94bxI
 UtA9WLnhWmu0nCUZC170goODE21JGy2NUZTBhnTDXBx9hmcHg7GgV3phYK1q6Vohisu2YYwBSWQ
 1hiyVAXb5hR7teD/TH4ZMknGVA2d28VuTmFwL0DcfFGjSsBUk/lkoU8/XY5xSQIC0tfTo1Vbsu4
 W3TJWXKqVyhDWSfHg1gVF/tuZmLkI2eBV3dYEbZEv4DFsff0bAB11Jg3rbuYBMbR+7QRzbkJXAW
 AJvRfM8B2M8niqYa0FbZtkBesfOSlE9/xWp84+QKEyp6ehOHqnXPCAWC2G+3IT2DDZzd6v7pXrI
 UlUF+zCnoHiLhKlSh6Ejjz9ltud/WfUDez4W3QxbdJgp19rdaqHpsmAjI1HoBokQ==
X-Received: by 2002:a05:6830:838b:b0:7d7:5460:49cd with SMTP id
 46e09a7af769-7d7546055e6mr389579a34.14.1773052668303; 
 Mon, 09 Mar 2026 03:37:48 -0700 (PDT)
Received: from starman.tricat-industries.com ([136.49.86.72])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7d755603798sm231247a34.29.2026.03.09.03.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 03:37:47 -0700 (PDT)
From: 'wallentx <william.allentx@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  9 Mar 2026 05:37:00 -0500
Message-ID: <20260309103700.489932-4-william.allentx@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309103700.489932-1-william.allentx@gmail.com>
References: <20260309103700.489932-1-william.allentx@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: wallentx When CONFIG_F2FS_CHECK_FS=y, zoned shared-SIT
 mode still keeps per-segment cur_valid_map_mir together with auxiliary SIT
 mirror state for runtime consistency checks. After shared SIT maps are
 introduc [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [william.allentx(at)gmail.com]
X-Headers-End: 1vzXzr-0008Fz-7g
Subject: [f2fs-dev] [RFC PATCH 3/3] f2fs: add mount option to disable shared
 SIT mirror checks
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 wallentx <william.allentx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 5501023739C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[williamallentx@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

From: wallentx <william.allentx@gmail.com>

When CONFIG_F2FS_CHECK_FS=y, zoned shared-SIT mode still keeps
per-segment cur_valid_map_mir together with auxiliary SIT mirror state
for runtime consistency checks. After shared SIT maps are introduced,
that mirror path becomes the next major static memory cost on large
zoned systems.

Add shared_sit_check/noshared_sit_check to control that extra mirror
tracking explicitly. Keep shared_sit_check as the default, limit the
option to zoned shared-SIT mounts, and reject changing it by remount
because the mirror state is built at mount time.

With noshared_sit_check, shared-SIT mode skips cur_valid_map_mir,
sit_bitmap_mir, and invalid_segmap allocation and their associated
check paths. This does not disable all CONFIG_F2FS_CHECK_FS behavior; it
only disables the extra shared-SIT mirror tracking.

On the same 43-volume HM-SMR test system (~550 TB total) with
CONFIG_F2FS_CHECK_FS=y, shared SIT with the default mirror path enabled
reported 27.70 GiB of static F2FS memory. Mounting with
noshared_sit_check reduced that to 12.10 GiB.

Signed-off-by: wallentx <william.allentx@gmail.com>
---
 Documentation/filesystems/f2fs.rst |  11 ++
 fs/f2fs/debug.c                    |   7 +-
 fs/f2fs/f2fs.h                     |  16 +++
 fs/f2fs/gc.c                       |  29 ++--
 fs/f2fs/segment.c                  | 213 ++++++++++++++++-------------
 fs/f2fs/segment.h                  |  28 ++--
 fs/f2fs/super.c                    |  21 +++
 7 files changed, 204 insertions(+), 121 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 7e4031631286..3ca191f92309 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -363,6 +363,17 @@ memory=%s		 Control memory mode. This supports "normal" and "low" modes.
 			 Because of the nature of low memory devices, in this mode, f2fs
 			 will try to save memory sometimes by sacrificing performance.
 			 "normal" mode is the default mode and same as before.
+shared_sit_check/
+noshared_sit_check	 Enable or disable extra SIT mirror consistency checks in
+			 zoned shared-SIT mode. This only affects zoned devices
+			 mounted with ``mode=lfs``, where shared SIT valid maps are
+			 used. ``shared_sit_check`` is enabled by default. Setting
+			 ``noshared_sit_check`` reduces memory usage when the kernel
+			 is built with ``CONFIG_F2FS_CHECK_FS=y`` by skipping the
+			 per-segment SIT mirror tracking. This option has no effect
+			 when shared SIT maps are not in use and cannot be changed
+			 by remount. To use a different setting, unmount and
+			 mount again with the new option.
 age_extent_cache	 Enable an age extent cache based on rb-tree. It records
 			 data block update frequency of the extent per inode, in
 			 order to provide better temperature hints for data block
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index d8bfdac5c1e4..ed6e03b42836 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -325,9 +325,10 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 		si->base_mem += SIT_VBLOCK_MAP_SIZE * 2;
 		/* Approximate private bitmaps for active logs */
 		si->base_mem += SIT_VBLOCK_MAP_SIZE * NR_CURSEG_TYPE;
-#ifdef CONFIG_F2FS_CHECK_FS
-		si->base_mem += SIT_VBLOCK_MAP_SIZE * MAIN_SEGS(sbi);
-#endif
+	#ifdef CONFIG_F2FS_CHECK_FS
+			if (f2fs_sit_check_enabled(sbi))
+				si->base_mem += SIT_VBLOCK_MAP_SIZE * MAIN_SEGS(sbi);
+	#endif
 		if (f2fs_block_unit_discard(sbi))
 			si->base_mem += SIT_VBLOCK_MAP_SIZE * MAIN_SEGS(sbi);
 	} else {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 11f3601ffd34..d8526103d86a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -130,6 +130,7 @@ enum f2fs_mount_opt {
 	F2FS_MOUNT_COMPRESS_CACHE,
 	F2FS_MOUNT_AGE_EXTENT_CACHE,
 	F2FS_MOUNT_NAT_BITS,
+	F2FS_MOUNT_SHARED_SIT_CHECK,
 	F2FS_MOUNT_INLINECRYPT,
 	/*
 	 * Some f2fs environments expect to be able to pass the "lazytime" option
@@ -4920,6 +4921,21 @@ static inline bool f2fs_use_shared_sit_map(struct f2fs_sb_info *sbi)
 	return f2fs_sb_has_blkzoned(sbi) && f2fs_lfs_mode(sbi);
 }
 
+/*
+ * shared_sit_check is a mount-time escape hatch for the extra SIT mirror
+ * tracking kept by CONFIG_F2FS_CHECK_FS in zoned shared-SIT mode.
+ */
+static inline bool f2fs_sit_check_enabled(struct f2fs_sb_info *sbi)
+{
+	if (!IS_ENABLED(CONFIG_F2FS_CHECK_FS))
+		return false;
+
+	if (!f2fs_use_shared_sit_map(sbi))
+		return true;
+
+	return test_opt(sbi, SHARED_SIT_CHECK);
+}
+
 static inline bool f2fs_is_sequential_zone_area(struct f2fs_sb_info *sbi,
 					  block_t blkaddr)
 {
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 80b8500fa987..1decb0caea1b 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -877,15 +877,16 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 		p.offset = segno + p.ofs_unit;
 		nsearched++;
 
-#ifdef CONFIG_F2FS_CHECK_FS
-		/*
-		 * skip selecting the invalid segno (that is failed due to block
-		 * validity check failure during GC) to avoid endless GC loop in
-		 * such cases.
-		 */
-		if (test_bit(segno, sm->invalid_segmap))
-			goto next;
-#endif
+	#ifdef CONFIG_F2FS_CHECK_FS
+			/*
+			 * skip selecting the invalid segno (that is failed due to block
+			 * validity check failure during GC) to avoid endless GC loop in
+			 * such cases.
+			 */
+			if (f2fs_sit_check_enabled(sbi) &&
+			    test_bit(segno, sm->invalid_segmap))
+				goto next;
+	#endif
 
 		secno = GET_SEC_FROM_SEG(sbi, segno);
 
@@ -1197,18 +1198,20 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	f2fs_folio_put(node_folio, true);
 
 	if (source_blkaddr != blkaddr) {
-#ifdef CONFIG_F2FS_CHECK_FS
+	#ifdef CONFIG_F2FS_CHECK_FS
 		unsigned int segno = GET_SEGNO(sbi, blkaddr);
 		unsigned long offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
 
-		if (unlikely(check_valid_map(sbi, segno, offset))) {
+		if (f2fs_sit_check_enabled(sbi) &&
+		    unlikely(check_valid_map(sbi, segno, offset))) {
 			if (!test_and_set_bit(segno, SIT_I(sbi)->invalid_segmap)) {
-				f2fs_err(sbi, "mismatched blkaddr %u (source_blkaddr %u) in seg %u",
+				f2fs_err(sbi,
+					 "mismatched blkaddr %u (source_blkaddr %u) in seg %u",
 					 blkaddr, source_blkaddr, segno);
 				set_sbi_flag(sbi, SBI_NEED_FSCK);
 			}
 		}
-#endif
+	#endif
 		return false;
 	}
 	return true;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0dab6b16ba56..dce66eec2a5f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -38,6 +38,11 @@ struct f2fs_sit_bitmap {
 	unsigned char map[SIT_VBLOCK_MAP_SIZE];
 };
 
+static inline struct f2fs_sit_bitmap *f2fs_sit_bitmap_from_map(void *map)
+{
+	return container_of(map, struct f2fs_sit_bitmap, map);
+}
+
 static void f2fs_free_sit_bitmap_rcu(struct rcu_head *rcu)
 {
 	struct f2fs_sit_bitmap *b = container_of(rcu, struct f2fs_sit_bitmap, rcu);
@@ -45,11 +50,6 @@ static void f2fs_free_sit_bitmap_rcu(struct rcu_head *rcu)
 	kmem_cache_free(sit_bitmap_slab, b);
 }
 
-static struct f2fs_sit_bitmap *f2fs_sit_bitmap_from_map(void *map)
-{
-	return container_of(map, struct f2fs_sit_bitmap, map);
-}
-
 static unsigned long __reverse_ulong(unsigned char *str)
 {
 	unsigned long tmp = 0;
@@ -845,9 +845,10 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 		if (valid_blocks == 0) {
 			clear_bit(GET_SEC_FROM_SEG(sbi, segno),
 						dirty_i->victim_secmap);
-#ifdef CONFIG_F2FS_CHECK_FS
-			clear_bit(segno, SIT_I(sbi)->invalid_segmap);
-#endif
+	#ifdef CONFIG_F2FS_CHECK_FS
+			if (f2fs_sit_check_enabled(sbi))
+				clear_bit(segno, SIT_I(sbi)->invalid_segmap);
+	#endif
 		}
 		if (__is_large_section(sbi)) {
 			unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
@@ -2471,9 +2472,10 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
 			memset(b->map, 0xff, SIT_VBLOCK_MAP_SIZE);
 			rcu_assign_pointer(se->cur_valid_map, b->map);
 			se->ckpt_valid_map = b->map;
-#ifdef CONFIG_F2FS_CHECK_FS
-			memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
-#endif
+	#ifdef CONFIG_F2FS_CHECK_FS
+			if (f2fs_sit_check_enabled(sbi))
+				memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
+	#endif
 		} else if (se->cur_valid_map == sit_i->bitmap_zero) {
 			/* Should not happen, freeing empty segment */
 			struct f2fs_sit_bitmap *b = f2fs_kmem_cache_alloc(sit_bitmap_slab,
@@ -2481,23 +2483,27 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
 			memset(b->map, 0, SIT_VBLOCK_MAP_SIZE);
 			rcu_assign_pointer(se->cur_valid_map, b->map);
 			se->ckpt_valid_map = b->map;
-#ifdef CONFIG_F2FS_CHECK_FS
-			memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
-#endif
+	#ifdef CONFIG_F2FS_CHECK_FS
+			if (f2fs_sit_check_enabled(sbi))
+				memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
+	#endif
 		}
 	}
 
 	for (i = 0; i < del_count; i++) {
 		exist = f2fs_test_and_clear_bit(offset + i, se->cur_valid_map);
-#ifdef CONFIG_F2FS_CHECK_FS
-		mir_exist = f2fs_test_and_clear_bit(offset + i,
-						se->cur_valid_map_mir);
-		if (unlikely(exist != mir_exist)) {
-			f2fs_err(sbi, "Inconsistent error when clearing bitmap, blk:%u, old bit:%d",
-				blkaddr + i, exist);
-			f2fs_bug_on(sbi, 1);
-		}
-#endif
+	#ifdef CONFIG_F2FS_CHECK_FS
+			if (f2fs_sit_check_enabled(sbi)) {
+				mir_exist = f2fs_test_and_clear_bit(offset + i,
+								    se->cur_valid_map_mir);
+				if (unlikely(exist != mir_exist)) {
+					f2fs_err(sbi,
+						 "Inconsistent error when clearing bitmap, blk:%u, old bit:%d",
+						 blkaddr + i, exist);
+					f2fs_bug_on(sbi, 1);
+				}
+			}
+	#endif
 		if (unlikely(!exist)) {
 			f2fs_err(sbi, "Bitmap was wrongly cleared, blk:%u", blkaddr + i);
 			f2fs_bug_on(sbi, 1);
@@ -2559,9 +2565,10 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
 			memset(b->map, 0, SIT_VBLOCK_MAP_SIZE);
 			rcu_assign_pointer(se->cur_valid_map, b->map);
 			se->ckpt_valid_map = b->map;
-#ifdef CONFIG_F2FS_CHECK_FS
-			memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
-#endif
+	#ifdef CONFIG_F2FS_CHECK_FS
+			if (f2fs_sit_check_enabled(sbi))
+				memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
+	#endif
 		} else if (se->cur_valid_map == sit_i->bitmap_full) {
 			/* Should not happen in LFS alloc, but for safety */
 			struct f2fs_sit_bitmap *b = f2fs_kmem_cache_alloc(sit_bitmap_slab,
@@ -2569,22 +2576,26 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
 			memset(b->map, 0xff, SIT_VBLOCK_MAP_SIZE);
 			rcu_assign_pointer(se->cur_valid_map, b->map);
 			se->ckpt_valid_map = b->map;
-#ifdef CONFIG_F2FS_CHECK_FS
-			memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
-#endif
+	#ifdef CONFIG_F2FS_CHECK_FS
+			if (f2fs_sit_check_enabled(sbi))
+				memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
+	#endif
 		}
 	}
 
 	exist = f2fs_test_and_set_bit(offset, se->cur_valid_map);
-#ifdef CONFIG_F2FS_CHECK_FS
-	mir_exist = f2fs_test_and_set_bit(offset,
-					se->cur_valid_map_mir);
-	if (unlikely(exist != mir_exist)) {
-		f2fs_err(sbi, "Inconsistent error when setting bitmap, blk:%u, old bit:%d",
-			blkaddr, exist);
-		f2fs_bug_on(sbi, 1);
+	#ifdef CONFIG_F2FS_CHECK_FS
+	if (f2fs_sit_check_enabled(sbi)) {
+		mir_exist = f2fs_test_and_set_bit(offset,
+						  se->cur_valid_map_mir);
+		if (unlikely(exist != mir_exist)) {
+			f2fs_err(sbi,
+				 "Inconsistent error when setting bitmap, blk:%u, old bit:%d",
+				 blkaddr, exist);
+			f2fs_bug_on(sbi, 1);
+		}
 	}
-#endif
+	#endif
 	if (unlikely(exist)) {
 		f2fs_err(sbi, "Bitmap was wrongly set, blk:%u", blkaddr);
 		f2fs_bug_on(sbi, 1);
@@ -2677,13 +2688,15 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 
 			rcu_assign_pointer(se->cur_valid_map, sit_i->bitmap_zero);
 			se->ckpt_valid_map = sit_i->bitmap_zero;
-#ifdef CONFIG_F2FS_CHECK_FS
-			memset(se->cur_valid_map_mir, 0, SIT_VBLOCK_MAP_SIZE);
-#endif
+	#ifdef CONFIG_F2FS_CHECK_FS
+			if (f2fs_sit_check_enabled(sbi))
+				memset(se->cur_valid_map_mir, 0, SIT_VBLOCK_MAP_SIZE);
+	#endif
 			if (old_map != sit_i->bitmap_zero &&
 			    old_map != sit_i->bitmap_full) {
-				call_rcu(&f2fs_sit_bitmap_from_map(old_map)->rcu,
-					 f2fs_free_sit_bitmap_rcu);
+				struct f2fs_sit_bitmap *b =
+					f2fs_sit_bitmap_from_map(old_map);
+				call_rcu(&b->rcu, f2fs_free_sit_bitmap_rcu);
 			}
 		} else if (new_vblocks == BLKS_PER_SEG(sbi) &&
 				se->cur_valid_map != sit_i->bitmap_full) {
@@ -2691,13 +2704,15 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 
 			rcu_assign_pointer(se->cur_valid_map, sit_i->bitmap_full);
 			se->ckpt_valid_map = sit_i->bitmap_full;
-#ifdef CONFIG_F2FS_CHECK_FS
-			memset(se->cur_valid_map_mir, 0xff, SIT_VBLOCK_MAP_SIZE);
-#endif
+	#ifdef CONFIG_F2FS_CHECK_FS
+			if (f2fs_sit_check_enabled(sbi))
+				memset(se->cur_valid_map_mir, 0xff, SIT_VBLOCK_MAP_SIZE);
+	#endif
 			if (old_map != sit_i->bitmap_zero &&
 			    old_map != sit_i->bitmap_full) {
-				call_rcu(&f2fs_sit_bitmap_from_map(old_map)->rcu,
-					 f2fs_free_sit_bitmap_rcu);
+				struct f2fs_sit_bitmap *b =
+					f2fs_sit_bitmap_from_map(old_map);
+				call_rcu(&b->rcu, f2fs_free_sit_bitmap_rcu);
 			}
 		}
 	}
@@ -4701,7 +4716,7 @@ static struct folio *get_next_sit_folio(struct f2fs_sb_info *sbi,
 	seg_info_to_sit_folio(sbi, folio, start);
 
 	folio_mark_dirty(folio);
-	set_to_next_sit(sit_i, start);
+				set_to_next_sit(sbi, sit_i, start);
 
 	return folio;
 }
@@ -4857,11 +4872,12 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 			int offset, sit_offset;
 
 			se = get_seg_entry(sbi, segno);
-#ifdef CONFIG_F2FS_CHECK_FS
-			if (memcmp(se->cur_valid_map, se->cur_valid_map_mir,
-						SIT_VBLOCK_MAP_SIZE))
+	#ifdef CONFIG_F2FS_CHECK_FS
+			if (f2fs_sit_check_enabled(sbi) &&
+			    memcmp(se->cur_valid_map, se->cur_valid_map_mir,
+				   SIT_VBLOCK_MAP_SIZE))
 				f2fs_bug_on(sbi, 1);
-#endif
+	#endif
 
 			/* add discard candidates */
 			if (!(cpc->reason & CP_DISCARD)) {
@@ -4953,11 +4969,8 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	if (!sit_i->dirty_sentries_bitmap)
 		return -ENOMEM;
 
-#ifdef CONFIG_F2FS_CHECK_FS
-	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * (3 + discard_map);
-#else
-	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * (2 + discard_map);
-#endif
+	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE *
+			(2 + discard_map + f2fs_sit_check_enabled(sbi));
 
 	if (share_map) {
 		sit_i->bitmap_zero = f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
@@ -4971,10 +4984,9 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 		}
 		memset(sit_i->bitmap_full, 0xff, SIT_VBLOCK_MAP_SIZE);
 
-		bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * discard_map;
-#ifdef CONFIG_F2FS_CHECK_FS
-		bitmap_size += MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE;
-#endif
+			bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * discard_map;
+			if (f2fs_sit_check_enabled(sbi))
+				bitmap_size += MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE;
 		if (bitmap_size) {
 			sit_i->bitmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
 			if (!sit_i->bitmap) {
@@ -4993,9 +5005,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 			sit_i->sentries[start].ckpt_valid_map =
 						sit_i->bitmap_zero;
 #ifdef CONFIG_F2FS_CHECK_FS
-			sit_i->sentries[start].cur_valid_map_mir =
-						bitmap;
-			bitmap += SIT_VBLOCK_MAP_SIZE;
+			if (f2fs_sit_check_enabled(sbi)) {
+				sit_i->sentries[start].cur_valid_map_mir = bitmap;
+				bitmap += SIT_VBLOCK_MAP_SIZE;
+			}
 #endif
 			if (discard_map) {
 				sit_i->sentries[start].discard_map = bitmap;
@@ -5017,8 +5030,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 			bitmap += SIT_VBLOCK_MAP_SIZE;
 
 #ifdef CONFIG_F2FS_CHECK_FS
-			sit_i->sentries[start].cur_valid_map_mir = bitmap;
-			bitmap += SIT_VBLOCK_MAP_SIZE;
+			if (f2fs_sit_check_enabled(sbi)) {
+				sit_i->sentries[start].cur_valid_map_mir = bitmap;
+				bitmap += SIT_VBLOCK_MAP_SIZE;
+			}
 #endif
 
 			if (discard_map) {
@@ -5052,16 +5067,20 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	if (!sit_i->sit_bitmap)
 		return -ENOMEM;
 
-#ifdef CONFIG_F2FS_CHECK_FS
-	sit_i->sit_bitmap_mir = kmemdup(src_bitmap,
-					sit_bitmap_size, GFP_KERNEL);
-	if (!sit_i->sit_bitmap_mir)
-		return -ENOMEM;
+	#ifdef CONFIG_F2FS_CHECK_FS
+	if (f2fs_sit_check_enabled(sbi)) {
+		sit_i->sit_bitmap_mir = kmemdup(src_bitmap,
+						sit_bitmap_size,
+						GFP_KERNEL);
+		if (!sit_i->sit_bitmap_mir)
+			return -ENOMEM;
 
-	sit_i->invalid_segmap = f2fs_kvzalloc(sbi,
-					main_bitmap_size, GFP_KERNEL);
-	if (!sit_i->invalid_segmap)
-		return -ENOMEM;
+		sit_i->invalid_segmap = f2fs_kvzalloc(sbi,
+						      main_bitmap_size,
+						      GFP_KERNEL);
+		if (!sit_i->invalid_segmap)
+			return -ENOMEM;
+	}
 #endif
 
 	sit_i->sit_base_addr = le32_to_cpu(raw_super->sit_blkaddr);
@@ -5200,12 +5219,13 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 				rcu_assign_pointer(se->cur_valid_map, map);
 				se->ckpt_valid_map = map;
 #ifdef CONFIG_F2FS_CHECK_FS
-				memcpy(se->cur_valid_map_mir, map, SIT_VBLOCK_MAP_SIZE);
+				if (f2fs_sit_check_enabled(sbi))
+					memcpy(se->cur_valid_map_mir, map, SIT_VBLOCK_MAP_SIZE);
 #endif
 				se->type = GET_SIT_TYPE(&sit);
 				se->mtime = le64_to_cpu(sit.mtime);
 			} else {
-				seg_info_from_raw_sit(se, &sit);
+				seg_info_from_raw_sit(sbi, se, &sit);
 			}
 
 			if (se->type >= NR_PERSISTENT_LOG) {
@@ -5279,15 +5299,19 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 
 			if (vblocks == 0 && !is_active) {
 				if (map != sit_i->bitmap_zero &&
-				    map != sit_i->bitmap_full)
-					kmem_cache_free(sit_bitmap_slab,
-							f2fs_sit_bitmap_from_map(map));
+				    map != sit_i->bitmap_full) {
+					struct f2fs_sit_bitmap *b =
+						f2fs_sit_bitmap_from_map(map);
+					kmem_cache_free(sit_bitmap_slab, b);
+				}
 				map = sit_i->bitmap_zero;
 			} else if (vblocks == BLKS_PER_SEG(sbi) && !is_active) {
 				if (map != sit_i->bitmap_zero &&
-				    map != sit_i->bitmap_full)
-					kmem_cache_free(sit_bitmap_slab,
-							f2fs_sit_bitmap_from_map(map));
+				    map != sit_i->bitmap_full) {
+					struct f2fs_sit_bitmap *b =
+						f2fs_sit_bitmap_from_map(map);
+					kmem_cache_free(sit_bitmap_slab, b);
+				}
 				map = sit_i->bitmap_full;
 			} else {
 				if (map == sit_i->bitmap_zero ||
@@ -5310,12 +5334,13 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 			rcu_assign_pointer(se->cur_valid_map, map);
 			se->ckpt_valid_map = map;
 #ifdef CONFIG_F2FS_CHECK_FS
-			memcpy(se->cur_valid_map_mir, map, SIT_VBLOCK_MAP_SIZE);
+			if (f2fs_sit_check_enabled(sbi))
+				memcpy(se->cur_valid_map_mir, map, SIT_VBLOCK_MAP_SIZE);
 #endif
 			se->type = GET_SIT_TYPE(&sit);
 			se->mtime = le64_to_cpu(sit.mtime);
 		} else {
-			seg_info_from_raw_sit(se, &sit);
+			seg_info_from_raw_sit(sbi, se, &sit);
 		}
 
 		if (se->type >= NR_PERSISTENT_LOG) {
@@ -6099,18 +6124,18 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
 		if (f2fs_use_shared_sit_map(sbi)) {
 			unsigned int start;
 
-			for (start = 0; start < MAIN_SEGS(sbi); start++) {
-				struct seg_entry *se = &sit_i->sentries[start];
+				for (start = 0; start < MAIN_SEGS(sbi); start++) {
+					struct seg_entry *se = &sit_i->sentries[start];
 
-				if (se->cur_valid_map &&
-				    se->cur_valid_map != sit_i->bitmap_zero &&
-				    se->cur_valid_map != sit_i->bitmap_full) {
-					struct f2fs_sit_bitmap *b;
+					if (se->cur_valid_map &&
+					    se->cur_valid_map != sit_i->bitmap_zero &&
+					    se->cur_valid_map != sit_i->bitmap_full) {
+						struct f2fs_sit_bitmap *b;
 
-					b = f2fs_sit_bitmap_from_map(se->cur_valid_map);
-					kmem_cache_free(sit_bitmap_slab, b);
+						b = f2fs_sit_bitmap_from_map(se->cur_valid_map);
+						kmem_cache_free(sit_bitmap_slab, b);
+					}
 				}
-			}
 			kfree(sit_i->bitmap_zero);
 			kfree(sit_i->bitmap_full);
 			if (sit_i->bitmap)
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index cb45cfa7a658..0f4445375ed1 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -404,15 +404,17 @@ static inline void sanity_check_valid_blocks(struct f2fs_sb_info *sbi,
 {
 }
 #endif
-static inline void seg_info_from_raw_sit(struct seg_entry *se,
-					struct f2fs_sit_entry *rs)
+static inline void seg_info_from_raw_sit(struct f2fs_sb_info *sbi,
+					 struct seg_entry *se,
+					 struct f2fs_sit_entry *rs)
 {
 	se->valid_blocks = GET_SIT_VBLOCKS(rs);
 	se->ckpt_valid_blocks = GET_SIT_VBLOCKS(rs);
 	memcpy(se->cur_valid_map, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
 	memcpy(se->ckpt_valid_map, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
 #ifdef CONFIG_F2FS_CHECK_FS
-	memcpy(se->cur_valid_map_mir, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
+	if (f2fs_sit_check_enabled(sbi))
+		memcpy(se->cur_valid_map_mir, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
 #endif
 	se->type = GET_SIT_TYPE(rs);
 	se->mtime = le64_to_cpu(rs->mtime);
@@ -558,11 +560,12 @@ static inline void get_sit_bitmap(struct f2fs_sb_info *sbi,
 {
 	struct sit_info *sit_i = SIT_I(sbi);
 
-#ifdef CONFIG_F2FS_CHECK_FS
-	if (memcmp(sit_i->sit_bitmap, sit_i->sit_bitmap_mir,
-						sit_i->bitmap_size))
+	#ifdef CONFIG_F2FS_CHECK_FS
+	if (f2fs_sit_check_enabled(sbi) &&
+	    memcmp(sit_i->sit_bitmap, sit_i->sit_bitmap_mir,
+		   sit_i->bitmap_size))
 		f2fs_bug_on(sbi, 1);
-#endif
+	#endif
 	memcpy(dst_addr, sit_i->sit_bitmap, sit_i->bitmap_size);
 }
 
@@ -904,8 +907,9 @@ static inline pgoff_t current_sit_addr(struct f2fs_sb_info *sbi,
 	f2fs_bug_on(sbi, !valid_main_segno(sbi, start));
 
 #ifdef CONFIG_F2FS_CHECK_FS
-	if (f2fs_test_bit(offset, sit_i->sit_bitmap) !=
-			f2fs_test_bit(offset, sit_i->sit_bitmap_mir))
+	if (f2fs_sit_check_enabled(sbi) &&
+	    f2fs_test_bit(offset, sit_i->sit_bitmap) !=
+				f2fs_test_bit(offset, sit_i->sit_bitmap_mir))
 		f2fs_bug_on(sbi, 1);
 #endif
 
@@ -929,13 +933,15 @@ static inline pgoff_t next_sit_addr(struct f2fs_sb_info *sbi,
 	return block_addr + sit_i->sit_base_addr;
 }
 
-static inline void set_to_next_sit(struct sit_info *sit_i, unsigned int start)
+static inline void set_to_next_sit(struct f2fs_sb_info *sbi,
+				   struct sit_info *sit_i, unsigned int start)
 {
 	unsigned int block_off = SIT_BLOCK_OFFSET(start);
 
 	f2fs_change_bit(block_off, sit_i->sit_bitmap);
 #ifdef CONFIG_F2FS_CHECK_FS
-	f2fs_change_bit(block_off, sit_i->sit_bitmap_mir);
+	if (f2fs_sit_check_enabled(sbi))
+		f2fs_change_bit(block_off, sit_i->sit_bitmap_mir);
 #endif
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 83ce88ce12cb..e2bb5d0ab3e1 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -228,6 +228,7 @@ enum {
 	Opt_gc_merge,
 	Opt_discard_unit,
 	Opt_memory_mode,
+	Opt_shared_sit_check,
 	Opt_age_extent_cache,
 	Opt_errors,
 	Opt_nat_bits,
@@ -359,6 +360,7 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
 	fsparam_flag_no("gc_merge", Opt_gc_merge),
 	fsparam_enum("discard_unit", Opt_discard_unit, f2fs_param_discard_unit),
 	fsparam_enum("memory", Opt_memory_mode, f2fs_param_memory_mode),
+	fsparam_flag_no("shared_sit_check", Opt_shared_sit_check),
 	fsparam_flag("age_extent_cache", Opt_age_extent_cache),
 	fsparam_enum("errors", Opt_errors, f2fs_param_errors),
 	fsparam_enum("lookup_mode", Opt_lookup_mode, f2fs_param_lookup_mode),
@@ -1217,6 +1219,12 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		F2FS_CTX_INFO(ctx).memory_mode = result.uint_32;
 		ctx->spec_mask |= F2FS_SPEC_memory_mode;
 		break;
+	case Opt_shared_sit_check:
+		if (result.negated)
+			ctx_clear_opt(ctx, F2FS_MOUNT_SHARED_SIT_CHECK);
+		else
+			ctx_set_opt(ctx, F2FS_MOUNT_SHARED_SIT_CHECK);
+		break;
 	case Opt_age_extent_cache:
 		ctx_set_opt(ctx, F2FS_MOUNT_AGE_EXTENT_CACHE);
 		break;
@@ -2514,6 +2522,11 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	else if (F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_LOW)
 		seq_printf(seq, ",memory=%s", "low");
 
+	if (test_opt(sbi, SHARED_SIT_CHECK))
+		seq_puts(seq, ",shared_sit_check");
+	else
+		seq_puts(seq, ",noshared_sit_check");
+
 	if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY)
 		seq_printf(seq, ",errors=%s", "remount-ro");
 	else if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_CONTINUE)
@@ -2573,6 +2586,7 @@ static void default_options(struct f2fs_sb_info *sbi, bool remount)
 	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
 	F2FS_OPTION(sbi).memory_mode = MEMORY_MODE_NORMAL;
 	F2FS_OPTION(sbi).errors = MOUNT_ERRORS_CONTINUE;
+	set_opt(sbi, SHARED_SIT_CHECK);
 
 	set_opt(sbi, INLINE_XATTR);
 	set_opt(sbi, INLINE_DATA);
@@ -2782,6 +2796,7 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 	bool no_compress_cache = !test_opt(sbi, COMPRESS_CACHE);
 	bool block_unit_discard = f2fs_block_unit_discard(sbi);
 	bool no_nat_bits = !test_opt(sbi, NAT_BITS);
+	bool shared_sit_check = test_opt(sbi, SHARED_SIT_CHECK);
 #ifdef CONFIG_QUOTA
 	int i, j;
 #endif
@@ -2904,6 +2919,12 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 		goto restore_opts;
 	}
 
+	if (shared_sit_check != !!test_opt(sbi, SHARED_SIT_CHECK)) {
+		err = -EINVAL;
+		f2fs_warn(sbi, "switch shared_sit_check option is not allowed");
+		goto restore_opts;
+	}
+
 	if ((flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
 		err = -EINVAL;
 		f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
