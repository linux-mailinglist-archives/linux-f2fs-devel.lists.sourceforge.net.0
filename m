Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /dXfH6H0K2oVIgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 13:59:29 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF93679307
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 13:59:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Ne67NbJO;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ErkGWgYF;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=ZszB2wTQ;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="PP/X5o3g";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcsnFYvBNC1zExBu7VyVbHKOBNHdZ87IzG2hUipe6dk=; b=Ne67NbJO/5GaciDSkhX1oTTfLX
	kfvqW67wRczy95/DCoq45NPO8SRDe7NgO7JZDrxqH26h96/C2LFe2Z9HaPMSv3u3wRY70gTknM73d
	gHKEj+4mLewJJ5hlbSRjJE3vPSrbxmghcIF1ygpRa+qewudBC7SOhBr0X+nzNkoyYkWg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wY0Xn-00010I-C4;
	Fri, 12 Jun 2026 11:59:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1wY0Xl-00010B-Ao
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 11:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CPylUVmUOjExbHDu2NGb4UkHnQalvJixWz5yHaXMfRE=; b=ErkGWgYFi8q736d+rvnjBYGAxS
 EZy4KvFHKjBndKvmAgM6lbgc93lLTNhxE0MSv9VDukxYmon8TLkXeHIVILeF9vnsbTKPqLX1bzHIX
 vWkrLLA4uyLF2rdK/6S748QviY/ON78AG/mOrijhtR5cfNtxQkdXqSfnvdWgTbryX0SQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CPylUVmUOjExbHDu2NGb4UkHnQalvJixWz5yHaXMfRE=; b=ZszB2wTQ7zjn3hLTDgDNLR3ybi
 ZB8Ee5fEy0Tgn5xpC4PA6AORlt5wDpQieAH+wkm1ciCRcqx7aomlEhZ++uCQPM8H5RAl4GrzBMxw5
 weOvFDEbmmvF0NEghe7dIh/xRJBItCiEixbDY/arRfwi82WqV9fjwcqniDSQBiWtyo80=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wY0Xg-0001ki-JV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 11:59:22 +0000
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-8423f52af13so702572b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jun 2026 04:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781265555; x=1781870355; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CPylUVmUOjExbHDu2NGb4UkHnQalvJixWz5yHaXMfRE=;
 b=PP/X5o3g4CS1Z5XNvoTHEkPi57FWeoi0J3vqkYqy/xGciaLRHGMw19bOndhbpKxp6y
 og9XVT7TO8974/q1Yf9lycUufSa0gS5VHVVU3cLrJRj9wpCE+0WTOf8mZNTv3F4m/io4
 y9qakO0jtbuVx/+sc9um6XnxXfJFW+6yAHyV252Wnvr7tmigpefR2sjFGJR6kF/29EgV
 +Y1T8p8e4pgb3n+AzlfEfXI6+sorQ6Xm72iNYOZ+zFWZO19e3LnwTNmzC/vbaTWE66D0
 SgZjdw4tTAE/HgDwWMcCOhfwZbm2yUyeO94RpSL4MWaU5Ayz5S2hvxcrgssKolTPUo1W
 5u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781265555; x=1781870355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CPylUVmUOjExbHDu2NGb4UkHnQalvJixWz5yHaXMfRE=;
 b=fnzYPGQfGrq3UL3TEvydtSZz7dzJ/JQfQNJjrjesfDcOnETJ2tLq8FDe9Mnc+ez4lm
 bWoXFnExzw+q9oHsgQjb9ZiVxQNW9mU/HCbGuU9qEbn8ah8W6+OgWXfdRQy4M7yOOsGG
 DN3w91D6YruaOPmvBigHiqcNB1rvFih4ZUQIRE12ZDR/MIvK7yDfiICZUonp88zWxS+u
 eAg3KwNzEQtEVeOcPt6H+P+JXB5hu7Z1X29omfS/IciBR9GB3WD+l3XmBFu/p2bos1b6
 dWzFn7wdd1nDjpm23S9OKqYIQwWuRCK+wc9O1nIdCFgNoIJiBbLOIxoojnDhPr1zi+6P
 GkOg==
X-Gm-Message-State: AOJu0Yzad721MWo+kx1JZfOBLc3g1GhNty4JN3rHxNLM6AJz08YFu/2p
 DDZYbwG3sW/PSGZQSB5kZgPA5KFRsgSAW/47ju02j8oco2npO1BrFMLm
