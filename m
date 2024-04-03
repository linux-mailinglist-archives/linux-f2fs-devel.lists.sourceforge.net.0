Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D42897810
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 20:20:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rs5Dz-0002mU-7D;
	Wed, 03 Apr 2024 18:20:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1rs5Dx-0002mO-82
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 18:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kgGG71+PbmfI0fq3O+MCRO61PbQZUSP4YiW3koKj+XY=; b=i14ONhNcVpSaLKsFbqxFTg1nJx
 sbjBr7gDoeTziOj6btzcUeQZpU5kbz7buPBrKzcbXWfycl9K5E7OSNHG3HBpqQ1JYAdBlwnbVi8V+
 YoUXPHsH/6izwSskeK8L3hzfG91t27OSNmIL9m5/I5w32KAqwqZL3xxBnUt9+sFpytFE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kgGG71+PbmfI0fq3O+MCRO61PbQZUSP4YiW3koKj+XY=; b=RUNT42oUXxyXQSttcqjwcM9Yoz
 oIFRSRWidL6s3rk1ezGuJKchSs9QhPhwwyN+bNTo9qua7Gr6maD2VJe3WSjsL4aVI32OsvCJmK9Ju
 g9KAVTFzKlM0k3xx5VtizPRnZsaVJ86ndnVxzgv7rKKMlri+1JEOPukUD2hkgJdvHOAU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rs5Dv-0002ah-Ia for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 18:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0B0ECE2C0B;
 Wed,  3 Apr 2024 18:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30722C433C7;
 Wed,  3 Apr 2024 18:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712168423;
 bh=dKvQPTXecftDT+DnIIwHEnA6Z/BLqGb2biglQSFhZeY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P+29GNYuQx0VUmcsHNAcViKqPDDq3ZFBXvXQk8i5X/Ng9rS0Nn5TR2ZFKpItLWJoz
 AxQT8f9QGCIMrVhK1tfOsWr/ibXybNTHcuh13+EwHlmZmzl6cHhaXAIJFA2kXoY8nj
 Eb9fEuRHhhO+5iGTBPB7lLoN0d0TNvxS1vVTWNROU6LwDNr45oZ1dar1YVARAXcn8w
 LqRoDraupidvfHDGwIQvORPlSb6lScoO5H1ipbe0TmVYlxpqNjDw0D5fFjn1h/DyZj
 FFLK6Xci6djMMnMU73EvCh8gOPGDnRrFucf6kgrgZvpN41PbVwUI0e2bWiNpZ+LDQT
 6+Do0ENej/RcQ==
