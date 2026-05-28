Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9YDeAUq/F2ryPQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 06:06:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EC85EC5EF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 06:06:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bktVp4bXZS+/U9kuYj1XPewbK2Bwl9RmlBUs9xd1mw8=; b=dLKe4YHnjSaskWwM27snqzI8Oz
	N/GH/I5Y5KLdbRu6UGuuFSuH1NcIaMfazT6r9AELbZLO8zN+V4V/1a2cZvVUj2XayOFY2GYhRG4ld
	ITGwnxwqYGJl2wB9VWB02BzGq1z2S8IpCQqR5RrNa8c3kMJukoGrYvgORrqN0B7tpQDQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSS0o-0000kB-Sc;
	Thu, 28 May 2026 04:06:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asj@kernel.org>) id 1wSS0n-0000k4-CY
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 04:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WUek036XA17MzAJUJBvXynOAe7o9o+IXSarD48Lhz1M=; b=eLfKld7xDQZ7lfYmwkPYaff+8U
 hpVQd9bClW1+oHCFcFjm/VupD5qsejyriWtweQnWTQHIk946zDKNd4M+KIDDRU++NOkyjmDMymYjo
 6eFxzlt3htTOWAb/3Z2wgNYW3++CeE9sQSjri3C3fQWE3l5iUvuW8Rm6dFqwDnPEbfJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WUek036XA17MzAJUJBvXynOAe7o9o+IXSarD48Lhz1M=; b=m8iVHMHPxy5Qv8+dotb2ZsZBBp
 OazmAMAFp10chM7tl5QNUJENjTi9yxHyczteN2vbpzaEb6ojca5NMRYTJ6YROKPMColKxmF1ZNdJ+
 7p8Kwjkg3U8+Kb3RF9MiawkdENROPBykiX2Fx74TKnH5TyYbb5eQN6mk0HYf+0EBbhfU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSS0n-00024I-2i for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 04:06:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0476260572;
 Thu, 28 May 2026 04:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BEC1F000E9;
 Thu, 28 May 2026 04:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779941179;
 bh=WUek036XA17MzAJUJBvXynOAe7o9o+IXSarD48Lhz1M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XDdasQZFOr8hwcjR+uRFk51a5ubDI9ea8xd24FtF38hBGRuYkraIAWXTPg7lax1Z/
 OdhilfsaRQlAj3boghBoAzWStddfr2bp4MjvPNur5jKik7/WU8ucxDSj5EDv45aQqy
 UVQFEh+Mm/6QjB6pzp/CrZ2WnndAYbUzWM+2nXxaa8Q+gx4LnbZLnhFgIFXk8IpOLH
 zm+Q/sJUC70YTV6oslYc4z518MVy7YVIvPKnB4h8OA3qbzObkuv2NYkkkzqocuqYsB
 kCMaMugkACBMoQuGBtRaQR30Zb56NyipU35AviDaB9zPkSkDXYWDjG7PQqpbn6SQWJ
 Zo8RLK0NOfiGQ==
To: fstests@vger.kernel.org
Date: Thu, 28 May 2026 12:05:35 +0800
Message-ID: <983ed0f63318c930379ee74220f23aa558c16d51.1779939330.git.asj@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779939330.git.asj@kernel.org>
References: <cover.1779939330.git.asj@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add a helper to check if the target filesystem supports
 unique
 f_fsid tracking across cloned or snapshot instances. Certain filesystems
 like XFS, Btrfs, and F2FS ensure unique f_fsid identifiers per filesystem
 instance. However, Ext4 derives its f_fsid directly from its superblock UUID, 
 which leads to identical f_f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wSS0n-00024I-2i
Subject: [f2fs-dev] [PATCH v6 04/11] fstests: add _require_unique_f_fsid()
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fstests@vger.kernel.org,m:hch@infradead.org,m:zlang@redhat.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
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
X-Rspamd-Queue-Id: 88EC85EC5EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a helper to check if the target filesystem supports unique f_fsid
tracking across cloned or snapshot instances.

Certain filesystems like XFS, Btrfs, and F2FS ensure unique f_fsid
identifiers per filesystem instance. However, Ext4 derives its f_fsid
directly from its superblock UUID, which leads to identical f_fsid
values on cloned images until the UUID is manually modified by userspace.

Introduce _require_unique_f_fsid() to allow test cases requiring strict
f_fsid uniqueness to skip gracefully on unsupported filesystems.

Signed-off-by: Anand Jain <asj@kernel.org>
---
 common/rc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/common/rc b/common/rc
index 937f478963b4..5446552aed92 100644
--- a/common/rc
+++ b/common/rc
@@ -6314,6 +6314,27 @@ _require_fanotify_ioerrors()
 	_notrun "$FSTYP does not support fanotify ioerrors"
 }
 
+# Ext4 derives f_fsid from the superblock UUID, meaning clones share the
+# same f_fsid until their UUIDs diverge. Conversely, XFS, Btrfs,
+# and F2FS ensure f_fsid remains unique per filesystem instance (often by
+# deriving it from the UUID and underlying block device.)
+#
+# Across all filesystems, a UUID collision causes libblkid tools to return
+# non-deterministic device mappings. It is ultimately the responsibility
+# of the userspace utility or use-case to enforce uniqueness when a clone
+# diverges. For details, see mailing list thread discussions titled:
+#      "ext4: derive f_fsid from block device to avoid collisions".
+_require_unique_f_fsid()
+{
+	# Skip the test if the filesystem does not enforce unique f_fsids
+	# natively. Checking this dynamically requires recreating a clone
+	# layout, so we use a static lookup based on FSTYP.
+	if [ "$FSTYP" == "ext4" ]; then
+		_notrun "Target filesystem ($FSTYP) does not guarantee unique f_fsid on clones."
+	fi
+}
+
+
 # Computes a percentage of the available space in a filesystem and
 # returns that quantity in MB. The percentage must not contain a percent
 # sign ("%").
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
