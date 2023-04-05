Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF856D8A65
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Apr 2023 00:11:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkBLM-00067t-0f;
	Wed, 05 Apr 2023 22:11:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1pkBLA-00067a-Bo
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 22:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B//xqY4ihi9FjKHnI/3HItAd5zkVskGSEhbTE9KO+uM=; b=CetbPSP+mVxkTS1LGoKtuwNEiY
 VrYgPsR95eKDdgP2J0/dkwgTNKbuhACZ2EuTdk+uu+XRAReI32NiMusrppDS2Suut0bDi381XNcb2
 q6jWapMBoNwd2jXqlCiFrVY9rLq0oOgF/pKxMi0IS+6/97AOcRMzFxiN3K1QQaSNYYBg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B//xqY4ihi9FjKHnI/3HItAd5zkVskGSEhbTE9KO+uM=; b=HX1aOLj8G78Q0KjlvBMeqySP0l
 20tTCXKOI8QfQN7TsOxESII4WSbg0h8aDvqxKuLMCu9Myc58+lAO6EQD4yUKBVkrbvg49roIxWJW5
 HxGrG69QoApm/D9AvTGizYqkwTkkuCzSMXU8tE0OwTdP0Y0cmMfBtF3V+BT2/rT2jUTU=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pkBL6-00GKSw-Tq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 22:10:51 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so38722494pjt.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Apr 2023 15:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20210112.gappssmtp.com; s=20210112; t=1680732643;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B//xqY4ihi9FjKHnI/3HItAd5zkVskGSEhbTE9KO+uM=;
 b=STgTGHnum63TLfzSA43g0jKvWgwzTlnLbiRBsWUDeVndg2q0Tgh+Q3SOrbj2o7vE8S
 OqWTQe02GPPEl+JqPtH+BqPfmvs//jeLjVwIl0XhMyQ3tek4wkSILn+nMJgz4Ucj0eU6
 j0kbTbgibsNwkwrKvah9VMelOuBXgvxgwHI0pALQfzh2rVeht1RKj8+pbzrOR/bp501l
 L/VGUA0YqBD4tzXgV0KmZb3YviN4H/dsXP/5STmaPKBN43t4NUaSN54t71hCcI0H1oaq
 zP9YTNcdWyFHeWlBYJ4HXGKqXy09Gf/KRy8kJqqXI11hkg8FYce95UQ1oCAGXdz0Kzst
 BsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680732643;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B//xqY4ihi9FjKHnI/3HItAd5zkVskGSEhbTE9KO+uM=;
 b=JBGfuIpYx/BExEmQ+lB51jYEVKlCmNK+ylJIYni0XfdswmPstdgOMCawKq5xQ+9lq+
 drMVwMsMeHwwgRcMmx8yIdyNL40cgYZlQ+x2Zn1kyCAnAAqKiIe7nmG9fI/xQ9ohAgLb
 /3CyBKY2kzMSKbNPyHWYsD0CwuDM1o7BhguzSAIu5UQEYVJ6sp02JmezkWNUoedxtmr5
 1Q1QlHbH7rU9wfyBHH8oWjek0vKpBq6phW5u9PxA1mjwsOiYF/Pq7g1LWrfXrWBKLYwS
 76YhkeN+Kyaw6O/2oRczRBoSUtXglrce9H/IBBpLxjp2Sf0X75Kys9JhL3eJaPcM3Zv4
 qhxg==
X-Gm-Message-State: AAQBX9druQpQl+X3NOdBcAnaYqnLrPX05UNrAIJTMNWIYFqhoZD/SBJP
 WpFOl66/73JFDc7pxHnLEcAXTg==
X-Google-Smtp-Source: AKy350bUfWmomBUgOSKakyDoihBlbriDnLkKr+maH+SmOymveI4bbkcZZJHlbNIaaMvcTwEjmj518w==
X-Received: by 2002:a05:6a20:b213:b0:e1:2d3d:6b11 with SMTP id
 eh19-20020a056a20b21300b000e12d3d6b11mr798344pzb.11.1680732643261; 
 Wed, 05 Apr 2023 15:10:43 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-91-157.pa.nsw.optusnet.com.au.
 [49.181.91.157]) by smtp.gmail.com with ESMTPSA id
 f9-20020a631009000000b004ff6b744248sm9594682pgl.48.2023.04.05.15.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 15:10:42 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pkBKx-00HUPP-6E; Thu, 06 Apr 2023 08:10:39 +1000
