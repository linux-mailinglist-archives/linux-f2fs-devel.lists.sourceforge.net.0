Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5843AAD09D0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Jun 2025 23:59:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S1l73f4r1O9jQ54uAfxF8hXjQNF3RXOXh+bpLxcz/24=; b=ATwZguUpZOmu+6ebnSjPNpP+bB
	V8jgZLFY6iN2T6UHO7JiERlFuZOhfLegZag9FhulpYiIUyBo+Hj2PTcnV/e0tqgT0QW8D7d/YSwI1
	N9lSjUcECgV/1MFWd3SUPvRYbDKrm7P+wzsNJxISj0G14eKtf1Ipdg4TVizuExNFOF3U=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uNf6I-00052G-CO;
	Fri, 06 Jun 2025 21:59:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1uNf6G-000522-OB
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jun 2025 21:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3zZWlbsZsWBDzSGqtGht4OhBTNgnXf0xW+1Vj0/hhfI=; b=e1cIhRRc/K2xl+Nhkdd30VAkp6
 3MO4xJaWLsGBR6D/O5vm1b0dvKPQadIrTKH1/lv+ZO1usdS0ewET9JmPkFLc7T3fpxIMNti1JEKbR
 hBbHveyh3r9MsoIlwObxMio+fONQkbE52U01FZUSDSx5Il5S7OrM3h7OivA3JVeEI5GU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3zZWlbsZsWBDzSGqtGht4OhBTNgnXf0xW+1Vj0/hhfI=; b=C
 ACDxFEnEYDM9joVJ3wmoWRvJHsGl+k4zHdH8il/ogmkov/7bo9NQpZMjdJoUj0jNk5n92Sct1ZnQ/
 IIrYedOR0hrp33/ufjUyonPLkcyvjHXnV4DWDsW4Iu19Lu7L8X5Q1EwbCTllW4tPji9KX0I3Mf30k
 VEpATOzjHN5+9g7c=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uNf6G-00035o-Au for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jun 2025 21:59:44 +0000
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-235e1d710d8so32311765ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Jun 2025 14:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749247179; x=1749851979; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3zZWlbsZsWBDzSGqtGht4OhBTNgnXf0xW+1Vj0/hhfI=;
 b=BxLHD20f0nmiP73/loJdVfr0EDjXmrqBQjgwMCUjOMr304FBya52/XQ3KECmJDIIm5
 CmbTuzwvxPfHshjFG6TNdjuFozI1Ggcl7bwDM6ms0xGUIy8VHEIJdDWUj5L+kfn7BWJ4
 qd4jd+n0rpfiAkuM0cuWyTn4AbO//BSB73EKmyhpDSbe6x4HXL8zSvPiB8sWqo68vDwU
 tYQqfAOOZTcvOJANZ82JK4GHYQT+rl7msmDbr8vrITzNXiSxcdYpin7yp5Q8WHLiUFEi
 fW3WjWu00CJh87/twP08NF2/Or618Rf2RCcrhB1d6RqLJHLSU1z8DIk28Ok80lNm/jYl
 LJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749247179; x=1749851979;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3zZWlbsZsWBDzSGqtGht4OhBTNgnXf0xW+1Vj0/hhfI=;
 b=cpyzYk76rDR+S73+eeYEHpJ48QCM60HCqNxGYpAT2k8KND7aHgxrOiHFPXTrLUrq2Y
 JmrTnQkDWPL4W4tUPxLmBukmLkiGbdGA0FGq8ZHh0oNxqPu7pbsQmuCYaX7SkC7R2Jil
 lYKWyIwtslACd2QmE6XQQF6BEg5ng3ZNDdrjKZTc6YMFFibhRxiSCAqrzJOiExs7+gN9
 Fk/OsNPHeXIrkcDcOI2PIho7yJbrRJzcMVSRQ4O8jhwKW/6MA22yH4OjnsAAJ/j8vAhm
 WNFDUcc1RX4degDmh3SA0x9aFmk/UP8eSRCZ0EtPcASCpYJoW65x/IDTS50N0T90sZOy
 jhtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6xQX/GWxmx8FE6sNZih7qYkFfQ21HsBPRa0+Idz56BFYDqr3xOs+NvAfoUeLwPUWN0yL+vwTtW1+hSoP9Yg8O@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx76jTdgFbSEQ0jRekNE4gM1kfCMnAjx6aJIR7lEsXfwuB3Uw42
 qm2Lfpp9YQ7a9o1XOJS8ZEJFyzsQQ7P7juVs+Av7EkaO5eVZ+I3k+7SO
