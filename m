Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 973BFD3B0EB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:29:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HqO2fWFvo27Hyx/WGf/hqXIsmwL29WpJsduPIqjfSI=; b=k7OO6olipHdsVI4ylFrwFXIVoK
	j/gvXKhxm/mtKhMeTdG0aQlbw6FtqdNM+ei9Aq+j9fS4pXirPY0Th3KULLYDHFKs6gAkRC8VsPdWz
	bvqKQ95WXt50yXU8mIwgrptsIEHgnhfXG4z4FRf+hzjFMMgHlvXaBZzKujWQhcyANi3o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs8V-0005C9-2Z;
	Mon, 19 Jan 2026 16:29:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs8S-0005BZ-Ow;
 Mon, 19 Jan 2026 16:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=unQZIMmBuwBESZfWPZUx8aoF/Z64QFhIVbQkTy0DEhI=; b=SV+4Vm9Aj5VHCC+Qaqg5oayUAv
 DsQz72cF20ektjHArD35CsXslxLo2YOBlMP1vuVt2gtRlsXGzenwBBOOhjSUcMiacHZM+M8aBot6U
 W82tAsjDFtNONs7xI9oohRd/SxLIevWfZSKvIIRhQQEGoITkzC1KHAsUDbteVbE44l14=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=unQZIMmBuwBESZfWPZUx8aoF/Z64QFhIVbQkTy0DEhI=; b=BdxXInwhP8Ym9rFSn/4A4K6RRH
 8d3JXjMtYm8sTqwDQo1kwSS2TVOC4iMRE8jAu8dWJvmN/SmwtYz1XECxB4eAMfFkOiYJBjUK7EknN
 K3idLTmyI+Iw4uhJ5ZH7XVSvxWr8PBxcnHDrBRtTdJMRktbr63kj4zmo8skzrnMcvmMg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs8Q-000808-6m; Mon, 19 Jan 2026 16:29:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D049C432E5;
 Mon, 19 Jan 2026 16:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A2AC2BC86;
 Mon, 19 Jan 2026 16:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840175;
 bh=wU0i80DF0FPqjAJHIRj1jzTtyUWnKNMBQnZ9bzzbTDU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CQhJYRGsl++lczxBHEt0XaGrxt4g+6vUAYPrRcw73aIRch0FVGyVATEdpccesSqs9
 URiwqrosG0CP1irk12+e/p6RW108GpwftJnbPgTyy2fk2ZtHaWu7YwXKfTUDCT7YYj
 habn8bLFMPil4Fo9jX+sOzecRJ5OFTjN4cW2L+RT/+8p/XIBqiQIMLfoTEAaz/wSHh
 doBGze5VI89ZR4tztzP2HdKsw/to1rJmbiB4hBqqDRpYdgi+Dj6yOzMVJaPZSCucM7
 DQJ25RKNsgdm2ZepzIPIGXX2yldRuLVlW7b4p7/LwXoa0VcVJA9Oumg369d6XFDOIa
 NZm1zFyOw6MWA==
Date: Mon, 19 Jan 2026 11:26:36 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-19-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=724; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=wU0i80DF0FPqjAJHIRj1jzTtyUWnKNMBQnZ9bzzbTDU=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltdFQ9b2g6zsfezKJIAwvxbngmwk5KhwfiY8
 +38M8QDAHqJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXQAKCRAADmhBGVaC
 FVVbD/0SRJlTCFiMglDJE7H/jWRUflYuMXEi8SA2hCybpcjI0Lzhq3Dftiwn56jC0/slUH9eZYc
 9ZXJtO5rQMFFiob97e8ROh5R8oMwf9IvoJEgVnpO/91D+7bdk4yz4p7St+51XuIrbzvSEgdGEAr
 1/Ox4Xs2wr1PzX7Nv2qi516wzYN8pn8Mk86h9xYIqx/eEsKln5byAJOYF1JtQ5E+VtXf2hQ98va
 1yxfDCOCcAxWwPhsjwmXIVinqlwfejZj9y0mBOdaJTScAIB9E55sGMOQgTQnqr4rwl2tvvE77+T
 LCr533OwnRhMTIIoQSiysB24g6B8Q9WsZiKtZDZ2FK5VM+7+hGjBnj7WuU5akAKL0Yh+lQlq4wb
 f3Jdhocl0fC/LsL0xJ6Z+hm+GK3AavJw2cOREDtGmzE/+Gm/okWTQBg28Hfn1rfewYRsEUNryaB
 7NpT7W7kYaJB4F0KZJHEpQyidU62CBjmpds4LOuqg5dUwlyf/Cz41R9qEPolEWuxH9vIrOdcjSW
 KY6o65R+9LmUB5hnJ2ZB7baC8zppQdPF82yaEOO17NEB2Z9O755Vwf2eMRV2kyVz+/olzSvhG+v
 RRvie1TZQrd1n31fdwJYNIrYSyQoDqWTEJSqbkLU2i0JJRAjOJ5sGbimADbV2dyDswLBJTKrBDB
 xyY5rmCt0KvYE2Q==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to ocfs2 export
 operations
 to indicate that this filesystem can be exported via NFS. Reviewed-by: Jan
 Kara <jack@suse.cz> Signed-off-by: Jeff Layton <jlayton@kernel.org> ---
 fs/ocfs2/export.c | 1 + 1 file changed, 1 insertion(+) 
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
X-Headers-End: 1vhs8Q-000808-6m
Subject: [f2fs-dev] [PATCH v2 19/31] ocfs2: add EXPORT_OP_STABLE_HANDLES
 flag to export operations
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

Add the EXPORT_OP_STABLE_HANDLES flag to ocfs2 export operations to
indicate that this filesystem can be exported via NFS.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ocfs2/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ocfs2/export.c b/fs/ocfs2/export.c
index b95724b767e150e991ae4b8ea5d0505c1ae95984..77d82ff994c86037c14fbf7a1d9706f1dd2b87ac 100644
--- a/fs/ocfs2/export.c
+++ b/fs/ocfs2/export.c
@@ -280,4 +280,5 @@ const struct export_operations ocfs2_export_ops = {
 	.fh_to_dentry	= ocfs2_fh_to_dentry,
 	.fh_to_parent	= ocfs2_fh_to_parent,
 	.get_parent	= ocfs2_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
