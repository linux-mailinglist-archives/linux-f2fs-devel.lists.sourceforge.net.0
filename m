Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F267753B3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Aug 2023 09:10:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTdKo-0003dk-3H;
	Wed, 09 Aug 2023 07:10:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qTdKl-0003de-HV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 07:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+6I/QTNBngyTccgKcXVt1JYNO+FdIjYjioVaMKNNcUU=; b=gUBMimgEHxwkeOpNXYLzIzYL3g
 q9uMlH5Zv6NB2h4nH0pJIk+uvhs8jnC/K4nhusq21o7y93Mp3zNNUrG+rivf+OCP5jZ138cgN2c0X
 MevH/4FnAJ4VBdm1JtlKUWH4ReoKGTrOlWpxv5Hc94LWkqD86sAqWn4sHO7UxcEMLQOs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+6I/QTNBngyTccgKcXVt1JYNO+FdIjYjioVaMKNNcUU=; b=j83QMz2/yclPGeTPerDQun4NGh
 WlLu5L74/DLJkrnG8/l9Cm/Rbl//GuLR5ILqb5+qjoP4pHULEKt4eEd6xVWWdoyz4Yg6E7LynMOxT
 eyQPbjNh9Sj1O8g5vjgUFZpCSiv0DrmXPEysR5xpJswHsCyPfJB8MSRB4Ph6WB8Quxpk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qTdKk-0002vN-Ng for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Aug 2023 07:10:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 14B3762FBF;
 Wed,  9 Aug 2023 07:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803F7C433C7;
 Wed,  9 Aug 2023 07:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691565012;
 bh=+3Y6neJgMvW5vfedbEeRcP7JJepyGcWsyiFSr/HW990=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ggBjfw6PiXZGX2pQ0PAP5cLTD5E0rfqWCYvfni6XgMaAu/qe1HDhVULCR34YpT5YS
 BKgPskzZUrQN/q0pADH7E3rJp+efq+TJqLpTcE7dWusL6zUTz83z7W2kEcL4C6I9Pl
 ufDj5BPqocIYlc8GG9bv5prUaOSZXY+wJG0igl2mx/MjAwyCvyPRsvUpSYuoG9hC3v
 Cpu7fhDWB2xklEWatdaUMtlv7AEsl0+OXnaMFZ2BdukJjZL1AZSUnY8BUua+nFhXag
 gAEez8RHLWI4JAU/88U4SJjdJFFBI98gXxi6sXBvp3qvswqNnsMmS0Eecbc3TwTHzz
 J9jzLmchFW2kQ==
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Date: Wed,  9 Aug 2023 09:09:49 +0200
Message-Id: <20230809-neuigkeit-lahmgelegt-ec0ab744a2be@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2693; i=brauner@kernel.org;
 h=from:subject:message-id; bh=+3Y6neJgMvW5vfedbEeRcP7JJepyGcWsyiFSr/HW990=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaRctt58ofGmdrjT46zKic8e+j/qO6J62PGCzlmNRn/PL+ca
 DhW87ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiIjiMjw77ybes4w5Z37p3j9lpveq
 1v7yzNZOVwx1cX83f9exixeQ8jw5qJVSkpYSKnLt8M6dl09qHqq/xjLU9j3pdUzg+b1x8izQ4A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 07 Aug 2023 15:38:31 -0400, Jeff Layton wrote: > The
 VFS always uses coarse-grained timestamps when updating the > ctime and mtime
 after a change. This has the benefit of allowing > filesystem [...] 
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
X-Headers-End: 1qTdKk-0002vN-Ng
Subject: Re: [f2fs-dev] [PATCH v7 00/13] fs: implement multigrain timestamps
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
 Jan Kara <jack@suse.cz>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, Benjamin Coddington <bcodding@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 Steve French <sfrench@samba.org>, Tyler Hicks <code@tyhicks.com>,
 linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Andreas Gruenbacher <agruenba@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Luis Chamberlain <mcgrof@kernel.org>, codalist@coda.cs.cmu.edu,
 cluster-devel@redhat.com, coda@cs.cmu.edu, Iurii Zaikin <yzaikin@google.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, devel@lists.orangefs.org,
 Bob Peterson <rpeterso@redhat.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Kees Cook <keescook@chromium.org>, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Yue Hu <huyue2@coolpad.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Eric Van Hensbergen <ericvh@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 Gao Xiang <xiang@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Jan Harkes <jaharkes@cs.cmu.edu>, Christian Brauner <brauner@kernel.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Theodore Ts'o <tytso@mit.edu>,
 Chris Mason <clm@fb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
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

On Mon, 07 Aug 2023 15:38:31 -0400, Jeff Layton wrote:
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

[01/13] fs: remove silly warning from current_time
        https://git.kernel.org/vfs/vfs/c/562bcab11bf4
[02/13] fs: pass the request_mask to generic_fillattr
        https://git.kernel.org/vfs/vfs/c/3592165f4378
[03/13] fs: drop the timespec64 arg from generic_update_time
        https://git.kernel.org/vfs/vfs/c/32586bb50943
[04/13] btrfs: have it use inode_update_timestamps
        https://git.kernel.org/vfs/vfs/c/51fc38e7c7d1
[05/13] fat: make fat_update_time get its own timestamp
        https://git.kernel.org/vfs/vfs/c/d6e7faae82dc
[06/13] ubifs: have ubifs_update_time use inode_update_timestamps
        https://git.kernel.org/vfs/vfs/c/853ff59b434a
[07/13] xfs: have xfs_vn_update_time gets its own timestamp
        https://git.kernel.org/vfs/vfs/c/7ad056c2cf36
[08/13] fs: drop the timespec64 argument from update_time
        https://git.kernel.org/vfs/vfs/c/3beae086b71f
[09/13] fs: add infrastructure for multigrain timestamps
        https://git.kernel.org/vfs/vfs/c/b16956ed812f
[10/13] tmpfs: add support for multigrain timestamps
        https://git.kernel.org/vfs/vfs/c/bd21ec574f16
[11/13] xfs: switch to multigrain timestamps
        https://git.kernel.org/vfs/vfs/c/fb9812d2c39e
[12/13] ext4: switch to multigrain timestamps
        https://git.kernel.org/vfs/vfs/c/7fdf02299f5d
[13/13] btrfs: convert to multigrain timestamps
        https://git.kernel.org/vfs/vfs/c/2ebbf04988b9


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
