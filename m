Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /B5/IusbMWr0bgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 11:48:27 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1F568DAF2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 11:48:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="k1OpVU/c";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=TPQsok0S;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="Y ZK+9Xn";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=V+CdXCwq;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vka9kKcWrezxI8ZJktnJVSitrlO+ixzvVPVTRgf8YPk=; b=k1OpVU/c0ZkYS5IJRVWwfcoxCe
	mBlwJbaq0e2jod6jvyXW3vR+nhVTYTsJ0eOgq5VkLjD40BaN537OUN8N/fISePCzukUoMSv6ffAUO
	HXf24atWllXGFvLd1IfL2b75LNNjqugnzBLZxwkGj1xyH8ZiCSHjBnJ95nrdjVxlI/Cw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZQP8-0000Cd-Kh;
	Tue, 16 Jun 2026 09:48:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZQP6-0000CT-FA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 09:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4ZKIURw6///QPxQmXAX/ECabeUi0gfUq9M6G3uueIaU=; b=TPQsok0SQFF3q2G++Af1nQgoOu
 BbWcTGJyb5usenNW/T60LUqxYo0tf77NSJexyh5di6V7C6/0xKJFuJqu5IgdQVymSqWQCrNRopAxT
 WF/jicQH8cepiriKDMJeeDq3wTioJLlxczNvsGljxmCzBMq63sbLHm+tQaVm2HgllUXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4ZKIURw6///QPxQmXAX/ECabeUi0gfUq9M6G3uueIaU=; b=Y
 ZK+9Xns1sJpvXUrePekCJQOUmRWe/Y4+7eF97R9evzVsxJ3Ley/gugvTFK1An80eh0D0MOySfFPMQ
 4ZwbLSSFmB/TItHzTsIzcQy+yYXeoMfT54wWQapJ/MdSnKOddj8+pEPPIIWp4NbLXo3ExLu5zT4oQ
 MfNobSZopkupEgjA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZQP2-00051W-5M for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 09:48:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5040B43250
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2026 09:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD141F000E9;
 Tue, 16 Jun 2026 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781603291;
 bh=4ZKIURw6///QPxQmXAX/ECabeUi0gfUq9M6G3uueIaU=;
 h=From:To:Cc:Subject:Date;
 b=V+CdXCwqzzaF6UQe63RQcZOtNS/7JSJ0p8HZ/zb498SQe9/ii4CQWlOyWK2nfJ9Fe
 kEiowNQxL/dbZ7B4eWe6u1sFvQx1SjVKvOe60DWqOhE3/23HteBAlVJEeaInk0oApT
 2JCR3kGvnNJ0Vmc3UVtpPmBBwxV8Lc1ASjyh8qSmK8mgizcWHefjTsOMCZMqc1st14
 kQODgMbHlNmQaMLajQyCC1v+kJp5MgULnsAUSrbeUaMwkVKQ7tE1CNmfOTmTdT7MqA
 gGJcjA4xnwP/9pPqvKyziZafphf7tLC9qF/jQxr4PUdX0vb85uIomsucshFQyzg989
 mrtuZ1Mtaslng==
To: jaegeuk@kernel.org
Date: Tue, 16 Jun 2026 09:48:01 +0000
Message-ID: <20260616094802.3107281-1-chao@kernel.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Corrupted inode may contain invalid i_inline_xattr_size field,
 when F2FS_FEATURE_FLEXIBLE_INLINE_XATTR is enabled,
 and inode has not F2FS_INLINE_XATTR
 flag, fsck.f2fs won't check its validation, howev [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZQP2-00051W-5M
Subject: [f2fs-dev] [PATCH 1/2] fsck.f2fs: sanity check i_inline_xattr_size
 correctly
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
X-Rspamd-Queue-Id: CE1F568DAF2

Corrupted inode may contain invalid i_inline_xattr_size field, when
F2FS_FEATURE_FLEXIBLE_INLINE_XATTR is enabled, and inode has not
F2FS_INLINE_XATTR flag, fsck.f2fs won't check its validation, however
we will still use i_inline_xattr_size field via get_inline_xattr_addrs(),
it may cause potential heap buffer underflows and out-of-bound read/write.

In addition, we missed to check i_inline_xattr_size w/ lower boundary
MIN_INLINE_XATTR_SIZE like we did in kernel side.

This patch fixes above two issues.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c  | 10 ++++++----
 fsck/xattr.h |  2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 4fca4dd..e679357 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1063,14 +1063,16 @@ check_next:
 			}
 		}
 
-		if ((c.feature & F2FS_FEATURE_FLEXIBLE_INLINE_XATTR) &&
-			(node_blk->i.i_inline & F2FS_INLINE_XATTR)) {
+		if (c.feature & F2FS_FEATURE_FLEXIBLE_INLINE_XATTR) {
 			unsigned int inline_size =
 				le16_to_cpu(node_blk->i.i_inline_xattr_size);
 
 			if (time_to_inject(FAULT_INODE) ||
-					(!inline_size ||
-					inline_size > MAX_INLINE_XATTR_SIZE)) {
+					inline_size > MAX_INLINE_XATTR_SIZE ||
+					(inline_size != 0 &&
+					 inline_size < MIN_INLINE_XATTR_SIZE) ||
+					((node_blk->i.i_inline & F2FS_INLINE_XATTR) &&
+					 !inline_size)) {
 				ASSERT_MSG("[0x%x] wrong inline_xattr_size:%u",
 						nid, inline_size);
 				if (c.fix_on) {
diff --git a/fsck/xattr.h b/fsck/xattr.h
index 867349c..5f59e8e 100644
--- a/fsck/xattr.h
+++ b/fsck/xattr.h
@@ -200,4 +200,6 @@ static inline int f2fs_acl_count(int size)
 			F2FS_TOTAL_EXTRA_ATTR_SIZE / sizeof(__le32) -	\
 			DEF_INLINE_RESERVED_SIZE -			\
 			MIN_INLINE_DENTRY_SIZE / sizeof(__le32))
+#define MIN_INLINE_XATTR_SIZE						\
+			(sizeof(struct f2fs_xattr_header) / sizeof(__le32))
 #endif
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
