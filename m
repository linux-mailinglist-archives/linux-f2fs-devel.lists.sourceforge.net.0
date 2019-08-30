Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CE5A3876
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2019 15:59:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3hQb-0007KT-Gp; Fri, 30 Aug 2019 13:59:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <arndbergmann@gmail.com>)
 id 1i3hQa-0007Jn-Kf; Fri, 30 Aug 2019 13:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wZh0lrnnbveFd2ktjNoW+9Y7+KeLBrFI15hkdhrfg8w=; b=jD1TVuJqjJv508sFz8w3ngCmQl
 9e+NLiS+MS1Sy9T6Huau2pRFs9sa0+xadGhdMbaLlJayJK0+QCTftPmSU6yYORCvidzh8NU73iKLg
 +37yRj88C6NjybX/LQIFwiq4xhkV+389rljYQTZ7aXDSTb3wuHnL+R7rb0LYk3PgOx2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wZh0lrnnbveFd2ktjNoW+9Y7+KeLBrFI15hkdhrfg8w=; b=H3Z0Lm927jP7nIbjuOxZ1aQMkW
 dydta/NcaCJSOotqGTBrvhh39VEPhKPjoH5mMpE6bdnKz1ZSXlLI4PQvQJnH+Y06Uzbh2aN8aVbgj
 COlli+8UVgHq8vlkEQ2cn1JgTCfCyttPo6PVcfNy6llDldZT2pEIqp1P+HyknvP5qlkY=;
