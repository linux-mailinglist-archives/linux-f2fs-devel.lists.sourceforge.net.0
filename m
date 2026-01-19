Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 412DCD3B0AF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:27:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljxskaFB4A6YBRTqz2HrrYguwfEKVi26qu/1iQ9uEkA=; b=Ixqkaq5dXdP7Mam0lNViZjvVR2
	lWlG9nWIbaSyp5ZnOM7KNkJKqbPA2ACRe5UQ2r3VDAVs+VvTReufmnii36CaYgAYydyyDQ5/qrPcZ
	cK8v++W5TeZZ8hcn7uAf2eZUswY8QaZDTkjjA6SAvwMzlFn/34kPNEcZnLMERQzk/e2E=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs6W-0002ys-Ua;
	Mon, 19 Jan 2026 16:27:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs6O-0002y8-LX;
 Mon, 19 Jan 2026 16:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5LBMqF0fnkOKDDiKj1UARiPJl+jkJNUF0Z0wVc1Tm3U=; b=ebigWyRFo7Orh6NIDzp3JFq+me
 zz/fkm+/wZ6CBXw/MA5NKIGiHExJzGOQkaq+AQnqHiWoIW0Rj3yDGc8ui7vinLYQ3waz4uCQgu+Y2
 XEMUK8zLFQT/ha2PH3AhS0q8eVeItSsltYvbFabEpM6McSqoXNnoubLXJhgiXL6+F3cU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5LBMqF0fnkOKDDiKj1UARiPJl+jkJNUF0Z0wVc1Tm3U=; b=I0sawQmWx0GjMCvod2cVdc1Ojq
 pQkZRJjNRahKQgljE4gRSXuSWSMjenc1OgiKoCCWaHc8vbvpqGcBSFQEPmWZqIQXRCH0f0oYJdP8I
 ariGJW1WZmIqqlCFhfQeQ22UQBoeo2MdBnoQnloRcKpxGiRpjv1TA2ZfxR91KDHJGwmM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs6O-0007ly-3k; Mon, 19 Jan 2026 16:27:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BA21544515;
 Mon, 19 Jan 2026 16:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F16C2BC86;
 Mon, 19 Jan 2026 16:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840054;
 bh=WOmtIr1IsB2xi2+MQpnozeMDf4MRJ512rkEzgmzicq0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fFGw0NlbN5TsRC2ZjlZjZn9IX/42PhPSQnnYH/4v7sgwhqTBMY/MxwIMIlKkHQgff
 IsnuLQGgFH8eWVaaGOR+eMsdGER+dvGyTUfbMzLqADvcxjbHTL48XRw/G/ojzS6ubF
 gxWUU+M9COq59S0/XzQ0Rg2QVwbbyQSi2S57Ixy4HGcUaYn0kCzvwW32x4YptCcCne
 TC5kQgRykkBR+Q/5D8riOm2605W/IKWQgExzxr/JW0sdu9dkxBbhSvoXfvEW1caiEP
 Jtfr/b52H65goyMqJXxHvpQS5ggVa0+AKp5u4wRq/MKYBMwp0R6Slbqb969DTxzRNV
 Kdv1LlGm6aQKg==
Date: Mon, 19 Jan 2026 11:26:19 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-2-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3825; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=WOmtIr1IsB2xi2+MQpnozeMDf4MRJ512rkEzgmzicq0=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltZJJ4Erxc99mz4JD4fpPhibGNL6s9qiEaxZ
 +ast/XYA8KJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWQAKCRAADmhBGVaC
 FRr2EACvlm3De5JtqwIRiAJ+yR+TrnRM6zVnaaBcPqW7NWtaotgXHbjPmhHalzQ2ehLlMs4pBwW
 CJdzL/0SuDHd+1ninl8HscU8YeUjTL2yuS1baFgceqGQ56wAeo1gFcMtbsngMt0UiC5VhNd5lzQ
 hisUbwG+ATmkxRNQlt1jg5Knn2k28x7ZuUBDbB9vNczmKJ2P3gR4vHlU6toocVh4tp1XLS8YnS4
 /Th6ZoeqlrAyCsLW2EjmEjXRmVT3n9bN3rhj5BRL01f5sWIKM6YimBAXNaGgfT6UVTHVYycMqid
 z8zjumO5an17putv+hHHquqigVwMPoFkl/R//xJ/wD3NuR6WXPWj/YfRuSTQ6HrgP3/xw6XGitp
 THrn0RYY6owKt+oRWUEoL3eIf6yNlcLh6Z+A7iaacop4/RyPQcauGbboHVG+zQrFpRA0TYU2QWr
 OJuePE5rbnQL9s8mlCeoPUUbX0I0E2jges1C26w/uthmL5Jmlg1eyzXFafUNmt45LVS97O17yyA
 A2BOWaDmYRmleIMtYuRGy98LCY2KV91GcRPRO/n424NqA6H2dC2jvKwMZAfZLHNYZBLKEgJ+x1O
 GEgCl6Q0UBJ87Io0WzdKw7SlTPxZyLbVNRNcBAm3/kG8WoQXajMQfr4a1wQ/fclJWtptjFdnzZD
 anI/Pt3rN8rtBBA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  At one time,
 nfsd could take the presence of struct export_operations
 to be an indicator that a filesystem was exportable via NFS. Since then,
 a lot of filesystems have grown export operations in orde [...] 
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
X-Headers-End: 1vhs6O-0007ly-3k
Subject: [f2fs-dev] [PATCH v2 02/31] exportfs: add new
 EXPORT_OP_STABLE_HANDLES flag
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

