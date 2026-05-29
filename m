Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMZ7JuFUGWrTvQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:57:05 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 372C05FF99E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1sbL1jZA74l2fowwsJZPSsXP8GetY9D8LamkE41UZk=; b=jmzsrXeLYRkSjGboFrfbjVaFNP
	w9pPYGahpqBsXnGAGf0YQkdoK0bnEFDb9UOr2qYNnvxOVHulKZrABP2RnGuGMQ41iJrcbC+dMPmvw
	nuxIYCgRCPUELtslEqgrXK40M83YDHYMJdUZ0J1JZEOJnA+i0biEYvKpcDJNqMZ8nRLw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSt1a-0007C2-1w;
	Fri, 29 May 2026 08:57:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1wSt1X-0007Bg-LQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+vouSw7lkm/+znpjg8MUcvBLpPbI83gQzMoP/1vq0tg=; b=TNl+25+B1KgmG2OZEPPTij/LEM
 ril8qQDa5kMue3xGkJqL8zCNe/EzyFwujivoYglsa/iJB9Z8LtGdRLpZdw6zNMb7ej/WkmAy8G6CM
 gIGTrx8WhfU3yL/hMMxyv7F4yLA9JG9me7FztqiZO8Sbfufd/Puzdt2DPHd/l66GnILY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+vouSw7lkm/+znpjg8MUcvBLpPbI83gQzMoP/1vq0tg=; b=YLuhpNQPm8TC/cmIEEMda60epR
 RrWafeWznBLyuVlJBflV7UUsvb7mnyF/84ZZQCcvtwhGSmzppt+yDzRtK7sn2rtmbYSqTV20byFRN
 yFl4pIGh1SwHzZByG34gX68jIFupCXrYHx5v120CsfB/1U0uE/GHzD0af/xiA69NxrA0=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wSt1W-00013c-DO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:57:00 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-36bd175fdbaso137662a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 May 2026 01:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780045013; x=1780649813; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+vouSw7lkm/+znpjg8MUcvBLpPbI83gQzMoP/1vq0tg=;
 b=Fc1AxBOPY8oTi1rTQJWgg6roXgcMmZbPDnRXqBpJAQrifKv/Uhfd1WTEuPcrJqv3FM
 HV6lOSvm2CHa7E76NV7VJOqlYFThZaPibLc58boSdQCTdbIzLZHQ9wti37UiFs7olm3m
 tY+UQLMBAlLBMeAugFCJZzWnILkG6mDLxFX5IU8L8+/wIE6qoZvhfs9j6Niw9uBhB347
 0Jv0cFCYGA4G57oaK8l+jMRDcuLlGK292kQPd8FlJB83XpVfunPBuP2geP4qp1cNm3BX
 O8l9MkWwRxr76NBKC71/rqWuYh20CxE1i1nxctptrlpsO03FU2c3CHyqKB3SCkhGjzuL
 Krgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780045013; x=1780649813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+vouSw7lkm/+znpjg8MUcvBLpPbI83gQzMoP/1vq0tg=;
 b=SWxf6TwcSUg2yCyu7eLRIyKi4sx39wOgGC5kU48EIk7+cRnTsckekw+uYnGboPTLb+
 d3uYfXT2Y/OC45FPyfunTbbYxsX1AL68aZiKRAkQEOOpU/fFwNVt+owoeto+YMf14+lf
 Z4mpWWogYypDZN3YE3rahuWVhYKpFlMr+RSUjeMvYfJWOwHcFdcEGw7Zau7phVctW3Bp
 P/w4TKM67qANc6lG6vGpjsc3Urt4ZB/xLdBVtPWv01M0jlNIuH7IqYWzNt3Z8Kvk+qjo
 5Tj5fhoaYzkW3+25GP4haqC6Lai2ryq7vzx45ypMdFaqSml041B+dDRxJ/V3alzzNr4a
 632g==
X-Gm-Message-State: AOJu0Ywhh5mfYhyGBnPSfymvj6/NyFTuXT6ASVSAnVWxTd1873O/wKW9
 A07Tqu8f8PQfQPd8YY/2ZWhgFj01JjhdG/nXtuBe51XqWXRLG8nABcAL
X-Gm-Gg: Acq92OGp1cDjJVlo0HM5SMLqpUd/fpdQQZH5pl5Flc34tOLzZo13Xl0cqEHjfvVIkZt
 FMjy7ntSPDhIqkiQ68idY7nASk5Aq81rY6tlindykngBn+xtm6GQ4Ve1vPu5rKAvDWO1mkrdePL
 VqoYRAJ83JvtJdGyVJb0U3rA2O0vXtliTrFjBVoRrHbUOzvXbjDQQyO+7aezFrdqGKe/75dMt18
 XvVsA16a0Vdae/m6760e8iMh6DylAKquyFcV4aTBM8lys2doWK8NqHK6SYCyf8yzGp3lQLOzShE
 ZiL907Z7Dt0pMyZZ2uLjiydgV7ryaXtaoJokhdmEi+UwK5X6r61JhGxuY4EDpKK8WIsH9WG0ctg
 9dvLluQauyz5Vltm05AyHKsL+LXBZIzhLOwXA4tn0LdaWLtbMv8EyXL1BrsSaB1La+DBm0WM8/O
 lZqhUwkRBNVH+VUcfvKMvjZOyUYNO9svn4UbR97/+2hd6iE7yOlUYtc+QMZPgqdhatAM4dY/s+o
 55l2aDX
