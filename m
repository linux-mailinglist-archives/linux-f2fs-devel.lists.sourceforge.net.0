Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M4D3DeXCM2qgFwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2026 12:05:25 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1C769F178
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2026 12:05:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=AsjPFhv6;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=CQJQ1zWG;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="B Lf1ahf";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="f8f7o+E/";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qQFtWu1Xx5DXIHcf6tPw5NMfIFOGPwZyR+P0uiMX/kE=; b=AsjPFhv6vKC7HSppu+gXVNrva8
	RehBPJ1CYMOQ8DqtT79tSktUPcb1ZvDYm2CJFv1rSEGP+V6tuZEzhI/sa6J36KboLhu0M53bWmJNT
	GsAOnZewyF0c0qHk4Iac+hYWES7lfmxWV2hYIwqUMZJK0tGMzpPWksigB4vOvcUbdZMs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wa9ca-0001AK-Dn;
	Thu, 18 Jun 2026 10:05:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wa9cZ-0001AE-TL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Jun 2026 10:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TY/9FT+PDtEpOIfJhnw0JCzsZKJe7D7sP4UeY0Af9zo=; b=CQJQ1zWGPyZLd7Kq+vyxhRlJ2o
 jXkCru3QTJN55CBN3IW8KteSKiecWJGULwtHiWK71eWGGinOo+Uzr2wI9lrsC1ya+VsFa5tmBRwDM
 ANUpk85DcL9YIgPOLYqPO7lhq4OHWsroZUHInyBhhyIbXcu1q2c0jdZfYfSrNcsuAh/Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TY/9FT+PDtEpOIfJhnw0JCzsZKJe7D7sP4UeY0Af9zo=; b=B
 Lf1ahf+DjQybdoBLd5DAOIaJso4vCWUYYqbGEGGgckiqYJJuBwd66MYERTXJfMMB9QMof7dYytr9g
 wt343Aw72lVhRpXPMsg9CPXfx125awEJuLlSFFo/L6UtnaBg2ApzK8aQN30gK5Ws/iY/51irLbXBU
 GVyToPtTYat6JoBs=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wa9cZ-0004qj-LM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Jun 2026 10:05:16 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2c6b3f71648so9899535ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Jun 2026 03:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781777110; x=1782381910; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TY/9FT+PDtEpOIfJhnw0JCzsZKJe7D7sP4UeY0Af9zo=;
 b=f8f7o+E/4uAEkKhDVQUQovTM+2BrDkScyX5XyYquIil/nnZiQFmTCvE9t3if7Pi8Zd
 NJho+t71Y/ylzHZllj9+Byx1NF0bntN7FmbgWE2FHR7sCchKGFrVJGamdN5H0MQPtaMD
 ovstWNx3sgjhq6PtJuDhMNPlsJIFcOLlTkpmJFgze5KqGhRpXVvuK7r5QEGEaZHlLp0U
 3PC6hM4AZkEeU0yxQCyxTFgLJ2PvKfhCt2JtfTVZz2KeGManFAmrs+6jFYlRsdUxTYGz
 o0cwzF+uJut7guCVrqi+2xt79r3wiyxTsMQYK4wdplFU8pb5Y1RjxCJVRJN9wdO51G4Y
 35Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781777110; x=1782381910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TY/9FT+PDtEpOIfJhnw0JCzsZKJe7D7sP4UeY0Af9zo=;
 b=abLnEGmcFzvlJ2TRxkBFRrt8ALP3CbBv7VL7QUvjADvtQqeIXv55kx1k03pU2POrWT
 rfy/RBnubr3S/CHp1s9RbMPM928314mJ5nzHCTT8semU4haDMlZt3jOsPCX8AfSWueLn
 L0o9Ks0zvoZyPnFhF5CzN57Vqndyaai3znDzLMcK5zAEkS/++h/+QoTetp9wQBguhwtn
 uKEbaJv6CaGZyT+qR0HD19AjHid/bI8DP1NnK5a3eqstlMEQJqVDOT7i1XVEmxvR5uoH
 LPtlvzjxN+fupnMqouXkKgGok02SAGkszfj9jpUC9U1BYS0S2yMEbRWLPsXvMooRXMvq
 /Phw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+nbU2ZVYciCdxL/Y/Pi67OrdHJwMVtpqHgRAutJqpUPOF6ejw6TcR8+Kkn7TYSc3ATslDYjm2vGo+SU4+XdvIo@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy3+5t0LNqqEPrvIsHcaeUMWrudQ5zWHny1kGK8ZsstvV3nIHEm
 FEeq0t52yIOT98JTM6oV6DpnKdOog+lNy73E1JXFtp/IuMp3tpXg1o8B
