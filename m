Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0CDD3B0DD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:29:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNLt5/66A3GftebMFsIZGfx5ubvB71d2txUaGTrfZd0=; b=iZLyTxZ/9zaQSHAjxLZPyN83yf
	JO0Vf6hMORGgotZEAmtNrG7mbbTRLZTVje7ZI0Rbt6Wi1Ned0KZIedVxEjetnqvFCwLrNRnDiDWdR
	W0S3z0BPu6chxL9Ll3zLt2qCG3Eo+UjFGhJupbFSXJgWVutSI76i9mROVUy9GX9R4gKk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs7z-0005Sb-Gf;
	Mon, 19 Jan 2026 16:29:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs7x-0005S8-P1;
 Mon, 19 Jan 2026 16:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Re6nnZH5SOOtweYNC6i0xBdtjjagVEySFsoYsbDZ7kY=; b=maYMNvrESptLQXulO233tNKWSZ
 1z2tQPbKWJCIU1VUSsRmsXFXMEaamnDrKOfgTLsqtJFUoQzU+6U+P6Spo9VeTysvsxcAdPU+bYunp
 dAtIWT9+O/XrE9uZPSlkIBygQqYYVbvux//eEDrWNlcH6PNehqAI9I1VWI1yn7u7Z0Zc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Re6nnZH5SOOtweYNC6i0xBdtjjagVEySFsoYsbDZ7kY=; b=VvvK2weIx6NNd/6DUH2wYfhNYb
 wx67vcvkniX0vELRAqGkNNHp+aSe6/I9S2RdF263p5KWxD4FDjy94CN8dyuHntsWwaAVe3zWLnjiY
 f3dL28/lsVDltYPXlvEMaAQz0Ab0fBQXJWhwhclENZglHWB+AUrUI3Yo96vejdAmHS1E=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs7s-0007uO-NQ; Mon, 19 Jan 2026 16:29:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5D1C74450B;
 Mon, 19 Jan 2026 16:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A54BC2BC87;
 Mon, 19 Jan 2026 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840147;
 bh=AZAjr5blB9svvv4iy5pFFBzbvOqXSLNmipoZVSEtwIs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JRT/TJNWCbMyt7yIyaTJly6FUhnDZuUxeZSzJVjN/nYS1ps9R0rsJvuhvNTrEk+la
 1UOENFRaQ+Za0kHHt9AfFI6lZT3tyk/oWRcUSErofVbPjhO/YFqxhdt8WsPnnCiwPM
 ItMD9tD5V3IaN6AvbQDQ94y0gWWnR60KsH+Y4szRkrmWQvAvN3aoV3uO1I2xGnFTjV
 bb/zy/OjfmmKh+KLGE1ZQLzascQk+/6G4j0/cFuJri28/kIMIdJDY9BFUEXUnxNhAi
 KKnnokIJ6qWsyghLwik29BZabKbpjfWWO9IBNOAfp2xo25sBNbzpzF0uEGAuTYvmFn
 ruklEykJbu/FQ==
Date: Mon, 19 Jan 2026 11:26:32 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-15-d93368f903bd@kernel.org>
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
In-Reply-To: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
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
 Jaegeuk Kim <jaegeuk@kernel.org>, Jonathan Corbet <corbet@lwn.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=811; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=AZAjr5blB9svvv4iy5pFFBzbvOqXSLNmipoZVSEtwIs=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltcugWXdJNtlW+RKXOXYTtYGJsG/ZI/Kgn62
 QwygZmbY12JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXAAKCRAADmhBGVaC
 Fa7bEADGBiSWRROuSs8J/91dJopWVmzh98rAZDg+3UJE7SHjCQVSwc1En6E7AttfsLanh4BPsdh
 Ey7dJYDTjb3KJReJoWtnBzgjramNeksgxA+e4U65O6gESkPKGSPLVEuByheDKvRtZxmYTtiqgzQ
 Mq2wEtjCZaCAWDVrRQDMllcwjxwnnBpyGy2HIUVdgPO33orBwlEUy5KumpmMk2e+P8fDAdOdqmW
 McggNOU1g1zZKrHp5rGDw/zrD58y7ffoAo0LgxBIwRV/PXjnMWNB/qD9ShCqpQ4BTly2NhUdW9h
 vle0WG/ufE0iU82wXme1sD/eCdiyuDlzLr0gcz/A6spq6D3CzkOznL6gAdqAk2wy39TD8KxPkYs
 Z9/zAlzaWQamQps1uwnyUrZYX7AkWLLLxdX0RYn4XKio+Uv3rfn0hTkvaETy6U2dpjRknebcsJR
 IIRnE5cqH7Z6CylksCFnlCxHsDjnnrBGr2HOdEyX7vZAv4lawkMEFUbd4NnnJC99Y90W1T4O9sM
 lz0DCW67haD9hC9Htrx6MMplYEzK08RQaRhpP0rgNkN7e9hP4YyIFLMikzCI3X34Rdbegi4sDxv
 BV1chOMAWIlFLNKsUt1oXQPpErFamRzH7s+wD9wS+rtnGDO2C95CtPLHJywk32fbpo7UxFjaRsT
 NPjT8Wxn0TBT9Gg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to squashfs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/squashfs/export.c | 3 ++- 1 file
 changed, 2 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhs7s-0007uO-NQ
Subject: [f2fs-dev] [PATCH v2 15/31] squashfs: add EXPORT_OP_STABLE_HANDLES
 flag to export operations
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
Cc: jfs-discussion@lists.sourceforge.net, linux-doc@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-unionfs@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, David Laight <david.laight.linux@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ocfs2-devel@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add the EXPORT_OP_STABLE_HANDLES flag to squashfs export operations to
indicate that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/squashfs/export.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/squashfs/export.c b/fs/squashfs/export.c
index 62972f0ff8681c798f0b11e17d501373b2145bd9..c6c4d8f1f115c65b6dac29582bb5b447b823d3b8 100644
--- a/fs/squashfs/export.c
+++ b/fs/squashfs/export.c
@@ -176,5 +176,6 @@ const struct export_operations squashfs_export_ops = {
 	.encode_fh = generic_encode_ino32_fh,
 	.fh_to_dentry = squashfs_fh_to_dentry,
 	.fh_to_parent = squashfs_fh_to_parent,
-	.get_parent = squashfs_get_parent
+	.get_parent = squashfs_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
