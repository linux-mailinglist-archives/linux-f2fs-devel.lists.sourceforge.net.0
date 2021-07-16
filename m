Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C74093CBEC9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jul 2021 23:57:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4Vpj-00017o-2I; Fri, 16 Jul 2021 21:57:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daeho43@gmail.com>) id 1m4Vph-00017h-Vg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 21:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c2JBcs4jRw3dV/Sn1RjrXaIM642g/ajOXjxCElidjgU=; b=lK6X3lNbA3Wg8RVyOfNHTF2BIT
 JrW0XEqRxioe70UA0QL7M+kyocudo4jBm3EwE9vRIW3fVrrltx1xBEH+yqy6tnZDtIhej9c2dUj+G
 /JjaroQepXwTHICc+QUk/iS1sktUcMtweQsMt/hZNKD8ULu1bGq/3iKS7QUyHtN6FJek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c2JBcs4jRw3dV/Sn1RjrXaIM642g/ajOXjxCElidjgU=; b=X
 PGHU/Qa0MSDKCue/3dPkqg+aUR9xx6IOz8vUqLZorrthfgqVEv6EQY7Cfvjn5+zdgzK0P3UIYQ4oC
 kLuUTz7pzjRuTLjZL5me4G+M/kwFNcoGz5aIXRyZnUD3yxdV9nBBe/FUOC4+InqjF1pro6N5cGm0F
 8VHbpJxAwCZxU+3U=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m4Vpb-00AzlQ-4V
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 21:57:21 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 b8-20020a17090a4888b02901725eedd346so7863486pjh.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Jul 2021 14:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c2JBcs4jRw3dV/Sn1RjrXaIM642g/ajOXjxCElidjgU=;
 b=eRdtnDXOj2F2cPOip1VDWppZdfZ9LoUYtOG1Y2GIkqkT2nxLCg5t0wYNaR3S7u5BrO
 F6IYcQOwe1ewi42K5NVNRNaq3i4CwlnuuKzSpPJZiFIYsVBqOnWeJqry6VIQtIO//l6X
 T6Gyeexg0cxA67jPUfrip92rqV9qjF10SBzUVC3A2d7oIM9TEw9ei5xEpLaDBSorF1Um
 zq4HTb91FYGRKXpBVF6PzZQazPxzTzA1xMoXS+v5GpQnF5/wUUr34kHnVRdMOGpuRbBy
 zAHdJhqOFeCGP3sZ5IE2QUa0YpolpTC/VU4IiqBo1jzwDzKc+akc5ledQ1oN3DSp4e7I
 tlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c2JBcs4jRw3dV/Sn1RjrXaIM642g/ajOXjxCElidjgU=;
 b=rw+4ByBAqTvMfSq45yMhvnkrva3EN3PZMemz7kWqfy8GVm3YzMmrOHRxdRCGq/zEF7
 UAnmJAiLljBHwqgU/AbhYc98pUQnXZ3+Zuc1Dlw1nA0FJ618asryaFLvTn3IvClWIQz4
 mUUE7tnjUHJ+k7jRRPkCeUuixUYDJCLWNKVej2186Oy+q6LKh+x70YCPCA+PC1EK1sqH
 mAd/m616nTd90yJayxvZEp0YuW/Z/CwPdzOgoR18u3FQrifFurLHij6BV6WScGRLPb1I
 79OVjfBJx6eLYFqvNZSrRoAFK14FbDhu5aqRYSdo/AwszIDMH9EX7SNJsD7/6z++mh83
 pjGQ==
X-Gm-Message-State: AOAM5312F9knAvQ5W9dxczZVrZ/RlstENMuX9SNEZIamlraL5ao/XBpk
 xI+VlSvK6uHSwiYV89HHvSM=
X-Google-Smtp-Source: ABdhPJwmb/zQFnRJCht+KSGegXorPeHDclify6EE3c6zesHGgLJONmsGp0mps/JFKTkF+9EA83O2Gg==
X-Received: by 2002:a17:90a:e2c5:: with SMTP id
 fr5mr12168529pjb.34.1626472629409; 
 Fri, 16 Jul 2021 14:57:09 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:7cda:6a24:f8e4:c42f])
 by smtp.gmail.com with ESMTPSA id t10sm12095141pgv.52.2021.07.16.14.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 14:57:08 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 16 Jul 2021 14:57:03 -0700
Message-Id: <20210716215703.1560325-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.46 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m4Vpb-00AzlQ-4V
Subject: [f2fs-dev] [PATCH] f2fs-tools: add periodic check in kernel version
 check
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

In previous, we did a full scan right after kernel version is changed
and it triggered many unnecessary full scan whenever a newly built
kernel is downloaded. Plus, we are lack of a periodic health check of
on-disk filesystem images. So, I added a monthly periodic check after
a new vesion is updated.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/mount.c      | 50 +++++++++++++++++++++++++++++++++++------------
 include/f2fs_fs.h |  4 +++-
 lib/libf2fs.c     |  6 +++---
 3 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 1f2d7e0..7c4c681 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -13,6 +13,7 @@
 #include "xattr.h"
 #include <locale.h>
 #include <stdbool.h>
