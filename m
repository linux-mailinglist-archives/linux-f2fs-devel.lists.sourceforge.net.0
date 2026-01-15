Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E78FAD26BD8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 18:48:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlSSg0PMSUtbyKdZU5dm3DVPk6KUeyVZ52EejPTmszY=; b=B7fk2iDV/w0XhkEgPK2smc1XlP
	c7A+bKzqu4+jpdt6Abqjfe89BTConmghDhz6XAG7jgIgJCGY16EGtA4zfHUJI65s/giMH1E2Syqq6
	pORAjnuy1hdIl7wIjm+kltFMDytSfN4qPNjO2c/XW5LITE8WSOYSl2TM/3cgLWK8WXqY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgRSJ-0001Cs-6l;
	Thu, 15 Jan 2026 17:48:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vgRSH-0001CX-9C;
 Thu, 15 Jan 2026 17:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hoRx4iqvApY4n68S8X82ro128OMPf7po0KQOiKAg9pA=; b=iDxajWowDi4U1Yju44JM189is/
 p+VXE8kZqgfsPE0eWxyJskfLWiFAnWCYUGTnnyHwLXNizXERHKOkxGHtsQWYRg3dfUKUiuKYM0Wnh
 wKXDc67hSs2ftXFb/v3ZOCu9iU8ZZBOZSX9VO/xvPkP5x9WxS5hsEGJkOoq46fhAdEe4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hoRx4iqvApY4n68S8X82ro128OMPf7po0KQOiKAg9pA=; b=Q1oOVVFlrUVj7Us5Sdb5l6QoA6
 gZ4mlaIA9H8KZgebbECY1Ha82mauMokrZpmhVW3b6dCl2rmcLW9qEotJvNLFUVsmQefN+WpchPhxe
 MAE4ajHOmEWbNVc67gQMxXnzdqkDdXwVSHSnRVBpHqps/hQjekNAC0IG9ErKxWs8BG5s=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgRSG-0007ct-TC; Thu, 15 Jan 2026 17:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 88A2B433FC;
 Thu, 15 Jan 2026 17:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B80C2BC87;
 Thu, 15 Jan 2026 17:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768499295;
 bh=eGzcrbK82AAYHA8mp9BK4OkYs2dNeYeCsyAFHAtDQCg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=N/aT5jS7N6QoemTXHYE0cX8UVkbOu2/wbixgEVBgnGYF7LhX8OhNz4XrWyrjWRC7M
 zD29UA1bZK9fVBcd+hA6xYgcgJEJ2sOcHLu62k3G02+2GGzKX/VLC9noXIbXKuuT5K
 Nr+33LfHhpTNa+foKCiyUmvvq00e+Du8qeu6aHkC+zm9MykELBvSIJbtqfNnq/OaOK
 SF+mPjA+LVjF+9H+bIal6zl1BUwjpoAojxDJr4szcfYTYT5pi3BOBaWc53Pi/XWVcL
 UUg6FGToVwTQewnPmGxKUIYtkaiiQBopAjTCdSXAr5q8BAP1a33Gv7jD+4BPFrdlhn
 7fI1YzYPg+SYQ==
Date: Thu, 15 Jan 2026 12:47:33 -0500
MIME-Version: 1.0
Message-Id: <20260115-exportfs-nfsd-v1-2-8e80160e3c0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=687; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=eGzcrbK82AAYHA8mp9BK4OkYs2dNeYeCsyAFHAtDQCg=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpaShEbLwccGXUC5j0WTeZML8RysoPsUjSds8pC
 JZi3m3aO2KJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaWkoRAAKCRAADmhBGVaC
 FVG3EACMORg6FWU2k+gTVXQsRhFWMoWdpO7xBjnubHZheO/O5JyWKYWNPX4sbXBvJB6B7Jk1/b1
 MaY4i/BdFxaDMt69GQfQWSs/ZjgMLW4LaHiT35v+0ApKcyuUcyUpGbePY8Q45RmV6DfOh9whS9I
 t8sVCOKSYWlli98pTJRslgDUbjULTXyaFW3R08JP3i5prQEUPNI85rq3Ia39b/3nRxCeLKaHexo
 Wh8mjzMVA3ncr3QS3JDW8EiM4mJqdcnsG7C0p0NsRXX9Bj1POl4qDX4/A7s0z02kDavF/u2IJaJ
 vzU3qxp6MoJLJtZOYAMJEzw6d2NIMsfFQi8pwo/iMRDwkqxsFpwRvT7h8npYMpXyQRou5PI4d0k
 WHlJK66KpzRjMnk6kiLnVvwtZuUQrYq4oVkkaWTcUB+fY19qVtW1hVVw7scwCIR3paw5NG2hfJd
 yGUZ66kVaTV4kRZIMqbz4YnHGfIFhEP3jeaF0kbPpJ5OOuVTBVgLJoD+69v4diy5ByzJk/ujYyj
 EnGCShycUwb0IGd7r5f1TDdSScJ49Fh85Zg86XLyxoT3TDIvfZG2VWm5VKRN81ifgwd84hYqGHs
 dMhx7JclW4kuJSjtBkrqYaWP3J4TCUaDo3fstC9n+P/mEEHHzveE3Gf/t3MD3vm9L8CDEYfw0rc
 Din5n2xsqXt5kxw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to tmpfs export
 operations
 to indicate that this filesystem can be exported via NFS. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- mm/shmem.c | 1 + 1 file changed,
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
X-Headers-End: 1vgRSG-0007ct-TC
Subject: [f2fs-dev] [PATCH 02/29] tmpfs: add EXPORT_OP_STABLE_HANDLES flag
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

Add the EXPORT_OP_STABLE_HANDLES flag to tmpfs export operations to indicate
that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 mm/shmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index ec6c01378e9d2bd47db9d7506e4d6a565e092185..c64c4410b4fd9961599a5ea768b469d8184e713e 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -4477,6 +4477,7 @@ static const struct export_operations shmem_export_ops = {
 	.get_parent     = shmem_get_parent,
 	.encode_fh      = shmem_encode_fh,
 	.fh_to_dentry	= shmem_fh_to_dentry,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 enum shmem_param {

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
