Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL1yLOnB6Gm9PwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Apr 2026 14:41:13 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 604CA446146
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Apr 2026 14:41:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EvNXwrg8fYD0n82qUxleqJG7IghLnVfIrjbibCOzW+M=; b=LkXDk57VMSQaeW14KVmOJ/lhB2
	koYXkQBxNM+czTyKi6iISUrweTESsVyxHF7949cmq2dok4+GmCtZGcCD8L9LqFjn8JxGUIi2x7SjE
	v62rFBdrQ3vDzs5Z0JDjMiFDYf6FAPePV5zBVdlUgtomBc+mFugOg2QOqtpvrN/2rUoU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFWt0-0006dy-Vz;
	Wed, 22 Apr 2026 12:40:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wFWsz-0006ds-FT
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 12:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8fsjCmetEZmz0qqYVXrFd4J1zzadDeQalQIxEPQVgY4=; b=dtKPDRQQUm5ZMbZLUOoYl0U+MP
 vFui9w92hKj27mBTh/dxDwgxkZ5Psg/MlK1doSo2yN7JeX5P0TynpJ7Tk7u/LXD7Y7sMqjB9JH++f
 D3FX0oFeBk+45CDP0odLeYQcr4gUcm6nzTmALLO4oZV+q/dcymPN5bdsvAszAx8Z2W4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8fsjCmetEZmz0qqYVXrFd4J1zzadDeQalQIxEPQVgY4=; b=h
 FEnHlYMQU9uoI59YPbI4ryEm7sgciucXqN2bcOGqwzgfvLHgECP/T7n7dDooVwbG97lbcltKLoB4Y
 /rYRUmBHMVHyWyf6gFitwuKKByK8y/axXw6cGIlQjKCOQAO4zm5VupgMBEdQZWKKx/CfswWBsdNUE
 j7evoymHewB/kG/M=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFWsz-0005s1-4u for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 12:40:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BFC1E437CA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Apr 2026 12:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A320DC2BCB4;
 Wed, 22 Apr 2026 12:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776861646;
 bh=jjp+IM2CvF+/Cq3DgQxWN9nCOub38O1J9ctC7sRjejY=;
 h=From:To:Cc:Subject:Date:From;
 b=Vcow1XCwk9GoVrMS/v4W7kYWERVBplW0xMkZhAJTAr+ixbRtzgSszojHhTRMAvMKN
 CR+4s1MTj6Zl5bidxOXyNmnGld8INzrQdpHp5VU94JWtRJJVaCdtwKJgX37Mvmd/Ig
 3Et+LrrCHm9RZdQSp9eGYYpsNWlI/o4eTTtxZ+PEYRfEmjsxA6FY78UNJsrWJlsUek
 pZ4jP0ecNBcHBGPJIXGuhNl8njbTK9/zhO718muH0y8+bLnJUPnIyAfnbuNParNYsd
 vyXK8WJKiGIcHF2LyoOnjQPizi9+YYMIM9QarR9HJEID5CGVIT/zvi9ONmx+8GjV0I
 aYytfbQjVIQWw==
To: jaegeuk@kernel.org
Date: Wed, 22 Apr 2026 18:48:47 +0800
Message-Id: <20260422104847.11243-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The default value should be 120 rather than 100,
 fix it. Signed-off-by:
 Chao Yu <chao@kernel.org> --- Documentation/ABI/testing/sysfs-fs-f2fs | 2
 +- 1 file changed, 1 insertion(+),
 1 deletion(-) diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs
 b/Documentation/ABI/testing/sysfs-fs-f2fs index 27d5e88facbe..1b58c029abd0
 100644 --- a/Documentation/ABI/testing/sysfs-fs-f2fs +++ b/Documentation
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFWsz-0005s1-4u
Subject: [f2fs-dev] [PATCH] f2fs: doc: fix the wrong description for
 critical_task_priority
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 604CA446146
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The default value should be 120 rather than 100, fix it.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 27d5e88facbe..1b58c029abd0 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -1001,4 +1001,4 @@ Contact:	"Chao Yu" <chao@kernel.org>
 Description:	It can be used to tune priority of f2fs critical task, e.g. f2fs_ckpt, f2fs_gc
 		threads, limitation as below:
 		- it requires user has CAP_SYS_NICE capability.
-		- the range is [100, 139], by default the value is 100.
+		- the range is [100, 139], by default the value is 120.
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
