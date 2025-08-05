Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 138A9B1AEE6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 08:56:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VFOeusERyeVKT8oxm5MDL4LGDw40088mZzNAyKsnvw=; b=jyUDqdN1I4I3cI9FMepXME/NTK
	BFNcAHYcJQshPgg8gQgLzaNovD7UgwyEVBbMW8tEo8UMwngGRhHjHKywBjXRFZdGFvzr3WE6slq7o
	7DvJDQgO1p/nG3Bi9Ke2305lP/9e0XH7coRusXsV9GgnChbRY9MjvPxbTCPzIXPOH3xo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujBaT-0005MH-Sv;
	Tue, 05 Aug 2025 06:55:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <326qRaAcKAMIkp2ttmmowwotm.kwu@flex--chullee.bounces.google.com>)
 id 1ujBa4-0005Jb-Gu for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 06:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EGnjhlkr58/FOajbxu7sCyHuJOVEyicbJJHbor5PpZw=; b=aZhXzI3BWS6FwLsAdyooDgT1mx
 lTVt/BflA3YDtA8rnzxAx8+upoeM/1s9wOXOpX19+0IPl4qQlHrThLynYzy/EPc32vj6VXmx90lU+
 jP1vrv3qc3LDztSjDo7izxPdJp3zrnnXgP1C6/lVzX227x47ndzru1PfvSxx3Z9g16HA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EGnjhlkr58/FOajbxu7sCyHuJOVEyicbJJHbor5PpZw=; b=aQkL/XlLlyTyoQVg29XlG1EJvf
 yBREAi32PsbSEHTlcBE0ZinATS3a7YxT6m/NoaPCnR2AoOkaa2ZbdaD4lxuzuTdPnl77FUHt6kvP7
 Cn+0V6zCQr5yKxcVp1l9FMmE10jBLWlabffxPCR9sGUPkUdkrA04UaWvZZvkgC6udzVk=;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ujBa4-0004ye-Sm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 06:55:29 +0000
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-3215b3229c7so216244a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Aug 2025 23:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754376923; x=1754981723;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=EGnjhlkr58/FOajbxu7sCyHuJOVEyicbJJHbor5PpZw=;
 b=19A9h3yMOKtdVbIKCvwg1ukyA7apq3skN4Dh/snMoXkDfoE+GzaIpHlnDM7u/jL3qR
 SzdSx4pLn5o9osl6eJtm+FaBqRem1xqkBXXMLu7SV8t2HF0C7Vm3npEw7UJ1M6r1Ozcc
 RtGt+YpO8W/l3dm6znbcWBeG6njg+B4Fu39ODwF9lRsWpmfQpct5pwxFGPCE+dfbVG6n
 KPiGQkP4kRiwKINtcASpQ4u33YWIYYdti2cQ9n7UFNiV4tvCDZPsSSCpP2vk3XOnlXsp
 iwPJLSppjH591lEwiHW1G2/2xoNWXaNsGZ5URW9TdXDpGidTn7bqvaYlutdW7q9GcmcF
 /hpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754376923; x=1754981723;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EGnjhlkr58/FOajbxu7sCyHuJOVEyicbJJHbor5PpZw=;
 b=vgHw7nF1iaSl7ieoBEE/4Cr16uqVUN4Y0Ms256dRutd3ddqP8cSNlFjyVuJ4FLPLMA
 D/ex4FMp0t9OQG4mmF/h4zaeSMsTkTFiVPyYOtTaiNOTfG16a6IX2keew7qF2TVMlD0b
 L61QQ73fZUM30UXbpP90HIPi/F828b3HPYHAn4rbeVvbys7fJlqZbX1HiWcZrXuxNzeb
 E6srInbgbhsOChIJerp0v1/2vbERUJUyXTIGWop1lgO9wUB6MVc8jA0q8oFwCFXYkjl1
 hP4JRCFV4CuCe+3hSlaT65JXQFLra91evlv5De4th+qplIpq2zhbytTQzGI0VWA8Tmin
 B+rQ==
X-Gm-Message-State: AOJu0YztB2GSDvddCgyadCC+fHCoGc7d6Z9KCbpOYFg1gZm2evGdoOiT
 kb+izwRwOL7MBep4nF3ucOedwczaGHmjTsAN7wDQjwlk7REtzSnJmBYEuPp/GkgxZf8jcA8qdrE
 fMJnnkEg2VQ==
X-Google-Smtp-Source: AGHT+IHiu4DhHhvqRwnRV+7sEMgNrWuou7jXyKKVTJWIaRvXuvPn5nPcl5lKq7G3lUXODl1vhwiF8Dy9CJ5P
X-Received: from pjbqn4.prod.google.com ([2002:a17:90b:3d44:b0:31f:1a3e:fe3b])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1c8b:b0:314:2892:b1e0
 with SMTP id 98e67ed59e1d1-321162e56camr15849803a91.34.1754376923165; Mon, 04
 Aug 2025 23:55:23 -0700 (PDT)
Date: Mon,  4 Aug 2025 23:52:27 -0700
In-Reply-To: <20250805065228.1473089-1-chullee@google.com>
Mime-Version: 1.0
References: <20250805065228.1473089-1-chullee@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250805065228.1473089-2-chullee@google.com>
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.73 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1ujBa4-0004ye-Sm
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: add sysfs entry for effective
 lookup mode
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
v2:
- show "auto:perf" or "auto:compat" when lookup_mode is 'auto'.
 Documentation/ABI/testing/sysfs-fs-f2fs | 15 +++++++++++++++
 fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bc0e7fefc39d..ce189acd1908 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -883,3 +883,18 @@ Date:		June 2025
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
 		Default: 1
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
+		- "auto:perf": lookup_mode is auto and fallback is disabled on-disk
+		- "auto:compat": lookup_mode is auto and fallback is enabled on-disk
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index f736052dea50..82489c78aeda 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -281,6 +281,22 @@ static ssize_t encoding_flags_show(struct f2fs_attr *a,
 		le16_to_cpu(F2FS_RAW_SUPER(sbi)->s_encoding_flags));
 }
 
+static ssize_t effective_lookup_mode_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	switch (F2FS_OPTION(sbi).lookup_mode) {
+	case LOOKUP_PERF:
+		return sysfs_emit(buf, "perf\n");
+	case LOOKUP_COMPAT:
+		return sysfs_emit(buf, "compat\n");
+	case LOOKUP_AUTO:
+		if (sb_no_casefold_compat_fallback(sbi->sb))
+			return sysfs_emit(buf, "auto:perf\n");
+		return sysfs_emit(buf, "auto:compat\n");
+	}
+	return 0;
+}
+
 static ssize_t mounted_time_sec_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -1211,6 +1227,7 @@ F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
 F2FS_GENERAL_RO_ATTR(unusable);
 F2FS_GENERAL_RO_ATTR(encoding);
 F2FS_GENERAL_RO_ATTR(encoding_flags);
+F2FS_GENERAL_RO_ATTR(effective_lookup_mode);
 F2FS_GENERAL_RO_ATTR(mounted_time_sec);
 F2FS_GENERAL_RO_ATTR(main_blkaddr);
 F2FS_GENERAL_RO_ATTR(pending_discard);
@@ -1329,6 +1346,7 @@ static struct attribute *f2fs_attrs[] = {
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
