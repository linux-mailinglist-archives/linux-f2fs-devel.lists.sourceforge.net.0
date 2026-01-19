Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1403FD3B0F2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:30:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cL+lMUUgad5nSwiF3k4VzrX/GDplehctrHNxtnoTDVo=; b=cCdEW059kzwTq7AOaSXN6AzBSP
	2da8/uZSfNcjcAy01jcWjrqq3l3g0/NUWZWZREFFCvegnAQWI1LMJ3QMHR/EImAsi/LBj90IGIlFs
	Wv2wJJ09p3UABqyzYFHuHGHk4SgVz1ujgvvXAqgjKC/88ckGWiMoKQ79ggYtmMjxCqQE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs8r-0005I4-PL;
	Mon, 19 Jan 2026 16:30:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs8j-0005GG-OI;
 Mon, 19 Jan 2026 16:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XdhUirb/YWthwGbnbDuSKExYBUqRy9BVrPxpIPyz+0g=; b=G6bvIfCmf9traG0hblHwzjrM5y
 981RHZTXOBwO14iHJT47lxOnHWmdBG2Qabk11/WHQuI+NZuH96i3zBlUzNlRVeWPuWcz9vPPysAJd
 83h40YZKwDWn4I31gSDmW03z8JNuqORzySWmjfuNh3yArTsrvHKsdINJauAA9cV9TEZk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XdhUirb/YWthwGbnbDuSKExYBUqRy9BVrPxpIPyz+0g=; b=ZZPYe1AoSKLjfg9qL0YbcMARbc
 ZdpM3SGve9iWFCKROm78ALB41ajl2lVDipF7bFkN7bZzRDp8azyhPn6XlziNWSekp/q8UoeUeQE0i
 nBdx2Uo21q4dtT+48oe6TyYqPxGJsT1qT/LSFgmj8+/QZLu/ryi6PmbMQsSz/ebgMyEs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs8h-00082w-7e; Mon, 19 Jan 2026 16:30:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6ED9660156;
 Mon, 19 Jan 2026 16:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41230C116C6;
 Mon, 19 Jan 2026 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840197;
 bh=ksDOdJgrlY0p5ZvKqSnF6dLYZLuuHG/nH15DeY9s8Cc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=t2r46v+9jsw3j0ykHvirXoon1iQeU5Fue4C2CsU43TaWml76meAChiFKMjw87LUdG
 juk0q7Rh6yG59pa9K6QokouNNIzjCWmAeqPOvgr1EYnvaF5nOQITGaHkvHrt/rUvgA
 fEXYEQAyRL3L8oXx3tbS1XeHAc6XZBuQGGIJVyzvBKwidBPPL8Fcsqa5DRBg9TQReL
 UvqAZHhiaBCIIft95WmbFLD5gtkRNbUXauR8+FuRE+pVkpVRB+y3xG5HnZ0I9sh++R
 BeJ0YEeVv3b119rg8K2AhsU3ALBbIRiuZsKHtJdlxfj4WLjPW4U0lYNo9Sp8RIRQ7F
 lMzepaVQcyGbA==
Date: Mon, 19 Jan 2026 11:26:39 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-22-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=710; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=ksDOdJgrlY0p5ZvKqSnF6dLYZLuuHG/nH15DeY9s8Cc=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltejvI4uCVHlIS2T5Sg9AWKXFFFdc6UAKuPC
 yIPRMUKgvmJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXgAKCRAADmhBGVaC
 FTCUEACsqv/PKTuNRCX5fxjg+TwKNxbmij5eOneoSqEsTfckElQdAtODhSPDDyCNar8QgaQs7M+
 VXuPS2EI2WkFUsZI2CLVekpCYCUQndqX9wrbqzSuzjy3vnSINM2TO4exNBnjO/erVYxwQjhirKH
 3oI0cBXBHOqDbxYZ4BxvKKL3EzoSapKOG1AycaqjVaS7tSGkd8ErvvpNO5ge1DKKhaFv6SnQv9b
 FER7dx88BVVl6o3/9b2pbxTozggAgRisZBNKhc0V++Nc0TlEUM19Apu+O6ylzKOheaU7DfAYTN1
 Bi0vYNSlhHuDe0mO4uiKEVt13bdyxhSBAqAYffzWra5kfampsjGglFiw4wyUTuPHY7YKYvrU0th
 QLKaE8bFWcJDloaj2gdWRXjNlFnN7noHKGGzh9LK6PoKAYTXHy1j/63W2/O8uQ0OnC+WIuB3e2f
 AIeR7L3FB8HIZilZbF+zOUQ720FHIpZkOvqTxQUcwVKkjXjR5QmK7gBuOJJ3lH0dd7c+uTGqBLe
 LbF6IxDrakDOoOKLHOatndkjqZ78EMx2uzRvgnILErXqa3CLcNn0R943ZowUFuAOh6ZiFn9AV76
 4iQzASFRmeFhWX+P/KS3X4VpLpdTttEFY/0yzEN4+pHCkqJjhtY45bpC7kvUVo6crazXPily8NU
 THxmvjP1Wo0foqQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to nfs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/nfs/export.c | 3 ++- 1 file changed,
 2 insertions(+), 1 deletion(-) 
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
X-Headers-End: 1vhs8h-00082w-7e
Subject: [f2fs-dev] [PATCH v2 22/31] nfs: add EXPORT_OP_STABLE_HANDLES flag
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

Add the EXPORT_OP_STABLE_HANDLES flag to nfs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfs/export.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/export.c b/fs/nfs/export.c
index a10dd5f9d0786eb111113bf524a1af8b7da0fb6e..7592ef347a2eae5d6305b64effd22537d5ef5e74 100644
--- a/fs/nfs/export.c
+++ b/fs/nfs/export.c
@@ -162,5 +162,6 @@ const struct export_operations nfs_export_ops = {
 		 EXPORT_OP_REMOTE_FS		|
 		 EXPORT_OP_NOATOMIC_ATTR	|
 		 EXPORT_OP_FLUSH_ON_CLOSE	|
-		 EXPORT_OP_NOLOCKS,
+		 EXPORT_OP_NOLOCKS		|
+		 EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
