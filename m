Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13424B19B97
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Aug 2025 08:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VU/XIg2RLRbBasfc2Zng3jdH7VZMxkbl47tvL5uOo1I=; b=a/A9lOeL9UZQZjKjV2cX0N9iOy
	IgMeZaq6zgGJJDdx3dElG3lQjxFH8VCyrnJ7Yih1abjOJ8RnMI2oH9Wrg9+5lREUD9Mu5IPUzUOtM
	E56+R2paov78djoDII1uwF6uhzhOiMNtQSWZF7wOYWbyT95vyf8ZSjVxrNifj7zFq6l8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uiohN-0003R8-TU;
	Mon, 04 Aug 2025 06:29:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3OE2QaAcKAF89ERIIBBDLLDIB.9LJ@flex--chullee.bounces.google.com>)
 id 1uioh6-0003Qn-Da for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 06:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kAR2Eoyeq+sNiEt+R/9Asn6gXMfLUzb3w+CS82HR2yQ=; b=ge5Qyq6nQRd+IJJrV/pq9sCF2I
 Unx9VteTdzfgSUPQqyVpAHmuiVG/n9bRm1acLg64decSGab4e39fjpWnL4STKVP8/B3oiUC5EXJgY
 4NEUgqhc0b8/G0BEnFLmMnDuG9XCYVrFAViGJDFGr0s94V6tyyiJCtH230uCgPHmucSw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kAR2Eoyeq+sNiEt+R/9Asn6gXMfLUzb3w+CS82HR2yQ=; b=SZfMgQ3u+0n4S6bTHhM7BgK+G5
 ABwZ2dy4MJWg6yElFGYQM1m4CrjhFAD+nzxS9IMwMYCfP/68QDi9Y04IaPzUu/tsc3DES9ogmITjb
 DT3DMZKCJ9T6wz5RvEDoQdBVNuXGPJC23fKYrp+xo0BNz78uc34/ZbIq6tJGJ/TsyK74=;
