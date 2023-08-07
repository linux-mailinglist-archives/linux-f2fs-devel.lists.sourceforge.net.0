Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4B4772F16
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 21:39:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qT64d-0001RI-8o;
	Mon, 07 Aug 2023 19:39:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qT64c-0001RA-0E
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:39:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MKgBp9oK9I/eGiA5ZFHpYsdGcuADtbCd2AXbZ6/hxtU=; b=L/eXVXodHs3yRR/WWVZuK6paie
 4SJLNONsheQUq/cTF+9y1j77hJlXZ6D9hwiODayJ+AAUB5eKobqHlOpist8lyuo5r718aJupbyNPk
 3sV9jlrvrepn3kVwCyhMJFJIAutTXlySDo+v03hgHKl6WO68JylF1kCn0vowLsNJ1cbo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MKgBp9oK9I/eGiA5ZFHpYsdGcuADtbCd2AXbZ6/hxtU=; b=L2wMGPBlKTLLRJneNFZTnsQzuB
 xWFyAWak+IJUQAkFAHisE3fi8Eny2ApTRkE3Wzqa5KmCnf8hM7FsyIwoC4NSLtCrHKVTRt1xQXyLr
 yRQA3tuhE2zwhvVt1PCFRCH3rEYY+czMmVgOiEfqNW8rFRTuRxkTucFWbDUVkoqej0r0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qT64b-00GNSu-DQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:39:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC37D621D9;
 Mon,  7 Aug 2023 19:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F53C0760F;
 Mon,  7 Aug 2023 19:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691437159;
 bh=w/lSN0ukwva6epMNoVXoGECLFjjw4G/9PpuKUglAlXI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=n+ZsTu28M3VdcwnYvSVxoPse+qwGyO+HkVh5pC077q8BEHXzpiyNNUgAHQPYiFJIS
 j6ZKghZfFnGATLTZj4oxP2NYEGEO7AiSUifGgRP68IlVHDXaWCgn54hYIL0JpmM0p+
 CqLzra1OclcPSOt/Hnsh2xZ1sDfSGHbAsCwHm3aTfTxLNmvkLgEmlZKZJ5/0AUuD+R
 Eqm6CVVkz6y/GuBriAK4Wwi5djQ8NvbLaSPToikNPLCl3fBhu8w7JrnSDO0z49QTWe
 mdzgssplnSDCZhdVt8pPDznGidgkZHlZ4hD7/wgE/28c355BGbe+y20j1GWIEszM3w
 vHVLY1B9cMgXw==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:36 -0400
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-5-d1dec143a704@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=w/lSN0ukwva6epMNoVXoGECLFjjw4G/9PpuKUglAlXI=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug9pI0NrLPqkw/IVc72gm+1CKA4xq0qrZy8b
 uVUq7nnyrmJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPQAKCRAADmhBGVaC
 Fa9OEACCVBv40jfSNekICILFILSv3kfMvSgBhgjGx95YgjXppdwzEyLLlwpSVrSsRV+cftyGpIm
 fAE/yx7Tg45YQHPEAIjZsXv7bmnKzSjeE6SBYRlzajEuRP5jYccKnpHBkFgt3Bm6CzwTXKsc+wP
 P+Os6/rMfvLYhgIRrsw2TynaKTK+KCmkPhLl2MY80nE/IJJDuKyc12CA3WObaND9DMiDvrpFrVy
 +EpTXRHLFTVw9XhkfotB2MTddGG22XE2bX61v2EY7jVHsLfvCexOUHqHERkOMf7sNYTYBNGbQWj
 GDOTlMmoFkepJxCRNTmBrGPvaEWotzG/J/olLjLSwazaPHviKqV6+YswMlUDwNSkpe3Vj9wVLz4
 2q00zgOWKIlzdWwn+HfMColQvMyebLbvGGAipQSNWb31zah3OmKeUULR8PVuszN88ZNHeezNxXA
 hvZpmJoX1eJLN7m8v8Ed43X/VhazgHgNvOCNu7abZkmYVfTwgI40o7Bd9RLXq+64YqOP+YK+z3Q
 Zq+YbwZYcxNUuUpn+Cgp7YHZUbEsahymP2YrmwqP4Xob7knCd5llIT+NhSveXB+ZQWC6fDyX7Ch
 VbhvDGsvPZ+SUd/2o3PDvfQrzxcr0zoGj7FQvhSljVPTCnHDYuqdBgwJjRAwav0+7Gr4YtL69lE
 MReVPilZbhz9ThA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In later patches, we're going to drop the "now" parameter
 from the update_time operation. Fix fat_update_time to fetch its own
 timestamp.
 It turns out that this is easily done by just passing a NULL t [...] 
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
X-Headers-End: 1qT64b-00GNSu-DQ
Subject: [f2fs-dev] [PATCH v7 05/13] fat: make fat_update_time get its own
 timestamp
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
update_time operation. Fix fat_update_time to fetch its own timestamp.
It turns out that this is easily done by just passing a NULL timestamp
pointer to fat_update_time.

Also, it may be that things have changed by the time we get to calling
fat_update_time after checking inode_needs_update_time. Ensure that we
attempt the i_version bump if any of the S_* flags besides S_ATIME are
set.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fat/misc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/fat/misc.c b/fs/fat/misc.c
index 67006ea08db6..8cab87145d63 100644
--- a/fs/fat/misc.c
+++ b/fs/fat/misc.c
@@ -347,14 +347,14 @@ int fat_update_time(struct inode *inode, struct timespec64 *now, int flags)
 		return 0;
 
 	if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
-		fat_truncate_time(inode, now, flags);
+		fat_truncate_time(inode, NULL, flags);
 		if (inode->i_sb->s_flags & SB_LAZYTIME)
 			dirty_flags |= I_DIRTY_TIME;
 		else
 			dirty_flags |= I_DIRTY_SYNC;
 	}
 
-	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
+	if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && inode_maybe_inc_iversion(inode, false))
 		dirty_flags |= I_DIRTY_SYNC;
 
 	__mark_inode_dirty(inode, dirty_flags);

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
