Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 412BBD04D75
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:16:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drK6VSF2WIWUrNPtxG1I4hrz7zYGlj7Zk3DU1+r3UzQ=; b=MlMHoRrcv7NgxRed/qMbjJgdmP
	KhaNRtQZ/Eg6dwKBRwodEqThzQ+78XxUXJyq782VwkPet1X8naWDh7/MW0gfHK+TE/YCy1hgFeJqP
	PpnsOZ5t8A1MK84dA1RxfrpY9sm5Gf5uXUWC4nyUAjHrV3YK9qk7YXYIHPJYC92hOTps=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtcb-0006rW-UE;
	Thu, 08 Jan 2026 17:16:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtca-0006qu-4i;
 Thu, 08 Jan 2026 17:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HPTqT+oy1OMUOp+so+dZ3cv0gcF4bJuJHtVTEd1VUlQ=; b=NDj9qTm7vp3aKMptQb0EeIeVbF
 kDCTfSrHG/pkhQFJbFGUpqCNNvVfRLpK0hAECHKKazPo7L6BuEaoYnrvTnBACd2wCS+Jxr/NLs55C
 STbgELGWlHqO5ywhykU2H1VWAS4h3DlqpVtfYZgn3jJGjvWexlI3ZOMV8p0Eis5BpzAo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HPTqT+oy1OMUOp+so+dZ3cv0gcF4bJuJHtVTEd1VUlQ=; b=iKzDLyQM5GDFf44c+k4c9bv9gi
 gBPD3tZ6oCSEIZwl4QSe0GPaHqZU+KzS9np4ZH46MBx5Xt8WuDQdPnW5Kvsrpm7gFIGtvEYJhwEWQ
 k3I/7CyU/1w/ca9egJM/5sBti2i/fs3BkqlUsb8m4w9XD1GqpA136W4kHgjZOlyZeFoE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtcW-00069c-T8; Thu, 08 Jan 2026 17:16:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8BBB242A52;
 Thu,  8 Jan 2026 17:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AC8C116C6;
 Thu,  8 Jan 2026 17:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892574;
 bh=Y8yfU7wo+bv5PqTWloVhm87suTQkWJClSnAp6Ng9lro=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QT6pxXNqWvJHyOYg3hWSLfGXpNN0ZmYoWCbIqcBphUyd5e/CKnj3QxGONTxUKwuLh
 P3M2Uh4IZvhWRfKOoTxPrLO4Qx7aS6dq4lupB62wDtNubrlN+ZO/AM2anEhhuC/LiA
 S4YtlhE8SwXKIBaCk5YKr35l7JVcPVqP3SnK55MIMbgE3snGMQiHN9IHE/qEQW2mo0
 drWHgjds0lmogHJW2CzrSvDkWeDElNISjTrsR8B8Kf0Pdy91ehwsPMVflis8LB0Asy
 mAfM3J8hVwvaGyuDduGwmO4K3TZqj900lAYy0IXWDvxWjCK1SPgzZfeTGmlxdw5SG0
 XpmYYxN4lDfmg==