Received: from mail-io1-f73.google.com ([209.85.166.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uioh6-0000bj-0l for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 06:29:12 +0000
Received: by mail-io1-f73.google.com with SMTP id
 ca18e2360f4ac-8649be94fa1so677342239f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 03 Aug 2025 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754288941; x=1754893741;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kAR2Eoyeq+sNiEt+R/9Asn6gXMfLUzb3w+CS82HR2yQ=;
 b=tMA3C8bIF2nGB0Wqg+JaFX02XkLBvCT23B6a58y7X0X3GP+iAGk+AirJKeK0Z5NJRr
 bl5o807sbyA7+9UDFfQa3flExIIen2K0FxVp82PGpPGdDDHmbFD3rvLC5ldWQIq8rOUw
 ePc8gANAPfeEdfQSVs7xn9iUNmyKCmWAHW6fgV4p1XcMhqAzaZkyOQw/WtxRzcdWczXH
 z355FtOZwskZ5k/+t9ECQMuXIZ076dHmT/PvmyaRZezq/W6oPX1+70WRDFkF912hG+4e
 +SRY4tNc7iSjlnm12oapYfywooL+qWXyVkmcTZ2qM9yUhQIXW87GAyhvAd80BROJR5+L
 VyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754288941; x=1754893741;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kAR2Eoyeq+sNiEt+R/9Asn6gXMfLUzb3w+CS82HR2yQ=;
 b=VlXFfKIC+lr0Mnc9fPQ41QI5/nxYNDEaCULS5sy1YwWY/sgGr903IDwzHaKU8hFpHV
 MPF+QnQh6Z5WtPoYevBbMlrUbpCfipF7jyu+p+juUHTtT9DTc9+4qKmDIdq9dnlP05Fp
 olyJ/K2ZSHmiVBJgQDj4wDQOR3DZ/uwDfmy4QIVwPLa5ziAOqdhOn1Zztwbbl+ituSWd
 jKNvTUhqPzGg1MMeabg3CvLYZ9yHcrunQVriLPfqyOx+3jJseYC2+BY7ywMEa/TrTMEj
 pANPEnKrUQG7yjh4L98IC4gajO08bvXr3cf6wGUkelyPYoHoYjFz+bLQVVDtHS9AC2ZJ
 X4Rw==
X-Gm-Message-State: AOJu0YxpY1sAX+fs8TMeOz/yYuTSAOJmtyBjYyQT3fwi7l2EBry1d2uT
 KDutsjRV0XZtBA9dinMj+9yE72mSTZ9GjyagTmFobKpEoQnK0VX7NUbEVfk4NtEBbsWev2pczqm
 KNo/jaKDcaQ==
X-Google-Smtp-Source: AGHT+IHaVYUjM46yLlegvpYFMhTlII2JZiMeD++blc9CSojygb7SUXbrQ7bZ57kYXtttV4dViYL7CrPDbXP2
X-Received: from pfaw3.prod.google.com ([2002:a05:6a00:ab83:b0:746:2897:67e3])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3d08:b0:23d:7b87:2c88
 with SMTP id adf61e73a8af0-23df8f6d4c8mr11124851637.9.1754287416301; Sun, 03
 Aug 2025 23:03:36 -0700 (PDT)
Date: Sun,  3 Aug 2025 23:03:27 -0700
In-Reply-To: <20250804060327.512247-1-chullee@google.com>
Mime-Version: 1.0
References: <20250804060327.512247-1-chullee@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250804060327.512247-2-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This commit introduces a new read-only sysfs entry at
 /sys/fs/f2fs/<device>/effective_lookup_mode.
 This entry displays the actual directory lookup mode F2FS is currently using.
 This is needed for debugging and verification, as the behavior is determined
 by both on-disk flags and mount options. 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.73 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uioh6-0000bj-0l
Subject: [f2fs-dev] [PATCH 2/2] f2fs: add sysfs entry for effective lookup
 mode
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
From: Daniel Lee via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Lee <chullee@google.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This commit introduces a new read-only sysfs entry at
/sys/fs/f2fs/<device>/effective_lookup_mode.

This entry displays the actual directory lookup mode F2FS is
currently using. This is needed for debugging and verification,
as the behavior is determined by both on-disk flags and mount
options.

Signed-off-by: Daniel Lee <chullee@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 14 ++++++++++++++
 fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bf03263b9f46..e847a50e7403 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -861,3 +861,17 @@ Description:	This is a read-only entry to show the value of sb.s_encoding_flags,
 		SB_ENC_STRICT_MODE_FL            0x00000001
 		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
 		============================     ==========
+
+What:		/sys/fs/f2fs/<disk>/effective_lookup_mode
+Date:		August 2025
+Contact:	"Daniel Lee" <chullee@google.com>
+Description:
+		This is a read-only entry to show the effective directory lookup mode
+		F2FS is currently using for casefolded directories.
+		This considers both the "lookup_mode" mount option and the on-disk
+		encoding flag, SB_ENC_NO_COMPAT_FALLBACK_FL.
+
+		Possible values are:
+		- "perf": Hash-only lookup.
+		- "compat": Hash-based lookup with a linear search fallback enabled
+		  for casefolded directories.
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 75134d69a0bd..9897dd8564e0 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -281,6 +281,22 @@ static ssize_t encoding_flags_show(struct f2fs_attr *a,
 		le16_to_cpu(F2FS_RAW_SUPER(sbi)->s_encoding_flags));
 }
 
+static ssize_t effective_lookup_mode_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	switch (f2fs_get_lookup_mode(sbi)) {
+	case LOOKUP_PERF:
+		return sysfs_emit(buf, "perf\n");
+	case LOOKUP_COMPAT:
+		return sysfs_emit(buf, "compat\n");
+	case LOOKUP_AUTO:
+		if (sb_no_casefold_compat_fallback(sbi->sb))
+			return sysfs_emit(buf, "perf\n");
+		return sysfs_emit(buf, "compat\n");
+	}
+	return 0;
+}
+
 static ssize_t mounted_time_sec_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -1166,6 +1182,7 @@ F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
 F2FS_GENERAL_RO_ATTR(unusable);
 F2FS_GENERAL_RO_ATTR(encoding);
 F2FS_GENERAL_RO_ATTR(encoding_flags);
+F2FS_GENERAL_RO_ATTR(effective_lookup_mode);
 F2FS_GENERAL_RO_ATTR(mounted_time_sec);
 F2FS_GENERAL_RO_ATTR(main_blkaddr);
 F2FS_GENERAL_RO_ATTR(pending_discard);
@@ -1282,6 +1299,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(current_reserved_blocks),
 	ATTR_LIST(encoding),
 	ATTR_LIST(encoding_flags),
+	ATTR_LIST(effective_lookup_mode),
 	ATTR_LIST(mounted_time_sec),
 #ifdef CONFIG_F2FS_STAT_FS
 	ATTR_LIST(cp_foreground_calls),
-- 
2.50.1.565.gc32cd1483b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
