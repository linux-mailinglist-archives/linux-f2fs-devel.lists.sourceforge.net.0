Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E977D26D31
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:50:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cL+lMUUgad5nSwiF3k4VzrX/GDplehctrHNxtnoTDVo=; b=RQ9KBUSLJLxqI6OAlfVHgzK3CS
	XB648uOlu5cZL3lLiBydNNhG+33dStWv6OhJM8bMApRTmPiqGCdsubTHR+gC3v6CLhuHK4L8qMcRu
	43c8IQUm2rJJ2vRD3C01IdR3Pw/OUvNMRAFLk5BmB8wbmONIphqtsqj8PnVjosxVXOTI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRUW-00068x-Uy;
	Thu, 15 Jan 2026 17:50:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRUU-00068V-Rc;
 Thu, 15 Jan 2026 17:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XdhUirb/YWthwGbnbDuSKExYBUqRy9BVrPxpIPyz+0g=; b=P6eFwYr9NDaqNbKjw3rfpydUwV
 7uCsQrUDKXKo11uOHN93S6tz+wmLhtdSoaoJCWXDwW7DnuXCARDFtLJ3hzgJET3W0qYWIcfrnkxsh
 j905g+1SZ4FhQB048K1O/yO1TcwQ1JVhWLrdfURIOaKxlfzSMj+wsXaTvE1CuGKxvdrk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XdhUirb/YWthwGbnbDuSKExYBUqRy9BVrPxpIPyz+0g=; b=gAcSEmRpzltB6zeQ/pxhiOntJ1
 rH7n8nTJgucCBX1rqDZtNLrNWdWLGX7mmELexLsLKIqnEhIpIr9fzUrISrr6y8wlUna6XvEAU9use
 NVpxLAWCN7rD9TYxKkQ+E87+gtft6VBq/4BuunbnkfsIVKOWmTNhiWIEF2KpPPivtYcQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRUO-0007qQ-Bj; Thu, 15 Jan 2026 17:50:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AAAB4601B2;
 Thu, 15 Jan 2026 17:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3663C16AAE;
 Thu, 15 Jan 2026 17:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499421;
 bh=ksDOdJgrlY0p5ZvKqSnF6dLYZLuuHG/nH15DeY9s8Cc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ncKx34pWjFemMaBjR1MOoBOtd9hxTIgtD63Rs0W24eZ/eNaJJ97v1ntfo8Wmd+pLy
 /y4C7B8Z4NfngHzIpkDISFbyonBVP1CdWXx1hKT5QeZHxFk6pHjKf81Y/1Jg2zfv0q
 wO+w12OcSLMzqqroVFATdQeLyqs8/TSanPkWZBM9ioDzXyUwUDE9X9rVXOVltyW6RA
 UC4YXYl6PEbjUnzxsnrKDchJhbzcvRHJTjap1XyJ5Jm8Cry8N0z7QzDMs7Ua3RWqRD
 J8GZmq7ZexKTShjhJCWfqY2IRGCHR3YV7ELYiXaP7uVgdUXP0GzSg/wU+5LBpFyziy
 5WCUJbU3jNfDQ==
Date: Thu, 15 Jan 2026 12:47:52 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-21-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=710; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=ksDOdJgrlY0p5ZvKqSnF6dLYZLuuHG/nH15DeY9s8Cc=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShJPGllJakzZ/gKe1G8QnikNUgRJxvkj2s8k
 zvafiTCEwCJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSQAKCRAADmhBGVaC
 FQttD/wP1GwYIZubDBune0HMfmmzXPJsdHzJsaS/iWv7lBy3/gNUuxVn43OvoM3e25i4dal6/7i
 aHB2odWRq/FZezm6b+CRVCMD1Lt/1SS0RyOPLyZRKklL5aJd4OblZXpIT7J0j770FcCOZpGAsV8
 XmNAex2rqagFsWqq13syrXXt6kOlnRepawYzRzKHOWPC43GCaGfLFwQL0FHekPhVcE/EeZXQxh+
 cM9n/3AjZFKYtJ6Rfdpg7sakP7XGCptExb/zSvw/GE7PTMk6goO+0Y4vWmAVK/FjhNAdZqOpFbb
 mJt55VuY6fntM4hG49ouBvnOiStM9NYN3EEJRus3aPk6R9AjRDLX2asOquRSYASPIzjDlNRyPso
 5H5wUH+PEaXsXwoyTQrVznGsgAo6019vDYZPCQk6oesrECSYf4aUhKAyQCrZ+nkxE+vCvyCr5Nn
 BoKRTI5I5u61+IoV7QoI6Wn4bBnndE6IBAx82gIHuXmcjVuRucM9BU/vDZKYmKC3OIRsKW0cWGb
 Z02GPTSTJusUKo/mi/9Jkhkc2zdQLK992Mv19/6xLdIiTah8cUc8QDHDJT40b7oCbIot/Z9/EsU
 FMt+OE1wrAe77jxGWSBnTMALz66TvBaethmNo+WkNkoz5oZzp/KCu+y7FIZhnmfx1OoUX6J7ksZ
 UGocVC3NmrtajNA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgRUO-0007qQ-Bj
Subject: [f2fs-dev] [PATCH 21/29] nfs: add EXPORT_OP_STABLE_HANDLES flag to
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
