Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vBe7Db7DMGq2XAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:32:14 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5666568BB3E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:32:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=V0oPH7ci;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=AvtdUPSx;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="f uBXnfA";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="EzYg/iuf";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B6V1VjrGcbRNsTGxcYjy8TwwSpWQ4oIKgMTapntaYc0=; b=V0oPH7cifC/eEM2ZZsSftHRJ9J
	BcqiSbMUFjr5+Is61Xh+KMRWZaAOKmDK1f8fEIIz3L245lhMWWJ2NccgH0wdnKaBV+ZktTJZWAit/
	xNrZFexoBK4ieVJGYepAc9G9u3acG2Us6JUwOjiSttOUpQl4EWqFXwNa/wURbLNUTBQ4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZKWu-00057n-50;
	Tue, 16 Jun 2026 03:32:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wZKWs-00057f-Qp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nNkVhMAn/58nH69bVy+AD5u4skvW0u4EW5LxAgOT2F8=; b=AvtdUPSxcYcbtK1QQOR/SevU4V
 PV/ZeiCsOeNdoWAAfEgCLKwdndsZpWazmsLbcH+PQ0C7Qe+XtWLNqHH9+xDyTwqtODlMJC61nv9++
 2m5W2ESdPVSkbqwrRIYuLqHrenySQf7fksztnWyz9Bvg2WO5kMD9zWwlB74gEw+KEfLM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nNkVhMAn/58nH69bVy+AD5u4skvW0u4EW5LxAgOT2F8=; b=f
 uBXnfArNfLGg3Sg44C5eB+iHvdhHP827YanLTmkDkol0Y3feapaWAGgULGX4t/z2PdzuunxM6GKtH
 6D/WQxWZ3snmxy7P4tsHRBeiewpn4YabBxO434oAVdTK4ERmIxIs1xMBt41zuVwdL1cQW3oyKv7no
 JlRnOztV8dil9PFg=;