Date: Thu, 08 Jan 2026 12:13:15 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-20-ea4dec9b67fa@kernel.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
In-Reply-To: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
To: Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, Nicolas Pitre <nico@fluxnic.net>, 
 Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>, 
 Anders Larsen <al@alarsen.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.com>, 
 Chris Mason <clm@fb.com>, Gao Xiang <xiang@kernel.org>, 
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
 Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
 Chunhai Guo <guochunhai@vivo.com>, Jan Kara <jack@suse.com>, 
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
 Dave Kleikamp <shaggy@kernel.org>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Carlos Maiolino <cem@kernel.org>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <chuck.lever@oracle.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Bharath SM <bharathsm@microsoft.com>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Y8yfU7wo+bv5PqTWloVhm87suTQkWJClSnAp6Ng9lro=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W9JGoO8MdfrKDSQqEUZX9WyGOSmm4CgIgoa
 LF6x3PhMYKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lvQAKCRAADmhBGVaC
 FT13D/9bGlCwWclg64l01L8s9AmtXvKCjKI2CNeCYh93PBL/4q2X15I6MepVsfrIiXAm1UZ7A+Q
 ourJq67Bakw7EJg/rFsi/5kCxPyQKJOPOEEkKT+5/Zh6R6BovLHz260Zxx4RIKCmnbb/4QSnkyH
 DuY4cIYZFF0M0RhUl9dSXFAl+ho1SBw08F4biLMI+9+yzoZJpf/umpEmSB2ZAKmjd6ayRPatsYz
 SBhFcri2L1TiccU5x1ATzJEUt8nyChJwODOsanWhj2wPmJUvHXqtLhH7TVCJL236zsy8LaFGjXQ
 VzUYt8iKaOR26/G4RAe8R8p1pOz8dN1zEgXv7GkPvxUyYxr1Rn6ER2LQ1LBS4M5SpYVOxxaYuVn
 kyb5VwVhTjjUVZHky+DmcXjzlcoAlGe3R85uJRRydiODVKOFwF0YCgJuWEgbVSc7bSa15xs0aht
 nTeuIOx86PQRWEDbW2u++Rx/wMRnfD8C1cR5ZgM/8vxwy5KnxSLU5UAXS0fLKhLeH6yEmWpSnCJ
 a2skVhzmf7KpcBfWbnnmPHq6nbBD2e/zWKp/6izVesZKMIoekFls1uNZ90RG1IevBfpyphcGstW
 UC/BOdxVN+ppwk4nv6DVG/ew8zcCZXdJCt1onUubHPB1L3r+xoX9WJNHsN7LsR7wdkIB5a/o5xr
 uloIyHIPHURUlkQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the setlease file_operation pointing to generic_setlease
 to the udf file_operations structures. A future patch will change the default
 behavior to reject lease attempts with -EINVAL when there is [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdtcW-00069c-T8
Subject: [f2fs-dev] [PATCH 20/24] udf: add setlease file operation
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
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add the setlease file_operation pointing to generic_setlease to the udf
file_operations structures. A future patch will change the default
behavior to reject lease attempts with -EINVAL when there is no
setlease file operation defined. Add generic_setlease to retain the
ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/udf/dir.c  | 2 ++
 fs/udf/file.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/udf/dir.c b/fs/udf/dir.c
index 5023dfe191e8088b78396997a8915bf383f7a2d2..5bf75638f3520ecb3a0a2ade2279ab56787ecd11 100644
--- a/fs/udf/dir.c
+++ b/fs/udf/dir.c
@@ -24,6 +24,7 @@
 
 #include <linux/string.h>
 #include <linux/errno.h>
+#include <linux/filelock.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/bio.h>
@@ -157,4 +158,5 @@ const struct file_operations udf_dir_operations = {
 	.iterate_shared		= udf_readdir,
 	.unlocked_ioctl		= udf_ioctl,
 	.fsync			= generic_file_fsync,
+	.setlease		= generic_setlease,
 };
diff --git a/fs/udf/file.c b/fs/udf/file.c
index 0d76c4f37b3e71ffe6a883a8d97a6c3038d2a01d..32ae7cfd72c549958b70824b449cf146f6750f44 100644
--- a/fs/udf/file.c
+++ b/fs/udf/file.c
@@ -28,6 +28,7 @@
 #include <linux/string.h> /* memset */
 #include <linux/capability.h>
 #include <linux/errno.h>
+#include <linux/filelock.h>
 #include <linux/pagemap.h>
 #include <linux/uio.h>
 
@@ -208,6 +209,7 @@ const struct file_operations udf_file_operations = {
 	.splice_read		= filemap_splice_read,
 	.splice_write		= iter_file_splice_write,
 	.llseek			= generic_file_llseek,
+	.setlease		= generic_setlease,
 };
 
 static int udf_setattr(struct mnt_idmap *idmap, struct dentry *dentry,

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
