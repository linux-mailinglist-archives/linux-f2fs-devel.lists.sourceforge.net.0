Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E953AD3B110
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:31:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFDMF69xHT2bsPJahIZRf7CdDOrcX6WENuyKHAIy/MI=; b=If1pKOnPkv5Maxk51Nl5Y6M7dD
	xXBeK7NgdaMVlrx8AIMLIoCu9YVTs93FRIpeIdhzZlAqvRpsytKWU3B46xZhdY1UxmWapnfEvqmFU
	vJx21KHPKk9xcxi7fcg5i56l/RM5CCIe1YbItLxu2HjFaSVXE28gRkGsYGCCtiuDVjco=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs9l-0006hE-6E;
	Mon, 19 Jan 2026 16:31:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs9i-0006go-Up;
 Mon, 19 Jan 2026 16:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BVMoZ6aYYtL9nmNsreNI0oxHDB7/XuvSnZNUNgsLjo8=; b=JfafZBFD8KSZI/51L1pbKjKhlC
 iaJ5QmHcl049GuIe/ISgu64M/9Qy/jC384d64WS1/jMPMoJ1GR7KzMKYWypp5NjM4DlGF06iF+iyE
 fLpU+KSWWsAOW+mOFAkiPCxdro59nmS3YlDw1fwRQbUJI30CLyeTFZgRHIefPUct2SVI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BVMoZ6aYYtL9nmNsreNI0oxHDB7/XuvSnZNUNgsLjo8=; b=iIXXlphF/Qps/TR7OqquXDZwhc
 zcez0Vv6/j/rGtMI4lbZQXyoMCRdPoXEIHMclREuZL4PafvT5Nnj5et9KiPrlicErco0yjEpDbHhk
 BiqO1mVXHYvuvI05uiq9l7QWDWl8J+2jidoEFr2C0sj3Eig8zviVBo0fRmGPgANMaCCI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs9i-0008Dy-1s; Mon, 19 Jan 2026 16:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A92AD44507;
 Mon, 19 Jan 2026 16:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71889C116C6;
 Mon, 19 Jan 2026 16:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840255;
 bh=XGt/aZzfGK9zJQOZBzNGqpMmieKmh9kJIK51xGoE3lw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aRe9D5Sa7gMB/Ryp1GcMwBIJ0XwKuZ6UClP6Ug45QHAha8tYj9mJ1V510E+A9msBF
 uIhFQ4ERVA2/a/89lazW/TqRbLmJXCbnATean6EIJEuIz/669usXdDh3OAv3cCVNyN
 153NxFJ5bXU00TkkzzXLWoUrW/pQLk9vKivAvy3EIK99PwQxTlxQfnsqWQCzOs4xkV
 djsQKErslPGQtEcNguvZIqh3BSoWwOetopyqoeBHApuQa2uwYZV8JERw+NxlC0nR0n
 fOEHc48tTPF5j3kPLorwmV32bUWcgE0EFzjrgIlJjLHAtcT1r/8PEQ677OthtO1AHK
 xGnYGFr1AXgiA==