X-Gm-Gg: AfdE7ckgqJFI7k6Bc+wN5jU+8POuVZV5YMfHEYCYgrObQ1no2FbjBn4IcQnTYmwm8V/
 ZUWcE2gtePoIFhy+DGGrRbi1duXRimi9ET6HxNl+8sPDSPfVlX0F3EHXSs7IhgzPcppM2qScYdk
 nlCPxbLWtJFczuL5/eFpc1imuVtFeWQ5T5Nl6hlC4RE4571kENu4SxJp025T2Ix0JFpwZYEB4tr
 4Fivt96w1HVSuGMf5Czssbku/8gjk8M+SaPzuKkl2R3cstBWSXnlK+2UCZkn8D4L8bYJb5aCXoo
 np8gCJXg3MIc022srIkMTK7eO9KZhGmn3DY4dPkFFYmZFnISpHc9MnwQbFzhiWrVUo78k+yDk3O
 YcxMP0Wp4E+tVsuyZfNVGva0RgqT2rDWiGtyeteeezrQwCj0EBFaIGe6hFgjSmMlTW0BLvPQ6v0
 EVOo1Nm5ni/XW1TM1vYTQ64Hj0nTjQa1R+X4c/G3IhDUs29QPc
X-Received: by 2002:a17:903:2a83:b0:2c6:9758:9db2 with SMTP id
 d9443c01a7336-2c6bbf8d3a0mr87843155ad.3.1781777110131; 
 Thu, 18 Jun 2026 03:05:10 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c42fbb4134sm173786545ad.30.2026.06.18.03.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 03:05:09 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 18 Jun 2026 18:05:03 +0800
Message-ID: <20260618100503.2601790-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_write_end_io() decrements the writeback page counter
 and then reads it again with get_pages() to decide whether the last
 F2FS_WB_CP_DATA
 completion should wake cp_wait. That second read can miss the zero transition
 as below: 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.214.174 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wa9cZ-0004qj-LM
Subject: [f2fs-dev] [PATCH v7] f2fs: use post-decrement count for cp_wait
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D1C769F178

f2fs_write_end_io() decrements the writeback page counter and then reads
it again with get_pages() to decide whether the last F2FS_WB_CP_DATA
completion should wake cp_wait.

That second read can miss the zero transition as below:

checkpoint          end_io A              submitter B
- f2fs_wait_on_all_pages
 - get_pages() > 0
 - prepare_to_wait(cp_wait)
 - io_schedule_timeout
                    - f2fs_write_end_io
                     - dec_page_count
                      : count 1 -> 0
                                         - f2fs_submit_page_write
                                          - inc_page_count
                                           : count 0 -> 1
                     - get_pages() > 0
                       : skip wake_up(cp_wait)

The checkpoint thread can then keep sleeping until
DEFAULT_SCHEDULE_TIMEOUT, even though end_io A completed the old last
F2FS_WB_CP_DATA page.

Use the post-decrement value for F2FS_WB_CP_DATA completions so the wakeup
decision is tied to this completion.  Keep the existing dec_page_count()
path for other writeback counters.

Fixes: e234088758fc ("f2fs: avoid wait if IO end up when do_checkpoint for better performance")
Fixes: ce2739e482bc ("f2fs: fix to avoid UAF in f2fs_write_end_io()")
Cc: stable@vger.kernel.org
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/data.c | 12 +++++++-----
 fs/f2fs/f2fs.h |  6 ++++++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d83a21998ec2..2afdcd209d54 100644
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
+			if (!dec_page_count_return(sbi, type) &&
+			    wq_has_sleeper(&sbi->cp_wait))
+				wake_up(&sbi->cp_wait);
+		} else {
+			dec_page_count(sbi, type);
+		}
 
 		folio_clear_f2fs_gcing(folio);
 		folio_end_writeback(folio);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9f24287de4c3..db750cef371d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2776,6 +2776,12 @@ static inline void dec_page_count(struct f2fs_sb_info *sbi, int count_type)
 	atomic_dec(&sbi->nr_pages[count_type]);
 }
 
+static inline int dec_page_count_return(struct f2fs_sb_info *sbi,
+					int count_type)
+{
+	return atomic_dec_return(&sbi->nr_pages[count_type]);
+}
+
 static inline void inode_dec_dirty_pages(struct inode *inode)
 {
 	if (!S_ISDIR(inode->i_mode) && !S_ISREG(inode->i_mode) &&

base-commit: c0b65f6129c7fbb526e921dd60261650f1b2bef9
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
