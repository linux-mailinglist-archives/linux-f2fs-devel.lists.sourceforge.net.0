Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25740664B4B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jan 2023 19:42:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFJZc-0002j8-Fe;
	Tue, 10 Jan 2023 18:42:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pFJZb-0002j2-T0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jan 2023 18:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c6EPXskDxnwTd/ZxTB5zCoUz0mDk5kc73CPozFZqE24=; b=VjXtpN3ipYl3RW/JCMC5681gc3
 LvXmvnrf0t2flWEN9SEkGSSL8FAJp9w9wggMNTl+9pTfqtw6vth/HQMmNoEaL8UvpDuxM4fOCrwVg
 Qm2B4kcuXZ2dJAx5sSXcTjVeP7+HnR9Dyi4cdK9SUF+uf8Y3UwuZFj7Bae2P5tV7CNd0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c6EPXskDxnwTd/ZxTB5zCoUz0mDk5kc73CPozFZqE24=; b=Z2/OxxHwhMiBJkEE0vlPHYvkVt
 AogotfRuuBrx75dxZjfCjVgLGA8k4PTC7wCT73Qua8Clh6jjHJXy9ru5H3RnKSiBlhccILityJ6GC
 Aoi1aFsmtxDo+4AJFwtWcyjcwIUj9T2eIqPlYg6xggoU9JKqNsMQTkf+4O37ZRSW56Tw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFJZa-0002jn-KM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jan 2023 18:42:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A77D6183C;
 Tue, 10 Jan 2023 18:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767D3C433EF;
 Tue, 10 Jan 2023 18:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673376124;
 bh=g3CRnTTazWLR2Hh58q3CRcJBbpAnJEnxst035yVP2JI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dqTUBuLoJqiA6XVnVZWR+jPO7aNl7WWPgJZJ6OhsJDk+nWTQLSw1HLn617q1B+IvI
 /xTo4MhG+C4e92CmQbPuosfUhQ67lQURj0w8zUxeHdq7wEtl/3bEBJvRhFoDbkGOJ1
 juAKdMMT2/e5U2s2Z4atHu89Hss1utQctXg5R6xhmnBzEolqYZJ9/xL0FFyEEibHXq
 UrgmBT/fs/d6aBCiXmHVshq2kcdGkQVLUY96mAQK+qSTH9FU9V5Rlj1t5sZsxs0BL9
 6Ggt3vRGC2qhEGPvw1rY/K8TD+43AXWwGLnhL4RQCfiKKgQkmW4pbmHcc4PYZM3eaa
 whUGhcZMEyfNA==
Date: Tue, 10 Jan 2023 18:42:03 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Alexander Potapenko <glider@google.com>
Message-ID: <Y72xe72B+A1KrcaY@gmail.com>
References: <20221121112134.407362-1-glider@google.com>
 <20221121112134.407362-2-glider@google.com>
 <20221122145615.GE5824@twin.jikos.cz>
 <CAG_fn=Waivo=jEEqp7uMjKXdAvqP3XPtnAQeiRfu6ptwPmkyjw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG_fn=Waivo=jEEqp7uMjKXdAvqP3XPtnAQeiRfu6ptwPmkyjw@mail.gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 10, 2023 at 01:27:03PM +0100, Alexander Potapenko
 wrote: > On Tue, Nov 22, 2022 at 3:56 PM David Sterba <dsterba@suse.cz> wrote:
 > > > > On Mon, Nov 21, 2022 at 12:21:31PM +0100, Alexander [...] 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pFJZa-0002jn-KM
Subject: Re: [f2fs-dev] [PATCH 2/5] fs: affs: initialize fsdata in
 affs_truncate()
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
Cc: linux-f2fs-devel@lists.sourceforge.net, tytso@mit.edu, dsterba@suse.cz,
 linux-kernel@vger.kernel.org, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 10, 2023 at 01:27:03PM +0100, Alexander Potapenko wrote:
> On Tue, Nov 22, 2022 at 3:56 PM David Sterba <dsterba@suse.cz> wrote:
> >
> > On Mon, Nov 21, 2022 at 12:21:31PM +0100, Alexander Potapenko wrote:
> > > When aops->write_begin() does not initialize fsdata, KMSAN may report
> > > an error passing the latter to aops->write_end().
> > >
> > > Fix this by unconditionally initializing fsdata.
> > >
> > > Suggested-by: Eric Biggers <ebiggers@kernel.org>
> > > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > > Signed-off-by: Alexander Potapenko <glider@google.com>
> >
> > With the fixed Fixes: reference,
> >
> > Acked-by: David Sterba <dsterba@suse.com>
> 
> Hi David,
> 
> I've noticed that the ext4 counterpart of this patch is in the
> upstream tree already, whereas the affs, f2fs, hfs and hfsplus
> versions are not.
> Are they picked via a different tree?

Generally each filesystem has its own development tree.  All the information is
in MAINTAINERS.  hfs and hfsplus are unmaintained, though.

Maybe try asking Andrew Morton to apply the hfs and hfsplus patches, and any
others that don't get applied, as "maintainer of last resort".

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
