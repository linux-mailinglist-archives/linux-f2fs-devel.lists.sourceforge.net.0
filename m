Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE84772F19
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 21:39:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qT64o-00056H-5N;
	Mon, 07 Aug 2023 19:39:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qT64l-000564-QC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YCxRPDoHc5l28ZF0D9WR73zHxvxBQdZMPOGpKFcm9WA=; b=WuF16MiXttQMO8XAEBV22FdpBe
 Y8ZHPvSUHj8RSdoIisor5WzHEeNTWpzZ6mCN8tIqWBTlGr3+0nD6FXP5B5GbSqthTUS0MS5duw5Sp
 PfeEqjrjlt/A/D11enzxVswTs9VJG4gGyK3IZzPk6ALgNuxd6WTcLL/2omdwtp9q3M24=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YCxRPDoHc5l28ZF0D9WR73zHxvxBQdZMPOGpKFcm9WA=; b=EKpSID8ksJ8xHqhYhG2syoMxOg
 axOHtwf/et1nSPfjodDpVSVatNIO3H1JhNadRKSatmUNw5EDlV11IIFNbgBmUPaYJ+mJNMTcVegK6
 6WVlQnZ8A1wCp+teIUYzy7BDMySOnwJExhDdfELQbVUdq6wJsevKd622SFPXm3DqP7GA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qT64i-00GNTB-3F for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:39:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 69C9A621DA;
 Mon,  7 Aug 2023 19:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BFCC433AB;
 Mon,  7 Aug 2023 19:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691437165;
 bh=GbRbPLOxHLvc3DeuudVIv0R96Xl/KQh1gZUkLNJwaqw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jyfZZJ6oAnWrzwy6uxMcn981Ztsf8ekdYSTK5OjKoObb52LSWGYUyPDA4kmPqGF1x
 XgdC141GcDjigpVsye6Z2fRW99llsFTyP+IfOKPAc68VweV9PIYC/Q0X43vg8N2M+z
 Az61OjrrYIpqnlx5X/KD2MOToWd0+i939PUFYXt+NeipL/xlWufku7jraVtnp1aZIa
 HYs+6Di3+mpLU5YwTykDK9WTNQJgdVzsmUOkrVgLqaLNB3qJ9kSvdPg+4laJyCR7YJ
 tK4OeZHA9mQJuWModJc5QFspncoFCluv2eVgDmWS58HE9PCjeO01QWlyOyDs3rvs2t
 9FLqopEpWQzeQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:37 -0400
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-6-d1dec143a704@kernel.org>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
In-Reply-To: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, 
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Amir Goldstein <amir73il@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>, 
 Benjamin Coddington <bcodding@redhat.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=996; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=GbRbPLOxHLvc3DeuudVIv0R96Xl/KQh1gZUkLNJwaqw=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug9wCd8uHf1JTgjFwTpewg5ScLm1k4tTu02Y
 EC0/mG6MoaJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPQAKCRAADmhBGVaC
 Fct1EACdouI5B+JSe5rResZvzr2jp0vI9jztehgsnHaGwZpffA5C0T8Yg38sCZ7YdqkMrSalPu3
 w5M7Xcnqdsh4N6Piv9FyxKwRSFhd6L5ltVRVHih3Qrw4CyeqQSC7cF/EoGpJa9WWyMiMRBCPwXS
 SU4LxtVbYmpo45fMxJtALEzmwSMTQIvU1bzpRV4xXlicR54RmnWjkO1z9jdwOxQ6twX9yCYJWhy
 +3XrcrBrTeCS8Z8HreMQGrXDkWsGpGOLe30hRm2zRRGLDwDg58GheX7tI3FJuoWyyPSnXy3GZc3
 IA0WXjumJsnEmtP0TTId+6zh00veQZd5f1GR1l36s9K0aaYaoM1mZs2JdqnG9u0fTI7XR41ftea
 t8+T7wkMIFECd37uaZbjycDqk1RHCXJ9ICgFsL1nEAdkbZL+3Amxg7YLPni5Idxrzm1T01riCL8
 urj0TVjv0LL8Cu70DTcMmlGNYW6HA78KZAiTzBDyB1/8z1iYpiO1fv++ontB2RmfNWnf88B+/uB
 dUK97a5CoO8W1Sg3FRMI1RzkPuF6rcuqwIopnsbtQLtxWCgvC+TTGMRmkaMSjYLODUCN/px7EYj
 1m1keuzLArUPtUidWiCLHEoBgRNimTN+hBNrZNS9Ycr9H0FD7wiIc3WUf0F2tZ/Zb1UbnIJDvl2
 CuiXxVzCtmQDRgA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In later patches, we're going to drop the "now" parameter
 from the update_time operation. Prepare ubifs for this, by having it use the
 new inode_update_timestamps helper. Signed-off-by: Jeff Layton
 <jlayton@kernel.org>
 --- fs/ubifs/file.c | 10 ++-------- 1 file changed, 2 insertions(+),
 8 deletions(-)
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qT64i-00GNTB-3F
Subject: [f2fs-dev] [PATCH v7 06/13] ubifs: have ubifs_update_time use
 inode_update_timestamps
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In later patches, we're going to drop the "now" parameter from the
update_time operation. Prepare ubifs for this, by having it use the new
inode_update_timestamps helper.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ubifs/file.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index df9086b19cd0..2d0178922e19 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1397,15 +1397,9 @@ int ubifs_update_time(struct inode *inode, struct timespec64 *time,
 		return err;
 
 	mutex_lock(&ui->ui_mutex);
-	if (flags & S_ATIME)
-		inode->i_atime = *time;
-	if (flags & S_CTIME)
-		inode_set_ctime_to_ts(inode, *time);
-	if (flags & S_MTIME)
-		inode->i_mtime = *time;
-
-	release = ui->dirty;
+	inode_update_timestamps(inode, flags);
 	__mark_inode_dirty(inode, I_DIRTY_SYNC);
+	release = ui->dirty;
 	mutex_unlock(&ui->ui_mutex);
 	if (release)
 		ubifs_release_budget(c, &req);

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
