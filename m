Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPQ1F4uob2kaEwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 17:08:43 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0452F471CE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 17:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cmbflqn1u/Q5/GXOl5WpU4Mj8uCs47cUWYJLnB1EOns=; b=gbmY/Gyg0KrIS92f6O2qqp5BBA
	W0RbldTWbJKN8HArgCcyr+/UpQwLxAhUTzWiJNmFHfg3SK2SQPp+cKAyYsuWh6I7PXvLeHKO80aaQ
	uxWr6eJD4MP9vXaTMFYZMGC053ECryb/VAr4ThfUzBv2V6U0k0sI7UjQHvJ3zr68ze8s=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viCWK-0003OD-BO;
	Tue, 20 Jan 2026 14:15:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1viCWJ-0003O3-CS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 14:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XG535JtpsDf40xxtkqcZq+qof0BsJvnVS2Begzso9Uc=; b=JwVCVb3UK2Aqy8a2qKBsQWm00r
 Cw0r2DOt7bAxtuXFV5kLbG32eJmrFJ8cgUs6PsPtQR4RY+iKTrnmhBhqAMTwFa8bqmb3E7eY72HY3
 sR35f7lNInolNWFgHkkZl2oXpsNwPoWTximL9FjcN2FHMkz3lY/pzthpMrvNeWIYc6T4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XG535JtpsDf40xxtkqcZq+qof0BsJvnVS2Begzso9Uc=; b=h
 fuUv8nFCd/Yhho0W9BnwYckcbYIT5mAf5Mj+v/APpHzr4psbgz7WADgzZhOKNYHbExkECI3xQmTHA
 0lga+GRpF0g1QkFB+ML6HoshtvIAzG0fi2GLrbQfyrovii+PTICfsiYVPHIy6L6qiksQz4ebflMLE
 J1zuslwL5gg9ewC4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viCWJ-0007eO-Pr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 14:15:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1D62460008
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Jan 2026 14:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D56C16AAE;
 Tue, 20 Jan 2026 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768918536;
 bh=Mrrul669ImWUIvS85Up3V0pG4AlooNOKuhvIUuoV+8E=;
 h=From:To:Cc:Subject:Date:From;
 b=FNcbxe1P+mt+JFT/fRJgWlf5Gt8o+yO9W7UM5ildMuRs0Wff7Vyyk/HXz2eoZLErc
 1uc9UfWuMr4vIhFYgv2qnMlCND2RX0fa6C1FVRWpldtj3cWdk4dprWdc0kJdxLhIJQ
 o3SyfsVJ0qsi7K77raAeoaPKmryRUs57mHK7T4wN2H7QktTX6MOnh8dqpqjVRNzMI4
 W8bfDNVgYxQ8PlcWWKVdkpaY5SJIcAN3eH8VryOnkC87hkpokGSXoajk27zvCEJnaa
 tw/7hcLkl8qlbLiPs/h/xA8nfBRA7rVKijvVzIZ2jYScChTHAFTI8XhMLWyZxRJQzl
 nnuz2RZJgkSxQ==
To: jaegeuk@kernel.org
Date: Tue, 20 Jan 2026 17:18:26 +0800
Message-Id: <20260120091826.63308-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit d36de29f4bb5 ("f2fs: sysfs: introduce
 inject_lock_timeout")
 introduces a bug as below, fix it. cat /sys/fs/f2fs/vdx/inject_lock_timeout
 s/fs/f2fs/vdx/inject_lock_timeout: Invalid argument Signed-off-by: Chao Yu
 <chao@kernel.org> --- fs/f2fs/sysfs.c | 3 ++- 1 file changed, 2 insertions(+), 
 1 deletion(-) 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 1.1 DATE_IN_PAST_03_06     Date: is 3 to 6 hours before Received: date
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1viCWJ-0007eO-Pr
Subject: [f2fs-dev] [PATCH] f2fs: fix to show simulate_lock_timeout correctly
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
X-Rspamd-Queue-Id: 0452F471CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit d36de29f4bb5 ("f2fs: sysfs: introduce inject_lock_timeout")
introduces a bug as below, fix it.

cat /sys/fs/f2fs/vdx/inject_lock_timeout
s/fs/f2fs/vdx/inject_lock_timeout: Invalid argument

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/sysfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index cd22bfe75c45..d01a2664a250 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -86,7 +86,8 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
 		return (unsigned char *)sbi;
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	else if (struct_type == FAULT_INFO_RATE ||
-					struct_type == FAULT_INFO_TYPE)
+		struct_type == FAULT_INFO_TYPE ||
+		struct_type == FAULT_INFO_TIMEOUT)
 		return (unsigned char *)&F2FS_OPTION(sbi).fault_info;
 #endif
 #ifdef CONFIG_F2FS_STAT_FS
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
