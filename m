Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF33D3B0E6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:29:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEBbfDaJ4HnSru8MWWZpV5twX+UhOlqur7OL133dL7Q=; b=Gl0ajxUyXbTPxjHLouZZLPQfnR
	iJUlVd49syHlrkcB9kl5WksSjrNEZadFNk77OS2ONYPH2XzWIB9k2Otk4cftOrA5HgiKcZJ8qaxAl
	59LrWRqJ4O4XAPk68EkQBQzuJwh2VGhyuRqUEaK5zWyV7h8BMYBNDiQCa0geEjXXTzRw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs8O-0003Ab-IO;
	Mon, 19 Jan 2026 16:29:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs8N-0003AG-21;
 Mon, 19 Jan 2026 16:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sNRXqgtLINsO2LjaYRvHXTTyfbuwIc2N3jXCIBuI6EY=; b=FvOMf2GkUjySMgn+83hE9e6Xb3
 8+6BOhA5stcN85ndOTX2L5Di9FbPP17txB3Knjc7Q4fxobgbBm7W5NVdak/fBCd/lNdgIozbj0Rb8
 EjyURF/zZxYTAc+7oSC92thUpnHF3icoiOi2Q0Dd83ZasZypt7uuKwz0u2DsSgKe94lU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sNRXqgtLINsO2LjaYRvHXTTyfbuwIc2N3jXCIBuI6EY=; b=kDeCqSBBHnfdiOzIjK0ppJ3hl6
 2zZSsor3nIUT8mQo9VnylDpU7mljNrzm8HuDfUkow90DzIeaPWhWw/feAWVZywKmKc6I3F+z5fTyJ
 4mslQ4ZeiVi59u7m2QAPfkDnjcfihXKMx/61YrrxkF8YzUT5l6yNtmSpwjVQ3gOG+thE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs8J-0007yz-Lz; Mon, 19 Jan 2026 16:29:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E0BF860140;
 Mon, 19 Jan 2026 16:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0DA3C19424;
 Mon, 19 Jan 2026 16:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840168;
 bh=G8L9z3jgn4ZzCiBzdCY6syeE/KUQa76p5EoRG21yt4c=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=s0+VO6sV96AAayqW4HXC57FxZusoD4Mr5w8orM2wKOHjCe4I1o88b2JDzVMiBf77Y
 pDDjACRlbOlveBnJiQcXYVA5qpw+/sU2t9cL+ik+kbcwUdNnDmXocOzTjFulfYcHI2
 x2A4unujL8OvOlpmgw2+OIu0I9FPLARZ6mdAINLrqA7eln2pZpKV59z8M/E+gT0xkw
 xUrOTL9ynJB2DvZABkuZtdOF4x5IHc14IzGdRINZFy5mpXXM/x3ukRBMnStp2InutK
 CQpw9K34gzMddctLV8apZ7g9I5NucGaI5vYJYjUgfl4BotibidZnZ3y8HmNY931YWC
 N6Dy2SFiZXtTQ==
Date: Mon, 19 Jan 2026 11:26:35 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-18-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=801; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=G8L9z3jgn4ZzCiBzdCY6syeE/KUQa76p5EoRG21yt4c=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltdXD5/4/NEvshZqyvt1InnFNA2XQmYrmnTp
 pyWIY7yRpGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXQAKCRAADmhBGVaC
 FcL5EACKAKVsfzFMfTk2Rxl44MOn7Jxmx0HGw2TNaLjhEixH9/SJUnhSyAZxEqPlwKij9mWLRg9
 egLOfPv4xhcGi23lAB865UgUt64WvqFfyfMMdYy71SNI1xeODPqIf3wifOxvwDu9L+U/jmLnQio
 G5WhwpXxYDtE/CTJQQIlFIhjbwxjo1/FLRxETOlt3wlERGLD+guFUoBS51K0YtAjvLB0UHSsQjx
 JLr1J0KKtVdeSSPF5aie8eA7UzNRko1ECjRTHdljrDg+uyV1//gbZ9Is2UZmJyRBbzlfi5/sIGE
 gwjA4Ud0gOkvn9MVFLyc5IXIvO+GkhZJ5oa++NC1hmG1o+rzBleXhb7KyYc6GBC23tJM3YQicN5
 zzau2UUB0ypQ4uefiOj+ilvYE9bQcyjR9dNPSxO3f52aJOYpLd61ADVfJ2hOSylDBWcJrY/qtoh
 xJ4rCxXYQvqZE4cKULYWIt98FrwfMhaLc0pBN0bWK6V8yL6Epj61iw00IWkT8zRPIVrjGCqdHpV
 KoylaD3lxPgCuGO/e0wwO2wU/h2UFpO1o66DZgVouEhyp8OSQtNZIdkFKLVmACRR+k5YCVSDKdT
 I/cC1UslVadh57kMMm+xS1iAZvb9WWuJ2bMgDRybN1wR9LY39O0TPBVl4/YilWCVBRz26kgARRz
 jQUOMwDTLocp+rA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to orangefs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/orangefs/super.c | 1 + 1 file changed, 
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
X-Headers-End: 1vhs8J-0007yz-Lz
Subject: [f2fs-dev] [PATCH v2 18/31] orangefs: add EXPORT_OP_STABLE_HANDLES
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

Add the EXPORT_OP_STABLE_HANDLES flag to orangefs export operations to
indicate that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/orangefs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/orangefs/super.c b/fs/orangefs/super.c
index b46100a4f5293576549300ae9050430c3f07969b..140f27f750939cf5538eb68501dd60012bd2daec 100644
--- a/fs/orangefs/super.c
+++ b/fs/orangefs/super.c
@@ -377,6 +377,7 @@ static int orangefs_encode_fh(struct inode *inode,
 static const struct export_operations orangefs_export_ops = {
 	.encode_fh = orangefs_encode_fh,
 	.fh_to_dentry = orangefs_fh_to_dentry,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 static int orangefs_unmount(int id, __s32 fs_id, const char *devname)

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
