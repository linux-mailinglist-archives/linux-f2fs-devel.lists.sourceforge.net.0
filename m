Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA9D771338
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  6 Aug 2023 04:06:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qST9o-0000wU-GD;
	Sun, 06 Aug 2023 02:06:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qST9m-0000wN-EL
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Aug 2023 02:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X+vbfJ0wdY3WL+v0k/CmGQ7odWaBOY2dFHoq9FjRQaM=; b=KF6+G3z2bdIlw7o0Hav73qg0Mi
 dk5lCGygmUiS5f9SoSF3kL2NUvJ8qVflaJuJQBQ3ioyVkb6ehn6ikV3lRCuHv1aycTUJeI7jrUAM6
 0EHtDgqxLtWpO/iBVkBPu5KgnMk33gCKxru7oiL6SZIVl/aLb27umtX0K3MhcaYfDUio=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X+vbfJ0wdY3WL+v0k/CmGQ7odWaBOY2dFHoq9FjRQaM=; b=kvYHsruylHHtqiqb3MjDo7YuvM
 lAIsuE0n2ym8BxD64LM6Vz/RwtZHMsrH6zbKqArusI85qRm2bfpeeIfGcdu8oF2z1Tf4eoW65Wop9
 ML2HRitUwmHRawCXQf3Ur2bufAP9MTqwwsGhgMJOyGE1xDZsfhNDQ3MaTeaVl4XVUu0Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qST9j-00Ed2H-W6 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Aug 2023 02:06:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9411B60F87;
 Sun,  6 Aug 2023 02:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977F0C433C7;
 Sun,  6 Aug 2023 02:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691287557;
 bh=Z4QnozTfyOTeA6ryCGMdqKhzAe2vCk+mRvcfqr/TDAc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dKJyxiFD3aOn3IzP847Q8tCFPdH+u9Cx9OqBpcqrUizUtkVlkZ5leIYSUl8IwbANo
 x5AvixfliXQjyqOQxw/n1CkuigL6VOQvlfNVLMhICwCQxJgpRLY7UkG3+NENE9fGfO
 tgZLnQR5iZyf4bxsBwvGBQrKqIz0z5Vx2oLWTwEFr59AWBeqvIHhwD1X3ZsPpkQ7ff
 9i49QGrRyFQ+mZ1ZZ8l64xiQuNpozK3qoK9+cnzdFVYG51Aw76ft+9F41MxFMef9Rh
 +T1j1/veJ6btMX81rdc361Sh/gr8jq42Y5dLMdNn71HXqxMxNXZU83BTetZn8patvz
 zfIzbhMfy3Oow==
Message-ID: <791fbf71-093e-3ef5-b02b-6d6bba72b57f@kernel.org>
Date: Sun, 6 Aug 2023 10:05:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Wu Bo <bo.wu@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230731012626.6843-1-bo.wu@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230731012626.6843-1-bo.wu@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/31 9:26, Wu Bo wrote: > This patch has been tested
 with xfstests by running 'kvm-xfstests -c > f2fs -g auto' with and without
 this patch; no regressions were seen. > > Some tests fail both b [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qST9j-00Ed2H-W6
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: move fiemap to use iomap framework
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
Cc: wubo.oduw@gmail.com, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/7/31 9:26, Wu Bo wrote:
> This patch has been tested with xfstests by running 'kvm-xfstests -c
> f2fs -g auto' with and without this patch; no regressions were seen.
> 
> Some tests fail both before and after, and the test results are:
> f2fs/default: 683 tests, 9 failures, 226 skipped, 30297 seconds
>    Failures: generic/050 generic/064 generic/250 generic/252 generic/459
>        generic/506 generic/563 generic/634 generic/635

Can you please take a look at gerneic/473 ?

generic/473 1s ... - output mismatch (see /media/fstests/results//generic/473.out.bad)
     --- tests/generic/473.out	2022-11-10 08:42:19.231395230 +0000
     +++ /media/fstests/results//generic/473.out.bad	2023-08-04 02:02:01.000000000 +0000
     @@ -6,7 +6,7 @@
      1: [256..287]: hole
      Hole + Data
      0: [0..127]: hole
     -1: [128..255]: data
     +1: [128..135]: data
      Hole + Data + Hole
      0: [0..127]: hole
     ...
     (Run 'diff -u /media/fstests/tests/generic/473.out /media/fstests/results//generic/473.out.bad'  to see the entire diff)

Other concern is, it needs to test this implementation on compressed file,
since the logic is a little bit complicated.

+Cc Daeho Jeong

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
