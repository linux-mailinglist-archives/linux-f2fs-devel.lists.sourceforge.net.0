Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ECC4D27E5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Mar 2022 05:31:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRnzE-0005iU-H8; Wed, 09 Mar 2022 04:31:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <SRS0=QOns=TU=oppo.com=chao.yu@kernel.org>)
 id 1nRnzA-0005iK-PH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 04:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/VakhT8y7lheG0/1R/ughRVGRiqmgfDAKWKHGPDL3SI=; b=dZuZK0Q06feePgCC65JMxoBkqO
 rhdurTbILZi1lNmxFs0u1OqrejrQ/mC4wa12y3bVlZCArWvlG0tvG+/SbqSP3sW/zRhj2HR+4TLGk
 cztuB+zn/tDXVOW/ScGrKQKobGO+ZRhDPf43lclzc3/V1C5w2O7bTrWZ9BuoIwUCy70Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/VakhT8y7lheG0/1R/ughRVGRiqmgfDAKWKHGPDL3SI=; b=R0e/kBg1KGHhXDI8xwyjmmnVlo
 6Jj/YiZOWg/zrT7x0im8HnZjJyUAkQ1tq0s9cT8EDCPRkOj/MfcEKN2r6ukNNwxwldrSqGV8e3Vig
 OWfmJF3NhSF2DFCmI8zkZrk6CZhp/X86mZKpi6H/EWyIVPIiZKQt+nlTW8vgdMx4MopU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRnz8-009Lv1-D4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 04:31:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6FE70B81CD2;
 Wed,  9 Mar 2022 04:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41C7C340E8;
 Wed,  9 Mar 2022 04:31:19 +0000 (UTC)
Message-ID: <cd2a245e-b9d2-c09c-0f8c-a7ca9157ca9f@oppo.com>
Date: Wed, 9 Mar 2022 12:31:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Sun Ke <sunke32@huawei.com>, fstests@vger.kernel.org, guan@eryu.me
References: <20220228035719.4102745-1-sunke32@huawei.com>
In-Reply-To: <20220228035719.4102745-1-sunke32@huawei.com>
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/2/28 11:57, Sun Ke via Linux-f2fs-devel wrote: > The
 test fail on f2fs: > xattr names and values after second fsync log replay:
 > # file: SCRATCH_MNT/foobar > +user.attr1="val1" > user.attr3=" [...] 
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nRnz8-009Lv1-D4
Subject: Re: [f2fs-dev] [PATCH] generic/066: attr1 is still there after log
 replay on f2fs
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao.yu@oppo.com>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/2/28 11:57, Sun Ke via Linux-f2fs-devel wrote:
> The test fail on f2fs:
>       xattr names and values after second fsync log replay:
>       # file: SCRATCH_MNT/foobar
>      +user.attr1="val1"
>       user.attr3="val3"
> 
> attr1 is still there after log replay.
> I guess it is f2fs's special feature to improve the performance.
> 
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> ---
> 
> Is it a BUG on f2fs?

I don't think so, it fails due to f2fs doesn't follow recovery rule which
btrfs/ext4/xfs does, but it doesn't mean f2fs has break posix semantics of
fsync().

Could you please try fastboot mountpoint? It may help to pass this testcase.

Thanks,

>   .gitignore                                 |  1 +
>   tests/generic/066                          |  3 +++
>   tests/generic/066.cfg                      |  1 +
>   tests/generic/{066.out => 066.out.default} |  0
>   tests/generic/066.out.f2fs                 | 11 +++++++++++
>   5 files changed, 16 insertions(+)
>   create mode 100644 tests/generic/066.cfg
>   rename tests/generic/{066.out => 066.out.default} (100%)
>   create mode 100644 tests/generic/066.out.f2fs
> 
> diff --git a/.gitignore b/.gitignore
> index 65b93307..135742f5 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -194,6 +194,7 @@ tags
>   /src/perf/*.pyc
>   
>   # Symlinked files
> +/tests/generic/066.out
>   /tests/generic/035.out
>   /tests/generic/050.out
>   /tests/xfs/033.out
> diff --git a/tests/generic/066 b/tests/generic/066
> index 105a7acd..524dc82d 100755
> --- a/tests/generic/066
> +++ b/tests/generic/066
> @@ -17,6 +17,7 @@
>   #
>   #  Btrfs: remove deleted xattrs on fsync log replay
>   #
> +seqfull=$0
>   . ./common/preamble
>   _begin_fstest auto quick attr metadata log
>   
> @@ -32,6 +33,8 @@ _cleanup()
>   . ./common/dmflakey
>   . ./common/attr
>   
> +# Select appropriate golden output based on fstype
> +_link_out_file
>   # real QA test starts here
>   _supported_fs generic
>   _require_scratch
> diff --git a/tests/generic/066.cfg b/tests/generic/066.cfg
> new file mode 100644
> index 00000000..c25641be
> --- /dev/null
> +++ b/tests/generic/066.cfg
> @@ -0,0 +1 @@
> +f2fs: f2fs
> diff --git a/tests/generic/066.out b/tests/generic/066.out.default
> similarity index 100%
> rename from tests/generic/066.out
> rename to tests/generic/066.out.default
> diff --git a/tests/generic/066.out.f2fs b/tests/generic/066.out.f2fs
> new file mode 100644
> index 00000000..8fc58693
> --- /dev/null
> +++ b/tests/generic/066.out.f2fs
> @@ -0,0 +1,11 @@
> +QA output created by 066
> +xattr names and values after first fsync log replay:
> +# file: SCRATCH_MNT/foobar
> +user.attr1="val1"
> +user.attr3="val3"
> +
> +xattr names and values after second fsync log replay:
> +# file: SCRATCH_MNT/foobar
> +user.attr1="val1"
> +user.attr3="val3"
> +


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
