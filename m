Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C927752D62
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Jul 2023 01:01:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qK5JY-0005cw-NX;
	Thu, 13 Jul 2023 23:01:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qK5JX-0005cq-4c
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jul 2023 23:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0DDHRiPYhr0sd9J4288j38yiPCPs8WpS9B9X3tWRhbs=; b=MPEGmuAhShnVZscYc/1YyyeXPR
 QIc1YwP4l5uaVbDZAW5nUboVdosIsZhxBwxYmH5/Uj+jy2S9HiS80ODSmvFR1+sDBKZNrXw+PSR5p
 5OuicpaP8ei4aGvlzg1yQBvJn8K5z4McZKuPgiXXGXryxnTjN3rJBUbqtdhPZ7WHs9J4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0DDHRiPYhr0sd9J4288j38yiPCPs8WpS9B9X3tWRhbs=; b=mDLeJvgpSOlfGQRLDrZ5uZ5qcu
 tWy/0xfs5UEQrakEtdzG+R3RKGE7eyYkD42TAi2JtTY6+cGHGV7tUEnYTWTyYlaLgjKieHF7l02vf
 1lF4GE91dDS7tCM2RWC2JcKxWsAh7I4s/wn+qVOBdNLPpUmvk78Q5MES+kTTb7UcYt2w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qK5JY-0006ES-CZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jul 2023 23:01:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B3CDD61B23;
 Thu, 13 Jul 2023 23:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285D7C433B7;
 Thu, 13 Jul 2023 23:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689289288;
 bh=2uDpIMGQVMt/gC4T/BxJPAgKQID6PeU0gqKfksNKWnI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=liyRtyj08RhKgd05d/GbjIK8eAKSM10LdUJBz7UuFOcUyezObweCSPR4L5Jm7d/3+
 J9oIvEYe6CWGwt55Hx9zbqLwPbb7BBKC8OMsAe7qX+kkwyjZAQBfJ+ADRMrXxSSmW8
 Xzwhwg78up7SO0XMuFLZ6g+/2Pu108+rBwN7yk/z/7oyzpziWvzwOA3XIxMpCer4y9
 lDdui9+QJ0qeG2V6Gtk4RHRd2VjBrRFJoqgHMQsHg6pmArcdKXD18EFN0CSdElLHCP
 iu0JCzqZtl2wBu87Ybj2JDoeOy/UseVuaxAORwjKb983nHW0GT8ewtb0Icu2w+Gl8j
 yMGVOCivsa/7g==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 13 Jul 2023 19:00:52 -0400
MIME-Version: 1.0
Message-Id: <20230713-mgctime-v5-3-9eb795d2ae37@kernel.org>
References: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
In-Reply-To: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
To: Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, 
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <lsahlber@redhat.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=2uDpIMGQVMt/gC4T/BxJPAgKQID6PeU0gqKfksNKWnI=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBksIIusbBzLs0MybgDecBYC1rFLHPwWpvQ+zecR
 awgGePAm6qJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZLCCLgAKCRAADmhBGVaC
 FcSGEACub8Fc5S/WfyUSGxfmCSi3555ycDn+zVKXSPPiQKW1TR9LYRkybKANZmP0XYzYILSUfkU
 ORbNjYimhQNCSxlPeeC40MyHzjga0VRHqurUT8qqaVIVJ0nl+StBd40KLXAljpP3WXM1fGUAjvH
 vqO6pP6I3K3R/4qwCRMhWrNAcqt+qYKWVUUztTablCUbuklzQoblG24U2NK2DUfGepPumyDoeLH
 wYod7Y1kJ92qyEoEOPNjj1+tfqjWvN7+tAsFQwpD+N0sljCCXcg2XWKOgVJBsYaXx5OEbRfi6s3
 ryBXi9Xk0/jA6otq2rUp6HaQyJkl6teNxs+4rz75eCu8rN02oQaqFzL83u3vBt3uPmVA1pHdS8E
 cYZhQx3P7nvLTFlUjA0Rbi4sH0FtHNJd3k1Gzcl8UkDcxVz29S7geHX+Nfj1BSUqKI8uA6NsJuI
 nzON+pBrEdS0RRFHXzAKsdPlG285eEeNPzqWMmCPQ8I0XVLSP4vbJ+WFJhx6uO+c2gz3VEz5rKg
 46OipSdHjwUcz6Ps1TPvZpf/Z2bvpL5yiA+tPHgQX1nrRyMepOjxjN4vJX/dTEcENn7ySGN2vWY
 /RoI7eVxl9z18K25MgUs7+5WZGKkUPepl/96nVkOPQyWbt7euX8Tx6c+OgzD7T9pvDRi9idRO+a
 oNvcYRCw+z4sY9A==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Most filesystems that use the pagecache will update the mtime,
 ctime, and change attribute when a page becomes writeable. Add a page_mkwrite
 operation for tmpfs and just use it to bump the mtime, ctim [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qK5JY-0006ES-CZ
Subject: [f2fs-dev] [PATCH v5 3/8] tmpfs: bump the mtime/ctime/iversion when
 page becomes writeable
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
Cc: Jeff Layton <jlayton@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Most filesystems that use the pagecache will update the mtime, ctime,
and change attribute when a page becomes writeable. Add a page_mkwrite
operation for tmpfs and just use it to bump the mtime, ctime and change
attribute.

This fixes xfstest generic/080 on tmpfs.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 mm/shmem.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index b154af49d2df..654d9a585820 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2169,6 +2169,16 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+static vm_fault_t shmem_page_mkwrite(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct inode *inode = file_inode(vma->vm_file);
+
+	file_update_time(vma->vm_file);
+	inode_inc_iversion(inode);
+	return 0;
+}
+
 unsigned long shmem_get_unmapped_area(struct file *file,
 				      unsigned long uaddr, unsigned long len,
 				      unsigned long pgoff, unsigned long flags)
@@ -4210,6 +4220,7 @@ static const struct super_operations shmem_ops = {
 
 static const struct vm_operations_struct shmem_vm_ops = {
 	.fault		= shmem_fault,
+	.page_mkwrite	= shmem_page_mkwrite,
 	.map_pages	= filemap_map_pages,
 #ifdef CONFIG_NUMA
 	.set_policy     = shmem_set_policy,
@@ -4219,6 +4230,7 @@ static const struct vm_operations_struct shmem_vm_ops = {
 
 static const struct vm_operations_struct shmem_anon_vm_ops = {
 	.fault		= shmem_fault,
+	.page_mkwrite	= shmem_page_mkwrite,
 	.map_pages	= filemap_map_pages,
 #ifdef CONFIG_NUMA
 	.set_policy     = shmem_set_policy,

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
