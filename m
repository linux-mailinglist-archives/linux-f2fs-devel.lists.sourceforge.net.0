Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 339C082B761
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 23:59:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rO40r-0000Z7-63;
	Thu, 11 Jan 2024 22:59:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rO40p-0000Yq-NL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 22:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ta9IdNZqtCCoKDFw9Ha2hukayZYjXb1Cd+I4SdTh7EI=; b=Y26M0nc7ZbBiMP6lWbNzMfDDvC
 UlpKZVYL0Eg6bMoYJoswsbbtXGWqtx/k+hpgWyTVF8Hd1q/aKnA7fYjoEydKEUIr80svRBvcCD3hu
 pXpyUAosIA1orv8+VyBIcuMCv+VKnAWEYVzXG0ZEsn+2hTC+RJTnqGaLQN/mDYxvS/yA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ta9IdNZqtCCoKDFw9Ha2hukayZYjXb1Cd+I4SdTh7EI=; b=h
 Bor5EXK+u8901QCv8cU++roqX3s2hUpwWkywvqjx4/YlBQ+u6v24JucSt8Rh3EG5VCr1TbXqgX3Cb
 2VD1H8fUvLN41w8iSQYWJyGDyumiX5jEEnKqwIvlKljX8hFZiUHRnClAVE6pOFr0A0uNeSMfOusOl
 eg5xP7ioXlnGPDww=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rO40k-0005wp-JR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 22:59:00 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 138F01F74A;
 Thu, 11 Jan 2024 22:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705013916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ta9IdNZqtCCoKDFw9Ha2hukayZYjXb1Cd+I4SdTh7EI=;
 b=fnwHOf7baa/u9PG6d2dI3pDtz3BV3ue214lU4HH3qyqdTBp7oSC8EXYZ/w0lt2iytgyRq2
 lFjb1jKzvaY/sooANIMbb/DcPAF1+b66ovjpqknq8UZWiTSkCvo61aDLLYkkIvPAMWRPp+
 6fzepX1SmkfGim1wbzdbFLTko7g3JWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705013916;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ta9IdNZqtCCoKDFw9Ha2hukayZYjXb1Cd+I4SdTh7EI=;
 b=vlESKhfayfoLOjVUoUqAei5fr+UtHtF7Wa16/zemvgxV9oCbX2bUWjLeTnWdbKQ4XOF+rx
 xEmrdWejX/4z2+Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705013916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ta9IdNZqtCCoKDFw9Ha2hukayZYjXb1Cd+I4SdTh7EI=;
 b=fnwHOf7baa/u9PG6d2dI3pDtz3BV3ue214lU4HH3qyqdTBp7oSC8EXYZ/w0lt2iytgyRq2
 lFjb1jKzvaY/sooANIMbb/DcPAF1+b66ovjpqknq8UZWiTSkCvo61aDLLYkkIvPAMWRPp+
 6fzepX1SmkfGim1wbzdbFLTko7g3JWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705013916;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ta9IdNZqtCCoKDFw9Ha2hukayZYjXb1Cd+I4SdTh7EI=;
 b=vlESKhfayfoLOjVUoUqAei5fr+UtHtF7Wa16/zemvgxV9oCbX2bUWjLeTnWdbKQ4XOF+rx
 xEmrdWejX/4z2+Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E66013946;
 Thu, 11 Jan 2024 22:58:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /azCFZtyoGVILwAAD6G6ig
 (envelope-from <krisman@suse.de>); Thu, 11 Jan 2024 22:58:35 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Thu, 11 Jan 2024 19:58:06 -0300
