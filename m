Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 890727109D0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 May 2023 12:16:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q281S-0006Q4-SH;
	Thu, 25 May 2023 10:16:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1q281P-0006Ph-Om
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 10:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AasYIWFI1S7OWlc46V78pNTXYji7OAdfudjyszTriMw=; b=hzM+ONIpG5W0eDro9vzDF4a8rG
 jaB7CpG921wCkckvxS6oQE2i/0TVnYg5seUyTUbBzzCFQ1wnKko/t3DzyoMpOBeMP1Jkzb4hxU3z1
 4BvcWdM//B0coALcyEBSh5pFiNHRywuXYiAlzkbqwRw6VKJ1cZUdSs/tQQ4qvK2E6wEU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AasYIWFI1S7OWlc46V78pNTXYji7OAdfudjyszTriMw=; b=U
 qfMMf5Xg6hPAFyl6hJCcsJccBAjrii4tVuA13a4/GVZVkaJIzLwfbq4wu5LZbQKL8r6oz9Bfrv/TF
 U0bqjkJr6igaJe+7rlZ+lHa9d/9gDjl2KD594X99HvbHancnQ2Qks2RzpiiN6El8cHQSnh1EzuBoE
 /gzzYUhWAXVW2rag=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q281I-0029jT-3V for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 10:16:40 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1845B21C08;
 Thu, 25 May 2023 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685009785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AasYIWFI1S7OWlc46V78pNTXYji7OAdfudjyszTriMw=;
 b=mWH844KEiJBA1aZq1NytWIyeLer3NOjjdeY8DR7hO07w3I+IHXnxl+SrS16nEkQV+HZNLb
 uvQESm3OCthfc02m80uTeMbwRov1icKXWebSgS+qwAJvsf1tB3oxK9S69SMJo7ZzuRL5bx
 4aPqc+JZNp4XQyLlMJP9J9WILa14P1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685009785;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AasYIWFI1S7OWlc46V78pNTXYji7OAdfudjyszTriMw=;
 b=JAspCTzdhb5BLxVjzC9E1jjnrPIVPBwaqQKmWOxQR3nZa5P9WH3EGZHOOPI7Qst34zB4uY
 Ma/tFSPgjMV0p8Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0688813A88;
 Thu, 25 May 2023 10:16:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WhMeAXk1b2RJdgAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 25 May 2023 10:16:25 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 52BCDA075C; Thu, 25 May 2023 12:16:24 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu, 25 May 2023 12:16:06 +0200
Message-Id: <20230525100654.15069-1-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241; i=jack@suse.cz;
 h=from:subject:message-id; bh=+SElWakzHXlPrUsPVn2OpQA3AfdfztYzyPNqGfZYghU=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBkbzVdxe0FvekPZapZQzM3DTu4EGJWLISXiQyJth5w
 rhLVGYaJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZG81XQAKCRCcnaoHP2RA2ZJ2CA
 Czq+c06ImKsEJ7Ml6bBcSTNMoqJbKxDWot8ruFWwB69bocSyVn+Et6BD1EWfID+4Su3doANPMimhj5
 Cbct+zb2X5MtEVuocqaqTMhapWmj3EEME6oTzvgw7/yrhpeQygsZ7ZP3LvF/cw52EBdg+nLDfjw+4s
 GHEpw6ZBvokOhfJtpij1FRZIjg621Vq9ryBBY96RL72ubNtjzhSX5CtNTzegajAT9PP9ZR4pk0hI4o
 /NRB9XJ9gZCT4beVEfp8FVQicy9SeVPvR+Iik7L2lVtqV4WXcPl412g0Hfc5hiZ3yqc9ZHRY9ri3HZ
 MA/0r7lOkSYS3I/+tUbULxHeoSaINx
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q281I-0029jT-3V
Subject: [f2fs-dev] [PATCH 0/6] fs: Fix directory corruption when moving
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

								Honza

[1] https://lore.kernel.org/all/20230117123735.un7wbamlbdihninm@quack3
[2] https://lore.kernel.org/all/20230517045836.GA11594@frogsfrogsfrogs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
