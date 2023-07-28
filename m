Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E97766B92
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jul 2023 13:20:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qPLVy-0006Dr-Gy;
	Fri, 28 Jul 2023 11:20:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qPLVu-0006Dd-FT
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jul 2023 11:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y3gNflm29tbucRmYFhFKSUPyIFzYB2tjGffD31r6wOQ=; b=RH33/g89Z+Gz0sejws7LE6qD48
 FI2X/b8U8s80u1jQBkDPNZ+/ebx0B29HGHIbpu2fkOjtUOqVqcFQExfGTanokZe9+JjpfOQTvWT6H
 zzPP0PgptiGczViTDuWuFi5y/WTCaevLlGPXqBtNZ1LNtGBSmBOFN50R9Tedf0smi1WM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y3gNflm29tbucRmYFhFKSUPyIFzYB2tjGffD31r6wOQ=; b=W0a8XrwOF/QZzBrh1dikuBfrZA
 tQHsfh6sL5ObliqaeBigUMdBqibPXV7xbLJrobcV4U5OqLrgb4+hJRLIO0s6NwAGHWypkO+TAmW32
 qjq3IsfSGrF2kHECk2kleVltmEe7/xpB/SYhkfuAtosk7u3Y+cD6NRNHyC7rGxioYls4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qPLVr-005RvT-PT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jul 2023 11:20:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70293620F0;
 Fri, 28 Jul 2023 11:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71689C433C8;
 Fri, 28 Jul 2023 11:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690542063;
 bh=OHILmmeiUht8a/iNB32Wqo6p3CZSNTmmXf/wqdU8eyM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lUHncmkLN11wgaMD1KR1Gy5if09x5xh0KGyx50ZGUuC2fBx+ijTW2wECE/sOye+rG
 qDHl4LIc5ruyg2PAO1VZI95ZW/5j7Q0Vo/saVvtDVwvUJlMtgeQjFVYzjalCOIixt6
 gEQ+u8asPVZluAxs1HoSNgHXPJA0QhMWBw4NywwMFrjIj9j61U5pX9yO+iEoVUAfbu
 mdakOz70WJL7rxDzg7P00Ji6kHPu+xHi68+/TquTtcuasIukOIAL/+DVn48WGku6nx
 2ORenDwB3jD7HGc7jH1b/evq7YZ9RS2gsMH8Qjv3EgEZjMk8pxaawj3uGeQKo/zCuQ
 +lMRyzmoHCobQ==
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Date: Fri, 28 Jul 2023 13:00:37 +0200
Message-Id: <20230728-unrecht-ersichtlich-cfa7d0c703d1@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874; i=brauner@kernel.org;
 h=from:subject:message-id; bh=4DjYiXolHUh8qQu1N+OzbWT4vtvmgyT4c+N7Ht8XGtY=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaQcnsy9IaFu+ZP9z1N8rj/+PH2Pm5FLY6hTmXAw+6xpv069
 EIk93lHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjARMyFGhh2xp3MqP+WJ6kre7E0z/m
 vxVuf2tOrqbz/KOXZnbdld4czI8C9ly15G/weVYRsOZM6bEHF4077Al0vcwkM2vDFrTz89nQsA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 25 Jul 2023 10:58:13 -0400, Jeff Layton wrote: > The
 VFS always uses coarse-grained timestamps when updating the > ctime and mtime
 after a change. This has the benefit of allowing > filesystem [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qPLVr-005RvT-PT
Subject: Re: [f2fs-dev] (subset) [PATCH v6 0/7] fs: implement multigrain
 timestamps
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Dave Chinner <david@fromorbit.com>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 Steve French <sfrench@samba.org>, Tyler Hicks <code@tyhicks.com>,
 linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Andreas Gruenbacher <agruenba@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Hugh Dickins <hughd@google.com>, Luis Chamberlain <mcgrof@kernel.org>,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, coda@cs.cmu.edu,
 Iurii Zaikin <yzaikin@google.com>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 devel@lists.orangefs.org, Bob Peterson <rpeterso@redhat.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Kees Cook <keescook@chromium.org>,
 Anthony Iliopoulos <ailiop@suse.com>, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Yue Hu <huyue2@coolpad.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Gao Xiang <xiang@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Jan Harkes <jaharkes@cs.cmu.edu>, Christian Brauner <brauner@kernel.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Theodore Ts'o <tytso@mit.edu>,
 Chris Mason <clm@fb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Tejun Heo <tj@kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 25 Jul 2023 10:58:13 -0400, Jeff Layton wrote:
> The VFS always uses coarse-grained timestamps when updating the
> ctime and mtime after a change. This has the benefit of allowing
> filesystems to optimize away a lot metadata updates, down to around 1
> per jiffy, even when a file is under heavy writes.
> 
> Unfortunately, this coarseness has always been an issue when we're
> exporting via NFSv3, which relies on timestamps to validate caches. A
> lot of changes can happen in a jiffy, so timestamps aren't sufficient to
> help the client decide to invalidate the cache.
> 
> [...]

Survives xfstests (tmpfs, ext4, overlayfs) and the fs portions of LTP.
Let's keep our eyes open for any potential issues. Past suspects has
been IMA interacting with overlayfs. We'll see. Picked everything minus
the tmpfs-writepage patch that was contentious.

---

Applied to the vfs.ctime branch of the vfs/vfs.git tree.
Patches in the vfs.ctime branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.ctime

[1/7] fs: pass the request_mask to generic_fillattr
      https://git.kernel.org/vfs/vfs/c/0a6ab6dc6958
[2/7] fs: add infrastructure for multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/d242b98ac3e9
[4/7] tmpfs: add support for multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/1f31c58cf032
[5/7] xfs: switch to multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/859dd91017dd
[6/7] ext4: switch to multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/093af249eab4
[7/7] btrfs: convert to multigrain timestamps
      https://git.kernel.org/vfs/vfs/c/b90a04d1c30c


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
