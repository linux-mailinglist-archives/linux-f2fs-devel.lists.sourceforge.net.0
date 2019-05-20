Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCEF244DA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 May 2019 01:56:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSs9F-0008Mk-8a; Mon, 20 May 2019 23:56:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hSs9E-0008Me-Nh
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 23:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I4sWcMewtzQOBcHpI/5CEipEMj0dK9Q0jiBoB0Bvnfg=; b=kQxJoKYHk34y84fReurAcEuAIN
 XEjf4uQHgTTaqDB6Sz7IKPnCkttkZdRmnUNZLDf5gBoHx2wFaz6BTXxLHpMe+8dSp4HolVULEo5K6
 zxVb/c3RofxLPq/YavEqo5Q+IbZhpbB9vtOM3J4ZNdZBh5+aElFSnu3xSToiCHapJiI0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I4sWcMewtzQOBcHpI/5CEipEMj0dK9Q0jiBoB0Bvnfg=; b=fTkjV8gIqMm9z5zykwNvbqlg6s
 horMXw33+9ARwOV2xITT1xeh/6+q2g1ydC4zNxazSoSgopfc09RJBQVHVlv7yjrTpTpmHrWzouKuO
 qYcRqwwtf7dE8AoD5ax/quBYtuSLCbVZboJ6EHegEngF5Ixr5QmZF8SmQN2eLJ+I2L4k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSs9D-00CpHa-ML
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 23:56:52 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0991C2083B;
 Mon, 20 May 2019 23:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558396606;
 bh=ccnrkNQnMOaW8QKRfLlMlr+C7aH+qfbWoa5A+EwE1OU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vhh7nKjVXGSL3bBU7V70QScB49qY0MAEvRZIoL59AstzKA4G7x45faE2Q8wShn0rr
 YMMR3bUf0fAebhFOAy4+A7a4nLDWgIUumvro0YZ8luqynVooOeyMashZuZasO+Q+Ql
 idckU6wdsTqU6uNX5Wr/D+4uul/TxA3U2FLFa5FM=
Date: Mon, 20 May 2019 16:56:45 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190520235645.GC61195@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190424175909.71430-1-ebiggers@kernel.org>
 <bc18ee1a-8c31-fe76-fd13-a401ce203095@huawei.com>
 <20190515154943.GB21903@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515154943.GB21903@sol.localdomain>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hSs9D-00CpHa-ML
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: improve filename printing
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/15, Eric Biggers wrote:
> On Sun, Apr 28, 2019 at 02:25:37PM +0800, Chao Yu wrote:
> > On 2019/4/25 1:59, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > - Make buffers for pretty-printed filenames 341 bytes long, long enough
> > >   for 255 (NAME_MAX) base64-encoded bytes.  Then print encrypted
> > >   filenames in full, base64-encoded.  This will be useful for tests I'm
> > >   writing which verify the correct ciphertext is stored on-disk.
> > > 
> > > - Rename convert_encrypted_name() to pretty_print_filename(), to make it
> > >   clear that it handles unencrypted names too.  Also make the output
> > >   'char' rather than 'unsigned char', as it's for printing; and remove
> > >   the unnecessary return value.
> > > 
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > 
> > Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > 
> > Thanks,
> > 
> 
> Hi Jaegeuk, are you planning to apply this patch?

ditto.

> 
> Thanks,
> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
