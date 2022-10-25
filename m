Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5510960D2BA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 19:46:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onO0T-0004m9-O0;
	Tue, 25 Oct 2022 17:46:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1onO0R-0004m3-Dd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 17:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YqZ/JWK2mfhFRti/cu6NxBi7QgBjQWgS32RhW0qhANw=; b=D1rq4Dpl6WGUZ4wXpy/RB8qvVC
 22OpI14okyr6cwoJOdlZj4Km+Lv1SQKAMNoQVw4AdKIWwgo/eg5sn77h46KGW89KJ7+yLhRS5io11
 zNJIym/5CGphJxNjhQXQHfei2lRZheS7LqvcFKXMZPXNEmL/3oja2A1uHJiwWJoHNJ4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YqZ/JWK2mfhFRti/cu6NxBi7QgBjQWgS32RhW0qhANw=; b=a5VLWX6r2iH5Qrju1SDz5T8ySK
 krvL4RwxdPrBNPnEUFHJSJ8YYtdMaqwLRHW9e2NSoBH2yG2JLamqQGRePFBKIkEpUkRxv0Um4U2uo
 M9E1SxLC1MKlAe5OjaCYrupbVHMRSAcfkUcJ2pcd7TeR49XlW26KgprnRGAV6CWYUgCA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onO0P-00HEIC-Fj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 17:46:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3ECCDB81E06
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Oct 2022 17:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26C8C433D6;
 Tue, 25 Oct 2022 17:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666719978;
 bh=8BegBzFebokZgfEsi+2gc5z3pDHvlffY3pA7fRmvbaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vz3szJxFUoMewNmxuZdYMbx4vxSeB2p1KITG6qDCF85pVelpc9IE+Oph1RmSuLhf0
 f72zpbNOOmAVDBGs7OLaq+/ta2yv38JLc+OTuwAgp+ozh+EKEOQSIpUfCIwBLczYkE
 NHuW4etuUZtYatuJrxaRN9T87BZAeQM7KwDpmytnxCpwMx69Y6xK/mmgukqVwtSYD5
 FFCVol+3F3ELM3awyn37iUlJi/LWZ0wU4roVk7JqfM+DpUYr6GDKxoLVG2NOxdfyv1
 x3VmrXAajNhKVZVt4kMBHtOE9l8KwSGQYwMYQBYjKjboLQX8Lvm9A/5fhCllG5tQH0
 VG1nBLvtYT0Xg==
Date: Tue, 25 Oct 2022 10:46:16 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y1gg6P6CO9KbDO0O@google.com>
References: <20221024233634.803695-1-jaegeuk@kernel.org>
 <ae5f7c6e-248b-3cf7-b111-a4ddc85dd411@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae5f7c6e-248b-3cf7-b111-a4ddc85dd411@kernel.org>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/25, Chao Yu wrote: > On 2022/10/25 7:36, Jaegeuk Kim
 wrote: > > The below commit disallows to set compression on empty created
 file which > > has a inline_data. Let's fix it. > > > > Fixes: 7165 [...]
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1onO0P-00HEIC-Fj
Subject: Re: [f2fs-dev] [PATCH] f2fs: allow to set compression for inlined
 file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/25, Chao Yu wrote:
> On 2022/10/25 7:36, Jaegeuk Kim wrote:
> > The below commit disallows to set compression on empty created file which
> > has a inline_data. Let's fix it.
> > 
> > Fixes: 7165841d578e ("f2fs: fix to check inline_data during compressed inode conversion")
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/file.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 1c4004c9245f..304fe08edc61 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -1915,6 +1915,9 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
> >   			if (!f2fs_disable_compressed_file(inode))
> >   				return -EINVAL;
> >   		} else {
> > +			/* try to convert inline_data to support compression */
> > +			f2fs_convert_inline_inode(inode);
> 
> It needs to check return value of f2fs_convert_inline_inode()?

I intended to catch that in the below checks?

> 
> Thanks,
> 
> > +
> >   			if (!f2fs_may_compress(inode))
> >   				return -EINVAL;
> >   			if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
