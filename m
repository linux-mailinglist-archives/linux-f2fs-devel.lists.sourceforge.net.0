Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ59AgX8uWm2QAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 02:12:37 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 385402B4DCA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 02:12:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BParmVzyPTkHqC3snWNvMjONsX6r0MSqort7JpP+QDI=; b=e5xg41Mr71SNVK6h3suEmGvCv4
	+gO751DUEFFl7kKRk1SzN4jqDi6KSV/Xoj5fW4MDKZVgcen1h0a1cq4EC7INFi6Juup+yyn1iCMuY
	EM3FkpeWYDIs1m9hQhuBFx4QlkOKkMXOggoVx/6C2cYRJX+JuARp11FFu8ICDFrteUX4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2fSS-0003Km-Mq;
	Wed, 18 Mar 2026 01:12:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w2fSR-0003Kf-Kz
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 01:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2TxHNC73ysx3yeGliTXvQZ0bAbsGDqJX4KpkmIX8PN0=; b=WcKEiuc1Rsl9rRr/b0T0Ks7ChQ
 WezxaOZCRlYEZQ6e5TCtoNIxkRh64fW7Dfio1If9KUGrfW5vNmZQwLklWAYMNP0/WmJSv3KPwBgTd
 a21ZPBNQNQN3w4l54Jo86wFwqaswDPkWu9xo1DLk6vrSTQxVQFCPDolZW2eCxVjFBbHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2TxHNC73ysx3yeGliTXvQZ0bAbsGDqJX4KpkmIX8PN0=; b=H
 9mbOAeA0nyIbioJitgqXzZ5ipzZlolgRd6NY1pI6bTc0XVr5SzYOzHtB3S8NlLQjwH4KgLB1SGFVw
 SX8dqf19vaJCLAHaAUAgzVhiowM+Ba3a6Pb8TSbt9szsE4WV8glUTrYABqWOT4nNTRMhcvYqvdZt3
 D2Cje/jdUKc0ouIE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2fSR-0007ua-2t for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 01:12:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 82D1343292
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Mar 2026 01:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37537C4CEF7;
 Wed, 18 Mar 2026 01:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773796337;
 bh=Lx4+kIMrv6PnfDvEM91QLSsocfjTwTm5yssi2Lm2bCs=;
 h=From:To:Cc:Subject:Date:From;
 b=vQglnnr8R6YmdaWJqHAavlGCPT1zQ7Q6/mY3SpvtL6KTTjUV9pQhqROgbY+h5uR2m
 Wms31OELLajeP0O3hCkL0HqaQngrMcB/zLjFdLrlAmHWUEQxoWRfkA7Cm47TvxVPsr
 QETASo+N++VRjH3O3xLx3rlP7ouA3LpEnJ8paEgMdd0ex4J7nvINWgvbt44/tO3pE6
 pOhZa3X286m3jU1GQb9tSYkjBHpAfRjmv6okVcZNM3lJ6//vhkY5RUnQGDuBh0fisL
 Fw1ffzR6QVN+JTfd/em0IMr4SHxzDDnZEd7IUhs/EG1QHUbdTy0yvi8tkCSCPjBvPT
 UvJ7bKYxBN0wQ==
To: jaegeuk@kernel.org
Date: Fri, 13 Mar 2026 10:24:32 +0800
Message-Id: <20260313022432.93815-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: 1.9 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_handle_page_eio() is the only left place we set
 CP_ERROR_FLAG
 directly, it missed to update superblock.s_stop_reason,
 let's call f2fs_handle_critical_error()
 instead to fix that. Introduce STOP_CP_REASON_READ_{META, NODE,
 DATA} stop_cp_reason
 enum variable to indicate which kind of data we failed to read. 
 Content analysis details:   (1.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 2.1 DATE_IN_PAST_96_XX     Date: is 96 hours or more before Received: date
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w2fSR-0007ua-2t
Subject: [f2fs-dev] [PATCH v2] f2fs: call f2fs_handle_critical_error() to
 set cp_error flag
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
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DATE_IN_PAST(1.00)[118];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 385402B4DCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f2fs_handle_page_eio() is the only left place we set CP_ERROR_FLAG
directly, it missed to update superblock.s_stop_reason, let's
call f2fs_handle_critical_error() instead to fix that.

Introduce STOP_CP_REASON_READ_{META,NODE,DATA} stop_cp_reason enum
variable to indicate which kind of data we failed to read.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- add missing 'return' to fix compile warning
 fs/f2fs/f2fs.h          | 21 +++++++++++++++++++--
 include/linux/f2fs_fs.h |  3 +++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 660bf88a376f..94cf1e78d892 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -5073,8 +5073,25 @@ static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi,
 		return;
 
 	if (ofs == sbi->page_eio_ofs[type]) {
-		if (sbi->page_eio_cnt[type]++ == MAX_RETRY_PAGE_EIO)
-			set_ckpt_flags(sbi, CP_ERROR_FLAG);
+		if (sbi->page_eio_cnt[type]++ == MAX_RETRY_PAGE_EIO) {
+			enum stop_cp_reason stop_reason;
+
+			switch (type) {
+			case META:
+				stop_reason = STOP_CP_REASON_READ_META;
+				break;
+			case NODE:
+				stop_reason = STOP_CP_REASON_READ_NODE;
+				break;
+			case DATA:
+				stop_reason = STOP_CP_REASON_READ_DATA;
+				break;
+			default:
+				f2fs_bug_on(sbi, 1);
+				return;
+			}
+			f2fs_handle_critical_error(sbi, stop_reason);
+		}
 	} else {
 		sbi->page_eio_ofs[type] = ofs;
 		sbi->page_eio_cnt[type] = 0;
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index dc41722fcc9d..829a59399dac 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -80,6 +80,9 @@ enum stop_cp_reason {
 	STOP_CP_REASON_NO_SEGMENT,
 	STOP_CP_REASON_CORRUPTED_FREE_BITMAP,
 	STOP_CP_REASON_CORRUPTED_NID,
+	STOP_CP_REASON_READ_META,
+	STOP_CP_REASON_READ_NODE,
+	STOP_CP_REASON_READ_DATA,
 	STOP_CP_REASON_MAX,
 };
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
