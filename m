Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKIqMwBVGWrTvQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:57:36 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 379FB5FF9C3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:57:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmhwvIdPjVe6ZEOX1HiPWqU+cffW6zW0Nvb8/U57/BE=; b=KXJEIJdSTzFlMLqsw8qS9A8ueB
	TDGIFJZennDqFh0rAkxLXXknpCTpNfGaR+q0xedU9AsGRzXv6QhIEpjiVgoz5h6wZcBF9MpD747RI
	8SxbFr9C6mOuUQnmN4Fv9CJsGTuJytggr6lyiHfMPTBaQHmpGo1ALOieN0axnVCtFZS0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSt28-0001BO-BR;
	Fri, 29 May 2026 08:57:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1wSt1w-00015U-Il
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ya9A+ycL4ZZHnpPp6WkbDYB1fk7kDUftAKdIPSJYiCQ=; b=BQmp9yQoz27IBxdED+B+loj9bn
 EEmhU0feg1Q8f0v6bNheKhy1lcbqGBqkYIkgUtS59ecni/wzeLBERwsvyyM2yeNvDVlqm7nWMjsIB
 MKHf6/mxeCGr4Lztr7M08CjRNOM1xcvJYlWge5+GxFjcpFmEjI3O6T6ZG7GN4JSpvHlo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ya9A+ycL4ZZHnpPp6WkbDYB1fk7kDUftAKdIPSJYiCQ=; b=dUyqVHeqfOxflwW2QpJTMfMiHj
 DmnOWf0ZW5pa/fygv3TU3otlg6Zkiu684wonzh3zuL6qstJ/sZD4vxMNlVupaWvqVSFVMW0ILlZpT
 toilDAN2tdL+2BYKRGtwsfgRAG3wLXwdERJTf+HD9a0771W1sA6lgMrXaRe7JoQ8vPbU=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wSt1e-00014Y-7z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:57:21 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-36ba285e98bso1227935a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 May 2026 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780045016; x=1780649816; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ya9A+ycL4ZZHnpPp6WkbDYB1fk7kDUftAKdIPSJYiCQ=;
 b=JFWUrTg4rrvjMehESljPckz2Ml2WeYAnSOLCaHJGGwVOx/A9Yp64lRobk51q+VquDU
 QGfL+/V7Np2Hibk0f9n4DANzoybm9evGgzXzPQVZc44V9V5PPc9uhA6IHDRHyUQOl8Wa
 7kTVpW2p0lQEUoHFkCZPuXaCChAHHuusOGomDTwELb/p6NoU+5Ygd5AKOdI85l9HcBv6
 jk4j5VMbIBVOV/sV4/PNwb+pABnvC7aqMlf5NXs0uoVJkgyUySQgZnyKaGX5gKjQcyEv
 qiDsnbCE9jUQKtS4FSQWv3n9oUUS+yIm61HaDHgWj1HPkC6Ahr5493CDB3G4TwShp0Xi
 iSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780045016; x=1780649816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ya9A+ycL4ZZHnpPp6WkbDYB1fk7kDUftAKdIPSJYiCQ=;
 b=bhXeIRUQAL8Wm+MN+Y1A0HAXPIaEpDa+GkzkKJz2xNdNs7WZcpA471lS/l43zDYLDa
 lkL8Gl5trWspzsnXFPCRHi4SVDrHfkoshJ0Oclg5DMi/gz2Y8gUOkfQuGqH8cVS1Oqkt
 nktri7FBNQFe4/b/XfK07yp0JuSwMSHwgHfi0VxpF8TDsFA6+1PTcsgr9mbbj5cwwMgj
 KZPVR1idYc3A4lTlLWdLD1O69S112yhwLR3BNJ7MQs7fmSuErizU8YClX5ahY4e18PYZ
 caOoZAZMVJpPPrRTMKiPTUdhZshpznyaPdQvegd78PqQwr/oHrPbXeay8AfWmfWUahmH
 x8BQ==
