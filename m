Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B63D26D85
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IILeYvc0q8w1XBXkcsl6tVRD+UD+o2hW492vmY9j2h4=; b=BrGFVlLNoTRto8X024AHNZAYdt
	FKOe+pDvrcC4+VbtJ/NpkDn8DMy/Y0p/Nz+bfThRwj/ZiV0n4tYSB8S95QDSCRMtokNfpYqPtrqPl
	s8lWLEsxn0Vh+d5wY9qbUMOeDm6LCHBmCfpycLPHTOdWdoRpqvSMhV0kLaIIrpVhZ8o8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRVB-0001YB-6j;
	Thu, 15 Jan 2026 17:51:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRV9-0001WQ-Ea;
 Thu, 15 Jan 2026 17:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ehBSJ++W2cPkB0J1WK/qzYleqmCU+xmhuZ52acFYXD4=; b=TcWL/gs81dFdOoI5kt00d1Bwfo
 eVXFznzDKorT2MDcxvHwnkprQMYdDq0Rze+ceTu8PECbLySzg+elGPApe235udau5pxaWaoll/+OX
 VOhm6/ib+9inNMAdsdX/p+1QhSviIbOQRukQvVd8t7ANod+R5MFu/aNy9Zf0GghU9qNo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ehBSJ++W2cPkB0J1WK/qzYleqmCU+xmhuZ52acFYXD4=; b=Nfqmzm0fPDawZHuUXL7uPp2dHA
 OB5xfKjroEnmOsXW61W9CDCcBK9NEtoezYxXAoFSB5xDkHqRCKbHt3DLlkcDDN6qEaSAVlNMoSmoq
 LW/xxciLr+gtzjeGHKLeZcjhrTno2QevyqbpHdh9sly9Prhnzo55iXxU5sOf39A26k48=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRUo-0007uW-8X; Thu, 15 Jan 2026 17:51:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DF2674444F;
 Thu, 15 Jan 2026 17:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69144C19423;
 Thu, 15 Jan 2026 17:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499447;
 bh=Sci10TD3wPs0X/nu0ytauQ8Ud8Tj5YY+K+HKIyo6zgs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HAduJ+b8zSL3EqiL8BWAwWD8dLJQbeePf0bm85OdZfFLPWRA0jjDqsndpbY3aEeJm
 bSZ2zePm5Ppt5CPtWSq8JfAuvTJdVTN0AalfbQr3+ZmEIVMgZLyre27TUJRL3q79RA
 rNkOhzjaHEs8Tzs6m7a11HqVSOASVf1UDKrmf2BusNxr4F1ZrSa1AeV3FS1wualjMn
 edCqfaB7swWMnieicMtljNq2srOk7m1vYCQ/WVyTx7lOJNCf5w6t5Jk73i+CIoGNhD
 6u2o53je2uuUZ8idJMLxsPE8YuIFnNpQkINvbPOlSBG5OA+QWZzAYgsBIQtPf/0NuP
 iaOi8AySDlRZQ==
Date: Thu, 15 Jan 2026 12:47:56 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-25-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=670; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Sci10TD3wPs0X/nu0ytauQ8Ud8Tj5YY+K+HKIyo6zgs=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShKEZOnS7UvOdedWpxM2vr6K3ZyrR8i984uP
 36Z/NOZVbSJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSgAKCRAADmhBGVaC
 FUAzD/wO4B8LbZIbV1r9N1Hrd5ZJIB+G+pERUxRqQAMDSLuBtzpewxmtTH0hhbSp59SR4MkNgl/
 +2aCmWZWak0wchEfvWhMgfn8Qv3aoofYBRdM41RBXDiS73RXrNux5TRoeH/zHuixgf0wFmfed0i
 jxoj6camRvgEjWE4xs+S0WY2N+i4AAZpT+XPwydSIaDELoku8NFPtj9RKefKVNr0fJ94ul+dW49
 UTt+XNNx6KBm/QZz80fa/w26YhYVLBg6BNGkMity+VSgFJ7x4Ljaw6CqPe5iUSYu2G4wSh8xBbq
 LeNQpupNpNaQScnKKupFcAa/SbRco0dX4zI3o9g51BpGeptkq9hzkW5jBl2TWyOiUWS6/5tWrk8
 O5ziKdR4FKIeC7m2gShMwkA+AtGygxcZMfmt9JoTTJoxBbThAJ5sfZAQ5AqReLlaKBhZ9UxZiVM
 4sWy7ATcwjQoRMD5i/3CbBBtO2qkyWD7+mu06/fKwuoLq12mbWmihF5jaJjBgjsdC6Dlh53xyqB
 Mb1oGWtPvC4v1BTt1ckwG46Yj+uaKNZGbiHsptk0Kn2NWUUxjv1QmRgIuCsDYB1oUwnQbBDLV7G
 LVO7veomLBFg7//KAYREytEu6ObsV2lywlOTKdM5WmYw9LL4gj9OM8SPWkj69/NJPhRp0nQs6Lr
 iCHpJf6gr7VVjzg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to gfs2 export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/gfs2/export.c | 1 + 1 file changed,
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
X-Headers-End: 1vgRUo-0007uW-8X
Subject: [f2fs-dev] [PATCH 25/29] gfs2: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
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

Add the EXPORT_OP_STABLE_HANDLES flag to gfs2 export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/gfs2/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/export.c b/fs/gfs2/export.c
index 3334c394ce9cbe26969809874a94e79bf068b11b..43fd2203b34fb0894d2b71e50278e5cd68216ce7 100644
--- a/fs/gfs2/export.c
+++ b/fs/gfs2/export.c
@@ -190,5 +190,6 @@ const struct export_operations gfs2_export_ops = {
 	.fh_to_parent = gfs2_fh_to_parent,
 	.get_name = gfs2_get_name,
 	.get_parent = gfs2_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
