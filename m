Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEFED26CE3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xj+jQ7vaBNBuqFbpE8TsfftJtl8qOq0gnLZFy48ca+A=; b=U7Fvaz5bvQWk5+u0O8ZHrSEm1Q
	amfSSsX+P2ebN168Wwvx+1s+SokReuD9IrxUsMIfXY4Jb5uB6JUkSMetQNUI74JwmRaHX4H2FnKuY
	mutRbFtSNj6S49rV5JVXXs8R+fNhTZftCMB/yrlmtsJue6ZuJnHeyaLGWlpHke+ntriM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRU2-0000Uy-Ok;
	Thu, 15 Jan 2026 17:50:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRU0-0000US-86;
 Thu, 15 Jan 2026 17:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=koSNGk/Vom2LZhpxaJrpB604XEMfBvGIQVT03DlSk+s=; b=jv7APDF5Y3EEjA89ByccVIuUno
 pjor15eCd3tCI3lImb/rOggzGkxhjCNT7icTWlejlQ4Ux+ynyu7zLDbBnuNckVeIzvKxVXW8S2dsQ
 Kup5+dGXfMxKZkuUROqdGRgYXtb4X/xYGYqCYEgpu9aLC6oSVtFwXqtuly9pQ6mG4ex0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=koSNGk/Vom2LZhpxaJrpB604XEMfBvGIQVT03DlSk+s=; b=BeFkyRSPMw9mK2tQnMzNgn1W8k
 05/HiF7a6GDKF2Frk7K+jJmmHzV4hd89yfTDg4DjkahhpM8LoWUcBM0IlTxfs6f/R9HTDqMEIt8Ef
 atvH1cKmtKJ7g7ZnN6fUgA9snlPYoCEujH38eHHbigmgDIHHhy4zY8clVT6Imqv1nRCs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRTz-0007m4-IX; Thu, 15 Jan 2026 17:50:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C7029601B4;
 Thu, 15 Jan 2026 17:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D67C116D0;
 Thu, 15 Jan 2026 17:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499401;
 bh=uwDrVoHbpPoBcmo/v3dHeiBewkzxqNNqtxlZm2e4dt8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BgcU8VF4uU9VNdxjCqNfjET7gHGx/VAo0oeIqeLRdIsgPaTT6ct03dx2jrDd7o8BI
 CCshVV1E208sOr9o2PH7/g+JfxDpXY9eZDUibvIq8pvFscodjQuSN8RWQxruSKXoI/
 hgW78nAy8K5x9VS3/1/p3O1mrvpBnt2hfAlVpoyRe05AcB2r1c5qou3xP7ajy88NQs
 ZIX0etbtDG0jg8MtYwH8eYXxe6RowC6CHSQkZ4tfMrgVWi0rtt4KD4G7v8NmX1SKpf
 +ycIqXRbQcG6Cw7cOfPPhmE0wJkxag2JDFt9f2GH6540kL2VxJ2UyVpvitSiIDeIFm
 tgS/jf+s8G1Vw==
Date: Thu, 15 Jan 2026 12:47:49 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-18-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=686; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=uwDrVoHbpPoBcmo/v3dHeiBewkzxqNNqtxlZm2e4dt8=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShITPD+RPkPMEpLXnnFoYUrWRBnV+i6/7ZXb
 2Cib6qgPF+JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSAAKCRAADmhBGVaC
 Fc4lEACr6zvbp8mwIEyJqUBPypx0CbTv1b+btQfVmrA6CGpz6NlXnPBXu74SWbwJx78R9naDxSo
 4ujJV+JxC2vsZN3gMSbSryefeh8vZFixmZ9GKrLwy2JF+yR5MDnrhDIYFhoust1m/CpIYwTQLrN
 +OA58sbRtyhvTPNH4lrppknmtdvvnrgcMCc67prQQoAY7Kj3scJ/0f2hABl2MSEXjYjQGBAv58E
 h+6QcX9C2XIItQt7JJmt4EDshWg5v1sWm/f2qRitZE0LWnzNgY2OuGNuCDhWXzEDfCsTzUrlI4W
 mzdzEglnrL8uYAbYYwi0B7c/Lq/vHAOXHlJ16H0MzyYhPCFrt8PeDXExqTc5bRkzyIwecnQqV93
 ckgmq1M8drIiGpvkwBXihOVHAgYI/F9dJ22BRkXcTJKuCe1hEcqQiMrpjMU9l4o7EZv8tiR4Jmh
 aru/nnZVOrSyeFUiQLuQ+mpI1QKdrp5nuLV/2yhOXcHpv9wIYritLVYCn6uu+2yhjSywg34K9lK
 Y6+l5UAQpaFC8ea/mQaaeZYFDFhliHr8y3hTzrVvm0bl6YExJefRbNT3UPxPyRcGgQH+bVzthA7
 BLgRv7GlM/YDGxkyl7UNZlKjzauOn/nQxU6EqVlzLfm7Lt2s/99ujhx6ajeRupcwTat4e/vkE+b
 NnihSUwg08h5YFQ==
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
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/ocfs2/export.c | 1 + 1 file changed,
 1 insertion(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgRTz-0007m4-IX
Subject: [f2fs-dev] [PATCH 18/29] ocfs2: add EXPORT_OP_STABLE_HANDLES flag
 to export operations
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

Add the EXPORT_OP_STABLE_HANDLES flag to ocfs2 export operations to indicate
that this filesystem can be exported via NFS.

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