Received: from mail-qk1-f194.google.com ([209.85.222.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i3hQY-00408Q-KI; Fri, 30 Aug 2019 13:59:00 +0000
Received: by mail-qk1-f194.google.com with SMTP id i78so4739675qke.11;
 Fri, 30 Aug 2019 06:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wZh0lrnnbveFd2ktjNoW+9Y7+KeLBrFI15hkdhrfg8w=;
 b=LcTUfquzZP5VOzN1ERz/ZL59Iot1YS2dP+HbqARe1y+qbODmyqirUc2V/kUYEGCRyc
 wd1KaCv5q+gwGneE9HqvGv6gZByQBiLef2KSQrZwwu22s4a8BhTQAnn75c2pvKDIfBER
 bO+843LwCYAAi0IfcQTxOLz4QaTpGx44Jjyt+aZGzxLeMacaeIyM2xOjBfnEZ/s6MXaQ
 oq1TWkJmydAStPqBA4V5IoHADNuEjNTSYrQF8ku7K21NUZjyZdrjtL+pCbC3rKTXAqfG
 dpEUS+qW9wRqjr6Xsr0kWO9tmrN00NNOVKWs8dBRlRpdNOZ7oMgijZ3Uwm6V5PHPv6lq
 iftw==
X-Gm-Message-State: APjAAAWzsyFfl6duliqCIUqUXNfhuwUV4FXMr8TWFQDeppIT8P6P2nDE
 11r54WbZGdGYUC0a9BeUU0ypHbbLYDr77nZHz9M=
X-Google-Smtp-Source: APXvYqwLJSfUvFHYpnCbLtQwiLesqk6Up0F09OxCEWeJS/zvGXm8TGjLQauibK2uyX+MPGtGJJXtticB+OlivKMyzRQ=
X-Received: by 2002:a37:4b0d:: with SMTP id y13mr15306907qka.3.1567173532434; 
 Fri, 30 Aug 2019 06:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
 <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
 <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
 <CABeXuvpe9vADLZUr4zHrH0izt=1BaLQvBMxAu=T1A2CV3AN4vA@mail.gmail.com>
In-Reply-To: <CABeXuvpe9vADLZUr4zHrH0izt=1BaLQvBMxAu=T1A2CV3AN4vA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 30 Aug 2019 15:58:35 +0200
Message-ID: <CAK8P3a0NMUv2xOw=fCxJXo_2wbmBMG24Fst3U1LT-m7C8uxz0w@mail.gmail.com>
To: Deepa Dinamani <deepa.kernel@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.194 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (arndbergmann[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.194 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: anl.gov]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i3hQY-00408Q-KI
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
 Dave Kleikamp <shaggy@kernel.org>, Anders Larsen <al@alarsen.net>,
 Bob Copeland <me@bobcopeland.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, mikulas@artax.karlin.mff.cuni.cz,
 stoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>,
 Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org, "Yan,
 Zheng" <zyan@redhat.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Richard Weinberger <richard@nod.at>, Steve French <sfrench@samba.org>,
 Anton Vorontsov <anton@enomsg.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, codalist@coda.cs.cmu.edu,
 Christoph Hellwig <hch@infradead.org>, coda@cs.cmu.edu,
 V9FS Developers <v9fs-developer@lists.sourceforge.net>,
 Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>, salah.triki@gmail.com,
 asmadeus@codewreck.org, devel@lists.orangefs.org,
 Evgeniy Dushistov <dushistov@mail.ru>, Kees Cook <keescook@chromium.org>,
 Eric Van Hensbergen <ericvh@gmail.com>, Jan Kara <jack@suse.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, aivazian.tigran@gmail.com,
 phillip@squashfs.org.uk, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>,
 trond.myklebust@hammerspace.com, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Dilger <adilger@dilger.ca>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-ntfs-dev@lists.sourceforge.net,
 Greg KH <gregkh@linuxfoundation.org>, linux-karma-devel@lists.sourceforge.net,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs <linux-xfs@vger.kernel.org>, Colin Cross <ccross@android.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 30, 2019 at 4:02 AM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> On Thu, Aug 29, 2019 at 6:20 PM Mike Marshall <hubcap@omnibond.com> wrote:
> >
> > Hi Deepa...
> >
> > I installed this patch series on top of Linux 5.3-rc6 and ran xfstests
> > on orangefs and got a regression... generic/258 failed
> > with: "Timestamp wrapped"...
> >
> > # cat results/generic/258.out.bad
> > QA output created by 258
> > Creating file with timestamp of Jan 1, 1960
> > Testing for negative seconds since epoch
> > Timestamp wrapped: 0
> > Timestamp wrapped
> > (see /home/hubcap/xfstests-dev/results//generic/258.full for details)
>
> Note that patch [16/20] https://lkml.org/lkml/2019/8/18/193 assumes
> that orangefs does not support negative timestamps.
> And, the reason was pointed out in the commit text:
>
> ----------------------
> Assume the limits as unsigned according to the below
> commit 98e8eef557a9 ("changed PVFS_time from int64_t to uint64_t")
> in https://github.com/waltligon/orangefs
>
> Author: Neill Miller <neillm@mcs.anl.gov>
> Date:   Thu Sep 2 15:00:38 2004 +0000
> --------------------
>
> So the timestamp being wrapped to 0 in this case is correct behavior
> according to my patchset.
> The generic/258 assumes that the timestamps can be negative. If this
> is not true then it should not be run for this fs.
>
> But, if you think the timestamp should support negative timestamps for
> orangefs, I'd be happy to change it.

I think it's unclear from the orangefs source code what the intention is,
as there is a mixed of signed and unsigned types used for the inode
stamps:

#define encode_PVFS_time encode_int64_t
#define encode_int64_t(pptr,x) do { \
    *(int64_t*) *(pptr) = cpu_to_le64(*(x)); \
    *(pptr) += 8; \
} while (0)
#define decode_PVFS_time decode_int64_t
#define decode_int64_t(pptr,x) do { \
    *(x) = le64_to_cpu(*(int64_t*) *(pptr)); \
    *(pptr) += 8; \
} while (0)

This suggests that making it unsigned may have been an accident.

Then again,  it's clearly and consistently printed as unsigned in
user space:

        gossip_debug(
            GOSSIP_GETATTR_DEBUG, " VERSION is %llu, mtime is %llu\n",
            llu(s_op->attr.mtime), llu(resp_attr->mtime));

A related issue I noticed is this:

PVFS_time PINT_util_mktime_version(PVFS_time time)
{
    struct timeval t = {0,0};
    PVFS_time version = (time << 32);

    gettimeofday(&t, NULL);
    version |= (PVFS_time)t.tv_usec;
    return version;
}
PVFS_time PINT_util_mkversion_time(PVFS_time version)
{
    return (PVFS_time)(version >> 32);
}
static PINT_sm_action getattr_verify_attribs(
        struct PINT_smcb *smcb, job_status_s *js_p)
{
...
    resp_attr->mtime = PINT_util_mkversion_time(s_op->attr.mtime);
...
}

which suggests that at least for some purposes, the mtime field
is only an unsigned 32-bit number (1970..2106). From my readiing,
this affects the on-disk format, but not the protocol implemented
by the kernel.

atime and ctime are apparently 64-bit, but mtime is only 32-bit
seconds, plus a 32-bit 'version'. I suppose the server could be
fixed to allow a larger range, but probably would take it out of
the 'version' bits, not the upper half.

To be on the safe side, I suppose the kernel can only assume
an unsigned 32-bit range to be available. If the server gets
extended beyond that, it would have to pass a feature flag.

     Arnd


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
