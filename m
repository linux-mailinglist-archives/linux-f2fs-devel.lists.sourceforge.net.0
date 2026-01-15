Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06847D26D34
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:50:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=desIv3gty7TR6RPorz1lJgU5GuRhR704lhvlCQJG6CE=; b=fYYJ42JvCfyrKJZjmUCjBdlHBj
	7YDzlWPxH6hyJr/3BS89/IR4xSf9TgQa5XXu8swo3iPmnzHlfrPesPi/TcbEorVRYokyVefe8/Spq
	nXybB94XsDbmasgdtCXLoj0ZIRU/VSW2px7xoSuCRNb07jTUgcwTgu3eT4mS0Wj+CebI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRUY-0000ZS-NC;
	Thu, 15 Jan 2026 17:50:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRUW-0000Z1-Rr;
 Thu, 15 Jan 2026 17:50:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xp9C0iSm3vjcoVN+J/acwVOJxS7zKjbIu6neF02xM+0=; b=Cn/OIlMiYyNVG9o1BHMe6skB/D
 W66TuqpY6l0aGfetE1lCc7hGIcT2IrCUlOVcbk3iRiTgT3Rcw7JGEb7ulYjLalgS+QN7NJi9BQEmA
 ZWk1Rlrt3vAXMOj3uLNcP0hzS2heZmMdYhF8Van95Uh59bEDXEgOLNi5dNdz49zGllZU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xp9C0iSm3vjcoVN+J/acwVOJxS7zKjbIu6neF02xM+0=; b=Nc8BJ4pHAsdwsx5nQlBPj60oyL
 iG+3bRFZtCavfnYpJxqmCvTq2RoJo9Y5m1RV7jlFMXx2uvXe6QDrBVsky0q+6ZNxo3PYcHiJqDBCZ
 bJhUIhGJYyg0BmTosZBGGVE/HqCpSIHMTQGy1ZhpN4SB+xsEruoJe78EpusdmMqK47EA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRUU-0007rq-Uv; Thu, 15 Jan 2026 17:50:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 44C146016F;
 Thu, 15 Jan 2026 17:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C287C19423;
 Thu, 15 Jan 2026 17:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499428;
 bh=5qGrvcoNEaqzKsbFBudRQKuxZ92uiJhY9hmL8JYVNwo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=rR6P5MqpIlAhNzf8XuUwzeR0k2ADAPvlltnRtEUjrMxi0Zo6/8Dt3CKUWLqfaVqvV
 maTTucLjmIvOZJyMtOcHtPzt6gfk4sFH0sIVdzS4AOjzTwdHuJW2+NNgGCEeGGbUIP
 xc7iAujPGz5+g2OVzeGgRMIgHvoijHlHKpfBOdlpOLRHePm+BIhlb8/Vo8w3rmKm1t
 vk8WW1Fc3rJyG1JzmOsyAJU1y/vEW7lVmeFFbX+4Wv68qN8/jR85ltMp9LCmeh8+ki
 /R6lpmzQU6cIvNz1eR/VUPClQqtbJUSUkqmxN7SiK1wm91O0nOO0CL3G5RkpSnrTo6
 Xb+1xdin+Tpmw==
Date: Thu, 15 Jan 2026 12:47:53 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-22-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=757; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=5qGrvcoNEaqzKsbFBudRQKuxZ92uiJhY9hmL8JYVNwo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShJ6gzq/GdauLk+afGsy7jPLT6yVwaC0xixs
 lrpnTh5X6uJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSQAKCRAADmhBGVaC
 FRUSD/9ByBjb9qL7WUXU7eQFvtHwFTejj7UPRv9G2yA/sCWJnOY4XI4+DT5LXXjPDJ5WfzDmY0h
 1631R1kksFTmTI4TTr1rMQ3DsyUNANdSFEjmbnoMKjUUf0Gb26G0Zhtehcvah6MyRo4hnuEgO3N
 j9fY2jmqmR+Q0SjY+g/ZSFgJieIZJ1bPG5kGaGg9nys+m/JtMDhKFOib64DAQfBEcdBBtMlYe8L
 asyygrgU0nQ7FjX8gT+iV5Q7p8xHDDDQyIQgzC//m6aacF4d5KuNYKHrTyaMSIo4RugSJslAQV6
 +FMpHhadZQqkN7GDghRXcc0YTmgv5dCyjpWHgS/39eN+IVT9aes5hoc/QI+zkvskn/epPcE+tp7
 lbmZFB7ApvXUyeAEy+EogpQ2GX4AVZ4Q7zRb+uU84rdoX6xNMPAOGQ3UfhGJjImDrAXZaskyOTD
 dg/X43DE4ERo6Co6EL65AGek+DaXlZo1bc+y8QfodlH3bQm3dOx+RrveNSGyjrosX/LjBkT1dO1
 HkBNWR+339Wi7nHQTnjmr0x15tUe4rPHVHW41nMi9vwSOprdFNaG/Cx4O6JmaWzkNOVBkTTOGSb
 FnGwyWVBJgq/a+9nZm67mlnZ919xA3ikbxMmTS4jtWnsmR8eQIsuG+eAMLgmGcjgULQ1AJ8OHd5
 KEtt24Sqjm6eBDg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to jfs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/jfs/super.c | 1 + 1 file changed,
 1 insertion(+) 
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
X-Headers-End: 1vgRUU-0007rq-Uv
Subject: [f2fs-dev] [PATCH 22/29] jfs: add EXPORT_OP_STABLE_HANDLES flag to
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

Add the EXPORT_OP_STABLE_HANDLES flag to jfs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/jfs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jfs/super.c b/fs/jfs/super.c
index 3cfb86c5a36e8f0c46a2734a24fba6ffd36c7ad9..ac9b6d754f8c203baa7e91362aeb0dc9b3ce209f 100644
--- a/fs/jfs/super.c
+++ b/fs/jfs/super.c
@@ -864,6 +864,7 @@ static const struct export_operations jfs_export_operations = {
 	.fh_to_dentry	= jfs_fh_to_dentry,
 	.fh_to_parent	= jfs_fh_to_parent,
 	.get_parent	= jfs_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 static void jfs_init_options(struct fs_context *fc, struct jfs_context *ctx)

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
