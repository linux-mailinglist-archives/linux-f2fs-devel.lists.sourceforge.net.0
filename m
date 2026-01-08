Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B314AD04D18
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:15:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKKZ0NQeDUhPiLbApdAHHSIDDjEpfiwQC9K0FeWORxo=; b=X50L3uexXxOT4JIYV9PQkf1BkL
	z7SqKzLPske1mo61GVQWXFz/fWq6R5dZpSj8HDGOo442nGaBOpXeOnnDdIDTrj4HLpe3/8tUZwl/B
	AQu9qG8bkEj24QSoxrs5wPMeAXw1obEgnCGLBuptt+ffEuYidOV3fafcBVOqxcj80v7s=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtbr-0006ib-7o;
	Thu, 08 Jan 2026 17:15:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtbo-0006i8-J7;
 Thu, 08 Jan 2026 17:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PIkGxSckJddzOm5mr5N7BySxqdSOcwEmn39dA60iKok=; b=YSo0Ubbb8DzuHcLmIPfyd5cxXW
 i/hY8rCVU49loo1g8QV93F7Xo2nwudXrMOTukrtVudzd7uFlkLr7mLa3YqJD6HMUQsEIqQ0oUhumO
 JUXoM6/By+9mlAIM69QZfY0cXjqqNmVrNfOOxdsrrvV0TN5CT5mdLhqqAUn2iwmFwkgA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PIkGxSckJddzOm5mr5N7BySxqdSOcwEmn39dA60iKok=; b=l/HK8CBVGy4zNZgexObjkZWtCf
 IrrG4uT6EKodFCyS6oEHKJWDtFq6tSko+LS0awhQa2D2tVRQ5u0+RZdiKLkafVPE+P16YB9vf0CJD
 4fK9urSahSjFfXwuW27Nb5fx8TEcZylnKNq9ZN3b4RxuviVXOeCMsw4rqMvgZ7yJ+Eqk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtbn-0005zm-Pz; Thu, 08 Jan 2026 17:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3F4BE60149;
 Thu,  8 Jan 2026 17:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1798C116C6;
 Thu,  8 Jan 2026 17:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892528;
 bh=lPmy5m2b6fstUP4HTh/TkAWFgE8sM8Qul7SD/NBtEMM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=o6pSqLEjn8qK7qYNebbAPkZ/JyIkQW++u82AhUwHi9H+QW2iAyt2/YV8OGsxZd1A9
 ENrWknJg3NuxCTQ3tUkQ1nzJNdFeu2kkZmIWZslXtUy6vu4vYwlwaK2LDvMonkrRhF
 3DHPRixwdk37Z3HJCNoiFPBNw4693o6PHwWpI06acd0vWqBNZaKtDxOBBL5GKH39ZA
 mbERBl79ANFf6jGKxR6nRABJR3U3eh0aPlvqDAYupbvpmt5OfNovh+dgAcWgFcY9LU
 VS2ZwmFVEW/NiRBVP3QjkmbYkj70bOwxmxx8gLNaqaMxaDmsgaKB3rvo5lQYD+x3aZ
 OaVj5eawcoMtg==
