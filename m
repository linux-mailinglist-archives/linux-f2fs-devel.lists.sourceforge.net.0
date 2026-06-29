Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AxiUOPdbQmqR5QkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 13:50:15 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 300836D9A4C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 13:50:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="I2/SjnRf";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=P7BZLRwh;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="Z MrXjOz";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=k2xCY9cA;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/3Snz9zHEAkHR2wMwOrjfJd1cJf+zn8B8x6HvqI0Zeo=; b=I2/SjnRfwlG99XYMfSRyt66CVD
	Z/nVLFGmLyW1mXUBLaIKwHtGil2JFjyluDJfd1rolSsvWD6miWnOtKOPsfr3JnnJoDvYMy/EKm3H8
	V5c+3G66yetcccryMDY9uXsmYJVsfLDBT1lmmnYI5FmwbWIu2aCAFQLsz9k1o+0wL3rg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weAV7-0003A2-2B;
	Mon, 29 Jun 2026 11:50:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1weAUh-000383-Ss
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 11:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+9+EvJ6TfUCv/YwSlzQGh1Hj5i02SV0UzKzpRkG+M38=; b=P7BZLRwhGv12IXOwUqRxa5waWE
 AFRobmV7MJJ2Gj54wxAuFH6T2d/47pWImX9jnK5o3pNTPNE4K//ZLUQC+vnfoS+SmQceNgBQhMdY6
 XfHqCFxTw5dqadGvhMW9vYbPcOU+OfSdJuYIleDl0390zIoDMWlznENAT+2/mLyYAdYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+9+EvJ6TfUCv/YwSlzQGh1Hj5i02SV0UzKzpRkG+M38=; b=Z
 MrXjOz0UrevM13h8b95pKemYLEPcslufBadcwxke4Oc7hx83zfWYJNaFLAb7Ft/qxWJ9P4W7KNAEK
 GE2NdZVz3fDR+O6rfLV0OHAgFct7uTMl3atnsZm2OpXWnzoiUjXrmTAtxWMRJtGxFjRT2m/CtJihF
 8Jk4dQoyc1omF81Y=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1weAUd-0000IH-Ub for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 11:49:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BEF07600AB;
 Mon, 29 Jun 2026 11:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC571F000E9;
 Mon, 29 Jun 2026 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782733769;
 bh=+9+EvJ6TfUCv/YwSlzQGh1Hj5i02SV0UzKzpRkG+M38=;
 h=From:To:Cc:Subject:Date;
 b=k2xCY9cA/wBAEscNgoyvThzKrzwv+Cu2Xu8/4RuY44Kd47gKwJ/hYOUYAR/cP4BnY
 XHsSI9LE0MqAuh0lvvQrZXONuyO0I8Ygw7PXuwqCKWif5e1MRppbulSpu4MekvvnB7
 5NmSOCNAU9N4D8qBdjX1tm7yMrHPJKlIJvoETLAuOZoUe/hohfyustUbxdgLcs1zSb
 f/Uo2zeNsjlXpIipa1GmXM6lt53Dm1y5N40ncrTEWskVmViO7RcA7e0FfFdkuGU4k3
 RyOZPIi4jABBomJjN98c2h0rOF6wAS/cwZQBvKbA5GsET/q6QyTFPimb6dqlo4NaLg
 YYbOo/da1qkYg==
To: jaegeuk@kernel.org
Date: Mon, 29 Jun 2026 11:49:18 +0000
Message-ID: <20260629114918.224537-1-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Blocks of pinfile may not aligned to section size due to
 wrong
 use on pinfile, result in heavy overhead of GC, let avoid this by adding
 additional check condition in f2fs_setattr(). - truncate -s 8mb pinfile :
 random checkpoint may persist filesize w/ inode - fallocate -o 0 -l 8mb
 pinfile
 - f2fs_fallocate - f2fs_expand_inode_data - f2fs_allocate_pinning_section
 - f2fs_map_blocks [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1weAUd-0000IH-Ub
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid potential section-unaligned
 pinfile
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
Cc: stable@kernel.org, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:stable@kernel.org,m:daehojeong@google.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 300836D9A4C

Blocks of pinfile may not aligned to section size due to wrong use
on pinfile, result in heavy overhead of GC, let avoid this by
adding additional check condition in f2fs_setattr().

- truncate -s 8mb pinfile
: random checkpoint may persist filesize w/ inode
- fallocate -o 0 -l 8mb pinfile
 - f2fs_fallocate
  - f2fs_expand_inode_data
   - f2fs_allocate_pinning_section
   - f2fs_map_blocks
    - f2fs_map_lock
    - __allocate_data_block
    - file_need_truncate
    : w/ FADVISE_TRUNC_BIT, we can expect unaligned mapping can be
      truncated while open() if f2fs is not umount abnormally
    - f2fs_map_unlock
    : following f2fs checkpoint and sudden power-cut

- mount
- open pinfile
 - f2fs_file_open
  - finish_preallocate_blocks
   - truncate_setsize
   : filesize is 8mb
   - f2fs_truncate
   : can only truncate block outside filesize, rather than truncating
     unaligned blocks inside filesize

Fixes: f5a53edcf01e ("f2fs: support aligned pinned file")
Cc: stable@kernel.org
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f4facd409d9b..11cc8d79c235 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1107,17 +1107,23 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			!IS_ALIGNED(attr->ia_size,
 			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
 			return -EINVAL;
-		/*
-		 * To prevent scattered pin block generation, we don't allow
-		 * smaller/equal size unaligned truncation for pinned file.
-		 * We only support overwrite IO to pinned file, so don't
-		 * care about larger size truncation.
-		 */
-		if (f2fs_is_pinned_file(inode) &&
-			attr->ia_size <= i_size_read(inode) &&
-			!IS_ALIGNED(attr->ia_size,
-			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
-			return -EINVAL;
+
+		if (f2fs_is_pinned_file(inode)) {
+			/*
+			 * It may break section-aligned fallocate recovery
+			 * mechanism, so do not allow larger size truncation.
+			 */
+			if (attr->ia_size > i_size_read(inode))
+				return -EINVAL;
+			/*
+			 * To prevent scattered pin block generation, we don't
+			 * allow smaller/equal size unaligned truncation for
+			 * pinned file.
+			 */
+			else if (!IS_ALIGNED(attr->ia_size,
+				F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
+				return -EINVAL;
+		}
 	}
 
 	if (is_quota_modification(idmap, inode, attr)) {
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