X-Gm-Gg: Acq92OHFgJ4IINGPck+ACNL6FlmlkKN8qT3o2De+CyB4TkVkLbYYv+4xbJp6ljEf5dM
 tv/ibaDYyf3zeJ/a+kl7Mtj6uCngSJJaB1lepduhpQj0gyqH0qTFrzGGZqOyiRIq/pHkxPsL2/n
 8CxpTfcEcOj42YUH8UgO8cg2Lk+b/AFjc4uIEtFI9eDU0p53wTtIKDdhGy5UORqduw8sHJqSRHC
 d08TAww6M7CwUpazEgCSP71OqYGquKfft216Rnj2YJ7PeMZBMb1tSP6N3mJr4me7CtuNWBgmrgA
 FD6umgakkCbMjjT+ybgvzmwXQ9JgvZY5sDPpdQ1X5HKzF02gCI64PZD5GivvizAY8v2cGbefSBn
 BzKG1zxibD5HUKGNfEMYrBp52pcrDZyRhIFNiHAocYs5PAadhgfKrud2uxxOYbJoPGA1sBoeR+F
 FAW2T2KzACA56u6g76Z09tYQzOE4FQFanwitwVGgFYJpBIwf/cLR/2kYlvBRzghV+pQqgsTg==
X-Received: by 2002:a05:6a00:234b:b0:842:54e8:bdd with SMTP id
 d2e1a72fcca58-8434ce62497mr2903687b3a.40.1781265555358; 
 Fri, 12 Jun 2026 04:59:15 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8434acf2ac9sm2131197b3a.21.2026.06.12.04.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:59:15 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 12 Jun 2026 19:58:38 +0800
Message-ID: <20260612115839.2065903-4-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang Previously, when an extent being inserted
 overlaps with the largest extent, the largest extent is dropped entirely.
 This was done to handle the case where the largest extent is not in memory,
 avoiding [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
X-Headers-End: 1wY0Xg-0001ki-JV
Subject: [f2fs-dev] [PATCH RESEND 3/5] f2fs: punch largest extent instead of
 dropping it entirely on overlap
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp,xiaomi.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BAF93679307

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Previously, when an extent being inserted overlaps with the largest
extent, the largest extent is dropped entirely. This was done to handle
the case where the largest extent is not in memory, avoiding
inconsistency between the largest extent and the extent tree.

This patch changes the semantics of __drop_largest_extent (renamed to
__punch_largest_extent): instead of discarding the entire largest
extent when any overlap is detected, keep the larger remaining portion
(left or right) after the punch. This preserves extent cache coverage
for truncate and overwrite operations that only partially overlap the
largest extent.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/extent_cache.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index f8d94db60dc6..82d84c4e98b2 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -397,14 +397,31 @@ static unsigned int __free_extent_tree(struct f2fs_sb_info *sbi,
 	return count;
 }
 
-static void __drop_largest_extent(struct extent_tree *et,
+static void __punch_largest_extent(struct extent_tree *et,
 					pgoff_t fofs, unsigned int len)
 {
-	if (fofs < (pgoff_t)et->largest.fofs + et->largest.len &&
-			fofs + len > et->largest.fofs) {
-		et->largest.len = 0;
-		et->largest_updated = true;
+	unsigned int largest_end, punch_end;
+	unsigned int left_len, right_len;
+
+	if (fofs >= (pgoff_t)et->largest.fofs + et->largest.len ||
+			fofs + len <= et->largest.fofs)
+		return;
+
+	/* Punch [fofs, fofs + len) from largest extent. */
+	largest_end = et->largest.fofs + et->largest.len;
+	punch_end = fofs + len;
+
+	left_len = fofs > et->largest.fofs ? fofs - et->largest.fofs : 0;
+	right_len = largest_end > punch_end ? largest_end - punch_end : 0;
+
+	if (left_len >= right_len) {
+		et->largest.len = left_len;
+	} else {
+		et->largest.blk += punch_end - et->largest.fofs;
+		et->largest.fofs = punch_end;
+		et->largest.len = right_len;
 	}
+	et->largest_updated = true;
 }
 
 void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
@@ -680,10 +697,10 @@ static void __update_extent_tree_range(struct inode *inode,
 		dei.len = 0;
 
 		/*
-		 * drop largest extent before lookup, in case it's already
+		 * punch largest extent before lookup, in case it's already
 		 * been shrunk from extent tree
 		 */
-		__drop_largest_extent(et, fofs, len);
+		__punch_largest_extent(et, fofs, len);
 	}
 
 	if (et->largest.len != 0 &&
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
