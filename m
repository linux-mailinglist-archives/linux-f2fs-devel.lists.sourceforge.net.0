Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC406772F0A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 21:39:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qT64A-0008E5-Qy;
	Mon, 07 Aug 2023 19:38:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qT64A-0008Dz-4p
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O9uIhw9JsjOpRplYAoIl9zBQJ2XB0Llciuju3BI3ZX4=; b=lrOHM8xCC8WH59SrgwHS9TwrtO
 tsLjNNI/8rOIue439IHShq/eChGCBpBqvbfjOWPPL3OuDN98xVJd4KXI7q394B9kK3UfQje8I1exQ
 xrsboz9Zx1oNowG8I1zRUK+shesiabtHX7IrJmMiew/9e2vHPeh3gGcBJuGaFsKnFBjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O9uIhw9JsjOpRplYAoIl9zBQJ2XB0Llciuju3BI3ZX4=; b=iijhvjUAC4S0fCErPnYiKbW2zd
 S/XgmrHBwKbirT1oZ0WVFYFiH/bBLAnloKZPs1JMoMcF8Cp8NANTlEWsGwGaK/zCG6kHSu0aUAxUr
 5Punm5UN9MxRI2bEheAte/v1tN8RDD2AS2Ts0VrD91k4xxyCW2IG9KbMiRZjcKXlp1/0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qT64A-00GNS7-Gl for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:38:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0DE4621CB;
 Mon,  7 Aug 2023 19:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC784C0760F;
 Mon,  7 Aug 2023 19:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691437132;
 bh=SoSg4hRs/3AF7gmmZ5KQieVLFGATpnVC2zTweWQTdLU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=KxIu3/cu0khoRWfNJXEJNIHdkniXf13AfUwiYzwbEfIu8g3DBtfZfzYS9IOYy9Gpk
 Bj3cYzwEKlh8g81NTtaccKy7aMqTEYuSZfyn9SEoQUp7kUA4ckYCfHueh6Qfif9NgK
 slFb5wQGYXGFb4CWnSXlLxHUkaQKI2w9y4EhGJbBrVFp5aU9fk7DAWfQl7jLSAfqD1
 UccpkoMfyyMBq4af30lIQ5AB/cwMdmHd6Z3n40C38snUYNYnW8fp27SzSPjzVX5Rmr
 sneuDS6BTX/Zciu9zoJxNLu+PbQqNw9x3B9TP5CDuF4m+Ww8wcMCuyC78gSMsgXucT
 7N0lCiWdDCoMA==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:32 -0400
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-1-d1dec143a704@kernel.org>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
In-Reply-To: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
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
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Amir Goldstein <amir73il@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>, 
 Benjamin Coddington <bcodding@redhat.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=648; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=SoSg4hRs/3AF7gmmZ5KQieVLFGATpnVC2zTweWQTdLU=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug9m1G2XKd9FuFQHFpf/xUPtkdl5tYH/twvk
 pTBUT8ItSeJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPQAKCRAADmhBGVaC
 FQz2D/0VAN0+ej/IEUpgqVfQAjQ8iolTJV7E0suDKXij0ebakC68W10jwrlT0yi9VzJjG+zWKlu
 TPi0thiI9CyD/g4niQelv35XmBxU8+fVi3c6QBE+uHc2Ye0nZvMEETJoMoCQ9vWHE0o4DGUU2J0
 26j+6oaILlvI1X0SUof0ithfuve3VLXGJWbNFJiF0l7dGjWrFCmDi1p7+bpTkunQiHaOyb8WO8t
 9XrB4x7Lw8nyVzPkyifucdtKaVzyIgZmBTqfzkjEb4acmJF1j/dKiwiKpIraaYMJEUmwqClF9np
 XnLxTxRAuW/grOiacgsfaNgmBqYN15Sjc04u/Q4I4g2N16lCqkw70LyyWxv++cJHfJPx4W0ZHfC
 R/gn2xIcFEAKBEHArqXew/pH7qG7uDz/b1Tj2mM3gqLV7eTr5JFzSI/7wSktMHXAzgUD24sZiHI
 ynRl73zTIzC6nZMJLAX2n8vToMIHUD3FE7/TSjsZyhMot40Erl6eO12t1dHzizbh3GH2yOW9/Rh
 4vCxMpdrHxu0ThUYFW+V5LTlnES54b+/oIaCI5d+yTMQQ0CzptPaqHEo/3Hn1P6GXDGbu5ddJKI
 KaPeUyTJxHdX5P1JavBBd5+dhqnWjI4y5Jd1sbR9Cl9wKKlVfciVMR5ZT7Ph9rsafHUC49jW/f+
 bi/n8FB4iErM8Ig==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: An inode with no superblock? Unpossible! Signed-off-by: Jeff
 Layton <jlayton@kernel.org> --- fs/inode.c | 6 ------ 1 file changed,
 6 deletions(-)
 diff --git a/fs/inode.c b/fs/inode.c index d4ab92233062..3fc251bfaf73 100644
 --- a/fs/inode.c +++ b/fs/inode.c @@ -2495,12 +2495,6 @@ struct timespec64
 current_time(struct inode *inode) struct timespe [...] 
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
X-Headers-End: 1qT64A-00GNS7-Gl
Subject: [f2fs-dev] [PATCH v7 01/13] fs: remove silly warning from
 current_time
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

An inode with no superblock? Unpossible!

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/inode.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index d4ab92233062..3fc251bfaf73 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2495,12 +2495,6 @@ struct timespec64 current_time(struct inode *inode)
 	struct timespec64 now;
 
 	ktime_get_coarse_real_ts64(&now);
-
-	if (unlikely(!inode->i_sb)) {
-		WARN(1, "current_time() called with uninitialized super_block in the inode");
-		return now;
-	}
-
 	return timestamp_truncate(now, inode);
 }
 EXPORT_SYMBOL(current_time);

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
