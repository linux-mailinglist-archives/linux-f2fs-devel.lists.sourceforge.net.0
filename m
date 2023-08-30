Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E1B78D1B2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Aug 2023 03:24:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qb9ws-0001uc-W4;
	Wed, 30 Aug 2023 01:24:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1qb9ws-0001uT-4P
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Aug 2023 01:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UGL8Hs7wie/83TbDi9sHxBsPaDb/+1IP8lK74uZbCKw=; b=lnByOdGO/YGFr3Zyphcx2nDSJP
 0iFnS6IYGPY26xq3NRfucd/pfT1XJL1fp85+/tdO6/r3dKftb2ngLLsiMAApStXWpj4ETAoF7K3vT
 TSeq06yeIlK/S8N6L/+vCpxnmDMiNU8eHXN1b+7vMn0PVvcSIPVhaB5mDJNNJrh6XWiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UGL8Hs7wie/83TbDi9sHxBsPaDb/+1IP8lK74uZbCKw=; b=ULRv0MDbEo3t//MoRXJ1/wQfuX
 7kdGbAV1F3HzZJQYrgGm/mQWFiSDGW25XdhsivPD5ItOLJkrJB0Zh5KY/TI8/9N9UAov4ujV2jS1Y
 XNa4j1iuRcQrKGjvemLJu/YKBYAPwRugFDz10I9202/3JnUU/p8o+t6yBbSgZs+6ndPo=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qb9wp-00038W-97 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Aug 2023 01:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UGL8Hs7wie/83TbDi9sHxBsPaDb/+1IP8lK74uZbCKw=; b=VMCLMK1iXxNHLo2tyoSLb1HI/I
 ygrNcHqe5LWzcSOicXKiXv7+aZW1BJ7dB0vjqMCV0MnziRQDnoZOz3XgmiNQiiDnA13PUlmOVrxc4
 WpSk9x7uA8R3KciGWN7qJ88utnJ3QSHSvYKWfoJJvhO0U1H1/cqwYZYmtvld8BDA8iqcXv8CBaGId
 erqQdPcYkjIFz/hBJqwMuB/rDK2BOMTdgnlCwnIMFpdDxv6wkG8Wn7rLsnAYsC5D7sc1BRtVulXjw
 RcKjf3m9ODmy0yW/y+LgeKEyGIU6PCqX4XrC83Co4MtcnJcvY9SuxDXgB2k0Ps8NGdX3ExJB41/fI
 ibsynONQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qb9v5-001yGw-2Z; Wed, 30 Aug 2023 01:22:55 +0000
Date: Wed, 30 Aug 2023 02:22:55 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230830012255.GC3390869@ZenIV>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
 <20230829224454.GA461907@ZenIV>
 <e1c4a6d5001d029548542a1f10425c5639ce28e4.camel@kernel.org>
 <20230830000221.GB3390869@ZenIV>
 <1005e30582138e203a99f49564e2ef244b8d56aa.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1005e30582138e203a99f49564e2ef244b8d56aa.camel@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Aug 29, 2023 at 08:43:31PM -0400, Jeff Layton wrote:
 > On Wed, 2023-08-30 at 01:02 +0100, Al Viro wrote: > > On Tue, Aug 29, 2023
 at 06:58:47PM -0400, Jeff Layton wrote: > > > On Tue, 2023-08- [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qb9wp-00038W-97
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

On Tue, Aug 29, 2023 at 08:43:31PM -0400, Jeff Layton wrote:
> On Wed, 2023-08-30 at 01:02 +0100, Al Viro wrote:
> > On Tue, Aug 29, 2023 at 06:58:47PM -0400, Jeff Layton wrote:
> > > On Tue, 2023-08-29 at 23:44 +0100, Al Viro wrote:
> > > > On Tue, Jul 25, 2023 at 10:58:14AM -0400, Jeff Layton wrote:
> > > > > generic_fillattr just fills in the entire stat struct indiscriminately
> > > > > today, copying data from the inode. There is at least one attribute
> > > > > (STATX_CHANGE_COOKIE) that can have side effects when it is reported,
> > > > > and we're looking at adding more with the addition of multigrain
> > > > > timestamps.
> > > > > 
> > > > > Add a request_mask argument to generic_fillattr and have most callers
> > > > > just pass in the value that is passed to getattr. Have other callers
> > > > > (e.g. ksmbd) just pass in STATX_BASIC_STATS. Also move the setting of
> > > > > STATX_CHANGE_COOKIE into generic_fillattr.
> > > > 
> > > > Out of curiosity - how much PITA would it be to put request_mask into
> > > > kstat?  Set it in vfs_getattr_nosec() (and those get_file_..._info()
> > > > on smbd side) and don't bother with that kind of propagation boilerplate
> > > > - just have generic_fillattr() pick it there...
> > > > 
> > > > Reduces the patchset size quite a bit...
> > > 
> > > It could be done. To do that right, I think we'd want to drop
> > > request_mask from the ->getattr prototype as well and just have
> > > everything use the mask in the kstat.
> > > 
> > > I don't think it'd reduce the size of the patchset in any meaningful
> > > way, but it might make for a more sensible API over the long haul.
> > 
> > ->getattr() prototype change would be decoupled from that - for your
> > patchset you'd only need the field addition + setting in vfs_getattr_nosec()
> > (and possibly in ksmbd), with the remainders of both series being
> > independent from each other.
> > 
> > What I suggest is
> > 
> > branchpoint -> field addition (trivial commit) -> argument removal
> > 		|
> > 		V
> > your series, starting with "use stat->request_mask in generic_fillattr()"
> > 
> > Total size would be about the same, but it would be easier to follow
> > the less trivial part of that.  Nothing in your branch downstream of
> > that touches any ->getattr() instances, so it should have no
> > conflicts with the argument removal side of things.
> 
> The only problem with this plan is that Linus has already merged this.
> I've no issue with adding the request_mask to the kstat and removing it
> as a separate parameter elsewhere, but I think we'll need to do it on
> top of what's already been merged.

D'oh...  My apologies; I'll do a branch on top of that (and rebase on
top of -rc1 once the window closes).


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
