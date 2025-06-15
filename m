Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B564ADA23E
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Jun 2025 17:11:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaNLsQaCPsaVCBQUWfZIlh7A4gvvSdZFOSVPQ9YBbb4=; b=ge4GRmemvWbMkhdGWtqrTvCCqp
	y/Nw6MOTpxgHih3lUHC1mSt+6WtnqQbGVMJjtOE5f5C5Bb9U6dst1sCazxvZetC2zroKf+5N4HJG3
	CA+1n8mOsQrKIaY4YfDkurLX8r9UBYypW/cOZ5M3wfsErQkBue77CHs7QCH9yKiNy89c=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uQp1R-0005is-0q;
	Sun, 15 Jun 2025 15:11:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <35ttOaAcKACMBGTKKDDFNNFKD.BNL@flex--chullee.bounces.google.com>)
 id 1uQp1P-0005ic-B9 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Jun 2025 15:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BYrmpF/Q6roI8L6nTRyQRvZjOfZjRGnDoVWGywhO7no=; b=Tp20NcPBHJkonRkIHs8RKSNUUk
 Jpnvhk2N3ZRo6fzHcP1X9EbRfifICB/+tO8A9Epp/qX6T9uJ6YURZ3BrJS8kwVSN99msx7XxJUpKp
 DSad+6Ia0Zgvh6aFdRB81DtptHwE1YrQzawjQ5u2W2Pnn+/6+a4ngiFKyFK0JrAQEPpY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BYrmpF/Q6roI8L6nTRyQRvZjOfZjRGnDoVWGywhO7no=; b=bCaWctxkujAh69AoiwpVXh/tAK
 Flp7S3/Ip4l5fD8pI6RgooBiDUGrEQ6Mc8eJB1rt7gN+rUNYKqualDx9V+jgNbKKnX0OMMwSvje46
 AgwYAzVY91YzeFCVDAzGTmhETg2UGRrjpbs+JzYB7T0Ufiq8TZFIttopsHdsKy9zp9Mc=;
Received: from mail-oa1-f73.google.com ([209.85.160.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uQp1O-0004s4-Qg for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Jun 2025 15:11:47 +0000
Received: by mail-oa1-f73.google.com with SMTP id
 586e51a60fabf-2d4e42a2b2bso3130341fac.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 15 Jun 2025 08:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750000301; x=1750605101;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=BYrmpF/Q6roI8L6nTRyQRvZjOfZjRGnDoVWGywhO7no=;
 b=WFv8qFiiQm8A25rm4PRCJ7dKUsNFeEW7zl7s9yCLA8SMvPhxY3kW9DdyqlnEKjXCSS
 YE0z2BOonIzMHN0CHmW0n2pzDfSE1v2/vT2EthiD/MGdZnFUjKP+6bZjUKBcUg8GxBh5
 veaI6usGKDzA3r6JRO1A5xCmGTXJRf8hxnGVrB3DF74A3ZmsikHucTfGtEUB2iiUFquo
 N8n668hjYp0se3VhkAo6BSLEydg+R1ihdT0MNtK1Bpbihvv8H7m0qFNxgOhjwmGAXqID
 77y7mGwA1fM0iCh43/QRjAmr4u9tfF0bJ4fIzLPDsRfZenGf0x91wrVgcYJjV+BcH96q
 MNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750000301; x=1750605101;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BYrmpF/Q6roI8L6nTRyQRvZjOfZjRGnDoVWGywhO7no=;
 b=KvLbyMnPhIcYodZmwew4wEJOOFNrEXmcL5Gd1dIqqFpWAO1HR85UzWJbqUtMxmUP+Q
 mEcGkEQ/kbfTFHreiKJVHyCxbzepWWd6i7j2Vh0gcFX75WhH9+Aymt6UZpECpgnZF+oa
 ppKjIQSXH4glM+V/dp5IiFLMweOwu9B/EhbUL0ViVe0HeINXMBrMC7D51hXU699RTRb3
 3YvRbt+/bg44RHrzmxeQJuLuZrzBI0+MIfB+Ba9KSJXPY+2ckEajBDnca3EeDW7nBWnb
 1av3DE3iSuAXIzw3vtZjO2S/JXMinGmCj1bva1nM56Sn1DTOBmxTqn//TELatDfjPAgg
 ZngQ==
X-Gm-Message-State: AOJu0YxF2k6YkcxVGMPgIOdceavDeo36qfZGG5TE+9cjyN6gdBAcBkgl
 GYCNLPkNHjOn3PuYT3JQODLRtreIynvjK6V3/Fb0bCVeTSMvD8zFxN/i6/i+GrvCBL1l9qAVh8m
 ToMqZxXms5w==
X-Google-Smtp-Source: AGHT+IFt++TjvatBBJIzcufhdDysgmNuitmX6MQe3gnXirWSE2I2TvPCnUxSEDsAPYWrjK1ujziE4tc4e6Uw
X-Received: from pfkq14.prod.google.com ([2002:a05:6a00:84e:b0:747:a8ac:ca05])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9006:b0:21f:545e:84f0
 with SMTP id adf61e73a8af0-21fbd5e0e49mr9384276637.40.1749998566653; Sun, 15
 Jun 2025 07:42:46 -0700 (PDT)
Date: Sun, 15 Jun 2025 07:42:35 -0700
In-Reply-To: <20250615144235.1836469-1-chullee@google.com>
Mime-Version: 1.0
References: <20250615144235.1836469-1-chullee@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250615144235.1836469-3-chullee@google.com>
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
 | 19 +++++++++++++++++++ fs/f2fs/file.c | 3 +++ fs/f2fs/namei.c | 11
 +++++++---- 3 files changed, 29 insertions(+), 4 deletions(-) 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.73 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uQp1O-0004s4-Qg
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: use ioprio hint for hot and pinned
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
 fs/f2fs/f2fs.h  | 19 +++++++++++++++++++
 fs/f2fs/file.c  |  3 +++
 fs/f2fs/namei.c | 11 +++++++----
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3e02687c1b58..0c4f52892ff7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3440,6 +3440,25 @@ static inline void set_file(struct inode *inode, int type)
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
+}
+
+static inline void clear_ioprio(struct inode *inode)
+{
+	if (get_ioprio(inode) == 0)
+		return;
+	F2FS_I(inode)->ioprio_hint = 0;
+}
+
 static inline void clear_file(struct inode *inode, int type)
 {
 	if (!is_file(inode, type))
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3eb40d7bf602..a18fb7f3d019 100644
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
