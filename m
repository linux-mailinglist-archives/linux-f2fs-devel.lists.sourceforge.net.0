Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD23D26D19
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UboO9iyoDowbp1nB+IyiuRNZ2kl29AFsPZmhx+nlgds=; b=kzoj/Hvl2Ap+2RrXs6kOLydT+l
	a8n1vWG75CDNX4SSuuPIzHq5z3HurOQsxUPpm41idenWMF6rTvmJzLE+W49AzIWovP9fMDPMrzOlT
	otRsBD1e5BKH/mvoZvhLy6WHHUMyO8gHoUxOH+gD07eN1NWOOehAHd0YHea3zgQn8jsA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRUN-00067B-Ab;
	Thu, 15 Jan 2026 17:50:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRUK-00066c-GZ;
 Thu, 15 Jan 2026 17:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ofTok/hZ9dw1JbMr5NBZWt/it5I8zRKreVKO3w5NLO0=; b=RwZwGXwi+Nc1cGvHL8Drufobl8
 xEHsyoFT6bPshm2YGrxbIILXYk3MapdLpHBIGHm3HVY866B7L5S/5bN5wYeG9YHU3VuYdfvcqLxgR
 QOK6aTHm7fdEtD37Aa/lnPoa3QZ6uH7I1R87RCefCHXNhR5E0AD1yDelvzPXXlwYpVB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ofTok/hZ9dw1JbMr5NBZWt/it5I8zRKreVKO3w5NLO0=; b=YUFZQchmdxZO19OqHajEQo7O9Y
 dX9yf4nviRHI6KCaxl0wbH7ZRLhnmUggG8UhKWWwdFhRnrDo7ZUE2uRyqw1GBEelDtldNex78l7az
 hREJDGaHggwbeo/p9FSVRFhKF1d7D4X2EIRr96kBxUMFD/PgqT1bApFXrlmHpQ+F8GWY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRUH-0007pF-7C; Thu, 15 Jan 2026 17:50:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D503B4449A;
 Thu, 15 Jan 2026 17:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E799C19425;
 Thu, 15 Jan 2026 17:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499414;
 bh=U14CgwQNmpmYm/olsFPDmAvGebUpMmdXLYBcSiJQo68=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=U4LOVrQzZFDe86/JOIxFd/oTbsgvDFVbCPtnJNbJV62tNETnGVQcZbKoD5VbL/PwJ
 f+gza7nr1wN/rVp0cfVFyiNPnmP2h7xyzhf0lL6Pgjbxf9ja5yS9DCJsGAyi5yN2sy
 4ue0mFvkb23UAcEXqDIfhhT1l6jADXeh4D2GGCzn5vcFi47mkyVciNWNEAcNyEn+N1
 1k+iUbFC4J/zNUdYYVPM6f7EiRxfog9ZRuVbC8ETpYpelIdZmtAzDehlXfJNHIhEL/
 cTjgLsM7yaccBslJ6+uQ5W4Vwp47GREyY/Ad4dVxEPb6+NiRXZswo082ea/IHe7W0+
 ZfuwxblAnAqhw==
Date: Thu, 15 Jan 2026 12:47:51 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-20-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=686; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=U14CgwQNmpmYm/olsFPDmAvGebUpMmdXLYBcSiJQo68=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShJFbXOMj4js450jk2J72PWoFR/JR82AXdQy
 iwgyzXU5QSJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSQAKCRAADmhBGVaC
 FSZYD/9uphGdzaGvn2dg4Bd0XX2b8qmIqlYBiw03MYG0trIn0ktMmsuP2fx7I6z6kbKu96A8Sia
 mP/7efimfs1aKaZJr6B3/fmOtBpqwhnDS3kgWOTBu8fDTe5QrkDi+ctDvRVYiIfrAN3+C8bAhrA
 iNy5KeyzvhYkJqb2hf+fJ/zhXqNbv260P6SQ05cNKI9yOiqNnb8npWxgwD/vxA72R0KLkPQngA3
 0iUAXySskZKvUAw6bAmGwc6TeACjpDeXWilP5zP1ejD115mBHRoyPjyH7E0UBwhi/ZwqrQh0Yli
 Q1rmIL1WaF4AqtEA7W1a1ZRqFZwrIxu9SiDRp5xS097OtKgyBRM3YcLEz46iyWojw62Vts/p1yd
 5Zwt0L4bpA7o2oY4CduvIzH4qaBRWnl72mLRhifKBY07v4jEXZo16rcfN1R/TrHWYnvEGK8bVOH
 eveMdSkU99tj3mokzFwkv0xuTwrFRi/Ybi4/OZ3qZhPiaw8jgKHBTSgOzBny17yPp9hLsv3yQoa
 MdwJ48ubetO5oTRrxG5TJQpY6oLaYJ5DfnsyAbylsupYYb7doZ8JEhdLu7WxLMTcUEY06PSoVR8
 Y4467ix83xMvF/LKJBQiPwr5dYhMyx6uNDY3V4tsPAsxBsBErVvgWXjOygYx4my2qfERvrWSmjA
 a18liGFzln9M3yA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to nilfs2 export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/nilfs2/namei.c | 1 + 1 file changed,
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
X-Headers-End: 1vgRUH-0007pF-7C
Subject: [f2fs-dev] [PATCH 20/29] nilfs2: add EXPORT_OP_STABLE_HANDLES flag
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

Add the EXPORT_OP_STABLE_HANDLES flag to nilfs2 export operations to indicate
that this filesystem can be exported via NFS.

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
