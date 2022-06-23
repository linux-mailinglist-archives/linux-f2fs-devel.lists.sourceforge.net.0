Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 149BB5571F0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jun 2022 06:45:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o4Ei7-0005Cc-9D; Thu, 23 Jun 2022 04:44:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaoliu719@gmail.com>) id 1o4Ei5-0005CW-Jb
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 04:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7pClNYW6GdD+bqk4AvhY2s+uNLxh13CkOSP1D9SdCxo=; b=TdA/aEtRPPbwVkot4eerSEOAMD
 EeIWCv6GMGJ8Og+KWVKfFJxf4ZakDvVCxPk3hi/trjqzxr5S5M0KCggDokxhG9WuD9A1+l+xd1ljN
 ATEl90TL2ainjJN8+owJ6YlGa0j3lE+ODL+f7xklp02RWX6m7DzcoMPLyntr4gWULi7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7pClNYW6GdD+bqk4AvhY2s+uNLxh13CkOSP1D9SdCxo=; b=flz3RkwaJtr3y0jWn6tKjMbt0q
 YTamHNN2hqe6s6VBNF6lebunrI8NoIo8e6/aAkDKNo/1qWNYugQJELYQnUfgCnVmFijjEzIpl7Az8
 1F7AjAVOv6/SWEVyWWjktGCMm3JCpRTpdJJtOQ/P+Hi5W9jKNH5yJFHAEt+ATMTK8UzQ=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o4Ei2-00AqkE-TP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 04:44:54 +0000
Received: by mail-pl1-f177.google.com with SMTP id c4so951839plc.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Jun 2022 21:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7pClNYW6GdD+bqk4AvhY2s+uNLxh13CkOSP1D9SdCxo=;
 b=GBcPP7Ll2QRHafRvhbKwUuaUPed1y5SmfgxoASMwl0H56+Nm+vVEL9yTIPa5sd+RKV
 JbcY/Ag+jXQjrX7OlP+Ejl8DM+/nnfprWgZRysFIGwaaSi0BvYFDgOyJxV5mPr0uegxD
 glV+TH+YobBHYRsmXXaNTBklROr70CkUJjGBNrScqShDrTF7kihFZ5KIuFUOh3WUIQ9m
 meEz2w5nvDIj4+k8vKWOHzkmMBvbSFTLGnWZsRTUjcXBIlHCCfmQD4gU1U051FhboojK
 mce+85K/Me/0MbXdOSQ81ZaJztHz17sPP5FaXroT1TfRdVvnJBd837Dje7//fhcZ98In
 YiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7pClNYW6GdD+bqk4AvhY2s+uNLxh13CkOSP1D9SdCxo=;
 b=Ue4+TzWWYmfEmxaIUROBhxPbkPcIBVL6CLD7yXyTp/Lk6sqaMRbjpMVjV7af4F/zpe
 t/K6/FoNYHUYwb1dEvnKuz1jaL73LFufK/xuuwMtmOA/nBs9pyBoWqBka/oP/pPtqymJ
 23xGt72OXSiLpW7FV0TCEehK19WAhDJI9/1g34709se5WhUnP4epb5yprUydRTesP95X
 o17ZX0Kfjp45r28pjs8SezO1y+gM4gwcecu+0Hiz5b6Hudr2Lz2uYYBU7W9ZXelFtP45
 OW2u3QOk/wXJ82/kDZjufRmvx7fJDLkRODd9259KP4BwhL6dAlY9mhBAtUCkOhW8NV/7
 ExcA==
X-Gm-Message-State: AJIora/FQUmGXn/Qs+7VFMO5LWknwU7Z8qxhKhsInxt6sntfK8yF/9Uo
 44KqgdTAheggN2hxCf4AuvM=
X-Google-Smtp-Source: AGRyM1sEivVnKKU+jYUVm/emg72A4m98rAYAEGOrUi4aHojJC9oiKNl0bvHdKMVI/LJOqmWWpAqAwA==
X-Received: by 2002:a17:902:aa4b:b0:164:11ad:af0f with SMTP id
 c11-20020a170902aa4b00b0016411adaf0fmr37768944plr.54.1655959485115; 
 Wed, 22 Jun 2022 21:44:45 -0700 (PDT)
Received: from liuchao-VM ([156.236.96.165]) by smtp.gmail.com with ESMTPSA id
 x6-20020a63aa46000000b003f24d67d226sm14066795pgo.92.2022.06.22.21.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 21:44:44 -0700 (PDT)
