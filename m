Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E1CD26C2A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:49:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIaz0ZlWd+4V4RrWgO6YL9J14VYY+9EfeTwIEf5/To8=; b=DPg90k97yVNPtEv/l7+RY0yAG0
	jPpEJ6hf0tm2vqvH1FkRbGfBEiDoIx910MyTLF46iUMvgz3V7SnJC5pvXHUQJa/ClmR2zMtWG8D3+
	iTuZt5x84zMl4rXJViidQB7nBi+5aqPM0PluZBT0sAFQi1mqKYpodWtm5bvyFx69YyN8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRSy-0000Mu-CI;
	Thu, 15 Jan 2026 17:49:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRSv-0000MM-P6;
 Thu, 15 Jan 2026 17:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dcT2MNb5bbs1cagatsZFrbh+4HPN3saK3kpB9dL8T24=; b=DvaamDlLMd3HG4lpwUe9BmC/lV
 BMa9eq4Iq7NObAsX6sjIxMrjuYQ9mUupdWXAmkN0Jy452/yVo5KOEgO+0MVYrq9uM639kZwH0I4IH
 K/t0KhjvGre/g/jMUc2geLknvto84YX5V0WziSACORicIqnt/Vyha87faaCH8hhGHuUE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dcT2MNb5bbs1cagatsZFrbh+4HPN3saK3kpB9dL8T24=; b=RiGL3b1+/hVJ7wTjeBwV8BvGt8
 Zk7oSQedgIu5VZrwxpMo6i3FfmbQbaFUpqHn5FmjFhsnOg+s12mzh5TpQ69cXRoTX3jUlIjrnMjz4
 RpxnuH9xh6zU0JbkGMNMmFXfKhVpqh8qvR36z403UyTylHgLe9zPDiLzN9bFc+uDytOI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRSv-0007eo-57; Thu, 15 Jan 2026 17:49:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8C0AE601B6;
 Thu, 15 Jan 2026 17:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4EDFC19425;
 Thu, 15 Jan 2026 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499335;
 bh=bjqNmWwoD40Qnk+TzNgJZFwf0QIhVfVk3tp13EbdB2U=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SM3X45Dk5uYSSa9zWw3XI4I7Ss6sYTSQtClsuuSbca4pRTbsigBy2OSxOWAVI21wR
 eZ2Fh1LDbYgzQ6voMboihPby2Z1r5nZNmYeAGGwLvaOCqd/5AIKAgWF2Zt58oQCDEn
 9WuN15JYC7TmHhHEDPO7hUm/HiRvG5zY24QwluGrGzdolaEdJpSPzPJYgp8+EtX1HN
 j65MdUC0VNymAvQX7V5Bdy9+xqyXvdn1rd0p0de54gL6MLS06X5TAQiqXSFIUW/7R1
 QyILvgn7ZlION29gYsD4ezO/kSWgzPcuIsJfdl7/fUSbH8RL0iPM5c9vQe2rKPXh0W
 GMbfwrtSWhKkw==
Date: Thu, 15 Jan 2026 12:47:39 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-8-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=667; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=bjqNmWwoD40Qnk+TzNgJZFwf0QIhVfVk3tp13EbdB2U=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShGa8nQcABAK5jEXI2cbk8SHUMrCeg06EdMp
 RCwhBgmYRCJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoRgAKCRAADmhBGVaC
 Ff4wEAC2JupfnsVYXONrdaMqx7Rc1TCYHMpOlEnGJ3bdTPbia88mLGCcKDAI5WggJ7XRzIcKHWg
 650uAma7Bno5Mhk90U6+216K/tjZqXt0pzb4+W1kBELjWr4uFeCBB/pUPuH0S3G0p8T0qGT0/TH
 7gtmc5LBWW13mbYVsuobNKq9/GgvX4cR5cH3j8tbU9EXcoH6fVcRiETTdSysAC2+ne7/IdzZ9rb
 4BwiU9ebeLiXmFO37Y6yMQjX5EOr2k3wTZs/r3XMJhh/Ln/HXNa5w8VaRxsO2XO5Vq2r+As561d
 h1986yPq1624DSdy06ZKpUJiMF+roEU0pm0B9gzRlS6VLTaUM/RJIoq9W9foUp7hx2TEdQnF+en
 6vrSImaQZeCd+yBOkQSIUzt9mHiFSIUvxJ3YCmipafSLvhMzVX2jcd6RjE53mi+W1N6cvjmxxRr
 RcyTfuZWdbBsY91RySpnu9RZCgAz73j9EIJgvltd2CBdJaq6iFblaeKSti2sskXks2Oc8+uH86Q
 BN6MElZwK605F/Q+8CeGnP770IaFbHsiDWQ0lT+TI/5RXwU/E4MJQ+i41xWwu2GcQcCTk8CxAIu
 GCWx27MAOo5ADN/9Bj09FzZbltqCtp3P4+ZKEVUNQSvNSllzlVlduvpsl/bH3/ubLxbBdVYsPBp
 kEcghw8IpuKyeOg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to ceph export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/ceph/export.c | 1 + 1 file changed,
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
X-Headers-End: 1vgRSv-0007eo-57
Subject: [f2fs-dev] [PATCH 08/29] ceph: add EXPORT_OP_STABLE_HANDLES flag to
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

Add the EXPORT_OP_STABLE_HANDLES flag to ceph export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ceph/export.c b/fs/ceph/export.c
index b2f2af1046791d8423c91b79556bde384a2fe627..10104d20f736a8092ed847ecb27030be286c0ede 100644
--- a/fs/ceph/export.c
+++ b/fs/ceph/export.c
@@ -615,4 +615,5 @@ const struct export_operations ceph_export_ops = {
 	.fh_to_parent = ceph_fh_to_parent,
 	.get_parent = ceph_get_parent,
 	.get_name = ceph_get_name,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
