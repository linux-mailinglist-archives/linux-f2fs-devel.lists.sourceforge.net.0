Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4CE85D178
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 08:34:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rch72-0003Xy-41;
	Wed, 21 Feb 2024 07:33:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1rch6z-0003Xe-Ie
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 07:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qU2iF33SDnjbxbTA1bjsBvV0qZKEE2L9dMkO6OS+Cdg=; b=mi82PaysFZME4v7XYv+7kxoYR6
 IgxtA+aiI40kop9fpeAhmUUNUnvR4CDpHjP84eltcu/dJbDd1X9FeC3vJHkTfz4tH0VyY04ieQebP
 VqVWjaL4B5aK7O9Uk+pVwpEW7PGEJgy9CdQeYwsPpxYMpYRvwziXlHf1Qw7GMWGk8hzs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qU2iF33SDnjbxbTA1bjsBvV0qZKEE2L9dMkO6OS+Cdg=; b=a
 V8HPxVCzaq05pKlaCgymPnoghsvqQQLQpibIgOc5jzu+uM9xaXtOSFnQpAug0hqb7brO7Ult36cWz
 ZNuB7YxosTN/6lZ2lScYtWgwgsWamaFw5qhLtvHxnf/OfE066fYGSxLBTPECToXTEGZtGJkhhYG/A
 lLR7VRc2ZYk6s64I=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rch6t-0002cK-Ow for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 07:33:48 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-295c8b795e2so3690064a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Feb 2024 23:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708500814; x=1709105614; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qU2iF33SDnjbxbTA1bjsBvV0qZKEE2L9dMkO6OS+Cdg=;
 b=JWmPy3iMrt/0t7qFxAXWGrVqEUfajy7DB8zz4wdV4FPNgNEbC7smpzZz2ylTDu+5OM
 ONvg8WaU+B50u3XcsuJnFeoDWtjlZ46I5pql6np52qYcFSBctTI6tLRIcm/lZVfsGk8o
 l3x0aZKjLnDAicNHrptzGbJndwpqPIwFpg3BE99wdOLs5mEGV8TGEOnbmCfLRwpV1dT/
 fyCpAC3QqKmUDlBuKp8EidJkBj6mBwg2PvSV5TrM6Nc2oZaK4NpeCGYnieUCZtKcVC4V
 bP+3MsBFzQM5o9aysmfbP/R7t4B0HIyGVg6Gy5PWcoJcdbsr/L1NahFifwvfn30MbZ6T
 g+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708500814; x=1709105614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qU2iF33SDnjbxbTA1bjsBvV0qZKEE2L9dMkO6OS+Cdg=;
 b=PM0k6neTB3Mxy+ssV4Qg4g/R+K6rZ+24FBMlDCpNhNYOaPHXb3bgkHI0i8ikGH1eZ3
 StRLFmH84OWiRJxmjgFTI7kVWBlcCNeLhix2eipcs383udWJiHiquq1hTelfcNoG4HL0
 bif99uJ9KZsjlAgAU98hpcWi+TTpdzgPDllLyqvpSqLeXbDJZ6I7BvmaF3B9XZvNUtPE
 TBJ5v+9EyR67ZZg7lLpeNfmHazwFQ2vEioXsG9RqLbd/hE+zOwSWVZU4dN9+d/Cek8/a
 f2zfj4N2kqgdcC+zHKyJDKK+WX2pUJJFHZbPY4X5jxA02OvVQBO8FVHl/W9XqRwYh4hw
 MdCA==
X-Gm-Message-State: AOJu0YyGXMoesG/CO/udZvJXtflWZUv3zXl5J2LlnT5BwvFwYHzXZP+J
 eiJcRn1mnWiDlE8XjhFAOLg3NMxq1FGZF3UX4DvKvUU7O+QC9Aea
X-Google-Smtp-Source: AGHT+IF29KSLDWX3+z0Vc2R2dUX9ihmYYnDX1o5SvRgDxdShnQR6eB/QSWn1DjxjHx8KCGu2HV22og==
X-Received: by 2002:a17:90a:7788:b0:297:f09:fe08 with SMTP id
 v8-20020a17090a778800b002970f09fe08mr15845793pjk.0.1708500814365; 
 Tue, 20 Feb 2024 23:33:34 -0800 (PST)
Received: from mi.mioffice.cn ([43.224.245.229])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a17090ad80100b002993c27f76asm8867459pjv.50.2024.02.20.23.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 23:33:34 -0800 (PST)
From: liujinbao1 <jinbaoliu365@gmail.com>
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Wed, 21 Feb 2024 15:32:49 +0800
Message-Id: <20240221073249.1710026-1-jinbaoliu365@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: liujinbao1 When we add "atgc" to the fstab table, ATGC
 is not immediately enabled. There is a 7-day time threshold, and we can use
 "atgc_enabled" to show whether ATGC is enabled. Signed-off-by: liujinbao1
 --- Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++ fs/f2fs/sysfs.c |
 8 ++++++++ 2 files changed, 14 insertions(+) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [jinbaoliu365[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jinbaoliu365[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rch6t-0002cK-Ow
Subject: [f2fs-dev] [PATCH] f2fs: sysfs: support atgc_enabled
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
Cc: liujinbao1 <liujinbao1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: liujinbao1 <liujinbao1@xiaomi.com>

When we add "atgc" to the fstab table, ATGC is not immediately enabled.
There is a 7-day time threshold, and we can use "atgc_enabled" to
show whether ATGC is enabled.

Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
 fs/f2fs/sysfs.c                         | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 36c3cb547901..8597dfaef700 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -564,6 +564,12 @@ Description:	When ATGC is on, it controls age threshold to bypass GCing young
 		candidates whose age is not beyond the threshold, by default it was
 		initialized as 604800 seconds (equals to 7 days).
 
+What:		/sys/fs/f2fs/<disk>/atgc_enabled
+Date:		Feb 2024
+Contact:	"Jinbao Liu" <liujinbao1@xiaomi.com>
+Description:	It represents whether ATGC is on or off. The value is 1 which
+               indicates that ATGC is on, and 0 indicates that it is off.
+
 What:		/sys/fs/f2fs/<disk>/gc_reclaimed_segments
 Date:		July 2021
 Contact:	"Daeho Jeong" <daehojeong@google.com>
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 417fae96890f..0915872abd97 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -143,6 +143,12 @@ static ssize_t pending_discard_show(struct f2fs_attr *a,
 				&SM_I(sbi)->dcc_info->discard_cmd_cnt));
 }
 
+static ssize_t atgc_enabled_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", sbi->am.atgc_enabled ? 1 : 0);
+}
+
 static ssize_t gc_mode_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -1017,6 +1023,7 @@ F2FS_GENERAL_RO_ATTR(encoding);
 F2FS_GENERAL_RO_ATTR(mounted_time_sec);
 F2FS_GENERAL_RO_ATTR(main_blkaddr);
 F2FS_GENERAL_RO_ATTR(pending_discard);
+F2FS_GENERAL_RO_ATTR(atgc_enabled);
 F2FS_GENERAL_RO_ATTR(gc_mode);
 #ifdef CONFIG_F2FS_STAT_FS
 F2FS_GENERAL_RO_ATTR(moved_blocks_background);
@@ -1144,6 +1151,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(atgc_candidate_count),
 	ATTR_LIST(atgc_age_weight),
 	ATTR_LIST(atgc_age_threshold),
+	ATTR_LIST(atgc_enabled),
 	ATTR_LIST(seq_file_ra_mul),
 	ATTR_LIST(gc_segment_mode),
 	ATTR_LIST(gc_reclaimed_segments),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
