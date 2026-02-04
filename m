Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJTWMJEEhGmHwwMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Feb 2026 03:46:41 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 019B2EE16C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Feb 2026 03:46:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PEy21bMzFLcumPDLwhRuWe3zU2ruvFRQQ2sRLaGOMbw=; b=OtRdE934p2B5HVDJiAwcNKPO3V
	VzG565/M4w4h7G4BzpV1vvlWZivro+0Dir21mRp5cMWmK65aRDaEzZR78/AAyjnaqU1NvrM7Q2jH5
	Suk4pTGRx6A38Vah5FF90791N+czXj0mRu2JwhIWmRQrryC/wmuxjrtxrUgG4F+6Kngk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vnpNx-0006iU-SI;
	Thu, 05 Feb 2026 02:46:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vnpNv-0006iM-Pr
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Feb 2026 02:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8WYMMv6vrhuUv9KYacpgJBV9VblWOWIhMnVrzm20F8E=; b=beZ/R2J50y41OSi2F22Tbo8flh
 KnWFnh8If+bdqqbT0z/6JSVuohS8WquOee1fT5y6HInG8viRMLJefU6wH6IN/PKNSyHLWj6+H8Atn
 9mbMg3FaoacwclackAi+oCNW40MVhGienDFpTyWOzFmEgwujFECNzTYsAwTc2+x//+XU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8WYMMv6vrhuUv9KYacpgJBV9VblWOWIhMnVrzm20F8E=; b=F
 AS+boH7K+Rq3rbaPXa7HtvoRPLkW1Ken0ORUXn2uoU6u4/TPYuK20A4/ifCNK0VYjJE8OfLA8+0nF
 5LGZUJy0r1GExMdm/SP6oEURU1UxkNpDunva/tkhdtgNpq1r1JYzVJqOF1Cs4rCPQ7REkhwLMp+WN
 FyGqvgcJU43XByaE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vnpNv-0000vj-2A for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Feb 2026 02:46:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AE80D43212
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  5 Feb 2026 02:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673CBC4CEF7;
 Thu,  5 Feb 2026 02:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770259577;
 bh=qajNYh1cYAOxjGPeTY7J0Zy6nCZS9ZMhYi30+EVTHI4=;
 h=From:To:Cc:Subject:Date:From;
 b=CBWxg/uS54atrWl6dyPIaTvBFg5rdO08YR+Bgr30d+yKmkEThQAozwRnEDgENtNKf
 qSyDD93BDIThvv7z/xrDSD88HU3JEf2KWVfp2Jt5vCzmVyCEY+2Hg7KU0oBDl0u3uC
 PnJ9t92pzAbFllmrO3Ymj779FD/O67hlqylFB8xdJU29zZaQjbZkkb5qHh2I4IT8Hx
 XYLKByyeGpwWbRjlw2+GiUSayV3gcmAW0lDTQknqDL4oEqLMxirTCBh7tVi+ZZHom0
 9eYx42MpT4wgddKcTE7cJb+Vxm3qvGNA42xwCwcWjxdUvIUsWVm1foWrmgC7i09jJ2
 B30VIRJM5gCpg==
To: jaegeuk@kernel.org
Date: Wed,  4 Feb 2026 11:05:01 +0800
Message-Id: <20260204030501.85441-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduces
 /sys/fs/f2fs/<disk>/critical_task_priority, 
 w/ this new sysfs interface, we can tune priority of f2fs_ckpt thread and
 f2fs_gc thread. Signed-off-by: Chao Yu <chao@kernel.org> ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 8 ++++++++ fs/f2fs/checkpoint.c | 2 ++ fs/f2fs/f2fs.h | 4 ++++ fs/f2fs/gc.c
 | 2 ++ fs/f2fs/super.c | 1 + fs/f2fs/ [...] 
 Content analysis details:   (0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.8 DATE_IN_PAST_12_24     Date: is 12 to 24 hours before Received: date
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vnpNv-0000vj-2A
Subject: [f2fs-dev] [PATCH] f2fs: sysfs: introduce critical_task_priority
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 019B2EE16C
X-Rspamd-Action: no action

This patch introduces /sys/fs/f2fs/<disk>/critical_task_priority, w/
this new sysfs interface, we can tune priority of f2fs_ckpt thread and
f2fs_gc thread.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  8 ++++++++
 fs/f2fs/checkpoint.c                    |  2 ++
 fs/f2fs/f2fs.h                          |  4 ++++
 fs/f2fs/gc.c                            |  2 ++
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         | 17 +++++++++++++++++
 6 files changed, 34 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index ea6474db8a31..c1d2b3fd9c65 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -987,3 +987,11 @@ Contact:	"Chao Yu" <chao@kernel.org>
 Description:	f2fs can tune priority of thread which has entered into critical region covered by
 		f2fs rwsemphore lock. This sysfs entry can be used to control priority value, the
 		range is [100,139], by default the value is 120.
+
+What:		/sys/fs/f2fs/<disk>/critical_task_priority
+Date:		February 2026
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	It can be used to tune priority of f2fs critical task, e.g. f2fs_ckpt, f2fs_gc
+		threads, limitation as below:
+		- it requires user has CAP_SYS_NICE capability.
+		- the range is [100, 139], by default the value is 100.
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 4afa5d9a19fc..6dd39b7de11a 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -2158,6 +2158,8 @@ int f2fs_start_ckpt_thread(struct f2fs_sb_info *sbi)
 	}
 
 	set_task_ioprio(cprc->f2fs_issue_ckpt, cprc->ckpt_thread_ioprio);
