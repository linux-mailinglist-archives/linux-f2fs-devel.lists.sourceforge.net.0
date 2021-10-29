Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F280440167
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Oct 2021 19:43:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mgVus-0000xf-1P; Fri, 29 Oct 2021 17:43:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mgVuq-0000xY-FV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Oct 2021 17:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pj4a1+I88NFqPE/JyEQR+FLPbZuzCd7+8bOb8HPS5p0=; b=iMmi8RZ8ED94cx7bWGXbTvn0mT
 wwPyH6+wd/19AhXxRcOI4R3Ss+8EdpQ1LbQmtjmCVi9V83+7zWCXI/0JiVjVXQZYiqgld2KpWSD4R
 aE+ppgsC1KQcI+Mi8J/ui5qvrezw4wTdsEDMTEkNk6DAq4YgD4hfm3Ib2x/Od6PKH0tg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pj4a1+I88NFqPE/JyEQR+FLPbZuzCd7+8bOb8HPS5p0=; b=erLM/9Klw8t7xlLQe5Y5uk2Vm1
 GOs6Q7BSqoEoAEtoVuhYhbQ31wepExYKC1P1XbH767xWaCARr1lEeCuWE1sWA8eEX7tYmk3trs1z7
 RRBWtoUp8IhiK0raMrzTf71/MpYN30a7aPNk76frWdBLqgqHR/gMIIwdlAeMF3Oaj4Vk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mgVuj-0005p6-V4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Oct 2021 17:43:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92B7A61040;
 Fri, 29 Oct 2021 17:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635529407;
 bh=rsaoqoFMJRkFW8HbI1/g5SAhlNrxOJ2ODlLw2rtjQVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TWI+jjY0ML1p9Nw0Dtl1KOyq5HJqk87BImQU70Cl4KdrO+WFa4/1eXJxAHGo0I3B1
 P/NvnMbfHSuOP2R46KsW2PdDpFH+Ejzgy2WcXm8VdW+MoO8hklvBq403DcDAKYxGDV
 mHxsKA5ZC4yWlQanMq8jCrM8qWeXEku+Kg22esQqwvs1SMJSMjIlaZ5R1n656tYy3b
 Lx5l4t9du+GMlRyUCeJsgwxECQ88Oq1feTNOL4xZBJ0gQ0YwGpafGfCWUZB7L8YPix
 ksi7CCHYMIS34CwUiqSHNy3RC+DlXPwoPjbQWjjzyX44QJPRpzSWY2aJhdtHO45LE4
 YcDzGXpMmMTQA==
Date: Fri, 29 Oct 2021 10:43:26 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YXwyvllUOm6jLiF5@google.com>
References: <20210928151911.11189-1-chao@kernel.org>
 <YVNoHudG5c65X85G@google.com>
 <65f6c366-9e5b-fe7f-7c38-061996d1882b@kernel.org>
 <dec765de-407b-07c3-75f6-ec7f71c618b7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dec765de-407b-07c3-75f6-ec7f71c618b7@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/29, Chao Yu wrote: > Ping, > > On 2021/9/29 8:05, Chao
 Yu wrote: > > On 2021/9/29 3:08, Jaegeuk Kim wrote: > > > On 09/28, Chao
 Yu wrote: > > > > In f2fs_file_write_iter(), let's use f2fs_overwr [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mgVuj-0005p6-V4
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

On 10/29, Chao Yu wrote:
> Ping,
> =

> On 2021/9/29 8:05, Chao Yu wrote:
> > On 2021/9/29 3:08, Jaegeuk Kim wrote:
> > > On 09/28, Chao Yu wrote:
> > > > In f2fs_file_write_iter(), let's use f2fs_overwrite_io() to
> > > > check whethere it is overwrite case, for such case, we can skip
> > > > f2fs_preallocate_blocks() in order to avoid f2fs_do_map_lock(),
> > > > which may be blocked by checkpoint() potentially.
> > > > =

> > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > ---
> > > > =A0 fs/f2fs/file.c | 4 ++++
> > > > =A0 1 file changed, 4 insertions(+)
> > > > =

> > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > > index 13deae03df06..51fecb2f4db5 100644
> > > > --- a/fs/f2fs/file.c
> > > > +++ b/fs/f2fs/file.c
> > > > @@ -4321,6 +4321,10 @@ static ssize_t f2fs_file_write_iter(struct k=
iocb *iocb, struct iov_iter *from)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 preallocated =3D true;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 target_size =3D iocb->ki_pos + iov_iter=
_count(from);
> > > > +=A0=A0=A0=A0=A0=A0=A0 if (f2fs_overwrite_io(inode, iocb->ki_pos,
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 iov_iter_count(from)))
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto write;
> > > =

> > > This calls f2fs_map_blocks() which can be duplicate, if it's not the =
overwirte
> > > case. Do we have other benefit?
> > =

> > f2fs_overwrite_io() will break for append write case w/ below check:
> > =

> >  =A0=A0=A0=A0if (pos + len > i_size_read(inode))
> >  =A0=A0=A0=A0=A0=A0=A0 return false;
> > =

> > I guess we may only suffer double f2fs_map_blocks() for write hole
> > case, e.g. truncate to large size & write inside the filesize. For
> > this case, how about adding a condition to allow double f2fs_map_blocks=
()
> > only if write size is smaller than a threshold?

I still don't see the benefit much to do double f2fs_map_blocks. What is the
problem here?

> > =

> > Thanks,
> > =

> > > =

> > > > +
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 err =3D f2fs_preallocate_blocks(iocb, f=
rom);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (err) {
> > > > =A0 out_err:
> > > > -- =

> > > > 2.32.0
> > =

> > =

> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
ts.sourceforge.net%2Flists%2Flistinfo%2Flinux-f2fs-devel&amp;data=3D04%7C01=
%7Cchao.yu%40oppo.com%7C421c06812eba4f922b0908d982dcdcc5%7Cf1905eb1c35341c5=
951662b4a54b5ee6%7C0%7C0%7C637684707374940190%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3Du22eEWDAPaAZCyISyjTUOtQDLDuyKxTnNCI3eSwwWro%3D&amp;reserved=3D0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
