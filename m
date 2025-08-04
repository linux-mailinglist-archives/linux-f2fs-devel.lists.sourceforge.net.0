Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55543B1AC22
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 03:36:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VFOeusERyeVKT8oxm5MDL4LGDw40088mZzNAyKsnvw=; b=b6QIjo+6exB09VPyNT72GFaU9Z
	4LhCIEhk1aEwEO9MgRTnvM/pbJuS4C37wb13gYAXhNd5uMAIJ+D7oq6K9Op1mFRZQhHtl+/MJhSHA
	fcQzGR3bZddJRwmoW9onIBSeaqMpp+62lAYIfKevd5wc7dMXOmNfjStsbgmNLm8/Jd2U=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uj6aw-0001X0-6s;
	Tue, 05 Aug 2025 01:36:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <34zyRaAcKAOwQViZZSSUccUZS.Qca@flex--chullee.bounces.google.com>)
 id 1uj6at-0001Wc-AM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 01:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EGnjhlkr58/FOajbxu7sCyHuJOVEyicbJJHbor5PpZw=; b=LZKnkCXPFV61fidKklZMgpRgEd
 NGsER0djBpd7G8sZ6yaLAVkKH1ZlOzfsIMk7wgVOPtjJ2eXwWBiIX3sBhLi1XrY3t6lCLiCN1r5WW
 HyeGvncsPK8NLR4kACWsFr/F1FAlCDGIz+0b5WOXhrIM7W8vYpSqnoVkYxzyhN+yvviQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EGnjhlkr58/FOajbxu7sCyHuJOVEyicbJJHbor5PpZw=; b=iv4N+WKYvf+kNuxi7Iieqh45oD
 AbZ9laN7C3LzeA5CMLToRLbFPeBbI1hWu5fEfJwcy5KnyfxEAHo/E12VvOVoiFjhSE36yN2eVCqF6
 7J2MynX8TUuJEuL00ltbNyvBaoUYLws0Xd8sgSsLiCGVPbjo6LlF2GWtVBgDyxHLz3b0=;
Received: from mail-ua1-f74.google.com ([209.85.222.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uj6as-0004hR-Ss for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 01:35:59 +0000
Received: by mail-ua1-f74.google.com with SMTP id
 a1e0cc1a2514c-88bcd8cf999so2813088241.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Aug 2025 18:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754357748; x=1754962548;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=EGnjhlkr58/FOajbxu7sCyHuJOVEyicbJJHbor5PpZw=;
 b=lOrPveUaXwLAj/sEbFw8JYkSqALfpMe6V5rHa6vK2SDbMKgEUr5Vp0cvBV68b2JpHA
 Q5Tef+1Cd2CWZOLZE0eDUQDdHyHthsRWbY1BV+0yhi724u9U666chzslqDq1y9zDqvOV
 Y092bUEazpSj1LmOoIBbSIgCifWBQ3JGCMUbJpe9K2yoUyJVcMwdC6MOPCeLSH+9j+Ko
 CKWv4yrly10MbB/HwOxukf9SToHCtUeZPr9W8c9fbqFsJfNMyytMwcPoNsMI6ji3TmWw
 s4ygfzKsL+VnkD2tQpa9bj6DWVkA2E7pDNGCEghSLtBDD3Nu3HHik/NMP6+SvI5zXYrx
 pv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754357748; x=1754962548;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EGnjhlkr58/FOajbxu7sCyHuJOVEyicbJJHbor5PpZw=;
 b=hGgYFlH3A+77r5kU2151SaY5mxU6y+V3W0VkVduMe+SeBb9KTTLL6VmYHac+7TEYTq
 TyklPY0unNM9D6s1K/uX+fEEoVpchrVtg0rdHr4PWAhQqDMsMjMazAIh5LbYr4HenXFS
 0WdeMQB69Z5R4uyE6MsOCDSceo8ObfQSf6pY5x7TfCXBVo+pEVI3Q6+P0Hm41mCGNGE+
 KkF9b9nY2RXKOEDCXYBo84nbngqUmlmP2TyHYCIwS38Lt7BOa2714p5X6PbUe2y+VENV
 kzoynMnHFEDAC+LrEyhVzWUV4bOR64+QBYDcX4FC8MUCK5s/NlMiBq2gDcGlb2ojo/CW
 oeeg==
X-Gm-Message-State: AOJu0Yz8PQJ0jNbZ1uL0Ty5n5Ys/6pk9gPuDqSKIfZ06e8L8BkfJgGh4
 vVA0p3Q88DOE1PjFyP9H34UCRnF2tWXLDgYDKyMaHQa8dLa+0wusCT8xQ0MybdPdtvACFAMjU/P
 E6+0vocg3Pg==
X-Google-Smtp-Source: AGHT+IHqorv7ISi2bpW1ywQ+0QWFp7Iixj0oB+s092j6YhuI66/ybNz3R6cLh8nZkBsRPXr/TTdU4tUtW7s3
X-Received: from pjbeu3.prod.google.com ([2002:a17:90a:f943:b0:321:162c:e4fd])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b83:b0:31e:4492:af48
 with SMTP id 98e67ed59e1d1-321162d3205mr14330735a91.28.1754348771682; Mon, 04
 Aug 2025 16:06:11 -0700 (PDT)
Date: Mon,  4 Aug 2025 16:05:58 -0700
In-Reply-To: <20250804230558.746338-1-chullee@google.com>
Mime-Version: 1.0
References: <20250804230558.746338-1-chullee@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250804230558.746338-2-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.74 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uj6as-0004hR-Ss
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: add sysfs entry for effective
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
