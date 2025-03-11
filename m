Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C52A5CDED
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 19:30:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ts4Mc-0003CG-5T;
	Tue, 11 Mar 2025 18:30:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1ts4Ma-0003C9-ER
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 18:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WRTQ4j61hoHCf9EekEGmcFt4dM7Z3jMdsNpn83Wx2KQ=; b=bGLUxo28tuFWdZ5DXM1Rf0MOfi
 Yl0AX3Jq+lgaMUU2j66xl5WNZKhynGFHPIuMNeCuMbsBmspe9Qo5oxK7tkppX/wPTV/7Ilse7ygeQ
 v+H5GkcVh7NsqUrDuqmtWpqmu1G6nPm5pTi4doHKG4DyAptwnmmDmbbLFljV2wVlS4hc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WRTQ4j61hoHCf9EekEGmcFt4dM7Z3jMdsNpn83Wx2KQ=; b=C
 CxtKGbFjGH3ZQ2caJXED0moKXbt6PPIzr1Y3XmsWMQaBSwrqNbkZFgrQTBy+YRn+aUXQHs0qOAix+
 vVZXJ4rxMSxr1UDYQYFaMSuOiGxs40cp2kZLT7Yrh2SwJnzG8erQbutYNy+3fPKA0Og9vZ5WuYso0
 vix0l3nz9xGJSIlY=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ts4MP-0005H5-MA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 18:30:00 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-223fd89d036so115220875ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Mar 2025 11:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741717779; x=1742322579; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WRTQ4j61hoHCf9EekEGmcFt4dM7Z3jMdsNpn83Wx2KQ=;
 b=H2PLcE/ULR25YUJfuQoD7MC7uqazfqb+wwTMjmA+8FnJ/3sBvd0DTA6LI0ADiAoDCK
 4SKcQmmK7l7TPhbB0DREs2hWdxjksUc2lgl4VaoxOQhf8H3XyyYES8fSSqTQul7rC6e+
 5y7K3kLid2M7DjefzRgLPONxVkLffA/53qbUPrcqQ3ki06ReFzbpe2oIb7DMK9ISCjjA
 zK91mR/VkJpeub2dSjKJflg0rvsaaCO1T1iQkZcx6z0iLLZ1Td+leWW1+L082Ooks33M
 8/V0oKIWdZ3urnuYsBVf21mKnHDa6UdfpXwHynn8Sv0H3L6oLZeCCvSo+vpDB8GmMNnJ
 Ccsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741717779; x=1742322579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WRTQ4j61hoHCf9EekEGmcFt4dM7Z3jMdsNpn83Wx2KQ=;
 b=JofOh6OJ5tFGmG9fDOh309dzsBHbUV797EUNDPNpNTIsD5QMuiJ9qlkd3qcO9fXQ3D
 XtZxXZ9HgOOJ6uiQK1UZOkIinXDmy70u03xZyoleHpL8NnS3uUw616rw51oQgcXZxotb
 qkB2AOzUJU7B3mt8Yd9R7DPF+7o8NKBL7FDmJihu4R86z2EPk5X4TlJoelB5ONJCWsJY
 nJdxJTt43mhBLuUqYjuLO2dxVDcBva89cKZpgRirZaa/3yZ96le9erqAeXrdnlhXgvTM
 PHC5Hc49o92amZfJ+oDg4g1d67X7Ci99OkGQljknR0MqjG2eudREFcMrM0Fmu7Bw+1pM
 0AJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqr93MR67T7Z2T7LQXq0l5OjItRZp5pQ6sVFxB5sWMXUFGa1sGHPbdvb6NAgwxf78/Kjb9SSDGfPOnNWuWZ79t@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzXNBa3oZFNGZfhpSrfzUNpl1yAY9vdLNNR+8hxDcLywXwbkBWm
 XuWDGOzxBJTldwJm2SDX9k0P5cGKJFpaS1v59e2mT4Z1ODkB/B8b
