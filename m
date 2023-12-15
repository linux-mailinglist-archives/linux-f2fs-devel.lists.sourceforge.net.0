Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1031E8151BD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Dec 2023 22:16:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEFXq-0000wE-MY;
	Fri, 15 Dec 2023 21:16:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rEFXo-0000w8-La
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Dec 2023 21:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=siiQi0l3HPgOTyfS8bfejQowYIqGvfKOt4TSjOIRilY=; b=c3LS/C9JER3grePyBCUTVvyOor
 QMh7ZIpAZTOGA9joZSNdjZJ4IIwH39Bd+RV1xNk88KUIDqEf73wltEEGQZcW/Z+wQQ/upqrb5GN7y
 B9YRig9AMgtvvNyMWc1hxOmxOoHRoYliNAgHCo/v5MtzAdUO/ge8p/YWz64aNAToTXwU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=siiQi0l3HPgOTyfS8bfejQowYIqGvfKOt4TSjOIRilY=; b=L
 /U4g7a6xmsKVEEtGIL0t589hfMy9e33EBjcgJaIBYPGuvUlI11zbRePa8Jt5z85manMOy5xnkERgx
 gS6bewB4JvQjWR7o7XyioBFBF018GUg5Ty0Qp0sa18rmh25m4AcRf319ZP17AA3kbJBApUBocCDfX
 ZizS768ef12rdvcs=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rEFXl-0001QK-O6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Dec 2023 21:16:28 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8F3A71F855;
 Fri, 15 Dec 2023 21:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702674975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=siiQi0l3HPgOTyfS8bfejQowYIqGvfKOt4TSjOIRilY=;
 b=viAer6Isn5l9Q9+1KR4Bx0dIztu4psYULFnXB0kdgpW9Xv65EldLWDrByRIZ3AFt1ccfon
 E/1DovrmUoCvuMJY41FtHuACFfISfEyLz9Jx1zBHqDtUC8J/AEvSWadRpqo+w82FFlXT+N
 RnWFQv8oezb/2zJzyquESuNN+DPw1gs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702674975;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=siiQi0l3HPgOTyfS8bfejQowYIqGvfKOt4TSjOIRilY=;
 b=QrGP59XZGVmOMKHgCEg4ZwIvYd+yvsF2L/ufeWgZnIvfn4T64mRDmmQw7hAY6ap5gav9xg
 L8hGAdVwFzkDk4CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702674975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=siiQi0l3HPgOTyfS8bfejQowYIqGvfKOt4TSjOIRilY=;
 b=viAer6Isn5l9Q9+1KR4Bx0dIztu4psYULFnXB0kdgpW9Xv65EldLWDrByRIZ3AFt1ccfon
 E/1DovrmUoCvuMJY41FtHuACFfISfEyLz9Jx1zBHqDtUC8J/AEvSWadRpqo+w82FFlXT+N
 RnWFQv8oezb/2zJzyquESuNN+DPw1gs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702674975;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=siiQi0l3HPgOTyfS8bfejQowYIqGvfKOt4TSjOIRilY=;
 b=QrGP59XZGVmOMKHgCEg4ZwIvYd+yvsF2L/ufeWgZnIvfn4T64mRDmmQw7hAY6ap5gav9xg
 L8hGAdVwFzkDk4CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C973137D4;
 Fri, 15 Dec 2023 21:16:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id K/aeCx/CfGWCOQAAD6G6ig
 (envelope-from <krisman@suse.de>); Fri, 15 Dec 2023 21:16:15 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Fri, 15 Dec 2023 16:16:00 -0500
Message-ID: <20231215211608.6449-1-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.44
X-Spamd-Bar: ++++
X-Spam-Flag: NO
X-Spamd-Result: default: False [4.44 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.25)[73.12%];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=viAer6Is;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QrGP59XZ
X-Spam-Level: ****
X-Rspamd-Queue-Id: 8F3A71F855
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  [Apologies for the quick spin of a v2. The only difference
 are a couple fixes to the build when CONFIG_UNICODE=n caught by LKP and
 detailed
 in each patch changelog.] When case-insensitive and fscrypt were adapted
 to work together,
 we moved the code that sets the dentry operations for case-insensitive
 dentries(d_hash and d_compare) to happen from a helper inside -> [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEFXl-0001QK-O6
Subject: [f2fs-dev] [PATCH v2 0/8] Revert setting casefolding dentry
 operations through s_d_op
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
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[Apologies for the quick spin of a v2.  The only difference are a couple
fixes to the build when CONFIG_UNICODE=n caught by LKP and detailed in
each patch changelog.]

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

Gabriel Krisman Bertazi (8):
  dcache: Add helper to disable d_revalidate for a specific dentry
  fscrypt: Drop d_revalidate if key is available
  libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
  libfs: Expose generic_ci_dentry_ops outside of libfs
  ext4: Set the case-insensitive dentry operations through ->s_d_op
  f2fs: Set the case-insensitive dentry operations through ->s_d_op
  libfs: Don't support setting casefold operations during lookup
  fscrypt: Move d_revalidate configuration back into fscrypt

 fs/crypto/fname.c       |  9 +++++-
 fs/crypto/hooks.c       |  8 +++++
 fs/dcache.c             | 10 +++++++
 fs/ext4/namei.c         |  1 -
 fs/ext4/super.c         |  5 ++++
 fs/f2fs/namei.c         |  1 -
 fs/f2fs/super.c         |  5 ++++
 fs/libfs.c              | 66 ++---------------------------------------
 fs/ubifs/dir.c          |  1 -
 include/linux/dcache.h  |  1 +
 include/linux/fs.h      |  2 +-
 include/linux/fscrypt.h | 10 +++----
 12 files changed, 45 insertions(+), 74 deletions(-)

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