Received: from mail-dy1-f178.google.com ([74.125.82.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZKWs-0005Ns-Mn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:31:59 +0000
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-307631dbfedso8640767eec.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 20:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781580713; x=1782185513; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nNkVhMAn/58nH69bVy+AD5u4skvW0u4EW5LxAgOT2F8=;
 b=EzYg/iufQvVfEXyDs8sA0I1K63ZM38e60EDLahwj1md5KPTV7vvmBrNe0EELw7rOvj
 DCftohFIEB22LQdOEfYLuQTRmLZO88PeEmkkUJk/hLjYtCCNM8VD1az6bnUShfQ1imcV
 hmif4lSdxWsEhzhbC8Rv+e9vBiL5ddwqWFxKXsEUQII6mFH+mtFwAjpk8S2fa1PPYe+h
 XyEQwPQhlknwJFx40bLNV7wWHzeGWq/rH4/42TNwpPya99V2KxtliTdooflJRxMSHuqB
 Q2LrQV/4UBaMq8oM5KqpXnWIhVxF8U74bhBDIF98OnGxX51dIaG2Tn1Gg99T61jiFnc/
 tyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781580714; x=1782185514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nNkVhMAn/58nH69bVy+AD5u4skvW0u4EW5LxAgOT2F8=;
 b=QxYR38jpF9WAIvx/U3TiMfUBSACYUeNDSptXdpVqP+0sahpKMCeSkOM3BfunD7BWpu
 qmqB7yzYoHstJ7Bz/cOak+ki8L7xmiYVyjCrhWV0Yeb4VfrYiEToxA43bi6Qw8lUuLiN
 1JGcUSogCR83lqA1Nyot8lT0c0wpErxWZm2+qj4z1o3qFy2A4BZHgTpapHdlYesNQcxx
 QY61zoKc1naehEUJUOpwyrXGxRMbkB/K9Sojv3m3j05sE+mdfLNXXJ++0MuW+2P8kzBP
 2WF560F6W0HqEqEig3pTNOWnkQ+xYZ/eU0enXDyzX+xTq5/dbl8dntDK/ld1/CBtnd1q
 tfnA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9qAm53g/neGgzcA6xGIH8nomI2X5ULcfgYU++xNQkeUEOAyggvDrMaHEdghLa2HH7srBxCWV1V6bc9GmZQjgEB@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzIxVasTSlCpEjKPmCZZXC4KpMBIP/+NpGruIGUNp2MblpSRiDd
 U+TsIDfhLrwKbAs+NQrRiETF0LRxClwOV5M+75XmrKSDFl5pFx3gP7+w
X-Gm-Gg: Acq92OEgpR5xbqPiCHTsIBP7UNgMEN2FVS0glo5Pid8SIkQBhysK20PeOQfoHGj5flA
 5pYzhqy1H3oVI7N31pvnLhdHzTOgiYNMYJMRGkAS8YcUucb5IoYx3M9Ik23FYSScJFa5aO+qdYD
 9JkNN5CHzGlvL598Pki6pbLpVa3nqutIz6AD6NrR2+bJnX8xqhshBLkE/uzTZ0qAguUXtPoNGxN
 9j5D79XLlF/chS0rCfAXzQVR7bG3bRgjynMvmrAoxd17Bqtgw8szW9vu4DpCDr9YceB5UJdzs3E
 +r8fvLLFhsuloI/2FHuXEeitemJm72GbYUnCUKotNmDyATMqYcqV6HoHE2ddTv0YugT2IvYnFal
 L41eA2xmeotmdzALQ5O2614QuwjR/Delpv1MB5mZVvSutSVWp5n0uv1Hk6AsOZjrZt4NM3cugFo
 TuIrLrcKIgp4Kw+HznbH5bWQiD8PWcJjUOm+e4A0jkSlm5PEwfbO0Pl1EXTW4hr/9TRcp9rg==
X-Received: by 2002:a05:7300:1907:b0:2d9:fa9c:87a9 with SMTP id
 5a478bee46e88-30ba598cf1bmr1228980eec.5.1781580713466; 
 Mon, 15 Jun 2026 20:31:53 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3081e92096esm17685798eec.15.2026.06.15.20.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 20:31:53 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 16 Jun 2026 11:31:46 +0800
Message-ID: <20260616033146.127000-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_write_end_io() decrements the writeback page counter
 and then reads it again with get_pages() to decide whether the last
 F2FS_WB_CP_DATA
 completion should wake cp_wait. Use atomic_dec_return() for F2FS_WB_CP_DATA
 completions so the wakeup decision is made from the value produced by the
 decrement itself. Keep the existing dec_page_count() path for other writeback
 coun [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wZKWs-0005Ns-Mn
Subject: [f2fs-dev] [PATCH v4] f2fs: use post-decrement count for cp_wait
 wakeup
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
Cc: geoo115@gmail.com, qwjhust@gmail.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 qiwenjie@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:geoo115@gmail.com,m:qwjhust@gmail.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,xiaomi.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp,xiaomi.com:mid,xiaomi.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5666568BB3E

f2fs_write_end_io() decrements the writeback page counter and then
reads it again with get_pages() to decide whether the last
F2FS_WB_CP_DATA completion should wake cp_wait.

Use atomic_dec_return() for F2FS_WB_CP_DATA completions so the wakeup
decision is made from the value produced by the decrement itself. Keep
the existing dec_page_count() path for other writeback counters.

Fixes: ce2739e482bc ("f2fs: fix to avoid UAF in f2fs_write_end_io()")
Cc: stable@vger.kernel.org
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes in v4:
- Add Fixes and Cc stable tags.

 fs/f2fs/data.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d83a21998ec2..58d23eb74ec2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -392,15 +392,17 @@ static void f2fs_write_end_io(struct bio *bio)
 		if (f2fs_in_warm_node_list(folio))
 			f2fs_del_fsync_node_entry(sbi, folio);
 
-		dec_page_count(sbi, type);
-
 		/*
 		 * we should access sbi before folio_end_writeback() to
 		 * avoid racing w/ kill_f2fs_super()
 		 */
-		if (type == F2FS_WB_CP_DATA && !get_pages(sbi, type) &&
-				wq_has_sleeper(&sbi->cp_wait))
-			wake_up(&sbi->cp_wait);
+		if (type == F2FS_WB_CP_DATA) {
+			if (!atomic_dec_return(&sbi->nr_pages[type]) &&
+			    wq_has_sleeper(&sbi->cp_wait))
+				wake_up(&sbi->cp_wait);
+		} else {
+			dec_page_count(sbi, type);
+		}
 
 		folio_clear_f2fs_gcing(folio);
 		folio_end_writeback(folio);
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
