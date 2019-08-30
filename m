Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8565DA2C8B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2019 04:02:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3WFG-0001bx-S9; Fri, 30 Aug 2019 02:02:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <deepa.kernel@gmail.com>)
 id 1i3WFF-0001bX-FO; Fri, 30 Aug 2019 02:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oLvzfsj88KL7STQQplyqqS42g24w/uMRduFS4XzvSOo=; b=fJ3RcsE65hFVciRBlXfCHhVxfX
 chykThCpwHqCSZIEKUWnbfMRN2SFgXQaD5yis80OJvJushsk0eberbRfIoduqrxhZB/94lnucMfvm
 p9SK8bxcJFwi+9V08EeYvvAwZnDGx7njT9IkN42mOJzZvl3pifXAy38rgiZYgxL3g5sk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oLvzfsj88KL7STQQplyqqS42g24w/uMRduFS4XzvSOo=; b=W4U5/bfmamBoFWdPvK7TWp5q7X
 WDRefdqjOkmcxoYD3PQF1dbiQOnhRNhB2rEtJoBglqdD1/DNBYcCx9n9ORGZkm/pMn9dMD9vWCV7t
 mcPTDoEUEPY9kMNI9Ev2iiWTwELXNwQkl+uoLWXIVKLahvjLol/p1+zbRsA5EaNFol2k=;
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i3WFD-008gGZ-TC; Fri, 30 Aug 2019 02:02:33 +0000
Received: by mail-io1-f65.google.com with SMTP id t3so10866955ioj.12;
 Thu, 29 Aug 2019 19:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oLvzfsj88KL7STQQplyqqS42g24w/uMRduFS4XzvSOo=;
 b=SUiSI+Km3m50gBNp/Vf1kQ5Znt7t2xjJr9IjLemKNMiLxz2yhpZsbK/DLZC4L9urNb
 gDxuG7f7XtiecI937GfbQdq+jdln7Z3Fb+8kZnJxwlPpeYQImuMwhjHoDEP857mW1lVb
 NZHRIybWwFHnsioflZzUdQfkXgsEf/TexqY+05N8IO8NvnMnQftjfJ9hFazxqlx7VQO+
 BZ2rZ7/dbzo90ZAvtO0lvvso+7mGgwA9kdlEC7uFLAulP9R+MYUVIvG8IxPGPXul5/em
 IvII12CYogidxhoNLSBGFsf9ZguQCTMWCWKe+z44xwiHPHukomi7gttk607Xpy0ogB0G
 kuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oLvzfsj88KL7STQQplyqqS42g24w/uMRduFS4XzvSOo=;
 b=FSwt/93zvwkLhHKScWt3pR3pCqXl5d8HZoG30/XoMJM/UJGXiTwi92jXiUFcFM4neT
 ehylAgGaALFvME9G6Sq0bFVN2dLcUPJufhEc3tB7BsqQ7VeurVcfAT2MjodHuKyYesIH
 Ck8p2qOy/Di/Q4rHXliSZ+i1lKdXB+LOXORrB7XNIj49VJ1Ex5edFT+IjaickJUc1i4g
 O18Y7mvuFTDIAgTirBX5dQH5mhq9caOYdBk+dteqhT/iLdPwCeWo5/En8EqbM0J4TtF6
 TgM8Zssy9ViKAJLSIaYq5Ncwyk/q+Zeyzvveib25UMxYoy50oqBlqlubAxV/b1NIpPOj
 dEiQ==
X-Gm-Message-State: APjAAAXhUbWC1rQ1SGzxDzGqqBge9kR2Un0mFMwf+/xfQtHsSQdScNWS
 bntc4qJOBXeEqWDw8v0+5uiAV28A5PIDJh+kFho=
X-Google-Smtp-Source: APXvYqzBsNh7crucvVXKqn/eA6ggQob01fCf1ZKTT3BSHFJDqk3FlwYnF1wm6BwegRm/uQfEg9JQEGStTj+fA+RuGsU=
X-Received: by 2002:a5d:8599:: with SMTP id f25mr9602181ioj.265.1567130545941; 
 Thu, 29 Aug 2019 19:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
 <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
 <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
