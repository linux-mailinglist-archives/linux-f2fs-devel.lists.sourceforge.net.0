Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM/EIK0Q+2mbVQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 06 May 2026 11:58:05 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E6B4D90D3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 06 May 2026 11:58:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/plSUBJ/bJvKydZuIE8YZpZ0NfsYKVUJGEGroWfbHiM=; b=CT2ziM5gh0XWKg/zaUm/VDPmnz
	jB8DNVxuvmJS1nmGDA2OgYDh5DMzGVYTIj3D9Tcwrg91/0Cc1SxXywuVcK/HA9JU6BhpK7yAMCAo6
	k0sqQVyrHWt6qEYKJBEal7lxw0WpDb/FvUffmL2QbdFR3xd+LkDO1WPoT/Sn2t8VusN4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wKZ0v-0008Ht-2j;
	Wed, 06 May 2026 09:57:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1wKZ0u-0008Hm-D1
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 May 2026 09:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y8HnxKNTTg3bRDYDLs21CeA0Z38GZT26k0bMkg3cncQ=; b=c2uyOr4ekfLeZOXSHCxWse1ZMZ
 oF0fNoOvnXa468+pMXUXEpCUvmzUtwP2pS4Pkppem2BwpeiA38Zt9yeA06mct/KHlNWaq3k4Li+Ts
 YMkPT7JJ6xwavyuahQmlB6gQnihMu5RA1tWmvHUYaD1BELUk+UFCEmsBS6JqTXrFI1Sc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Y8HnxKNTTg3bRDYDLs21CeA0Z38GZT26k0bMkg3cncQ=; b=J
 2tDQ86G4eepY78ncGEY68Ub7YZY7VZK0C7+dTDBEKyUZLhW6lQ0lUPmNEcOKWPaKINnQJg39j2f0a
 +8zjjNaksl2JC7JX3lDvRDTN2Pbrrg+B1Un1tR0Xhxi/pRGYO3azGd0S8SfXrTLZXr06n+uWckpyi
 Pkb4GyFOlmKhLcyc=;
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wKZ0t-0006bl-TY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 May 2026 09:57:56 +0000
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-365212191f6so2875816a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 06 May 2026 02:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778061465; x=1778666265; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y8HnxKNTTg3bRDYDLs21CeA0Z38GZT26k0bMkg3cncQ=;
 b=Zpy9fZyo3g2yE9tr9mRWLYrvBRiCXs26tOiNR75A9SqJ95RJCVBzHwrdtG/Hw51HQV
 07w+vTVBPAh1wlnDhGeP5vWEOkKLWY8snTAaRPaDSaUfZ2sKx9apB+4m2UEXGpfpFdO2
 rJspfHYfKW0zqltrFvTeTygj1HLWIS/K3i33aXxJjeVpIRGmkx7uANYLYNuggYPmUWfY
 uGuwWaMwMFs/AtN5s9vHwWsqVCtdqImFAEYkg9UmUk3H0Q9j/9aJwv/hPs7PLuUGVYMt
 B5Nf+a6vFdNgVHtWvxtlKyA+Q8nmli2vH7UfphSdhCHyyMcKmoHuWXEG5aTOmZAXFB9U
 PzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778061465; x=1778666265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y8HnxKNTTg3bRDYDLs21CeA0Z38GZT26k0bMkg3cncQ=;
 b=A2UXTBZsLtdVFFw0WJz9TzddUSdr5+N65Y5A9smvaqO1TvTUEJMQ6BlZd0ZYaG0EX8
 sv0ladoSDGMSeg8c9zL9zOtGi64KrApHI7NtG6uoAmEWvNKJE/u9YseY6tfYutKuS2P7
 +eMukUatqShGRvH69r32iRBKQQQ8/Ndy+vqO9QZU3XSnwEUqMFe1+a+HHDFDSz0IRzXS
 wy7XTrTocDG4+iS1jmsY4bnz/tvKMhNgrFAGMaTw8Bh8vIgCOJGmLkIXqxae+mflPHXT
 eF9AJkYz9zO+6xFwX238ofdNUxvcvRRAXkhkf8+WjF6yfrPInJW2Dkvlkkedt8tgX2Bx
 DetQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+vp5xHq6FI6qPoet1hhtQppqdvW+nIQQSNYgOKcBA+kM77EA2iN6OZmM4HppM/XnRSzgT19jnFGmahln76DMdG@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yym2MUYOtA3ywf0Q4fmrVTu3XjS5f5nM0bjCdeWxkLmBSHvRpWc
 Aw/fxwZcrN+imKghJez+Uj1ovl14AEMUFdjJ2EBuhHyNU1tDMav+ufNeE3Fs7A==
X-Gm-Gg: AeBDieumXcIxmR8h9cTETU5bzTaRQwIChDL+Q8i2/Xzv3QeiTZ+xdKWdTV8svDP74l9
 uu3olFwUmc8v1viMIUr0NmuEl5B06DLO5Ds+J34QImxbDNX2xaFMb5UkcWZxcOzlJFpgmBKUVhe
 I/9DMsY9xKwJ7TTlu/R3p3LY/XTk6wj97N1W4X0XYJjGd9oR0DvTqn6Re/kn7u+LVGdJhHeB4kT
 N2eaGiF7krzZ21bx6o1GfQq9KI4gsBwYy78UEl52TFvAXyZMJV4cmbsXoxJLlmTJoz9qUZ7Uh6A
 8WaPprZdfAI5o+7lXDsMV2u2aRPSyGDEvoJxeGhCo9Li88Wcb8j282+iKgD7mmc1iwEuL6tHcVM
 8DInC0TGebZ82ctFODvpW0KJOQj5mg3P92M7T9lYXzY2x6hHwJTO2/4IoxULQiXuymkg3CNmp9U
 kraDEiTMnuTDQTe2Pe2EA+PMzxlFCJ+W3OsghRfWEp