Date: Thu, 23 Jun 2022 12:44:40 +0800
From: Chao Liu <chaoliu719@gmail.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <YrPvuPLze3QoCkPJ@liuchao-VM>
References: <20220621064833.1079383-1-chaoliu719@gmail.com>
 <0771b00b-e781-cd29-896a-4b6ebc948c2e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0771b00b-e781-cd29-896a-4b6ebc948c2e@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 22, 2022 at 09:42:13PM +0800, Chao Yu wrote: >
 On 2022/6/21 14:48, Chao Liu wrote: > > From: Chao Liu > > > > If the inode
 has the compress flag, it will fail to use > > 'chattr -c +m' t [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.177 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [chaoliu719[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [chaoliu719[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o4Ei2-00AqkE-TP
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to remove F2FS_COMPR_FL and tag
 F2FS_NOCOMP_FL at the same time
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
Cc: Chao Liu <liuchao@coolpad.com>, linux-kernel@vger.kernel.org,
 Wayne Zhang <zhangwen@coolpad.com>, Yue Hu <huyue2@coolpad.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 22, 2022 at 09:42:13PM +0800, Chao Yu wrote:
> On 2022/6/21 14:48, Chao Liu wrote:
> > From: Chao Liu <liuchao@coolpad.com>
> >
> > If the inode has the compress flag, it will fail to use
> > 'chattr -c +m' to remove its compress flag and tag no compress flag.
> > However, the same command will be successful when executed again,
> > as shown below:
> >
> >    $ touch foo.txt
> >    $ chattr +c foo.txt
> >    $ chattr -c +m foo.txt
> >    chattr: Invalid argument while setting flags on foo.txt
> >    $ chattr -c +m foo.txt
> >    $ f2fs_io getflags foo.txt
> >    get a flag on foo.txt ret=0, flags=nocompression,inline_data
> >
> > Fix this by removing some checks in f2fs_setflags_common()
> > that do not affect the original logic. I go through all the
> > possible scenarios, and the results are as follows. Bold is
> > the only thing that has changed.
> >
> > +---------------+-----------+-----------+----------+
> > |               |            file flags            |
> > + command       +-----------+-----------+----------+
> > |               | no flag   | compr     | nocompr  |
> > +---------------+-----------+-----------+----------+
> > | chattr +c     | compr     | compr     | -EINVAL  |
> > | chattr -c     | no flag   | no flag   | nocompr  |
> > | chattr +m     | nocompr   | -EINVAL   | nocompr  |
> > | chattr -m     | no flag   | compr     | no flag  |
> > | chattr +c +m  | -EINVAL   | -EINVAL   | -EINVAL  |
> > | chattr +c -m  | compr     | compr     | compr    |
> > | chattr -c +m  | nocompr   | *nocompr* | nocompr  |
> > | chattr -c -m  | no flag   | no flag   | no flag  |
> > +---------------+-----------+-----------+----------+
> >
> > Fixes: 4c8ff7095bef ("f2fs: support data compression")
> > Signed-off-by: Chao Liu <liuchao@coolpad.com>
> > ---
> >
> > This patch depends on the the patch
> > "f2fs: allow compression of files without blocks" sent earlier this day.
> >
> >   fs/f2fs/file.c | 9 +--------
> >   1 file changed, 1 insertion(+), 8 deletions(-)
> >
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index daaa0dfd2d2e..0c3ae5993b7a 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -1873,10 +1873,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
> >   		if (masked_flags & F2FS_COMPR_FL) {
> >   			if (!f2fs_disable_compressed_file(inode))
> >   				return -EINVAL;
> > -		}
> > -		if (iflags & F2FS_NOCOMP_FL)
> > -			return -EINVAL;
> > -		if (iflags & F2FS_COMPR_FL) {
> > +		} else {
> >   			if (!f2fs_may_compress(inode))
> >   				return -EINVAL;
> >   			if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
> > @@ -1885,10 +1882,6 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
> >   			set_compress_context(inode);
> >   		}
> >   	}
> > -	if ((iflags ^ masked_flags) & F2FS_NOCOMP_FL) {
> > -		if (masked_flags & F2FS_COMPR_FL)
> > -			return -EINVAL;
> > -	}
>
> Without above check condition, can we return -EINVAL for the case:
>
> chattr +c on file w/ nocompr flag
>
> |               | no flag   | compr     | nocompr  |
> +---------------+-----------+-----------+----------+
> | chattr +c     | compr     | compr     | *-EINVAL*  |

Yes, we can.

chattr(1) grabs flags via GETFLAGS, modifies the result,
and passes that to SETFLAGS. If we execute 'chattr +c'
on the file with nocompr flag, the iflags will
contain both compr and nocompr flags, then be refused by:

    if ((iflags & F2FS_COMPR_FL) && (iflags & F2FS_NOCOMP_FL))
        return -EINVAL;

In addition, if iflags has only compr flag, while masked_flags
has only nocompr flag for some reason
(either because of concurrency of chattr(1) or by a user),
I think we need remove nocompr flag and tag compr flag on the file,
similar to the following.

|               | no flag   | compr     | nocompr  |
+---------------+-----------+-----------+----------+
| chattr +c -m  | compr     | compr     | *compr*  |

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
