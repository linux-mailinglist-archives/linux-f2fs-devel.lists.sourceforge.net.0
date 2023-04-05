Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C236D8B28
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Apr 2023 01:38:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkChd-0006MW-NI;
	Wed, 05 Apr 2023 23:38:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1pkChb-0006MQ-RD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 23:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KeGD4MyOApqEcxE+Vz2Xa5S1sUVL6ion9IBrFVNam5c=; b=XTP52kfsdfHTIkJ23ifZ0YVJAF
 +kRDpPRSwPR3Wmt7Ih0c9/8obi5LL1XLs7vxCFnyQlShXLrRh/6FnbXOKlSmEuT7nuE1dS238UXBU
 hvW6P6EM8gbnLa71TclAzPF37cZLNYTIwvz529rZU7Z2j+pHf2N3TsgX9QLdEs5QaTm4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KeGD4MyOApqEcxE+Vz2Xa5S1sUVL6ion9IBrFVNam5c=; b=STMkD/8UW0mdObwuf1ZWAlG9sY
 C58eAcicCvQvtJROLxdqLNWnt984defdzG6NtrbKjL46r1m6YSpF6jDxsRVa2FUBlvQJl+DboLw5x
 uJxUXOQNfg2bUfWN0mkVk+nJoByLs55ZyU8T5DeJSceV/UUenqwciy8LQZ6PWdbgemUY=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pkChX-00GNVn-Ni for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 23:38:08 +0000
Received: by mail-pl1-f171.google.com with SMTP id z19so35916238plo.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Apr 2023 16:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20210112.gappssmtp.com; s=20210112; t=1680737878;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KeGD4MyOApqEcxE+Vz2Xa5S1sUVL6ion9IBrFVNam5c=;
 b=D9eCnKz/gG785yZ8Q0D0djMKMM/E6/FuIQMZkQe8yluN15Jtjl0WWLOX4IStp1C08L
 ItwEOh3AAXqKT/go24yRu3jS9GEYP+RP1nIZ+ZUZ+36mLFGGnPtXnVp01qMubeetVlAT
 b1hUJBs9OwkoomuM/1FLNornI+OpXF5L4L2+EHnE4nGJkMzNH6gzX39Mc7QTt2rtNoBb
 CsEf1v/fsFm5Z4vQaq6Oj8nYtZDTfrfkrYDIuJzfPNYQKkUbyMT8xJAr1SONze5Mr4dD
 dAIDN3VJ7CZcdTCJWV8kuCxhdA4u3XpgHMql+i+7pGTnpuEnDUYZzncmOgq7jMsH5S04
 G4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680737878;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KeGD4MyOApqEcxE+Vz2Xa5S1sUVL6ion9IBrFVNam5c=;
 b=x3s+iGFt18Zpf69jSBzALei+pllEoXUb7sk/5QK8nS4690Uo6xvNYf4XV0eXkoUylQ
 Jz5lWhOGTkboD2hrf4ySuPzpNWmo+f2H2B+P1j327pUWfdOmkrKLuXqIFKnsjyt6Uyw9
 HnZ4jPM8pID27BOHKdCLyEOB3lwCJNeSvP6P7SVvJNO7fyxu5sYp4xtvDQqTvngHSp9b
 8H4izcI0cMv/FZkAXc3OrWxOxmdyAsBsYYi2QUsQBGRypvJirerEKDn7lAfQ3c0M2bNY
 6dOw02G95gZKj/YdVCOzyxUqfnBhuiw2cBWEOT3M0ZlozaIKSuarysWOA21SbwcfmlGI
 RkvA==
X-Gm-Message-State: AAQBX9cWdkuIzInIwzkj0Ik/tCCExQq9esHy7YOAG9PvuUk6hLou5mtF
 A8e2PSH3mXkCSZcVomGG3H+o1GgVkYRtxdw/GeE=
