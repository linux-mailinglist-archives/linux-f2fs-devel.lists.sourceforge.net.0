Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE0E548110
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jun 2022 10:02:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o0f1g-0003we-Sw; Mon, 13 Jun 2022 08:02:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaoliu719@gmail.com>) id 1o0f1e-0003wU-U4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jun 2022 08:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p1C8yN+vY8r/BHzAHLXxk073G3pWCMQ/vUB+HuPD1g4=; b=hG3Wvy8hV2QTbfxQOEBmEfCPEW
 6urgfCmY5rqJN2G7ftB1PCYQHMhUZ4glO7A3XsaF1qJBuR0ds+Xj5TNXmtcdKQK2WE3dYpnGvyc62
 PYGqkwpK7R5ps04U6M9ddWM+UnjVCx3QcOeuvFhMEHfBPEgUvO4kyELz28wIqXndVQcc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p1C8yN+vY8r/BHzAHLXxk073G3pWCMQ/vUB+HuPD1g4=; b=fZrupQDUcGiKgtRKILtW8LOGCn
 gE+J66w7iVeX5Ez2rpjkIbo++5I0UIcqlpifsc5F8qKCmSl3hp7QtcJ2gNVKn2Qoyb7B99pXtfZ6V
 ObUlpSWFV7Wg81S5osBwiy4eRaM8+oKgpk+X/3DxCw9EAEDJGb7UZf+E5J7b/JEDdXXA=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o0f1b-00HEpO-NY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jun 2022 08:02:19 +0000
Received: by mail-pl1-f169.google.com with SMTP id i15so4472156plr.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Jun 2022 01:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=p1C8yN+vY8r/BHzAHLXxk073G3pWCMQ/vUB+HuPD1g4=;
 b=aSepHBzqKyR8Qo5Ni0Ko6/WPnq+LpRSeEYfmQngvGmWanOcbzx2aiaaZQa8eQadyJ9
 dDlrjox3fpUosoUz8TVBuRrVDb+97Wl2wvvmZQ5PjWF+MckNqtoF0Yqjfp1JiEGapoH9
 wz1pf8EuHtCVmFBbIXiY9LmPpzE9OQpoIIgx91IYpnQxpyTRTtfb+1GAi3DxhIKrbkKN
 N1NK74nkvvYnOtImC2zpVWDa2FwLrek2i8y6h66bEXMWyg0IOiDQAdHJY5QSIbr2K94S
 gdujIYqPT1xp+21GLpVsPtRLshj81Who+zb4KBxHDhX6J7NLhycAWX+JQaOSSNbDRwf4
 bSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p1C8yN+vY8r/BHzAHLXxk073G3pWCMQ/vUB+HuPD1g4=;
 b=yJbRNmNCS52upL0fNwjmaswGxaOjUhDR1Tf1/cHW5DjvOG+78V8Eq5cFTnouR6zA1Q
 X0Klz2MOPAEcahsRPGVfYDKSul+CyRijjX/4xlLSTIDjviRHa9EOmRRa3kk8D7SrOCXz
 /bUxb+GRx4jjBdAooSy9A0bItUfRq6RDFxjHKGK8xsB5Iu4oik1uzGJXSDrPkXhct8ob
 KxNcSo10RaLDNBedCpPtrHCtY1ShvKg+gwNW20FQpTjQQqvNL+prnKCrD8CFRy15XOdf
 ebG/JsWW8jKzw+aT8xqy5IoOWhCe7wmcId3lNadqqBz+ydHVgvbGZ9idIvpVjvTXbEH2
 O5Ww==
X-Gm-Message-State: AOAM530TQo/53+HTUS+QoNeXaopQ8iMyjNdIYf/OsJCpcQ+82aEiopEZ
 ScvyjxMPO02aGuEhWWVXoBZtA1Hbg7kivORjXJk=
