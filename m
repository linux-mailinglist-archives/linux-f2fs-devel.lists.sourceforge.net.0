Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0828D6DE9DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Apr 2023 05:18:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmR0L-0006lU-6z;
	Wed, 12 Apr 2023 03:18:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1pmR0J-0006lO-Uv
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 03:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QTzf86zAv2fU3C/eN/0tX6Qjb72nN2ZOHZq+wIvYYEk=; b=SnS/H5QawgXAye6L6499Mp7veK
 10Q/hXqzZboYMEk5Zo7G9s4Y18xDyJb9kGpeQUBENEJ+6ovkwY30sb/iud3rWKpqlLbrCzOQfUcoj
 WCYNMVwhRJgmf4O97uu3lXIuEhNIGLBkKIFmjDtw7m8LhrFqVHlQsQknQ9OqyK+03VRo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QTzf86zAv2fU3C/eN/0tX6Qjb72nN2ZOHZq+wIvYYEk=; b=gos2Ra0UinTHbEU5M/AlL1vcqP
 /6PZT33W93z1LDJXZKJKC2ZU0e5eNF+AJL5OsFCe1S+VK2dms0K24zKdslukb2NT+Mw5cnzpJWaji
 DnyOh1rK5JbdVCDm9vO2mPtzqHxYx6jfObxljs7Lm0FMaUou+SVcPvT69Bvt+JI/nkW0=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pmR0F-004wBf-OF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 03:18:39 +0000
Received: by mail-pj1-f45.google.com with SMTP id f2so1582454pjs.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Apr 2023 20:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20210112.gappssmtp.com; s=20210112; t=1681269510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QTzf86zAv2fU3C/eN/0tX6Qjb72nN2ZOHZq+wIvYYEk=;
 b=RIm6qfQDAE0Gvz8EmVP4usexgRsGP9V/jIqls91dsJNT85XwtaGY8OPFulpCxkIEk4
 vd1CrUN1XT/s9k9NS9Z+V99y7RX29V7R9a9VZzITy3cVmE9hTRU9XNV6+yDeQf7n5qyf
 dtXOF3uA5knLC4fM3FOa6eJk7WllE1rz75WFFSthumGqgwhenqTIWQU5MyJZ+hPDyGBX
 tpVfTf5Z1vv4udhay0UI5TDrPQWqmcRsjacWZEYmoM2I+oaHVz2L2aKEktSnw0dEGkGx
 Vq2BZOUc2q6kExZKSQAUI3o0C9emWKB2Vh6KZqJnPdWxcyqxEdK80KlWeVm6DNwN7OYe
 dvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681269510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTzf86zAv2fU3C/eN/0tX6Qjb72nN2ZOHZq+wIvYYEk=;
 b=35QTo72dZa2gSB1kE+Ha/3Twgo3T5A8bxI1i0CWzwJX3UMxp8o6UYXkwiCE6RX5i61
 1SnMtJLlqEUp1yKCl8BM/dko3GzhcjP75bSTlCou8JIEK3Bu3kTEGYwK7xj8nH6zi9GZ
 XcO9aIB3IZwQmVRGNnqcufri3XELDNY3+Zo0W42zN4YWqphN6daOeZo2kF7nBpwMwuFS
 I0fRFMq1LE4G9V0ZwZ2Ti+CE63SeFjTt84f+2vntbf3VPqPYHeFZqPkoNVt+gTche3UU
 1tvJ1fBS7VknmH50WGdjAZXSY2gByd8W5r4p5gEY9v4JTpr2Sm0J/HlAT7bmBS3P8+Zo
 INsA==
X-Gm-Message-State: AAQBX9fwrVm3Dd3wXRnFte3puRkBFnQevEftA2sjFI/xqOBR/cSUkb4p
 5oa4oIJBHOKGgw7szyDYkQVa3w==
X-Google-Smtp-Source: AKy350bEvRaL0tcbYZNXJN9S8MKTlfNUtm72wryf0f0tx94/6m3Gotj2MFJG8+gujGf5Bd9bxftN0Q==
X-Received: by 2002:a17:90a:45:b0:23f:a4da:1203 with SMTP id
 5-20020a17090a004500b0023fa4da1203mr6850168pjb.19.1681269510087; 
 Tue, 11 Apr 2023 20:18:30 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-41-174.pa.nsw.optusnet.com.au.
 [49.180.41.174]) by smtp.gmail.com with ESMTPSA id
 z8-20020a1709028f8800b0019f9fd5c24asm7362321plo.207.2023.04.11.20.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 20:18:29 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pmR06-002L8o-E9; Wed, 12 Apr 2023 13:18:26 +1000