Date: Wed, 3 Apr 2024 11:20:22 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Message-ID: <20240403182022.GB6375@frogsfrogsfrogs>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
 <vf4k3yagvb6vf3vfu7st7uj7asv4zbf5c3b2tef2g2xic5fkvj@olqxfakmkoew>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <vf4k3yagvb6vf3vfu7st7uj7asv4zbf5c3b2tef2g2xic5fkvj@olqxfakmkoew>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 03, 2024 at 02:17:26PM -0400, Kent Overstreet
 wrote: > On Wed, Apr 03, 2024 at 03:22:41AM -0400, Sweet Tea Dorminy wrote:
 > > For many years, various btrfs users have written programs to d [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ozlabs.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rs5Dv-0002ah-Ia
Subject: Re: [f2fs-dev] [PATCH v3 00/13] fiemap extension for more physical
 information
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
Cc: linux-bcachefs@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 kernel-team@meta.com, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-btrfs@vger.kernel.org,
 Brian Foster <bfoster@redhat.com>, linux-doc@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 03, 2024 at 02:17:26PM -0400, Kent Overstreet wrote:
> On Wed, Apr 03, 2024 at 03:22:41AM -0400, Sweet Tea Dorminy wrote:
> > For many years, various btrfs users have written programs to discover
> > the actual disk space used by files, using root-only interfaces.
> > However, this information is a great fit for fiemap: it is inherently
> > tied to extent information, all filesystems can use it, and the
> > capabilities required for FIEMAP make sense for this additional
> > information also.
> > 
> > Hence, this patchset adds various additional information to fiemap,
> > and extends filesystems (but not iomap) to return it.  This uses some of
> > the reserved padding in the fiemap extent structure, so programs unaware
> > of the changes will be unaffected.
> > 
> > This is based on next-20240403. I've tested the btrfs part of this with
> > the standard btrfs testing matrix locally and manually, and done minimal
> > testing of the non-btrfs parts.
> > 
> > I'm unsure whether btrfs should be returning the entire physical extent
> > referenced by a particular logical range, or just the part of the
> > physical extent referenced by that range. The v2 thread has a discussion
> > of this.
> 
> I believe there was some talk of using the padding for a device ID, so
> that fiemap could properly support multi device filesystems. Are we sure
> this is the best use of those bytes?

We still have 5x u32 of empty space in struct fiemap after this series,
so I don't think adding the physical length is going to prohibit future
expansion.

--D

> > 
> > Changelog:
> > 
> > v3: 
> >  - Adapted all the direct users of fiemap, except iomap, to emit
> >    the new fiemap information, as far as I understand the other
> >    filesystems.
> > 
> > v2:
> >  - Adopted PHYS_LEN flag and COMPRESSED flag from the previous version,
> >    as per Andreas Dilger' comment.
> >    https://patchwork.ozlabs.org/project/linux-ext4/patch/4f8d5dc5b51a43efaf16c39398c23a6276e40a30.1386778303.git.dsterba@suse.cz/
> >  - https://lore.kernel.org/linux-fsdevel/cover.1711588701.git.sweettea-kernel@dorminy.me/T/#t
> > 
> > v1: https://lore.kernel.org/linux-fsdevel/20240315030334.GQ6184@frogsfrogsfrogs/T/#t
> > 
> > Sweet Tea Dorminy (13):
> >   fs: fiemap: add physical_length field to extents
> >   fs: fiemap: update fiemap_fill_next_extent() signature
> >   fs: fiemap: add new COMPRESSED extent state
> >   btrfs: fiemap: emit new COMPRESSED state.
> >   btrfs: fiemap: return extent physical size
> >   nilfs2: fiemap: return correct extent physical length
> >   ext4: fiemap: return correct extent physical length
> >   f2fs: fiemap: add physical length to trace_f2fs_fiemap
> >   f2fs: fiemap: return correct extent physical length
> >   ocfs2: fiemap: return correct extent physical length
> >   bcachefs: fiemap: return correct extent physical length
> >   f2fs: fiemap: emit new COMPRESSED state
> >   bcachefs: fiemap: emit new COMPRESSED state
> > 
> >  Documentation/filesystems/fiemap.rst | 35 ++++++++++----
> >  fs/bcachefs/fs.c                     | 17 +++++--
> >  fs/btrfs/extent_io.c                 | 72 ++++++++++++++++++----------
> >  fs/ext4/extents.c                    |  3 +-
> >  fs/f2fs/data.c                       | 36 +++++++++-----
> >  fs/f2fs/inline.c                     |  7 +--
> >  fs/ioctl.c                           | 11 +++--
> >  fs/iomap/fiemap.c                    |  2 +-
> >  fs/nilfs2/inode.c                    | 18 ++++---
> >  fs/ntfs3/frecord.c                   |  7 +--
> >  fs/ocfs2/extent_map.c                | 10 ++--
> >  fs/smb/client/smb2ops.c              |  1 +
> >  include/linux/fiemap.h               |  2 +-
> >  include/trace/events/f2fs.h          | 10 ++--
> >  include/uapi/linux/fiemap.h          | 34 ++++++++++---
> >  15 files changed, 178 insertions(+), 87 deletions(-)
> > 
> > 
> > base-commit: 75e31f66adc4c8d049e8aac1f079c1639294cd65
> > -- 
> > 2.43.0
> > 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