Date: Mon, 19 Jan 2026 11:26:47 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-30-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2174; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=XGt/aZzfGK9zJQOZBzNGqpMmieKmh9kJIK51xGoE3lw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltg313cW2t8STVH2Q3f6eFFX8webaAfx8DOM
 GA1WXTggo+JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bYAAKCRAADmhBGVaC
 Fd/6D/9j/oMVrJxeP2Mfuffs6X+mbihS90psuLoEJKbrjqZA7FdFGxRNUgHxspeg1JxUtDbEv7a
 uU4kSCajVCH2iOyDZQHDvyYwkkXW1+PdbM5uKZ/7DFLmaIxhriGPZjNE6IzpuJN48O73ngtU1bb
 P2CJLYNkWnxIJsMzVQaL4bwkbCVO8za/peoBtCgsO+8VOphfgjUEt0WDcgBxDOZdExrFOuNZlkA
 yVOd7lxKLAhNKynWzgdAd5sKikhudMp/54M1K2PccQWIGPdcv4xFGVS3GiU/csV9NzJSKjvCtjJ
 /K1MhVCHGVNaobSkaid3Tly/fXK4uha201p7DIspoVEewSSSXnhx5x0x3aBwwrld/gCO/BQlsYK
 5rZ2YOFFh/4TRhu7Gv3uRLHaXPpBIvj1iq70FX22A77FNzSrDm4qhCKISIaOPMyLDSI+t5ru9TZ
 j58AKvcl13B3sxdRak3OQWP4MHJncRuHJGlvXrEQaBf/aD6jxo0U6J/EdF0tJYPIILxRvkYndIB
 QsuTvSgf109v+B3Im9IKplrYJZ1er53jnSi8MzCOscRy3zHvch/igrvKIj0Mqnwjj/FRsnpuadV
 MVNdABzxnuvzbDIRfClDT3ehoVXweeSMvlteptmwg0EHO/sEA5XJWFSZvKdtodlu7Pj5Cn4Pepu
 OBCy4/+aVtv9EqQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Some filesystems have grown export operations in order to
 provide filehandles for local usage. Some of these filesystems are unsuitable
 for use with nfsd, since their filehandles are not stable across [...] 
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
X-Headers-End: 1vhs9i-0008Dy-1s
Subject: [f2fs-dev] [PATCH v2 30/31] nfsd: only allow filesystems that set
 EXPORT_OP_STABLE_HANDLES
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

Some filesystems have grown export operations in order to provide
filehandles for local usage. Some of these filesystems are unsuitable
for use with nfsd, since their filehandles are not stable across
reboots.

In check_export(), check whether EXPORT_OP_STABLE_HANDLES is set
and return -EINVAL if it isn't.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfsd/export.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/nfsd/export.c b/fs/nfsd/export.c
index 2a1499f2ad196a6033787260881e451146283bdc..bc703cf58bfa210c7c57d49f22f15bc10d7cfc91 100644
--- a/fs/nfsd/export.c
+++ b/fs/nfsd/export.c
@@ -422,13 +422,15 @@ static int check_export(const struct path *path, int *flags, unsigned char *uuid
 	if (*flags & NFSEXP_V4ROOT)
 		*flags |= NFSEXP_READONLY;
 
-	/* There are two requirements on a filesystem to be exportable.
-	 * 1:  We must be able to identify the filesystem from a number.
+	/* There are four requirements on a filesystem to be exportable:
+	 * 1: We must be able to identify the filesystem from a number.
 	 *       either a device number (so FS_REQUIRES_DEV needed)
 	 *       or an FSID number (so NFSEXP_FSID or ->uuid is needed).
-	 * 2:  We must be able to find an inode from a filehandle.
+	 * 2: We must be able to find an inode from a filehandle.
 	 *       This means that s_export_op must be set.
-	 * 3: We must not currently be on an idmapped mount.
+	 * 3: It must provide stable filehandles.
+	 *       This means that EXPORT_OP_STABLE_HANDLES is set
+	 * 4: We must not currently be on an idmapped mount.
 	 */
 	if (!(inode->i_sb->s_type->fs_flags & FS_REQUIRES_DEV) &&
 	    !(*flags & NFSEXP_FSID) &&
@@ -442,6 +444,11 @@ static int check_export(const struct path *path, int *flags, unsigned char *uuid
 		return -EINVAL;
 	}
 
+	if (!(inode->i_sb->s_export_op->flags & EXPORT_OP_STABLE_HANDLES)) {
+		dprintk("%s: fs does not provide stable filehandles!\n", __func__);
+		return -EINVAL;
+	}
+
 	if (is_idmapped_mnt(path->mnt)) {
 		dprintk("exp_export: export of idmapped mounts not yet supported.\n");
 		return -EINVAL;

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