X-Gm-Message-State: AOJu0Yz6/ZeoaFHPsy2Ly/kl3l5k/T+8R6uZwRJME71JNj18kT7Q+Jnq
 l2hJ+/P8yUsaBTF2jqzlDm0kIZyrBiGtFmQV01Mwe/+bQgNazWX/T790m3D/9w==
X-Gm-Gg: Acq92OHt+ez3LJ8gSPMZ1S4lPb+oqykQ9Lt08d4+dlh3sGmhAKNQfrcOfdtvJ5ntIju
 Y7Q+YY4vF1uhAa5beUDL4CW4cBx7GIzsdyRtC2ptnxHRpwcFbuJDIJyP8RiYuOq5cUP7/6SpQvz
 /IGVvDSuVipRGWmwDXXbQm08Ntg2BG0av9zBX0bX/0hqXkZIcbKRghgGXqZn1N+G7zz7RQCdGIt
 g4sq5r9F1bpb05eVwqIu7eH2TPQo4Mlvj1HlBCksSjyUalSEY9h0EqCuJAW1ChUgoQi3iWn4q7N
 etvt1n8LgMHmXrMeNV46te3kgzhoxiNpDN/Wyn8CzoSsK/Gn9SPAI5mxqNtcntwqIN1wDTpMpkP
 NvijDLkAJ50YdX7R/Y7hF6z2+aesU7rsxwgYRCaJHajwDIf00Kt/lfBMYISmMSlndAtdIkN+rMD
 PN6mdksk/hff6HuW7sT8J5cZp+epbZh7OZuI00wRUIHwUOrmDe65JUCLJnBLviEuo1YRO1uzEa+
 QLE1wPs
X-Received: by 2002:a17:90b:518e:b0:35f:b6a1:8d27 with SMTP id
 98e67ed59e1d1-36bbcd92760mr2616485a91.18.1780045015964; 
 Fri, 29 May 2026 01:56:55 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bc1d9f2bbsm874027a91.2.2026.05.29.01.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:56:55 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 29 May 2026 16:56:29 +0800
Message-ID: <20260529085629.2664539-6-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529085629.2664539-1-yangyongpeng.storage@gmail.com>
References: <20260529085629.2664539-1-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Introduce trace events for inline extent
 operations for debugging and performance analysis: -
 trace_f2fs_iext_lookup_blkaddr_start
 - trace_f2fs_iext_lookup_blkaddr_end - trace_f2fs_iext_update_data_bl [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
X-Headers-End: 1wSt1e-00014Y-7z
Subject: [f2fs-dev] [RFC PATCH v2 5/5] f2fs: introduce tracepoints for
 inline extent lookup and update
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,xiaomi.com:email]
X-Rspamd-Queue-Id: 379FB5FF9C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Introduce trace events for inline extent operations for debugging and
performance analysis:
- trace_f2fs_iext_lookup_blkaddr_start
- trace_f2fs_iext_lookup_blkaddr_end
- trace_f2fs_iext_update_data_blkaddr

Guard trace calls with NULL inode check in lookup path where inode
may be NULL.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/iextent.c           | 11 ++++++
 include/trace/events/f2fs.h | 79 +++++++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/fs/f2fs/iextent.c b/fs/f2fs/iextent.c
index 63a3433aa9bc..454f4e113672 100644
--- a/fs/f2fs/iextent.c
+++ b/fs/f2fs/iextent.c
@@ -10,6 +10,7 @@
 
 #include "f2fs.h"
 #include "iextent.h"
