Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CA7D26CBC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:50:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbyME57hIT45f4A3NkZzjCq9740lfg1y3nisAHl49eY=; b=XBDQRhIdNNI/Vic2vaX8Nc/aLa
	0wGW+eHc8e3V1gnfIYcAK++P9PTRqKEedAlyE/p3YDYrkTPEAvb3vFYVauBtNzzt3QN+trawjHhNA
	Qh/c2kmQXnA0Yvj7xYSazB4PFjkUZlokEHmPdwjL5KTaVshRj64yaM75hiuX7kRAr/74=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRTs-0000Ry-2f;
	Thu, 15 Jan 2026 17:50:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRTp-0000RS-Ol;
 Thu, 15 Jan 2026 17:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=62aIKj8tqE3sD4tyHvRw8zo3NxgE33Br/5r/nClLzsQ=; b=Qo1ehjYvYwMi+EH3g2JQSjz8zF
 9LIpQWnDGDkHwTXoLQi/WjFzcm6/h0uLL0/XEEiVPyNoiZlVqAfRb6zSQ8ZRKU0C15WDmqLUxL6TC
 HlT9ZcfUorXjHF/VtRhk5BTWy0uoEeniq7tPoePvIt7RC7Dd0n989s2/8LqIJLMIIjjc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=62aIKj8tqE3sD4tyHvRw8zo3NxgE33Br/5r/nClLzsQ=; b=P2j7EFfwBfOGTb0TR0NtmPs7Ur
 YHQj8JuTa+nJhIKiQtOL54XK8CUxuHqPGeLa0yVhtN/aCHB31tFQEjAjgIsRodKst26P1xSD6qgwL
 FdlHQUWYXaSQF0QHvyIrkA27pJIvmaLa02nX/lYxustsJco2EX8V9kPM8jwzIDrMvyxM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRTk-0007ja-Kb; Thu, 15 Jan 2026 17:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ED4F9601D3;
 Thu, 15 Jan 2026 17:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA99C116D0;
 Thu, 15 Jan 2026 17:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499381;
 bh=3GhJ/qRusFZtrc5r83Yz5fW+XL13TprQK4YWfiaNH7c=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HpFXXnu7ERkPUAIQm1ZPAcxGId6eeLxlE0JRxT5UA4b8o91JC6MhQ6hmR8WhJIGya
 u0ZPgVTfRojyBSEkyDYI3DwAmQo9WILZExRwe2UwHFCiNlmisjZ+6bSd+aE7ib61oJ
 kNhQchrck1aUUpJ+OwOj/fCqXIwNg0ZxkdeofNkXA7xP2g7DfotgAEoSVqgkuY6SM5
 Wpz8EZYj9+4Xj3LStuJyRf3j5Keqh7naAgj8vpr+lOmqqV4kroZVB7N0Bl859ATYgI
 uzM5fmBJ5J7caSvvjP71MlmxnFVv4DuzFN9zwjzsgrw+/9iNkIATGHL5NAfE8fKRC8
 k5qPRrxpUVgbQ==
Date: Thu, 15 Jan 2026 12:47:46 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-15-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=3GhJ/qRusFZtrc5r83Yz5fW+XL13TprQK4YWfiaNH7c=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShHXNqSO0AaJtAQ6e0iebWGL9gXuZogZL4NQ
 nd3994d03SJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoRwAKCRAADmhBGVaC
 FcJZD/995y2baNrZV9uOL0TNknTnSY1b+KmL3xbwd6ELV1X5P9GTRow0w8qgNhTp6DEdep17Xnl
 lV5nNz22mRp/8t/3leQwRnNobdVyWDmG+86VPwmUWRp3avVeIoa2Hq0+unljlviLLfMZvqyYy/P
 Kxs6fTJykAgSKjLX6C+rJOV1Mp3siFq7qgMalb81NvBiX9zHp1owHcyMqSQLk6dnRVhBpwvq8Yr
 HCE92A8xDJ3Ip129dtLuJhd2DRJMhmD7P0OezVt522x2tAQ1uGW9+y22/6QjAyty5uFASKCHvSI
 w3UV0CUln2DLh1/ExYGFtAVStJTrIxdzaoVBW95Wv/hqgnHPTA5ZPK9Mb7x6p1hGhTPsJyTJD+D
 ZfwxsjYG9BWi0T9CmUy63xFCzNqUQ2yS/5IVjEWwR90w95fFyvbdRWQqfBLXJR7156JlOwG9lmm
 LvYK/T5yQAN1YkPNeGXb/ojuDS1Qhax9xPuYWlGmJhpq9kmhgnNhCBrmeRxuXoSdsL8s3e0HFVx
 wPMeDrxdnCq4FIgMAjIVmEOYsxOVRowPOzVRxqVmY6La6z0MHQ1RC9VLmEOUHKcW5IQjJLDb2ld
 98lJr3+W1h6zW0rigSWwt4z1k87pChOwiG5A2qRhX7v35TRycTLzvQDQnkxDqIXyxoiRfeYXqGm
 8SLFEajMop9ifew==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to cifs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/smb/client/export.c | 1 + 1 file
 changed, 1 insertion(+) 
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
X-Headers-End: 1vgRTk-0007ja-Kb
Subject: [f2fs-dev] [PATCH 15/29] smb/client: add EXPORT_OP_STABLE_HANDLES
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

Add the EXPORT_OP_STABLE_HANDLES flag to cifs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/smb/client/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/smb/client/export.c b/fs/smb/client/export.c
index d606e8cbcb7db2b4026675bd9cbc264834687807..c1c23e21bfe610f1b5bf8d0eea64ab49e2c6ee3a 100644
--- a/fs/smb/client/export.c
+++ b/fs/smb/client/export.c
@@ -47,6 +47,7 @@ const struct export_operations cifs_export_ops = {
  * Following export operations are mandatory for NFS export support:
  *	.fh_to_dentry =
  */
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 #endif /* CONFIG_CIFS_NFSD_EXPORT */

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
