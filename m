Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9C292DC4B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2024 01:05:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRgMr-0006b2-76;
	Wed, 10 Jul 2024 23:04:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sRgMq-0006au-BR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 23:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QMF/ROr5AfFJCXehmAv/0esdtXyhiZTWcdCklFJPH6E=; b=Vu4eQjf9qv3MOLEY6TrF+UqCBD
 TZigyTm3geH2FcEkl9gqv1rM0Tf1x6uKLcLLcl5S5ISwFr0CjiZUUy18ewoOfPOcnV7u+PTVx3mez
 GvK0HjAqPiAKrpWESn8Dd5JxgQQkmV6tSMBz45KSqlK/ImZJ8wYybS8yx/+my8zSZb4U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QMF/ROr5AfFJCXehmAv/0esdtXyhiZTWcdCklFJPH6E=; b=JNBtPF1VAupHykZd2y8tpjYARe
 bjLcyQgcGi0MYSD0SReti/yT6YW8iiKpGU4IO/e/YapCJ9M8XBWiAve3lqAVGY8EKZZJRVl0Pg2oZ
 hyps4a8CsLjjcGZvXfo29xRQqYzN8gArQLY3lDDupjO08h+JlCbH5S8G3YfeZgrQomAc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRgMr-0003fI-34 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 23:04:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 83AB7CE0B87;
 Wed, 10 Jul 2024 23:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF51C32781;
 Wed, 10 Jul 2024 23:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720652683;
 bh=V+4zYn31HLSrxwRTRgQxFu6X2x7gIysY3V90ExEYe4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y7eO4XpfUdZnF5V4+roInzU5JhpgJHJanGBLDWAymsX4uHYKbHMChJDBOHrMRkEwm
 vQ6ZvXeoavrI6GtznjJPNnFFm/xVeOQDNxU0Xd23wxqppOaseBU2lEm2qCT9ZaQs18
 afJk3q0bVeeXBzz0tcPB7Z59+o6hxiaEFVbRO6THAr99gOJgZ/YBtdGu+27CCgWaI8
 fR0gGNrw+VCXt57bCht5O72crSRDLPeEcHqjjknSE5cgojeIt1e/2GP7FY7ZUH+eAB
 XChYO9vYt7Ab6cQQpqmcaKFMgtQzJkAywInU0g2lv0etKbxDiwtFI5AtsopAPqCJ8e
 HbaJR/PA2YfRw==
Date: Wed, 10 Jul 2024 23:04:42 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sheng Yong <shengyong@oppo.com>
Message-ID: <Zo8TiszfzVZAhehK@google.com>
References: <20240704025740.527171-1-shengyong@oppo.com>
 <Zo8R5dV8awZ8NuDj@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zo8R5dV8awZ8NuDj@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/10, Jaegeuk Kim wrote: > Hi Sheng, > > Can we have a
 list of tests to check the expected behavior of given > inject.f2fs followed
 by fsck.f2fs? And we need this.
 https://lore.kernel.org/linux-f2fs-devel/20240710230319.33025-1-jaegeuk@kernel.org/T/#u
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sRgMr-0003fI-34
Subject: Re: [f2fs-dev] [RCF PATCH v3 00/10] f2fs-tools: introduce
 inject.f2fs
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/10, Jaegeuk Kim wrote:
> Hi Sheng,
> 
> Can we have a list of tests to check the expected behavior of given
> inject.f2fs followed by fsck.f2fs?

And we need this.

https://lore.kernel.org/linux-f2fs-devel/20240710230319.33025-1-jaegeuk@kernel.org/T/#u

