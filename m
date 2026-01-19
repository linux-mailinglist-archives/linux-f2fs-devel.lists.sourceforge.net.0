Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A21D3B0F9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:30:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82CFVBnIALaopUnD3/NQLR8L4BYenoc7xHJvxHhRyOk=; b=SaDk2hOS1n53oVqlu6luzsA+/d
	L4p8b6xeE6fHMxdMgEUWTLc7Z1xgH63yWrh0IIIpxcL6jIPIZcowiif4AZCVANaBdj8aTCeQq8Dsa
	/ccUe6i6gDW3RYFlFKWHytzyn7bRPiWyikg8z/s8Po1U9RHz/L8TUcw3czudGUecYbJQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs92-0005MK-Rj;
	Mon, 19 Jan 2026 16:30:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs90-0005LT-53;
 Mon, 19 Jan 2026 16:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VHIKlgaWBu+aT3gm/Wqmp51Q8f9pgnyETXcCHEv7n28=; b=glCIaoTNtvveKzBUCe8qtfyBb3
 U8uLPzDoNmM2VRcaBpbBtOeXpMPoasH6z8jBjJaYAJHqtlFx77IIGb2vg5opB2S0wNOF09HtA1Fk9
 2ouPBeW0JFd1s0X9DOxT2OvSqn953IeAMqIS5YqwiRKCCmGMTVdi5j6UYQHpQlYTcrBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VHIKlgaWBu+aT3gm/Wqmp51Q8f9pgnyETXcCHEv7n28=; b=HQOEnTiPqN4M1YjuqalzEfNDXo
 gk0KQ1N3pw7zaIOciTBplxENUHqY2CNIVmjdW+cl/aNenx4bwBhQrAcMLl0VJvILfNUWqQb8ECy9A
 Ou8bjAdwXUJHZf3VB3Cv9eJXsAe9jIkOcBXYIsJcxorj7I1u0jJ3X0D+GJgcbRgVR7UY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs8w-00085v-69; Mon, 19 Jan 2026 16:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AFAA641759;
 Mon, 19 Jan 2026 16:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A639EC116C6;
 Mon, 19 Jan 2026 16:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840212;
 bh=n6o2QP6G+vRALjzLSnRDRDjCb5K6Xo6hC7kQYuLTnag=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=a81wX7CHFaMcWABGqmtr3bCnnlSH2+QJW6sj7Z5s+YHeHljRLrpmkrFPCRjArvVgi
 /XaWZDcbtZpLtK/pb0aJ9GWE2dfijyEGdXqoSe4kJcGmsC3eNBKhUb35dBWA4dCtEc
 77ftcJ2FU6Tb+BFuvMrPAHF5ksnWZxqJCeiOxur4Fk+wsxTxtj6qRIBFJvKmFmm5Ow
 UEr/+uPLfVxiPt8W0cv/zj+rZQ7Uig3djb9n8GUKAJXwvu3yF1ovzkjetfwCRoq9cN
 RyeS0NSJuTN3iyYs8sWrdDC32QcczPIYJiZcC7xFlpSM9IZl63faxJ+zmMU+ot8Oee
 cu+IW2ZApdGdg==
Date: Mon, 19 Jan 2026 11:26:41 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-24-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=742; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=n6o2QP6G+vRALjzLSnRDRDjCb5K6Xo6hC7kQYuLTnag=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltfI0USivroSaPnKybgkczOShKdRT9HZraZF
 OxjWyUMDF2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXwAKCRAADmhBGVaC
 Fdz3EACbzDFYvTKaT6J+G9ta/KSD1FSJsg97pPf4Pr3Ovq777BAZcpKmF2NX/mQBaUKyOfBzk6O
 YM2Mx7K1IT8iRZuJywzH/PH8fL6L8dR790PYOZDjz0wl8jnfobiJ50BB7eJo9iVgrOjb3Xz4Gqf
 NvgQamJe9o8ouJuUZpBhkwICfWgKMap5x92NL/4cf2tQn4YgWtqeHIHbIQ0NaSoWZ11w994n84B
 iCVAfMocfV7h0qZ59VS7Fc/HdaFQLwFSmKvlz2GS0kHbsMKeVZFrzdL0zC0ebJolRow9hnZF+1s
 vJQWpBh4SVhgwNLgc/AZXq3vReL4GvAM8Ha8+MgA8p+nuqL7zN18lFi3vNwJS4yjMwYq0qFafWk
 65zGwA+xIKY1uOIbRdtgwrxH74ptBWZQVD26VlmtB1qrelYciadJWV3+tsAOhKXxWh8yRP9BNEc
 C1b1Xh+XJz+3AM7myF+l/Nohzwy8tkkJCU8Ku2yAFJcUpHeBwAjEub93HM99JQ7xWgM8YLSNPx4
 QcXXD2LE5fN5WBuLbdlC0LRYHgeFmq6zUeFGmZZVkbD/CLbtdblGJ7E8YRrOZBXDE46lPOywZ9O
 5MT8vhgYocG2wgiTbTHDrtM+8LubBwz81EAvtnTITbIWXmDSYYmocdD/0l3AaXEplO1s2iJkWR0
 F/Tqn/AjaU/GRUQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to jffs2 export
 operations
 to indicate that this filesystem can be exported via NFS. Acked-by: Richard
 Weinberger <richard@nod.at> Signed-off-by: Jeff Layton <jlayton@kernel.org>
 --- fs/jffs2/super.c | 1 + 1 file changed, 1 insertion(+) 
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
X-Headers-End: 1vhs8w-00085v-69
Subject: [f2fs-dev] [PATCH v2 24/31] jffs2: add EXPORT_OP_STABLE_HANDLES
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

Add the EXPORT_OP_STABLE_HANDLES flag to jffs2 export operations to
indicate that this filesystem can be exported via NFS.

Acked-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/jffs2/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 4545f885c41efa1d925afc1d643576d859c42921..80ff5a0130603f94c9bce452c976753c85314c3a 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -155,6 +155,7 @@ static const struct export_operations jffs2_export_ops = {
 	.get_parent = jffs2_get_parent,
 	.fh_to_dentry = jffs2_fh_to_dentry,
 	.fh_to_parent = jffs2_fh_to_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 /*

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
