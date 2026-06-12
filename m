Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Dm2IHmEK2rT+wMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 06:00:57 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC478676864
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 06:00:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=dV6BGoi5;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=DxfdLvDL;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Jei8PuWq;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20201202 header.b=o1WlayRI;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-Id:MIME-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DwGt8jPGbu+SHzFUXS/gb85jj0RAjPX9rzn7YeRpUTY=; b=dV6BGoi5LubNJ/rgJoW8fVP0bs
	v3MLESB/+JM9ZfDsyDC9DY6LM765eXW/Lm/XFDhhHkWEoRsjHPeXuQir6P7V5HZGv6Z9uW4IRf9XK
	nQOExz4G514DrZZN2kzdwv+hRSupfH8KT5f5zzN8TG5sJyjne9xCbkGVuzeRRpQ7RkXw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXt4a-0008O5-DS;
	Fri, 12 Jun 2026 04:00:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <devnull+hexlabsecurity.proton.me@kernel.org>)
 id 1wXt4Y-0008NZ-B0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 04:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Cc:To:Message-Id:Content-Transfer-Encoding
 :Content-Type:MIME-Version:Subject:Date:From:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=na9yEThGRRWlKRyQJxOXzIeISMFGGhRh+bIq3ZN63bk=; b=DxfdLvDLh5URRp/lhqkOsvcZXq
 BhWIo26T+BmBdfuxtJVrC/W6Wm/AeC8Wx0Bxpymrc94cg4+kP9W5nbBs6Z7k7OGUlWKge+v61SmwP
 hg+JDJHqSKWkMQ+Q62FRGzAC23XVirmm5AOkYFXXRTaXLbdON0PtXgraTMO0sCsPHX7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Sender:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=na9yEThGRRWlKRyQJxOXzIeISMFGGhRh+bIq3ZN63bk=; b=Jei8PuWqQOSWXMRrjDAKIfvqR5
 03Y9TStfFLWbCzA81h81wZMoDJdz526AQrHV17Oxx7eM70aE8p7aCv2no/3Lzlz6c2iz+jhNX9Ugc
 P/iVuZH97/5UN7pc/szX2Fm68i2UjcFD3+0GIprUJxXFDbem93tcGI7IbWYaTFad9X7Y=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wXt4T-0005ZL-UA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 04:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 10E5F400B9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jun 2026 04:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6987C2BCB8;
 Fri, 12 Jun 2026 04:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1781236836;
 bh=FwfEOUgAHBZMfatizE9f9B80qU6HLIAxsn8slx2AxgY=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=o1WlayRI161gkoOthtinRgriSe5at9fYGrXf7q8eJCE3gisn0rEo7gqpyuJlUvUgo
 p3sjTsygUIEkPL36OdLmw99eKLzSUYkaQFAmxxoJBXNq2ogGlhcgHocOh1VXJgORD0
 u7oNZpmktvu7PNX/f7CHQtNGH2wFqz60QK5aVSib9iT9+OVBtjXj+qqkw6nq9AKAAi
 lhb276Ph9ja0oMdnZcCaYNMAudzZoTjR1mJyqU9XAVwLZn2KJnxC+cl3os/rQLKYAy
 U734CLj6L+W3qjl0LQYJEIgwPcDYZAEJEAZJaEl9ljOAZwQkIhbU3lS1TEunC7/aEa
 6MY1BstZOjVEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C9606CD98CC;
 Fri, 12 Jun 2026 04:00:36 +0000 (UTC)
Date: Thu, 11 Jun 2026 23:00:36 -0500
MIME-Version: 1.0
Message-Id: <20260611-b4-disp-155e8807-v1-1-5d14dcc72b15@proton.me>
X-B4-Tracking: v=1; b=H4sIAGSEK2oC/x3MMQqAMAxA0auUzAaSom3xKuJQbdQsKi2IIN7d4
 viG/x8oklUK9OaBLJcWPfYKbgzMW9xXQU3VYMk6csw4tZi0nMhdJyGQx8BL8tImojhDzc4si97
 /chjf9wPlp/xSYgAAAA==
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781236836; l=3068;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=oHjiLW/l5fStezkSvQ/f/so+Q/tgh5KxCxwhyhFZA4o=;
 b=Vhtm7MJlSvpvEZj2JWx/nVSZTDQ4kzGlPiEnzn3C8JgIckF4J+TEZlTl+RJQiiZOFfqM2EvCL
 3L8DpdkQvyaCNa/SOqOPuplVAYkfVGWdNVfAaSlR/meuxnfGfgUMNo7
