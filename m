Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 443572CE582
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 03:08:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl0Vq-00027t-3m; Fri, 04 Dec 2020 02:07:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@redhat.com>) id 1kl0VL-00024W-Bx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 02:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HxHGQsBlpLQuTDMJXZrWsBJjFIx/LYv87Cod4+aHr9s=; b=Pgb1GhZWNEN8hudH7IiGADIeaZ
 dd+iMte29f3Sris2ov3Re7opoDe9AdEQwmPcZ1t2f6rhOTTKcjYevBUzKokj3SdHod1BcIVodp43J
 12N9KPjRIt6m9dWCSYgh3VzNAA/pzptrHl5uYhIup1Mml9CIlyoyGHPPFUoqjBG6oZmA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HxHGQsBlpLQuTDMJXZrWsBJjFIx/LYv87Cod4+aHr9s=; b=KO3Ovr3SKWTyVCLsnaYXVHYo2W
 sur7QIccVZup9c4qeQv0m4tL0jYH6ANTadEoTufnZ6tFQQaDf4mYofPRH6CIZHVjehz3FkhZS+A2a
 /7OL+1ev7ZRE0rFucA+vRjRbk3BAYc5mL8a/xfXeJeGtUSSbkBrPA5MUkkO9dAdzZSRE=;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1kl0VF-00EJEq-VA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 02:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607047636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HxHGQsBlpLQuTDMJXZrWsBJjFIx/LYv87Cod4+aHr9s=;
 b=Sr9am3170/gG6ZrPWxD0XyaDvn88GKXQW1xhJT232uzyQjyIncrHtO/INPmCGQxnsFcRTR
 cfCk1QVDbWCCM/r4pfJlgLoUTLfarGcWlPcyqUEzlggAcHfH20kM/rBncLm8CmEojgU4qj
 cDefRSqfY1F6fy2DYy6bxA1RM1TAp+A=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-s1gCRhdqMXGo002Q074Cig-1; Thu, 03 Dec 2020 21:07:12 -0500
X-MC-Unique: s1gCRhdqMXGo002Q074Cig-1
Received: by mail-pj1-f71.google.com with SMTP id gv14so3901691pjb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Dec 2020 18:07:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HxHGQsBlpLQuTDMJXZrWsBJjFIx/LYv87Cod4+aHr9s=;
 b=s1K5VtICtQuiI1nhEWmMliKMvtWYrHOkGV625bNyHqcxs8FHzt7cNAtebnN+613zbB
 5seu/jtN0E1G6vjLGOR4N1y/RFS1HmrKthuR+C+3KGOpQH4gnYGPsZ4snGG0AuNTdNln
 oAFbhT3PL+r24Q7tHbXK3/xH9zzk0Uqhx5wQmWfvy1RVeoclx156R/3a/xCAWGgMWwcx
 fgB9oVRs3/HWjqQfQO3DtOXhk9ofZgXTgjKxmPP8jhZxCS2qaWmMKfeSzBJ8CodHGiQ8
 +Y/4/LsbrZ6J9lZCVMF1F2PX2O4C7xEuXrzrDhyOJ6HY5LkOEFdR5E25LDmxIeEdqxG+
 CVXg==
X-Gm-Message-State: AOAM532DOAo04p9jMIIU4F3Ky8t09El7I4LcO+dKUOR/iad0SIy0LoeC
 7qIn9E12ZsUyZZGrBSdiJnYvvJCISQ8F687eUp+tg445uBEx0zK25OlWkdhKVz4Gr2oo3hKP+KS
 3Kc0O3iPlBmfDoBVkERICZSU0zHXvstEKYhwAsg==
X-Received: by 2002:a63:e502:: with SMTP id r2mr5641671pgh.308.1607047631317; 
 Thu, 03 Dec 2020 18:07:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVCcgiTEAfs2WeNWNAikcp00j2f14t84/QAqAvr6qrNmjA30ji78GzwaEsS5x0E1WOnWspKw==
X-Received: by 2002:a63:e502:: with SMTP id r2mr5641649pgh.308.1607047630945; 
 Thu, 03 Dec 2020 18:07:10 -0800 (PST)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y19sm3063476pfp.211.2020.12.03.18.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 18:07:10 -0800 (PST)
Date: Fri, 4 Dec 2020 10:06:59 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201204020659.GB1963435@xiangao.remote.csb>
References: <20201203061715.60447-1-yuchao0@huawei.com>
 <X8k9UoUKcyThlJNU@gmail.com>
 <20201204003119.GA1957051@xiangao.remote.csb>
 <7b975d1a-a06c-4e14-067e-064afc200934@huawei.com>
