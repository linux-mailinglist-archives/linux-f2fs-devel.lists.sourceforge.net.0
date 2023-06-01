Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC91719A5F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 12:58:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4g13-0005n9-Bh;
	Thu, 01 Jun 2023 10:58:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1q4g12-0005mw-KR
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 10:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ioHF3wJZOEdK9Zi2g8x0HxHqMAZdyIP3moICR5/W8ZM=; b=NX6ieR6dXW8ducxKSEDBj76E4M
 PjAVJzbBmrxRYP158fTSSB+QTyYpMh6NDL2lz3IslKDffypEK67nNKRTjtIxOr6mk9RTYS7Sy3Iyb
 bvYpmOUIymW0r4VqOJkfOll9Q6uYeXTOuNwFj5/jIV9K6b4Qbr7z5pTuAY7y4Y508UlQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ioHF3wJZOEdK9Zi2g8x0HxHqMAZdyIP3moICR5/W8ZM=; b=LskfAmr4HUU0cA8m2CCy/S50d4
 OwOhU6bxgbbVI282xUpVhh8mjZVZ/3wQKCJ2qmpp1/eySsmobNvP15ci551/nPBj15YI0o+GGe1Q6
 onaURTm6PAMQz8EhDf0p9r04bL/jJ5qX+hzZyQZ654l4Kc+itjZom4If/SGL/+9hWtj4=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4g0z-0005t0-9j for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 10:58:48 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9CA741FDA3;
 Thu,  1 Jun 2023 10:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685617110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ioHF3wJZOEdK9Zi2g8x0HxHqMAZdyIP3moICR5/W8ZM=;
 b=AMqfoQG+Oqjn4ZqNhHx+B0BDjqiyhV8yIbX3yzJbvq3FNyYQfdfufCQFRg0anXY2Czp8Ld
 LJNCdivx4JGpOmLRTntSNnx7L/a2XoSCRJekq15ccyjFrvAaNCf0tp05GBPty7EcyJ4HvC
 2UWijpfiNW2KRbcLlH62o62KCQXB2ZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685617110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ioHF3wJZOEdK9Zi2g8x0HxHqMAZdyIP3moICR5/W8ZM=;
 b=g6E4r15cOMFlrWtQmecf7LGmqF15nLLRfnb0JE+2kjFsYt+vJumZnB9H3ENlitVeHBAXQT
 BuySk7STrx6wPXDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E09F13441;
 Thu,  1 Jun 2023 10:58:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uUi2ItZ5eGRuWAAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 01 Jun 2023 10:58:30 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 17082A075C; Thu,  1 Jun 2023 12:58:30 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu,  1 Jun 2023 12:58:22 +0200
Message-Id: <20230601105830.13168-2-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230601104525.27897-1-jack@suse.cz>
References: <20230601104525.27897-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1840; i=jack@suse.cz;
 h=from:subject; bh=cUFu/3mUBi4bt/K+j6IZ3Ng8iPItrjlJa92MM2nlCwY=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBkeHnOIPd8xE0p+HpULv7ZaonyuahLzBKAgbz88fay
 PJv6AsKJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZHh5zgAKCRCcnaoHP2RA2QysCA
 CTIL3by4FVm7WFw+onDgoqu8NeITyZA2OomlK2x/zMpGpAxU2bz3Ofz3PeZubavF2I9MoQWxdk+pWa
 RYbSbJui5ntaXx5C0j16m552h7dRKKOxBW7gb9xde7hP5jMPO7WYgLo+5d8ZcBUWHBlCfWmIa33Ux+
 fCNk4AbSKt01GVTTdUV47s++JoTwJC1SFAM7YYNlIMbS/zMO1Q6QCH8neqeNaL2wTcPZD9CvXB4vYI
 q42iN5IBmGVsEoKZURp+YLUyXMETAn6Jn/yAptPq+hiSjg79nvYaEzukgMynxraFCSD4q1r28ZjcMW
 jzWw6gfSHe3ui3HXZ0VDAoaQ1F7rjY
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit f950fd0529130a617b3da526da9fb6a896ce87c2.
 The locking is going to be provided by vfs_rename() in the following patches.
 CC: stable@vger.kernel.org Signed-off-by: Jan Kara <jack@suse.cz> ---
 fs/udf/namei.c
 | 14 ++ 1 file changed, 2 insertions(+), 12 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
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
X-Headers-End: 1q4g0z-0005t0-9j
Subject: [f2fs-dev] [PATCH v2 2/6] Revert "udf: Protect rename against
 modification of moved directory"
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

This reverts commit f950fd0529130a617b3da526da9fb6a896ce87c2. The
locking is going to be provided by vfs_rename() in the following
patches.

CC: stable@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/udf/namei.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/fs/udf/namei.c b/fs/udf/namei.c
index fd20423d3ed2..fd29a66e7241 100644
--- a/fs/udf/namei.c
+++ b/fs/udf/namei.c
@@ -793,11 +793,6 @@ static int udf_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 			if (!empty_dir(new_inode))
 				goto out_oiter;
 		}
-		/*
-		 * We need to protect against old_inode getting converted from
-		 * ICB to normal directory.
-		 */
-		inode_lock_nested(old_inode, I_MUTEX_NONDIR2);
 		retval = udf_fiiter_find_entry(old_inode, &dotdot_name,
 					       &diriter);
 		if (retval == -ENOENT) {
@@ -806,10 +801,8 @@ static int udf_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 				old_inode->i_ino);
 			retval = -EFSCORRUPTED;
 		}
-		if (retval) {
-			inode_unlock(old_inode);
+		if (retval)
 			goto out_oiter;
-		}
 		has_diriter = true;
 		tloc = lelb_to_cpu(diriter.fi.icb.extLocation);
 		if (udf_get_lb_pblock(old_inode->i_sb, &tloc, 0) !=
@@ -889,7 +882,6 @@ static int udf_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 			       udf_dir_entry_len(&diriter.fi));
 		udf_fiiter_write_fi(&diriter, NULL);
 		udf_fiiter_release(&diriter);
-		inode_unlock(old_inode);
 
 		inode_dec_link_count(old_dir);
 		if (new_inode)
@@ -901,10 +893,8 @@ static int udf_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	}
 	return 0;
 out_oiter:
-	if (has_diriter) {
+	if (has_diriter)
 		udf_fiiter_release(&diriter);
-		inode_unlock(old_inode);
-	}
 	udf_fiiter_release(&oiter);
 
 	return retval;
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
