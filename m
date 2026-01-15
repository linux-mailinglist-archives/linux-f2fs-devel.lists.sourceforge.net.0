Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0BAD26DA0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:51:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1VeLMAUyIG6sQNJHZevO75DGLJfSY5REE+CjOldRmY=; b=VwmgI4nFSQENw49kF7yC5bcKt6
	I1PyTNEttWe6hLmbDhiwfMTmA2RzbtPwNOgWdqhMlRnTZkZ3zeShFRKbet+pVxx+O7LexzAKTiiMj
	IFYZ53ErtfJHnUT0QB+wqlDEluLthjxyKji3n6m2WzkZWDxmtsNJqblnoqSRcuXjWarA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRVI-0001yk-SR;
	Thu, 15 Jan 2026 17:51:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRVH-0001yE-9c;
 Thu, 15 Jan 2026 17:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xNSjgsgRtyIw/iC+tCBD49WoY/riJf+CPAjf9Te8tA0=; b=ermE5jSyN2hg+Rq5bR0B2ouFIG
 lgGdY+4Rr0QCCX+hDdlFuvA7maETITKA23JM1bTOKkR/hSHuCla2q6mxdPu83Pc0/w+TabSl5c72a
 aPEJT5y2HDR9ER6K9iBmzFWea1G/OrqmLqi0Hr+FaAMg37t7M8pDKe32UsXyEOsUjr1U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xNSjgsgRtyIw/iC+tCBD49WoY/riJf+CPAjf9Te8tA0=; b=MjayFDtGGx9yHYivJtiEhN3Swc
 3Xamf033N3jccwr2og1wXTL822P0RUpFmZRoXM9YIFp4pXvx/Fgljc7KWPAdvm2Sxod3EHewrZnTl
 OT0SZyd8SEABO2EjzjcXQ0VbZ/e+7X6ZKMKf2H8XTpYHj0ufowmowjMaUYyRnLk32HrE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRVE-0007yL-Rq; Thu, 15 Jan 2026 17:51:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7DD7B43830;
 Thu, 15 Jan 2026 17:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28E0C2BC87;
 Thu, 15 Jan 2026 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499474;
 bh=3Lesog+saJIE7fVwXxIqzocDbbL7seXSBVcQWCAEylo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=g7YSb1/TODzXkcIP6p9/wwYu2DGdEGs5A1xNbEaa6YXpXHCkZo75dKOhpzbEnke70
 tFl/wi+2L9R7juokN9RrAO2hzFkzOo1UolYG7PTrgtqycoumg6wuMYanMSAiGEcL5+
 rrebzmnse1W5h+gJbvvkGvabjn0w4tpVTl+YkKEq2+zyxzqIIVNGyGxTNWXPGgnVDI
 yas38IdE9VvF4iPsPwJa+4aGhd++bDzX+ryoJ+6LAed16KiFtr8ZpWA0uQW4o4J8uj
 O85No7vo/UQXZUte7vVLWFrrfWkgy2ib31R9cgJpIQxJgqj9Q4vVS5rQZcE6nkgtGB
 bWbKRQtHDsekw==
Date: Thu, 15 Jan 2026 12:48:00 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-29-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=933; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=3Lesog+saJIE7fVwXxIqzocDbbL7seXSBVcQWCAEylo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShL1IWuANGZmRgu17fA6ieKmPdFRTw+kdOfE
 T/UW6Eb7tSJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSwAKCRAADmhBGVaC
 FVMKD/48eycQzLl5j5B6HkE8L1FfwXraMaTibRGf1ZUUO1tdf5xaliTxEmmTz245juQt2kJL6vV
 t3v0tmVInLOvhNl5Gml0VNKIfoY4DHYYDMqab3/BhWW52OAXYuFC1OHvNjVSOItR8sbZ+iJfdmP
 cpCABU6fsvW2RanNoGDQLVF2gHpTCVktYbUOx2fTqCClkLlPc7eyiG53QS9imf2Af1jR9/MObU2
 UJC8aPGoFg29JP+VBrJ7+K+uG/qCZ+4Lk8yD3Hb0EdyY0XHb70hMV4VEfQq77MoCSoVGAWAYq+b
 sydLKAPVS0MlM6fWB5A+y37+o3lo+1bVTlGmwslQVeTQiyGkKAYNQNCMygOJQ75i8hJBaJ3Ui0r
 wPpANaw1oBzTALc2orq3uIyZ2m6Kc8WXMOVdDcT86U6pBRMdATdTLzeEaNV+i+eRTrA8gCkrAXq
 JtaYC4ihJzgaSo8BPtxAJdlyFFkmEA8kw/Eg1fhJwl9r88x60VPSbw53L7sBrhYiykB4xsS0Yn0
 hW4FHIe8yJXugnlD+0XpRgz9ejnjAuydomhlSsmB109/2pn9NyuzvVEW6QO6oIhAsH8y+nYAm2O
 zDhKSTd453A4Zb1cz+XkXonK4dyl1yN7vyzDar6cQ/2BJVoC+1C7e3OSHy/2knx1Qt3EFlycS5s
 GPaWvnhRUrWOAkg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Some filesystems have grown export operations in order to
 provide filehandles for local usage. Some of these filesystems are unsuitable
 for use with nfsd, since their filehandles are not persistent ac [...] 
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
X-Headers-End: 1vgRVE-0007yL-Rq
Subject: [f2fs-dev] [PATCH 29/29] nfsd: only allow filesystems that set
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

Some filesystems have grown export operations in order to provide
filehandles for local usage. Some of these filesystems are unsuitable
for use with nfsd, since their filehandles are not persistent across
reboots.

In __fh_verify, check whether EXPORT_OP_STABLE_HANDLES is set
and return nfserr_stale if it isn't.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfsd/nfsfh.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/nfsd/nfsfh.c b/fs/nfsd/nfsfh.c
index ed85dd43da18e6d4c4667ff14dc035f2eacff1d6..da9d5fb2e6613c2707195da2e8678b3fcb3d444d 100644
--- a/fs/nfsd/nfsfh.c
+++ b/fs/nfsd/nfsfh.c
@@ -334,6 +334,10 @@ __fh_verify(struct svc_rqst *rqstp,
 	dentry = fhp->fh_dentry;
 	exp = fhp->fh_export;
 
+	error = nfserr_stale;
+	if (!(dentry->d_sb->s_export_op->flags & EXPORT_OP_STABLE_HANDLES))
+		goto out;
+
 	trace_nfsd_fh_verify(rqstp, fhp, type, access);
 
 	/*

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
