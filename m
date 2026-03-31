Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP40F9MHzGn+NQYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Mar 2026 19:43:47 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF3736F36B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Mar 2026 19:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6avUHwn5UyIfOCLIb6ddBOS2819NjMAD+Op60AU9LDQ=; b=k/9iZQPOnNeiPO09rdaSraz5HZ
	qrbpQFHKbp/uDRWOn02yFm8J6knWoSoDb+gtnmin6TnV6pmaU/5LsQWLX4uRLHBvu/qgnueuMsq0c
	cwNnpemLwqXO+GAS1YoSBLqZvhTIVWroWx7mDjsny/KLP7A13CVimW0PwbgI/wKSHDOM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w7d7p-0007s0-2B;
	Tue, 31 Mar 2026 17:43:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1w7d7n-0007ru-Ln
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Mar 2026 17:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8BLfamolzms3pxEa6e3lr4HC/Ctvr8fMo5Us0iLvJ+c=; b=JHh8lumX9ZnO272iKV1GKL6n8r
 Is1+/6AeQD5Yv90GdCh7msYwYtwDlomGMy0wsIkPEiuOw2LztUTWDGEYqZnsqOuvml2giwLps0zEm
 EhqjDWSFmcBQ1exG3n3tDv3BaUm591JuWMAdIp7ArOJi1yOM09YzPZH4izEdC5ZMJNSM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8BLfamolzms3pxEa6e3lr4HC/Ctvr8fMo5Us0iLvJ+c=; b=B
 XZ87xMpKKyd/Ycj5rStq0MqCZ4lF9I8kXLR+qyb2fccY83S42QgrwB/pp+Gq48fzV8Ngm+dU5jgIa
 jclNoEUDIJg906vRow/U50LaJJSX1B1dVj/Qa9C7uUwwmno3SjCvXVDGV4cwmBd3TROAd4tkKctKS
 Wk8Ux7HP7yDQwBx8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w7d7n-00065c-8L for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Mar 2026 17:43:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8D8CB60053
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 31 Mar 2026 17:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6C0C19424;
 Tue, 31 Mar 2026 17:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774979009;
 bh=V3Kzji++uDxbHo+Mh/THHG8NP7IgwKgSw/J14/pRC8o=;
 h=From:To:Cc:Subject:Date:From;
 b=O/dFHC0PGh9/xb6tDzuJOmw+SCtS5QfCR+HxPHK5BydWr4D8ryUAAlHXX47BxNrKz
 +Hlkkm2YDNBvbW+bjia/6jKzVTpQEdgQW7u0mohJkOoMLv08qKWtidITBUcLRFgWpO
 fz1PWwMSJ6zAsSIEtJ4g5LgqBnhL5B08EvCimW01y657ko07OxSdvuT4/Et5895E6X
 /9cEgdSGouQ8g1qNKjLCHdXiP2AejaDS3GWJOASgzJDD+m63Un0o2uEJTdv5nC9vz8
 Ihl+oA7vujf7rROzsCQSvk2UlNKrtJ3mzBmFbP2x7DDV74IFuEMBnx4/YZvul5eaR+
 HFkw82b9T5MjA==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 31 Mar 2026 17:43:26 +0000
Message-ID: <20260331174326.231867-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The fsparam_string_empty() gives an error when mounting
 without
 string, since its type is set to fsparam_flag in VFS. So, let's allow the
 flag as well. This addresses xfstests/f2fs/015 and f2fs/021. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/super.c | 27 +++++++++++++++
 1 file changed, 15 insertions(+), 12 deletions(-) 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w7d7n-00065c-8L
Subject: [f2fs-dev] [PATCH] f2fs: allow empty mount string for
 Opt_usr|grp|projjquota
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 9CF3736F36B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The fsparam_string_empty() gives an error when mounting without string, since
its type is set to fsparam_flag in VFS. So, let's allow the flag as well.

This addresses xfstests/f2fs/015 and f2fs/021.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/super.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5330ef981340..aab4345f3ee7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -337,9 +337,12 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
 	fsparam_flag("usrquota", Opt_usrquota),
 	fsparam_flag("grpquota", Opt_grpquota),
 	fsparam_flag("prjquota", Opt_prjquota),
-	fsparam_string_empty("usrjquota", Opt_usrjquota),
-	fsparam_string_empty("grpjquota", Opt_grpjquota),
-	fsparam_string_empty("prjjquota", Opt_prjjquota),
+	fsparam_string("usrjquota", Opt_usrjquota),
+	fsparam_flag("usrjquota", Opt_usrjquota),
+	fsparam_string("grpjquota", Opt_grpjquota),
+	fsparam_flag("grpjquota", Opt_grpjquota),
+	fsparam_string("prjjquota", Opt_prjjquota),
+	fsparam_flag("prjjquota", Opt_prjjquota),
 	fsparam_flag("nat_bits", Opt_nat_bits),
 	fsparam_enum("jqfmt", Opt_jqfmt, f2fs_param_jqfmt),
 	fsparam_enum("alloc_mode", Opt_alloc, f2fs_param_alloc_mode),
@@ -980,26 +983,26 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		ctx_set_opt(ctx, F2FS_MOUNT_PRJQUOTA);
 		break;
 	case Opt_usrjquota:
-		if (!*param->string)
-			ret = f2fs_unnote_qf_name(fc, USRQUOTA);
-		else
+		if (param->type == fs_value_is_string && *param->string)
 			ret = f2fs_note_qf_name(fc, USRQUOTA, param);
+		else
+			ret = f2fs_unnote_qf_name(fc, USRQUOTA);
 		if (ret)
 			return ret;
 		break;
 	case Opt_grpjquota:
-		if (!*param->string)
-			ret = f2fs_unnote_qf_name(fc, GRPQUOTA);
-		else
+		if (param->type == fs_value_is_string && *param->string)
 			ret = f2fs_note_qf_name(fc, GRPQUOTA, param);
+		else
+			ret = f2fs_unnote_qf_name(fc, GRPQUOTA);
 		if (ret)
 			return ret;
 		break;
 	case Opt_prjjquota:
-		if (!*param->string)
-			ret = f2fs_unnote_qf_name(fc, PRJQUOTA);
-		else
+		if (param->type == fs_value_is_string && *param->string)
 			ret = f2fs_note_qf_name(fc, PRJQUOTA, param);
+		else
+			ret = f2fs_unnote_qf_name(fc, PRJQUOTA);
 		if (ret)
 			return ret;
 		break;
-- 
2.53.0.1118.gaef5881109-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
