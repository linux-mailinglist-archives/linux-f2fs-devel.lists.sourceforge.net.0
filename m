Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F000D04CAC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:14:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IE8LmQxhuw75wx71VVSMuDpNVw2C9nZ17O5UYV6hpcI=; b=Fk1KO4lOMDX42mAPbkYwg2cM8q
	LCq0dGMElsit7eyK4Lur7gfyBY38eLjixzAn8qOzgw6JUit/U8twjMnL18Y6liXW3KNVsWFb7K4F+
	ubNT1F+bZhTWD+603NofhoJw/0VzoLFv3554ALCqdGhaS5MU+YRFFnp9tIZkSeMJs6Cs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtb3-00043f-B2;
	Thu, 08 Jan 2026 17:14:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtb1-00043C-CX;
 Thu, 08 Jan 2026 17:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z3U3DfC95ROrQkINJU85Gnclf3BoC6EeZB3d0ZTTyF4=; b=F1/4e6cDbcAbG62+0tNMQ2Y7Ee
 xLc0Ad1WuIyNW/kuCsdsGPSva+j/VEePAjDpD5IBgWtcVeVpQaWm0Lkg1EvE8Jr3zq5i88D01nm1J
 pKA0Ff7PQ6X4HxYgwegF12piGJ39ms/7ykQoE4ylYt7e+rIpezQ/OHW9bzFcTDYHpYsM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z3U3DfC95ROrQkINJU85Gnclf3BoC6EeZB3d0ZTTyF4=; b=dFG8Wg1gsPKdg0WqG9aN6zkxFY
 wK7gi29xtNEJepJ8j0x7L4AwsNQUiXVNaMxCxzkrNmIfiftExSLGRh3YLHZxEZkxTUGbV3sIXnF1z
 xBPCAMchDqs3wPAUdG0hEs6CGnZPGaIt+XpdRvK//cutxGqsY0vUtRzZzbYvzR8EaT20=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtay-0005sP-RP; Thu, 08 Jan 2026 17:14:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4A8BB60148;
 Thu,  8 Jan 2026 17:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92A5C19422;
 Thu,  8 Jan 2026 17:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892483;
 bh=94xq5tNwwGdVFEbsY7qMy4HxVAW7YcdB4S8NrCMz7tI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=UYNgBgcZejmmXe9+DGorQt4RzpRE+LAfkhZHZp2epE14mjVE0kdPbmDA9FBeWHjMv
 u9grV7ZUhfGqgp292cdxMQ4ebVh+7j4zYMeVX1AUvqsmp+m4hG8sTJKXY2bL0uXnmL
 OIxyKXSpQg2ocYvNdp4AE5BMRYSlBgMdQrdbza/DISv7Cy76VCfxYvp5i3I5TcTajk
 YJOEyp1ppteph8H2ZBkKGtwhMld0tUqpbaGdbkBKjsRPR4g/kFdS9O8y8483fi2fAe
 qoPICRyBKGoVVHyK9qAZiaZUwXNNW3OJnBSiavsAbReAdv/Zgh89GbNfcesC6s4T0d
 QFBYXqYE9Z5vA==
Date: Thu, 08 Jan 2026 12:13:03 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-8-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=94xq5tNwwGdVFEbsY7qMy4HxVAW7YcdB4S8NrCMz7tI=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W61b/MyUzbdcdSmodRmXRKd3YgHTA99dyp1
 aKrHFL8B/qJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lugAKCRAADmhBGVaC
 FZP9EAC/KfvgDBVB+iOugVAOgIuiH2lLp5UGHRZYXoccQ7RsLXt40LrXwHbIuUnBnPTDl6Q24dk
 c+qR4vCzUsvTs6ZoB/hQgF5t7enFKO97X64gMM1cI/L5SVv9wJHkr+SlWYrN0ZRkMYbYkqh6Qvn
 YdDpzNnL+2CHJm6WeWY9m3G6MP5VpD6AFQcWS32/nlYcAiAeE8U5UDm6yRPub2BRgLrQMMLwo0F
 gT5ML+oeaRwNhBAtuUc2ywXWSazgnDwe9Nl4vdX9hsgfjqEd5ByGvhbHi5apdnDTqT/qbVjXKig
 +iWXByE7jJlTpLGiOJFwwFEPTEukug/2WKCgwXoSbYea46YVqKLq9pUVapamKmSCjXPDr9DWfYQ
 r8y4tje1jnoLB4Fp8cn9lRtS3Y4EXDQRY0n7L7VKSOtOvyFI4VGIHpsTF+SCJY+VcgswGTMeqVU
 kDjGI23wvqX81gZd7GFSgWewsEYkwNit/sgV7LOVnfE4EUSCygGym8eAfR0jWZ24zMWCeUcEGZn
 03QVAgVIEkYdmz52qL0NWwbiUb8fhK7fLvEUD/dMUt6q1Ot/7vl/H8/z/LaCO2baW1UpCuaPnIY
 maDRAn3wF963W2+JRVkZWEzuiaXz7m2dr0S/XOxltRGXHKRIM0xY+sla9/h8+M3PIOmfyRFvtqt
 V+typZtw20n9PeA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the setlease file_operation to f2fs_file_operations and
 f2fs_dir_operations, pointing to generic_setlease. A future patch will change
 the default behavior to reject lease attempts with -EINVAL whe [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdtay-0005sP-RP
Subject: [f2fs-dev] [PATCH 08/24] f2fs: add setlease file operation
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

Add the setlease file_operation to f2fs_file_operations and
f2fs_dir_operations, pointing to generic_setlease.  A future patch will
change the default behavior to reject lease attempts with -EINVAL when
there is no setlease file operation defined. Add generic_setlease to
retain the ability to set leases on this filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/f2fs/dir.c  | 2 ++
 fs/f2fs/file.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 48f4f98afb0138aefabaa10608961812165e2312..be70dfb3b15203d6d92c80b4bb64fec879864988 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -8,6 +8,7 @@
 #include <linux/unaligned.h>
 #include <linux/fs.h>
 #include <linux/f2fs_fs.h>
+#include <linux/filelock.h>
 #include <linux/sched/signal.h>
 #include <linux/unicode.h>
 #include "f2fs.h"
@@ -1136,4 +1137,5 @@ const struct file_operations f2fs_dir_operations = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl   = f2fs_compat_ioctl,
 #endif
+	.setlease	= generic_setlease,
 };
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d7047ca6b98d8a41d69ea79bcbab3e4ae4cf30b6..cd4b1d3c90ab8114533d939e8dc129cbefc85c15 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -11,6 +11,7 @@
 #include <linux/writeback.h>
 #include <linux/blkdev.h>
 #include <linux/falloc.h>
+#include <linux/filelock.h>
 #include <linux/types.h>
 #include <linux/compat.h>
 #include <linux/uaccess.h>
@@ -5457,4 +5458,5 @@ const struct file_operations f2fs_file_operations = {
 	.splice_write	= iter_file_splice_write,
 	.fadvise	= f2fs_file_fadvise,
 	.fop_flags	= FOP_BUFFER_RASYNC,
+	.setlease	= generic_setlease,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