X-Received: by 2002:a17:90b:3c88:b0:35e:27ec:de0 with SMTP id
 98e67ed59e1d1-36bbcd91afamr2266329a91.13.1780045013093; 
 Fri, 29 May 2026 01:56:53 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bc1d9f2bbsm874027a91.2.2026.05.29.01.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:56:52 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 29 May 2026 16:56:28 +0800
Message-ID: <20260529085629.2664539-5-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529085629.2664539-1-yangyongpeng.storage@gmail.com>
References: <20260529085629.2664539-1-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Add sysfs attributes to manage the inline
 extent feature at runtime: - inline_extent_extension_list: read/write
 interface
 to manage file extension list that determines which files should use inline
 extent format. Writing an extension name adds it to the list; writing " [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wSt1W-00013c-DO
Subject: [f2fs-dev] [RFC PATCH v2 4/5] f2fs: add sysfs interface for inline
 extent management
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 372C05FF99E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Add sysfs attributes to manage the inline extent feature at runtime:

- inline_extent_extension_list: read/write interface to manage file
  extension list that determines which files should use inline extent
  format. Writing an extension name adds it to the list; writing
  "!extension" removes it.

- inline_extent_enable: toggle to dynamically enable or disable the
  inline extent feature without remounting.

Also add inline extent code coverage statistics output under
/sys/kernel/debug/f2fs/ when CONFIG_F2FS_INLINE_EXTENT_DEBUG is
enabled, showing counters for various extent operations (merges,
splits, inserts, evictions, etc.).

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/debug.c   |  4 ++++
 fs/f2fs/iextent.c | 39 +++++++++++++++++++++++++++++++++++
 fs/f2fs/iextent.h |  3 +++
 fs/f2fs/sysfs.c   | 52 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 98 insertions(+)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index af88db8fdb71..b77246b6dbfc 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -19,6 +19,7 @@
 #include "node.h"
 #include "segment.h"
 #include "gc.h"
+#include "iextent.h"
 
 static LIST_HEAD(f2fs_stat_list);
 static DEFINE_SPINLOCK(f2fs_stat_lock);
@@ -762,6 +763,9 @@ static int stat_show(struct seq_file *s, void *v)
 				si->ext_mem[EX_BLOCK_AGE] >> 10);
 		seq_printf(s, "  - paged : %llu KB\n",
 				si->page_mem >> 10);
+#ifdef CONFIG_F2FS_INLINE_EXTENT_DEBUG
+		f2fs_iext_show_stat(sbi, s);
+#endif
 	}
 	spin_unlock(&f2fs_stat_lock);
 	return 0;
diff --git a/fs/f2fs/iextent.c b/fs/f2fs/iextent.c
index d919448ef740..63a3433aa9bc 100644
--- a/fs/f2fs/iextent.c
+++ b/fs/f2fs/iextent.c
@@ -821,3 +821,42 @@ int f2fs_iext_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
 	spin_unlock_irqrestore(&iext_info->iext_ext_lock, flag);
 	return ret;
 }
+
+#ifdef CONFIG_F2FS_INLINE_EXTENT_DEBUG
+void f2fs_iext_show_stat(struct f2fs_sb_info *sbi, struct seq_file *s)
+{
+	struct f2fs_iext_info *iext_info = sbi->iext_info;
+
+	seq_printf(s, "Inline extent code coverage statistics:\n"
+		"  - left_merge_count: %llu\n"
+		"  - right_merge_count: %llu\n"
+		"  - fast_right_merge_count: %llu\n"
+		"  - lr_merge_count: %llu\n"
+		"  - split_left_count: %llu\n"
+		"  - split_right_count: %llu\n"
+		"  - split_mid_count: %llu\n"
+		"  - insert_new_ext_count: %llu\n"
+		"  - overwrite_ext_count: %llu\n"
+		"  - add_ext_count: %llu\n"
+		"  - del_ext_count: %llu\n"
+		"  - evict_last_ext_cnt: %llu\n"
+		"  - truncate_last_ext_cnt: %llu\n"
+		"  - drop_insert_new_ext_cnt: %llu\n"
+		"  - trigger_ext_format_convert: %llu\n",
+		atomic64_read(&iext_info->left_merge_count),
+		atomic64_read(&iext_info->right_merge_count),
+		atomic64_read(&iext_info->fast_right_merge_count),
+		atomic64_read(&iext_info->lr_merge_count),
+		atomic64_read(&iext_info->split_left_count),
+		atomic64_read(&iext_info->split_right_count),
+		atomic64_read(&iext_info->split_mid_count),
+		atomic64_read(&iext_info->insert_new_ext_count),
+		atomic64_read(&iext_info->overwrite_ext_count),
+		atomic64_read(&iext_info->add_ext_count),
+		atomic64_read(&iext_info->del_ext_count),
+		atomic64_read(&iext_info->evict_last_ext_cnt),
+		atomic64_read(&iext_info->truncate_last_ext_cnt),
+		atomic64_read(&iext_info->drop_insert_new_ext_cnt),
+		atomic64_read(&iext_info->trigger_ext_format_convert));
+}
+#endif
diff --git a/fs/f2fs/iextent.h b/fs/f2fs/iextent.h
index e5fb028612ad..785eed312bf1 100644
--- a/fs/f2fs/iextent.h
+++ b/fs/f2fs/iextent.h
@@ -181,4 +181,7 @@ int f2fs_iext_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
 					bool set);
 int f2fs_iext_info_init(struct f2fs_sb_info *sbi);
 void f2fs_iext_info_destroy(struct f2fs_sb_info *sbi);
