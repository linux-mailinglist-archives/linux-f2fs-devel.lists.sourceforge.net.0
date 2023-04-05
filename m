Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 472AA6D8045
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 17:02:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk4eG-0007ht-GY;
	Wed, 05 Apr 2023 15:02:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pk4eD-0007ha-Ij
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 15:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ijdR/MHnRs9yin6C5jhmGmV2EeFx7fyGP+HaH521iTo=; b=MY28QFXXcUNAu2wl7hk5EQ8i3L
 eLHbJTaKafN2m3rd8hG/64OTEDXxps57fW7PBsEfYojDA+VRcYzxCgwk3RG8OfwFsZyvDLqS8och9
 nGl413N56lFNMLjM47rmB+iBMNdsegh9dF7KDM6LuGNUml8Xfe87t/hv+LjKYJrTf5qo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ijdR/MHnRs9yin6C5jhmGmV2EeFx7fyGP+HaH521iTo=; b=EvKGBnThjFmuR+arPLo9MIKzY4
 hM76bASiMzZ7ykQxGO3GgzdNa548Gb9nTqGc3yv+DPRq1ZtTinTGSyq1iN1RSLCeiUghlvd12V+cD
 4EJ3YYmApN0HfX1MKRj02LhD/Ta0OIAXhr5b0uazOTdR71UgV4Oo/yo1bWmm63+hTL6E=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk4e9-00G5I4-BN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 15:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680706914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ijdR/MHnRs9yin6C5jhmGmV2EeFx7fyGP+HaH521iTo=;
 b=KPJd0hYt3c5izrhpy8yGFXwyKW5C/oJQdja5Oj02Fz6ZK2dazO8gFmaqYySwoMGpvXa2fu
 kqwuZgm8LXEvY8qxbmZuaFbKMYXlnGKF00L9y0CxTcIWAMEXr1rnqIWSLAO7Coao0lk3PY
 MzE0W0Z1ipIIk/cWBkt8h+WPc0QljT8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-D7HPK2R-OSak8Nr6MnDxSg-1; Wed, 05 Apr 2023 11:01:51 -0400
X-MC-Unique: D7HPK2R-OSak8Nr6MnDxSg-1
Received: by mail-qv1-f70.google.com with SMTP id
 g14-20020ad457ae000000b005aab630eb8eso16442297qvx.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Apr 2023 08:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680706911;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ijdR/MHnRs9yin6C5jhmGmV2EeFx7fyGP+HaH521iTo=;
 b=zVGHrbwVBoxx6Q6X/9DIz5m9r69+T80vd9K6IsXwgz8vHVFY3brlOPWLpkAgFJZqUb
 BQNouRWUQReCafKdTOflCHQ8P23yT7hWqnAFTF2wPbJuWVZzVSNVNCMHU8GCRIgYrAG3
 11d5NFyBoFgpyMW/50Z69AWuOt2M9v9yrzkZd60vLm0gk+iT12C1KdwSdKZ8EGue/mQl
 RcZuLtonV7+JNJFox2WCM/YlvRviNiN2iU+O60948kOwd68zlo1BtZ4kX4mEjgt8d61i
 FcQOM61zYpklcaJDsEuxJO2zEWz5+n88togt6aeaAK3UAJHy8NudnnfHTJL949WeS4Ut
 eQSg==
X-Gm-Message-State: AAQBX9ej/gYpAjkHUrgCK2cBNJJz6nx0GGBqc7Se73d44HXr1/SBIN3E
 s0um/C/ziRmJ3dFZcWhjK4VpDPe3OsDy1evM4yOxVQ/dph2KnCPBof3eCMUUdA61liDIGGFkdWf
 EA4I9Wk3Qowgs2Jk9IUa5m2w+v/UJFUY2nNTH
X-Received: by 2002:a05:6214:2504:b0:5a3:cbc6:8145 with SMTP id
 gf4-20020a056214250400b005a3cbc68145mr11557291qvb.19.1680706911149; 
 Wed, 05 Apr 2023 08:01:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350YVeAhEKCJSk+gIHwjGx6PP08vlMKC4voUohfc6ezEBe0HN6HJNbkVZpy9LxJ1aS1g8D9uc0g==
X-Received: by 2002:a05:6214:2504:b0:5a3:cbc6:8145 with SMTP id
 gf4-20020a056214250400b005a3cbc68145mr11557235qvb.19.1680706910656; 
 Wed, 05 Apr 2023 08:01:50 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a0cc388000000b005dd8b93457dsm4236165qvi.21.2023.04.05.08.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 08:01:49 -0700 (PDT)
Date: Wed, 5 Apr 2023 17:01:42 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-20-aalbersh@redhat.com>
 <20230404161047.GA109974@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20230404161047.GA109974@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 04, 2023 at 09:10:47AM -0700, Darrick J. Wong
 wrote: > On Tue, Apr 04, 2023 at 04:53:15PM +0200, Andrey Albershteyn wrote:
 > > The direct path is not supported on verity files. Attempts to [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pk4e9-00G5I4-BN
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
Cc: fsverity@lists.linux.dev, hch@infradead.org, linux-ext4@vger.kernel.org,
 agruenba@redhat.com, damien.lemoal@opensource.wdc.com,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 04, 2023 at 09:10:47AM -0700, Darrick J. Wong wrote:
> On Tue, Apr 04, 2023 at 04:53:15PM +0200, Andrey Albershteyn wrote:
> > The direct path is not supported on verity files. Attempts to use direct
> > I/O path on such files should fall back to buffered I/O path.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  fs/xfs/xfs_file.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> > index 947b5c436172..9e072e82f6c1 100644
> > --- a/fs/xfs/xfs_file.c
> > +++ b/fs/xfs/xfs_file.c
> > @@ -244,7 +244,8 @@ xfs_file_dax_read(
> >  	struct kiocb		*iocb,
> >  	struct iov_iter		*to)
> >  {
> > -	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
> > +	struct inode		*inode = iocb->ki_filp->f_mapping->host;
> > +	struct xfs_inode	*ip = XFS_I(inode);
> >  	ssize_t			ret = 0;
> >  
> >  	trace_xfs_file_dax_read(iocb, to);
> > @@ -297,10 +298,17 @@ xfs_file_read_iter(
> >  
> >  	if (IS_DAX(inode))
> >  		ret = xfs_file_dax_read(iocb, to);
> > -	else if (iocb->ki_flags & IOCB_DIRECT)
> > +	else if (iocb->ki_flags & IOCB_DIRECT && !fsverity_active(inode))
> >  		ret = xfs_file_dio_read(iocb, to);
> > -	else
> > +	else {
> > +		/*
> > +		 * In case fs-verity is enabled, we also fallback to the
> > +		 * buffered read from the direct read path. Therefore,
> > +		 * IOCB_DIRECT is set and need to be cleared
> > +		 */
> > +		iocb->ki_flags &= ~IOCB_DIRECT;
> >  		ret = xfs_file_buffered_read(iocb, to);
> 
> XFS doesn't usually allow directio fallback to the pagecache. Why
> would fsverity be any different?

Didn't know that, this is what happens on ext4 so I did the same.
Then it probably make sense to just error on DIRECT on verity
sealed file.

> 
> --D
> 
> > +	}
> >  
> >  	if (ret > 0)
> >  		XFS_STATS_ADD(mp, xs_read_bytes, ret);
> > -- 
> > 2.38.4
> > 
> 

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