+#include <trace/events/f2fs.h>
 
 /*
  * ASSERT - debug assertion for inline extent code.
@@ -477,6 +478,9 @@ int f2fs_iext_lookup_blkaddr(struct inode *inode, struct folio *ifolio,
 		(struct f2fs_iext_header *)get_dnode_addr(inode, ifolio);
 	struct f2fs_extent *last_ext = EXT_LAST_INDEX(eh);
 
+	if (inode)
+		trace_f2fs_iext_lookup_blkaddr_start(inode, fofs);
+
 	if (EXT_ENTRY_COUNT(eh) == 0 || F2FS_EXT_LOGICAL_END(last_ext) < fofs)
 		error = -ENOENT;
 	else
@@ -490,6 +494,11 @@ int f2fs_iext_lookup_blkaddr(struct inode *inode, struct folio *ifolio,
 		if (len)
 			*len = 1;
 	}
+
+	if (inode && !error)
+		trace_f2fs_iext_lookup_blkaddr_end(inode, fofs,
+						*blkaddr, len ? *len : 1);
+
 	return error;
 }
 
@@ -525,6 +534,8 @@ int f2fs_iext_update_data_blkaddr(struct inode *inode, struct folio *ifolio,
 	struct f2fs_iext_info *iext_info = sbi->iext_info;
 #endif
 
+	trace_f2fs_iext_update_data_blkaddr(inode, fofs, blkaddr);
+
 retry:
 	ASSERT(sbi, retry_cnt >= 0);
 	ASSERT(sbi, EXT_ENTRY_COUNT(eh) <= MAX_INLINE_EXTENTS(inode));
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 270c1a2c24c4..dc468a0c2980 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -2623,6 +2623,85 @@ TRACE_EVENT(f2fs_fault_report,
 		__entry->data)
 );
 
+TRACE_EVENT(f2fs_iext_lookup_blkaddr_start,
+
+	TP_PROTO(struct inode *inode, unsigned int pgofs),
+
+	TP_ARGS(inode, pgofs),
+
+	TP_STRUCT__entry(
+		__field(u64,	ino)
+		__field(dev_t,	dev)
+		__field(unsigned int, pgofs)
+	),
+
+	TP_fast_assign(
+		__entry->dev = inode->i_sb->s_dev;
+		__entry->ino = inode->i_ino;
+		__entry->pgofs = pgofs;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %llu, pgofs = %u",
+		show_dev_ino(__entry),
+		__entry->pgofs)
+);
+
+TRACE_EVENT(f2fs_iext_lookup_blkaddr_end,
+
+	TP_PROTO(struct inode *inode, unsigned int pgofs, block_t blkaddr,
+						unsigned int len),
+
+	TP_ARGS(inode, pgofs, blkaddr, len),
+
+	TP_STRUCT__entry(
+		__field(u64,	ino)
+		__field(dev_t,	dev)
+		__field(unsigned int, pgofs)
+		__field(u32, blk)
+		__field(unsigned int, len)
+	),
+
+	TP_fast_assign(
+		__entry->dev = inode->i_sb->s_dev;
+		__entry->ino = inode->i_ino;
+		__entry->pgofs = pgofs;
+		__entry->blk = blkaddr;
+		__entry->len = len;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %llu, pgofs = %u, blkaddr = %u, len = %u",
+		show_dev_ino(__entry),
+		__entry->pgofs,
+		__entry->blk,
+		__entry->len)
+);
+
+TRACE_EVENT(f2fs_iext_update_data_blkaddr,
+
+	TP_PROTO(struct inode *inode, unsigned int pgofs, block_t blkaddr),
+
+	TP_ARGS(inode, pgofs, blkaddr),
+
+	TP_STRUCT__entry(
+		__field(u64,	ino)
+		__field(dev_t,	dev)
+		__field(unsigned int, pgofs)
+		__field(u32, blk)
+	),
+
+	TP_fast_assign(
+		__entry->dev = inode->i_sb->s_dev;
+		__entry->ino = inode->i_ino;
+		__entry->pgofs = pgofs;
+		__entry->blk = blkaddr;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %llu, pgofs = %u, blkaddr = %u",
+		show_dev_ino(__entry),
+		__entry->pgofs,
+		__entry->blk)
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
