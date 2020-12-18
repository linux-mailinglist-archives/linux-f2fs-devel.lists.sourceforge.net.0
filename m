Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 170D82DDEAE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Dec 2020 07:41:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SIqOKV7QSwiQ0E6QMRh1uQgD1nsYvzYXwgUIuIGrM8o=; b=CXWJR3v1rMtFkJZsdIbbsHuqW
	KR4fnY+R3rm23Mo5ETXt8ZW4c6bbGzFdE9EtBL+e3qlb+1SP22DtaQ/yqmIr4wHocwcYQMgkqIbZ2
	ojepEqz0nlkOPft3VRQXACuFCdfurQEHGbEQByjS/XQ89sc/St9K2skouV004bB72rhxQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kq9Sa-0007Kj-Im; Fri, 18 Dec 2020 06:41:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kq9SZ-0007KX-4b
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 06:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uIQfDC/Ph2Mj0AwvwcwaxZ4M1p4iwfh+sd2KyYnMW3k=; b=JPAKuJWlNeiX/165FTB/Phb/x5
 qFK5xPgNwV0KbGvaztq91OhFVlRBE0kLhmmWhb6EmtkVtuXE0X5MSDhz2rf+RRUpNF+2UoDVrOYPR
 o7WVhJ6BFAIL9YE6PGQbunCdlrF6cK+XfC7Q/kZHq+GStEkgzB6EEUiBwfpIlEqYwO6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uIQfDC/Ph2Mj0AwvwcwaxZ4M1p4iwfh+sd2KyYnMW3k=; b=FadGu5uc8Cs9f00dfMwAuNMzLb
 gMMKkWURsLV5tNBBq8ZjUnM84YfPKhcWWZEjomhOpdPK1sFed8zMyr1SH9+rujgn2QwvHnDHRwLgu
 CJOd9N4rM6RunmS3O+OWmPQbPI2I+13tUKVlCbks2qTF3KO/KY0o0fxPS/fmfKkhJtkc=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kq9SQ-0011Gn-4k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 06:41:51 +0000
Received: by mail-pl1-f171.google.com with SMTP id q4so881777plr.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 22:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uIQfDC/Ph2Mj0AwvwcwaxZ4M1p4iwfh+sd2KyYnMW3k=;
 b=LjjpzATQOmCAs83P1DO8IQmmLQ5KfH54zPhW0XNB0isZ4eUiwadcvt8X3V8jxVEgVq
 3JzF6nFC3ReDYjOEBB5iFgXVEr4nMpkPl9CFNjmOcHmbHFBM3NvAqmQoH55V8sgOvL52
 77B666yUzB7g5USJEIGnXtlvJdjPMr0mUpF4jAPctgkoTODoszFVebj/xtX/wiS/wlb0
 JmwAY54BqJdKEx+yspPGrf07gT0KqMLqzwmjZ4QRhwvCYMyzogLYYbaHbmi0+wP3roe2
 qzRqr4DSoWX4JWdhkLXdTWsxnAeB6kF/xND7JvK2p9tL47XxD7yIGtJ0yCLIvgTPNVT4
 k97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uIQfDC/Ph2Mj0AwvwcwaxZ4M1p4iwfh+sd2KyYnMW3k=;
 b=Jwx2NO6285WbSWdTwM8VCXvN6i3gA3QAQkDvGfgOJoRQkDAr/PLc5ljxO+tVO82loA
 2nrvazqDEKe4a8U/PwPVxPfjAWhGLZ5K7kFFsaVIqVhKpwZ1FdyBMUFUXaP9mjpeYtV1
 03el+KMa1FMX9UpxfK1dmRRzdNaGOqtROCRKxpuHLrEHgXVD+C2RFhBK0ZmBG10p9ibx
 98coyYk6vhfO7RHRwU+4DTtB6X//xka+Wzq+alzOVF7bQVjd/iP2OiUVTocC656RZGHn
 XVtakldQKuIEUAeJT4dff1vwffqVR+16z+LHkzZVylBL8Ay2HzGH17zQSCymvn/7jwNl
 8N2Q==
