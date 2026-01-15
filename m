Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A877CD26D46
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:50:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oWn/jHQmnwQNhjQDkjIb4Yv1aatKmtb0moUZrrdnzY=; b=AURxefmELooo1C3JbHHBNdPJ4/
	WHJNid4XrYaAFNj2p5VQ9WtW8TS/8aXGojcX2TVAsFIhcwwWSCPiA74uhTCTmC32rFoXEdvDZD1UG
	bpzplIaeS+fsR8UmrNOVQaobAaLqy3TZq+0diwTfXj/tEcwcw+vit0R+qGSnJ3dSwEms=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRUg-0001p9-Em;
	Thu, 15 Jan 2026 17:50:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRUe-0001om-K7;
 Thu, 15 Jan 2026 17:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RGpbpT5sGMPb1IBCPwnK7v1mkqc8AIml9XaDm8oqePw=; b=XlKpfCN7dXOZioz5SODMhNS5qT
 RBJAtCEkSVdPuRQYX6o5CF5AFuq247Z+a+Ypu6WtVLTx+UfXXGxsEAmkwS/Go0i1ojkuhsCBjAgf6
 laxk7OGsijTQUz9wLMol8AckGmC4yXdy1yCMcdQUbgyP2izNBoCR0VVwKlFIsbzjitcU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RGpbpT5sGMPb1IBCPwnK7v1mkqc8AIml9XaDm8oqePw=; b=far497ms4vyLVBJQcjcUSsQqPn
 itj5fMzK8FX4PHVGwJtOkMYYySQ2FoMelu/2sFkHtJDnbUYfMVb2nzS+7obcz/kn4nTesG5k2agQv
 WpjRg7P/SRJp1Sqgs0rpXov1o6ATZvQanyyFfjkSwKKAqiOID+HJy9lQ/dA0OMqPYwzA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRUb-0007sz-3z; Thu, 15 Jan 2026 17:50:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB46A40DF2;
 Thu, 15 Jan 2026 17:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3889FC2BC86;
 Thu, 15 Jan 2026 17:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499434;
 bh=Ehx/fY8sKADLaMJl7+FCvLMSAa/U8OqMGXINa886kwM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=il/VdfDB1LkGOpRnPQvrFUwdx0K2JPqnFGRJntiUMVPnRxs5PHZsfMSValtvlYy4j
 mP/J05iJU0gPS64R8GEMOhjWoZHTdcqWYKm1Ogw222ideGX5ipm1oSmIbMKQDoynXi
 UP645amY6X6foCDNx121QYUsH6YuE9qBLm2QyYpgyOtDMDTtrSfXKS6vvYfzeGVlpZ
 NBXNHO0X6RoEWOVoNemGaYh4g8Rj0kVFicUqGBtTiM+GOp9CM0/rmo3WVap7u4Plx9
 iF1KhPCMNTJlYXtmOpwM4F52XhDOSltoNylPFsa9HOjQ5jMxePli3mEAGzckJ3GyvS
 POj6uKKk9HrQw==
Date: Thu, 15 Jan 2026 12:47:54 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-23-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=695; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Ehx/fY8sKADLaMJl7+FCvLMSAa/U8OqMGXINa886kwM=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShJPTKQVJtR38HPlADggm6IpGXuFgpgP+f7i
 KyE9A2oIKGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSQAKCRAADmhBGVaC
 FXW6D/sGkS32C0CvjQ+A3ll9zy6dfI2gSXvXs2ERkXcQcsSsv5r/hSiEtw2RyBxQyx6rumNm5mE
 QyUFWXbdaTwcwSGobqehxKp5MKzzcfp66q/Zpo2jAaY7Da35SD3PyLH2KIbv+fiLrBBo7g4tDXn
 mkyY0E5I7NyoHgkD7SQ01nu7bbMi//dbuZJ6f4swfTGiZIdiCkQdMPdK8Ab1nXZBTmGes/5vUoD
 tGaMY27xGBCoU1OH0XNfDeZDjCmt0zCV1GcU2M6s5qytJFpPecsCi3g9XTpKEPAiuUVohlmUH6Y
 964nITE1D+6aDlHH/n8fXWwBcwAvWaUEd0zjh33SwdeUbgGGtpFvVIY5jZvo7+a1zqLkm/v02PD
 i8nD3PIVvfzsAadwDV0ljzI9h1nNV0XB5gAA0NYuiq2KdbpspRl3AwFGziplhIc2IfOUFi4pqEx
 SWDLkaRbFUSzetyFiUM3KqyYHrJFY7y1lO0+Rteb0YEfr2HVYP+9wA6e1xFpmUVrxVQCszE9tzS
 qbr2AirzqRv4ThIptuA5w3v8c5ZPCJiKva4Jx3gS8TT2vj8MZlBxl9rywDy5WyKKUPnoFelofEp
 giBXGcbgNMLDfX7iQ7xtrMTIY2WQNMzmLb0/QRyfr4yue/WVp+cUchExc+2VVPEi6eH84pgNfcg
 n6TOjJhVwZKiTNw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to jffs2 export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/jffs2/super.c | 1 + 1 file changed,
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
X-Headers-End: 1vgRUb-0007sz-3z
Subject: [f2fs-dev] [PATCH 23/29] jffs2: add EXPORT_OP_STABLE_HANDLES flag
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

Add the EXPORT_OP_STABLE_HANDLES flag to jffs2 export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/jffs2/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 4545f885c41efa1d925afc1d643576d859c42921..80ff5a0130603f94c9bce452c976753c85314c3a 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -155,6 +155,7 @@ static const struct export_operations jffs2_export_ops = {
 	.get_parent = jffs2_get_parent,
 	.fh_to_dentry = jffs2_fh_to_dentry,
 	.fh_to_parent = jffs2_fh_to_parent,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 /*

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