X-Received: by 2002:a17:903:32ce:b0:2ba:307:4577 with SMTP id
 d9443c01a7336-2ba79285e29mr27236085ad.2.1778061465086; 
 Wed, 06 May 2026 02:57:45 -0700 (PDT)
Received: from mi.mioffice.cn ([2408:8607:1b00:8:1b22:7c63:cb98:af2e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ba7c9e1ad2sm20001415ad.52.2026.05.06.02.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 02:57:44 -0700 (PDT)
From: liujinbao1 <jinbaoliu365@gmail.com>
To: jaegeuk@kernel.org
Date: Wed,  6 May 2026 17:57:31 +0800
Message-ID: <20260506095731.1039356-1-jinbaoliu365@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: liujinbao1 Add trace_f2fs_fault_report to trigger
 reporting
 upon f2fs_bug_on, need_fsck, stop_checkpoint, and handle_eio. Since f2fs_bug_on
 and need_fsck can be triggered in hundreds of scenarios, define set_sbi [...]
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [jinbaoliu365(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [jinbaoliu365(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.41 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wKZ0t-0006bl-TY
Subject: [f2fs-dev] [PATCH v3] f2fs: Add trace_f2fs_fault_report
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
Cc: jinbaoliu365@gmail.com, shengyong1 <shengyong1@xiaomi.com>,
 liujinbao1 <liujinbao1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: D0E6B4D90D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:jinbaoliu365@gmail.com,m:shengyong1@xiaomi.com,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

From: liujinbao1 <liujinbao1@xiaomi.com>

Add trace_f2fs_fault_report to trigger reporting upon f2fs_bug_on,
need_fsck, stop_checkpoint, and handle_eio. Since f2fs_bug_on and
need_fsck can be triggered in hundreds of scenarios, define set_sbi_flag
as a macro to help capture the effective fault function and line number.

Signed-off-by: shengyong1 <shengyong1@xiaomi.com>
Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>
---
v3:
- Fix __assign_str() to use single-argument form
v2:
- Remove REPORT_FAULT_PAGE_EIO from f2fs_handle_page_eio
---
 fs/f2fs/f2fs.h              | 18 +++++++++++++++++-
 fs/f2fs/super.c             |  9 +++++++++
 include/trace/events/f2fs.h | 28 ++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 02bc6eb96a59..4fb3ad73bd2c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -98,6 +98,15 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define DEFAULT_FAILURE_RETRY_COUNT		1
 #endif
 
+enum {
+	REPORT_FAULT_NEED_FSCK,
+	REPORT_FAULT_STOP_CP,
+	REPORT_FAULT_MAX,
+};
+
+void f2fs_fault_report(struct super_block *sb, unsigned int err_code,
+			const char *func, unsigned int data);
+
 /*
  * For mount options
  */
@@ -2282,11 +2291,18 @@ static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
 	return test_bit(type, &sbi->s_flag);
 }
 
-static inline void set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
+static inline void __set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
 {
 	set_bit(type, &sbi->s_flag);
 }
 
+#define set_sbi_flag(sbi, type)				\
+do {							\
+	__set_sbi_flag(sbi, type);			\
+	if ((type) == SBI_NEED_FSCK)			\
+		f2fs_fault_report(sbi->sb, REPORT_FAULT_NEED_FSCK, __func__, __LINE__);	\
+} while (0)
+
 static inline void clear_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
 {
 	clear_bit(type, &sbi->s_flag);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 11d1e0c99ac1..251f914b3b62 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4731,9 +4731,18 @@ static void f2fs_handle_critical_error(struct f2fs_sb_info *sbi,
 	 */
 }
 
+void f2fs_fault_report(struct super_block *sb, unsigned int err_code,
+			const char *func, unsigned int data)
+{
+	trace_f2fs_fault_report(sb, err_code, func, data);
+}
+
 void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
 						unsigned char reason)
 {
+	if (reason != STOP_CP_REASON_SHUTDOWN)
+		f2fs_fault_report(sbi->sb, REPORT_FAULT_STOP_CP, __func__, reason);
+
 	f2fs_build_fault_attr(sbi, 0, 0, FAULT_ALL);
 	if (!end_io)
 		f2fs_flush_merged_writes(sbi);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 49c6cbb6f989..563d742e0646 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -2595,6 +2595,34 @@ DEFINE_EVENT(f2fs_priority_update, f2fs_priority_restore,
 	TP_ARGS(sbi, lock_name, is_write, p, orig_prio, new_prio)
 );
 
+TRACE_EVENT(f2fs_fault_report,
+
+	TP_PROTO(struct super_block *sb, unsigned int err_code,
+		const char *func, unsigned int data),
+
+	TP_ARGS(sb, err_code, func, data),
+
+	TP_STRUCT__entry(
+		__field(dev_t, dev)
+		__field(unsigned int, err_code)
+		__string(func, func)
+		__field(unsigned int, data)
+	),
+
+	TP_fast_assign(
+		__entry->dev		= sb->s_dev;
+		__entry->err_code	= err_code;
+		__assign_str(func);
+		__entry->data		= data;
+	),
+
+	TP_printk("dev = (%d,%d), err_code = %u, func = %s, data = %u",
+		show_dev(__entry->dev),
+		__entry->err_code,
+		__get_str(func),
+		__entry->data)
+);
+
 #endif /* _TRACE_F2FS_H */
 
  /* This part must be outside protection */
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
