Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLU7N0m/F2rYPQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 06:06:33 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 756775EC5ED
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 06:06:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcogz5Rr6sSXR0I97L1J5OhvGm1MpGyL9sT242oM8aQ=; b=BF7FCCS9JgXS79POQ3rAXQMEmr
	d0/yn/YlnCPHIgjgV+6tQo0u8dYtssDE9EPyD7iFrwywkeXEyGMi3CiPAZ+dkf4JOV7TyNqdBkH28
	AQEcLdUrFW7JNz1M5ZGjWST3jHWVxBI98rkOORu4sy06gz67nWcqvlTQCI4JxVAwlGKA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSS0k-00020p-R2;
	Thu, 28 May 2026 04:06:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asj@kernel.org>) id 1wSS0j-00020g-7D
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 04:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PAvTWkROU+u+H9crk+JD4pEa+DKYrUN/J2Uia9F6hVI=; b=LzGretvjDhftjBR1LPw6sRhtyY
 DUI3gpebLNuIvXisO1sBOPqRe8QwC/GQgVXF4mSRuwsZgBmgdqhUH/1nxR5wzbOHhw87RhBmkUuyG
 IxMZnlwGds8hS2RJGOmCSrhk5X1rwQQeZg9OD/pjvJbEN1KjAcgTLMqEA/Qztv6M5pRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PAvTWkROU+u+H9crk+JD4pEa+DKYrUN/J2Uia9F6hVI=; b=I4/SGTYXippQ0NhTpBoCCpem43
 bFR8+bBu7cCczairJ4SYG9WDqij8cn5KKCZsazqGUQYo5drl9Ptg8L7xH3Di9A6zG1o/17i4T6vn6
 ELPvT3N1tI1jHTGO3Wlqf8jWZMyFXlfkUv94Y2AIZdYSNOOYhIf1sot+FZeyNgY3wAEU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSS0i-00022U-5D for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 04:06:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 569E740C07;
 Thu, 28 May 2026 04:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF271F000E9;
 Thu, 28 May 2026 04:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779941175;
 bh=PAvTWkROU+u+H9crk+JD4pEa+DKYrUN/J2Uia9F6hVI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=mKSGv1DqAx5vGEyfWkTpShtLnnMd3c1/YnTVRVLcfFBR7uTFBpnffhcQV6TGueuSW
 F6rV+JDf0wCqd5xNhuQcHhA1lK5jTysPKwB97Z7IS3/sK5dKjgHwyAX8USKXY+ZUCN
 qbiJ9hP+GLuNAy6qEm+nidudllY/NmYYY8lZVabLN2bQ4CPXT399CgaeHs2TYRWAA2
 Z4THj/lFwApmZFy/PRG8E2fNszVsXcqKTpeq/OvLRGdvGHsGc3MHRfmXoIZUYlN/bX
 pxKK3HHf6ZArr3r/c5gVe4tDRhFmDCIQQv52YBo0R/1Sm+QjJ6Hp/zHj0/VWW+VAvo
 OcDgFZHFS/bbw==
To: fstests@vger.kernel.org
Date: Thu, 28 May 2026 12:05:33 +0800
Message-ID: <4346c80089c61c8f0d62ea696f9d73f2a9669297.1779939330.git.asj@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779939330.git.asj@kernel.org>
References: <cover.1779939330.git.asj@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Adds _clone_mount_option() helper function to handle
 filesystem-specific
 requirements for mounting cloned devices. Abstract the need for -o nouuid
 on XFS. Signed-off-by: Anand Jain <asj@kernel.org> --- common/rc | 17
 +++++++++++++++++ 1 file changed, 17 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wSS0i-00022U-5D
Subject: [f2fs-dev] [PATCH v6 02/11] fstests: add _clone_mount_option()
 helper
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
From: Anand Jain via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Anand Jain <asj@kernel.org>
Cc: hch@infradead.org, zlang@redhat.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:fstests@vger.kernel.org,m:hch@infradead.org,m:zlang@redhat.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[asj@kernel.org]
X-Rspamd-Queue-Id: 756775EC5ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adds _clone_mount_option() helper function to handle filesystem-specific
requirements for mounting cloned devices. Abstract the need for -o nouuid
on XFS.

Signed-off-by: Anand Jain <asj@kernel.org>
---
 common/rc | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/common/rc b/common/rc
index d7e3e0bdfb1e..937f478963b4 100644
--- a/common/rc
+++ b/common/rc
@@ -414,6 +414,23 @@ _scratch_mount_options()
 					$SCRATCH_DEV $SCRATCH_MNT
 }
 
+# Return filesystem-specific mount options required for mounting clone/snapshot
+# devices.
+_clone_mount_option()
+{
+	local mount_opts=""
+
+	case "$FSTYP" in
+	xfs)
+		# Allow mounting a duplicate filesystem on the same host
+		mount_opts="-o nouuid"
+		;;
+	*)
+	esac
+
+	echo $mount_opts
+}
+
 _supports_filetype()
 {
 	local dir=$1
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