Date: Thu, 08 Jan 2026 12:13:09 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-14-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2198; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=lPmy5m2b6fstUP4HTh/TkAWFgE8sM8Qul7SD/NBtEMM=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W8LwtRNR2sBvsfy/GEh9ZefE4EjXAmzXj3h
 zdKm8qXc5GJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lvAAKCRAADmhBGVaC
 FbfXEADAKoRXZYBYCpltQSV7jdjNKk/JyP9tf3Coi/d7GV8fbo+eZK1ue3cTjR/mnT8hTfpD1xc
 5iB3iihAi3kCkIJSXzhpU5KSj5hFQCw343IkafmT3BIx5qzB72aiZMDoAsWRpM3GIreEyEh1sl3
 5Ox+8W9SmDsCzuHZ6gkAXHoarhyBNbRNlsYF+9XHx12xDx2EPVsr7cNp2IEOTtznxjB4k+JBIHG
 UlXRMlUV2UsOWJuS5EheCi2MMjIz+jrNb10YTMZO/ViLSG5b4xfU4a0BjaxfLJmzlNuVxFt5u47
 jJE74krY8s7YAOgW6N5+RB4czfrDPInVhccAdJcQYtAooHkgCDp+mTfMqlqZR7yyjeJf76atjl+
 +u8kOrnz9IXqT0pc8a1QsuAMA7SsW0nBEHcoGbobIpfstwgPDADr+lEqBOAu/SO2hbsAvBVN5n8
 Cx3bipjsINEhrXXbawsgNTUG/Ju8P6zGspNVcDL9yp9ry86Vnp/+WihRVDWnd7/O3XrcpKNtQ9e
 0xmTkabjcapHBXNsYeAA+dnMdTzCt3N16zrQsDrFEw2RublZKzJfg5f2O6eRXDt8/yXbFJ86oxp
 QBcIiI+HCS2lppFLxe4GtpIu69t48Rv29J2fKJ3q5RTb3WDfYDxGbNkeift5ZptZ9QJ7hvm8Lam
 SG2twaW+WuHsXSQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add the setlease file_operation to ntfs_file_operations,
 ntfs_legacy_file_operations, 
 ntfs_dir_operations, and ntfs_legacy_dir_operations,
 pointing to generic_setlease.
 A future patch will change the [...] 
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
X-Headers-End: 1vdtbn-0005zm-Pz
Subject: [f2fs-dev] [PATCH 14/24] ntfs3: add setlease file operation
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

Add the setlease file_operation to ntfs_file_operations,
ntfs_legacy_file_operations, ntfs_dir_operations, and
ntfs_legacy_dir_operations, pointing to generic_setlease.  A future
patch will change the default behavior to reject lease attempts with
-EINVAL when there is no setlease file operation defined. Add
generic_setlease to retain the ability to set leases on this
filesystem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ntfs3/dir.c  | 3 +++
 fs/ntfs3/file.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index b98e95d6b4d993db114283a0f38cf10b1a7520a9..b66438e34bbb84483c5e6a5dde437251339d4335 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/nls.h>
 
 #include "debug.h"
@@ -630,6 +631,7 @@ const struct file_operations ntfs_dir_operations = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl   = ntfs_compat_ioctl,
 #endif
+	.setlease	= generic_setlease,
 };
 
 #if IS_ENABLED(CONFIG_NTFS_FS)
@@ -638,6 +640,7 @@ const struct file_operations ntfs_legacy_dir_operations = {
 	.read		= generic_read_dir,
 	.iterate_shared	= ntfs_readdir,
 	.open		= ntfs_file_open,
+	.setlease	= generic_setlease,
 };
 #endif
 // clang-format on
diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 2e7b2e566ebe18c173319c7cfd4304c22ddd2f28..6cb4479072a66dc9c3429be1c4bcebce176e5913 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -14,6 +14,7 @@
 #include <linux/falloc.h>
 #include <linux/fiemap.h>
 #include <linux/fileattr.h>
+#include <linux/filelock.h>
 
 #include "debug.h"
 #include "ntfs.h"
@@ -1477,6 +1478,7 @@ const struct file_operations ntfs_file_operations = {
 	.fsync		= ntfs_file_fsync,
 	.fallocate	= ntfs_fallocate,
 	.release	= ntfs_file_release,
+	.setlease	= generic_setlease,
 };
 
 #if IS_ENABLED(CONFIG_NTFS_FS)
@@ -1486,6 +1488,7 @@ const struct file_operations ntfs_legacy_file_operations = {
 	.splice_read	= ntfs_file_splice_read,
 	.open		= ntfs_file_open,
 	.release	= ntfs_file_release,
+	.setlease	= generic_setlease,
 };
 #endif
 // clang-format on

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