X-Gm-Gg: ASbGncs2XC8PaIDIcQuP2xg6NPCIqypCXU/6drCrrzuR8dxZ13AxYWOPpHM5RN5XrMo
 o9xrH00K0S1W1v2/VD17kSVA+VTVQMkmMcgCLHjrymI1HT14K5Mt9DMFBE1EKPPFGu893e57ke1
 JLXIEH+uSTx9MxRbJtNuGI5e9WYBCCC5asJLJmX4h/kAYgIOoQo/hbn2adYtCtWgbfc0/Q/utDJ
 HWnXLRB1W/MwNZ1e5wkdVeuhDSHIEreEt7rmj5oTn1RnBkX7giAbBrOsFzLLuWSMxcLV4B0ZP5z
 5+uJS9yvf34yAzsfh4P6hPBjzSGjcReyqFZU1hTBPAYw3WfmRn+Ds6DyzSPnRj1GUT/k4tdZ1aq
 hhdu2uUBHxAGDnoWc9ni2xNCQQj7fpDbjg5rr
X-Google-Smtp-Source: AGHT+IFQGJTTdvG6pVR1MHG6bR1ijM1daouvVEyrnHZC4BKr1lZ7plVYB99CvzkloxCXHvl3HNoOxw==
X-Received: by 2002:a05:6a00:1703:b0:736:a682:deb8 with SMTP id
 d2e1a72fcca58-736aa9e54edmr31970782b3a.8.1741717778978; 
 Tue, 11 Mar 2025 11:29:38 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:76e1:9160:984c:6886])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736c05cb6e3sm6949933b3a.45.2025.03.11.11.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 11:29:38 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 11 Mar 2025 11:29:31 -0700
Message-ID: <20250311182931.1043290-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong For several zoned storage devices, vendors
 will provide extra space which was used for device level GC than specs and
 F2FS can use this space for filesystem level GC. To do that, we can reserve
 the sp [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.182 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.182 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ts4MP-0005H5-MA
Subject: [f2fs-dev] [PATCH] f2fs: add carve_out sysfs node
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

For several zoned storage devices, vendors will provide extra space
which was used for device level GC than specs and F2FS can use this
space for filesystem level GC. To do that, we can reserve the space
using reserved_blocks. However, it is not enough, since this extra
space should not be shown to users. So, with this new sysfs node,
we can hide the space by substracting reserved_blocks from total
bytes.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 10 ++++++++++
 fs/f2fs/f2fs.h                          |  3 +++
 fs/f2fs/super.c                         |  3 ++-
 fs/f2fs/sysfs.c                         |  2 ++
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 3e1630c70d8a..6e327fdc6ef4 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -828,3 +828,13 @@ Date:		November 2024
 Contact:	"Chao Yu" <chao@kernel.org>
 Description:	It controls max read extent count for per-inode, the value of threshold
 		is 10240 by default.
+
+What:		/sys/fs/f2fs/<disk>/carve_out
+Date:		March 2025
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	For several zoned storage devices, vendors will provide extra space which
+		was used for device level GC than specs and F2FS can use this space for
+		filesystem level GC. To do that, we can reserve the space using
+		reserved_blocks. However, it is not enough, since this extra space should
+		not be shown to users. So, with this new sysfs node, we can hide the space
+		by substracting reserved_blocks from total bytes.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1afa7be16e7d..5718996c42a8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1800,6 +1800,9 @@ struct f2fs_sb_info {
 	u64 committed_atomic_block;
 	u64 revoked_atomic_block;
 
+	/* carve out reserved_blocks from total blocks */
+	bool carve_out;
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 19b67828ae32..42651ec824f9 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1836,7 +1836,8 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
 	buf->f_blocks = total_count - start_count;
 
 	spin_lock(&sbi->stat_lock);
-
+	if (sbi->carve_out)
+		buf->f_blocks -= sbi->current_reserved_blocks;
 	user_block_count = sbi->user_block_count;
 	total_valid_node_count = valid_node_count(sbi);
 	avail_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index d15c68b28952..a50f5cfe9fa9 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1065,6 +1065,7 @@ F2FS_SBI_GENERAL_RW_ATTR(max_read_extent_count);
 F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
 F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
+F2FS_SBI_GENERAL_RW_ATTR(carve_out);
 
 /* STAT_INFO ATTR */
 #ifdef CONFIG_F2FS_STAT_FS
@@ -1252,6 +1253,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(warm_data_age_threshold),
 	ATTR_LIST(last_age_weight),
 	ATTR_LIST(max_read_extent_count),
+	ATTR_LIST(carve_out),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.49.0.rc0.332.g42c0ae87b1-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
