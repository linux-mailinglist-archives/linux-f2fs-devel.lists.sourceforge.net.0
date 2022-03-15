Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6734D9336
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Mar 2022 05:10:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nTyVd-0005Mg-M9; Tue, 15 Mar 2022 04:10:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <SRS0=/Wv/=T2=oppo.com=chao.yu@kernel.org>)
 id 1nTyVc-0005MZ-BB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 04:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vZZlFZJf6LI7RLkH/NhQmYHmbP1e1XGU6nU4+uJcufM=; b=fDazrRBc9wf2Xo6sSpURFLcCwc
 vYpUnpS+yGZC1FQsFJY62B6I+tOpLe74NkwVF++ecRqycPnaf/aTwAojoNLfC6IZXxr0i5FD5HfXy
 wv0PUcwFb9cXCdvUwuxGpxMuT8+n8kfzKP8wLGRPRj8rG5TimE3koPbFoWEDLYVh2tBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vZZlFZJf6LI7RLkH/NhQmYHmbP1e1XGU6nU4+uJcufM=; b=kZDSed9N+qZYvcVZk9jPSuwe4J
 ifI1WtP9iNnAd601NLFCkxhP9z4/QRDczVW3+4V0cu3rQd39wEyEa3cwNMk8duEpdT8h6TXBCALIf
 wWH7+wzb9XxrnrnpfrIEDQJ+bw+Qib1Z+u/aVKydxBC+QAxCmJtmdt9SQ0QuXxEjvPBU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nTyVZ-00G6Vm-T5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 04:10:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4D617CE12FC;
 Tue, 15 Mar 2022 04:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22DF3C340E8;
 Tue, 15 Mar 2022 04:01:47 +0000 (UTC)
Message-ID: <de79517f-4fa6-c409-42d4-6187eb968e0e@oppo.com>
Date: Tue, 15 Mar 2022 12:01:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Sun Ke <sunke32@huawei.com>, fstests@vger.kernel.org, guan@eryu.me
References: <20220311094315.2476774-1-sunke32@huawei.com>
In-Reply-To: <20220311094315.2476774-1-sunke32@huawei.com>
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/11 17:43, Sun Ke via Linux-f2fs-devel wrote: > The
 test fail on f2fs: > xattr names and values after second fsync log replay:
 > # file: SCRATCH_MNT/foobar > +user.attr1="val1" > user.attr3=" [...] 
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nTyVZ-00G6Vm-T5
Subject: Re: [f2fs-dev] [PATCH v2] generic/066: attr1 is still there after
 log replay on f2fs
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
Cc: jaegeuk@kernel.org, david@fromorbit.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/11 17:43, Sun Ke via Linux-f2fs-devel wrote:
> The test fail on f2fs:
>       xattr names and values after second fsync log replay:
>       # file: SCRATCH_MNT/foobar
>      +user.attr1="val1"
>       user.attr3="val3"
> 
> attr1 is still there after log replay. f2fs doesn't support fs-op level
> transaction functionality. so it have no way to persist all metadata
> updates in one transaction.  We can use "fastboot" mountoption for this
> case, so during last fsync on qwerty, f2fs can trigger a checkpoint
> which will persist all metadata updates before fsync().
> 
> Suggested-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> ---
>   tests/generic/066 | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/tests/generic/066 b/tests/generic/066
> index 105a7acd..b8465101 100755
> --- a/tests/generic/066
> +++ b/tests/generic/066
> @@ -56,6 +56,14 @@ sync
>   $SETFATTR_PROG -x user.attr2 $SCRATCH_MNT/foobar
>   $XFS_IO_PROG -c "fsync" $SCRATCH_MNT/foobar
>   
> +# f2fs doesn't support fs-op level transaction functionality. so it have no way
> +# to persist all metadata updates in one transaction.  We can use "fastboot"
> +# mountoption for this case, so during last fsync on qwerty, f2fs can trigger a
> +# checkpoint which will persist all metadata updates before fsync().
> +if [ $FSTYP = "f2fs" ]; then
> +	export MOUNT_OPTIONS="-o fastboot"

Can we merge "fastboot" with original mount options? and after the test, how about
recovering to original mount options?

Thanks,

> +fi
> +
>   _flakey_drop_and_remount
>   
>   # After the fsync log is replayed, the file should have only 2 xattrs, the ones


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
