Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHRGA6P9wWnqYgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 03:57:39 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 992493015D0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 03:57:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=irSWAdRTYHgl8frTVH2SZVEVklPIeQgcIC5LQmdepZM=; b=XCpUGGkBMlpKetrylw9rz0cxop
	t8nbgh6Kc0xfOupM4PVh1u6YCUPal/+DfQJvBkni7U/rtm83F1ByVoeNtb6nzYL0eqmRZyeMUFLPG
	qwvfF8jdxakrqTgUx9bcJ6keC5Ys5rbZhEOFgJWt3cMR0a2+RoOeml9D43OVKJkYVMSI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4rxM-000807-6F;
	Tue, 24 Mar 2026 02:57:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w4rxK-0007zt-SA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 02:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UJjKkDG5Kra1/SEOE7HeqDlRIv9zk+2cAHUlGVFP2co=; b=cg6KiMmPUK1N8Nx1UrKUmCbcPG
 9jCmb5UzKM+MoAkPjbLbDFQi7HFX5Cxa6rRWBjQiVze6k8ds+IE2Ctr3pBKsm4fb6L7bJSwX0SRVR
 O4wK7tWilhKuS5ydxe8aI4MiCWVgk2VEqDxBDw9/6j4W3ty5pJZ88SXCMEHNGyUidFno=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UJjKkDG5Kra1/SEOE7HeqDlRIv9zk+2cAHUlGVFP2co=; b=P
 jViOHF0CXiSq8+tsJVRtpqhZrkOCVlEbGJKi9FykFBuAHX3CvDNslae+ZBeAukbrUSoawTqKsCFqW
 WemQg2xyeRfrjJ/ivt//REBDBbredMF8qJbhLCYoN5+c6YSXPdQMNREcUYodJLBRAZ2hhYrcZ16aC
 vocVj181w6y+xmvc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4rxL-0003Jx-1W for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 02:57:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A50AE41842
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Mar 2026 02:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5F4C4CEF7;
 Tue, 24 Mar 2026 02:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774321032;
 bh=Hoir3FZd1ihnk39f3Bg524daUAtvJHXnLaeMyHbvdmI=;
 h=From:To:Cc:Subject:Date:From;
 b=Cre3XuwDSak3Wi9efN1sgL6sf6c798d9eApukxtR6/WVDYYY562PNI0zIPezW/RV8
 MQXvCfBDLjGZ0Kz4xA9ycFmmxEmHXOQJt9Lgokm9vBLN/kEpljrEP4epLUR8r/sqte
 ViDfpiWe2hloIfLP0bc8Rx8VqJuhStOR1/1pdMhbToVJDoeJXt1vYH1TMcNhd6KL7M
 MPsDUJtLDNOYua1kE6Bw2b+z2mB72zm2hOpSenLLt894b7/QYf2Y2tYQVZBoo3aX6S
 5QduA62Of2QsV4bVhbzQ4ywZhFp0k9Xz42tdI8tAkfedk6b9CjehSDLOeokxyLkoAB
 e4bceiy/GQdfw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Tue, 24 Mar 2026 10:56:55 +0800
Message-ID: <20260324025656.493776-1-chao@kernel.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch allows to run generic/791 on f2fs. Signed-off-by:
 Chao Yu <chao@kernel.org> --- common/rc | 3 +++ 1 file changed, 3 insertions(+)
 diff --git a/common/rc b/common/rc index 5fe44e21..8f09f19a 100644 ---
 a/common/rc +++ b/common/rc @@ -6184, 6 +6184,
 9 @@ _require_fanotify_ioerrors() x="$(_get_fs_sysfs_attr
 $TEST_DEV err_report_sec)" [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w4rxL-0003Jx-1W
Subject: [f2fs-dev] [PATCH] common/rc: support f2fs in
 _require_fanotify_ioerrors()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zlang@kernel.org,m:fstests@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	RCPT_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 992493015D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch allows to run generic/791 on f2fs.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 common/rc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/common/rc b/common/rc
index 5fe44e21..8f09f19a 100644
--- a/common/rc
+++ b/common/rc
@@ -6184,6 +6184,9 @@ _require_fanotify_ioerrors()
 		x="$(_get_fs_sysfs_attr $TEST_DEV err_report_sec)"
 		test -n "$x" && return 0
 		;;
+	f2fs)
+		x="$(cat /sys/fs/f2fs/features/fserror)"
+		test -n "$x" && return 0
 	esac
 
 	_notrun "$FSTYP does not support fanotify ioerrors"
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
