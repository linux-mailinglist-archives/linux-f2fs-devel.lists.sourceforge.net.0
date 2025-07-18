Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DC8B0ABEA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 19 Jul 2025 00:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tG0ga6XQjnnDGjUaO2wpPz2XwrgDZ/rNANbV+wdA+eQ=; b=GHERZzC+SlpfuQzV7khWY8nBZy
	9ebnY6fI/FhQ/LPwGKv6Ii4vKE3bbJq4EShH6VaEjCOInR8IXF8ixKse8DjSqsFwpi6fDBGxuR+nz
	3/QvF9WHHhCUzlrxfXEutWq+fXWxCMR9dKRICR8AbmdAb9LarLc6EkHPYKudRmZKE668=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uctCD-0004ER-Kl;
	Fri, 18 Jul 2025 22:04:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1uctCC-0004EL-Ng
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Jul 2025 22:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cotPtNUE4rLZJyYjdxBKbaVvjccEgnkQtK9k7m4RQqQ=; b=DWwPgpIQt6VilExBbMA4eVMmyA
 SICpH8wB3I58YSIj4I0yagyP3bCMP5wmcpa7pvcH0/k26W59xl580NSMDpQhXSkqNot5bHafrz0Iv
 jYUiu6NoorU8ULFZKz5HXFXEE/PFQwLlDQBX0bXfzPaEdnRIfRBZIm5t5IfMx6ynt08c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cotPtNUE4rLZJyYjdxBKbaVvjccEgnkQtK9k7m4RQqQ=; b=H
 aY8gbAKq9jy4yPBx5JWd7ym0hV/+KH9DYaQPlDfK3CsL/hdOR1KPSgc1bGO4Zgs/cAyFaz8VDeNXd
 zU7sLw5xb30BP7iVulNy4nDSANXZrLHATtD5kbW++v+xrLiZvQPead/s2MCooavS1OftnPHAMI4mW
 6C4hT5uepvs/lyxo=;
Received: from mail-pg1-f176.google.com ([209.85.215.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uctCC-0007D6-Cz for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Jul 2025 22:04:48 +0000
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b31d578e774so2570346a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Jul 2025 15:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752876278; x=1753481078; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cotPtNUE4rLZJyYjdxBKbaVvjccEgnkQtK9k7m4RQqQ=;
 b=AVoqbRNEtDc0BP7hAzreOINcbHJKnaAW2DVpPBrXOP8BjACsHo23LRfcwbpnxcH+rE
 21uElgMJ9SaOAG2w7f0Q/xbK+jjWrFvDbQ1xFea1yv+CAjmfOrYUQmvTpwRlFmolFQLp
 1fDKp2nR7KY7gJv7HDODf8RMRyaeoLxXw46xyLTFl4ldewzLNhDtYGFbUpvcBjnsSsSs
 oez+cLXRvFZ9ZCnexWQbHqBa/IIAqHVB/FgDYVXx+x/PgLHLY57xhvfDE1N3rA8ooubu
 1BSCFbpf1VHwKOC2U5wm/kwHg/N/2Y1l2c3x4QVdY+iPTb5Sv20Rv8ztt9siRvCnHPT7
 7okA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752876278; x=1753481078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cotPtNUE4rLZJyYjdxBKbaVvjccEgnkQtK9k7m4RQqQ=;
 b=Awohk49VX/RyKZJXV9vME98c0/vOgrIb6TmBLsKklRLAPwXla8i5LB0fnCEoh4sWBb
 97n0ReSxSTJEclWJvjkXnRINa5gbHJN31YYSiF2yNbqlP+vrUraWKrEA/ZhvPAVsyO8j
 qR19fdW83qF/Xt+DJejY8kBKtzdbwyeE8yuDrtz31ZGU6F3RFyoELzYwPPP2jJoNfiOz
 vfpxAYn7UicRI6nNuZAAdZ74Lg2YEFldmk9/gbpvplUxtLGgob7pUmFawdb5xB/86CFk
 /f0aRqlpi7kdXZRPRF1+O8SMuimBtHfOBu9gBdsAPyDyZ19LCK5zWnFN335CfuwKt9cL
 HSEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlILboDijlJgcuOhFOetsvxglwl4BfMNYe7F/ZYPSA1Zed+AYEGniR0CzjkNMzUBtyByAswKsBMF00DrfOS8AQ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxwJ0hgvhLB3+x0g8zpMYUpQq/QmOKPCZ3yEn+BcVPIP+vcOvP3
 r5KjplAX4nOOoEcw6bur+7fI0HEafZ2xNKM6CmwmX8MXbwPlYjzPB+KF
X-Gm-Gg: ASbGncsqsamrg1U7zUWIYnENk6ZK/36psQDThZBXMh8OCoWMmAzVzhITvMQkA07OFo4
 NLDJvP/cHM2/YZkhganbiy84bt5zODfR8C/4EnY4cZ0F5KHikcw60+oOUBc4Yi5wBaZdSpbpzgC
 GoiRsOCmp/K/+o0KJUpdqDIvz3RNkDBdGPkLXyB0lf0Ad6VrREVYXnPis0v5ggWWsKl8Loh2VDJ
 ZDgn9EoOvCTSXhPkNYQ+X1QjNVgQlfvdT2ZPi5by6tDLKVlZzUr4QKvQ88idpG6DqL26p/WFtvm
 7ZSTszD1FIt2pCfGi40mhpD50L1FIL9vastlcp7fFjy+R1YQsNLQmHZxKeBhIku9+wpiAyAhgAN
 w9ns3muGncQ9s6EyFd+G0xzztE7ZhxG2BCmjquagC0cfbl0y8sweCSukhAA0pOK/VvVgLWKvP/b
 ORnxIa40csbrm8WA==
X-Google-Smtp-Source: AGHT+IGQbuSHZnDK57D7JQm+lc791tZ8jnltH/uC9vUd5j5mSXBQn7TT7sy0xz1SYBKQti0d5gN9Lg==
X-Received: by 2002:a17:90a:e187:b0:311:482a:f956 with SMTP id
 98e67ed59e1d1-31cc03d9906mr7010038a91.5.1752876277557; 
 Fri, 18 Jul 2025 15:04:37 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:902e:59ec:cd2a:fc00])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3f46ffdsm1847494a91.40.2025.07.18.15.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 15:04:37 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 18 Jul 2025 15:04:31 -0700