+#include <time.h>
 #ifdef HAVE_LINUX_POSIX_ACL_H
 #include <linux/posix_acl.h>
 #endif
@@ -424,7 +425,7 @@ printout:
 	DISP_u32(sb, meta_ino);
 	DISP_u32(sb, cp_payload);
 	DISP_u32(sb, crc);
-	DISP("%-.256s", sb, version);
+	DISP("%-.252s", sb, version);
 	printf("\n");
 }
 
@@ -939,6 +940,8 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 	return 0;
 }
 
+#define CHECK_PERIOD (3600 * 24 * 30)	// one month by default
+
 int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 {
 	char buf[F2FS_BLKSIZE];
@@ -956,31 +959,54 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 	if (!sanity_check_raw_super(sbi->raw_super, sb_addr)) {
 		/* get kernel version */
 		if (c.kd >= 0) {
-			dev_read_version(c.version, 0, VERSION_LEN);
+			dev_read_version(c.version, 0, VERSION_NAME_LEN);
 			get_kernel_version(c.version);
 		} else {
 			get_kernel_uname_version(c.version);
 		}
 
 		/* build sb version */
-		memcpy(c.sb_version, sbi->raw_super->version, VERSION_LEN);
+		memcpy(c.sb_version, sbi->raw_super->version, VERSION_NAME_LEN);
 		get_kernel_version(c.sb_version);
-		memcpy(c.init_version, sbi->raw_super->init_version, VERSION_LEN);
+		memcpy(c.init_version, sbi->raw_super->init_version,
+				VERSION_NAME_LEN);
 		get_kernel_version(c.init_version);
 
 		MSG(0, "Info: MKFS version\n  \"%s\"\n", c.init_version);
 		MSG(0, "Info: FSCK version\n  from \"%s\"\n    to \"%s\"\n",
 					c.sb_version, c.version);
-		if (!c.no_kernel_check &&
-				memcmp(c.sb_version, c.version, VERSION_LEN)) {
-			c.auto_fix = 0;
-			c.fix_on = 1;
-		}
-		if (c.fix_on) {
-			memcpy(sbi->raw_super->version,
-						c.version, VERSION_LEN);
+		if (!c.no_kernel_check) {
+			struct timespec t;
+			u32 prev_time, cur_time, time_diff;
+			__le32 *ver_ts_ptr = (__le32 *)(sbi->raw_super->version
+						+ VERSION_NAME_LEN);
+
+			t.tv_sec = t.tv_nsec = 0;
+			clock_gettime(CLOCK_REALTIME, &t);
+			cur_time = (u32)t.tv_sec;
+			prev_time = le32_to_cpu(*ver_ts_ptr);
+
+			MSG(0, "Info: version timestamp cur: %u, prev: %u\n",
+					cur_time, prev_time);
+			if (!memcmp(c.sb_version, c.version,
+						VERSION_NAME_LEN)) {
+				/* valid prev_time */
+				if (prev_time != 0 && cur_time > prev_time) {
+					time_diff = cur_time - prev_time;
+					if (time_diff < CHECK_PERIOD)
+						goto out;
+					c.auto_fix = 0;
+					c.fix_on = 1;
+				}
+			} else {
+				memcpy(sbi->raw_super->version,
+						c.version, VERSION_NAME_LEN);
+			}
+
+			*ver_ts_ptr = cpu_to_le32(cur_time);
 			update_superblock(sbi->raw_super, SB_MASK(sb_addr));
 		}
+out:
 		print_sb_state(sbi->raw_super);
 		return 0;
 	}
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 45f7257..3000d9d 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -350,7 +350,9 @@ static inline uint64_t bswap_64(uint64_t val)
 #define	DEFAULT_BLOCKS_PER_SEGMENT	512
 #define DEFAULT_SEGMENTS_PER_SECTION	1
 
-#define VERSION_LEN	256
+#define VERSION_LEN		256
+#define VERSION_TIMESTAMP_LEN	4
+#define VERSION_NAME_LEN	(VERSION_LEN - VERSION_TIMESTAMP_LEN)
 
 #define LPF "lost+found"
 
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 876c1dc..c6ab329 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -828,7 +828,7 @@ int f2fs_devs_are_umounted(void)
 void get_kernel_version(__u8 *version)
 {
 	int i;
-	for (i = 0; i < VERSION_LEN; i++) {
+	for (i = 0; i < VERSION_NAME_LEN; i++) {
 		if (version[i] == '\n')
 			break;
 	}
@@ -846,10 +846,10 @@ void get_kernel_uname_version(__u8 *version)
 
 #if defined(WITH_KERNEL_VERSION)
 	snprintf((char *)version,
-		VERSION_LEN, "%s %s", buf.release, buf.version);
+		VERSION_NAME_LEN, "%s %s", buf.release, buf.version);
 #else
 	snprintf((char *)version,
-		VERSION_LEN, "%s", buf.release);
+		VERSION_NAME_LEN, "%s", buf.release);
 #endif
 #else
 	memset(version, 0, VERSION_LEN);
-- 
2.32.0.402.g57bb445576-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