+#ifdef CONFIG_F2FS_INLINE_EXTENT_DEBUG
+void f2fs_iext_show_stat(struct f2fs_sb_info *sbi, struct seq_file *s);
+#endif
 #endif
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 665687244c93..c3a35e033df3 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -18,6 +18,7 @@
 #include "segment.h"
 #include "gc.h"
 #include "iostat.h"
+#include "iextent.h"
 #include <trace/events/f2fs.h>
 
 static struct proc_dir_entry *f2fs_proc_root;
@@ -40,6 +41,9 @@ enum {
 	RESERVED_BLOCKS,	/* struct f2fs_sb_info */
 	CPRC_INFO,	/* struct ckpt_req_control */
 	ATGC_INFO,	/* struct atgc_management */
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	INLINE_EXTENT,		/* struct f2fs_iext_info */
+#endif
 };
 
 static const char *gc_mode_names[MAX_GC_MODE] = {
@@ -98,6 +102,10 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
 		return (unsigned char *)&sbi->cprc_info;
 	else if (struct_type == ATGC_INFO)
 		return (unsigned char *)&sbi->am;
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	else if (struct_type == INLINE_EXTENT)
+		return (unsigned char *)sbi->iext_info;
+#endif
 	return NULL;
 }
 
@@ -405,6 +413,22 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 		return len;
 	}
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	if (!strcmp(a->attr.name, "inline_extent_extension_list")) {
+		struct f2fs_iext_info *iext_info = sbi->iext_info;
+		__u8 (*extlist)[F2FS_EXTENSION_LEN] = iext_info->extensions;
+		int len = 0, i;
+		unsigned long flag;
+
+		spin_lock_irqsave(&iext_info->iext_ext_lock, flag);
+		for (i = 0; i < iext_info->iext_ext_cnt; i++)
+			len += sysfs_emit_at(buf, len, "%s\n", extlist[i]);
+		spin_unlock_irqrestore(&iext_info->iext_ext_lock, flag);
+
+		return len;
+	}
+#endif
+
 	if (!strcmp(a->attr.name, "ckpt_thread_ioprio")) {
 		struct ckpt_req_control *cprc = &sbi->cprc_info;
 		int class = IOPRIO_PRIO_CLASS(cprc->ckpt_thread_ioprio);
@@ -535,6 +559,25 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return ret ? ret : count;
 	}
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	if (!strcmp(a->attr.name, "inline_extent_extension_list")) {
+		const char *name = strim((char *)buf);
+		bool set = true;
+
+		if (*name == '!') {
+			name++;
+			set = false;
+		}
+
+		if (!strlen(name) || strlen(name) >= F2FS_EXTENSION_LEN)
+			return -EINVAL;
+
+		ret = f2fs_iext_update_extension_list(sbi, name, set);
+
+		return ret ? ret : count;
+	}
+#endif
+
 	if (!strcmp(a->attr.name, "ckpt_thread_ioprio")) {
 		const char *name = strim((char *)buf);
 		struct ckpt_req_control *cprc = &sbi->cprc_info;
@@ -1257,6 +1300,11 @@ NM_INFO_GENERAL_RW_ATTR(dirty_nats_ratio);
 
 /* F2FS_SBI ATTR */
 F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+F2FS_RW_ATTR(INLINE_EXTENT, f2fs_iext_info, inline_extent_extension_list,
+			extensions);
+F2FS_RW_ATTR(INLINE_EXTENT, f2fs_iext_info, inline_extent_enable, iext_enable);
+#endif
 F2FS_SBI_RW_ATTR(gc_idle, gc_mode);
 F2FS_SBI_RW_ATTR(gc_urgent, gc_mode);
 F2FS_SBI_RW_ATTR(cp_interval, interval_time[CP_TIME]);
@@ -1457,6 +1505,10 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(max_io_bytes),
 	ATTR_LIST(gc_pin_file_thresh),
 	ATTR_LIST(extension_list),
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	ATTR_LIST(inline_extent_extension_list),
+	ATTR_LIST(inline_extent_enable),
+#endif
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	ATTR_LIST(inject_rate),
 	ATTR_LIST(inject_type),
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
