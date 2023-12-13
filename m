Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B7F8123A4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Dec 2023 00:59:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDZ8J-0004re-2b;
	Wed, 13 Dec 2023 23:59:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rDZ8G-0004rT-B3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 23:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ob8CvgVrk1WZbkIoZ6UBNnmSgu3zulSWfLiJK83jOqA=; b=Jv3/2dJrApYSFCnyYXCxcGA0ah
 TWTeL3Rt/I/rZSSvHxr9stW34Vd36ZwyicrteG6T0cYD8HYUEBOQV0w/2pO2hSOwQcekjyOUSHpIE
 pRj3iy9sXkDL5vcOpowPhTBgUyG5Jh853B2mf0msWYQ/YQ358orecoAolYyHbGKhM5QQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ob8CvgVrk1WZbkIoZ6UBNnmSgu3zulSWfLiJK83jOqA=; b=f
 waonQZPZAw6gvv/ADQJyW0r+gpmTUNnypFyPhcSj65O8MO0Ts/+6Brkjw9YBwkUsGTx2mkjesjItw
 e+fqR8vO1iF5i0HGJgoC67EwVAYLGOd8D1Aa3EkPHcll7py1P8AvrDfDVOSn2N6WYRM5gTfdh9Oms
 mj9LPE7X49vK3CVY=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rDZ8E-0007hU-RR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 23:59:16 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 923242230E;
 Wed, 13 Dec 2023 23:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702510839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ob8CvgVrk1WZbkIoZ6UBNnmSgu3zulSWfLiJK83jOqA=;
 b=lBwXMd1EPmnGnA8+k3bo5cw3oNB545PNRt2oXQ2MSwXJTDndMTZOmOd2ttgQ80s1sQibOS
 oepcveTHzebyEc5MYn1U/Igq0lEr+9McqN2v6vd99wQwZ7aA2YeGDeUIim24X+MCmU/s/a
 8trlKpAsdITnHkLCYBYFTQJic6UD1QA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702510839;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ob8CvgVrk1WZbkIoZ6UBNnmSgu3zulSWfLiJK83jOqA=;
 b=/jFoUx2kLod1hZkAlOySsxr7piDjHRpp764THDP20gBnCz7XvevHBSZDXL7Mcd8+FM+2MX
 6ZliT/DI8Q4qmXAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702510839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ob8CvgVrk1WZbkIoZ6UBNnmSgu3zulSWfLiJK83jOqA=;
 b=lBwXMd1EPmnGnA8+k3bo5cw3oNB545PNRt2oXQ2MSwXJTDndMTZOmOd2ttgQ80s1sQibOS
 oepcveTHzebyEc5MYn1U/Igq0lEr+9McqN2v6vd99wQwZ7aA2YeGDeUIim24X+MCmU/s/a
 8trlKpAsdITnHkLCYBYFTQJic6UD1QA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702510839;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ob8CvgVrk1WZbkIoZ6UBNnmSgu3zulSWfLiJK83jOqA=;
 b=/jFoUx2kLod1hZkAlOySsxr7piDjHRpp764THDP20gBnCz7XvevHBSZDXL7Mcd8+FM+2MX
 6ZliT/DI8Q4qmXAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4AAA11377F;
 Wed, 13 Dec 2023 23:40:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fLf5C/dAemVXPgAAD6G6ig
 (envelope-from <krisman@suse.de>); Wed, 13 Dec 2023 23:40:39 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Wed, 13 Dec 2023 18:40:23 -0500
Message-ID: <20231213234031.1081-1-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Flag: NO
X-Spam-Score: 3.44
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.44
X-Spamd-Result: default: False [3.44 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.26)[73.73%]
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: When case-insensitive and fscrypt were adapted to work
 together, 
 we moved the code that sets the dentry operations for case-insensitive
 dentries(d_hash
 and d_compare) to happen from a helper inside -> [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rDZ8E-0007hU-RR
Subject: [f2fs-dev] [PATCH 0/8] Revert setting casefolding dentry operations
 through s_d_op
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

It survives fstests encrypt and quick groups without regressions.  Based on v6.7-rc1.

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
 fs/crypto/hooks.c       |  8 ++++++
 fs/dcache.c             | 10 +++++++
 fs/ext4/namei.c         |  1 -
 fs/ext4/super.c         |  3 ++
 fs/f2fs/namei.c         |  1 -
 fs/f2fs/super.c         |  3 ++
 fs/libfs.c              | 64 +++--------------------------------------
 fs/ubifs/dir.c          |  1 -
 include/linux/dcache.h  |  1 +
 include/linux/fs.h      |  2 +-
 include/linux/fscrypt.h | 10 +++----
 12 files changed, 43 insertions(+), 70 deletions(-)

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
