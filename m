Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9A12C8E48
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Nov 2020 20:43:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjp4k-0006qf-8s; Mon, 30 Nov 2020 19:43:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kjp4V-0006js-Al
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 19:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0NMZI3KwqVrJhjvhdKXBVCYUQQFFXi3QbS59sB9SJz8=; b=Mwh6dB8CjslT8uyoNhZJx9jiiE
 jWCH9ciNNL2+JEjK0IAY396g3NTdsyl1OMqH4yRT6wNL4FadsYZ4BgbKaHGZxdhH9cIj+DXIuZkUs
 Ev/mwDac8EeGQyCR2wsoTvKB6Ho3UcwevUeWE7YMJmUNPvavypdCojMaWhBp4bhJm1iA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0NMZI3KwqVrJhjvhdKXBVCYUQQFFXi3QbS59sB9SJz8=; b=WUosVL90LpF9NwmEk/rHg+CHGr
 49LjniQ9qpAzNqX7n/SzEUtt6baiS0/H8+Pu/bmFy53Hv8xG20trXI6PpsJguuItG/taqDGMZ/im/
 j+6GAM5iJ21wqFcjVv3RDnRtd0SnK07LZ7SHbqEv7jfWttNLg4MMpjWSe2nJxlMNv+WU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kjp4N-007P1x-IB
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 19:42:51 +0000
Received: from gmail.com (unknown [104.132.1.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83C7820709;
 Mon, 30 Nov 2020 19:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606765350;
 bh=0NMZI3KwqVrJhjvhdKXBVCYUQQFFXi3QbS59sB9SJz8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JOzo5GT8CfJGGdJ9E94TIKlDdqVO0mqkysWP9am6QBz3tLla3cKlSUCOyZ44yEonf
 xNjNX8jyj5Her2thZe8lARYwbex8IW+dPe6nd5wU65l2OAj2NP8KGb97XNG2OA9KwK
 5cB9H/imoEEn5Z7Rx91da40EON5gzH4ub9Jjl+fs=
Date: Mon, 30 Nov 2020 11:42:28 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andreas Dilger <adilger@dilger.ca>
Message-ID: <20201130194228.GA1248532@gmail.com>
References: <D1AD7D55-94D6-4C19-96B4-BAD0FD33CF49@dilger.ca>
 <X8U8TG2ie77YiCF5@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X8U8TG2ie77YiCF5@sol.localdomain>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kjp4N-007P1x-IB
Subject: Re: [f2fs-dev] backup/restore of fscrypt files
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Sebastien Buisson <sbuisson@ddn.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 30, 2020 at 10:39:10AM -0800, Eric Biggers wrote:
> (Allowing only direct I/O on files that don't have encryption key unavailable
> may help...)

It may sense to only provide the ciphertext when reads are done using
RWF_ENCODED
(https://lkml.kernel.org/linux-fsdevel/cover.1605723568.git.osandov@fb.com),
rather than making normal reads return ciphertext when the key is unavailable.

Ciphertext reads would always be uncached, which would avoid two conflicting
uses of the same address_space.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
