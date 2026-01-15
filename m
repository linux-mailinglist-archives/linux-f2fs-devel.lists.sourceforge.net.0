Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3819D26CB5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:50:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3vfsCXDBNjsEx8SfvGEMtotMUaQPnVfSndAh9EEJW0=; b=iEZJ2d7PFjYWPRnbGhmuSTANp1
	2aBJvJvaL5hJKEI25WybrVqjiTjqKXCmUAWY7fgp2dA2T9eX6KWgBPZjwJqVrZiW/f2vMlXJisHNv
	wQrurXJeucMwfFJU0Cu4BC/YMvUfwbwMYehngwZ6/5C4jR+a3q572fRPKo6RdhIW7NuY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRTr-0001OM-Cv;
	Thu, 15 Jan 2026 17:49:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRTp-0001Nx-CX;
 Thu, 15 Jan 2026 17:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gzKR2gyy2aIz+OBiQsjB1N9t5p79oZzAtsRciLpQc78=; b=A+9dcnMHqu/WIgG7NhFX69TRs3
 FwCQVV8zU9tL2KsZNq5scs6aIQ/KLMC1RPgh/AxF7n6TJS7UPWmQXTdb63L/kk4DaFc8tvGrAYgrW
 ojVoc2BR+r562TZQnXgHWCZewmQhUdrSBCIa1IJqLhgayzwgiuLuMAQCFEpbxXOAXsWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gzKR2gyy2aIz+OBiQsjB1N9t5p79oZzAtsRciLpQc78=; b=NQ0/a/rxI5CFDp/FK7749eB6Bf
 u/Z5882IxYtLAma2U8FNY9oDPVzccB6U7uROwf353uOQzI0UTyxhnaRXN/lEpCi/ZF0qvl+UIpcg5
 WbXtYgp8lTFYMOVZ/QqqB3GatGmUbJxkSe/XzKQ7gr0DZV/FH3hNnOKf+r+CZEOIBPTg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRTl-0007jl-PS; Thu, 15 Jan 2026 17:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 687B844413;
 Thu, 15 Jan 2026 17:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2463C19425;
 Thu, 15 Jan 2026 17:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499388;
 bh=4X4oMdETf1MDXNVdTj8Mvnuo+gH/VRKi/jbZgD6BtXE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HXF5eSd16LXlk2pg+ykoxFtOltKLYcVhDbq4eu1qwmD9XuCNWEyYNq/SBbzMC2xZp
 Us30TUq2Qf0LqFXcegPXmaUXk++IckN9SudLLGy1m2S/IWaC9Fe3O7QdJixMC/QzW2
 HJf9rCe/ppr7ZNSUKpXLcTQLpiUAT0OY1jeKS3UdP9YlVuUmo+x7zxnsNV6KlYZ7IU
 OaZtTAo6JUCABYVdaE5e1ipItaqt9i4ljmLQp4ZO65psdJ+V6VolZKMHaqtQRalSo4
 sMz1xXvAVGjzhRpu823inA7f7eVi+tZrnpoSlK6flDgUJfBJnR2OMCIZpueoNVb0Or
 MITNRwqqqmCUw==
Date: Thu, 15 Jan 2026 12:47:47 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-16-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=920; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=4X4oMdETf1MDXNVdTj8Mvnuo+gH/VRKi/jbZgD6BtXE=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShIaOS03XvPpRfdi/+BkUUJRyp+R3CppMLW3
 ZiynNioo6+JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSAAKCRAADmhBGVaC
 FSKRD/9yG9hD8ojJ6IljtJlzqxX5Mrd2/ao56DDsFXOA9FWMnwCaPHEJAENPNEWtwbmo+vNTjlp
 lQudXpKYDOeNMFVDBXjh6s7BskipekJgzjceXBd/7Z6OS9tRE/xrCWPE15WxooWzDH+MPSod03a
 dXyjbFBx/fMXGVLhHNec09c5PmN/AeUd28FN9pbOkV9+YFIABVgdQ4JjsdPqcHRpqcAiW6j5R1x
 HgNZYRunFukBcUwYHbHQXKQXMa7FEMKpQjmiWSpu4vL15ExPUoGC/AV541L9S3ZmMEFY2SqHxsR
 Fd/cWtvMpc0G5qWAV7q1qmHzpe5466KioKlFxu3HYEz3QVwWi2q2URf34dPKhYlj/SMZ9oDE3H6
 5ijLnuOZj7i/WgY+01ZxkNw0O8sebKJEN3+oguERhCG1jmSPmhERSbTg59Jh1Rpt6wU/eJ8MRSP
 mp5A0ii8f1xcVwyBnfe0wxC7fwXmPZorUgXv0TuPX54mAhzf0J+50OTuensdWi4sVgUyQ4Rv26c
 fUkFlkdWL6b67iWWqJHGyiPP/+lmavFA665rkX/WhAw4ATTVYmqKAJ3kI/M+4G/svV+Cq5ZxfPJ
 4W9/XSnk5zbuOwc/0/q/U5L4RAyIQDrojuGi7pHqgMXVPyD6jrJYx5YsZIgEyYbJcrMh6+zUrz0
 s2rdJhIgISrWcqQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add the EXPORT_OP_STABLE_HANDLES flag to overlayfs export
 operations to indicate that this filesystem can be exported via NFS.
 Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/overlayfs/export.c | 2 ++ 1 file
 changed, 2 insertions(+) 
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
X-Headers-End: 1vgRTl-0007jl-PS
Subject: [f2fs-dev] [PATCH 16/29] ovl: add EXPORT_OP_STABLE_HANDLES flag to
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

Add the EXPORT_OP_STABLE_HANDLES flag to overlayfs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/overlayfs/export.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
index 83f80fdb156749e65a4ea0ab708cbff338dacdad..17c92a228120e1803135cc2b4fe4180f5e343f88 100644
--- a/fs/overlayfs/export.c
+++ b/fs/overlayfs/export.c
@@ -865,9 +865,11 @@ const struct export_operations ovl_export_operations = {
 	.fh_to_parent	= ovl_fh_to_parent,
 	.get_name	= ovl_get_name,
 	.get_parent	= ovl_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 /* encode_fh() encodes non-decodable file handles with nfs_export=off */
 const struct export_operations ovl_export_fid_operations = {
 	.encode_fh	= ovl_encode_fh,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
