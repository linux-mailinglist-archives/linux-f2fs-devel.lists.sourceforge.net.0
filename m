Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84302D26C35
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:49:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKa8q3lhgkY606L/DAztz+UdJ/ssl/xtPknmbR/idjg=; b=S8VNBfHsZjTxHT2vOERqVnyVlh
	0pUoMT1ZvO8exfpU0aJr+nPesiX9fQo4nSegqaR1T7UCyVX/Y9iIc3Pq7zHLsQfk2/8J/NAeIQgmS
	1/mcnL3ny7a0WlbMGQ7bwRxkjF7FkYhns4cJtFybmApIc5liRcReMXMcsUK+R9mzLn90=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRT4-00060Z-84;
	Thu, 15 Jan 2026 17:49:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRT2-0005zj-Ep;
 Thu, 15 Jan 2026 17:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tbaS2GnYHC3Yw0jcd4OE6CDNnF+8x4KkNvfYkhEmmgI=; b=MgJheXkDRfoFTj2jbtoRZTso6e
 Q67b+5soDlwNa27q3pGnsRYbIoQBX7jSdprgqjWsPQcUgj3ZiiD8BuTvPJbK0nK5VoJl4oMsqst0Z
 n+S/9h0ydlAhD/WAiO4pqKi3bvu4n0ioC+9DrhoWfcVjivO3VBs63fnEZpdexwq+e9VY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tbaS2GnYHC3Yw0jcd4OE6CDNnF+8x4KkNvfYkhEmmgI=; b=dBfz/QW1eO3SY7d/whfeBzNIpl
 R9YEd43s+ULDpctYd5sJswqAYgs4dQg9ZpfyX8fAnXgRbAnxJQuPTr9HBBoqc1Z+DoUJHNSexBL3w
 ou4Of8jCpATUDVpIsB3xBParS27uszUBqse+uiaN5GhXdIMdBsRH1w4t/XUDXuWL3I6E=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRT1-0007fE-Ui; Thu, 15 Jan 2026 17:49:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3CC976015E;
 Thu, 15 Jan 2026 17:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C9FC19422;
 Thu, 15 Jan 2026 17:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499341;
 bh=kXEhnrEqBGLUfKXF9oxTrDiEyMD/rJY/BOIQHOiqT1U=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=VhGTowRv1ZdCSbwrP6fIZLhAzqz52dHubpyKszBLI7URAG7W6SPZKGF3KIn0U2zg+
 5tVYEGsuwDF0mJJELm7H4UgOFOZa8Rmf73fjwJHRZQODsuh4NDe4N42RJqo5k0t/Ox
 wk0Zyo9z0NB4J2vm9kg+NAPOl3NU2G13g328/x0Ky/AmMH30Duw5NUr8i6JtfOedpq
 J5Dm+VWr3ls784CODv1E8lo+kwt8rHWrmv7tNk1pSucEBPQyhieOVhKlDaTv3/dxrS
 mFXsnQgF2g22EioMuqnjQY2fJpwhESYq4WgT9lyV5RHSiQDikgxbfcTKxzQfqZwGW+
 WoFqmmRBqrJHA==
Date: Thu, 15 Jan 2026 12:47:40 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-9-8e80160e3c0c@kernel.org>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
To: Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, Amir Goldstein <amir73il@gmail.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
 Chunhai Guo <guochunhai@vivo.com>, Carlos Maiolino <cem@kernel.org>, 
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>, 
 David Sterba <dsterba@suse.com>, Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, 
 Bharath SM <bharathsm@microsoft.com>, Miklos Szeredi <miklos@szeredi.hu>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, Mark Fasheh <mark@fasheh.com>, 
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Dave Kleikamp <shaggy@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
 Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Jaegeuk Kim <jaegeuk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=678; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=kXEhnrEqBGLUfKXF9oxTrDiEyMD/rJY/BOIQHOiqT1U=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShG89hcHuGwJsd2BxAERNQ67iytfM88cVk1v
 a8CNYB6vTCJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoRgAKCRAADmhBGVaC
 FfdyEACPSGL8gQMZBDLdHovcBu5qSm6pu4yGdMYyroq6SWbbG9R0Q5Q2XtDnm7GKMnylAUV/7eD
 76S6FhEf7x/OgCgs8sl5VNhrQ1fFRq2rMYx2v6XOqKiCyRShojkXZw/Hxwof17Gk/IYLjwdZqim
 VUVSQ/pSZy3CqJLm0BXUsMs+kCLPzF5G8ZkLT+BNwDGC3KZwhB0HtOut2eYvgwYxWSnQGjV5v/9
 txa5IckHztnGFocaKw9dBZj2YbgWQs37r7LRAJZsmPoSO08Rqu7zr+Z0BtWAAvznqYRu+cQoycT
 41wkc56BHYvd4UFgUOM+7TjEbXnVfuX0u7VdrLQ8esaCm2oh4x8HfqZ+Zt1Yhzn5xhV+bFqmu/t
 D7mX3Pfblk6hCjPdSYPsj5IwLEIKpxUwKcPwOofceq+p4s8f3HXix9p/EPS7PVP2XzgAebYNNAM
 VJxrqtcHumJplzhU9CGlzT3Kob2C/sZ7FqRoMsZGZMRUoQ5MUQX9iFNSVEhAzTf6S5DsYJ9MYse
 c4Chhe+FV8WHQsMBHumIIWiOuHDgPOEeauU1sQlYQDU6HwaQ/bEdxHShDeA7b+/riW4JH/ASR5x
 OGlR2kuII9fCsvYL2J9mVdHOCwyAWITJMJ1OBaJp+VAyA1otLqh9rgT9NK7BlTdb1x13X84Xofs
 i45vrL1rJ67tEoA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to btrfs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/btrfs/export.c | 1 + 1 file changed,
 1 insertion(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgRT1-0007fE-Ui
Subject: [f2fs-dev] [PATCH 09/29] btrfs: add EXPORT_OP_STABLE_HANDLES flag
 to export operations
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
From: Jeff Layton via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jeff Layton <jlayton@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add the EXPORT_OP_STABLE_HANDLES flag to btrfs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/btrfs/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/btrfs/export.c b/fs/btrfs/export.c
index 230d9326b685c4e12dc0fffd4a86ebba68a55bd6..14b688849ce406b2f784015afced2c29422ab6c3 100644
--- a/fs/btrfs/export.c
+++ b/fs/btrfs/export.c
@@ -304,4 +304,5 @@ const struct export_operations btrfs_export_ops = {
 	.fh_to_parent	= btrfs_fh_to_parent,
 	.get_parent	= btrfs_get_parent,
 	.get_name	= btrfs_get_name,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
