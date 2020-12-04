Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE692CE475
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 01:32:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkz0u-0003lN-5m; Fri, 04 Dec 2020 00:31:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@redhat.com>) id 1kkz0t-0003lH-6u
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 00:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8mAp0zfGpgeyDdpWyEdaWC5DSXakMnn28Gue+5urM60=; b=GMzWKUwmz53KRlfpL5qJVdYcKD
 a+AQCvghzzGOFN5cXEEWYEwY0TnAO6ytKiZ6R5wBebIMu1EXGNF/yaLz4fn3IvpWyTnh4CsS42+eH
 2fP9/VPr1msaxF+LR6m6zSVhrp7cR/SEXdw8AJCpoTA1bFdvEag5L6ML0b/OR0kZs6Xw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8mAp0zfGpgeyDdpWyEdaWC5DSXakMnn28Gue+5urM60=; b=jCro4LrQAoD4Ka4SEwvLB34Hz9
 GvvgV0er8ReKlISxfbpsyPMVrwrYhxspN7e4EbVjH3n11Aqq32lQtD/pAOb4aucFQ0Rd5T3+MolYG
 nTOOSdUAsNEudx11RrJLm3dILURD8Eibtaj+jvyif3OyPsZTdiU+lOJADdV1gKUZ5wlM=;
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1kkz0i-000u7R-2g
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 00:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607041897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8mAp0zfGpgeyDdpWyEdaWC5DSXakMnn28Gue+5urM60=;
 b=PTjLtGsUNAjvMDiWeiPHcu3O2JD/8iYgV2YbW5BGYFJd+yya2En2vswLvxocoHRLOBgcLi
 hCcyS4wfnn+GapoPQFoTTuuaFTJZPtYZ7dXImMUk33UQE4+3n97dezwl5Vr7vCxISCTGCs
 GVF1JxxR6/c2nwZwH3HH9MQZoVc8eLU=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-m7E4thReMRmdABSP0iYJcQ-1; Thu, 03 Dec 2020 19:31:35 -0500
X-MC-Unique: m7E4thReMRmdABSP0iYJcQ-1
Received: by mail-pf1-f198.google.com with SMTP id c22so1829536pfo.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Dec 2020 16:31:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8mAp0zfGpgeyDdpWyEdaWC5DSXakMnn28Gue+5urM60=;
 b=ZUGaB7Bqa9w8wKC9SvbaeuoTFoB6Y+19nN6LCRU+jW7sLvzURVwDVHoT9E0DrM1/Yg
 6puqYna5bp5K9CJIUPVMJs4FFQFKMCsja7iS312yWykh+tlePdrLx07LZSXMV6x1f91e
 hESqMM0hQn0ppSMA2RiCnB8MnnWnyZ/C2FxkpcjUgJWB4r9mhdkTYeu0vlJVnnhuNeEf
 UwNeQ3SOeJwMJio+w+ueR59kFGudWJUkejv4ib4jiOT1ytZW6CR0RrxyRf+Ft48LU9EP
 AfVY4Go0JAO/jALum+dq7lRVvIsRgnSiJ2PmxzdcXOkLcv/5m9TdNhfepux1kRrJY98a
 H+8g==
X-Gm-Message-State: AOAM533V6Urb2C6olX8RrQTsGtylOCm46MO0MfmxSrFYS36T1r82LEZl
 /mD5rLxmFmSpWt1eyhf9St8QhaBPq6P9PhEQq/mtzZgahcZGEiz0Vo1OCe2PHJUWUmkhle7s8cP
 8y/vG4Ep/0771FEwZshtq+7Oh79Xq1H4YrEOrQA==
X-Received: by 2002:a17:90a:fcc:: with SMTP id
 70mr1574190pjz.168.1607041894611; 
 Thu, 03 Dec 2020 16:31:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVzK1aMZnIsdP2uBywNAqLlD6nz6l7chr6tH9+UsvJY25t+xk7F+gDLz78gw2UP2gnAZNkxQ==
X-Received: by 2002:a17:90a:fcc:: with SMTP id
 70mr1574176pjz.168.1607041894347; 
 Thu, 03 Dec 2020 16:31:34 -0800 (PST)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id u205sm2915866pfc.146.2020.12.03.16.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 16:31:33 -0800 (PST)
Date: Fri, 4 Dec 2020 08:31:19 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201204003119.GA1957051@xiangao.remote.csb>
References: <20201203061715.60447-1-yuchao0@huawei.com>
 <X8k9UoUKcyThlJNU@gmail.com>
MIME-Version: 1.0
In-Reply-To: <X8k9UoUKcyThlJNU@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [63.128.21.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [63.128.21.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kkz0i-000u7R-2g
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: compress: support compress level
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
Cc: Eric Biggers <ebiggers@kernel.org>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On Thu, Dec 03, 2020 at 11:32:34AM -0800, Eric Biggers wrote:

...

> 
> What is the use case for storing the compression level on-disk?
> 
> Keep in mind that compression levels are an implementation detail; the exact
> compressed data that is produced by a particular algorithm at a particular
> compression level is *not* a stable interface.  It can change when the
> compressor is updated, as long as the output continues to be compatible with the
> decompressor.
> 
> So does compression level really belong in the on-disk format?
> 

Curious about this, since f2fs compression uses 16k f2fs compress cluster
by default (doesn't do sub-block compression by design as what btrfs did),
so is there significant CR difference between lz4 and lz4hc on 16k
configuration (I guess using zstd or lz4hc for 128k cluster like btrfs
could make more sense), could you leave some CR numbers about these
algorithms on typical datasets (enwik9, silisia.tar or else.) with 16k
cluster size?

As you may noticed, lz4hc is much slower than lz4, so if it's used online,
it's a good way to keep all CPUs busy (under writeback) with unprivileged
users. I'm not sure if it does matter. (Ok, it'll give users more options
at least, yet I'm not sure end users are quite understand what these
algorithms really mean, I guess it spends more CPU time but without much
more storage saving by the default 16k configuration.)

from https://github.com/lz4/lz4    Core i7-9700K CPU @ 4.9GHz
Silesia Corpus

Compressor              Ratio   Compression     Decompression
memcpy                  1.000   13700 MB/s      13700 MB/s
Zstandard 1.4.0 -1      2.883   515 MB/s	1380 MB/s
LZ4 HC -9 (v1.9.0)      2.721   41 MB/s         4900 MB/s

Also a minor thing is lzo-rle, initially it was only used for in-memory
anonymous pages and it won't be kept on-disk so that's fine. I'm not sure
if lzo original author want to support it or not. It'd be better to get
some opinion before keeping it on-disk.

Thanks,
Gao Xiang

> - Eric
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
