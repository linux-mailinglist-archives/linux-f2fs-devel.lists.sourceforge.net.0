Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0CD84147A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 21:43:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUYTu-0002IW-55;
	Mon, 29 Jan 2024 20:43:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rUYTs-0002IP-C3
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gafjaukDasr5oQuNWIkTl8VbHZftkVo7vNgh9ZWycDc=; b=D2RqGHe/7volW24h48LeqOaEjt
 RMPYXDBkI2SABO1MnR59WbN61njpdZ99st27a6+P+XIKF4NTxNW48ICVvQgCa6/LSM7UNNMlLTj9Q
 Q0V/cqmBDt7b0JIU58DsyNNQXXg7ioIrWJYzpisofhM3q2g2M+9sesT+mqICHUSUjv1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gafjaukDasr5oQuNWIkTl8VbHZftkVo7vNgh9ZWycDc=; b=W
 cNpmUCM93VY3iUmgQLU70vhJp0P7mYmTBQP6P2hB7sRuItS77mhwLhlt3Fys85rSFNT8ejjhLlbtJ
 KPGrKYNV3zB55PWN4B/vQ/lpgGftpvMe31Wjs/YGMtzXwaPM5tzbzNAisDT1UNTXZR6lZ4BjDIqCt
 prFzr4rVOGcQb6n0=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rUYTp-0000Yp-Tu for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:43:48 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 02B9621E90;
 Mon, 29 Jan 2024 20:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706561015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gafjaukDasr5oQuNWIkTl8VbHZftkVo7vNgh9ZWycDc=;
 b=Y13LX74e6Iz11+VN5UxxZlMdkJ11bbWANbBANCg5zX3m9OJDPXXOmKBL2A2QCz/iX1tpi+
 YrBSuL32IUAW0Ur8mcCFsvZIStwK8p8nHMCITudkbOgykzCraNwyHhSm8vwloD7dz4Ko/i
 kD4o4kYMe2Tgw6V2pvEJc6tBraAJtZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706561015;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gafjaukDasr5oQuNWIkTl8VbHZftkVo7vNgh9ZWycDc=;
 b=JjqX9IRlapCI+n7hKlhomBoPixESwOWCP9ECYF+pjnOo66jIzgQii+7HZdrL735VLpQs9Y
 YWXlPdScEox3ZlBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706561015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gafjaukDasr5oQuNWIkTl8VbHZftkVo7vNgh9ZWycDc=;
 b=Y13LX74e6Iz11+VN5UxxZlMdkJ11bbWANbBANCg5zX3m9OJDPXXOmKBL2A2QCz/iX1tpi+
 YrBSuL32IUAW0Ur8mcCFsvZIStwK8p8nHMCITudkbOgykzCraNwyHhSm8vwloD7dz4Ko/i
 kD4o4kYMe2Tgw6V2pvEJc6tBraAJtZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706561015;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gafjaukDasr5oQuNWIkTl8VbHZftkVo7vNgh9ZWycDc=;
 b=JjqX9IRlapCI+n7hKlhomBoPixESwOWCP9ECYF+pjnOo66jIzgQii+7HZdrL735VLpQs9Y
 YWXlPdScEox3ZlBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E51012FF7;
 Mon, 29 Jan 2024 20:43:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YoUnEfYNuGW5DAAAD6G6ig
 (envelope-from <krisman@suse.de>); Mon, 29 Jan 2024 20:43:34 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Mon, 29 Jan 2024 17:43:18 -0300
Message-ID: <20240129204330.32346-1-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[9];
 MID_CONTAINS_FROM(1.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,suse.de];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Sorry for the quick respin. The only difference from v4
 is that we change the way we check for relevant dentries during a d_move,
 as suggested by Eric. The v5 of this patchset addresses the issues Eric
 pointed
 out in the previous version. The patch merging the fscrypt lookup helpers
 was completely rewritten to avoid the race condition; We also now re [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUYTp-0000Yp-Tu
Subject: [f2fs-dev] [PATCH v5 00/12] Set casefold/fscrypt dentry operations
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 amir73il@gmail.com, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Sorry for the quick respin. The only difference from v4 is that we
change the way we check for relevant dentries during a d_move, as
suggested by Eric.

The v5 of this patchset addresses the issues Eric pointed out in the
previous version.  The patch merging the fscrypt lookup helpers was
completely rewritten to avoid the race condition; We also now return
immediately from __fscrypt_handle_d_move; Finally, the overlayfs patch
message was improved.  Further details can be found on the changelog of
each patch.

As usual, this survived fstests on ext4 and f2fs.

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

Gabriel Krisman Bertazi (12):
  ovl: Reject mounting over case-insensitive directories
  fscrypt: Factor out a helper to configure the lookup dentry
  fscrypt: Call fscrypt_prepare_lookup_dentry on unencrypted dentries
  fscrypt: Drop d_revalidate for valid dentries during lookup
  fscrypt: Drop d_revalidate once the key is added
  fscrypt: Ignore plaintext dentries during d_move
  libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
  libfs: Add helper to choose dentry operations at mount-time
  ext4: Configure dentry operations at dentry-creation time
  f2fs: Configure dentry operations at dentry-creation time
  ubifs: Configure dentry operations at dentry-creation time
  libfs: Drop generic_set_encrypted_ci_d_ops

 fs/crypto/hooks.c       | 28 +++-----------
 fs/ext4/namei.c         |  1 -
 fs/ext4/super.c         |  1 +
 fs/f2fs/namei.c         |  1 -
 fs/f2fs/super.c         |  1 +
 fs/libfs.c              | 62 +++++++++---------------------
 fs/overlayfs/params.c   | 14 +++++--
 fs/ubifs/dir.c          |  1 -
 fs/ubifs/super.c        |  1 +
 include/linux/fs.h      | 11 +++++-
 include/linux/fscrypt.h | 83 ++++++++++++++++++++++++++++++-----------
 11 files changed, 108 insertions(+), 96 deletions(-)

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
