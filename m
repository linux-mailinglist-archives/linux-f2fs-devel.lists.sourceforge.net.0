Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB8E852754
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Feb 2024 03:13:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rZiIu-0007p8-RW;
	Tue, 13 Feb 2024 02:13:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rZiIs-0007p2-3p
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 02:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eW78Xuqcn60yMHNbU4RXHh3/QH4X8hmzi2JDB8FI7H8=; b=KBJ04n7gNQlvcvLcVAtPMlvoCO
 vkWJr9fLGnRQQ4+VtjVyVxJEjJ1wvrplmQikWtxRUP35Yz2dg6Fg+uD6a0MQYrLAtzWBDzZsYixjT
 zyFu6+4gYyg+S1FwVYQXI6Lxi534Mi9J9K8ZuauzfqahlnyahZ/wqp/sdCXEs0du4gQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eW78Xuqcn60yMHNbU4RXHh3/QH4X8hmzi2JDB8FI7H8=; b=F
 28argdclX9+qVcASD+IyHmhOW4N6KxT6AlvLoS+vdc+zavD0AuNfii4P7Y2RN3eN7Bq4VYn83C73X
 htcLf4CHkk/R+6KrlBBSBHbQYR8ThEGA7ypSLpC5WgsIQzJ2fxY7mpBKzBIkAKLTdDdPGMbX4VtkW
 gPvZvkg6B6B93eDU=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rZiIo-00023U-Fq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 02:13:46 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17E5B21CE5;
 Tue, 13 Feb 2024 02:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707790411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eW78Xuqcn60yMHNbU4RXHh3/QH4X8hmzi2JDB8FI7H8=;
 b=dqPJlW7jRXJ3k4MaObms8lmszxZQ+4H9u4M8uoLMHQLSwgFTV4sBZMV3wvnhVhfyPYVsla
 /z7zwD8nC6YmRwSDP3+APqCzBMBbeZ/5sfHGxOKnfC2co1CZgYRClxhu93NyVBPsNmRAWo
 o0MbBZP2x4QsCZjBH3iB4HGkr5fMpK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707790411;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eW78Xuqcn60yMHNbU4RXHh3/QH4X8hmzi2JDB8FI7H8=;
 b=fASBLpnQuV23Hh+1jQN6Fv5mwW10avjKOiG9MCrllN4S9iyf145/m87TxMBfeSktIRNTVJ
 QFus0V2P/ZK++VDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707790411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eW78Xuqcn60yMHNbU4RXHh3/QH4X8hmzi2JDB8FI7H8=;
 b=dqPJlW7jRXJ3k4MaObms8lmszxZQ+4H9u4M8uoLMHQLSwgFTV4sBZMV3wvnhVhfyPYVsla
 /z7zwD8nC6YmRwSDP3+APqCzBMBbeZ/5sfHGxOKnfC2co1CZgYRClxhu93NyVBPsNmRAWo
 o0MbBZP2x4QsCZjBH3iB4HGkr5fMpK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707790411;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eW78Xuqcn60yMHNbU4RXHh3/QH4X8hmzi2JDB8FI7H8=;
 b=fASBLpnQuV23Hh+1jQN6Fv5mwW10avjKOiG9MCrllN4S9iyf145/m87TxMBfeSktIRNTVJ
 QFus0V2P/ZK++VDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C314813A4B;
 Tue, 13 Feb 2024 02:13:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zKRmKUrQymX6dwAAD6G6ig
 (envelope-from <krisman@suse.de>); Tue, 13 Feb 2024 02:13:30 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org,
	viro@zeniv.linux.org.uk
Date: Mon, 12 Feb 2024 21:13:11 -0500
Message-ID: <20240213021321.1804-1-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dqPJlW7j;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fASBLpnQ
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[10]; NEURAL_HAM_SHORT(-0.20)[-1.000];
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
 FREEMAIL_CC(0.00)[kernel.org,mit.edu,gmail.com,vger.kernel.org,lists.sourceforge.net,suse.de];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 0.49
X-Rspamd-Queue-Id: 17E5B21CE5
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, v6 of this patchset applying the comments from Eric and
 the suggestion from Christian. Thank you for your feedback. Eric, since this
 is getting close to merging, how do you want to handle it? I will take patch
 1 through my tree already, are you fine if I merge this through unicode or
 do you want to take it through [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rZiIo-00023U-Fq
Subject: [f2fs-dev] [PATCH v6 00/10] Set casefold/fscrypt dentry operations
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, brauner@kernel.org,
 tytso@mit.edu, amir73il@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

v6 of this patchset applying the comments from Eric and the suggestion from
Christian. Thank you for your feedback.

Eric, since this is getting close to merging, how do you want to handle
it? I will take patch 1 through my tree already, are you fine if I merge
this through unicode or do you want to take it through fscrypt?

As usual, this survived fstests on ext4 and f2fs.

Thank you,

---
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
  ovl: Always reject mounting over case-insensitive directories
  fscrypt: Factor out a helper to configure the lookup dentry
  fscrypt: Drop d_revalidate for valid dentries during lookup
  fscrypt: Drop d_revalidate once the key is added
  libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
  libfs: Add helper to choose dentry operations at mount-time
  ext4: Configure dentry operations at dentry-creation time
  f2fs: Configure dentry operations at dentry-creation time
  ubifs: Configure dentry operations at dentry-creation time
  libfs: Drop generic_set_encrypted_ci_d_ops

 fs/crypto/hooks.c       | 15 ++++------
 fs/ext4/namei.c         |  1 -
 fs/ext4/super.c         |  1 +
 fs/f2fs/namei.c         |  1 -
 fs/f2fs/super.c         |  1 +
 fs/libfs.c              | 62 +++++++++++------------------------------
 fs/overlayfs/params.c   | 14 ++++++++--
 fs/ubifs/dir.c          |  1 -
 fs/ubifs/super.c        |  1 +
 include/linux/fs.h      | 11 +++++++-
 include/linux/fscrypt.h | 61 +++++++++++++++++++++++++++++++++++-----
 11 files changed, 100 insertions(+), 69 deletions(-)

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