X-Google-Smtp-Source: ABdhPJyvL+v4MFBf2+W3Xz3H2xuY0V3wLF4p+6lH0Y3cve/USE1Poi/owF+J0aydCJ7qDD3UPUlfcA==
X-Received: by 2002:a17:90b:350f:b0:1e6:94e1:bd17 with SMTP id
 ls15-20020a17090b350f00b001e694e1bd17mr14587004pjb.162.1655107326065; 
 Mon, 13 Jun 2022 01:02:06 -0700 (PDT)
Received: from liuchao-VM ([156.236.96.165]) by smtp.gmail.com with ESMTPSA id
 ct21-20020a056a000f9500b0051c0784cb45sm4728274pfb.99.2022.06.13.01.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 01:02:05 -0700 (PDT)
Date: Mon, 13 Jun 2022 16:02:00 +0800
From: Chao Liu <chaoliu719@gmail.com>
To: Matthew Wilcox <willy@infradead.org>, Chao Yu <chao@kernel.org>
Message-ID: <Yqbu+BArbUNGvft9@liuchao-VM>
References: <20220613020800.3379482-1-chaoliu719@gmail.com>
 <Yqaw3VTD46PAMN8O@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yqaw3VTD46PAMN8O@casper.infradead.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 13, 2022 at 04:37:01AM +0100,
 Matthew Wilcox wrote:
 > On Mon, Jun 13, 2022 at 10:08:00AM +0800, Chao Liu wrote: > > v2: > > -
 s/file size/filesize/ > > Why would you change it to be wrong? [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [chaoliu719[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [chaoliu719[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.169 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o0f1b-00HEpO-NY
Subject: Re: [f2fs-dev] [PATCH v2] docs: filesystems: f2fs: fix description
 about compress ioctl
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
Cc: Chao Liu <liuchao@coolpad.com>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Yue Hu <huyue2@coolpad.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Wayne Zhang <zhangwen@coolpad.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 13, 2022 at 04:37:01AM +0100, Matthew Wilcox wrote:
> On Mon, Jun 13, 2022 at 10:08:00AM +0800, Chao Liu wrote:
> > v2:
> > - s/file size/filesize/
>
> Why would you change it to be wrong?
>

This is a suggestion from Chao Yu. Maybe he has some other considerations.

Hi Chao,

Can you help with this question?

Thanks.

> >  Documentation/filesystems/f2fs.rst | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> > index ad8dc8c040a2..531b0f8a3946 100644
> > --- a/Documentation/filesystems/f2fs.rst
> > +++ b/Documentation/filesystems/f2fs.rst
> > @@ -818,10 +818,11 @@ Compression implementation
> >    Instead, the main goal is to reduce data writes to flash disk as much as
> >    possible, resulting in extending disk life time as well as relaxing IO
> >    congestion. Alternatively, we've added ioctl(F2FS_IOC_RELEASE_COMPRESS_BLOCKS)
> > -  interface to reclaim compressed space and show it to user after putting the
> > -  immutable bit. Immutable bit, after release, it doesn't allow writing/mmaping
> > -  on the file, until reserving compressed space via
> > -  ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS) or truncating filesize to zero.
> > +  interface to reclaim compressed space and show it to user after setting a
> > +  special flag to the inode. Once the compressed space is released, the flag
> > +  will block writing data to the file until either the compressed space is
> > +  reserved via ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS) or the filesize is
> > +  truncated to zero.
> >
> >  Compress metadata layout::
> >
> > @@ -830,12 +831,12 @@ Compress metadata layout::
> >  		| cluster 1 | cluster 2 | ......... | cluster N |
> >  		+-----------------------------------------------+
> >  		.           .                       .           .
> > -	.                       .                .                      .
> > +	  .                      .                .                      .
> >      .         Compressed Cluster       .        .        Normal Cluster            .
> >      +----------+---------+---------+---------+  +---------+---------+---------+---------+
> >      |compr flag| block 1 | block 2 | block 3 |  | block 1 | block 2 | block 3 | block 4 |
> >      +----------+---------+---------+---------+  +---------+---------+---------+---------+
> > -	    .                             .
> > +	       .                             .
> >  	    .                                           .
> >  	.                                                           .
> >  	+-------------+-------------+----------+----------------------------+
> > --
> > 2.36.1
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
