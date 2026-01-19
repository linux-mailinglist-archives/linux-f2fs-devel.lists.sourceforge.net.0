Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19953D3B0DA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:29:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hh6br4ig9Ugsf5+yvT3iRMe0K2OIsYr48+xuqvzl3OY=; b=KXtLTS0y1RVCxMqnLSXKIJRK1j
	M94griicSjCHcrYY9ctylAQI+tfchAv6VoyO57NpMn+XjAS31K5vL+ta+wF7weNM7jS6RX34otzHQ
	XDOBtiwfK75Ph58Pa6R/6lTnXDQFZMLuMJoF+3IGemR0dnn83bwP2NCXbUAguZttpEXs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs7r-00035r-Po;
	Mon, 19 Jan 2026 16:29:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs7q-00035U-Bc;
 Mon, 19 Jan 2026 16:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AYWURcqMUxp9DlYRnvKSwe7IEW9L017mImGJDNWH7a4=; b=kKCQbUpnu7ydUyza0Wxd5PkA1g
 tJ3ISAsqD4PABmsuCohJm3oSyysgt6PYIB/j87FeMfsWJ32ozvOQAoiE9IQvPp4M7oXCCcxLlZQmL
 EZ4iGsTyBTNeCRGigWh9NGWVPu8swf0kjpHnSkRpnxYdrQXVVxkTQzSuOnWsJahX3j/k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AYWURcqMUxp9DlYRnvKSwe7IEW9L017mImGJDNWH7a4=; b=Jtqs/SMIsDe9kYMp5kLAKUGlTY
 7RnVsPeupkKDiCic9bDObBpuA79gncjkF5YQAxz19n9m7Fl638EBNneb0+tsO+MPSb6enAAVpNnln
 dwtSNuW4b7yHnXdi6EuDe5MSlDcii/NJ4FbVSAFAvOrzGR2cnAjqOVYXr1sMKnVDR1+o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs7m-0007t1-2R; Mon, 19 Jan 2026 16:29:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 65B9660161;
 Mon, 19 Jan 2026 16:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF63C2BC9E;
 Mon, 19 Jan 2026 16:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840140;
 bh=eujLaXiTUgNyjxHmQdWX3y0IvgSLWTxRgF6WqDofLiM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GbZu6FSOp9WcyI754uBOhgiC+hjbrXb3PEhujTocCOkmPvnvAp4bCQ51iP9+gkdW8
 B4a0JL+gvg9zK2migKuOwwdvrS3+/frWzLC3e9RUxOa57kczpOLuGHvF+9UoQO+7GH
 CS98+DwnQ29MfmcJDLTXTBDRw9pFlkHHKAeT6cQ2crbJry9uJuena0SneoU3gr+yWI
 qE9fhRj3q5X1Z+wQYlsf0PHhw7hNi2jqRuQMj9GiIBD4pd0zhhzpuoKfcs8m6hwxUx
 a16UuQnjs7UT6hSVV5xwRLY1Y7ho2OOQUOkxAhejP7/sILT14iJoJ7t8DA1CNNdnx+
 U9nZaR2wlvxjQ==
Date: Mon, 19 Jan 2026 11:26:31 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-14-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=eujLaXiTUgNyjxHmQdWX3y0IvgSLWTxRgF6WqDofLiM=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltcWN14PEo1Nujn8uyUCyf+Ml83lXSAsDawe
 D9CEC+RNLaJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXAAKCRAADmhBGVaC
 FTJtD/9D134+/6m7eqi2XFu1Ldt3x6QxfDXalFHVzNVlyX155Qtn9qZi4UXAEKjVe2ODkcTVGpO
 11UPI11wgMKn6loI94fVibr9SKlYAahySdpRnTFj/gaHvNSE+0XntrP+Wr3YvA8n9z0qPcqDSTA
 UvgajRyM61rTAYFsGEgtMaq0cRaMlLr3lpA09Pj1xLSFMI4kNUW4+WhSca7PAth/rIjGubVUIrg
 o3LTy8kWsW+ssnz/G3HXpjXU0sa8z5kUrFymZvow2N/5DOHQoOOPMz2tYopAhK+wA0WMiHlPYEP
 V7QKF5XNckiHhNp0sVvNHLOWjppYh3i0G7B5YINXh/Gdt4IcBYvJCzqXNcdqzXAxycgZ/J+YMqw
 5NJw7rXYzFjI997ZGd1XI7m6Y6qSX/cpBEHF+RNlLEYs24Bl6WF2B/EHAJdG/41L4XVIYd2XJIb
 00nVd6iFRkEAPdwVvfHBaBhF5wJfx7QlX3ei/4zp/5Lx0u31MQzjOsirPhW0DNwTtPE0y6enzFg
 Oj/GgrylYOHwkrdl3HHAXJpgMynZVpMDPuVtBuMeKYUDE0ZyXgLSPE8/dd0B5zNW77fNX0kNFET
 gLNm9ggSsGI4QKY1GLxYdtW6d0d6wArslnUBsgla+v/Z4YfNSBPrvAKrXiRE3zatrUAolw2mThU
 euoEInqbxcQA6UQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to affs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/affs/namei.c | 1 + 1 file changed,
 1 insertion(+) 
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
X-Headers-End: 1vhs7m-0007t1-2R
Subject: [f2fs-dev] [PATCH v2 14/31] affs: add EXPORT_OP_STABLE_HANDLES flag
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

Add the EXPORT_OP_STABLE_HANDLES flag to affs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/affs/namei.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/affs/namei.c b/fs/affs/namei.c
index f883be50db122d3b09f0ae4d24618bd49b55186b..edea4d868b5131fa69912655879231912ceff168 100644
--- a/fs/affs/namei.c
+++ b/fs/affs/namei.c
@@ -569,6 +569,7 @@ const struct export_operations affs_export_ops = {
 	.fh_to_dentry = affs_fh_to_dentry,
 	.fh_to_parent = affs_fh_to_parent,
 	.get_parent = affs_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 const struct dentry_operations affs_dentry_operations = {

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