In-Reply-To: <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Thu, 29 Aug 2019 19:02:13 -0700
Message-ID: <CABeXuvpe9vADLZUr4zHrH0izt=1BaLQvBMxAu=T1A2CV3AN4vA@mail.gmail.com>
To: Mike Marshall <hubcap@omnibond.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: omnibond.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (deepa.kernel[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1i3WFD-008gGZ-TC
Subject: Re: [f2fs-dev] [GIT PULL] vfs: Add support for timestamp limits
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
 Martin Brandenburg <martin@omnibond.com>, jfs-discussion@lists.sourceforge.net,
 Dave Kleikamp <shaggy@kernel.org>, al@alarsen.net,
 Bob Copeland <me@bobcopeland.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, mikulas@artax.karlin.mff.cuni.cz,
 stoph Hellwig <hch@lst.de>, nico@fluxnic.net, linux-cifs@vger.kernel.org, "Yan,
 Zheng" <zyan@redhat.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Richard Weinberger <richard@nod.at>, Steve French <sfrench@samba.org>,
 Anton Vorontsov <anton@enomsg.org>, linux@armlinux.org.uk,
 codalist@coda.cs.cmu.edu, Christoph Hellwig <hch@infradead.org>,
 coda@cs.cmu.edu, V9FS Developers <v9fs-developer@lists.sourceforge.net>,
 Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>, salah.triki@gmail.com,
 asmadeus@codewreck.org, devel@lists.orangefs.org,
 Evgeniy Dushistov <dushistov@mail.ru>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Eric Van Hensbergen <ericvh@gmail.com>,
 Jan Kara <jack@suse.com>, reiserfs-devel@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 aivazian.tigran@gmail.com, phillip@squashfs.org.uk,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel <ceph-devel@vger.kernel.org>, trond.myklebust@hammerspace.com,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Dilger <adilger@dilger.ca>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 luisbg@kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-ntfs-dev@lists.sourceforge.net, Greg KH <gregkh@linuxfoundation.org>,
 linux-karma-devel@lists.sourceforge.net, jlayton@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Colin Cross <ccross@android.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Aug 29, 2019 at 6:20 PM Mike Marshall <hubcap@omnibond.com> wrote:
>
> Hi Deepa...
>
> I installed this patch series on top of Linux 5.3-rc6 and ran xfstests
> on orangefs and got a regression... generic/258 failed
> with: "Timestamp wrapped"...
>
> # cat results/generic/258.out.bad
> QA output created by 258
> Creating file with timestamp of Jan 1, 1960
> Testing for negative seconds since epoch
> Timestamp wrapped: 0
> Timestamp wrapped
> (see /home/hubcap/xfstests-dev/results//generic/258.full for details)

Note that patch [16/20] https://lkml.org/lkml/2019/8/18/193 assumes
that orangefs does not support negative timestamps.
And, the reason was pointed out in the commit text:

----------------------
Assume the limits as unsigned according to the below
commit 98e8eef557a9 ("changed PVFS_time from int64_t to uint64_t")
in https://github.com/waltligon/orangefs

Author: Neill Miller <neillm@mcs.anl.gov>
Date:   Thu Sep 2 15:00:38 2004 +0000
--------------------

So the timestamp being wrapped to 0 in this case is correct behavior
according to my patchset.
The generic/258 assumes that the timestamps can be negative. If this
is not true then it should not be run for this fs.

But, if you think the timestamp should support negative timestamps for
orangefs, I'd be happy to change it.

> Just to double check, I compiled Linux 5.3-rc6 without the timestamp series,
> and 258 passed... then added the patch series back and the failure returned...
>
> Also.... when I was using "git am" to apply the patch series, the ceph patch
> failed, so I "git skipped" it...

My series applies cleanly against linux-next as of yesterday.

-Deepa


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