Date: Thu, 6 Apr 2023 08:10:39 +1000
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230405221039.GP3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-20-aalbersh@redhat.com>
 <20230404161047.GA109974@frogsfrogsfrogs>
 <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
 <20230405150927.GD303486@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405150927.GD303486@frogsfrogsfrogs>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 08:09:27AM -0700, Darrick J. Wong
 wrote: > On Wed, Apr 05, 2023 at 05:01:42PM +0200, Andrey Albershteyn wrote:
 > > On Tue, Apr 04, 2023 at 09:10:47AM -0700, Darrick J. Wong wro [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.46 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pkBL6-00GKSw-Tq
Subject: Re: [f2fs-dev] [PATCH v2 19/23] xfs: disable direct read path for
 fs-verity sealed files
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
Cc: fsverity@lists.linux.dev, hch@infradead.org, jth@kernel.org,
 agruenba@redhat.com, linux-ext4@vger.kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, damien.lemoal@opensource.wdc.com,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 05, 2023 at 08:09:27AM -0700, Darrick J. Wong wrote:
> On Wed, Apr 05, 2023 at 05:01:42PM +0200, Andrey Albershteyn wrote:
> > On Tue, Apr 04, 2023 at 09:10:47AM -0700, Darrick J. Wong wrote:
> > > On Tue, Apr 04, 2023 at 04:53:15PM +0200, Andrey Albershteyn wrote:
> > > > The direct path is not supported on verity files. Attempts to use direct
> > > > I/O path on such files should fall back to buffered I/O path.
> > > > 
> > > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > > ---
> > > >  fs/xfs/xfs_file.c | 14 +++++++++++---
> > > >  1 file changed, 11 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> > > > index 947b5c436172..9e072e82f6c1 100644
> > > > --- a/fs/xfs/xfs_file.c
> > > > +++ b/fs/xfs/xfs_file.c
> > > > @@ -244,7 +244,8 @@ xfs_file_dax_read(
> > > >  	struct kiocb		*iocb,
> > > >  	struct iov_iter		*to)
> > > >  {
> > > > -	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
> > > > +	struct inode		*inode = iocb->ki_filp->f_mapping->host;
> > > > +	struct xfs_inode	*ip = XFS_I(inode);
> > > >  	ssize_t			ret = 0;
> > > >  
> > > >  	trace_xfs_file_dax_read(iocb, to);
> > > > @@ -297,10 +298,17 @@ xfs_file_read_iter(
> > > >  
> > > >  	if (IS_DAX(inode))
> > > >  		ret = xfs_file_dax_read(iocb, to);
> > > > -	else if (iocb->ki_flags & IOCB_DIRECT)
> > > > +	else if (iocb->ki_flags & IOCB_DIRECT && !fsverity_active(inode))
> > > >  		ret = xfs_file_dio_read(iocb, to);
> > > > -	else
> > > > +	else {
> > > > +		/*
> > > > +		 * In case fs-verity is enabled, we also fallback to the
> > > > +		 * buffered read from the direct read path. Therefore,
> > > > +		 * IOCB_DIRECT is set and need to be cleared
> > > > +		 */
> > > > +		iocb->ki_flags &= ~IOCB_DIRECT;
> > > >  		ret = xfs_file_buffered_read(iocb, to);
> > > 
> > > XFS doesn't usually allow directio fallback to the pagecache. Why
> > > would fsverity be any different?
> > 
> > Didn't know that, this is what happens on ext4 so I did the same.
> > Then it probably make sense to just error on DIRECT on verity
> > sealed file.
> 
> Thinking about this a little more -- I suppose we shouldn't just go
> breaking directio reads from a verity file if we can help it.  Is there
> a way to ask fsverity to perform its validation against some arbitrary
> memory buffer that happens to be fs-block aligned?

The memory buffer doesn't even need to be fs-block aligned - it just
needs to be a pointer to memory the kernel can read...

We also need fsverity to be able to handle being passed mapped
kernel memory rather than pages/folios for the merkle tree
interfaces. That way we can just pass it the mapped buffer memory
straight from the xfs-buf and we don't have to do the whacky "copy
from xattr xfs_bufs into pages so fsverity can take temporary
reference counts on what it thinks are page cache pages" as it walks
the merkle tree.

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
