Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D898772F14
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 21:39:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qT64X-00055O-8Y;
	Mon, 07 Aug 2023 19:39:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qT64V-00055I-Ju
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R6vlvmLUvKOZulfJ+YX7AeQubON0sqkk/2/xliZw3ps=; b=hiZlVP5uKNIgk4NK8pOCwWH50b
 2RdAJ1vf2t/VXsNfz0BRO3yTs+qTG3keQIS8CIN0VHzKzdka88alStNYmmyE/6teHVorPYCVEPN4I
 HW+mqHpprbbzwWZ4meU9p9mq7Vn9g+9pjteWqqUYJw+JGL8PR+p6E22Wa9twTRmC2O2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R6vlvmLUvKOZulfJ+YX7AeQubON0sqkk/2/xliZw3ps=; b=VFjXYcTRt8ywQiCeQPl9plgxx7
 +DKe9TFt79PxQyAgNWFUXHZFTlaTQqCPw0rrlvzJ+KazyIahtpXStpkfVO9GxFgfxhSQSEQVMeOqo
 iAiMtnt3LLQpWfN4dEAdVlucvsdW/LaMEPkaDuOgxsoUFXMSX784Jf6FQY6qmI3g2BBs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qT64U-0002c0-Uq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:39:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E171621CB;
 Mon,  7 Aug 2023 19:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190D6C433CB;
 Mon,  7 Aug 2023 19:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691437152;
 bh=FjK4CXRYiETGn7OzM9We0k7POLcZSDg/Zv0Z2hVxi0I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ho/bKlx1W7NVzVpTF8gn0UewKv0nHppAuc8rdt0EpJYDtixyqx9Pm88/s99GjJrGi
 VyWirQXhlLAHTHZVHTzlGto3MlaV9AC0IS4d6ITtkzLyremJTCyhuBghtZLgXI+wFI
 BWGm+mORoGztRukCVECswMBc3DvEXZDbVqOKZXPaUiWJUmCkRudhYLBAFuaGRz0svy
 C36sqbKO7RSDcSDE/CGOWo0cEGgTtCDEY05Q94XhMpgiKRb5sItIEiDQCoyYVBZcIf
 Wa4V9O81hy5cBvQhbAwM4fAHf3aZVD4FS2Awad7m8GiNGAzXgq+KA8NdanYEf8qWKH
 93tAXs2YealYw==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:35 -0400
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-4-d1dec143a704@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=FjK4CXRYiETGn7OzM9We0k7POLcZSDg/Zv0Z2hVxi0I=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug9ionAyEQ00FE2RysKd05kyYmr3Uo7M3P+S
 fZsake1O9WJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPQAKCRAADmhBGVaC
 FSb/D/46K68INm7LKy6yCb3jkxB2bvd3492M0QuN7zYTdZH4x4RyMrHVer1FcL+lgqeruzzWSEv
 f1jPsb2uT+va62GuDI/zejA857D6P77Pxxt62BL6PnF8w9wZfjNo2RBhUJFbcYvEl7WV0QxsBOz
 eVhLOFWlIfBl7qnRoQcQ1EXt/gqm3vncmzxpOhadSWSyAjf3Uyf3ySH1I8zBuzQ6i19jmqQ0RvT
 bb3mEN/W/iBYc3G76Eud3bo16w9EvoB9nxjRlcTuuZvFPC7ModhHKFVftanzKrqnN++LssBxJTt
 qCOGvNDD4XQsoYkNqWK/GeE2dbwuRgBPiPB4T/mRNQGXzoSkgEejZgIlG9UhkKivUvI8mAD1Fvf
 EsZs1aXtF60wPVfCdR9EzkWR98DlT7wHqFko2/J5x3ayqhk5/Hd7Dxd9+3KOUjobqgsNV6z/0hu
 iEa0QiZI9t2vkWtpHGQNGJWoW5i6lWMNl2ugTM4Ph4rAECf19PhJ6QMCL6sLB1t/Yg+5Y9QCkZa
 u6JThQBEJCg3b3v0vqUh9tAePT84Au/SSSO41CUtR4p6gYotqAK/13vCIRlgBGFlSFirEva3rSu
 O4r5y/T/dIV3T3tPLC2QfaJLzkymk/JC3a+VkmmiF/LAO2Y1vQ5KE1bfV2hX76K1OaxCpRxc3+Z
 GjdlHLhrXMsZpbw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In later patches, we're going to drop the "now" argument from
 the update_time operation. Have btrfs_update_time use the new
 inode_update_timestamps
 helper to fetch a new timestamp and update it proper [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qT64U-0002c0-Uq
Subject: [f2fs-dev] [PATCH v7 04/13] btrfs: have it use
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

In later patches, we're going to drop the "now" argument from the
update_time operation. Have btrfs_update_time use the new
inode_update_timestamps helper to fetch a new timestamp and update it
properly.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/btrfs/inode.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 29a20f828dda..d52e7d64570a 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -6068,14 +6068,7 @@ static int btrfs_update_time(struct inode *inode, struct timespec64 *now,
 	if (btrfs_root_readonly(root))
 		return -EROFS;
 
-	if (flags & S_VERSION)
-		dirty |= inode_maybe_inc_iversion(inode, dirty);
-	if (flags & S_CTIME)
-		inode_set_ctime_to_ts(inode, *now);
-	if (flags & S_MTIME)
-		inode->i_mtime = *now;
-	if (flags & S_ATIME)
-		inode->i_atime = *now;
+	dirty = inode_update_timestamps(inode, flags);
 	return dirty ? btrfs_dirty_inode(BTRFS_I(inode)) : 0;
 }
 

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