Message-ID: <20250718220431.2290301-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Otherwise F2FS will not do GC in background
 in low free section. Signed-off-by: Daeho Jeong --- fs/f2fs/gc.c | 18
 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.176 listed in wl.mailspike.net]
X-Headers-End: 1uctCC-0007D6-Cz
Subject: [f2fs-dev] [PATCH] f2fs: ignore valid ratio when free section count
 is low
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

Otherwise F2FS will not do GC in background in low free section.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/gc.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 0d7703e7f9e0..08eead027648 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -391,14 +391,15 @@ static unsigned int get_cb_cost(struct f2fs_sb_info *sbi, unsigned int segno)
 }
 
 static inline unsigned int get_gc_cost(struct f2fs_sb_info *sbi,
-			unsigned int segno, struct victim_sel_policy *p)
+			unsigned int segno, struct victim_sel_policy *p,
+			unsigned int valid_thresh_ratio)
 {
 	if (p->alloc_mode == SSR)
 		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
 
-	if (p->one_time_gc && (get_valid_blocks(sbi, segno, true) >=
-		CAP_BLKS_PER_SEC(sbi) * sbi->gc_thread->valid_thresh_ratio /
-		100))
+	if (p->one_time_gc && (valid_thresh_ratio < 100) &&
+			(get_valid_blocks(sbi, segno, true) >=
+			CAP_BLKS_PER_SEC(sbi) * valid_thresh_ratio / 100))
 		return UINT_MAX;
 
 	/* alloc_mode == LFS */
@@ -779,6 +780,7 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	unsigned int secno, last_victim;
 	unsigned int last_segment;
 	unsigned int nsearched;
+	unsigned int valid_thresh_ratio = 100;
 	bool is_atgc;
 	int ret = 0;
 
@@ -788,7 +790,11 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	p.alloc_mode = alloc_mode;
 	p.age = age;
 	p.age_threshold = sbi->am.age_threshold;
-	p.one_time_gc = one_time;
+	if (one_time) {
+		p.one_time_gc = one_time;
+		if (has_enough_free_secs(sbi, 0, NR_PERSISTENT_LOG))
+			valid_thresh_ratio = sbi->gc_thread->valid_thresh_ratio;
+	}
 
 retry:
 	select_policy(sbi, gc_type, type, &p);
@@ -914,7 +920,7 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 			goto next;
 		}
 
-		cost = get_gc_cost(sbi, segno, &p);
+		cost = get_gc_cost(sbi, segno, &p, valid_thresh_ratio);
 
 		if (p.min_cost > cost) {
 			p.min_segno = segno;
-- 
2.50.0.727.gbf7dc18ff4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
