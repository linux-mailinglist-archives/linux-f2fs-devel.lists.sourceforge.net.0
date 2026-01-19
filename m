Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8C3D3B116
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:31:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Y9Js7QWjDw0V8A1MDz9pkwi+y9x87PzHa6HsCOw44c=; b=aXQ24F24LNGeV1NmL23+TlDu6D
	uHUPY820c4pWO7YHV5XTOkEoPL72QZcptC+R58aHhqrAkmxme9AbiB7FtXhZjQmxocEmMGAlZldD5
	IK52eHbXf8n7PhKc7eW0BfodM9KU8fdLIu+885wi8ACfbEpNCUFNKqFPTby2/LXZA7BM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhsAG-0005dB-5y;
	Mon, 19 Jan 2026 16:31:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhsAD-0005cT-J4;
 Mon, 19 Jan 2026 16:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kclJY//hW7ol5koz4lkl7nBJxPLz3h3YqWVGRtkiRrE=; b=cdCTcN/QlD9VTsNo9XEzMHS/f+
 O6e+pyfYCzDNAnNb6FgyMS+vBavk5Gq6khR8whf9Km6CnJtgFUZMHEvdLkfL2Efei9SJI+HcM4EJe
 7PttrkbCWCCoiZgXkrYZ54twc6gOaZN4i+eeYOB9aT10Wljl8eH5CUNvrenEK4+qU9Mg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kclJY//hW7ol5koz4lkl7nBJxPLz3h3YqWVGRtkiRrE=; b=lTYTFaivaxNnP7YUkwMZgH04xq
 EvZ1RpOy8pj6N9tDQP9Qs5UJPGx/gLlqfYi8jzwx1UD3I5Qm1SHRz2fd4bsQX/8yAOqYx6w7ez/yp
 hZ9VRYbrqFlQAtIzO3wVlqsIxowXxssOBRh4ZJe4+uN6XcJHoMykxr2rckLTzPNY/3FE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs9l-0008EW-5a; Mon, 19 Jan 2026 16:31:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 85F8F60158;
 Mon, 19 Jan 2026 16:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4CBEC2BC86;
 Mon, 19 Jan 2026 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840263;
 bh=YvhqTu858V2nHA/DvphvNPgy0WWoXV1XH8O4vHs3r6s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=h2eWuvDHO+FHNVWC0HtfYiwQLGD+wYaxR9D3B3Ed9tIu0JUYT/Du8NCPJr2Kni+6j
 FzBHjGuc/OLKKlytLlDDSMvG6K/lZ+1yYDEkp/N9zqPCokk75ZABfwL6avEwi42vps
 0f/64rbZnR08cTk3Jklqr4LP4IF+Xj2tBebaD1y0phkAa+Asd/Q4cqS9Zfs0k0IMkF
 Wcd+HNSs1kfJ+gcQ5lC7WEcMywntkKV3L2fJFu0mtjX/DfTm1UQD/RZLxzC0HuvTay
 SahYNV1qOWaAxchZUrdKt84Zn3hO16NvxYRmiTOmxr3zcnvDdJtPkIgDlJWEZ0vCK2
 XLTl9TlK3VJ0g==
