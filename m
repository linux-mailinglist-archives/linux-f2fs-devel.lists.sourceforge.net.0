Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E910ED04CDA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:15:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUaryvslkQ8fSevTmtVQzgYjkFXW0tvQwAQRuV6bG2k=; b=bFx7GypQJGjRwCHSdJaqouluYv
	7Xz316FTiCj4rubCiuHwIleCOlN3s8snw//B5paqcnLAaRe5zE6CRsdJ3UqyU0PxMTbuSIlU3pM0f
	hWcwugFbKuEdz+vieU5cOGFMsHqkHonvVo80GugvLn96fCHEf9RHRIrIQRkfufjx1uMY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtbL-00046t-8p;
	Thu, 08 Jan 2026 17:15:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtbJ-00046L-1H;
 Thu, 08 Jan 2026 17:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8YtI+DzwDF0tnFdtfx//elv6GXPDJiavSmjVlMaJ3h4=; b=U9YJPpCVOmWqDwHSgX7QK1cnxJ
 6kfoQXL1WgfF/K1AzJdf4TmK/44nutEN0ayQb5ldHfFmgaHYy+CAG8+YVweyRqi+7DJlc4OQSJQ3Z
 Fh6ShXyNymYU2ETi1gzynitw9CTPtXpDHzZnN6/7aDqLCJNLMpOQjBW9fyX2/FUpg4Ek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8YtI+DzwDF0tnFdtfx//elv6GXPDJiavSmjVlMaJ3h4=; b=WA6crTVq1FLIHdFiJbVUeGRw2O
 MNbeuY6AGA77NNzCiDGl4WkYR4sXw2XOOyxGVzi1eIO8MTXU50jyk7GwUaxpWWIsIJVBOcMtp3kyu
 fSKlAWicmGtGq0SsHIIkYUEOwVkuwr8GNci1DRpU1urBCM2lOZJam4z85bmoTchikDE4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtbI-0005vH-Ie; Thu, 08 Jan 2026 17:15:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4335B44454;
 Thu,  8 Jan 2026 17:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B8EC116C6;
 Thu,  8 Jan 2026 17:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892498;
 bh=WgBctrBD8RLFVYdXDqzWSCdo8NzR8JtstjicYPh/U9Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Yc4/t5loZyezYaHDNXK9dd9JvafuBssh+sDSZ3exryKjh9p7XKLxOnlh0HZwejipA
 tmTIA9/0xJ8xrgH6Y0t7D/mGDf0AqOx/WxR5blHGNJ28gGiZsD17coCliZNvV/vsQQ
 6XXHPDcyYcOAYUAUaCsSzNRMecSySzNpEAlW8DnTJpjxE+2aVYhL1ZUMVLMRfcMxTd
 xcBwALhaSlls70OLDrhfnMlALrjEGcjhs7rFzNgirkNOyZkEjSq0YeHhTjU+YgFGXK
 0ZdpaO1Q0mxXKVnWoQw6OmB+h27qt7MwfOpTqYoFF0/0bFAfq9Vui9DQor/pHuo71X
 3yAVhPaaUcVtQ==
Date: Thu, 08 Jan 2026 12:13:05 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-10-ea4dec9b67fa@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=WgBctrBD8RLFVYdXDqzWSCdo8NzR8JtstjicYPh/U9Y=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W7rGRw7xJ9j9CSSmtKVJzAnrZ9HKw5x4g6Q
 fvlmyGGcu2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/luwAKCRAADmhBGVaC
 FehDD/9tUv+oBi/X1dqLnHkQjWAAqllp1O9XIJiC0Dmcj8NdKQjiIEJoahbDF1BoadzLSTlRIhG
 A4Ia4k0zHK75I3zk36XIzkn0YkeesqfVpCvK5vIKdcZPe4GPp3NEtPgWRDmyc9smykSu9lcxyGt
 o3l+UDqQoHxbqKwJZH9ShVgldb3vOGhWSCMI2sXQdc3CYDZ7ZxCc3YsKa5ZRB5LOjockkEKYWK8
 p6/cCQQ6VrgkzOzR6kcmCg4RDj2xDwpeWdoJT9ycfMG0UjbmiVkiDGAa4sRYDAVvfy03xNezHyU
 5fyokGDABc5UKt/0cGAZdgST7O+ieCGQbEmmqZpU1+cx+UOOG/2pDPs7oDoXS4jukcCWY/H5GGR
 FUVOQ4/6u1giyiF91KGM6VNNqNpV8VEcv8MEgDz/SAyMMSpT4EVfVtQ4CfbKhLzJPALVtAZeUBG
 iSE5FEWPy5iiIR+EC/zcPL87/uOHshC0KlklvrdJMW94IKhSSDNyw3dkrUU9qEuYOxDTa2qfxvG
 /Hejpi55FfCCR0Ha8ZwN9NZvBz7U51fU3QOgjIbntwAC6kia2Na5SdIB9voB+3l3b9eoMRxPGxT
 biskjjTc1jw8WRjwPA9wlhGjmNGP4Vl8Db8cK9ZzgRfrZxP+iZ8N+sFHZS0E5jwImgp2j1lEnZX
 PrqPNklrdm/ygrQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  gfs2_file_fops_nolock() already has this explicitly set, so
 it's only necessary to set this in gfs2_dir_fops_nolock(). A future patch
 will change the default behavior to reject lease attempts with -EI [...] 
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
X-Headers-End: 1vdtbI-0005vH-Ie
Subject: [f2fs-dev] [PATCH 10/24] gfs2: add a setlease file operation
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

gfs2_file_fops_nolock() already has this explicitly set, so it's only
necessary to set this in gfs2_dir_fops_nolock().  A future patch
will change the default behavior to reject lease attempts with -EINVAL
when there is no setlease file operation defined.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/gfs2/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 86376f0dbf3a553375b0064c9a1eff3bfa9651f5..6daa96d815e1e30f099938543a0ed19aa90c720c 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1639,5 +1639,6 @@ const struct file_operations gfs2_dir_fops_nolock = {
 	.release	= gfs2_release,
 	.fsync		= gfs2_fsync,
 	.llseek		= default_llseek,
+	.setlease	= generic_setlease,
 };
 

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
