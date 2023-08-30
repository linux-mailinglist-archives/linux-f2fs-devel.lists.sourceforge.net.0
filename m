Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB1478D138
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Aug 2023 02:43:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qb9JC-0001nZ-GT;
	Wed, 30 Aug 2023 00:43:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qb9JB-0001nS-60
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Aug 2023 00:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TJIewxi47g+K6CQX2ZiNiF3NDELxcqhbiIMvx3Sf4xc=; b=W9c8INGxtl61zQi9YBrOyJ6NiJ
 ucCieD91ujsZmsiKp5CfroB4XEj6RCKYp5Q91HFpyXEIgVbl+Qp08L0Pv7HAs8em6UQW5sSsd8Fzo
 PMM/3/68luCQkiUbR0W0HEH1oCL37dN14T2t0P+/oE84b/1oqXaJ/FmAI0oMy6HvEIl4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TJIewxi47g+K6CQX2ZiNiF3NDELxcqhbiIMvx3Sf4xc=; b=FDahDk3LmtcI9/NfM45TuF3l//
 zv024/xETwzxt+U7IJuWjgJCO99l+09Kw5SsY28caeUquO0AUeena9hJW0Fm5ErBM1ijOU+AZYG+c
 kdtUfZ5qSt672/+zRO9+SR8ra1oAY1/S9OiyJlP/VrmimSNplvOa62lv1rQ07c6q4gno=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qb9JA-0001rG-Rg for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Aug 2023 00:43:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2110C61BB9;
 Wed, 30 Aug 2023 00:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A58C433CC;
 Wed, 30 Aug 2023 00:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693356218;
 bh=LyIf2T4m7Z+aGoOTC20QhjEHya5KDco7uKHcToK2QN0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=IsIDlNRfFegBQz5apXf9Q9gjAuC8RqtGng+nYfYjX0S5SJxWLKbkP/MogQRo+SLWh
 08nrxChiobBJGOdvi1cvZ9Cxb2Pii/+6mcjLXiRCfGelk5Fzb7nFOM5cN1DYFxC+lb
 K0+wyy4lvPV7hwkO6kEPEPBXJN5ToQ7LqZEmRRmYaASuIjGr2KolOsqcxXfv9z9AFT
 U+YvwKGFpKZQuYKrSPBrKqS32L3Y2d5AV2LqhVdm8HiFMosr5io8ASM2xgBUjx2M+9
 p73bg3Y2GD+ffVCVZHTAzgHK5yijHsVB4GOG1GW7sSKXaED0tZT4jOsD9cxCZCytpG
 axe3lD1uk8SPA==
Message-ID: <1005e30582138e203a99f49564e2ef244b8d56aa.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Date: Tue, 29 Aug 2023 20:43:31 -0400
In-Reply-To: <20230830000221.GB3390869@ZenIV>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
 <20230829224454.GA461907@ZenIV>
 <e1c4a6d5001d029548542a1f10425c5639ce28e4.camel@kernel.org>
 <20230830000221.GB3390869@ZenIV>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 2023-08-30 at 01:02 +0100, Al Viro wrote: > On Tue, 
 Aug 29, 2023 at 06:58:47PM -0400, Jeff Layton wrote: > > On Tue, 2023-08-29
 at 23:44 +0100, Al Viro wrote: > > > On Tue, Jul 25, 2023 at 10: [...] 
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
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qb9JA-0001rG-Rg
Subject: Re: [f2fs-dev] [PATCH v6 1/7] fs: pass the request_mask to
 generic_fillattr
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
 linux-xfs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Dave Chinner <david@fromorbit.com>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 linux-f2fs-devel@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 Anthony Iliopoulos <ailiop@suse.com>, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Tejun Heo <tj@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Joel Becker <jlbec@evilplan.org>,
 linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Christian Brauner <brauner@kernel.org>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 2023-08-30 at 01:02 +0100, Al Viro wrote:
> On Tue, Aug 29, 2023 at 06:58:47PM -0400, Jeff Layton wrote:
> > On Tue, 2023-08-29 at 23:44 +0100, Al Viro wrote:
> > > On Tue, Jul 25, 2023 at 10:58:14AM -0400, Jeff Layton wrote:
> > > > generic_fillattr just fills in the entire stat struct indiscriminately
> > > > today, copying data from the inode. There is at least one attribute
> > > > (STATX_CHANGE_COOKIE) that can have side effects when it is reported,
> > > > and we're looking at adding more with the addition of multigrain
> > > > timestamps.
> > > > 
> > > > Add a request_mask argument to generic_fillattr and have most callers
> > > > just pass in the value that is passed to getattr. Have other callers
> > > > (e.g. ksmbd) just pass in STATX_BASIC_STATS. Also move the setting of
> > > > STATX_CHANGE_COOKIE into generic_fillattr.
> > > 
> > > Out of curiosity - how much PITA would it be to put request_mask into
> > > kstat?  Set it in vfs_getattr_nosec() (and those get_file_..._info()
> > > on smbd side) and don't bother with that kind of propagation boilerplate
> > > - just have generic_fillattr() pick it there...
> > > 
> > > Reduces the patchset size quite a bit...
> > 
> > It could be done. To do that right, I think we'd want to drop
> > request_mask from the ->getattr prototype as well and just have
> > everything use the mask in the kstat.
> > 
> > I don't think it'd reduce the size of the patchset in any meaningful
> > way, but it might make for a more sensible API over the long haul.
> 
> ->getattr() prototype change would be decoupled from that - for your
> patchset you'd only need the field addition + setting in vfs_getattr_nosec()
> (and possibly in ksmbd), with the remainders of both series being
> independent from each other.
> 
> What I suggest is
> 
> branchpoint -> field addition (trivial commit) -> argument removal
> 		|
> 		V
> your series, starting with "use stat->request_mask in generic_fillattr()"
> 
> Total size would be about the same, but it would be easier to follow
> the less trivial part of that.  Nothing in your branch downstream of
> that touches any ->getattr() instances, so it should have no
> conflicts with the argument removal side of things.

The only problem with this plan is that Linus has already merged this.
I've no issue with adding the request_mask to the kstat and removing it
as a separate parameter elsewhere, but I think we'll need to do it on
top of what's already been merged.
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
