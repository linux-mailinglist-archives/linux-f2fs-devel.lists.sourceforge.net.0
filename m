Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C97CD3B0E4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:29:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxOfnnlcqVpjkA7P5AjBSakQXhzEyWjE3vayk7+j80E=; b=LQ0giOuwwirXKl1RAkiTaKim5N
	9BkuNB4xpgBp3FGKpdcXyjfqxoiVQyLBsB5SeVYi0vISKXxNxyPVnVGTA7+yhx4HwIbnzT4PVcSMy
	Ohq/0w1ARxrPacHKOA20G9U3mFscL5Eb+gwQQpYyG1gBFBcOoX8f4qpcHPWa2x5Gdci8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs8G-00039E-UE;
	Mon, 19 Jan 2026 16:29:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs8F-00038d-4m;
 Mon, 19 Jan 2026 16:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dtHwIbxkzeWlILopqDXGMY9lSWkvAf9n+BQlvlf3Gu4=; b=NbXi1txDKKoviK0k1/9UNlpKbF
 Om0RbbzpJw58gsgszsJwZhtgtHPh9SdrUlagoYt/MWPOBljHFpLYm6wgLSMbwsPBXdW4K8YPRhnCS
 AAGQN7we2LB62hwG2RBbwTqR1pMUVI/VSTPcPEQjxetxbA3X/X8V/5aj9j6jPWlWtjIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dtHwIbxkzeWlILopqDXGMY9lSWkvAf9n+BQlvlf3Gu4=; b=Jx6/fvN4rzySdQI6DS/3NV6zo2
 L/4wASju27VMWN/42NmeIaBaHFi8T3039eIYPqCoOBcUtuG3oRB2WEpjWnScatmxq4GeJBHRetlgx
 5ZcSYPcXhDjH0x8/xO5X46WL1QlwOKEBZVmbfn0xyYJLzLlGyZjfsdb04iC17M/EA5DY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs8C-0007xg-Dc; Mon, 19 Jan 2026 16:29:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B9EFC60169;
 Mon, 19 Jan 2026 16:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97545C19423;
 Mon, 19 Jan 2026 16:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840161;
 bh=xYt2MSPBN08jqB6aoLGRn9g7bVaaZnkp3x/mAo4D07M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Onl1ff2yL2rsRhbon2DKTICt3E0fC7f5rf9eTx08Plj/priMZPiOxyC95fr9OlZ1Q
 Tj3bc6+F6jeoOP9lW9Omi57BHdrw9hIQi8iW1rYY2TZujDNAKYQmNHfnJF7TQR4jDL
 XT2TgTAX8bojPDQ4CH/gyDuKnodpDRa7LoecaI7ZGol1EqqN38/2r2PumyMB6E/3IB
 gMmbVJ5th0wfE7wFSrWJe7lDVaMZmMsDz/ijztbFWZezeG1mnnhpSefOWhWvGutvnJ
 8P36f5TeigIVo4DvniWSBYfSlTL5nDQeA0+/f1ooF6OXQ+oRCHpAUeCOKIQg6DXWla
 m3kUCp2qEriXA==
Date: Mon, 19 Jan 2026 11:26:34 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-17-d93368f903bd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=779; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=xYt2MSPBN08jqB6aoLGRn9g7bVaaZnkp3x/mAo4D07M=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltdbZC4i859npPwVQCiLrrovPH3Ntgd1inG/
 8UBjD2xxyKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXQAKCRAADmhBGVaC
 FYjDD/9hgSSTbDWpgx790fD9kUBlypy6yfUjVl/Cwssq2z749eDvf2KH5eMyxgd/6rOZkPqu2+2
 gbdvVNbDvUNY8fz7NspCjYiEDexBIC5tfRA9T62LVeoswQLxGM29wl2ixgPWMPBftcv7lAnPkjT
 S/jzjLHFQyKYcXtCf9pni1rK0jCr3OyBHk3e1lVuA6LafCIrvu6F9+tcmuWu49cVETld5ujnAfQ
 csp0C5d/6qNeeBHIcn/WZrpHMRm9O0eNuS5umBPhLGYss0OC/KOBEcRdZvSuR2kP/ArcVAuAFwJ
 2N5Otod+F4FKciuxVxlhVxmTUtY6RnEThZ3KAP9eUK7KirA4BUgoX4CEFxcARIfClDzwmm53bIW
 EdRuC2b1qkPYYuAWU5Xuu1N3uE8cGu8ytttjPbvB9nR/BBaATi2uwYx179nwZfoBchKvdZ5fGGu
 WC4LLqz6rN2YcqXs4zBkOZJwWzlmTxbob7Ao6GLHKN71Pc7fAWGuHtPXhlCz3lHkPw+aL3hZi/O
 fFRjI7ZBPIzSqYhm8g3W29oI5wMFvKvJjZ/3C16X/0UB/OpbmSgTYhYdc324ukf4fmF8BbqJsyL
 L0Sm7ILgw6KpAnenWxla09O1q8wWMSxHIge9mCAibjD2XvZiStJTbi1YtH8cmAIMhaZwCbrFLwN
 VOQon6cUTc3pFfQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add the EXPORT_OP_STABLE_HANDLES flag to overlayfs export
 operations to indicate that this filesystem can be exported via NFS.
 Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/overlayfs/export.c | 1 + 1 file
 changed, 1 insertion(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhs8C-0007xg-Dc
Subject: [f2fs-dev] [PATCH v2 17/31] ovl: add EXPORT_OP_STABLE_HANDLES flag
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

Add the EXPORT_OP_STABLE_HANDLES flag to overlayfs export operations to
indicate that this filesystem can be exported via NFS.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/overlayfs/export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
index 83f80fdb156749e65a4ea0ab708cbff338dacdad..18c6aee9dd23bb450dadbe8eef9360ea268241ff 100644
--- a/fs/overlayfs/export.c
+++ b/fs/overlayfs/export.c
@@ -865,6 +865,7 @@ const struct export_operations ovl_export_operations = {
 	.fh_to_parent	= ovl_fh_to_parent,
 	.get_name	= ovl_get_name,
 	.get_parent	= ovl_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 /* encode_fh() encodes non-decodable file handles with nfs_export=off */

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