X-Developer-Key: i=hexlabsecurity@proton.me; a=ed25519;
 pk=dmppBMZNLLoPzxHi9l8tZDzEZUunPbgsYqIZYXeUrL0=
X-Endpoint-Received: by B4 Relay for hexlabsecurity@proton.me/proton with
 auth_id=814
X-Original-From: Bryam Vargas <hexlabsecurity@proton.me>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Bryam Vargas <hexlabsecurity@proton.me> When the
 flexible_inline_xattr
 feature is enabled, do_read_inode() loads the on-disk i_inline_xattr_size
 unconditionally: if (f2fs_sb_has_flexible_inline_xattr(sbi))
 fi->i_inline_xattr_size = le16_to_cpu(ri->i_inline_xattr_size); 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wXt4T-0005ZL-UA
Subject: [f2fs-dev] [PATCH] f2fs: bound i_inline_xattr_size for
 non-inline-xattr inodes
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
From: Bryam Vargas via B4 Relay via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: hexlabsecurity@proton.me
Cc: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:devnull+hexlabsecurity.proton.me@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:devnull@kernel.org,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,proton.me:replyto,proton.me:email,proton.me:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[hexlabsecurity@proton.me];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,hexlabsecurity.proton.me];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC478676864

From: Bryam Vargas <hexlabsecurity@proton.me>

When the flexible_inline_xattr feature is enabled, do_read_inode() loads
the on-disk i_inline_xattr_size unconditionally:

	if (f2fs_sb_has_flexible_inline_xattr(sbi))
		fi->i_inline_xattr_size = le16_to_cpu(ri->i_inline_xattr_size);

but sanity_check_inode() only range-checks it when the inode also has the
FI_INLINE_XATTR flag set.  An inode that carries an inline dentry or inline
data but not FI_INLINE_XATTR -- the normal layout for an inline
directory -- therefore keeps a fully attacker-controlled
i_inline_xattr_size from a crafted image.

get_inline_xattr_addrs() returns that value with no flag gating, so it
feeds the inode geometry:

	MAX_INLINE_DATA()  = 4 * (CUR_ADDRS_PER_INODE - i_inline_xattr_size - 1)
	NR_INLINE_DENTRY() = MAX_INLINE_DATA() * BITS_PER_BYTE / (...)
	addrs_per_page()   = CUR_ADDRS_PER_INODE - i_inline_xattr_size

A large i_inline_xattr_size drives MAX_INLINE_DATA() and NR_INLINE_DENTRY()
negative, so make_dentry_ptr_inline() sets d->max (int) to a negative
value.  The inline directory walk then compares an unsigned long bit_pos
against that negative d->max, which is promoted to a huge unsigned bound,
and reads far past the inline area:

	while (bit_pos < d->max)		/* fs/f2fs/dir.c */
		... test_bit_le(bit_pos, d->bitmap) / d->dentry[bit_pos] ...

Mounting a crafted image and reading such a directory triggers an
out-of-bounds read in f2fs_fill_dentries(); the same underflow also
corrupts ADDRS_PER_INODE for regular files.

Validate i_inline_xattr_size against MAX_INLINE_XATTR_SIZE whenever the
flexible_inline_xattr feature is enabled -- i.e. whenever the value is
loaded from disk and consumed -- and keep the lower MIN_INLINE_XATTR_SIZE
bound gated on inodes that actually carry an inline xattr, so legitimate
inodes with i_inline_xattr_size == 0 are still accepted.

Fixes: 6afc662e68b5 ("f2fs: support flexible inline xattr size")
Cc: stable@vger.kernel.org
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
---
 fs/f2fs/inode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index c6dcda447882..5c0f62190875 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -324,9 +324,9 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
 	}
 
 	if (f2fs_sb_has_flexible_inline_xattr(sbi) &&
-		f2fs_has_inline_xattr(inode) &&
-		(fi->i_inline_xattr_size < MIN_INLINE_XATTR_SIZE ||
-		fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
+		(fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE ||
+		(f2fs_has_inline_xattr(inode) &&
+		fi->i_inline_xattr_size < MIN_INLINE_XATTR_SIZE))) {
 		f2fs_warn(sbi, "%s: inode (ino=%llx) has corrupted i_inline_xattr_size: %d, min: %zu, max: %lu",
 			  __func__, inode->i_ino, fi->i_inline_xattr_size,
 			  MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);

---
base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
change-id: 20260611-b4-disp-155e8807-81fd7e4d00ac

Best regards,
-- 
Bryam Vargas <hexlabsecurity@proton.me>




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
