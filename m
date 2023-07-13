Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2FC752D64
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Jul 2023 01:01:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qK5Jk-0006mq-Mh;
	Thu, 13 Jul 2023 23:01:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qK5Jj-0006mf-G9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jul 2023 23:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xvtDyXZiv47HaH52LmRi9yHPxJlG9e6XVtw2iD8b/FA=; b=S9dKuozjfiEXLTwFbjhhNrfDxe
 s1V4EL0vRKRoBu2RQ9tqLHMRYZ96u5yjz54oN5yRQualIW+9ZPRlg3xbE11j1C7dooVZCDc6UVA2i
 MdFyKJk/nuGq3E3UPZRuEyzoq5bv5lwiMgXBVXzFHFOkyBbZVoRt8U+g7rCD8bEo2NAE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xvtDyXZiv47HaH52LmRi9yHPxJlG9e6XVtw2iD8b/FA=; b=YAjqQZdVkV12/oTuE2tzIbLla6
 zkzVU9w2pqdakgXMnXIkuUr39c8EutoHQpbbQy5/qLaN9DeQA/x1dHgaRTj5Fr7UTWfYKMP25jxUs
 6PQOYtf/fdeIWO/TaLKJIx2YBTfO/WmBNh0kkyDuIP9me7dpsSEYOP0s4LXyFPszoHro=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qK5Ji-006wG2-Ns for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jul 2023 23:01:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F3BF61BA6;
 Thu, 13 Jul 2023 23:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1B3C611A0;
 Thu, 13 Jul 2023 23:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689289300;
 bh=aa5qbguHFcu6OOlBUAepw2+xHt44QiNWyfL22OUBSqs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BikyFRuCdOODbIqFMPk9kNKNlEo0dYJ6zt4FyqFTbTjpdmiUktdW71dJkcCNhfnr6
 IH8wNPwLcwjFwqbPM9ABFfIZZoaAAjZWuXcaDgVP/9O9ow8exs0ur2EO1mxw06CUVs
 OIVi6P2uBcHxFX31zL/bkUGRt7Vk6GxZq50OE6iR5Xkgc+XbbqUbUANDiMMWaLTCgU
 9YSpAieiO+VbSduJMVGrLCDzqj6M76cg/ERleiQQWLvjl1lRNaDYvlOMtASHc3hRxY
 3zxwROtQCWYj4ZhKhLitrJ1WKe8G5IuDdn4pkmXKWnP8iuqxCuy46i0Jj0SbW9jVX2
 AHP5DZp2LCIgA==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 13 Jul 2023 19:00:54 -0400
MIME-Version: 1.0
Message-Id: <20230713-mgctime-v5-5-9eb795d2ae37@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=aa5qbguHFcu6OOlBUAepw2+xHt44QiNWyfL22OUBSqs=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBksIIuYLDaeyv+0bFKxMDi4TCGl7qNqh97QkbqR
 7MnTf0XpqqJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZLCCLgAKCRAADmhBGVaC
 FdKeD/90gpS8fulOOgQezr1N2uNArvD5brmGxA6b7tTzZSvcpOejwinrQKvQhs+PxBZDriYQCQh
 OwxNuTnA93R76ZkHT+sLOHGoGBQ6UBAtkzGtxH9v1fgcuhwappw6969ZTeRpLIIWBZ0MFdVDXTe
 YFcM04RAjErJxaPi7Kt5ULpq1V7YIjHa0dovLbQ7frkm24o+WlVOqKpXRct7ZQqa2k6bkGFkhed
 NZPwy8zsD4D/ZthBftUASAETJsO1x4cs1v02gmv4U6YR4J39mE20H8TT+918pwwZU/VSIOj1M8H
 Oirc7oG/xtEnVFeE6nGc9DoXtvpO3IUf1FdW5mKKcKqLzZoKXfj3gk1gLXOX0mdQ2JHPZcGc49+
 LHI8cuBfrkN/yVk5aVMC/t0fyaM1xcR+wuz2sQL3b3ax5gG8hx3oSg5INanDl7BDUq7lbtQYpHC
 44+w5XUDYxIFpjAozvDGpAzbAsZNp/fmKeaNAFZ0DPSY2csmopw1l3HzeL2s29LE29J+DbWrN4Q
 dQtkbmyLS83Mo3Rus7OEOTowcfLEdmVZ4nlYwkUBpsAbUeo3Gpzvy+DYU8t8ma/Kb96NS7sEx81
 5WULDzoq4LwO4MreHRa/DvZr0oyyhT5qcmZWNWLeSdaA0x6eEh2hzaWN9VBX+UNVXANgJRn57fJ
 LrcnCGwsCj+PM0g==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Nothing ever sets this flag,
 which makes sense since the create
 time is set at inode instantiation and is never changed. Remove it and the
 handling of it in xfs_trans_ichgtime. Signed-off-by: Jeff Layton
 <jlayton@kernel.org>
 --- fs/xfs/libxfs/xfs_shared.h | 2 -- fs/xfs/libxfs/xfs_trans_inode.c | 2
 -- 2 files changed, 4 deletions(-) 
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
X-Headers-End: 1qK5Ji-006wG2-Ns
Subject: [f2fs-dev] [PATCH v5 5/8] xfs: XFS_ICHGTIME_CREATE is unused
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

Nothing ever sets this flag, which makes sense since the create time is
set at inode instantiation and is never changed. Remove it and the
handling of it in xfs_trans_ichgtime.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/xfs/libxfs/xfs_shared.h      | 2 --
 fs/xfs/libxfs/xfs_trans_inode.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_shared.h b/fs/xfs/libxfs/xfs_shared.h
index c4381388c0c1..8989fff21723 100644
--- a/fs/xfs/libxfs/xfs_shared.h
+++ b/fs/xfs/libxfs/xfs_shared.h
@@ -126,8 +126,6 @@ void	xfs_log_get_max_trans_res(struct xfs_mount *mp,
  */
 #define	XFS_ICHGTIME_MOD	0x1	/* data fork modification timestamp */
 #define	XFS_ICHGTIME_CHG	0x2	/* inode field change timestamp */
-#define	XFS_ICHGTIME_CREATE	0x4	/* inode create timestamp */
-
 
 /*
  * Symlink decoding/encoding functions
diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
index 6b2296ff248a..0c9df8df6d4a 100644
--- a/fs/xfs/libxfs/xfs_trans_inode.c
+++ b/fs/xfs/libxfs/xfs_trans_inode.c
@@ -68,8 +68,6 @@ xfs_trans_ichgtime(
 		inode->i_mtime = tv;
 	if (flags & XFS_ICHGTIME_CHG)
 		inode_set_ctime_to_ts(inode, tv);
-	if (flags & XFS_ICHGTIME_CREATE)
-		ip->i_crtime = tv;
 }
 
 /*

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