Date: Wed, 12 Apr 2023 13:18:26 +1000
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230412031826.GI3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <ZDTt8jSdG72/UnXi@infradead.org>
 <20230412023319.GA5105@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230412023319.GA5105@sol.localdomain>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 11, 2023 at 07:33:19PM -0700, Eric Biggers wrote:
 > On Mon, Apr 10, 2023 at 10:19:46PM -0700, Christoph Hellwig wrote: > >
 Dave is going to hate me for this, but.. > > > > I've been lookin [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pmR0F-004wBf-OF
Subject: Re: [f2fs-dev] [PATCH v2 00/23] fs-verity support for XFS
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com, djwong@kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 11, 2023 at 07:33:19PM -0700, Eric Biggers wrote:
> On Mon, Apr 10, 2023 at 10:19:46PM -0700, Christoph Hellwig wrote:
> > Dave is going to hate me for this, but..
> > 
> > I've been looking over some of the interfaces here, and I'm starting
> > to very seriously questioning the design decisions of storing the
> > fsverity hashes in xattrs.
> > 
> > Yes, storing them beyond i_size in the file is a bit of a hack, but
> > it allows to reuse a lot of the existing infrastructure, and much
> > of fsverity is based around it.  So storing them in an xattrs causes
> > a lot of churn in the interface.  And the XFS side with special
> > casing xattr indices also seems not exactly nice.
> 
> It seems it's really just the Merkle tree caching interface that is causing
> problems, as it's currently too closely tied to the page cache?  That is just an
> implementation detail that could be reworked along the lines of what is being
> discussed.
> 
> But anyway, it is up to the XFS folks.  Keep in mind there is also the option of
> doing what btrfs is doing, where it stores the Merkle tree separately from the
> file data stream, but caches it past i_size in the page cache at runtime.

Right. It's not entirely simple to store metadata on disk beyond EOF
in XFS because of all the assumptions throughout the IO path and
allocator interfaces that it can allocate space beyond EOF at will
and something else will clean it up later if it is not needed. This
impacts on truncate, delayed allocation, writeback, IO completion,
EOF block removal on file close, background garbage collection,
ENOSPC/EDQUOT driven space freeing, etc.  Some of these things cross
over into iomap infrastructure, too.

AFAIC, it's far more intricate, complex and risky to try to store
merkle tree data beyond EOF than it is to put it in an xattr
namespace because IO path EOF handling bugs result in user data
corruption. This happens over and over again, no matter how careful
we are about these aspects of user data handling.

OTOH, putting the merkle tree data in a different namespace avoids
these issues completely. Yes, we now have to solve an API mismatch,
but we aren't risking the addition of IO path data corruption bugs
to every non-fsverity filesystem in production...

Hence I think copying the btrfs approach (i.e. only caching the
merkle tree data in the page cache beyond EOF) would be as far as I
think we'd want to go. Realistically, there would be little
practical difference between btrfs storing the merkle tree blocks in
a separate internal btree and XFS storing them in an internal
private xattr btree namespace.

I would, however, prefer not to have to do this at all if we could
simply map the blocks directly out of the xattr buffers as we
already do internally for all the XFS code...

> I guess there is also the issue of encryption, which hasn't come up yet since
> we're talking about fsverity support only.  The Merkle tree (including the
> fsverity_descriptor) is supposed to be encrypted, just like the file contents
> are.  Having it be stored after the file contents accomplishes that easily...
> Of course, it doesn't have to be that way; a separate key could be derived, or
> the Merkle tree blocks could be encrypted with the file contents key using
> indices past i_size, without them physically being stored in the data stream.

I'm expecting that fscrypt for XFS will include encryption of the
xattr names and values (just like we will need to do for directory
names) except for the xattrs that hold the encryption keys
themselves. That means the merkle tree blocks should get encrypted
without any extra work needing to be done anywhere.  This will
simply require the fscrypt keys to be held in a private internal
xattr namespace that isn't encrypted, but that's realtively trivial
to do...

Cheers,

Dave.

-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
