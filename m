Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B8DD3B103
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJPxRfaowRFt0qjzSig6AbwENVQ3MikkQtKLyFTg0YQ=; b=mnifmcdwjCFOUAICRclRg2x+8i
	bYpf1rNhQDAVr9z/ZSzhO2Ue5mqRtzUMkSdqzbqcn2iS5vtRAqE96dW5K47muKGb8mDrdEGfrg0R9
	J4SlhfXvkjEQWjPubJG3Nvv5RFWwwv/tWK75y8LTzBe8XOOAGSwGvwuhvaeNzBvD4WYE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs9M-0003KA-U9;
	Mon, 19 Jan 2026 16:30:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs9L-0003Jo-Ip;
 Mon, 19 Jan 2026 16:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KsqRfk6qDOmFi0pzbOsStk9GSjgqkcyLMnYwbWuEqcQ=; b=cCRhjLkk/FCR1HV12tfrj3sbqL
 xwc5XIoE/UEohCXEv3zjNahWgX0Sg+gXu8OBZgDTKb2jGCUlV3uk2zEvksWPOvZZsBoC4XJBLmBnN
 +Dtw+MW9Lg7E31ZCpjFDPEMvr5SAuTk/WHXnHYBvTE+221VGkmq/bQXyKqBnwiE7cVTU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KsqRfk6qDOmFi0pzbOsStk9GSjgqkcyLMnYwbWuEqcQ=; b=Mc8O/+bJMAu2nghymWrSty//wp
 DKMWnZr90uCG4ydRpceOKkwXbkd4lFl9qlxQFGt3QolgLyKg8p3zN4Hb5ycuyDlk8yWNxg8zJ61F4
 apAw4cic9NT7Rg62kRRhshl9064QZSG1JGKq9nq7TUY5PPqxsLmRSqVcznd5V9JLGbUk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs98-00088E-F1; Mon, 19 Jan 2026 16:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D2AEB443FC;
 Mon, 19 Jan 2026 16:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8EDC19424;
 Mon, 19 Jan 2026 16:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840219;
 bh=6tWMcuw4SXKKliFxuwUspWBYz3IXPKjAO64IS1gzwy8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=uW0qRezFzlerNDs8PuKGdJ441QJHOwe7SSO/QFQMzNVYXoOjiHcP//yxHRemE39qk
 YwGPcQkEKt0Jg3XXVxeeWGLZOiZLMUNBT4M1H8Wy+FTFY5CwgHKCm5qxayW2GQmXmD
 7vXoIKkqjyAzSevqKKCRd3RcIDgYuedYJ2ae2utlrBNPLHM5GNf6na/9xre//+UBol
 i3xuRLUMWw2Y70PMjpIIXwQqmUp8t4Xt9ge+QmqWKHifKN3ikXmJKEvG71VgxRYeHp
 zV+2Wqzblek8MtOUKv8VZSWgUhMcF88IV6nE4gWeU2mVJRx5J+IVMMOz2RNWeGIJj7
 pMuB0z/K6YhWg==
Date: Mon, 19 Jan 2026 11:26:42 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-25-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=735; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=6tWMcuw4SXKKliFxuwUspWBYz3IXPKjAO64IS1gzwy8=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltf9nl3RQPci4dHsMHCsM+umo8MjeqaXnesW
 HnO9Lsm4E2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXwAKCRAADmhBGVaC
 FReXD/wIPrLFtBRy7dk3dDTSyjTIH1yJqNgp9Y57L7fa5RL3gAQMGxKbzGjfF5DwWc35pqFfmu2
 H1PTOoCJC/fAYdmdr/3RlcvQHPDNxYIe2izXZY5L0jg02nus05q7iu3i3gsftQ3wI13cFWTyOxp
 SVoAc+i1h6QgfYXpqz4CtCpIGm3rhofWC61ioVAb/S0T7i/BLNDL5iydoVga6uGjhUaXrJO4Xjm
 47OuJ4NhcP/pg4uTpAjmYlQQ1c75RVYJ28CoECZqrqf9BPqdFBFXV2l609ny0NqluGTVypPG9MK
 fg/lfPdwNjBqfeCQHEeqlMPD8vRL2jskqfbGAZ0Erni/nJB41Z04M3U6vrsfy4XGrAC2X2gK/kw
 ExJ/dt/CBBv7a9uFqeA18YaCYtFR2LMOQLlwESdHjQxLunZb0f87fZp3KyAab5u9AI7aBfT+9dK
 1QD0+nfWTS7X4aInbGGhgrtSQMTQ3mTHoknCDwu53pNH1oNlIyazOIfLfBwI8tcoTBYqpuqoS9g
 xev6gXz3JYDe91SFY1cyMnOb8dZeEeRHTPAmhxXB3UnfKlLqNmafMSmelfv4Lw9RXmQRHBMB27F
 2ws5gpBEdy7haX4itXzRZmZah70fjOslHqzInfRoznnLOfY04dMlmNxBkr+5r+BZOfjT3UGyWNQ
 mAGdsC+47hLn5Qw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to isofs export
 operations
 to indicate that this filesystem can be exported via NFS. Reviewed-by: Jan
 Kara <jack@suse.cz> Signed-off-by: Jeff Layton <jlayton@kernel.org> ---
 fs/isofs/export.c | 1 + 1 file changed, 1 insertion(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhs98-00088E-F1
Subject: [f2fs-dev] [PATCH v2 25/31] isofs: add EXPORT_OP_STABLE_HANDLES
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

Add the EXPORT_OP_STABLE_HANDLES flag to isofs export operations to
indicate that this filesystem can be exported via NFS.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/isofs/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/isofs/export.c b/fs/isofs/export.c
index 421d247fae52301b778f0589b27fcf48f2372832..7c17eb4e030813d1d22456ccbfb005c6b6934500 100644
--- a/fs/isofs/export.c
+++ b/fs/isofs/export.c
@@ -190,4 +190,5 @@ const struct export_operations isofs_export_ops = {
 	.fh_to_dentry	= isofs_fh_to_dentry,
 	.fh_to_parent	= isofs_fh_to_parent,
 	.get_parent     = isofs_export_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
