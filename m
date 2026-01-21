Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLp+O8dgcGkVXwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 06:14:47 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 843F651666
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 06:14:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zQXyy2ClDB/2nhlWQfTSXDOBQzBbWew/NVc2lB8ibGo=; b=HKYL2Y8Q+LiUKOObkaelz47WXM
	6NhNWzLGTiUCn7ldmfXzvcm+OlT09MuiSPKPwih38HEv9um3dl/uKaUnRVPlMHrEr7i+apte3DaHM
	O+pS8z6z64UzqIaIw+RIGhduerTuNSHwsGLkCmdXL+9ydaVc3SqqU4LuC6funrxMgens=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viQYA-0001i0-1Z;
	Wed, 21 Jan 2026 05:14:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1viQY8-0001ht-Nw
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Jan 2026 05:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oGvdBfz9AZfgRX/dmDlYSEjKQXJvqhJd9uSxzlmsWD4=; b=dpiT3KhPKPy1sVLsABoXECjG5g
 MtkNadjRZ8GGTb1VT+06ykuKhzUvUtdclu2sasQQ1kpo7gIlMTNzY7rJHvv9v1J642AiXDX+5SYB+
 0TzRa5+uJF+5nXRJ2NvyiUc9Ekg/cFivwVqJAwZaAuBP72yLy9yJKAO1J8AaDgnXd17o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oGvdBfz9AZfgRX/dmDlYSEjKQXJvqhJd9uSxzlmsWD4=; b=c
 u0YFGUmCjg8+HIe+vJvj0KfH489OI5PZZXQwq0hI0vY48VxW4S+I0nm4f08KwZJT1U1iF59ZBXucy
 uDC9QSsrC/SXSUXP+KNmWD34B11RLWeYu0niIEDMSBLyXYZle2FOeGiierv8440yLj7Pe5p853ovj
 +R8thR5Nwwk+SOZA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viQY8-0001Ak-Ba for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Jan 2026 05:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AEBFD60051
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Jan 2026 05:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776FBC116D0;
 Wed, 21 Jan 2026 05:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768972465;
 bh=sl5DVMs0WCr/xFb31h+upvBmHNlbZJIPpUwSz/u7U1E=;
 h=From:To:Cc:Subject:Date:From;
 b=MHgcpEhF9npZ08XBLGAtuAdJRWG3FzPmr1tmdaHInaUPMDUIHYdr9vYAclKuxJyxb
 FRcieF0A5XJ3BvQ4NJz2Mn6WE/LghActvbNYEHqyWJaBq4+oCsKSeWyWX9Kkv4m7MM
 a9bmQfmGA0z8rpQUGEWOzUDb6HCC6UO9zSbvKHqCX1rVIqopcrImMapC2T1AVTjD0K
 8u9R5lT0oUHUnf/T4TnbAPnOf2SIRH4rvL1Df4Jts42Q/lRU13yiTbYo/E6TBoKrem
 r/HTrVZzI1Y6zdn8S0FeF8qvrlSlCXMd3Zn+3EnGOQM9MAzyVuf0gQz2NbMx2ytsqP
 9rWKHXD5jeKKg==
To: jaegeuk@kernel.org
Date: Wed, 21 Jan 2026 05:14:04 +0000
Message-ID: <20260121051404.2056730-1-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It's rare case that sync_inodes_sb() always skips to flush
 some drity datas, so it's enough to give extra three more chances to flush
 data. Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/f2fs.h | 2 ++
 fs/f2fs/super.c | 2 +- 2 files changed, 3 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1viQY8-0001Ak-Ba
Subject: [f2fs-dev] [PATCH] f2fs: decrease maximum flush retry count in
 f2fs_enable_checkpoint()
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_NONE(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 843F651666
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's rare case that sync_inodes_sb() always skips to flush some drity
datas, so it's enough to give extra three more chances to flush data.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h  | 2 ++
 fs/f2fs/super.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3a8e1dcdcd69..cac4c730bf61 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -697,6 +697,8 @@ enum {
 
 #define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO or flush count */
 
+#define MAX_FLUSH_RETRY_COUNT	3	/* maximum flush retry count in f2fs_enable_checkpoint() */
+
 /* IO/non-IO congestion wait timeout value, default: 1 jiffies */
 #define	DEFAULT_SCHEDULE_TIMEOUT	1
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5d8b2e812340..9d421a07d2d5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2687,7 +2687,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 
 static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 {
-	int retry = DEFAULT_RETRY_IO_COUNT;
+	int retry = MAX_FLUSH_RETRY_COUNT;
 	long long start, writeback, end;
 	int ret;
 	struct f2fs_lock_context lc;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
