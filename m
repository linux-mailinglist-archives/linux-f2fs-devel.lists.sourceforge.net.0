Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F64E474B4A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Dec 2021 19:57:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mxCyz-0000hU-48; Tue, 14 Dec 2021 18:57:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mxCyx-0000Pf-BP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Dec 2021 18:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LN/yvr8nIRcm5bqnFkatQzjEmUUL7NbS69uFFdNSAGQ=; b=PmdsgZKHKSxAd3cOD+CGiiL5iB
 6D120aIyah1VFLnNIzAz9KLiIZXdX1p5UfGy47wZp2GwxoO5jC8SIsfWFXOeEGVWextoLk5kqBX5y
 Bc3xtlJF/pWVVZKCgscBDW1x1W0YfGRrcguXMBTL6wNMHEpAJMoHIXLWUGX9WsRYMMCM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LN/yvr8nIRcm5bqnFkatQzjEmUUL7NbS69uFFdNSAGQ=; b=LcAEFC1M9LT4zd6QdioQipVfWA
 t4OtwjPNg6swQVgpYix5uB6HPFsTgoS0hfENBNK1iigIL3nXN/iqUvnFk5kMCj8bPU9AOIJobDyhQ
 uEu/nS/9lhV42dHgl9zFjDetYW6rUzNjsI6fnZZw86jaV8L8QilDRXjZbyaYQl/lFhzQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mxCyu-0007I4-PK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Dec 2021 18:57:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E1886168F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Dec 2021 18:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BD5C34600;
 Tue, 14 Dec 2021 18:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639508202;
 bh=Jku8PD9u6YzING5IrsfqdnR2FiqVRc94gowzLrYhrMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fw9jlfuXdFWgiyQU72FVE4aD8jsnJm4xaWFvKv5HNlAPPZXckXuxckbJO+7TvRYEc
 kftFJ8R0Wi7Qsk+YdUu7GHBp+4ScMp4jVYGudTnpDkDax06NwCNhtw3nWgsh/KqsO6
 +WJnvMFbnuE0tOtQ5U6XR1raxzfSVNGaiHlhRkGnMQ4miKf0deVqu8lpRrIQcoSsh6
 BX4FB+p3/JGdAxP6wAxQXYJhYtrLH66fYF5F1umuUKFpqRLhhjEsbRJTk80kgu7Ga7
 +QVoFjp8/2ilTY9aosC1Ry83Icfakl2RT7sbND+bOuKAVhAMiHmXQ1G0Xc+QvoJt7J
 0jM3H3lh1WEDg==
Date: Tue, 14 Dec 2021 10:56:41 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Ybjo6Zqpc7Wnev/r@google.com>
References: <20210928151911.11189-1-chao@kernel.org>
 <YVNoHudG5c65X85G@google.com>
 <65f6c366-9e5b-fe7f-7c38-061996d1882b@kernel.org>
 <dec765de-407b-07c3-75f6-ec7f71c618b7@kernel.org>
 <YXwyvllUOm6jLiF5@google.com>
 <3e653a3d-ddb9-e115-d871-3659a1ba5530@kernel.org>
 <96959788-73b2-6e9b-3aa7-b1e23e9da417@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96959788-73b2-6e9b-3aa7-b1e23e9da417@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/12, Chao Yu wrote: > Ping, > > On 2021/10/30 11:02,
 Chao Yu wrote: > > On 2021/10/30 1:43, Jaegeuk Kim wrote: > > > On 10/29,
 Chao Yu wrote: > > > > Ping, > > > > > > > > On 2021/9/29 8:05, Chao [...]
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mxCyu-0007I4-PK
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip f2fs_preallocate_blocks() for
 overwrite case
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/12, Chao Yu wrote:
> Ping,
> =

> On 2021/10/30 11:02, Chao Yu wrote:
> > On 2021/10/30 1:43, Jaegeuk Kim wrote:
> > > On 10/29, Chao Yu wrote:
> > > > Ping,
> > > > =

