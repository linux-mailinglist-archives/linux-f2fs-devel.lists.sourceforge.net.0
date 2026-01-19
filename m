Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA87D3B0D2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:28:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th1CF3QCEZAJUtjb6watS5yWoiXjCvBZRnVd6ic7zvA=; b=e2VJz9LSw+Usqs9s6hSbCJobVC
	eRxQGZ9fKPFR/zhg7q+uZG5XecJDd2sfBXBgRyJteMdBq6p8B6b9Eu7TvigA0137h5py1OEVKnFL3
	ofarmeFE6qxXuGlnc+spHbnntMn5UObg/RlByLTfDhUDNYDS+Yi7VZ29tjmjxLrp1kfw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs7Y-0006Uo-HR;
	Mon, 19 Jan 2026 16:28:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs7W-0006UJ-Ac;
 Mon, 19 Jan 2026 16:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=obBvXeIihwcnYNwIfK7fO8NOfGknt4GVIgzKgx3OkiQ=; b=Q1F8aRxRyvWhwl7pUSpypEkB4Z
 hA0bH3yBVLOxshQ54SKo6IqfgZEcZtijPXBPKwEMFMHYWyOwL9WBgq1SBngbqyc62YKiymcRzKuXc
 XswRnI6T3NY92ngX6x4aT+OxFNK+8RUV2ll3wjD1ABhTpYHD2g1iIRBr8Wxw71U+SOTQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=obBvXeIihwcnYNwIfK7fO8NOfGknt4GVIgzKgx3OkiQ=; b=I+TTCJpOabUmRMxMtHEp70pTUo
 pKooSLRw7jx6YvweJEMqkQnDc5AYTCSNnQz5bIZ0DlpSilX/q05XgpKPvh2Z2U27+08gyp9abVXf7
 XozXY1IWUNK0VmRggiHl8SjTj+9Ysj+WWWZMRsEjXQSxW523HCOaB3VuitqIndmUM+aE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs7V-0007qN-Pv; Mon, 19 Jan 2026 16:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1700B6014E;
 Mon, 19 Jan 2026 16:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F5DC116C6;
 Mon, 19 Jan 2026 16:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840118;
 bh=FgvaakP+KkZTiWPmd/GcmMQL5i/gToOI+UK+TD05398=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Wgi+FWvLw0MQ+2HORgz5R2DzsE3xTDpIeJv3h1S0cFNs6i9UQbBFBYRNiA8j8Fg9+
 KHV2BRMV8sc5hIpryCF11pPiQxFsp5jsFeGRgjvKpjnr50AHMK8gIN85Nf3HliIyJN
 fVEnoXFDYtI2qYy/Ygj8CYKdqJi8j61eA8sNsahGBpQ1xk2jp5P4+4TfuS7JqNHmrB
 NIwutz+PXPre13vg54KrR7HlTKnjxB4xKcJY/PQYeRmbOh3hCGCON9Juobo7p2e8vA
 llAP9XHmK5riLuTYR5uf34R6+LIIkqWX0A7ghO8ELhidE6qt+BMPFR9uiYqbZgi+m3
 4gFfkEvNqWt6w==
Date: Mon, 19 Jan 2026 11:26:28 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-11-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=FgvaakP+KkZTiWPmd/GcmMQL5i/gToOI+UK+TD05398=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltbCPwpzNwYdBr0vFnmbNYzyzE/ZPMcrbCYA
 XY3FvJ2K7mJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bWwAKCRAADmhBGVaC
 FXLLEAC5N5AzFG4uvYDzXr4HYnhMSx1oslQeDc2aNn/1b0a0OMrmi86P7CYesaBsl2EI1ujp33F
 OtWIgVKwOCZ0pSCYP3crtFEbaq0Aw+i2Iyap1/h/6lHHzapF70M0725+Adlu3M9tGmo7Bjn9ZY1
 o3g1+ZCSHq7lVtNiYMCk90mQ1RLDIva6G7gisSZ0fNGeM5YvlxzF/PsylbBWHu0MnsIQSKTN08x
 8lcD3ifSkZh+XuXVyuqGPPojdmvdQH2+KTj3ye6IdrjX67X6HUS0cJHLPZZGYv7qZ3zhHIZ4ocP
 S/4ZMNiZoheepK1QszjjTUh6OgEpzWX6wDrw4HIBp5sFA/qKKcltgPiGeItaZGnb1zHxgxKhEta
 6rCEV1Z4hVXYA8qhEdd4mlpJrN8I8crXV7Byc5x1gTg2LAwlNXNqDY/AMBY65Lo1Tz9AEHmByTu
 PIcDAm+N9dxEnC1iKlTmlUoJ1KSXFME0B0IxTb4/5lkGTrgiT3NRCOY53lJ/4kY9QRJuuJUjLhb
 r/b3XrJj5q2R9ASU1G78XzaNpdcTx7XqsTf/VCB6XsMbLtDtkBv5HFeP4Ggahuw4xSJoK3HHhbz
 KtCZVqPbkuk5PQxouzkrY9RyqOAz4a3KbwGRNzNuGfTCJBDAUCM6LBh2uoT33ckjofS0O6ihZ3r
 s+733coP9qobvCw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to befs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/befs/linuxvfs.c | 1 + 1 file changed, 
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
X-Headers-End: 1vhs7V-0007qN-Pv
Subject: [f2fs-dev] [PATCH v2 11/31] befs: add EXPORT_OP_STABLE_HANDLES flag
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

Add the EXPORT_OP_STABLE_HANDLES flag to befs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/befs/linuxvfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/befs/linuxvfs.c b/fs/befs/linuxvfs.c
index 9fcfdd6b8189aaf5cc3b68aa8dff4798af5bdcbc..1f358d58af8b4de9bc840b9926970340395bc9e4 100644
--- a/fs/befs/linuxvfs.c
+++ b/fs/befs/linuxvfs.c
@@ -99,6 +99,7 @@ static const struct export_operations befs_export_operations = {
 	.fh_to_dentry	= befs_fh_to_dentry,
 	.fh_to_parent	= befs_fh_to_parent,
 	.get_parent	= befs_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 /*

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
