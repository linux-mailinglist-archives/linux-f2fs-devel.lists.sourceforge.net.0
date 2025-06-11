Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68235AD6519
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jun 2025 03:24:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rJm94nbqOf7T0DZiz21Cj4qxiP2eTQnJ64K+iGrS8k=; b=mJGE4Jz/R5RIYWhoJFe/gaGEhe
	IGSHPi0zOWkmMhSIGlg3TWrVFurEVjkuKDr/BSHWe9XFgTyzYvj3ayiy8kHWlUpMrYGp+a3JPbD0R
	5oaWOJeCCqJ5uZKAM+lShO2MoX8lF0wGm5igENDyla3B/2BbSV8hmrhVga4NePTmFwBQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPWfs-0007dE-8Q;
	Thu, 12 Jun 2025 01:24:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3lRNKaAcKAC4MReVVOOQYYQVO.MYW@flex--chullee.bounces.google.com>)
 id 1uPWfr-0007d8-AZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 01:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mKx7Yg2jyt4RiAGTCJpC9bEvueSIsR5D/X+k7Jjceso=; b=QhlwGOnf8t+16JS3aEetpHdyWh
 zCd+UjfMLOWDDW7j8ZhpTH1G5006EQfrV4bmXbG9CzQ1GA18Bwz1W1wghhVd1d2vBQzs2wc7YELVK
 /Z8j5gAypCzpsVlSK+3E5nEkVn69Gp9inkckrQF0b9UwZ/m+h36sD6XuZd65ZksZ3uSE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mKx7Yg2jyt4RiAGTCJpC9bEvueSIsR5D/X+k7Jjceso=; b=CGyliHtwagCgB+DegXVd+Bswyu
 sHemAFp4BeFyJENh/XOio53TxgdTV9TaKG8XY/H/rwnhT4i6iP+2/t2TU81zyDdtx40nXP4JKmkwf
 TzPPeFRzuOHUkzwMh+piuIyLtrOEKlxZGzaE5O6Yjnt3MGzRk+Oz1DSSLQBKPI/nYkr0=;
Received: from mail-oi1-f201.google.com ([209.85.167.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uPWfq-0000NC-UT for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 01:24:11 +0000
Received: by mail-oi1-f201.google.com with SMTP id
 5614622812f47-408df250dfbso309330b6e.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Jun 2025 18:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749691445; x=1750296245;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=mKx7Yg2jyt4RiAGTCJpC9bEvueSIsR5D/X+k7Jjceso=;
 b=WxlO+CUbm1TZhOBKSRmAzUh7e5NTNbkvKtuCleEBMRwL/a3dIgytKpFyGX7+7c05Mi
 aYMg8vZ0Ie9G5x7CdvLWoP3O3VncD9wjCkSQsUP3ScxPURCVn1zhHoOaz7+WE+rW6cXH
 wTy+Bltr9KuVeLZDAgMCoGUehr4T7it8kWg5jroDovtCilgMuv9nQAlL7IJcOJSW0n2g
 NSp5LFcKGCqf3mKqNSrsN8dHIJY/WfNYgSx11YbpXzWFSpTkj2qEQmQgHmP30ws04RXC
 3KgsHEO/j82kRrH7DFMYCKBsOlaaQpiT3UgVx0tzOR9++5PaHXDXNCSboY6GQRoxlicb
 gogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749691445; x=1750296245;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mKx7Yg2jyt4RiAGTCJpC9bEvueSIsR5D/X+k7Jjceso=;
 b=hgPCcXdzPxt9aSMNnHlsH254ekkHdv8wf2a9VTy7fMfl7h6ruIotWzXxBDb/j295rt
 6Q7gsSqIl01J71X5ZjA4rtsLxhOn0aZLoKxDMm9Ac+PrJiUvMDpw4mvNjHHlQRb1JxHY
 HjP4/NQgcn1MuioYUWsB523BbiZmfEOIBqGsBbp8SuSU7NLqxDn5LYWf9tlYDB5Yr7uo
 +NZDqsQlKsTK9nWOV3A2HrrWORQfao4Ds9zPODBh8DXSdBs7JgaMy3yV8m9QjB8/eX4O
 o3x+S20vQS4QUxKs8VfXp/WNuxBNWgPGwy1KHeWAo7y63DPa1WoRG+ffDzYej7BT07V6
 ocng==
X-Gm-Message-State: AOJu0YwYaGRUYNWsQPtkb4d05OU7IBLVTrVPJgaMeWb9mUYLQwZaWWMB
 DtprmC56W8a0cDFQwOBrCoiK477KmCBMMhiV3TK7T2BCzlX4oOmS3A1/0Pcb/TvjCbNCNCQDvlN
 svWkejcca8A==
X-Google-Smtp-Source: AGHT+IExOy2ZqSqSTK/clN9/wYzarZU68QG4F25PAWsHxKFVOwclfiyTYH7HAxonpwyrzvA47ScUnqZ0Yswr
X-Received: from pga1.prod.google.com ([2002:a05:6a02:4f81:b0:b2f:a31c:f7bc])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7283:b0:216:1ea0:a526
 with SMTP id adf61e73a8af0-21f9bc097f1mr981622637.40.1749685141492; Wed, 11
 Jun 2025 16:39:01 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:37:06 -0700
In-Reply-To: <20250611233706.572784-1-chullee@google.com>
Mime-Version: 1.0
References: <20250611233706.572784-1-chullee@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611233706.572784-3-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Apply the `ioprio_hint` to set `F2FS_IOPRIO_WRITE` priority
 on files identified as "hot" at creation and on files that are pinned via
 ioctl. Signed-off-by: Daniel Lee <chullee@google.com> --- fs/f2fs/f2fs.h
 | 21 +++++++++++++++++++++ fs/f2fs/file.c | 3 +++ fs/f2fs/namei.c | 11
 +++++++---- 3 files changed, 31 insertions(+), 4 deletions(-) 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.201 listed in wl.mailspike.net]
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uPWfq-0000NC-UT
Subject: [f2fs-dev] [PATCH 2/2] f2fs: use ioprio hint for hot and pinned
 files
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

Apply the `ioprio_hint` to set `F2FS_IOPRIO_WRITE` priority
on files identified as "hot" at creation and on files that are
pinned via ioctl.

Signed-off-by: Daniel Lee <chullee@google.com>
---
 fs/f2fs/f2fs.h  | 21 +++++++++++++++++++++
 fs/f2fs/file.c  |  3 +++
 fs/f2fs/namei.c | 11 +++++++----
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 162d79a3c1a5..0b05b3b6386b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3441,6 +3441,27 @@ static inline void set_file(struct inode *inode, int type)
 	f2fs_mark_inode_dirty_sync(inode, true);
 }
 
