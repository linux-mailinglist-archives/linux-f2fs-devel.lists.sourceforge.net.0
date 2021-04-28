Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF8236D956
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Apr 2021 16:14:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbkxa-0004s2-PM; Wed, 28 Apr 2021 14:14:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1lbkwc-0004pc-BU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Apr 2021 14:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aMWl7cxafDrEpqfG7xSZ21qaAbpxvje1RNmB4bZrhrs=; b=PYHy6Bh4ehhRge+OqTgrvj+5FT
 Gz7qJzxDkY7S6uFkk/qsyQdw9lg/8ksaMWMjgJ6Wc8tFVHA0bhqhhHcI6cVJC9roOTsz+ovGje+CA
 /lpUe1ULWxbLIofCkFP0U8CziFyRfMBpg0CQeec5ORh3cCBZxXPhAKMsKptkDRNO7gyw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aMWl7cxafDrEpqfG7xSZ21qaAbpxvje1RNmB4bZrhrs=; b=LwGSpU6JEvzN9zmv3V/zQ2TdN7
 sF8+aiPDFeNurJpNsyBcXa7ITr8hFM1EekE8Vrk+KTLfpnyTXpYtKJaaovAA8qnb1QITMFUKec974
 7Ee0K0IPddpmM4AwCCsyFhO0vWnW1EiYfjYgqdAXb4igPntfp8KC8hAs5PLPK1un4PFo=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lbkwS-0004c6-9a
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Apr 2021 14:13:39 +0000
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 13SECx3x023455
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 10:13:00 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id A932815C3C3D; Wed, 28 Apr 2021 10:12:59 -0400 (EDT)
Date: Wed, 28 Apr 2021 10:12:59 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YIlta1Saw7dEBpfs@mit.edu>
References: <20210423205136.1015456-1-shreeya.patel@collabora.com>
 <20210423205136.1015456-5-shreeya.patel@collabora.com>
 <20210427062907.GA1564326@infradead.org>
 <61d85255-d23e-7016-7fb5-7ab0a6b4b39f@collabora.com>
 <YIgkvjdrJPjeoJH7@mit.edu> <87bl9z937q.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bl9z937q.fsf@collabora.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lbkwS-0004c6-9a
Subject: Re: [f2fs-dev] [PATCH v8 4/4] fs: unicode: Add utf8 module and a
 unicode layer
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
Cc: ebiggers@kernel.org, kernel@collabora.com, drosen@google.com,
 ebiggers@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 27, 2021 at 11:06:33AM -0400, Gabriel Krisman Bertazi wrote:
> > I think the better argument to make is just one of simplicity;
> > separating the Unicode data table from the kernel adds complexity.  It
> > also reduces flexibility, since for use cases where it's actually
> > _preferable_ to have Unicode functionality permanently built-in the
> > kernel, we now force the use of some kind of initial ramdisk to load a
> > module before the root file system (which might require Unicode
> > support) could even be mounted.
> 
> FWIW, embedding FW images to the kernel is also well supported.  Making
> the data trie a firmware doesn't make a ramdisk more of a requirement
> than the module solution, I think.

I don't think we support building firmware directly into the kernel
any more.  We used to, but IIRC, there was the feeling that 99.99% of
the time, firmware modules were not GPL compliant, and so we ripped
out that support.

So my point was with the module support, it's *optional* that it be
compiled as a module, which is convenient for those use cases, such as
for example a mobile handset --- where there is no need for modules
since the hardware doesn't change, and so modules and an initrd is
just unnecessary complexity --- and firmware, which would make an
initial ramdisk mandatory if you wanted to use the casefold feature.

Put another way, the only reason why putting the unicode tables in a
module is to make life easier for desktop distros.  For mobile
handsets, modules are an anti-feature, which is why there was no call
for supporting this initially, given the initial use case for the
casefold feature.

Cheers,

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
