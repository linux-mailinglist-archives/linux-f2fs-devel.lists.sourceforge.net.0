Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9BFD3B0CD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:28:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8my+O35PYqZ78iylR/vznXJSOdUymtsbtjWrQ0Bn+w=; b=AcT2dPTuByd2FOS/fRJNC2hSly
	87S92WCQ7s9SjvsbwvtXuO09l1iiihwrk9JiGn1YSFY76jNxOKMgQmnm9SJGRmXD2BUojywYQM1+1
	faPGUGUuEe08WWusPGHnmSZjslrJqifWAvAzkCw+5YMCnfsm5ISIIFw95DBTnboR7vIc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs7Q-0005MO-Su;
	Mon, 19 Jan 2026 16:28:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs7O-0005Lw-N1;
 Mon, 19 Jan 2026 16:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Aie4wuK7gXGDGaR4byHi0y0z34zy74jVcZ0ZTmnF0U=; b=bqeksTpG3YOifqh5+43unODKtt
 xDygaIPECTzWwxQzE8PuXKwPCizwwiIi9Ky79S+yS6Pogo0REMllBnOCsrR4hkLX1zdwlRlDldGLX
 QaiMiDEdmEmeYiRIQQN9dTQM/YYWUGdrElOmk1d1+Jcpawmx+gRS9WbtLGhCuqj8XYqs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0Aie4wuK7gXGDGaR4byHi0y0z34zy74jVcZ0ZTmnF0U=; b=E24OkxAQmtfhh3g0ALsuPqrYJT
 sSkekktj6nwcucrdlmryPofQG7FNEyWRn22SFtQg65V+pkV/OYgNXbvyT1Z21ISE6OyQHbx/oML6p
 wG6RBdtO9Nh97R1atxot/8uCRqCge1L+ntzkOw6pmn6yE8GOXLyq/9dY36+H+zMkr7TE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs7O-0007ph-5n; Mon, 19 Jan 2026 16:28:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CB4E643453;
 Mon, 19 Jan 2026 16:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE048C19423;
 Mon, 19 Jan 2026 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840111;
 bh=EHb6P72K+L3+Sb6SzLJj1rhREwGw2p+u8b7kNcs5wTw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TrsKMHXT/sCWcPrmeChQ8L/OZ+Si/PDQhiEM7iDesj6YXekwxdKrB2xnkwdcu92LL
 HH/uxP2Msg+8sIyiXUDu8w1atUCsdySf5qfsTHdm+lDQKjVYfrF+7BwwTaiLvAFkVi
 oNHfCi5olIFqrV9QNTwZBWASWLSU/z7pcAmrYhjYdcfvqgE5hKzR5qjswFtp1V9bMc
 KRNymkwYKSyw01Riv37C0HKrRLEJ2Gi54kMPoML5smsTL5Ikh3az7wic4eVrgz0B29
 3LAsKLmZoGRnwr4Lgl99QwOiGnsrsk4MrbjL2Z/tqXBta7oDaQAd9r6pLPzwRrSPZB
 Qh0o/kHlSIPaw==
Date: Mon, 19 Jan 2026 11:26:27 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-10-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=678; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=EHb6P72K+L3+Sb6SzLJj1rhREwGw2p+u8b7kNcs5wTw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltbvp2orig7d9mXjeoPXhSVy0pWJJMG7Y7qq
 gRF3d5VdAuJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWwAKCRAADmhBGVaC
 Fe+RD/0ZkSh4Nai0BmaiUEvJICbcRTV5b1Lv7WJEwq5JjPI+bTHc3LovjfczVEaYuoGRdG2abhd
 cgg2Bl7HM09V6aZVbhZsyMZIlhRiz9fjdp3BB9kZiBv8QXIWFumRTxtwe+JYKsg33sqzi8iERMF
 s+4mESToF7z7l3CEFigwLlU3h/bDOCbXa76NM+5xsUih79xFHx5c66J/Qpy64Pvxy3SXF2ff+Db
 pYPfkSfWUHFBL0aKVLTX+KO5PJkCQKoAz/h4ytqpFX/swD3YLbUsT+oAtZ+X0fzMqTiYn49Xb3L
 jNYiGvi+iKzQfSf0QFEcNjhFA44Dpu8BmAsuH27BcUkRSbW5XuFrv+SzmIhhSBhhlyrEjqTSAB1
 h4u0eUui+5shxh2+EEhoIoJzAtQ0nhCGs5ixlvEvsekFglUy/wV5aCaKbscbejdIuwgB9SOwBcC
 NaffoK/cGpZB+fBU05w6C0t+4tKDn0S+u1dKfJNSzffOcB27eVll+IR2cI2CH0zNzDvkDVyh6Hc
 tsoqRTfn8CtdfoWs1mYVN/bqJVe9yE25LuB+hvEZNc52LywejSC4iD2wXfw8FkJ8dIf2fsRQgT3
 aaQQFsS1FLzw3naxtye9sdQ4gzqutNjtMU3JZTh8aLQhhnOlMc0MHNgUdEdvHDYBHLPJ0wyPxGt
 Sb5dYA/LEaVyd3w==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to btrfs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/btrfs/export.c | 1 + 1 file changed,
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
X-Headers-End: 1vhs7O-0007ph-5n
Subject: [f2fs-dev] [PATCH v2 10/31] btrfs: add EXPORT_OP_STABLE_HANDLES
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

Add the EXPORT_OP_STABLE_HANDLES flag to btrfs export operations to
indicate that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/btrfs/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/btrfs/export.c b/fs/btrfs/export.c
index 230d9326b685c4e12dc0fffd4a86ebba68a55bd6..14b688849ce406b2f784015afced2c29422ab6c3 100644
--- a/fs/btrfs/export.c
+++ b/fs/btrfs/export.c
@@ -304,4 +304,5 @@ const struct export_operations btrfs_export_ops = {
 	.fh_to_parent	= btrfs_fh_to_parent,
 	.get_parent	= btrfs_get_parent,
 	.get_name	= btrfs_get_name,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
