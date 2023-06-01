Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 843FB719A62
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 12:58:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4g14-00021H-GD;
	Thu, 01 Jun 2023 10:58:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1q4g10-00020q-1l
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 10:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AOBPab5sBc+U602a0bs2SOLbJwxohD0hSk5muDSlfQg=; b=iEZlx3E5dXZSozquZGIUPX7QuD
 lwpXcVU+k6Dv7if8+wCDIfckDd0G7hM0D2YhZOXWBpxbwGppBht3jrDpeSR25TrJ+czpBYCJ1pUhu
 PlM/hzRt2D5zERY7nngPMILNEXcQI68wFQkHREjtkeDgGaCJradVdvpI0xAdKmMYa3m4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AOBPab5sBc+U602a0bs2SOLbJwxohD0hSk5muDSlfQg=; b=I1lqfqaOcS8dLLlfH15ifV0cEU
 Zm/DUYVL6hz+BRrrhLFminjowzEfsbsGrUMqENSXqSpLH6qIyU7YxRpZb+OZ3IwLUJir+bUPH4ZiH
 sICUs+IQizvtTYHyBKu6Eqlc6GNjMqCCGJbZB59iAHqxjJE7sAm8iZnnn5pzm5a6pH3A=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4g0u-008G6q-5L for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 10:58:46 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ABCB91FDA4;
 Thu,  1 Jun 2023 10:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685617110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOBPab5sBc+U602a0bs2SOLbJwxohD0hSk5muDSlfQg=;
 b=m0aixr+dCqe3K9QfB6/idjG/MQKrA1uRsE+ODOhIApPE30Yn+1bCdVPlWc3cAE0BYLcbNt
 KYF9tnNVKUVnVbCxM28ExF1cZ7pc76e6siluMzm3z/44yM1iP9hFSCstJcYMPzkGq9HQ3k
 G4nRfODLjVS1sXAPocRGR/wz1CnnahY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685617110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOBPab5sBc+U602a0bs2SOLbJwxohD0hSk5muDSlfQg=;
 b=ZjXPEfA/Z6p0tD0pWba6YYhkH+ZxhOKi8Tv7saBw2dmqzSbTDfaZE5tO7b8+il6b40v5bY
 tmKqIcU1kwtFu2Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9757313A34;
 Thu,  1 Jun 2023 10:58:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WjdTJNZ5eGRvWAAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 01 Jun 2023 10:58:30 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 127C7A06F2; Thu,  1 Jun 2023 12:58:30 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu,  1 Jun 2023 12:58:21 +0200
Message-Id: <20230601105830.13168-1-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230601104525.27897-1-jack@suse.cz>
References: <20230601104525.27897-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1467; i=jack@suse.cz;
 h=from:subject; bh=XV5CJdcSgiBkW1x4p8thTfL0TVuanLRiOHdfMG5wLnM=;
 b=owGbwMvMwME4Z+4qdvsUh5uMp9WSGFIqKs8qZLmlpvw48TWHpdA694OFxWeVaLv2zZwfJjl4Hzj9
 Ne5aJ6MxCwMjB4OsmCLL6siL2tfmGXVtDdWQgRnEygQyhYGLUwAmwsDH/k/X8e7htO0Jitt7fN9Nbv
 TO+Z9oc7PXwOSov8BXnTima2z8heFKVlyyGr3ZDFzWDhYWWVsvW5/osepYKtf7f+qeL+2iXDW6PHl/
 BJe4FApfulAz+VFo/28bwyiOltbZUsu/F73dsUDVlfceS/PXqbXTc/7Jz4j7IN4W9lF5s77Mmc0CRn
 eD699+b5rwIO7By67vRpuFF9/WCLr1MrnaXW+Vo8zUHfxum5/MmiJjFLLxRNTFjU92sy9d5VlS1rmI
 V1E38gt76rL95UtsE6ZMcsjxWrd/cbFb9KQDS5eVn0iZuXQTb7Wg1KMA1dd7+g47T4h11IluPa6Q1l
 ARMPl6hU2PbNGaPHe5kr7CeFshAA==
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Remove locking of moved directory in ext4_rename2(). We will
 take care of it in VFS instead. This effectively reverts commit 0813299c586b
 ("ext4: Fix possible corruption when moving a directory") and [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q4g0u-008G6q-5L
Subject: [f2fs-dev] [PATCH v2 1/6] ext4: Remove ext4 locking of moved
 directory
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
 Jan Kara <jack@suse.cz>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Remove locking of moved directory in ext4_rename2(). We will take care
of it in VFS instead. This effectively reverts commit 0813299c586b
("ext4: Fix possible corruption when moving a directory") and followup
fixes.

CC: Ted Tso <tytso@mit.edu>
CC: stable@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/ext4/namei.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 45b579805c95..0caf6c730ce3 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -3834,19 +3834,10 @@ static int ext4_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 			return retval;
 	}
 
-	/*
-	 * We need to protect against old.inode directory getting converted
-	 * from inline directory format into a normal one.
-	 */
-	if (S_ISDIR(old.inode->i_mode))
-		inode_lock_nested(old.inode, I_MUTEX_NONDIR2);
-
 	old.bh = ext4_find_entry(old.dir, &old.dentry->d_name, &old.de,
 				 &old.inlined);
-	if (IS_ERR(old.bh)) {
-		retval = PTR_ERR(old.bh);
-		goto unlock_moved_dir;
-	}
+	if (IS_ERR(old.bh))
+		return PTR_ERR(old.bh);
 
 	/*
 	 *  Check for inode number is _not_ due to possible IO errors.
@@ -4043,10 +4034,6 @@ static int ext4_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	brelse(old.bh);
 	brelse(new.bh);
 
-unlock_moved_dir:
-	if (S_ISDIR(old.inode->i_mode))
-		inode_unlock(old.inode);
-
 	return retval;
 }
 
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
