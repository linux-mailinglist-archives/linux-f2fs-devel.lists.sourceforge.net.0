Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B73D04C7D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:14:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2IWBROtiupW6uuCBJX0gp54mFs31M143fkNx7FlbMk=; b=ehEV18IMjUWiy/ZFLe7Nc4FFzL
	6Izf0hgDIokpfPc6UO8a0Li2FyGpfWd27VNhG1wrHo3OQLG/hVuTi7gWgYqt1RXLy8efzKYR2zKSw
	MK9wNGI2r2zsGFRsCoizmxum0zPToEjlW5vM4ZgaoF1t31hlMkiWDdKkPAaazqF//8fg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtab-0008Cm-5h;
	Thu, 08 Jan 2026 17:14:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtaZ-0008CK-Nz;
 Thu, 08 Jan 2026 17:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kkg71EWSeprcImfa5ddRfKn2RSTuMpwmSFgyDbj1AnQ=; b=XIQWxJl65YCJOkpCu98u7uOC82
 AXqMbaElUmY8LHU4r7qCdDY7EskD4C1ps8NRx3Rvg1cxfyu59yRae9J8tT7qacf/LlAXlTpsUYfIL
 ZuJzxF/kpc6zowfz+T40rdWaIKYqLJwq+n2V+OL2Mz9JN4b9NcJy6Fp7u9cbOLNprk8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kkg71EWSeprcImfa5ddRfKn2RSTuMpwmSFgyDbj1AnQ=; b=Edn7DQdhy2LEMLwXMBMYnXrwiZ
 4NTzp042iKmCzT2ZiK9ZIxk81yo4p4m9inPg0bOjrjpbw706I8MEZZE40fMJit+xMxbbxFj1qjc2M
 F2f+EMNHf7UAmj60Hd9SH0yWRwDnkzyDXPe4Eq5wvKQzyYddpRV4nv5Ocrn/fd0fUP2g=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtaZ-0005oc-1y; Thu, 08 Jan 2026 17:14:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AF05844447;
 Thu,  8 Jan 2026 17:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4074CC19425;
 Thu,  8 Jan 2026 17:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892452;
 bh=VftDczW/RHsJtQlFSh7tMNcNMgHiKsCQqbNqeRwhe8M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=j99SvAItuEybJQBvSLRmS84TU6WfiMXcwP4088ncl0dJj+X259KHWw6MyQaVA6kzG
 oPECA4FMVMlKYCaehvDpXJop8Q5F9GB6xcIpkmXdQfwEeHYkZKRbSQo/tX0X0Vod+F
 YwJ8wOS73tcNHPzcd/R3k0xGjyff89YBIGM88fZxZiGqpb1rNl4GH4X0MfrQbUz5X/
 deIlelXnp2vAuxtcCCSrk8BdHKA7r5LVJ4LthrAmFJ6fKW4CsejZe4y3BBnBYmqLEo
 B5FNDOVl5khkljZAkIaZIcl517lxY8NW1YoU4ftIV+/iXX2kw7jQlQAxoYIM0yzy85
 WjVk+AL/vpoKw==
Date: Thu, 08 Jan 2026 12:12:59 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-4-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=VftDczW/RHsJtQlFSh7tMNcNMgHiKsCQqbNqeRwhe8M=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W5D39raWTfk9/NpmK8oPAiQK6j/fZNQTiK0
 mXiB1deOuGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/luQAKCRAADmhBGVaC
 FbTRD/9xYLwsFFCpMX2yKeF7C19Mw/69euFVil3d3rGhY6NZgqpWQsWs+JPk6AGiudh1ympKi5w
 KDV+WfIgFEJmQLVRx4btFU2+9X7RuD8uopNt2+hBQ9T04zGegtApypSIVLnGs1+r9L4qJl3HyIS
 uFJEFRe2WEdQMdw75UuDMHDhTG4JauCXcBvhHzNkUJ929nJ2ydpltqDWjFB+0DpLJ7azASrMhyb
 krcESpUqm0OlIHWMdMjbnGjzyPJCqQ8hCoF3VzawdQKOgREhTJjubThh1DEd0yHIp+IHGoZ0wc8
 +u56IZBx9vRkFGSfFplpt859W+e30+UTK6xtuPKcctDAT3jzkQUPcm9U3vHJfCajQkRp1BmCXBS
 WsSqysXEnUswTRGrUYEOXJoyumVWdylrjPfxGAWgI8dFJGz9hlkCzbMkX+HLFcvprO1JUqkpN5F
 QPlVLf+TnsluOr22vHgTLRlGSJ9nipt+5o0qpPTapb+lL0rrnjQYmW66aW7Vo13m0r6awIecRPL
 Ce4ct5XpiPQhWFVrIoB2IgvkQ5jt9+F4VUtIRTXttAYxGyrYjRT/5UwkyQmJgSuGZePp/Ui3unG
 0fryUPfSGOknDKNo1Rkpn48p7/uO4AnZ/pW355qfgq3htYkBkKrNbtxG6WL/qG03/mNBF7dnRxn
 F798ZpjLR9Wc1wg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the setlease file_operation to erofs_file_fops and
 erofs_dir_fops, 
 pointing to generic_setlease. A future patch will change the default behavior
 to reject lease attempts with -EINVAL when there is [...] 
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
X-Headers-End: 1vdtaZ-0005oc-1y
Subject: [f2fs-dev] [PATCH 04/24] erofs: add setlease file operation
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

Add the setlease file_operation to erofs_file_fops and erofs_dir_fops,
pointing to generic_setlease.  A future patch will change the default
behavior to reject lease attempts with -EINVAL when there is no
setlease file operation defined. Add generic_setlease to retain the
ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/erofs/data.c | 2 ++
 fs/erofs/dir.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index bb13c4cb845563492a616fc000910112b92df555..e2941b4715616528ddede2dbb9c0744db5d11be5 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2021, Alibaba Cloud
  */
 #include "internal.h"
+#include <linux/filelock.h>
 #include <linux/sched/mm.h>
 #include <trace/events/erofs.h>
 
@@ -483,4 +484,5 @@ const struct file_operations erofs_file_fops = {
 	.mmap_prepare	= erofs_file_mmap_prepare,
 	.get_unmapped_area = thp_get_unmapped_area,
 	.splice_read	= filemap_splice_read,
+	.setlease	= generic_setlease,
 };
diff --git a/fs/erofs/dir.c b/fs/erofs/dir.c
index 32b4f5aa60c986dc2acf209960ff6df4077c7aa1..e5132575b9d3ef958a8acbe80bd0d2ddbd865135 100644
--- a/fs/erofs/dir.c
+++ b/fs/erofs/dir.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2022, Alibaba Cloud
  */
 #include "internal.h"
+#include <linux/filelock.h>
 
 static int erofs_fill_dentries(struct inode *dir, struct dir_context *ctx,
 			       void *dentry_blk, struct erofs_dirent *de,
@@ -127,4 +128,5 @@ const struct file_operations erofs_dir_fops = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl   = erofs_compat_ioctl,
 #endif
+	.setlease	= generic_setlease,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