Date: Mon, 19 Jan 2026 11:26:48 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-31-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4169; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=YvhqTu858V2nHA/DvphvNPgy0WWoXV1XH8O4vHs3r6s=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltg7KaYG+cOnqGQwFogykRFEv2vvWPelc3rm
 NkydLb2mGCJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bYAAKCRAADmhBGVaC
 FWqbEACWyEMei5YgEgZwLPtZYTWHb8tmOW7eGn745dbexN721w1XJin+y0uFuiiEqpYtbB01+nV
 8eGJXblAwZWOM56qXzH8kIp9IF0Do5UMXMJTyUb79WR1Vxz5+svm6rH4ORCbDMoohslm0Ey+odn
 Zx62FtcwzZ/STJY531c69lQu2bhr3cC/ykvj+MnpDF1L6iyuPTl056aSkCGs+2TRjxpwsRGp0tV
 7FV1mQVZyW+b344OwsU12+VtzNEUh3CAPnxW20OYd9f0s9HFEpZK4Y9Ep/WsEqP0165/LeBaVXZ
 Tihw250Wgn1dTNDwYC3840yoGmtFEjRpYdrQxlR1fxUi+1e02u+G+A2z8VPXC2UMtR7HTpWR3kq
 0gpbEU4+t6RXYZ2KSP1Qp1R60LWabc62qCpOU1l2LsxieR9zzMNQzgrLEkvEzam75nzR1SYp0M1
 MAZjAICvnrvk2txw2ibnrnHJErb9vl+kLuB3btLLAaMmNVQQO9QZiA3QpDitFCH5aU6ZVYP8fdD
 r/l2xb9t2bkCY+uL5zGtY5a9B+sKZHy6JRgOd3o/SiUBbmV6dnxq4JqqdXpdxKAPH7RgwPtK224
 H9hNJK7Mkv5H+8Si6seHr0qbAPwccoRdGVCztXQ1fdG5MLjNTJb3M6cVTt5Wicf6NlgjQa664oA
 Z9sNNAkM0OHYjQA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Get rid of the dprintk messages in check_export(). Instead
 add new tracepoints that show the terminal inode and the flags. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/nfsd/export.c | 11 ++++++-----
 fs/nfsd/trace.h
 | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++ 2 files changed,
 58 insertions(+), 5 del [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhs9l-0008EW-5a
Subject: [f2fs-dev] [PATCH v2 31/31] nfsd: convert dprintks in
 check_export() to tracepoints
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

Get rid of the dprintk messages in check_export(). Instead add new
tracepoints that show the terminal inode and the flags.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfsd/export.c | 11 ++++++-----
 fs/nfsd/trace.h  | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/fs/nfsd/export.c b/fs/nfsd/export.c
index bc703cf58bfa210c7c57d49f22f15bc10d7cfc91..3cc336b953b38573966c43000f31cd341380837b 100644
--- a/fs/nfsd/export.c
+++ b/fs/nfsd/export.c
@@ -435,31 +435,32 @@ static int check_export(const struct path *path, int *flags, unsigned char *uuid
 	if (!(inode->i_sb->s_type->fs_flags & FS_REQUIRES_DEV) &&
 	    !(*flags & NFSEXP_FSID) &&
 	    uuid == NULL) {
-		dprintk("exp_export: export of non-dev fs without fsid\n");
+		trace_nfsd_check_export_need_fsid(inode, *flags);
 		return -EINVAL;
 	}
 
 	if (!exportfs_can_decode_fh(inode->i_sb->s_export_op)) {
-		dprintk("exp_export: export of invalid fs type.\n");
+		trace_nfsd_check_export_invalid_fstype(inode, *flags);
 		return -EINVAL;
 	}
 
 	if (!(inode->i_sb->s_export_op->flags & EXPORT_OP_STABLE_HANDLES)) {
-		dprintk("%s: fs does not provide stable filehandles!\n", __func__);
+		trace_nfsd_check_export_no_stable_fh(inode, *flags);
 		return -EINVAL;
 	}
 
 	if (is_idmapped_mnt(path->mnt)) {
 		dprintk("exp_export: export of idmapped mounts not yet supported.\n");
+		trace_nfsd_check_export_idmapped(inode, *flags);
 		return -EINVAL;
 	}
 
 	if (inode->i_sb->s_export_op->flags & EXPORT_OP_NOSUBTREECHK &&
 	    !(*flags & NFSEXP_NOSUBTREECHECK)) {
-		dprintk("%s: %s does not support subtree checking!\n",
-			__func__, inode->i_sb->s_type->name);
+		trace_nfsd_check_export_subtree(inode, *flags);
 		return -EINVAL;
 	}
+	trace_nfsd_check_export_success(inode, *flags);
 	return 0;
 }
 
diff --git a/fs/nfsd/trace.h b/fs/nfsd/trace.h
index 5ae2a611e57f4b4e51a4d9eb6e0fccb66ad8d288..e3f5fe1181b605b34cb70d53f32739c3ef9b82f6 100644
--- a/fs/nfsd/trace.h
+++ b/fs/nfsd/trace.h
@@ -339,6 +339,58 @@ DEFINE_EVENT_CONDITION(nfsd_fh_err_class, nfsd_##name,	\
 DEFINE_NFSD_FH_ERR_EVENT(set_fh_dentry_badexport);
 DEFINE_NFSD_FH_ERR_EVENT(set_fh_dentry_badhandle);
 
+#define show_export_flags(val)						\
+	__print_flags(val, "|",						\
+		{ NFSEXP_READONLY,		"READONLY" },		\
+		{ NFSEXP_INSECURE_PORT,		"INSECURE" },		\
+		{ NFSEXP_ROOTSQUASH,		"ROOTSQUASH" },		\
+		{ NFSEXP_ALLSQUASH,		"ALLSQUASH" },		\
+		{ NFSEXP_ASYNC,			"ASYNC" },		\
+		{ NFSEXP_GATHERED_WRITES,	"GATHERED_WRITES" },	\
+		{ NFSEXP_NOREADDIRPLUS,		"NOREADDIRPLUS" },	\
+		{ NFSEXP_SECURITY_LABEL,	"SECURITY_LABEL" },	\
+		{ NFSEXP_NOHIDE,		"NOHIDE" },		\
+		{ NFSEXP_NOSUBTREECHECK,	"NOSUBTREECHECK" },	\
+		{ NFSEXP_NOAUTHNLM,		"NOAUTHNLM" },		\
+		{ NFSEXP_MSNFS,			"MSNFS" },		\
+		{ NFSEXP_FSID,			"FSID" },		\
+		{ NFSEXP_CROSSMOUNT,		"CROSSMOUNT" },		\
+		{ NFSEXP_NOACL,			"NOACL" },		\
+		{ NFSEXP_V4ROOT,		"V4ROOT" },		\
+		{ NFSEXP_PNFS,			"PNFS" })
+
+DECLARE_EVENT_CLASS(nfsd_check_export_class,
+	TP_PROTO(const struct inode *inode,
+		 int flags),
+	TP_ARGS(inode, flags),
+	TP_STRUCT__entry(
+		__field(dev_t, dev)
+		__field(ino_t, ino)
+		__field(int, flags)
+	),
+	TP_fast_assign(
+		__entry->dev = inode->i_sb->s_dev;
+		__entry->ino = inode->i_ino;
+		__entry->flags = flags;
+	),
+	TP_printk("dev=%u:%u:%lu flags=%s",
+		  MAJOR(__entry->dev), MINOR(__entry->dev),
+		  __entry->ino, show_export_flags(__entry->flags))
+)
+
+#define DEFINE_NFSD_CHECK_EXPORT_EVENT(name)			\
+DEFINE_EVENT(nfsd_check_export_class, nfsd_check_export_##name,	\
+	TP_PROTO(const struct inode *inode,			\
+		 int flags),					\
+	TP_ARGS(inode, flags))
+
+DEFINE_NFSD_CHECK_EXPORT_EVENT(need_fsid);
+DEFINE_NFSD_CHECK_EXPORT_EVENT(invalid_fstype);
+DEFINE_NFSD_CHECK_EXPORT_EVENT(no_stable_fh);
+DEFINE_NFSD_CHECK_EXPORT_EVENT(idmapped);
+DEFINE_NFSD_CHECK_EXPORT_EVENT(subtree);
+DEFINE_NFSD_CHECK_EXPORT_EVENT(success);
+
 TRACE_EVENT(nfsd_exp_find_key,
 	TP_PROTO(const struct svc_expkey *key,
 		 int status),

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
