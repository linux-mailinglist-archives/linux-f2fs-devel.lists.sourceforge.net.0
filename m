Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2CE2CEF4F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 15:05:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1klBhq-0004Gf-9i; Fri, 04 Dec 2020 14:05:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dsterba@suse.cz>)
 id 1klBhp-0004GO-5s; Fri, 04 Dec 2020 14:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MV6Dm6Qk4TqyKp73V5oU2x8YPCvuZuSXUULp4Pk0nB4=; b=mWIoVv8zz8UmMbcZl+Drs0zsL0
 u9dyQF9dgR74Z51Th3OAOXUIwholHsGspibH1AJvbqduBc7H7zxAZPnAoNmvlXoSriS3rOWofK5QP
 vYQeo8GtbJTDfve0U/sFwX0IGlfFRzd9xqyubkOkcgzlOxLZ0dycEAWZf6x8bC/2Ueys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MV6Dm6Qk4TqyKp73V5oU2x8YPCvuZuSXUULp4Pk0nB4=; b=Pq7+jzcbsC1uoXBy3gFHF19YsS
 n5DWXICT0AAWVBsvOZ2GFG/okNZQaodE2rrXrtgtXYE4bcxQDy+RN5NStLmdbROvbBk+l1q4tKGHf
 z7IpZs8NpmxYfZIAqfuNIypuQ9coX0vUtzfYMB4k2QYz/XVajfEVFmW/V9+3urKt/IRc=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1klBhj-001l65-CB; Fri, 04 Dec 2020 14:05:05 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04381AC75;
 Fri,  4 Dec 2020 14:04:49 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id DBFD1DA7E3; Fri,  4 Dec 2020 15:03:14 +0100 (CET)
Date: Fri, 4 Dec 2020 15:03:14 +0100
From: David Sterba <dsterba@suse.cz>
To: kernel test robot <lkp@intel.com>
Message-ID: <20201204140314.GS6430@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, kernel test robot <lkp@intel.com>,
 Nick Terrell <nickrterrell@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, kbuild-all@lists.01.org,
 linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org,
 squashfs-devel@lists.sourceforge.net,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Kernel Team <Kernel-team@fb.com>,
 Chris Mason <chris.mason@fusionio.com>, Petr Malat <oss@malat.biz>
References: <20201202203242.1187898-4-nickrterrell@gmail.com>
 <202012030743.Xg5AJ7Ms-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202012030743.Xg5AJ7Ms-lkp@intel.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1klBhj-001l65-CB
Subject: Re: [f2fs-dev] [PATCH v6 3/3] lib: zstd: Upgrade to latest upstream
 zstd version 1.4.6
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
Reply-To: dsterba@suse.cz
Cc: squashfs-devel@lists.sourceforge.net,
 Chris Mason <chris.mason@fusionio.com>, kbuild-all@lists.01.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Nick Terrell <nickrterrell@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Petr Malat <oss@malat.biz>,
 linux-crypto@vger.kernel.org, Kernel Team <Kernel-team@fb.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 03, 2020 at 07:58:16AM +0800, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
> 
>    lib/zstd/compress/zstd_double_fast.c: In function 'ZSTD_compressBlock_doubleFast_extDict_generic':
> >> lib/zstd/compress/zstd_double_fast.c:501:1: warning: the frame size of 3724 bytes is larger than 1280 bytes [-Wframe-larger-than=]

Frame size 3724?

>    lib/zstd/compress/zstd_double_fast.c: In function 'ZSTD_compressBlock_doubleFast':
>    lib/zstd/compress/zstd_double_fast.c:336:1: warning: the frame size of 3792 bytes is larger than 1280 bytes [-Wframe-larger-than=]

3792

>    lib/zstd/compress/zstd_double_fast.c: In function 'ZSTD_compressBlock_doubleFast_dictMatchState':
>    lib/zstd/compress/zstd_double_fast.c:356:1: warning: the frame size of 3808 bytes is larger than 1280 bytes [-Wframe-larger-than=]

3808

>    lib/zstd/compress/zstd_fast.c: In function 'ZSTD_compressBlock_fast_extDict_generic':
> >> lib/zstd/compress/zstd_fast.c:476:1: warning: the frame size of 2736 bytes is larger than 1280 bytes [-Wframe-larger-than=]

2736

>    lib/zstd/compress/zstd_fast.c: In function 'ZSTD_compressBlock_fast':
>    lib/zstd/compress/zstd_fast.c:204:1: warning: the frame size of 1508 bytes is larger than 1280 bytes [-Wframe-larger-than=]

1508

>    lib/zstd/compress/zstd_fast.c: In function 'ZSTD_compressBlock_fast_dictMatchState':
>    lib/zstd/compress/zstd_fast.c:372:1: warning: the frame size of 1540 bytes is larger than 1280 bytes [-Wframe-larger-than=]

1540

For userspace code it's nothing but in kernel it's a lot for a single
function. The largest number is almost one page, there were days where
this would be one half of the whole stack space. We can't waste precious
resources like that. Taking the userspace code as-is does not seem to
work.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