+static inline int get_ioprio(struct inode *inode)
+{
+	return F2FS_I(inode)->ioprio_hint;
+}
+
+static inline void set_ioprio(struct inode *inode, int level)
+{
+	if (get_ioprio(inode) == level)
+		return;
+	F2FS_I(inode)->ioprio_hint = level;
+	f2fs_mark_inode_dirty_sync(inode, true);
+}
+
+static inline void clear_ioprio(struct inode *inode)
+{
+	if (get_ioprio(inode) == 0)
+		return;
+	F2FS_I(inode)->ioprio_hint = 0;
+	f2fs_mark_inode_dirty_sync(inode, true);
+}
+
 static inline void clear_file(struct inode *inode, int type)
 {
 	if (!is_file(inode, type))
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4fd45e94661a..95a3b4b59dd1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3496,6 +3496,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 
 	if (!pin) {
 		clear_inode_flag(inode, FI_PIN_FILE);
+		clear_ioprio(inode);
 		f2fs_i_gc_failures_write(inode, 0);
 		goto done;
 	} else if (f2fs_is_pinned_file(inode)) {
@@ -3529,6 +3530,8 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 	}
 
 	set_inode_flag(inode, FI_PIN_FILE);
+	file_set_hot(inode);
+	set_ioprio(inode, F2FS_IOPRIO_WRITE);
 	ret = F2FS_I(inode)->i_gc_failures;
 done:
 	f2fs_update_time(sbi, REQ_TIME);
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 07e333ee21b7..0f96a0b86c40 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -191,9 +191,10 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
 }
 
 /*
- * Set file's temperature for hot/cold data separation
+ * Set file's temperature (for hot/cold data separation) and
+ * I/O priority, based on filename extension
  */
-static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
+static void set_file_temp_prio(struct f2fs_sb_info *sbi, struct inode *inode,
 		const unsigned char *name)
 {
 	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
@@ -212,8 +213,10 @@ static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
 
 	if (i < cold_count)
 		file_set_cold(inode);
-	else
+	else {
 		file_set_hot(inode);
+		set_ioprio(inode, F2FS_IOPRIO_WRITE);
+	}
 }
 
 static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
@@ -317,7 +320,7 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 		set_inode_flag(inode, FI_INLINE_DATA);
 
 	if (name && !test_opt(sbi, DISABLE_EXT_IDENTIFY))
-		set_file_temperature(sbi, inode, name);
+		set_file_temp_prio(sbi, inode, name);
 
 	stat_inc_inline_xattr(inode);
 	stat_inc_inline_inode(inode);
-- 
2.50.0.rc1.591.g9c95f17f64-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
