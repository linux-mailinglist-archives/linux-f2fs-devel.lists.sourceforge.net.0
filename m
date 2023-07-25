Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD848761C95
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jul 2023 16:59:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOJVj-0004jq-Js;
	Tue, 25 Jul 2023 14:59:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qOJVh-0004jg-86
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jul 2023 14:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X0oljiepnSz5gM+zvheytrmp9iA1L6amij6hJTcG588=; b=ksXEy927QADjevpo83eJb7y5IQ
 xNp7RsrOltGN6RU5Tl44qtelsNDr7h+szdHiLIonG8l3EZM5eys6CN5lOV5wYCZM8y6bpQarmpfxG
 SWF0mS/iD5ZVivH7+UyRg1lfvoyfXYwtwpGfD9cZpnu+kwyL1U3oJ5hJM4lxWL69Q+GU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X0oljiepnSz5gM+zvheytrmp9iA1L6amij6hJTcG588=; b=WYoxx1mBhtsIqCaS0CwzVtS1Cs
 6hDv/Nlffpq6CHwARhL2gvym3JFYPkx7nrbFN+dcBvFWcbTt17CzkHM0LDxRenBvmQctXqJR3lfgY
 tfpk09DAptGKGBn1oB4dOVdI0IrTiRHQgGS7mJTTQXXxpZHRDQrmffEL7bjqL2Rh3MRM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qOJVg-0007Ci-HW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jul 2023 14:59:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0026561789;
 Tue, 25 Jul 2023 14:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A85C433C8;
 Tue, 25 Jul 2023 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690297170;
 bh=kIvw1OVi/OYz+atwIBCynX0q88XJ1zU1WapHn2pYQP4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=G4lNe8OgwdzIy+DkoO8bA4V3fq2HfOynEvqBH0FZcXI5mjKRSEQ1SVjY1pHApZqUk
 LmVSxl1WUBGP7yGLH/ATsMnAnQMEPU+QAPGj8qdwUCRyUhAcUv0FTDqFlH73mrgqZw
 FzXbD+KfSe8VN284suFEL1YtHLX5tEg7JJkEkQGz0MGrxMX8CR2SkfzChxuDfyTNeS
 ZXRDShsOopX0jA288qfXuKjqRRyiZ1CyY3mdX/g1AczrOzezsb6EzZ2F8AGwPXdDYp
 PORRSahQS9CPN8wTXE5yLGawxDIeRTErDdxD6OfHFhzLgjKl8kPDh2mkBPRjnVLKHw
 ehvrosoKitaHg==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 25 Jul 2023 10:58:19 -0400
MIME-Version: 1.0
Message-Id: <20230725-mgctime-v6-6-a794c2b7abca@kernel.org>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
In-Reply-To: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=kIvw1OVi/OYz+atwIBCynX0q88XJ1zU1WapHn2pYQP4=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBkv+MkANALyeokJ5uPYYXrLhMbqAMD2+dQLEEeI
 3QOMYBSSseJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZL/jJAAKCRAADmhBGVaC
 FecsEADEGQ4YyezueKIIr3iE+LoOFLQ0lVcEMPslgKBrcsoHAYDw4xIHTfiRLmJTS/QKl6qdQ/d
 FSIkPrBSo4busWekGlohEMVxhED8IPediFhHYC1BJu3i2vSmxv2wo9z3DGJxddYsn1yasB7Jh8X
 V82bCE/S8+YwWBe/sU9UHYXIA/E18x/9Ut0FSPmZUwXbasPrZoaYGahxEDFFvONFPxKYVH6MIwn
 K4eVmycva/cc9eg3aJ9IoKpjm2lHJ6SlHwQREAxcyQZ+Tz4LAI9NG4I0N4mft7VwVj05wY4iuMV
 lkaoxH/4D3tYZmIldIJ9HahAnA+IlU9dZ/4YPR7iaTlZNdGssfn5cvsTHNjvp00H6KNNnr3nKEg
 JOy94wl7Ir1GrUPEDT1u+XQipTMQxiFjTQLc+igYmNNY+nLJu1edF6ewi3eMTP81b6gmzOHenud
 CQ3qmNNoiiQu5pItfIvt0j+K74oTiUZzOqrMqtEgUQ3flSJL2acI1UnY4m1h0JIEygBAMmXN/Ga
 6TPHXNSLdiIKa44+muGKEdIXTv22lvk6eI3L4mwE12/sKh5INo3rOJmQKNhtubYrUtLDSvrLCQa
 a/tcAz4eG/zd6PdcWTx1yg8GKnXbxqwHniAFlSBVM+ziSpqGTe2fxM3iHanHqv1hysy6sBXln6X
 HdxNyY7YiReYS0Q==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Enable multigrain timestamps, which should ensure that there
 is an apparent change to the timestamp whenever it has been written after
 being actively observed via getattr. For ext4, we only need to enable the
 FS_MGTIME flag. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qOJVg-0007Ci-HW
Subject: [f2fs-dev] [PATCH v6 6/7] ext4: switch to multigrain timestamps
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
 devel@lists.orangefs.org, Anthony Iliopoulos <ailiop@suse.com>,
 ecryptfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Enable multigrain timestamps, which should ensure that there is an
apparent change to the timestamp whenever it has been written after
being actively observed via getattr.

For ext4, we only need to enable the FS_MGTIME flag.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ext4/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index b54c70e1a74e..cb1ff47af156 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -7279,7 +7279,7 @@ static struct file_system_type ext4_fs_type = {
 	.init_fs_context	= ext4_init_fs_context,
 	.parameters		= ext4_param_specs,
 	.kill_sb		= kill_block_super,
-	.fs_flags		= FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
+	.fs_flags		= FS_REQUIRES_DEV | FS_ALLOW_IDMAP | FS_MGTIME,
 };
 MODULE_ALIAS_FS("ext4");
 

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
