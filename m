Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE8E719A61
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 12:58:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4g14-0003rZ-NB;
	Thu, 01 Jun 2023 10:58:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1q4g11-0003rS-1a
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 10:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0DzWy5kExCz1dSPChCQvEKrJzhHmLyM85G+sXWlLMTs=; b=GJ3TgHwjN542usFFXpEkuvDPKF
 rYCqjyVzp80ck4m6JE2KBYhdZuHSng2sYUvC+tWXjjwJUFbLjFCiJlF4qC3qqXnUXHtaJYysCNboM
 TDY4Q94RL6RyB3mhuMUgEx88CzYdvMgq3t0Zxm+geEcQ461UlpZMrBL9IuNj8aasOi90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0DzWy5kExCz1dSPChCQvEKrJzhHmLyM85G+sXWlLMTs=; b=Q
 8NxtdFW/+6GrXjru0q+m+XXyvRtH7AM3dC4L/NnVc1uL400XmrMk/tgZCRWw5JekAHIK6Ed4PBo8r
 9S5C/QzL2N8ODKBCfa4vGPF0imLhfm39xVt8QYO7IhShIl11DhTIwu3mjka8uTz4/TzfkJJb87EWd
 B4Gind+Zu78bcPIQ=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4g0u-008G6r-5E for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 10:58:47 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AEAEA1FDA5;
 Thu,  1 Jun 2023 10:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685617110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0DzWy5kExCz1dSPChCQvEKrJzhHmLyM85G+sXWlLMTs=;
 b=O8fbyQ3Qfgilzk4ztIxRWXNswx8WxStxJH7Ro86uTmTrniGGwYpyAtacV4AvbfMtchEnFK
 7C2xejbwsT+PBZ5P/2MoBAv/Ola39ZDfmsLATy8NeEBSBOCiNGCMX1aLx1s3ZCRWv4jopL
 N1htniSMG77/DaC1/kH67u4cr6gMfMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685617110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0DzWy5kExCz1dSPChCQvEKrJzhHmLyM85G+sXWlLMTs=;
 b=S3Cqa74WhoF+oaTGeRolNYwpAq9Rx53NMUnTdMaZIRewUzrBJgDeIA2gTYcgh51peH0HaG
 40WThMrSNLK/sbBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E13D13A39;
 Thu,  1 Jun 2023 10:58:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BZiUJtZ5eGRxWAAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 01 Jun 2023 10:58:30 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 0DEBBA0754; Thu,  1 Jun 2023 12:58:30 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu,  1 Jun 2023 12:58:20 +0200
Message-Id: <20230601104525.27897-1-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583; i=jack@suse.cz;
 h=from:subject:message-id; bh=A4NuJIA5fRnO81BQCFQ+qouMN01g1n5f8YwBgH7IRjw=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBkeHnEqJRcmewHp/J45UlUgDFD/bRSALsTL4CM7NWS
 Eh9nkW2JATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZHh5xAAKCRCcnaoHP2RA2ZmLB/
 9x4VWtvxhWmDLhsrxitQaHFrtDSoj/0K7wjjyc4b4KJ13VG8n+u2jMsfjFDkVPFhCukC4iWnvbAGvZ
 KsCP9RARf4MI54Qcp5Rnn0UjxjqndVS8ykU4hryIqsuW/gUEw90SSLkVLSwqvdHJSkUvIgupPMjDfy
 jN+hRrVpZhEl4kqu6PEnbHPMNUVWZ2HP3BVViT3MZYqJeiV9Fb2+o5twQ7wTibwcsLjTGiLIbrJuzH
 wpLohc909nVMtxB3h7pBGdTwVQKu8UUPQqEdwszBOnXs/PaCi/d21gfKNr5TneJMd677HOz8cZwlkM
 LfbExF6oneWJCISfoAZ815x3/NufMs
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, this patch set fixes a problem with cross directory
 renames originally reported in [1]. To quickly sum it up some filesystems
 (so far we know at least about ext4, udf, f2fs, ocfs2, likely also reiserf
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q4g0u-008G6r-5E
Subject: [f2fs-dev] [PATCH v2 0/6] fs: Fix directory corruption when moving
 directories
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
Cc: Christian Brauner <brauner@kernel.org>, Ted Tso <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 Jan Kara <jack@suse.cz>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

this patch set fixes a problem with cross directory renames originally reported
in [1]. To quickly sum it up some filesystems (so far we know at least about
ext4, udf, f2fs, ocfs2, likely also reiserfs, gfs2 and others) need to lock the
directory when it is being renamed into another directory. This is because we
need to update the parent pointer in the directory in that case and if that
races with other operation on the directory (in particular a conversion from
one directory format into another), bad things can happen.

So far we've done the locking in the filesystem code but recently Darrick
pointed out [2] that we've missed the RENAME_EXCHANGE case in our ext4 fix.
That one is particularly nasty because RENAME_EXCHANGE can arbitrarily mix
regular files and directories and proper lock ordering is not achievable in the
filesystems alone.

This patch set adds locking into vfs_rename() so that not only parent
directories but also moved inodes (regardless whether they are directories or
not) are locked when calling into the filesystem.

Changes since v1:
* Made sure lock_two_inodes() uses subclass1 for the obtained lock in case
  there is only one inode locked
* Fixes unlocked_two_nondirectories() to properly unlock inodes even if
  directories are accidentally passed in.

								Honza

[1] https://lore.kernel.org/all/20230117123735.un7wbamlbdihninm@quack3
[2] https://lore.kernel.org/all/20230517045836.GA11594@frogsfrogsfrogs

Previous versions:
Link: http://lore.kernel.org/r/20230525100654.15069-1-jack@suse.cz # v1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
