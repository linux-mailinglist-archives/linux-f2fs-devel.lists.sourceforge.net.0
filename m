Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49712139E70
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jan 2020 01:41:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irAHK-00013G-8x; Tue, 14 Jan 2020 00:41:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1irAHJ-000139-17
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 00:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rNLA2aIsg2KWijZTSC3EgL5aU50anHJ4KTrPKnTDJhQ=; b=Z442teTG/p4eyaOJIHtGvufHGK
 TS1JhwYU6K/QJjnEIwm8kA5jVoO3AA96E3Dk3MDGzqahz95iKpMdd5DswM4Bun7eXIsaUnGwpau5G
 MivweCd08QqvAhyXDvIaeu5SkNzi6GzxNu7BICGbbnNgBfca0iSXW28xN3s46qL9CpsY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rNLA2aIsg2KWijZTSC3EgL5aU50anHJ4KTrPKnTDJhQ=; b=dXLop1vJ84ppWz1vCgow5iRLI8
 BHqxA1UxeKKFhzo1kIj2S/wJcAIhEFmOautzdLK4vLEnkZs5QT2qK49V6BLH3qulERqvhhPd61/IZ
 4VFPMWtVyVdOrz8ZCzmaSOwLFT1WLHE3cc3knJ45qaAlZ/wuY/kL+jQxk8iGXJlvWZIE=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irAHH-001l8f-Gh
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 00:41:52 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-111.corp.google.com
 [104.133.0.111] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 00E0fbEI006931
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 19:41:38 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 5C3A54207DF; Mon, 13 Jan 2020 19:41:37 -0500 (EST)
Date: Mon, 13 Jan 2020 19:41:37 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200114004137.GQ76141@mit.edu>
References: <20200106205410.136707-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106205410.136707-1-ebiggers@kernel.org>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.5 MAY_BE_FORGED          Relay IP's reverse DNS does not resolve to IP
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1irAHH-001l8f-Gh
Subject: Re: [f2fs-dev] [PATCH v3] fs-verity: implement readahead for
 FS_IOC_ENABLE_VERITY
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 06, 2020 at 12:54:10PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When it builds the first level of the Merkle tree, FS_IOC_ENABLE_VERITY
> sequentially reads each page of the file using read_mapping_page().
> This works fine if the file's data is already in pagecache, which should
> normally be the case, since this ioctl is normally used immediately
> after writing out the file.
> 
> But in any other case this implementation performs very poorly, since
> only one page is read at a time.
> 
> Fix this by implementing readahead using the functions from
> mm/readahead.c.
> 
> This improves performance in the uncached case by about 20x, as seen in
> the following benchmarks done on a 250MB file (on x86_64 with SHA-NI):
> 
>     FS_IOC_ENABLE_VERITY uncached (before) 3.299s
>     FS_IOC_ENABLE_VERITY uncached (after)  0.160s
>     FS_IOC_ENABLE_VERITY cached            0.147s
>     sha256sum uncached                     0.191s
>     sha256sum cached                       0.145s
> 
> Note: we could instead switch to kernel_read().  But that would mean
> we'd no longer be hashing the data directly from the pagecache, which is
> a nice optimization of its own.  And using kernel_read() would require
> allocating another temporary buffer, hashing the data and tree pages
> separately, and explicitly zero-padding the last page -- so it wouldn't
> really be any simpler than direct pagecache access, at least for now.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good, feel free to add:

Reviewed-by: Theodore Ts'o <tytso@mit.edu>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
