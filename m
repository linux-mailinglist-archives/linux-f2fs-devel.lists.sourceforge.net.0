Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBM4F23KDmovCQYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 11:03:41 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3735A1C63
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 11:03:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gou5LYezajX4YVL1+j6hZjdo6sx2lejgbkfxaHZPFD8=; b=amC0yWRiO3r/aY7ZBGQzhGJRbd
	43zvzVHJGwIjZP81F21AP+5e7V8uy326UBWbxbEOaUINNzSZr564swO9O8gIyGM5tm6JrQMKWl4hs
	SKq+NOWT4AJwqj0IMZhU0l7CKpffdBrUygxmmiBZBqN1pwoUYG5IXqdFLPruTbmx2M38=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPzJR-00017t-8q;
	Thu, 21 May 2026 09:03:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wPzJP-00017m-Nr
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 09:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lMOEzf7qD9FCwd1qxFHb+6cxh09diPSf6meFFWcrdgY=; b=dpPsUF24VDr+DpQx1R2gw87Luz
 VbPR9IThdxiafSTtmxIbOCrYofzNaeREI9TH7wFF7f6tKcq77vENfwuyUJDv8gnuq3lUm6m8q8Sei
 v3v7qUYXKf4lQGh21ahRuFYLOlB74XTd4aU73qECWgTY6nTDuYhYGWyw6jDp8CyRAy8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lMOEzf7qD9FCwd1qxFHb+6cxh09diPSf6meFFWcrdgY=; b=C
 Ca9if6phCmz79fr9EbWBVqPUatFQPHWCvZTY6X1334gtvqKoOj68mc2sFuL2OuVeC+nWom0Hzbv8H
 LKbH+ePvG7sJfUR45dWzZOTSj1viq9YQQ68D7opsuVz6Wgb5R5gxOqm4BC+9iYWuCIXaH5aJMAg1j
 oEWNDAxs23MZbUII=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wPzJN-0000pF-6M for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 09:03:28 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2ba21d32776so41984535ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2026 02:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779354200; x=1779959000; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lMOEzf7qD9FCwd1qxFHb+6cxh09diPSf6meFFWcrdgY=;
 b=MRRUp1Ncy7CWBZQaL5jT3x+tvw5nZ2EnfEyYdoVzdBh5Hi6B7zo3+KLuBxKlQxHKfO
 Ph5FKxci34zMO6lPyfBkhmCFuLuko8ZAiehFMtm1HkIWWClA/OS6Jh1pVHjPXie8Fwgu
 wwnS9ZPqIlsHXF4NMQC8eLqq4by2P+pgRFguPX28U6khgOPopzL7uCpnOEsnOkZlPJwO
 Wi/xZUOeMK7xcvD5OXbN1YJVP+uP+IEVngmKHMUg/ax5B+GqVjFp6zO3QkWVl247RaM/
 kAEiflsihxlj2+S8Pjf/505cgxEaif1HIDl3Vt142DJwgZPtjITLGIywgRVbIGwyVQbc
 sCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779354200; x=1779959000;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMOEzf7qD9FCwd1qxFHb+6cxh09diPSf6meFFWcrdgY=;
 b=CfwS0uoJGWf/YgWs0eew289EqrOpJvfE9mQMmToxHcAq7euDrZLB1RI3Tx82JnVHM8
 czf5rx5mw1t7f4kkZ2VOW8UUjCToiRoEUaxFe7C0KALGTUDtc9W7+fF0xQAwXMrAcI4H
 K58doBCiYJ9sAR6Bkfy9QaePl0RNvNTe8I0G9riZwhU0mAV4UOE4JgdJnmloNvZ81P1O
 5c2Z47caUpOOVLIcgO9xrQJS/Yw4qIjYI+Rl7+S9UHy3NSrmxzejl/Y0We+YlamBp0/B
 eAebgCmuYIqWrvH7hFiUG72O6lkHWrjx8Q6pMHsqoc3NCzAghHN71k8rb5b8kxQyDWLE
 JpXQ==
X-Gm-Message-State: AOJu0YxQGLS+AOezwfnQZm/03FvCOdJ7rbIPO+G81VFu1jYMmrHL/uSa
 RpJOECrM7Wa3j7xdM59/XyP60Nz19AaPHk0t95UMPKTTh/ut/B5oUMd+
