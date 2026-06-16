Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uBz6M+0bMWr1bgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 11:48:29 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E4F68DAF7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 11:48:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=VfZM1pl7;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="m69uYa/v";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=GFwUbL77;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=cZN9NMOQ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3bHbJotzyOXhmGwyAiQ8oGO9X2BSu6+60A1quYPliQ=; b=VfZM1pl7U/Tp3N+/VI7VtesBOz
	pP6CttS/0Tj0HXV5S4gwLhA/R3NgF0fUj/EmaF1d22IPnbrzdJdrAeOtIMwLwSMG7DeDgPvS0dA4o
	hltfUumY2cNnw59Xrspr/W+yBwJ2MUqB2CD9BYHWhJWS3Aq7SBJp3wReBqD+6QEGZhkU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZQPB-0008Mh-Dz;
	Tue, 16 Jun 2026 09:48:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZQP9-0008Mb-Pl
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 09:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b5AeoaNVGfAdnEbBqArUeJ2Koo25N1m9xuuEF8E6Vyc=; b=m69uYa/vvsRVbRss/URV45ksE1
 SPg5rhgK9l/sC2RCJqvzm4ji7ngzvlZ9E3acEcNmDFC97kkgq/IzIfVe517vjG5Z7xTB1pXVo+aW2
 HtCAvdB0ZCX6HQ4PefYQxvb0/Gcj/sCZREgpb9FOVKxobEPGhmRfzPJyzxAzhTkUbpZU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b5AeoaNVGfAdnEbBqArUeJ2Koo25N1m9xuuEF8E6Vyc=; b=GFwUbL77MfeqY6MbeF9DxwTeX+
 CUGzgabq4lfwE+Ph8J1oeNNIC0yfdZLvsid2aMfGQnYSqMCPGIWDUWmiQaWvDwS2F/wRE9/NgcEA6
 0+AgJXS7TXabnujRvhHHNO26rNXsP3YQOJHni5cEe/FvzVHMS1+5u88qDSuuUQGu7Isk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZQP8-000520-MX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 09:48:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 78D6F60132
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2026 09:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9831F000E9;
 Tue, 16 Jun 2026 09:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781603292;
 bh=b5AeoaNVGfAdnEbBqArUeJ2Koo25N1m9xuuEF8E6Vyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cZN9NMOQY8zoDZ/MUkBUxdww88fDwMwIX1sxhWp1htp7jhUrjsqZwSLgmWsGf+Tz3
 FZMHHXrtSeoFkvH4/ivzqvTvVz00OfyxaFS3RVKxCPUt72YxmDCTlAdB5DqTW3fkPK
 vGjeTM8uEILPIioUJApYLIARcuiYaaz6/v9Vm0NS6RkKwMGh8e32KchGu70Mi2N/QN
 u6BQgVOROpXenvwYXNFTqItqTEQP2nC5b88r6Q27QnEYK1zJkeCsDlphQO3PxXZG/E
 068ufapSXL4UN8kJ/Am70DHOQtUbaGp2tHy0OGJ8rZ64nGNqGkRZBbhwxoN5EysQ89
 mYTQj9dlOAc+Q==
To: jaegeuk@kernel.org
Date: Tue, 16 Jun 2026 09:48:02 +0000
Message-ID: <20260616094802.3107281-2-chao@kernel.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
In-Reply-To: <20260616094802.3107281-1-chao@kernel.org>
References: <20260616094802.3107281-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In fsck_chk_orphan_node(), entry_count is read directly from
 the on-disk orphan block footer. If an attacker or corrupted filesystem sets
 this to an excessive value (e.g., 0xFFFFFFFF), it can cause a [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZQP8-000520-MX
Subject: [f2fs-dev] [PATCH 2/2] fsck.f2fs: add bounds checking for orphan
 entry_count
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2E4F68DAF7

In fsck_chk_orphan_node(), entry_count is read directly from the on-disk
orphan block footer. If an attacker or corrupted filesystem sets this to an
excessive value (e.g., 0xFFFFFFFF), it can cause a massive loop leading to
out-of-bounds memory reads and out-of-bounds writes into the newly allocated
orphan repair block.

Fix this by ensuring entry_count does not exceed F2FS_ORPHANS_PER_BLOCK. If
an invalid entry_count is encountered, safely reset it to 0 and write the
repaired orphan block to disk when running with auto-fix enabled.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index e679357..66cc1c5 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2275,6 +2275,17 @@ int fsck_chk_orphan_node(struct f2fs_sb_info *sbi)
 
 		ASSERT(ret >= 0);
 		entry_count = le32_to_cpu(F2FS_ORPHAN_BLOCK_FOOTER(orphan_blk)->entry_count);
+		if (entry_count > F2FS_ORPHANS_PER_BLOCK) {
+			ASSERT_MSG("wrong orphan entry_count: %u", entry_count);
+			entry_count = 0;
+			if (f2fs_dev_is_writable() && c.fix_on) {
+				FIX_MSG("reset orphan entry_count to 0");
+				F2FS_ORPHAN_BLOCK_FOOTER(new_blk)->entry_count = 0;
+				ret = dev_write_block(new_blk, start_blk + i,
+						      WRITE_LIFE_NONE);
+				ASSERT(ret >= 0);
+			}
+		}
 
 		for (j = 0; j < entry_count; j++) {
 			nid_t ino = le32_to_cpu(orphan_blk->ino[j]);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
