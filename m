Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBCDD26C77
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:49:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnFp9KTxFzCZ4DLcDrH7mmi+Tyr5EFqcLHaHdUah3Lw=; b=mYD/hOfsoeHNP4G/LhhTCpKTM1
	BgcYurQ1ipr2SiCRENsi2xUUDxpyWIs2v63pHYrY0LSl4OAG+9O0pu5e1JTopny5efy0aIT6qHSX6
	aZ91wKb3X65TjqduE1xDee8X5rUSAmGS7wJtkOuEN8QjOv23vmy3mkId88EaT+FhcSrs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRTQ-0001e3-VP;
	Thu, 15 Jan 2026 17:49:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRTP-0001dY-Sd;
 Thu, 15 Jan 2026 17:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S+9dqYpkPaX+Jx32+UewuW6FC+I4MhbHQlcF/X9q2rI=; b=cb6j26CkJznmSyN5+B6PEsF6WI
 Xx/t9pDIVfyblTq8RIcpx3YKtR8ptlxDLCz6iNjxmuCKXYB/4rFZBuvFv/ll6lis+qMUagMsr7MMm
 FN6jcYtJVmRcWjoOZiMRttR2ejjZ6M1PsiUDgcaTHuzYzucLJJhQAeGCEqqxNed9lrY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S+9dqYpkPaX+Jx32+UewuW6FC+I4MhbHQlcF/X9q2rI=; b=l3QyQjgsDaO+vd0u4uLbOlgb5N
 sx41BtSNPhwmc9tD6q3nvZXTBs+EVsU9uDRhzTWnCXRLqrmWO4k4Q7l8wA+4X7Xi4yTgKKeqCeTtB
 nRzAh83GKX0PkIEVZoTcsPrUM6/2oNBa50/lp/R8idb3Nphd1o2xAZTrnGOkul/L9NL4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRTQ-0007hO-7w; Thu, 15 Jan 2026 17:49:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E548544379;
 Thu, 15 Jan 2026 17:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDF0C116D0;
 Thu, 15 Jan 2026 17:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499361;
 bh=vIHxhWXy09cxwOBR5jwdqwOPX/LuIGbTAXFi0NJ+sEE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aoVPha7RotP93KFonT0uh/G1PEbUfw5RzccdIbFwSWenDBhTkyRjOJtVzv97+g7Lc
 ey8x9BxnX8OrG87Onr98FCMeeFPvzY9mFFWJ1ymiwRuWLGMXivaI0bR4sGFSYPTABe
 z+Vl+P07B9BOYnJ46E3xo8EGbkd1+fhpXhG2qNpWFExdd+esO9kHr1jEmpufkm9E+v
 QPBOflETm5Ydo0n4CF+1YV5V78GVEx8fbCw3C9LWmfF8KAscJIf3WE9nnTzPh/j5c2
 /UHM/HpXTiP1OdEOOgX2+fDNfZD04sq96BNryy9C3J+VVT7VM40RwnkU319j+sj+i8
 AkQrkPFtxLQ5w==
Date: Thu, 15 Jan 2026 12:47:43 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-12-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=735; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=vIHxhWXy09cxwOBR5jwdqwOPX/LuIGbTAXFi0NJ+sEE=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShHxC/QAhbO7mbVrXH1nVia3Hfviv3SDRtnW
 +y+FMiktpyJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoRwAKCRAADmhBGVaC
 FTFZD/9XDkcZd82hmY1yhsac5N/jsQmiIXeuAQ2Mkni6mEVMyB92tEdrk3Gwd8HgDOuWYPHu1Bz
 Z0O/OLUE08CCrAkc+MNTfeih8RKuVwDIW/S8xPrmsI1R7Fph8Qisc4hx8sMoaZ24qkAJ4GU+oMn
 AoBxvXpqJUDPih2yNiXyvrsdIXRJMDr0r+fnffl3Z1G/IYnc+Iom6R8Yi/JxVk1QHyJFKWBpCYv
 5+H1zVkKmg3n6OW7GXXq4boj+hd+YK3lgDgNTmYMKLeKxWajkeJ5vdqoaJwssSQ643uSWl/54b8
 MJa9r1hdHeR0oIUn8ZhMDFeqUZkVaePVRgmQPmPyZPFlmDdXmpw1wXMz9Li4DP6adL8mdtNl3JE
 OuJPSv7VxvmI7hqt5yO3GtdNn0QyNsEkotek1aAPUvSGFLD6P/OcK+JyysT2cxa11yh/iXUn3jx
 /yTeRPDYoqvBzQU97cd2AKrWp8YZCcJAtiwIvjJOO2jmURfe5Yr2sWLS/XF0Fi8QPKJuth76n6h
 mI71FzBHHxE/RE/lFB27XbFser2x53DCRndN6oMxqvDyZrvGJhlCftA/nu60B3fIFvIIiEWHeil
 wXaDHvjkwLW7kGh0gAkcLiqxiq6ba+YQ1+3OimFS8lE6jElkoDn425GmpS4u9OHc26ZNg28lZP5
 lWOj0uKQEFaRbbw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to udf export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/udf/namei.c | 1 + 1 file changed,
 1 insertion(+) 
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
X-Headers-End: 1vgRTQ-0007hO-7w
Subject: [f2fs-dev] [PATCH 12/29] udf: add EXPORT_OP_STABLE_HANDLES flag to
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

Add the EXPORT_OP_STABLE_HANDLES flag to udf export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/udf/namei.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/udf/namei.c b/fs/udf/namei.c
index 5f2e9a892bffa9579143cedf71d80efa7ad6e9fb..7b8db8331c77bb43d9a3c4528aee535eac2bbd37 100644
--- a/fs/udf/namei.c
+++ b/fs/udf/namei.c
@@ -1012,6 +1012,7 @@ const struct export_operations udf_export_ops = {
 	.fh_to_dentry   = udf_fh_to_dentry,
 	.fh_to_parent   = udf_fh_to_parent,
 	.get_parent     = udf_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 const struct inode_operations udf_dir_inode_operations = {

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
