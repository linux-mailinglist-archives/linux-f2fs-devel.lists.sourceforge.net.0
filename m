Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE70D26D87
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVeYGIKeE8+P57pja8HX4F5aPUJq7msXskzbbmmu38I=; b=lE6bRq7KI+YdIcWrUEUTgSAjlw
	Izi0O69A+gCXZKgyRcUEyJi0OIgf1VuctVn+x4Hd7X8Hy+HIjTZCqO3WZyiUMvEB9fNUFpsbRDNTr
	XuoHu7Mhq+XIff/j1xN42KZRdOWG4Xn6S7Q5lGwp0n6WFrHEJV2yrLrn0/eg9Y4HXMi4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRVA-0001v1-NV;
	Thu, 15 Jan 2026 17:51:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRUx-0001ss-88;
 Thu, 15 Jan 2026 17:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yuTkwBieDaBYfiVvkErhMkdIL4UCbBwNP1dX5h4YmOE=; b=UwZHNc/p1jnMYBeJYmhcK38lpC
 BDfcat0Z2UNL8mHGTLdjXjA069yCE3Q1aftBh9YcuI+VRFtL5y1vUNXnX+fR6qGs5P24G3nRpufw1
 NA4YmMwoxJyq38fIvgzpOGiPj2EPnIkUUmdVz5cTms361/aT8LIATwpKZFVIwxOp7E80=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yuTkwBieDaBYfiVvkErhMkdIL4UCbBwNP1dX5h4YmOE=; b=BqiY70+K1TV7JlcbcmeTzXO2/3
 XpQRYdT+MpSIDqWg/JXFeKHHTkLjt1Kq0omML9cobr7RcW1RAAqIeYXPb16XNtf8W3kkiJVvfYECV
 e/aoizEtUjb2FMdXkA4OO14vpn2/7MQoebOsOJTZl1BZcKCmW6X6lH6NhJlypL07+F9s=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRUw-0007vo-KP; Thu, 15 Jan 2026 17:51:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 43ADB40ACC;
 Thu, 15 Jan 2026 17:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EBEC19422;
 Thu, 15 Jan 2026 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499461;
 bh=Zmo+do6HqZsZlZXVQKKSsmbSay6qOtqCBcv8Ip3ODxg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=I4ocNczYItMV4PCO+hbSpubXFxTOOvRwelQ5iEnGP+dxJfSBdkpaS8BgcPNjtQo+0
 13X39dc3sCfjz7ZMXaPaDIvAVfQvYuD8rsBiUUssjnbn+CI2LeXh9lW609XNO9pJW4
 RWosIVWkPRVb32nDlMhCWWWWcgwSn5dwcfPmFsSOyDc8tvb8bAksTdZfwJieQuT+2W
 oaeOsUCW736bb7SBCyxDve76M1+gzPkiVc2w03g+s5JUvg1tzkRrCMNi0uG2DxZ8OG
 VNeaPNWMgyHbFRSgKK2V3mYG38tOvn1l0448Syr6c4z7fJRlqPTqYQWDN8yvnUIlt/
 GVi49NPoqT9NA==
Date: Thu, 15 Jan 2026 12:47:58 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-27-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Zmo+do6HqZsZlZXVQKKSsmbSay6qOtqCBcv8Ip3ODxg=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShL32CLlH4882Enb521JW8XT+IGMo129fioR
 FwAWlYbPrGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSwAKCRAADmhBGVaC
 Fb/iD/sGhyoeoGw8wPKWzF+cMfVdCztiCASS47/vMz0oiXGV1gCEhqTG9CMIze18Tl9Pk0p+mvq
 lwQsBXayjGP3BD7Enz9ZTXdz7FGGhaKcQ7elWJ6NnDpTqPG61yQ3iPz2tocRnByahbNXFGRT01B
 bDDG4/0lRFn0I0s8tvRGH2GA25WUCRHpQX2sqaeq3HUDDN0AO+NiX35P8nmzTYTIn6azTBEJvqt
 i7m8+BV+qB1SQJsg0wSgcn28i3v+spVZ035ydFW1WchRNsDB/B3h6MvxtR5p7m7ILVITniiPuYv
 3AjUCweM/5jRt5ND1mLrbJrbHRve0L6jhiggdidkpMJ0bZlxgDKXuNiUntjwNb/KzO0f3RYobnK
 R01fL7cRrHYRgu+sda+g9CT+vNULB2SFSivuqhJur7e1BvLo4eO63/TJwnrBm0yi2XuP/C3szYC
 pOGS0FbFrydrLRpRqO/D1JVnhNWaZqp/mJGTH3DdHE09OyqAP6gDvZoCE+ARb0ivdfwKTCf22fv
 J6tbdw+dZNehkFAI9rOCQJvJeTc9RQCChrSxoR2jiz8ROuCCHx6Nh0Fth2yHiCQG0Yu4PgjOzPc
 cMpnCsz/LNIjdu+gfSKzdmcuPlCllwpeWoDOn3Ya0O2qhbEWoKGtgYAnca8FuqgEt3DtWrex0kB
 sG0+GJPuZUBNXZA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to fat export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/fat/nfs.c | 2 ++ 1 file changed, 2
 insertions(+) 
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
X-Headers-End: 1vgRUw-0007vo-KP
Subject: [f2fs-dev] [PATCH 27/29] fat: add EXPORT_OP_STABLE_HANDLES flag to
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

Add the EXPORT_OP_STABLE_HANDLES flag to fat export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fat/nfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fat/nfs.c b/fs/fat/nfs.c
index 509eea96a457d41f63f04480da32aceae75a8a4a..f6a5c8c4f5e8a14e549b5aad6643d490f1d062b1 100644
--- a/fs/fat/nfs.c
+++ b/fs/fat/nfs.c
@@ -289,6 +289,7 @@ const struct export_operations fat_export_ops = {
 	.fh_to_dentry   = fat_fh_to_dentry,
 	.fh_to_parent   = fat_fh_to_parent,
 	.get_parent     = fat_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 const struct export_operations fat_export_ops_nostale = {
@@ -296,4 +297,5 @@ const struct export_operations fat_export_ops_nostale = {
 	.fh_to_dentry   = fat_fh_to_dentry_nostale,
 	.fh_to_parent   = fat_fh_to_parent_nostale,
 	.get_parent     = fat_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