Message-ID: <20240111225816.18117-1-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fnwHOf7b;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vlESKhfa
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[9]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[lists.sourceforge.net,vger.kernel.org,gmail.com,suse.de];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 0.49
X-Rspamd-Queue-Id: 138F01F74A
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Thank you, Eric and Al, for your feedback on the previous
 version. This version has some big changes: instead of only configuring on
 the case-insensitive case, we do it for case-sensitive fscrypt as well, and
 disable d_revalidate as needed. This pretty much reverses [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rO40k-0005wp-JR
Subject: [f2fs-dev] [PATCH v3 00/10] Set casefold/fscrypt dentry operations
 through sb->s_d_op
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
Cc: linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-ext4@vger.kernel.org, amir73il@gmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Thank you, Eric and Al, for your feedback on the previous version.

This version has some big changes: instead of only configuring on the
case-insensitive case, we do it for case-sensitive fscrypt as well, and
disable d_revalidate as needed.  This pretty much reverses the way
fscrypt operated (only enable d_revalidate for dentries that require
it), but has the advantage we can be consistent among variations of
case-insensitive/sensitive, encrypted/unencrypted configurations.

You'll find the code is simpler than v1 and v2.  I dropped the dcache
patch because now we always try to disable DCACHE_OP_REVALIDATE while
holding the d_lock already, so I do it inline; I also changed the way we
drop d_revalidate when the key is made available, because we couldn't
really do it the way I originally proposed on the RCU case, which would
require falling back to non-RCU lookup just to disable d_revalidate; I
also included a patch fixing the overlayfs issue that I mentioned on the
previous thread.  While unrelated to the rest of the patchset, it is a
quick fix that I might merge earlier if you are happy with it.

More details can be found in the per-patch changelog.

This survived fstests on ext4 and f2fs.  I also verified that fscrypt
continues to work when combined to overlayfs as Eric requested.

..
original cover letter:

When case-insensitive and fscrypt were adapted to work together, we moved the
code that sets the dentry operations for case-insensitive dentries(d_hash and
d_compare) to happen from a helper inside ->lookup.  This is because fscrypt
wants to set d_revalidate only on some dentries, so it does it only for them in
d_revalidate.

But, case-insensitive hooks are actually set on all dentries in the filesystem,
so the natural place to do it is through s_d_op and let d_alloc handle it [1].
In addition, doing it inside the ->lookup is a problem for case-insensitive
dentries that are not created through ->lookup, like those coming
open-by-fhandle[2], which will not see the required d_ops.

This patchset therefore reverts to using sb->s_d_op to set the dentry operations
for case-insensitive filesystems.  In order to set case-insensitive hooks early
and not require every dentry to have d_revalidate in case-insensitive
filesystems, it introduces a patch suggested by Al Viro to disable d_revalidate
on some dentries on the fly.

It survives fstests encrypt and quick groups without regressions.  Based on
v6.7-rc1.

[1] https://lore.kernel.org/linux-fsdevel/20231123195327.GP38156@ZenIV/
[2] https://lore.kernel.org/linux-fsdevel/20231123171255.GN38156@ZenIV/

Gabriel Krisman Bertazi (10):
  ovl: Reject mounting case-insensitive filesystems
  fscrypt: Share code between functions that prepare lookup
  fscrypt: Drop d_revalidate for valid dentries during lookup
  fscrypt: Drop d_revalidate once the key is added
  libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
  libfs: Add helper to choose dentry operations at mount
  ext4: Configure dentry operations at dentry-creation time
  f2fs: Configure dentry operations at dentry-creation time
  ubifs: Configure dentry operations at dentry-creation time
  libfs: Drop generic_set_encrypted_ci_d_ops

 fs/ceph/dir.c           |  2 +-
 fs/ceph/file.c          |  2 +-
 fs/crypto/hooks.c       | 62 +++++++++++++++++++++--------------------
 fs/ext4/namei.c         |  1 -
 fs/ext4/super.c         |  1 +
 fs/f2fs/namei.c         |  1 -
 fs/f2fs/super.c         |  1 +
 fs/libfs.c              | 61 +++++++++++-----------------------------
 fs/overlayfs/params.c   | 13 +++++++--
 fs/ubifs/dir.c          |  1 -
 fs/ubifs/super.c        |  1 +
 include/linux/fs.h      | 11 +++++++-
 include/linux/fscrypt.h | 51 ++++++++++++++++++++-------------
 13 files changed, 106 insertions(+), 102 deletions(-)

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