X-Google-Smtp-Source: AKy350YPpczm2kLshRHm378imxeqOrGuMhMZKLP5TqBhKu/vDXjqcxQbAmKQSkLGeQMyYt/kagueXA==
X-Received: by 2002:a05:6a20:bc96:b0:d9:18ab:16be with SMTP id
 fx22-20020a056a20bc9600b000d918ab16bemr883843pzb.29.1680737878121; 
 Wed, 05 Apr 2023 16:37:58 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-91-157.pa.nsw.optusnet.com.au.
 [49.181.91.157]) by smtp.gmail.com with ESMTPSA id
 m37-20020a635825000000b00502dc899394sm9641716pgb.66.2023.04.05.16.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 16:37:57 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pkChN-00HVv9-Mh; Thu, 06 Apr 2023 09:37:53 +1000
Date: Thu, 6 Apr 2023 09:37:53 +1000
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230405233753.GU3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404163602.GC109974@frogsfrogsfrogs>
 <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
 <20230405163847.GG303486@frogsfrogsfrogs>
 <ZC264FSkDQidOQ4N@gmail.com>
 <20230405222646.GR3223426@dread.disaster.area>
 <ZC38DkQVPZBuZCZN@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZC38DkQVPZBuZCZN@gmail.com>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 10:54:06PM +0000, Eric Biggers wrote:
 > On Thu, Apr 06, 2023 at 08:26:46AM +1000, Dave Chinner wrote: > > > We
 could certainly think about moving to a design where fs/verity/ a [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pkChX-00GNVn-Ni
Subject: Re: [f2fs-dev] [PATCH v2 21/23] xfs: handle merkle tree block size
 != fs blocksize != PAGE_SIZE
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
 linux-ext4@vger.kernel.org, agruenba@redhat.com,
 "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 05, 2023 at 10:54:06PM +0000, Eric Biggers wrote:
> On Thu, Apr 06, 2023 at 08:26:46AM +1000, Dave Chinner wrote:
> > > We could certainly think about moving to a design where fs/verity/ asks the
> > > filesystem to just *read* a Merkle tree block, without adding it to a cache, and
> > > then fs/verity/ implements the caching itself.  That would require some large
> > > changes to each filesystem, though, unless we were to double-cache the Merkle
> > > tree blocks which would be inefficient.
> > 
> > No, that's unnecessary.
> > 
> > All we need if for fsverity to require filesystems to pass it byte
> > addressable data buffers that are externally reference counted. The
> > filesystem can take a page reference before mapping the page and
> > passing the kaddr to fsverity, then unmap and drop the reference
> > when the merkle tree walk is done as per Andrey's new drop callout.
> > 
> > fsverity doesn't need to care what the buffer is made from, how it
> > is cached, what it's life cycle is, etc. The caching mechanism and
> > reference counting is entirely controlled by the filesystem callout
> > implementations, and fsverity only needs to deal with memory buffers
> > that are guaranteed to live for the entire walk of the merkle
> > tree....
> 
> Sure.  Just a couple notes:
> 
> First, fs/verity/ does still need to be able to tell whether the buffer is newly
> instantiated or not.

Boolean flag from the caller.

> Second, fs/verity/ uses the ahash API to do the hashing.  ahash is a
> scatterlist-based API.  Virtual addresses can still be used (see sg_set_buf()),
> but the memory cannot be vmalloc'ed memory, since virt_to_page() needs to work.
> Does XFS use vmalloc'ed memory for these buffers?

Not vmalloc'ed, but vmapped. we allocate the pages individually, but
then call vm_map_page() to present the higher level code with a
single contiguous memory range if it is a multi-page buffer.

We do have the backing info held in the buffer, and that's what we
use for IO. If fsverity needs a page based scatter/gather list
for hardware offload, it could ask the filesystem to provide it
for that given buffer...

> BTW, converting fs/verity/ from ahash to shash is an option; I've really never
> been a fan of the scatterlist-based crypto APIs!  The disadvantage of doing
> this, though, would be that it would remove support for all the hardware crypto
> drivers.
>
> That *might* actually be okay, as that approach to crypto acceleration
> has mostly fallen out of favor, in favor of CPU-based acceleration.  But I do
> worry about e.g. someone coming out of the woodwork and saying they need to use
> fsverity on a low-powered ARM board that has a crypto accelerator like CAAM, and
> they MUST use their crypto accelerator to get acceptable performance.

True, but we are very unlikely to be using XFS on such small
systems and I don't think we really care about XFS performance on
android sized systems, either.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
