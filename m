Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2904D26CFE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:50:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ig1UgLuDXdm6Iw0pIJUsYNbRHZeAiRyW6W81jEEvJJo=; b=Y2glpfSdgV1kEqtW/SCj00y4f+
	XNC1M/CnXkOCQyEHBA/l5yUi0kDqtfDT8RVg+AHj/5h3R7ltBSX/2P8v18N2Du0HpMkf0DpfPpXRA
	7YHEo4ba8abNsQSNc+ROcz7zR+PgA2p5dAEtSPkvpm9os6yZ1PRGjnW+1t0x3cOBtfXA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRU8-0001lS-Gz;
	Thu, 15 Jan 2026 17:50:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRU7-0001l3-Id;
 Thu, 15 Jan 2026 17:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o3PDjLkgcXJzDuu11ScoxsbNv2w5ZQFaQPWZZv+nmpQ=; b=hbvQw+Xq/3mj7SLtV/442PWI59
 9rBCIccSvzmc4P9LLhjDytsFGbJ95H+2J9HhZLCGo6R72yAVu4grm8iWHr5lZwpWEtbhQKzumKgFF
 XvrwXvs3KVUgbXDlJ2aHvmZr2j9aPmo7H5+ajWMkTxUZLuXNRFAtEM1kXyaOM85KyVMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o3PDjLkgcXJzDuu11ScoxsbNv2w5ZQFaQPWZZv+nmpQ=; b=BXhJM7SXiASNTFtkvqK0xJ6Qnk
 s0nba/f+z3CtAUU5x6hDdIr3lFXAF1GyZI+O3jAoGwMx5aLNeZ33WCVjzu8v0FxMNX2NuDaq6zNnf
 pT1wFlpfwr9zUaaGVjAAfYOsfkHl/7ddch2VinOVtTdVfBNBPoVXDVN+uJj07TjE0yYE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRU6-0007nF-3k; Thu, 15 Jan 2026 17:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6A6D1601BB;
 Thu, 15 Jan 2026 17:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB285C16AAE;
 Thu, 15 Jan 2026 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499408;
 bh=ASJZAYmFtZFPW7zLvK0ZjL1I4NBdupfpmX/yzCsItik=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HzaZLDCouvYiTo43CgRna8k0stYnWVggWRX+E7ITKTkQk6SqWtN2mAUd0YAGY8YFg
 fv5e/by8LOrzChGrKfliZQ09J2SJ9WIOLLR193K9GSI9t/myHqGnT6ZAlWdt+Uzf0N
 0rJtKvSWVHfJJqTWUhDArUuUXTS48/7IUyWI+5Qw1LrZ/CqnOghvhiGz/sBaMmfaWF
 KwiX1CJgcy1laOLzsMhtzU5kB/g4fimS9XsKVcl1aEGTakFkmzA5K2zFUXcXPxk3eL
 joGa56XKg7cKCx0g9tt2zVErEcJm0Vej01lMJF225kYkCN1zd7whNuBBNxCg2pN5G+
 x8ukV6eAv9GoQ==
Date: Thu, 15 Jan 2026 12:47:50 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-19-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=702; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=ASJZAYmFtZFPW7zLvK0ZjL1I4NBdupfpmX/yzCsItik=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShIkjDCKglCICLqHNwkybqhDZvmrtSF0SGBF
 LwETpg24QaJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSAAKCRAADmhBGVaC
 FXMJD/9cA2N1WYI1YFIcrFPq4MChLxHnvueE6hwkxPc5K7vP7yNwnn65W6JbEp2ObLGTsNTKPYj
 hmY2b/q/WvxyA0jN2iG7UYGUrcmbm8lyfJERfWQ5WnN1+fOBhsMD2Q+TLMqnMgi99BTN3V7CHwd
 7FcYq1rjFMR7i/SoCxFhaVCqjz/9amidfbT73cjGr0kRadbn4rbsw/SLhVv9+z9iK5uyJ4D0blu
 t6qe9CQoAyjLl+Gms605lcENCFqAWP24jtTNmaS/vvulwuBaTl8c+OxHuOCzcH9colTYZUoXSLG
 amzf7eGV7BAAvedVjh+Ycdb0/GwSn9uu+Tq6iJbHTMQMQhpStolF6blR/PRlzWQ/TjYQ3k1VhT+
 0gnz7OR6GaIZk7FkEbKolcNoVM5mc60b9ZoATyL6jx/F4dczwq8Rsv3SqAiClgX+w8mU9dp2Jse
 SRzo1N+Zkj5xAutyPJHj14ERMNwpP2GQIeG+tUyGQ0NU8BqNcwvKIVqRChO0ozWDEaLh757srrM
 olAdLIVH7Rz+CEygbk+t1jGLoA3ywVL2DS5w14345MUe5Hy0DR3iZdpCUlGE+OsZWQ0+BQmmVc2
 Qt72vG0qGAZ3O2rom6X15ExyF6DZpXjgau/5XwvIGUCwEP72+KQ0B1HN2KFve5zwRDbiBxvD5/o
 incrg3kj2EjzIqA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to ntfs3 export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/ntfs3/super.c | 1 + 1 file changed,
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
X-Headers-End: 1vgRU6-0007nF-3k
Subject: [f2fs-dev] [PATCH 19/29] ntfs3: add EXPORT_OP_STABLE_HANDLES flag
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

Add the EXPORT_OP_STABLE_HANDLES flag to ntfs3 export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ntfs3/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 8b0cf0ed4f72cc643b2b42fc491b259cf19fe3b8..df58aeb46206982cc782fad6005a13160806926d 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -889,6 +889,7 @@ static const struct export_operations ntfs_export_ops = {
 	.fh_to_parent = ntfs_fh_to_parent,
 	.get_parent = ntfs3_get_parent,
 	.commit_metadata = ntfs_nfs_commit_metadata,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 /*

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
