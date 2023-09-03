Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE782790EFC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Sep 2023 00:31:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qcvcd-0007BP-RS;
	Sun, 03 Sep 2023 22:31:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1qcvcc-0007BE-It
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Sep 2023 22:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nv6YpToDNZJcA/Ccz8YHJKQ8zE37n7OYKvDh05ivZ8M=; b=I9S8q88p1NrB0Q7XfAiqkZFHAo
 HaG7cdPJjpJ9PYtd7BEfZhtAP3rJnTwSvIxDEdlf6NnSwcHKLSi9ffuOvM84Qbevmm9l+/8q2t+IT
 VsEZ97MpBJf83tqO4seqgUnnyGNhtWdySRgdYha/JZRppanFh8eZRJr2ot3MvGSZCxAM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nv6YpToDNZJcA/Ccz8YHJKQ8zE37n7OYKvDh05ivZ8M=; b=WAuxZrSchlZWu0B9n23Y8NtElS
 fHH0MlPIfF+gPZNhBAJPvzdQ95Q6fvBohCIDRwgVY8mEn8x211GnwxBg0ZSuGeEqhnwbGkTvUW26X
 JB7QZ4wA4KFjI+apO1Zsf9vSoDiPu6dVhkwqBtgyHKn9aoB4X3wn4GN3jqW+mjc1rH6k=;
Received: from mail-oa1-f51.google.com ([209.85.160.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qcvcS-0001Hn-PK for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Sep 2023 22:31:09 +0000
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-1c4cf775a14so781418fac.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 03 Sep 2023 15:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1693780255; x=1694385055;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Nv6YpToDNZJcA/Ccz8YHJKQ8zE37n7OYKvDh05ivZ8M=;
 b=3FBboo7vMoI+7NQD5jDZZr/HvUccF6fZtJAsL93BpX2MHFIA8qSXjyup7atJmGiq8Z
 +Uj6eLz+mf3c9CfxDFvZHJf9pmC+GCBxvXFoljHEsHCIq03PAG02dZymvGOsrxQKQUVK
 SSDw2EziU9julWp39ZT1uvWOEdDKthOj9PJywlm97ja3X7ysntK2nEYHys0oiPhcHj7i
 95c+W+eV+DE4p5816KcowTspiyBSpn/M66P1kbxueS1m7aZd9lmZYHNEMM8UeKKFNHOA
 5n90QOl1UXg2OSN6GZJzfC08oo1z5y/UjwoTBEJ9ppGSfDXLJqYtaSQKPDmZZq12tQOn
 d6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693780255; x=1694385055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nv6YpToDNZJcA/Ccz8YHJKQ8zE37n7OYKvDh05ivZ8M=;
 b=bge/XaNHETcI7J9vtA1bA/MbPA8DnHgezuZRK+TZsGbQfTNk6kN20k2EZOo37zwJkc
 /aahzhirqbcqVLkCfcPVZ6j8X+3Jg6nCTfHeqNX91rz25toLoriZbhAv1UFS+q50Yp14
 1yRC/+mshJC4jJ/t/35TVzfjYgg6QIx4eA84Gw4q4Vtid3OLDdbzsV5NSBoinyt+a1On
 mYxxa1MZ4U/w3kMvmjD9m9q7KltxAz1gj5uHYLytv+reJIEwbt3xabbg8h2AsNTNS9SU
 bM9ZSdK/z+NXr1u1QPeWitkhCN6evMNZSVPD0femZfvGZ8MoqQshPyi77aQkH5hANdrV
 i8Qw==
X-Gm-Message-State: AOJu0YxezD1sVhzxic9DmvlB0EwhledhTvBoRi3Syvcp84NEBfahSfSr
 L1WGhD6thdZNUfCZK+WNk/Ok8A==
X-Google-Smtp-Source: AGHT+IGLu9Ypqvz2HQH6Ke2apJHDtGTD5ZHmV6+9u1MT+8XuCmbNG2jkA6AQg79Zc5mY+kWQOWShIA==
X-Received: by 2002:a05:6870:568d:b0:1be:c8e2:3ec3 with SMTP id
 p13-20020a056870568d00b001bec8e23ec3mr11536784oao.14.1693780255066; 
 Sun, 03 Sep 2023 15:30:55 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 i15-20020a63bf4f000000b00565e96d9874sm5648132pgo.89.2023.09.03.15.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 15:30:54 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qcvcK-00ASFy-0F;
 Mon, 04 Sep 2023 08:30:52 +1000
Date: Mon, 4 Sep 2023 08:30:52 +1000
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZPUJHAKzxvXiEDYA@dread.disaster.area>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
 <ZOvA5DJDZN0FRymp@casper.infradead.org>
 <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
 <ZO3cI+DkotHQo3md@casper.infradead.org>
 <642de4e6-801d-fcad-a7ce-bfc6dec3b6e5@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <642de4e6-801d-fcad-a7ce-bfc6dec3b6e5@linux.dev>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 30, 2023 at 02:11:31PM +0800, Hao Xu wrote: >
 On 8/29/23 19:53, Matthew Wilcox wrote: > > On Tue, Aug 29, 2023 at 03:46:13PM
 +0800, Hao Xu wrote: > > > On 8/28/23 05:32, Matthew Wilcox wro [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.51 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qcvcS-0001Hn-PK
Subject: Re: [f2fs-dev] [PATCH 07/11] vfs: add nowait parameter for
 file_accessed()
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, codalist@coda.cs.cmu.edu,
 cluster-devel@redhat.com, linux-cachefs@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 30, 2023 at 02:11:31PM +0800, Hao Xu wrote:
> On 8/29/23 19:53, Matthew Wilcox wrote:
> > On Tue, Aug 29, 2023 at 03:46:13PM +0800, Hao Xu wrote:
> > > On 8/28/23 05:32, Matthew Wilcox wrote:
> > > > On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
> > > > > From: Hao Xu <howeyxu@tencent.com>
> > > > > 
> > > > > Add a boolean parameter for file_accessed() to support nowait semantics.
> > > > > Currently it is true only with io_uring as its initial caller.
> > > > 
> > > > So why do we need to do this as part of this series?  Apparently it
> > > > hasn't caused any problems for filemap_read().
> > > > 
> > > 
> > > We need this parameter to indicate if nowait semantics should be enforced in
> > > touch_atime(), There are locks and maybe IOs in it.
> > 
> > That's not my point.  We currently call file_accessed() and
> > touch_atime() for nowait reads and nowait writes.  You haven't done
> > anything to fix those.
> > 
> > I suspect you can trim this patchset down significantly by avoiding
> > fixing the file_accessed() problem.  And then come back with a later
> > patchset that fixes it for all nowait i/o.  Or do a separate prep series
> 
> I'm ok to do that.
> 
> > first that fixes it for the existing nowait users, and then a second
> > series to do all the directory stuff.
> > 
> > I'd do the first thing.  Just ignore the problem.  Directory atime
> > updates cause I/O so rarely that you can afford to ignore it.  Almost
> > everyone uses relatime or nodiratime.
> 
> Hi Matthew,
> The previous discussion shows this does cause issues in real
> producations: https://lore.kernel.org/io-uring/2785f009-2ebb-028d-8250-d5f3a30510f0@gmail.com/#:~:text=fwiw%2C%20we%27ve%20just%20recently%20had%20similar%20problems%20with%20io_uring%20read/write
> 

Then separate it out into it's own patch set so we can have a
discussion on the merits of requiring using noatime, relatime or
lazytime for really latency sensitive IO applications. Changing code
is not always the right solution...

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
