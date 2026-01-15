Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B60D26D52
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:50:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPsbYEdI6woy2Fo1ztto9ZeGD9DsJUq9/A90ou1bT7o=; b=QgQGPpKvFSqNmJMGf/3dPIl31I
	Pg4uqlYl7BkAOhKg+JTHukabojjvSVB86AD9w0v/Pvsthsnh3WyAqleTI7ApHfE4Ie378fC4nOeAQ
	vypouOW+ELKTfvZp+oqb5qRQRGg0cmcfj0Ekg+NvTM2kTUmQ1GrI7fkP36PIuEjNYuRA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRUk-0001qm-Mb;
	Thu, 15 Jan 2026 17:50:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRUj-0001qB-5z;
 Thu, 15 Jan 2026 17:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8pOkEdlPgmNI34dyIZCKB6VF8ZglgCh5+XdxlfbEXzk=; b=hqawXcVzGwXyZa7PwPzExC1azO
 Pu6aAsO5V5u3Z5Uyyj3Ra8c2g7jzeDs9Wrscn0yZWSrftefVafzNGEfHHLpIynsnUziqUPnvzMx8A
 wODGq7shkwJjI2bVfmo0eMdukAkQgruWhVdJ9gsoaMzebIaqQTjx+HQL7gHY+1CjstXE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8pOkEdlPgmNI34dyIZCKB6VF8ZglgCh5+XdxlfbEXzk=; b=kAcm9dqwRQoVLRObnLOvft205L
 fV3UFRlacQyfg8HUCiwE1U9fFigtrhz2bKVNQWoNOVVM2TRMf9AhdaLzsioefSx7OMrZVtS43bM4s
 i4BLWYKr2eeCaa0xleRU1L2xPYjwgk46r7c6cGYtruZIarVYp+t23kA9XuiAbxiWhaa8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRUi-0007to-5U; Thu, 15 Jan 2026 17:50:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7556C60167;
 Thu, 15 Jan 2026 17:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E44C19425;
 Thu, 15 Jan 2026 17:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499441;
 bh=i+7my1hIKzN4dEiJBuVJ6Xq5R7300GKAIzUA6le5LwI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=vDbX3mGaV3J17XgmaClvzPrir7rcZ3244jEyEMkg0ulRRJHe2lzEsEsl6v8ITObrV
 WvkOhbgNaFo0/WL1grmWsd9hNTGlelkodJYte8X5Zfy6RlEbAVoND5Tq6LyWEqSfuz
 r0YrXIL6lkDuTdzPDLpnxOz7z6Wh1fE6c9RhzNESyCG5HWxL0omGNAUy0P3QJIDwYx
 oPZdKHZUG6U3Qkk2i+a1Gk0Yd1/Q76deryInYPHiVrIL7A15tmkN17tEIGtuwpAJmE
 HoSOOj+qtSeBvhBwA86v5yb2oCgnDtqWCqqSQKXfOrWy5Kfo/GtlsuNj5uXjdW9Ezs
 PR8uNNzO9mghg==
Date: Thu, 15 Jan 2026 12:47:55 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-24-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=697; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=i+7my1hIKzN4dEiJBuVJ6Xq5R7300GKAIzUA6le5LwI=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShKBTZTAVUXXqyi6bJrxji0XIyjkD7JqQZY6
 wonbWMv0LGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoSgAKCRAADmhBGVaC
 FUq9EACyr/b3KvTajXKKWcsw4iTSig7acGp/8un3L9dhMH4MPBenFoJ9AZtBo9TOeulQUWODwV5
 d0cHtwgvOQyQ5BYykoPeKH3Klf7jh974vbAUu9wNUoufhW31N1yHvp98Hw+1KjoJBj8VEd7xrX9
 UklYejwsyZtn2s0Y9hw+wdkywLFwHe1wdyRKYh2ayx657SSRqjxH18TcmTGkf23E6UiM+CM0AVy
 uFtyUv/kbGeSxYJs/4Y8x9T/gZ6Sth6DCZB3Cs7pJkBXwrtyvZTW1gD77G9M74xXIAWsxDJ8Eyt
 P46Fgt6ZLJlF31KqAGaMdsAQPitvRXAnImogjK3VhJX1kibYdHlLAU8bXjGOs6YTLyNpmLfulQT
 nFWxdkYrH8SZU8AcRZoM86AaPxosuiValXES5vL1ZGcW3dCh6Fi4BCuLqNiWtpCgMr3+Uzt2r22
 Phlyrr58r259LfLhbyZ9qeym2OKdm47S+FTpKKlEK68rS3/9mHOR8GdsY0AtTX3Y0rLb+LXfWtb
 MomTNKAZCecJIvoHWpsKO6lcrok1r1PZo21H11IAheF+wwmQuoVer+ihSNb/2rOutE+Ow3+K+rR
 HoHCt0GkoR97A9lJJVP6yvgQl5GmJ5jMsLZHHBEVl6tuCuNO642t+/h+BMzVGVlHNCEDNiH8aJR
 +8vy+LDJemHgrzw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to isofs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/isofs/export.c | 1 + 1 file changed,
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
X-Headers-End: 1vgRUi-0007to-5U
Subject: [f2fs-dev] [PATCH 24/29] isofs: add EXPORT_OP_STABLE_HANDLES flag
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

Add the EXPORT_OP_STABLE_HANDLES flag to isofs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/isofs/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/isofs/export.c b/fs/isofs/export.c
index 421d247fae52301b778f0589b27fcf48f2372832..7c17eb4e030813d1d22456ccbfb005c6b6934500 100644
--- a/fs/isofs/export.c
+++ b/fs/isofs/export.c
@@ -190,4 +190,5 @@ const struct export_operations isofs_export_ops = {
 	.fh_to_dentry	= isofs_fh_to_dentry,
 	.fh_to_parent	= isofs_fh_to_parent,
 	.get_parent     = isofs_export_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
