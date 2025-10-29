Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5E4C183BB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 05:26:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjxJwUB6T7BHEGo2Pyc20Fzk7Gbj5bbxaUqZPgHPpi8=; b=ma8/rSiYDRh/rk9zK2DlmkH0lZ
	0MVVN6j03vP6Zh9RTflf7MvwfvC0gi8Uhb6kbv12YvgrsI2ZGraGPcTDDF5owb59+Kd47wzdhuXzk
	gIQbiYnn44zXcw/x0F+qBvIFRf8RSz8jZ7mz5nZHNju2cYqTqWzn5lbg9zTi8HAlz8dc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDxlm-0007YR-6m;
	Wed, 29 Oct 2025 04:26:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vDxll-0007YL-Bf
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 04:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gtd+6tByowlbxeHpwqI6g01haHKdtkBEh48BAwQ/NrQ=; b=bE11AWWEjL9+bhatOVFgh7hCKc
 hdeDXTOJpxd8QVgXiqH8J8oWkoQi5NuR12VYaQuasTfQB3JyzjUpau6/OfZWxBVwbq4xPNPXhQfzW
 LtXQly3fKLJvgpbJFcl1CjzuYi6cJCqTyQnVikXJBZaNukMKxyFVyhekpUr3GuE+y840=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gtd+6tByowlbxeHpwqI6g01haHKdtkBEh48BAwQ/NrQ=; b=BUeY5ytp5KtK2WtyDmMThBYCjk
 ulI7r8Ru4fnL0Zy03IIlsxKTpyYhOsAHVUibBw6atvfWNbSumxzzCgpOTHOxKmahjTxtG7Mx+Jrm7
 bGVMMFfCU7vNNQaQdp8A7B7KyQmaelAbAK3ndWlRuvY+LiUAU8pUrn8wtiiw1EL6DPzo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDxlk-0000hk-QR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 04:26:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 026B260505;
 Wed, 29 Oct 2025 04:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F561C4CEF7;
 Wed, 29 Oct 2025 04:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761711993;
 bh=pNrkVZRg0qtgUOiit6EQFAAv9auGuKi23YsrTYy0s+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OgRjpogVTcQB5uIUkngmqJrKUREu27UwjCGfWj9EqxnCWz4+6uYJn/YOM1C3lTNvY
 YYdp5rjFoUTgyaLzH13AQjjAXuslgnCBpYdnnxmWnbMzJ8ZljIr7Eeq2s9lou89a+G
 Q8QL9YY5jxQ0zetYJiVSfVZJDWiBkqCy9pguXk+20k+vf0ygAcKNa0B2WWxMDd2YDA
 +oD4lLqeysMTNYEr/pzh1InWsydeR9Whe0yxoDRjLBxCv9HUFxg6Lf9GZ+hAgP9n2J
 W1eYT8j16Xb6bGRGclP2sd5BHD2ex+YLx0xyjus/NMh12/6lCVdMaXbnbsHleqaLTN
 APi9oHqALojCw==
