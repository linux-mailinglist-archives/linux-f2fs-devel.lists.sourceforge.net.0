Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1604D3B0B7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:28:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFjBz7Zj8ZfvOSgtrazVWW1TuPZ9hDQGFISF7NpAv1g=; b=MW/hFSNQHY/haz84WJc7moz+yB
	RmLYnnC6pEk+SrfV/e1BU3wTBd/pae7YOzYO/Fifa8ktnoFf/wHwPM0zc7WhNhqKEUsfFRNVAi7GZ
	gzMjVxDXJWhJK0hz9Jghp7hn0XqMDwksMGXD3pq4x7CQQ+NL6SZvC/m2O8bS8ATYkPZI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs6r-0005II-Fe;
	Mon, 19 Jan 2026 16:28:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs6p-0005Hq-Gr;
 Mon, 19 Jan 2026 16:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u0eD/Hla4s8rmMuwNVa4cHjRWxSkSOpPy65dqqDTfHQ=; b=OxMZH591UcVdzsipCSaQVIHTrE
 m6ZgdOEQ3yC11Tlwvi+G+og+Z2CCUlOywjvLZIcToWfYnWs0nAabiamwpO2pYVMthbDXM61EEKdEp
 HmdRHceli++0fySGNv05hQW7mxCRz4uWihEa7L8P0f5ttYho6vf3RwYGX9hPSk7qEVdY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u0eD/Hla4s8rmMuwNVa4cHjRWxSkSOpPy65dqqDTfHQ=; b=eBJaYfJ61ENM683JtzEX+LqMtL
 yLhvOtS/Q9P+L/xd1fBWB+tjRTjLEHXvrB9NLq+7iChoBdzwH8Vh3rquCE8Aur7fRy8O16edLMf/d
 rKa1MSZvmAe3cnn81vQcnT/jBlKC40vAqg9WsN784X9grRTvUiv6HHuIEUXXnyI9FQZg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs6o-0007nc-U4; Mon, 19 Jan 2026 16:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 432DC60135;
 Mon, 19 Jan 2026 16:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24386C116C6;
 Mon, 19 Jan 2026 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840076;
 bh=NlLYDWzXRW6rnfbCFw7xB95B0dQtUpjhcx2qza1jF5M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JOwo2Tlf1wQVs4rSpB2cvGoIOQu3++5wLoibt1o6KyCZ6NKRs/dwpL3TtvXLTtrMB
 tcIaKEiJB0U3JEg62ukqgO+wVVLQYHHpZNPMEnMj2cASfeZPDaFPGaRc7/g2tpJcZ0
 8LEN/zxj39delP6+H9fBw/GfNqeS2kAbT6wazW0CnxR/UsD6zosr4yvOKKXG9kGRu6
 4h/YQ+A3NcydJEguRgY5PVyIhfCvfttE6K3brApDuPGezWzApDC+TxFB7SnFWAzMSt
 Kh15fMfIViRm6TDmNYiveV22yjV/aUpG7PhBWedHMlXAGIDOIzaDi9XFZRhQSvf7NA
 31z/5XUrmsu7A==
Date: Mon, 19 Jan 2026 11:26:22 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-5-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=727; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=NlLYDWzXRW6rnfbCFw7xB95B0dQtUpjhcx2qza1jF5M=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltabE2Jm7JAwFuoi4xvjHPIjuOTxYjIQNa1G
 qwefu7ew4uJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWgAKCRAADmhBGVaC
 FUaaEACos0NEKrzptD1SfGjP3BtYKRG+pK3ttXeXq6A9Khy/WctcfkvCNKlgDFmyTKEKtSgK96w
 fzujSdx3zZDxGdKH/+NfIFJWsLGoSjYFRoCEHLoa9JKb507JGYtKM4z049+lfDx/zFh1gT9kCfp
 T7A3LKYI+1JZKk+IEwacJMVGpxciEHIGyd16ecTZ1UXjzMPn23/CbMbugOgyDz+yiq716Rss7/B
 Y0xqLA/b9InbEXlKHeA+TEzc45zeyVJLmqPcVSjw4sVDN2pqtawY3culsHQVOTqQtCI/Ysd/MGt
 Z2oT2COgY9CtFgUnHYwfWuyOGEy2Ct/pKDis48+kr/t2+13V2QZ7eZC39OINqIFttqV2erxtigs
 DxUKY25Ebtr3SLjtdIxPKO9Ae6HtzWe77tux6Yj+uk71h7u4U9wkox2xobuV/erBgRIA8YWhjxx
 nPv8KrXqjz1AugEzDvmceU3KG6j3KaTRuxbDGLbK+0xzj4Rq95qnuvPdcDUCGXLlgdfQEoGBZZn
 BN9cjA9xZ2JHPSRr7Ihx9qp6jKSfdkrObAmq7B1iBkwVpP3nm7htFDPMNp7u9aC04BG9aOdJEuw
 5XYI9GJTUGAorVbchUP0mSCCLwZzDppIbGZZQWY+lr0lTugsXHeG/m5lsFZnn7brwTTaobTfpWU
 AnaMFB6Wxbzrcvg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to ext2 export
 operations
 to indicate that this filesystem can be exported via NFS. Reviewed-by: Jan
 Kara <jack@suse.cz> Signed-off-by: Jeff Layton <jlayton@kernel.org> ---
 fs/ext2/super.c | 1 + 1 file changed, 1 insertion(+) 
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
X-Headers-End: 1vhs6o-0007nc-U4
Subject: [f2fs-dev] [PATCH v2 05/31] ext2: add EXPORT_OP_STABLE_HANDLES flag
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

Add the EXPORT_OP_STABLE_HANDLES flag to ext2 export operations to indicate
that this filesystem can be exported via NFS.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ext2/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ext2/super.c b/fs/ext2/super.c
index 121e634c792ab625d7a07251e572e5844242fc2a..936675f06806d268ded5a3ba5306575c437ca9ce 100644
--- a/fs/ext2/super.c
+++ b/fs/ext2/super.c
@@ -426,6 +426,7 @@ static const struct export_operations ext2_export_ops = {
 	.fh_to_dentry = ext2_fh_to_dentry,
 	.fh_to_parent = ext2_fh_to_parent,
 	.get_parent = ext2_get_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 enum {

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
