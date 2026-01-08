Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91982D04D9C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:16:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXt8H8L0cFXJFH3jWdxY/yb+tDXSE8F2DFVUKTI7xxs=; b=jsf/BgGHaMAqv1zgBS3cZI9vjZ
	LsObkcvgHPL3SJMqs76w6WLj0/EgYYHY/8jU9leu+ZBgqtNr4QJcintmoLSPDuNSvUuJ6KmD5zlRH
	p8NYGjNYPdaiLhtYwojUKm21n1D0LdEqWkjW7VSD9Xy7zDoXbAWFLimSCL/1FP/PBaDA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtd1-0003hz-Gc;
	Thu, 08 Jan 2026 17:16:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdtcz-0003hC-OU;
 Thu, 08 Jan 2026 17:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PwAoht7a3jGi/5dXz5pEQXMhfplROvUnQsiXMkqy754=; b=nDCz6VIC3Nl0o2f/OyhUFP6Kj7
 cflLsNH7d7PaD1pL+7SVibs+cVF9+EALrYkxRehtkUe2Umdb3mdrpWXk4ag2Y15LKZtUrfkGqZXib
 o4S/e10f95nFfGTcQAbdlVpTJB9ZYx4z44sHMjdWEWtpvnJgLXpltTarUtuA8JT9r00o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PwAoht7a3jGi/5dXz5pEQXMhfplROvUnQsiXMkqy754=; b=GxqmmNtp0yKM9mkgLGYGKwZd5b
 yvjrRA6ZB31xuoysqbfa2s2XMqCVfkOthCZxeEbwco74EZHGU0pvCvp2aM+DGtJSh5ozjx4ZLxunD
 9DNMrr86FYig+FwJYJ68BgBzoW5A6leAjWPbq+JuRKF+2cs2dlFhog4nfzAAnYPAU3qo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdtcu-0006FE-EZ; Thu, 08 Jan 2026 17:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B851B60152;
 Thu,  8 Jan 2026 17:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F2FC2BCB3;
 Thu,  8 Jan 2026 17:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892597;
 bh=NID4NaaK8cNH28A8Rn+v2PbCj8aVd6A2vQHcYBl6XEc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=XTcrMvWGmKFvGwAYstJ6dpq7B/a12oideedJX/ThejFncpxpueWE1/8kcHPOQeVZk
 QFWvIwhXvIK0f0/19xSsSvLDZxcpHacHvMrpL8K57jbA0ztziFoJOozdl4ej7Srsqk
 IJ0ieRHWcycFHrOQpwYkkWmJEgEeCbWiiqP+kKLCTvF0rMcz4DTKBtnopfo9o+a7A/
 ALxsVks9p4nDFy19KiMt5fsLyvATj5/h0UOqcjT4fVOW8uedPPmXkZ+k9zyu3Gb0t2
 f/xnx08CLyXtuwL34A2sbbQNfdmTKLQZ5rLqii0Ytq9MzeBjv1sgSo9/YY+39BK1uA
 i2jzGPW/BI2AQ==