X-Gm-Gg: Acq92OG7GtWC1j/SRcPepEwks/mPKwbGn2Gy5shL+q+VHizM0riGe4d19rpFPA5qckY
 /MFqv1Bi1Md4oEcmBd+Ji5/2xF+tHulW/cKPKs+L75D6H8bGXhj27wdphIKSiDSvXYapseOvIe3
 9/oWCTsJbZ7/j8IaJTANXaDZ5bvm77kSZmsfPgTcJKqB03ZF7JMBwJblUa3so6PFnz1qGGzK9ZJ
 cUbRI6lJc1kXtWR3hCUSZLDLWFouIGGTaXqPlryhOccgABD26zPKWusk9kcDX07X4DTO2ZJS5F2
 j8mnoE4UCdD5eND+Ct4hNJfrG7saNOmYZir7wIEwdOLRvF7a+qcNt36iIE3kawgbC2A0RcPCpC4
 TbRsJhkbK5EnrEgPH4T08MZUoHkXk2zkbsFvjp0dO5haHSMurVt37jeKwudOCYlMuGS3zEZTyjn
 VNDidOiRdiUcSlbTlO1ohpRj5hka5WIjyKqe0YxNuzVPO0L7aHlUaWTVmu6/22XmrKgjpOUmWZ4
 fVFuzND
X-Received: by 2002:a17:902:c94f:b0:2bd:2de3:5181 with SMTP id
 d9443c01a7336-2bea2fc1cc0mr19850435ad.9.1779354199829; 
 Thu, 21 May 2026 02:03:19 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bea9174954sm4239855ad.16.2026.05.21.02.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 02:03:19 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 21 May 2026 17:03:13 +0800
Message-ID: <20260521090313.1918698-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_read_data_large_folio() can keep a read bio across
 multiple
 readahead folios. If a later folio hits an error before any of its blocks
 are added to the bio, folio_in_bio is false and the current e [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wPzJN-0000pF-6M
Subject: [f2fs-dev] [PATCH v2] f2fs: fix missing read bio submission on
 large folio error
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
Cc: qwjhust@gmail.com, qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,vger.kernel.org,lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: AD3735A1C63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f2fs_read_data_large_folio() can keep a read bio across multiple
readahead folios.  If a later folio hits an error before any of its
blocks are added to the bio, folio_in_bio is false and the current error
path returns immediately after ending that folio.

This can leave the bio accumulated for earlier folios unsubmitted.  Those
folios then never receive read completion, and readers can wait
indefinitely on the locked folios.

Route errors through the common out path so any pending bio is submitted
before returning.  Stop consuming more readahead folios once an error is
seen, and only wait on and clear the current folio when it was actually
added to the bio.

Fixes: a5d8b9d94e18 ("f2fs: fix to unlock folio in f2fs_read_data_large_folio()")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes in v2:
- Rebase on current jaegeuk/f2fs.git dev branch.

Tested with a local-only fault hook which injected -EIO when
f2fs_read_data_large_folio() had a pending read bio but the current
readahead folio had not been added to it.  Without this fix, a 256MiB
immutable file read timed out after 20 seconds.  With this fix, the same
read completed without hanging.

 fs/f2fs/data.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index bdcf396038f8..9c6440a7db0e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2529,7 +2529,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	unsigned nrpages;
 	struct f2fs_folio_state *ffs;
 	int ret = 0;
-	bool folio_in_bio;
+	bool folio_in_bio = false;
 
 	if (f2fs_compressed_file(inode)) {
 		if (folio)
@@ -2645,18 +2645,17 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	}
 	trace_f2fs_read_folio(folio, DATA);
 err_out:
-	if (!folio_in_bio) {
+	if (!folio_in_bio)
 		folio_end_read(folio, !ret);
-		if (ret)
-			return ret;
-	}
+	if (ret)
+		goto out;
 	if (rac) {
 		folio = readahead_folio(rac);
 		goto next_folio;
 	}
 out:
 	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
-	if (ret) {
+	if (ret && folio_in_bio) {
 		/* Wait bios and clear uptodate. */
 		folio_lock(folio);
 		folio_clear_uptodate(folio);

base-commit: 520760b9f9156bf9698de38dc44c614fad68a1f9
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