+	set_user_nice(cprc->f2fs_issue_ckpt,
+			PRIO_TO_NICE(sbi->critical_task_priority));
 
 	return 0;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a6e7368fc40a..aa0bca9f851d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1593,6 +1593,7 @@ enum node_type {
 #define MAX_LOCK_ELAPSED_TIME		500
 
 #define F2FS_DEFAULT_TASK_PRIORITY		(DEFAULT_PRIO)
+#define F2FS_CRITICAL_TASK_PRIORITY		NICE_TO_PRIO(0)
 
 static inline int f2fs_test_bit(unsigned int nr, char *addr);
 static inline void f2fs_set_bit(unsigned int nr, char *addr);
@@ -2010,6 +2011,9 @@ struct f2fs_sb_info {
 	/* adjust priority for task which is in critical region covered by lock */
 	unsigned int lock_duration_priority;
 
+	/* priority for critical task, e.g. f2fs_ckpt, f2fs_gc threads */
+	long critical_task_priority;
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 60378614bc54..f46b2673d31f 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -234,6 +234,8 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 		return err;
 	}
 
+	set_user_nice(gc_th->f2fs_gc_task,
+			PRIO_TO_NICE(sbi->critical_task_priority));
 	return 0;
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d5cf7265e5d3..1a755997aff5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4340,6 +4340,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->max_lock_elapsed_time = MAX_LOCK_ELAPSED_TIME;
 	sbi->adjust_lock_priority = 0;
 	sbi->lock_duration_priority = F2FS_DEFAULT_TASK_PRIORITY;
+	sbi->critical_task_priority = F2FS_CRITICAL_TASK_PRIORITY;
 
 	sbi->sum_blocksize = f2fs_sb_has_packed_ssa(sbi) ?
 		4096 : sbi->blocksize;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 3a272e7edf23..5fbfdc96e502 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -969,6 +969,21 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "critical_task_priority")) {
+		if (t < NICE_TO_PRIO(MIN_NICE) || t > NICE_TO_PRIO(MAX_NICE))
+			return -EINVAL;
+		if (!capable(CAP_SYS_NICE))
+			return -EPERM;
+		sbi->critical_task_priority = t;
+		if (sbi->cprc_info.f2fs_issue_ckpt)
+			set_user_nice(sbi->cprc_info.f2fs_issue_ckpt,
+					PRIO_TO_NICE(sbi->critical_task_priority));
+		if (sbi->gc_thread && sbi->gc_thread->f2fs_gc_task)
+			set_user_nice(sbi->gc_thread->f2fs_gc_task,
+					PRIO_TO_NICE(sbi->critical_task_priority));
+		return count;
+	}
+
 	__sbi_store_value(a, sbi, ptr + a->offset, t);
 
 	return count;
@@ -1288,6 +1303,7 @@ F2FS_SBI_GENERAL_RW_ATTR(bggc_io_aware);
 F2FS_SBI_GENERAL_RW_ATTR(max_lock_elapsed_time);
 F2FS_SBI_GENERAL_RW_ATTR(lock_duration_priority);
 F2FS_SBI_GENERAL_RW_ATTR(adjust_lock_priority);
+F2FS_SBI_GENERAL_RW_ATTR(critical_task_priority);
 
 /* STAT_INFO ATTR */
 #ifdef CONFIG_F2FS_STAT_FS
@@ -1496,6 +1512,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(max_lock_elapsed_time),
 	ATTR_LIST(lock_duration_priority),
 	ATTR_LIST(adjust_lock_priority),
+	ATTR_LIST(critical_task_priority),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
