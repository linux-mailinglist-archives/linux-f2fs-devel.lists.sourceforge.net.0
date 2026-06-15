Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KHjYOWb5L2o7KwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 15:08:54 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6796B6868C9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 15:08:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=bAwDi3hy;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="UN9y4i/j";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="MOJ7/dsS";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Y7hGr13S;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAa0WV+aSTvd22X0KP/CoaAkWPNe222YVvRWgrw5bbU=; b=bAwDi3hyiAWZzLQlsr9tsr7IAH
	5ThbSBKBX2hxCxJl2tTyLM6wtAP83wkbu8jX6Fq0btVTAaxypb7PSDHfeq3uuowBO/h0blZHJO2MQ
	risxa5UMkQQhFrlupEuIhu+UB9eW1FPq/Ki1867bvuW2hzZ90+OrSLf4FoHu/Qjcq76M=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ73V-0001zm-Ld;
	Mon, 15 Jun 2026 13:08:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZ73U-0001zf-Qv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 13:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Er4ZRBSGadaxynvYX+j+Eaq3Kuq2vlR4CBo1bDHaFf0=; b=UN9y4i/jb3iQbTnPPi51d/Wtrj
 tQtmQQR8FCZ1ogkfM7bdTDn5Zfgpu0m7JjMfKTMZv2Jd1i4lqrLzhuQgh6/msmyuth5MT7Dy02QT2
 FWcMFSyYG7A0dSe3lh98wjet2bxL0oPbznhuIwQaMCwmoBXMWjBpzjS8v0arWZu/4yb0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Er4ZRBSGadaxynvYX+j+Eaq3Kuq2vlR4CBo1bDHaFf0=; b=MOJ7/dsSNOw6qO/qc+hsCniS4/
 vpc64XHI8djEJRD4pS5Ud0+WgeElO+HR9YBJZxHrwA8ig0SII9O4AC8RYyN8oDGqYQIv+5qtWCcb6
 UP5sdAXWZ6SqSu9Ps3MfbfdGdvQyglDkAgHGtaB/4c2McNF3DKgKz7HBOEm3hmfgEF6U=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ73Q-0005wF-BM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 13:08:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1B6E1601E6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 13:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1931F00A3D;
 Mon, 15 Jun 2026 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781528914;
 bh=Er4ZRBSGadaxynvYX+j+Eaq3Kuq2vlR4CBo1bDHaFf0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Y7hGr13SE1WIC9KM7M3RBd5TTyv7Q2juZT4L6St5Cs/jquRr3g2aL+n4bYNavS1sl
 IGd8Y3iYId9P1QRRjrkG9P3cj0Hqcg5Uzy0mA3Luw/vFRKXPDemGeXmHlivLAvPq6u
 IiDASs8JFDXNTt+a1PadYXUlKHb1K+ebwnGo4hc75BR3tX+UXSh04EH1z0cu5vnxyg
 V5zjebQ7wa1I9x432AfL3TkXp1+iSpDU3qLI/sf/TfQqJH1YdAjjunSXUCn71UonmN
 BHXomabidsFx6HEEmigEtjMRJdb7+WnLRtNRjlE5NsElJZcUp6OuDeP/wUb4GiAfE/
 nrmaVmYCYuQMw==
To: jaegeuk@kernel.org
Date: Mon, 15 Jun 2026 21:08:19 +0800
Message-ID: <20260615130822.2576088-3-chao@kernel.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
In-Reply-To: <20260615130822.2576088-1-chao@kernel.org>
References: <20260615130822.2576088-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The calculation of sec->ckpt_valid_blocks are the same in
 both set_ckpt_valid_blocks() and sanity_check_valid_blocks(), so it doesn't
 necessary to call sanity_check_valid_blocks() right after set_ckpt [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wZ73Q-0005wF-BM
Subject: [f2fs-dev] [PATCH 3/6] f2fs: avoid unnecessary sanity check on
 ckpt_valid_blocks
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6796B6868C9

The calculation of sec->ckpt_valid_blocks are the same in both
set_ckpt_valid_blocks() and sanity_check_valid_blocks(), so it
doesn't necessary to call sanity_check_valid_blocks() right after
set_ckpt_valid_blocks().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1ef4edb77078..f9c688d270e6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4802,10 +4802,8 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 			}
 
 			/* update ckpt_valid_block */
-			if (__is_large_section(sbi)) {
+			if (__is_large_section(sbi))
 				set_ckpt_valid_blocks(sbi, segno);
-				sanity_check_valid_blocks(sbi, segno);
-			}
 
 			__clear_bit(segno, bitmap);
 			sit_i->dirty_sentries--;
@@ -5133,10 +5131,8 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	if (__is_large_section(sbi)) {
 		unsigned int segno;
 
-		for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi)) {
+		for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))
 			set_ckpt_valid_blocks(sbi, segno);
-			sanity_check_valid_blocks(sbi, segno);
-		}
 	}
 
 	if (err)
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