MIME-Version: 1.0
In-Reply-To: <7b975d1a-a06c-4e14-067e-064afc200934@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.205.24.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [216.205.24.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kl0VF-00EJEq-VA
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

On Fri, Dec 04, 2020 at 09:56:27AM +0800, Chao Yu wrote:
> Hi Xiang,
> 
> On 2020/12/4 8:31, Gao Xiang wrote:
> > Hi Chao,
> > 
> > On Thu, Dec 03, 2020 at 11:32:34AM -0800, Eric Biggers wrote:
> > 
> > ...
> > 
> > > 
> > > What is the use case for storing the compression level on-disk?
> > > 
> > > Keep in mind that compression levels are an implementation detail; the exact
> > > compressed data that is produced by a particular algorithm at a particular
> > > compression level is *not* a stable interface.  It can change when the
> > > compressor is updated, as long as the output continues to be compatible with the
> > > decompressor.
> > > 
> > > So does compression level really belong in the on-disk format?
> > > 
> > 
> > Curious about this, since f2fs compression uses 16k f2fs compress cluster
> > by default (doesn't do sub-block compression by design as what btrfs did),
> > so is there significant CR difference between lz4 and lz4hc on 16k
> > configuration (I guess using zstd or lz4hc for 128k cluster like btrfs
> > could make more sense), could you leave some CR numbers about these
> > algorithms on typical datasets (enwik9, silisia.tar or else.) with 16k
> > cluster size?
> 
> Yup, I can figure out some numbers later. :)
> 
> > 
> > As you may noticed, lz4hc is much slower than lz4, so if it's used online,
> > it's a good way to keep all CPUs busy (under writeback) with unprivileged
> > users. I'm not sure if it does matter. (Ok, it'll give users more options
> > at least, yet I'm not sure end users are quite understand what these
> > algorithms really mean, I guess it spends more CPU time but without much
> > more storage saving by the default 16k configuration.)
> > 
> > from https://github.com/lz4/lz4    Core i7-9700K CPU @ 4.9GHz
> > Silesia Corpus
> > 
> > Compressor              Ratio   Compression     Decompression
> > memcpy                  1.000   13700 MB/s      13700 MB/s
> > Zstandard 1.4.0 -1      2.883   515 MB/s	1380 MB/s
> > LZ4 HC -9 (v1.9.0)      2.721   41 MB/s         4900 MB/s
> 
> There is one solutions now, Daeho has submitted two patches:
> 
> f2fs: add compress_mode mount option
> f2fs: add F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE
> 
> Which allows to specify all files in data partition be compressible, by default,
> all files are written as non-compressed one, at free time of system, we can use
> ioctl to reload and compress data for specific files.
> 

Yeah, my own premature suggestion is there are many compression options
exist in f2fs compression, but end users are not compression experts.
So it'd better to leave advantage options to users (or users might be
confused or select wrong algorithm or make potential complaint...)

Keep lz4hc dirty data under writeback could block writeback, make kswapd
busy, and direct memory reclaim path, I guess that's why rare online
compression chooses it. My own premature suggestion is that it'd better
to show the CR or performance benefits in advance, and prevent unprivileged
users from using high-level lz4hc algorithm (to avoid potential system attack.)
either from mount options or ioctl.

> > 
> > Also a minor thing is lzo-rle, initially it was only used for in-memory
> > anonymous pages and it won't be kept on-disk so that's fine. I'm not sure
> > if lzo original author want to support it or not. It'd be better to get
> 
> 
> Hmm.. that's a problem, as there may be existed potential users who are
> using lzo-rle, remove lzo-rle support will cause compatibility issue...
> 
> IMO, the condition "f2fs may has persisted lzo-rle compress format data already"
> may affect the decision of not supporting that algorithm from author.
> 
> > some opinion before keeping it on-disk.
> 
> Yes, I can try to ask... :)

Yeah, it'd be better to ask the author first, or it may have to maintain
a private lz4-rle folk...

Thanks,
Gao Xiang

> 
> Thanks,
> 
> > 
> > Thanks,
> > Gao Xiang
> > 
> > > - Eric
> > > 
> > > 
> > > _______________________________________________
> > > Linux-f2fs-devel mailing list
> > > Linux-f2fs-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > 
> > .
> > 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