X-Gm-Gg: ASbGnct/3j+9QifS8gF9FBi1HvvdyfRGolle9tGA4skdLunVgmJZhUGa4ABLy92hTKd
 qfenJ5Lzf+8Mq8yVRfXlttqrAngTENR1VG248H59ek75v0PZiCb+eF/G28scxHEnJulfe9X0zj0
 nHV7RJQbq3glwqLXoUdjxelXWjKlxdpamTUjRkO4CWP7UZbdPEWPkKIKE+Unriivlw2mNBeH4uW
 k/GN1jKThiiWC1C371CCcKzgUEGfIEoc3vG4Qv7G2lC0YXVJVtQmH0/A8egCexhlNfcoK6zdU0Z
 GAFfVGfACbhmfxMksGWA3l/FvSFEIaHDo1byqF+Yp5KwknewFiC7m6eavJ2TreJLeI9ebuN1jUH
 zs53ISt2Uud5WaSulCx92k8P2+mYvxA1n+eR9VHnOWhldc0om0F5L
X-Google-Smtp-Source: AGHT+IGRsYTvhTtG9mBhuM8Z3ZXSmPKu2CNyDifUVuE0zlVIJSCgJ202lfmjd43VebliOXdmMiIbnA==
X-Received: by 2002:a17:902:e80e:b0:235:c9ef:c9e1 with SMTP id
 d9443c01a7336-23601cf0b28mr76283335ad.5.1749247178611; 
 Fri, 06 Jun 2025 14:59:38 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:d02c:e22:e5a4:2f84])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236035068f3sm16963425ad.236.2025.06.06.14.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 14:59:38 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  6 Jun 2025 14:59:32 -0700
Message-ID: <20250606215932.1226604-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Add this to control GC algorithm for boost
 GC. Signed-off-by: Daeho Jeong --- Documentation/ABI/testing/sysfs-fs-f2fs
 | 6 ++++++ fs/f2fs/gc.c | 3 ++- fs/f2fs/gc.h | 1 + fs/f2fs/sysfs.c | 7 +++++++
 4 files changed, 16 insertions(+), 1 deletion(-) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
X-Headers-End: 1uNf6G-00035o-Au
Subject: [f2fs-dev] [PATCH] f2fs: add gc_boost_gc_greedy sysfs node
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

Add this to control GC algorithm for boost GC.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
 fs/f2fs/gc.c                            | 3 ++-
 fs/f2fs/gc.h                            | 1 +
 fs/f2fs/sysfs.c                         | 7 +++++++
 4 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 931c1f63aa2e..b978d183f5b1 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -869,3 +869,9 @@ Description:	Set a multiplier for the background GC migration window when F2FS G
 		boosted.
 		Default: 5
 
+What:		/sys/fs/f2fs/<disk>/gc_boost_gc_greedy
+Date:		June 2025
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
+		Default: 1
+
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index de7e59bc0906..31afee3af1a0 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -141,7 +141,7 @@ static int gc_thread_func(void *data)
 					FOREGROUND : BACKGROUND);
 
 		sync_mode = (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC) ||
-				gc_control.one_time;
+			(gc_control.one_time && gc_th->boost_gc_greedy);
 
 		/* foreground GC was been triggered via f2fs_balance_fs() */
 		if (foreground)
@@ -198,6 +198,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
 	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
 	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
+	gc_th->boost_gc_greedy = 1;
 
 	if (f2fs_sb_has_blkzoned(sbi)) {
 		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index efa1968810a0..1a2e7a84b59f 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -69,6 +69,7 @@ struct f2fs_gc_kthread {
 	unsigned int boost_zoned_gc_percent;
 	unsigned int valid_thresh_ratio;
 	unsigned int boost_gc_multiple;
+	unsigned int boost_gc_greedy;
 };
 
 struct gc_inode_list {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index b0270b1c939c..5de7cd5c4fd8 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -824,6 +824,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_boost_gc_greedy")) {
+		if (t > 1)
+			return -EINVAL;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -1051,6 +1056,7 @@ GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
 GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
 GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
 GC_THREAD_RW_ATTR(gc_boost_gc_multiple, boost_gc_multiple);
+GC_THREAD_RW_ATTR(gc_boost_gc_greedy, boost_gc_greedy);
 
 /* SM_INFO ATTR */
 SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
@@ -1222,6 +1228,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_boost_zoned_gc_percent),
 	ATTR_LIST(gc_valid_thresh_ratio),
 	ATTR_LIST(gc_boost_gc_multiple),
+	ATTR_LIST(gc_boost_gc_greedy),
 	ATTR_LIST(gc_idle),
 	ATTR_LIST(gc_urgent),
 	ATTR_LIST(reclaim_segments),
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