Date: Wed, 29 Oct 2025 04:26:31 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aQGXd0lI5MeHyGbX@google.com>
References: <20251028195444.3181203-1-jaegeuk@kernel.org>
 <81602674-b9f4-4ab2-91f5-0afc762e7cc6@kernel.org>
 <7040b501-6e25-42da-bda0-a15614a80d5d@gmail.com>
 <490569af-8e87-4cea-81dc-3bc9f59aa2b4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <490569af-8e87-4cea-81dc-3bc9f59aa2b4@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/29, Chao Yu wrote: > On 10/29/25 11:13, Yongpeng Yang
 wrote: > > On 10/29/25 10:06, Chao Yu via Linux-f2fs-devel wrote: > >> On
 10/29/25 03:54, Jaegeuk Kim via Linux-f2fs-devel wrote: > >>> This [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDxlk-0000hk-QR
Subject: Re: [f2fs-dev] [PATCH] f2fs: add fadvise tracepoint
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, linux-kernel@vger.kernel.org,
 Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/29, Chao Yu wrote:
> On 10/29/25 11:13, Yongpeng Yang wrote:
> > On 10/29/25 10:06, Chao Yu via Linux-f2fs-devel wrote:
> >> On 10/29/25 03:54, Jaegeuk Kim via Linux-f2fs-devel wrote:
> >>> This adds a tracepoint in the fadvise call path.
> >>>
> >>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> >>> ---
> >>> =A0 fs/f2fs/file.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 2 ++
> >>> =A0 include/trace/events/f2fs.h | 32 ++++++++++++++++++++++++++++++++
> >>> =A0 2 files changed, 34 insertions(+)
> >>>
> >>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> >>> index 6d42e2d28861..4a81089c5df3 100644
> >>> --- a/fs/f2fs/file.c
> >>> +++ b/fs/f2fs/file.c
> >>> @@ -5288,6 +5288,8 @@ static int f2fs_file_fadvise(struct file *filp,=
 loff_t offset, loff_t len,
> >>> =A0=A0=A0=A0=A0 struct inode *inode =3D file_inode(filp);
> >>> =A0=A0=A0=A0=A0 int err;
> >>> =A0 +=A0=A0=A0 trace_f2fs_fadvise(inode, offset, len, advice);
> >>> +
> >>> =A0=A0=A0=A0=A0 if (advice =3D=3D POSIX_FADV_SEQUENTIAL) {
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (S_ISFIFO(inode->i_mode))
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ESPIPE;
> >>> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> >>> index edbbd869078f..b7f5317b5980 100644
> >>> --- a/include/trace/events/f2fs.h
> >>> +++ b/include/trace/events/f2fs.h
> >>> @@ -586,6 +586,38 @@ TRACE_EVENT(f2fs_file_write_iter,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 __entry->ret)
> >>> =A0 );
> >>> =A0 +TRACE_EVENT(f2fs_fadvise,
> >>> +
> >>> +=A0=A0=A0 TP_PROTO(struct inode *inode, loff_t offset, loff_t len, i=
nt advice),
> >>> +
> >>> +=A0=A0=A0 TP_ARGS(inode, offset, len, advice),
> >>> +
> >>> +=A0=A0=A0 TP_STRUCT__entry(
> >>> +=A0=A0=A0=A0=A0=A0=A0 __field(dev_t,=A0=A0=A0 dev)
> >>> +=A0=A0=A0=A0=A0=A0=A0 __field(ino_t,=A0=A0=A0 ino)
> >>> +=A0=A0=A0=A0=A0=A0=A0 __field(loff_t, size)
> >>> +=A0=A0=A0=A0=A0=A0=A0 __field(loff_t,=A0=A0=A0 offset)
> >>> +=A0=A0=A0=A0=A0=A0=A0 __field(loff_t,=A0=A0=A0 len)
> >>> +=A0=A0=A0=A0=A0=A0=A0 __field(int,=A0=A0=A0 advice)
> >>> +=A0=A0=A0 ),
> >>> +
> >>> +=A0=A0=A0 TP_fast_assign(
> >>> +=A0=A0=A0=A0=A0=A0=A0 __entry->dev=A0=A0=A0 =3D inode->i_sb->s_dev;
> >>> +=A0=A0=A0=A0=A0=A0=A0 __entry->ino=A0=A0=A0 =3D inode->i_ino;
> >>> +=A0=A0=A0=A0=A0=A0=A0 __entry->size=A0=A0=A0 =3D inode->i_size;
> >>
> >> __entry->size =3D i_size_read(inode)?
> >>
> >> Thanks,
> >>
> > The other "__entry->size =3D inode->i_size;" in include/trace/events/f2=
fs.h also need to be updated?
> =

> Yeah, Yongpeng, I noticed that and fixed them right after reply:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=
=3Dbugfix/common&id=3Dffd21bf791143957f6ff1fc14d7dbd6e8466b320

Please post the above patch separately. :)

> =

> Thanks for your reminder. :)
> =

> Thanks,
> =

> > =

> >>> +=A0=A0=A0=A0=A0=A0=A0 __entry->offset=A0=A0=A0 =3D offset;
> >>> +=A0=A0=A0=A0=A0=A0=A0 __entry->len=A0=A0=A0 =3D len;
> >>> +=A0=A0=A0=A0=A0=A0=A0 __entry->advice=A0=A0=A0 =3D advice;
> >>> +=A0=A0=A0 ),
> >>> +
> >>> +=A0=A0=A0 TP_printk("dev =3D (%d,%d), ino =3D %lu, i_size =3D %lld o=
ffset:%llu, len:%llu, advise:%d",
> >>> +=A0=A0=A0=A0=A0=A0=A0 show_dev_ino(__entry),
> >>> +=A0=A0=A0=A0=A0=A0=A0 (unsigned long long)__entry->size,
> >>> +=A0=A0=A0=A0=A0=A0=A0 __entry->offset,
> >>> +=A0=A0=A0=A0=A0=A0=A0 __entry->len,
> >>> +=A0=A0=A0=A0=A0=A0=A0 __entry->advice)
> >>> +);
> >>> +
> >>> =A0 TRACE_EVENT(f2fs_map_blocks,
> >>> =A0=A0=A0=A0=A0 TP_PROTO(struct inode *inode, struct f2fs_map_blocks =
*map, int flag,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int ret),
> >>
> >>
> >>
> >> _______________________________________________
> >> Linux-f2fs-devel mailing list
> >> Linux-f2fs-devel@lists.sourceforge.net
> >> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