At one time, nfsd could take the presence of struct export_operations to
be an indicator that a filesystem was exportable via NFS. Since then, a
lot of filesystems have grown export operations in order to provide
filehandle support. Some of those (e.g. kernfs, pidfs, and nsfs) are not
suitable for export via NFS since they lack filehandles that are
stable across reboot.

Add a new EXPORT_OP_STABLE_HANDLES flag that indicates that the
filesystem supports perisistent filehandles, a requirement for nfs
export. While in there, switch to the BIT() macro for defining these
flags.

For now, the flag is not checked anywhere. That will come later after
we've added it to the existing filesystems that need to remain
exportable.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 Documentation/filesystems/nfs/exporting.rst |  7 +++++++
 include/linux/exportfs.h                    | 16 +++++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/nfs/exporting.rst b/Documentation/filesystems/nfs/exporting.rst
index 0583a0516b1e3a3e6a10af95ff88506cf02f7df4..0c29ee44e3484cef84d2d3d47819acf172d275a3 100644
--- a/Documentation/filesystems/nfs/exporting.rst
+++ b/Documentation/filesystems/nfs/exporting.rst
@@ -244,3 +244,10 @@ following flags are defined:
     nfsd. A case in point is reexport of NFS itself, which can't be done
     safely without coordinating the grace period handling. Other clustered
     and networked filesystems can be problematic here as well.
+
+  EXPORT_OP_STABLE_HANDLES - This filesystem provides filehandles that are
+    stable across the lifetime of a file. This is a hard requirement for export
+    via nfsd. Any filesystem that is eligible to be exported via nfsd must
+    indicate this guarantee by setting this flag. Most disk-based filesystems
+    can do this naturally. Pseudofilesystems that are for local reporting and
+    control (e.g. kernfs, pidfs, nsfs) usually can't support this.
diff --git a/include/linux/exportfs.h b/include/linux/exportfs.h
index f0cf2714ec52dd942b8f1c455a25702bd7e412b3..c4e0f083290e7e341342cf0b45b58fddda3af65e 100644
--- a/include/linux/exportfs.h
+++ b/include/linux/exportfs.h
@@ -3,6 +3,7 @@
 #define LINUX_EXPORTFS_H 1
 
 #include <linux/types.h>
+#include <linux/bits.h>
 #include <linux/path.h>
 
 struct dentry;
@@ -277,15 +278,16 @@ struct export_operations {
 			     int nr_iomaps, struct iattr *iattr);
 	int (*permission)(struct handle_to_path_ctx *ctx, unsigned int oflags);
 	struct file * (*open)(const struct path *path, unsigned int oflags);
-#define	EXPORT_OP_NOWCC			(0x1) /* don't collect v3 wcc data */
-#define	EXPORT_OP_NOSUBTREECHK		(0x2) /* no subtree checking */
-#define	EXPORT_OP_CLOSE_BEFORE_UNLINK	(0x4) /* close files before unlink */
-#define EXPORT_OP_REMOTE_FS		(0x8) /* Filesystem is remote */
-#define EXPORT_OP_NOATOMIC_ATTR		(0x10) /* Filesystem cannot supply
+#define EXPORT_OP_NOWCC			BIT(0) /* don't collect v3 wcc data */
+#define EXPORT_OP_NOSUBTREECHK		BIT(1) /* no subtree checking */
+#define EXPORT_OP_CLOSE_BEFORE_UNLINK	BIT(2) /* close files before unlink */
+#define EXPORT_OP_REMOTE_FS		BIT(3) /* Filesystem is remote */
+#define EXPORT_OP_NOATOMIC_ATTR		BIT(4) /* Filesystem cannot supply
 						  atomic attribute updates
 						*/
-#define EXPORT_OP_FLUSH_ON_CLOSE	(0x20) /* fs flushes file data on close */
-#define EXPORT_OP_NOLOCKS		(0x40) /* no file locking support */
+#define EXPORT_OP_FLUSH_ON_CLOSE	BIT(5) /* fs flushes file data on close */
+#define EXPORT_OP_NOLOCKS		BIT(6) /* no file locking support */
+#define EXPORT_OP_STABLE_HANDLES	BIT(7) /* fhs are stable across reboot */
 	unsigned long	flags;
 };
 

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
