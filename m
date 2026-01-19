Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 844F6D3B0EF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:30:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGmseNmxBDnuc/D5m/8qdSoZQ8tGOXkDRRtvRfMk71s=; b=RHoVojjUK3YMn5VUfzKKZOtYMN
	D/UbU5PlViTBJ+hamjD4As/meMenyjFtDByIuVUNAQZTwUS92UQA0JHsth+F1yANoPWxW9Z5SxTlY
	Bl91EKDWfr4FutPLQesu6WoNONwm8dpawM7AFOJqQb5Staiu1n+wT1kUzVe97Jvr//FU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs8g-0003Et-7W;
	Mon, 19 Jan 2026 16:30:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs8e-0003DQ-2d;
 Mon, 19 Jan 2026 16:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E2Nyery+u0820owoJoyV1gjey2JK3/SSkxA2SBnZzqQ=; b=Z7CDpgQWSWqCCv5bOrFgyzJ+nA
 tBGqb6C8WxeSOYTtyKC1z9wqGuyr50PXBQ7KAABHUKI6i082XaTnK+z8lE5eJKWgP+NIcDNT5u84/
 vBdygZgXtSB8aj6UNZK+I33xTmG96wIeb9kThOW406lc2LUJx2Q3MNbyK8TjdBdJoJig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E2Nyery+u0820owoJoyV1gjey2JK3/SSkxA2SBnZzqQ=; b=V6yjZitIS2q93Q1dvGhfXdPOQ9
 tE9WY3mJerNxQ4OOdpyUnZYO44VyPHepzj6Zu+yHrxYbeQVZfS29s8TCfGpSyQL7GKS/rerdtKJJE
 1T96ijzB11Yc6RZdxHtf6EalP2eoj6q9P30O7HB9gSDOkWXftvikGj2/7VRsiVI2ZpCk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs8a-00081p-71; Mon, 19 Jan 2026 16:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5C2B460161;
 Mon, 19 Jan 2026 16:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150D0C19423;
 Mon, 19 Jan 2026 16:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840190;
 bh=Vx1t81IxwVBJSLqIX9vPVWngNZL8liRiNm1RYHvLCvE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=s2NIXch1qvgEgJVzeJHUQ/vYQrQNBRHWLVh+5uTV5BK04joiphSTx1rGYkzsL31u4
 sy/FhwtpHcIaa7AzhWzmP1tuedcD3fA1mIsJbAZaKfMRItyC5XPc0SgEWTOTxw9wSp
 x9Gbg+hrOA0pd/sDE6jmK9qhWzMpvTNFHG2fFTvutD/erMWglJ3sfK9nQEcmfsdkxd
 byO8N17f1N+uRU1ccMBcTg89fYHra8qPAl+OamddAUNbEuYWNuIhLhvY7ePZNDr9Ww
 0bxyA6SjcNDZgRc+BLZh/E871afYJ64+YGs3KB46gQOF5J5UyAGHKPLIlR+1WE9QM9
 FNrRDOuqBtl4Q==
Date: Mon, 19 Jan 2026 11:26:38 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-21-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=741; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Vx1t81IxwVBJSLqIX9vPVWngNZL8liRiNm1RYHvLCvE=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltevFy1oH+9TGZ4tJg4adzFVAm26w57ZlHqh
 gzds6mLNJuJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXgAKCRAADmhBGVaC
 FVk/D/913imOVzFf9dOyb6hCP9vK9aa0EKgm0XGIWuOXDiuJuE8iujL9QyuKBIEz8pjArI6pF6s
 YmQowEsKwGVIOcvA2l5D0cDnY/f1iklQsimK78XdRpHRVsbbjB0dmG9ty+CtlfCQPTf5u2wq0gk
 fTb5+p+BgYd4C1gov9SnxGb0Qc4s1X3PIIbCi6iFVl0e2J41wuqRNY+dYE3SDDNDvZ0i/XeUe2o
 +FuQghmlONCx17pc5ATpLql4aEGf1HlIQsWIlc/zUYlRz59sJC3ed2qWOJc8sXVpRJLv+fBueuw
 ObZYK3AD3rPPmH/K/qkd56Nhauz9J4ubCAJRdsvAyRR8STsFeo+NEOGOI7NtXCQRJl/ChFigFhL
 u3nVj/AJqjqttVBnyBUH6BV2sLtKoJkisZUH5H933q0vje65jZFvfGQJnqW2eUWcjfWMfuA0euz
 yWzMIJwthR6utXHrIE2MQp6D/NJjOLzs7WHdpwPDh0GI5F5lAYljmiW6Vo+gZTrcefXIOl478UR
 kjdq2kHG4hCgZMoibnXQ85diJ4l6S3AGAuqbarYCGwyJ7fboltbKuz/P0yphJTRSTMM3swpMd1M
 P/ZuEbbJhyuSOqzIDCSVviX2aD+SLpGz1vD6vezu8WkPXNdwoXn1mUe67jKXd6KUYm/8yj9I9OE
 /rKaqBOWpNc3NaQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to nilfs2 export
 operations
 to indicate that this filesystem can be exported via NFS. Acked-by: Ryusuke
 Konishi <konishi.ryusuke@gmail.com> Signed-off-by: Jeff Layton
 <jlayton@kernel.org>
 --- fs/nilfs2/namei.c | 1 + 1 file changed, 1 insertion(+) 
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
X-Headers-End: 1vhs8a-00081p-71
Subject: [f2fs-dev] [PATCH v2 21/31] nilfs2: add EXPORT_OP_STABLE_HANDLES
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

Add the EXPORT_OP_STABLE_HANDLES flag to nilfs2 export operations to
indicate that this filesystem can be exported via NFS.

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nilfs2/namei.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/nilfs2/namei.c b/fs/nilfs2/namei.c
index 40f4b1a28705b6e0eb8f0978cf3ac18b43aa1331..975123586d1b1703e25ba6dd3117f397b3d785c1 100644
--- a/fs/nilfs2/namei.c
+++ b/fs/nilfs2/namei.c
@@ -591,4 +591,5 @@ const struct export_operations nilfs_export_ops = {
 	.fh_to_dentry = nilfs_fh_to_dentry,
 	.fh_to_parent = nilfs_fh_to_parent,
 	.get_parent = nilfs_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
