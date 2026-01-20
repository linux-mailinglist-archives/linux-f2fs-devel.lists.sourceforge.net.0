Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMtLJEmob2ndEgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 17:07:37 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E2147189
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 17:07:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MsHql6z7KHCPxSIPTcAr1DMjnIr7jp0BmGTZ6EtPtM=; b=QIwe0CTaTVfp6ulbv9AgtGecUy
	VP8abyn0ZtjO6vUtzpOf3I5qfLVxoUuoV5K0HBe/JjkD3VWLoZ3J6x37w9v12S4GMuOw135IdvUmS
	N5yyIFZ2LkxCADqi7V+X00ruxDtdDVUD00zwCh11iQsyGQ1oic045COgzzmkn53TLZqM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viCQs-0002tG-DY;
	Tue, 20 Jan 2026 14:10:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1viCQn-0002sp-Bf
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 14:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Iw9Y2qLW27penDLl/0r+7Jdv1z631e0dvOH3TcClcCc=; b=dCk6BHLZchR44F2BLbCtQk3gtp
 FYr+azzevaONGxyJTAjkiWMChFVtHsoySNVQYC+3GfAi9w4WFOmLgQwx/JuS4IuC3rVOAeZ+myVON
 XYQttHjsyv8mQZjQvF7QDrnFbWd6bObXK1cn/lx1ScY3fbda7Sk9MoV5QbamhMADrCwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Iw9Y2qLW27penDLl/0r+7Jdv1z631e0dvOH3TcClcCc=; b=EwHJBV/UpC4sjQ+No5uRKmyRJ/
 Vc8XT96Xw1qEKYPgDpnCiFaa0W6yW/ZBEv4YtdQxBD9dxg9e5uGfMamLMHWe7/bSs9vX0y0kW7m+7
 PclDbO/n0C9L1QFt5zaumoKoP+xyr9RcB0YRnZBjbtG0dVgyHeyhPAfJ22BXoe3Pko60=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viCQn-0007Mf-Jj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 14:10:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EDAFF6011F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Jan 2026 14:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8A2C16AAE;
 Tue, 20 Jan 2026 14:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768918199;
 bh=V11yCnrXXgu8zsEksEHezAvtxS8/qxKhGJjPfRTOFM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s73ezEPhJAdyh/rKAQDJgMD/2EhY+0Z3gMap2+l96wROJ8v34nAfDt4OzvdqW+nz1
 SWor/cjT7kow5kkZJmZJBjumQBDyY14AqxenCP5mc5F3Bx8ktDIG2EN6Bitt8XC3Z+
 72Xcro7XBCL8erfnvZgCdqtzH5e1pw8SCNXXaYmQfZgU3TbGj+rvl6ona056TRRYMz
 ew+U14JWHmssoPcFhxj+1h7OlWnG07jQ1btjShAdJKxFIKSF0rwuQQz1eqNIbU3Uyo
 8YaPrLmFrmSEC2dft0Te/0IvfKR+2y+GjN1Xah5FmSb1ywbbkByq8Pct5C1WE/hSdC
 ddLhuCR0olhAw==
To: jaegeuk@kernel.org
Date: Tue, 20 Jan 2026 17:12:15 +0800
Message-Id: <20260120091215.62608-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20260120091215.62608-1-chao@kernel.org>
References: <20260120091215.62608-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In order to simulate skipped write during
 enable_checkpoint().
 Signed-off-by: Chao Yu <chao@kernel.org> --- v2: - no changes
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 1 + Documentation/filesystems/f2fs.rst | 1 + fs/f2fs/data.c | 4 ++++
 fs/f2fs/f2fs.h | 1 + fs/f2f [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 1.1 DATE_IN_PAST_03_06     Date: is 3 to 6 hours before Received: date
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1viCQn-0007Mf-Jj
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: introduce FAULT_SKIP_WRITE
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
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: E6E2147189
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to simulate skipped write during enable_checkpoint().

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- no changes
 Documentation/ABI/testing/sysfs-fs-f2fs | 1 +
 Documentation/filesystems/f2fs.rst      | 1 +
 fs/f2fs/data.c                          | 4 ++++
 fs/f2fs/f2fs.h                          | 1 +
 fs/f2fs/super.c                         | 1 +
 5 files changed, 8 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 7398b369784c..9a8ec2290f68 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -744,6 +744,7 @@ Description:	Support configuring fault injection type, should be
 		FAULT_ATOMIC_TIMEOUT             0x00400000 (1000ms)
 		FAULT_VMALLOC                    0x00800000
 		FAULT_LOCK_TIMEOUT               0x01000000 (1000ms)
+		FAULT_SKIP_WRITE                 0x02000000
 		===========================      ==========
 
 What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index fc005f2eaf86..7e4031631286 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -218,6 +218,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			     FAULT_ATOMIC_TIMEOUT             0x00400000 (1000ms)
 			     FAULT_VMALLOC                    0x00800000
 			     FAULT_LOCK_TIMEOUT               0x01000000 (1000ms)
+			     FAULT_SKIP_WRITE                 0x02000000
 			     ===========================      ==========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 25b4d3f21fa7..9ef875e7b34c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2921,6 +2921,10 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		goto got_it;
 	}
 
+	if (is_sbi_flag_set(fio->sbi, SBI_ENABLE_CHECKPOINT) &&
+		time_to_inject(fio->sbi, FAULT_SKIP_WRITE))
+		return -EINVAL;
+
 	/* Deadlock due to between page->lock and f2fs_lock_op */
 	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc))
 		return -EAGAIN;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 52cec6b3ecf0..3a8e1dcdcd69 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -66,6 +66,7 @@ enum {
 	FAULT_ATOMIC_TIMEOUT,
 	FAULT_VMALLOC,
 	FAULT_LOCK_TIMEOUT,
+	FAULT_SKIP_WRITE,
 	FAULT_MAX,
 };
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0afe9f829058..5d8b2e812340 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -70,6 +70,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_ATOMIC_TIMEOUT]		= "atomic timeout",
 	[FAULT_VMALLOC]			= "vmalloc",
 	[FAULT_LOCK_TIMEOUT]		= "lock timeout",
+	[FAULT_SKIP_WRITE]		= "skip write",
 };
 
 int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