X-Gm-Message-State: AOAM533T9vK7Uprn1afbllV7PJBYRApOnkvwuGfm+8j0ahF7Kitnb8OQ
 KYjGjAjQZlbL7Omz3Zp1hQiJRA==
X-Google-Smtp-Source: ABdhPJwAoMU/wCqmbRu4OtB/oMycvpD9J5EH+p7/2JXTxgvdDwDS9PQssUbTb+zDVZBBLi1ozOovgQ==
X-Received: by 2002:a17:902:8bc5:b029:dc:1e79:e746 with SMTP id
 r5-20020a1709028bc5b02900dc1e79e746mr2649165plo.77.1608273696432; 
 Thu, 17 Dec 2020 22:41:36 -0800 (PST)
Received: from google.com (139.60.82.34.bc.googleusercontent.com.
 [34.82.60.139])
 by smtp.gmail.com with ESMTPSA id bg20sm6666431pjb.6.2020.12.17.22.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 22:41:35 -0800 (PST)
Date: Fri, 18 Dec 2020 06:41:32 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <X9xPHDPhsOfGYIgv@google.com>
References: <20201005074133.1958633-1-satyat@google.com>
 <X9uF9kNjWFq8KlL9@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9uF9kNjWFq8KlL9@google.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FSL_HELO_FAKE          No description available.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kq9SQ-0011Gn-4k
Subject: Re: [f2fs-dev] [PATCH 0/1] userspace support for F2FS metadata
 encryption
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 17, 2020 at 08:23:18AM -0800, Jaegeuk Kim wrote:
> Hi Satya,
> 
> Could you please consider to rebase the patches on f2fs-tools/dev branch?
> I've applied compression support which will have some conflicts with this
> series. And, could you check this works with multi-partition support?
> 
Sure, I'll do that! I sent out v2 of this patch series earlier today,
so would you want me to send out a rebased version asap? or when
I send out v3?

Also, newbie question - multi-partition support is the same as
multi-device support, right?
> Thanks,
> 
> On 10/05, Satya Tangirala wrote:
> > The kernel patches for F2FS metadata encryption are at:
> > 
> > https://lore.kernel.org/linux-fscrypt/20201005073606.1949772-4-satyat@google.com/
> > 
> > This patch implements the userspace changes required for metadata
> > encryption support as implemented in the kernel changes above. All blocks
> > in the filesystem are encrypted with the user provided metadata encryption
> > key except for the superblock (and its redundant copy). The DUN for a block
> > is its offset from the start of the filesystem.
> > 
> > This patch introduces two new options for the userspace tools: '-A' to
> > specify the encryption algorithm, and '-M' to specify the encryption key.
> > mkfs.f2fs will store the encryption algorithm used for metadata encryption
> > in the superblock itself, so '-A' is only applicable to mkfs.f2fs. The rest
> > of the tools only take the '-M' option, and will obtain the encryption
> > algorithm from the superblock of the FS.
> > 
> > Limitations: 
> > Metadata encryption with sparse storage has not been implemented yet in
> > this patch.
> > 
> > This patch requires the metadata encryption key to be readable from
> > userspace, and does not ensure that it is zeroed before the program exits
> > for any reason.
> > 
> > Satya Tangirala (1):
> >   f2fs-tools: Introduce metadata encryption support
> > 
> >  fsck/main.c                   |  47 ++++++-
> >  fsck/mount.c                  |  33 ++++-
> >  include/f2fs_fs.h             |  10 +-
> >  include/f2fs_metadata_crypt.h |  21 ++++
> >  lib/Makefile.am               |   4 +-
> >  lib/f2fs_metadata_crypt.c     | 226 ++++++++++++++++++++++++++++++++++
> >  lib/libf2fs_io.c              |  87 +++++++++++--
> >  mkfs/f2fs_format.c            |   5 +-
> >  mkfs/f2fs_format_main.c       |  33 ++++-
> >  9 files changed, 446 insertions(+), 20 deletions(-)
> >  create mode 100644 include/f2fs_metadata_crypt.h
> >  create mode 100644 lib/f2fs_metadata_crypt.c
> > 
> > -- 
> > 2.28.0.806.g8561365e88-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