> > > > On 2021/9/29 8:05, Chao Yu wrote:
> > > > > On 2021/9/29 3:08, Jaegeuk Kim wrote:
> > > > > > On 09/28, Chao Yu wrote:
> > > > > > > In f2fs_file_write_iter(), let's use f2fs_overwrite_io() to
> > > > > > > check whethere it is overwrite case, for such case, we can sk=
ip
> > > > > > > f2fs_preallocate_blocks() in order to avoid f2fs_do_map_lock(=
),
> > > > > > > which may be blocked by checkpoint() potentially.
> > > > > > > =

> > > > > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > > > > ---
> > > > > > > =A0=A0 fs/f2fs/file.c | 4 ++++
> > > > > > > =A0=A0 1 file changed, 4 insertions(+)
> > > > > > > =

> > > > > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > > > > > index 13deae03df06..51fecb2f4db5 100644
> > > > > > > --- a/fs/f2fs/file.c
> > > > > > > +++ b/fs/f2fs/file.c
> > > > > > > @@ -4321,6 +4321,10 @@ static ssize_t f2fs_file_write_iter(st=
ruct kiocb *iocb, struct iov_iter *from)
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 preallocated =3D true;
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 target_size =3D iocb->ki_pos +=
 iov_iter_count(from);
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (f2fs_overwrite_io(inode, iocb->ki_=
pos,
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 iov_iter_count(from)))
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto write;
> > > > > > =

> > > > > > This calls f2fs_map_blocks() which can be duplicate, if it's no=
t the overwirte
> > > > > > case. Do we have other benefit?
> > > > > =

> > > > > f2fs_overwrite_io() will break for append write case w/ below che=
ck:
> > > > > =

> > > > > =A0 =A0=A0=A0=A0if (pos + len > i_size_read(inode))
> > > > > =A0 =A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > =

> > > > > I guess we may only suffer double f2fs_map_blocks() for write hole
> > > > > case, e.g. truncate to large size & write inside the filesize. For
> > > > > this case, how about adding a condition to allow double f2fs_map_=
blocks()
> > > > > only if write size is smaller than a threshold?
> > > =

> > > I still don't see the benefit much to do double f2fs_map_blocks. What=
 is the
> > > problem here?
> > =

> > There is potential hangtask happened during swapfile's writeback:
> > =

> > - loop_kthread_worker_fn
> >  =A0- kthread_worker_fn
> >  =A0 - loop_queue_work
> >  =A0=A0 - lo_rw_aio
> >  =A0=A0=A0 - f2fs_file_write_iter
> >  =A0=A0=A0=A0 - f2fs_preallocate_blocks
> >  =A0=A0=A0=A0=A0 - f2fs_map_blocks
> >  =A0=A0=A0=A0=A0=A0 - down_read
> >  =A0=A0=A0=A0=A0=A0=A0 - rwsem_down_read_slowpath
> >  =A0=A0=A0=A0=A0=A0=A0=A0 - schedule
> > =

> > I try to mitigate such issue by preallocating swapfile's block address =
and
> > avoid f2fs_do_map_lock() as much as possible in swapfile's writeback pa=
th...

How about checking i_blocks and i_size instead of checking the entire map?

> > =

> > Thanks,
> > =

> > > =

> > > > > =

> > > > > Thanks,
> > > > > =

> > > > > > =

> > > > > > > +
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 err =3D f2fs_preallocate_block=
s(iocb, from);
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (err) {
> > > > > > > =A0=A0 out_err:
> > > > > > > -- =

> > > > > > > 2.32.0
> > > > > =

> > > > > =

> > > > > _______________________________________________
> > > > > Linux-f2fs-devel mailing list
> > > > > Linux-f2fs-devel@lists.sourceforge.net
> > > > > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Flists.sourceforge.net%2Flists%2Flistinfo%2Flinux-f2fs-devel&amp;data=3D0=
4%7C01%7Cchao.yu%40oppo.com%7Cbb41006c3f6d4e4d600a08d99b51cbcd%7Cf1905eb1c3=
5341c5951662b4a54b5ee6%7C0%7C0%7C637711597895400286%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&=
amp;sdata=3D%2BlEAXWLpV5wGX2hL0Wj5p2qX0AqfUFI05Qiqdp8PK8g%3D&amp;reserved=
=3D0
> > =

> > =

> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