> 
> Thanks,
> 
> On 07/04, Sheng Yong wrote:
> > This patchset introduces a new tool inject.f2fs to modify metadata or
> > data (directory entry) of f2fs image offline flexibly.
> > 
> > With inject.f2fs, it is easier to generate a corrupted f2fs image, which
> > can help verify fsck or reproduce userspace behaviors of some a fault.
> > If option `--dry-run' is used, nothing really gets changed, and that
> > could be used to get the value of a specified field.
> > 
> > inject.f2fs allows injecting some members in sb, cp, nat, sit, ssa, node
> > and dentry for now. The available members of each part can be listed by
> > executing command like:
> >   inject.f2fs --sb 0 --help
> > 
> >   [...]
> >   [mb]:
> >     magic: inject magic number
> >     s_stop_reason: inject s_stop_reason array selected by --idx <index>
> >     s_errors: inject s_errors array selected by --idx <index>
> >     devs.path: inject path in devs array selected by --idx <index> specified by --str <string>
> > 
> > More injection fields are still work-in-progress. The TODO list includes:
> >  * sb: features
> >  * cp: fsync dnodes
> >  * inode: extent, extra attrs, xattr
> >  * data: fsverify?
> >  * other fields which is needed to verify fsck
> > 
> > v3:
> >   * patch 3, fix error handling of inject sb->devs.path
> >   * patch 3, do not ASSERT devs.path when inject is executed
> >   * patch 3, allow inject to execute if image is umounted unclean
> >   * patch 9, check whether blkaddr is valid before reading dentry block
> >   * add is_digits and strtol entptr check when parsing numeric options
> > 
> > v2:
> >   * change print format of s_errors
> >   * add write_raw_cp_blocks to write the first & last cp blocks directly
> >     to avoid updating ckpt_flags by write_checkpoint
> >   * call update_block if i_inode_checksum is injected to avoid updating
> >     i_inode_checksum by update_inode
> >   * go through all dentry blocks to find the target dir entry
> > 
> > Examples:
> > 
> > Inject sb's magic
> > =================
> > inject.f2fs --sb 0 --mb magic --val 0x12345 $DEV
> > 
> > Info: inject sb auto
> > Info: inject member magic
> > Info: inject value 74565 : 0x12345
> > [...]
> > Info: inject magic of sb 1: 0xf2f52010 -> 0x12345
> > [update_superblock: 890] Info: Done to update superblock
> > 
> > Inject cp's cur_data_segno
> > ==========================
> > inject.f2fs --cp 0 --mb cur_data_segno --idx 1 --val 0x12345 $DEV
> > 
> > Info: inject cp pack auto
> > Info: inject member cur_data_segno
> > Info: inject slot index 1
> > Info: inject value 74565 : 0x12345
> > [...]
> > Info: inject cur_data_segno[1] of cp 1: 0x4 -> 0x12345
> > Info: write_checkpoint() cur_cp:1
> > 
> > Inject nat's ino
> > ================
> > inject.f2fs --nat 0 --mb ino --nid $INO --val 0x12345 $DEV
> > 
> > Info: inject nat pack auto
> > Info: inject nid 4 : 0x4
> > Info: inject member ino
> > Info: inject value 74565 : 0x12345
> > [...]
> > Info: inject nat entry ino of nid 4 in pack 1: 4 -> 74565
> > 
> > Inject ssa's nid
> > ================
> > inject.f2fs --ssa --blk $BLK --mb nid --val 0x12345 $DEV
> > 
> > Info: inject ssa
> > Info: inject blkaddr 7511 : 0x1d57
> > Info: inject member nid
> > Info: inject value 74565 : 0x12345
> > [...]
> > Info: auto idx = 343
> > Info: inject summary entry nid of block 0x1d57: 0x4 -> 0x12345
> > 
> > Inject inode's i_addr
> > =====================
> > inject.f2fs --node --nid $INO --mb i_addr --idx 100 --val 0x12345 $DEV
> > 
> > Info: inject node
> > Info: inject nid 4 : 0x4
> > Info: inject member i_addr
> > Info: inject slot index 100
> > Info: inject value 74565 : 0x12345
> > [...]
> > Info: inject inode i_addr[100] of nid 4: 0x20864 -> 0x12345
> > 
> > Inject inode's dentry hash
> > ==========================
> > inject.f2fs --dent --nid $INO --mb d_hash --val 0x12345 $DEV
> > 
> > Info: inject dentry
> > Info: inject nid 4 : 0x4
> > Info: inject member d_hash
> > Info: inject value 74565 : 0x12345
> > [..]
> > Info: inject dentry d_hash of nid 4: 0xc77b804e -> 0x12345
> > 
> > Sheng Yong (10):
> >   f2fs-tools: export is_digits
> >   inject.f2fs: introduce inject.f2fs
> >   inject.f2fs: add sb injection
> >   inject.f2fs: add cp injection
> >   inject.f2fs: add nat injection
> >   inject.f2fs: add sit injection
> >   inject.f2fs: add ssa injection
> >   inject.f2fs: add node injection
> >   inject.f2fs: add dentry injection
> >   man: add inject.f2fs man page
> > 
> >  fsck/Makefile.am  |    5 +-
> >  fsck/fsck.h       |    6 +
> >  fsck/inject.c     | 1104 +++++++++++++++++++++++++++++++++++++++++++++
> >  fsck/inject.h     |   41 ++
> >  fsck/main.c       |   38 +-
> >  fsck/mount.c      |   30 +-
> >  include/f2fs_fs.h |    2 +
> >  man/Makefile.am   |    2 +-
> >  man/inject.f2fs.8 |  225 +++++++++
> >  9 files changed, 1447 insertions(+), 6 deletions(-)
> >  create mode 100644 fsck/inject.c
> >  create mode 100644 fsck/inject.h
> >  create mode 100644 man/inject.f2fs.8
> > 
> > -- 
> > 2.40.1
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