Date: Thu, 08 Jan 2026 12:13:18 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-23-ea4dec9b67fa@kernel.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
In-Reply-To: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
To: Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, Nicolas Pitre <nico@fluxnic.net>, 
 Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>, 
 Anders Larsen <al@alarsen.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.com>, 
 Chris Mason <clm@fb.com>, Gao Xiang <xiang@kernel.org>, 
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
 Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
 Chunhai Guo <guochunhai@vivo.com>, Jan Kara <jack@suse.com>, 
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
 Dave Kleikamp <shaggy@kernel.org>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Carlos Maiolino <cem@kernel.org>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <chuck.lever@oracle.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Bharath SM <bharathsm@microsoft.com>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2888; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=NID4NaaK8cNH28A8Rn+v2PbCj8aVd6A2vQHcYBl6XEc=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W+cLBRWxzgtw9xiO4SbRJTFDfCZwbur8vgI
 DrUAdciXvKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/lvgAKCRAADmhBGVaC
 FWxwD/49jq0dpl0tpEt+oaAFd4j0e/fid44vjg5imuwIhXHfcwsVVI4fUx/pz3UE94Qammox6zt
 upvbtem5sWsRhamPvtqVWrJjw3WEV+gTo/v2UllfbGPmh6jphW2/TcVyvTFMYjQZBfVyWLbN3jA
 3EVALc5vqNlMGchvznz54yLVU2RChzyx1XvCDhHwRAeNSAOGO8/1o9yXbGLyvPjSBJHE/68d6ki
 r/PIpu9JbeJugyz6HygQj/YOpchUfZ6FXD6KzyRcth9Fr3t5To8fhQTanvnQzTpe38PVFpxwy8D
 xwiuSY/o3EnGvPHb5b7HRRKCgKbOlvFEDfJWwiUCM6pZumnUrF7XAH3v52LionbfPxfLmcvOU6L
 gpLLdRy2M3uTOACsZavhy0S9lVZnTo4goZFr4ev0RRvmsjX+YTeV2ow/h8Vg4LKuFXUFR+5H3rG
 W30w4jQ5zSEZduWe5iGwnzyrIHJUB1ZloMPctMrzuCHbdMt2PszPfjsvqBlm7yLyj+EsqcH+7eN
 ipQkLEkHcqrbFNjwLbqEKEjK64Kjp9khIJv4PaXVv685x1D7zSSXqqq2QocKVPLs6RoSmQPkUDF
 N3wB/LHoG5Est1DU0o3AQeWJkEbKY5rRS9DAPXxFfP4CE7C7/5Ho4WFA555yX3b5D55WwWYyXRr
 /Y+/b/w6+wP/HzQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Now that most filesystems where we expect to need lease
 support
 have their ->setlease() operations explicitly set, change kernel_setlease()
 to return -EINVAL when the setlease is a NULL pointer. Also update the
 Documentation/ with info about this change. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdtcu-0006FE-EZ
Subject: [f2fs-dev] [PATCH 23/24] filelock: default to returning -EINVAL
 when ->setlease operation is NULL
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
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now that most filesystems where we expect to need lease support have
their ->setlease() operations explicitly set, change kernel_setlease()
to return -EINVAL when the setlease is a NULL pointer.

Also update the Documentation/ with info about this change.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 Documentation/filesystems/porting.rst | 9 +++++++++
 Documentation/filesystems/vfs.rst     | 9 ++++++---
 fs/locks.c                            | 3 +--
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
index 3397937ed838e5e7dfacc6379a9d71481cc30914..c0f7103628ab5ed70d142a5c7f6d95ca4734c741 100644
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@ -1334,3 +1334,12 @@ end_creating() and the parent will be unlocked precisely when necessary.
 
 kill_litter_super() is gone; convert to DCACHE_PERSISTENT use (as all
 in-tree filesystems have done).
+
+---
+
+**mandatory**
+
+The ->setlease() file_operation must now be explicitly set in order to provide
+support for leases. When set to NULL, the kernel will now return -EINVAL to
+attempts to set a lease. Filesystems that wish to use the kernel-internal lease
+implementation should set it to generic_setlease().
diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index 670ba66b60e4964927164a57e68adc0edfc681ee..21dc8921dd9ebedeafc4c108de7327f172138b6e 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -1180,9 +1180,12 @@ otherwise noted.
 	method is used by the splice(2) system call
 
 ``setlease``
-	called by the VFS to set or release a file lock lease.  setlease
-	implementations should call generic_setlease to record or remove
-	the lease in the inode after setting it.
+	called by the VFS to set or release a file lock lease.  Local
+	filesystems that wish to use the kernel-internal lease implementation
+	should set this to generic_setlease(). Other setlease implementations
+	should call generic_setlease() to record or remove the lease in the inode
+	after setting it. When set to NULL, attempts to set or remove a lease will
+	return -EINVAL.
 
 ``fallocate``
 	called by the VFS to preallocate blocks or punch a hole.
diff --git a/fs/locks.c b/fs/locks.c
index e2036aa4bd3734be415296f9157d8f17166878aa..ea38a18f373c2202ba79e8e37125f8d32a0e2d42 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -2016,8 +2016,7 @@ kernel_setlease(struct file *filp, int arg, struct file_lease **lease, void **pr
 		setlease_notifier(arg, *lease);
 	if (filp->f_op->setlease)
 		return filp->f_op->setlease(filp, arg, lease, priv);
-	else
-		return generic_setlease(filp, arg, lease, priv);
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(kernel_setlease);
 

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
