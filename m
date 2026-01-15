Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDD6D26CD1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnZ66DVsdmUFvsTmMblGy9WsG7sO2hYENuoT6FDqM+Y=; b=g2MddwWfFu/gvoTKJozrvUvf6z
	R+0J05eaGg3qjGtxJAb+woues/bHqKIuSs1Ugogi7Euem+fx/DMsIiP/Yrfs5XSUTbB6+IZbRghl/
	BkOpydSNTpdUSozBxp0KXP+1hXhQobDIHEN/cFHK7U9GGNExfUbHPNqkG0KoQvzYHmaI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRTx-0001Ql-3L;
	Thu, 15 Jan 2026 17:50:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRTu-0001Q8-KH;
 Thu, 15 Jan 2026 17:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7alxoteVO3R/zH873ahX2WwdsTpmrn80lHOvMEo+NwY=; b=MerPadkWGp51l+DCEJeqV6MZel
 QsjEvoV2f2XTq0MBT0GmDIbfx/pCUiVDt+FSNxQqk2b7YJw5bPNS03r6v0DDuO4UuA6LufGHZv2TP
 XMLS6CFLBQflEsGCIiEd2PgEKKq83DGFgcnNa/yjmHr3ulIMZNIIFKvdyrDRahH/yueg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7alxoteVO3R/zH873ahX2WwdsTpmrn80lHOvMEo+NwY=; b=KxSc/V2TJ1FQnBfyTkoIvwBnks
 t7Un/yMPu28FJnh3oOOuSQyupflIQ+PSYt0pql+hGk8Ks3J8srkW3LGHVif/GS3RjTNtjCc3uAb5y
 93nkAUc6HYD03Aj5YO6qj1U3WC0ROQhgWZ3HoCeTzpyrXRcF1Dohn0Aknw81krHXRBDY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRTs-0007ke-PV; Thu, 15 Jan 2026 17:50:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 30DCB60193;
 Thu, 15 Jan 2026 17:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BD1C2BC86;
 Thu, 15 Jan 2026 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499394;
 bh=uje1SB5ZiQFb1nZ8cBWe/zh7xTuwWFv4kYXj9kW+shY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PYvNCKEmybxkHf/xhYZRJA1JR3gi7hwzBl39gO6WcRa3q4IORVrO7YuHny7TQpgiy
 zl17QOknyAtYmsTiWLBB8kQX5MvY5wrTFagloc02WkBy4em6uCkvDjKoFHPKgA23OP
 emXGk9XryVRw6nf06RD9Jk//mYkLce7bxq8Ap9KaZVFkkVfi2UtR1Ay7+9pJigW2aV
 gCp0wp4jlq5kzP/U0dF9wDDaTjGEPnvHrsy5L6bYYDJnpDGVchHD6uaUI+z8KRqcQP
 iGrph9vhwR67PUaiR/AGoZY8mbdpeRYHcNNaXtUEfUA6tSTZqAxqkmZ6b2KyUgQrbr
 crJ/YdcNWu9Cg==
Date: Thu, 15 Jan 2026 12:47:48 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-17-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=801; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=uje1SB5ZiQFb1nZ8cBWe/zh7xTuwWFv4kYXj9kW+shY=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShI7iVykyDXfFrTuLTz0reyANBqvVlG7B0Uu
 1Vj+ckj+QSJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSAAKCRAADmhBGVaC
 FVnED/9f0D1oqBjCgp3CIeAScQlnoGQ8qajHoqRzOI6pjd4BeqJxdTpgcQ9spfu5wEwf8/uW168
 AsidtnL65hfLo5B2jfzmYVtN8khTkYlu7o+v30HMwhrc+TdP8MbPt5uENZxqhYc6IzHalGQ+sA6
 lO6ebPCT7OSx0kc8KCnNrauxgw0r2yW790BGEUUOd5rdNkOWFNANuL6cCsZ0iGnWS5HgN/IIaXn
 pSuaXSn5yI8kTwKbcq+UQl26zHz2XAH+8XaabHQwV1/1tqbprihc0VIjA9ATuJ3el552cA4P6t7
 +mUkygIX/9E/GK/b2xR7rQdMtzwrMXfwYMKX3Dm9EIeRBKaUAkYDju/jIZ1r7fC8zReSpsp55KN
 nm9vynzH9R1cpP/fVn/Mi47dNwrypVVxyaeHqDW6OWQQthOCT5LIHs2LyeLStN7qpqPQElynuXd
 LyF0nnucvGghbceqM1JJps5jcNg+YM6f7tLgSJMUW2tieWOWIL3y7du3CI3YXeeHcFJE4AVp9Zf
 v8PN25mGlu9MyKpPWG4vF1MEDrCXJHoFgL9Pwyd/UTE88RjgfrbrP4dd6dGwiq04F6Z+Hyy4wsO
 CBxXCdkbZP3HFIUX0kWTbzYM0yKyBotEBElD6owLCSVU9rv0PLz3JL1vHgYObjL5Ke/6POBKGIq
 72Kjn84TseU7iGA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to orangefs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/orangefs/super.c | 1 + 1 file changed, 
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
X-Headers-End: 1vgRTs-0007ke-PV
Subject: [f2fs-dev] [PATCH 17/29] orangefs: add EXPORT_OP_STABLE_HANDLES
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

Add the EXPORT_OP_STABLE_HANDLES flag to orangefs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/orangefs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/orangefs/super.c b/fs/orangefs/super.c
index b46100a4f5293576549300ae9050430c3f07969b..140f27f750939cf5538eb68501dd60012bd2daec 100644
--- a/fs/orangefs/super.c
+++ b/fs/orangefs/super.c
@@ -377,6 +377,7 @@ static int orangefs_encode_fh(struct inode *inode,
 static const struct export_operations orangefs_export_ops = {
 	.encode_fh = orangefs_encode_fh,
 	.fh_to_dentry = orangefs_fh_to_dentry,
+	.flags = EXPORT_OP_STABLE_HANDLES,
 };
 
 static int orangefs_unmount(int id, __s32 fs_id, const char *devname)

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
