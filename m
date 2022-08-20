Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AFE59AAB5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 04:32:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPEHW-0002jR-Fn;
	Sat, 20 Aug 2022 02:32:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oPEHV-0002jC-QI
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Aug 2022 02:32:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dqbt2+EHguaAyJfdsj1pJdiYjugks2h/JwhqKKoBxI4=; b=I51vLLu/nJwSSnCPZw/LDLav9M
 sN5+rtaJRmcLOwi7LOiNzCE07LdfY/ebnR+HkWv2GWj2heHAnid3sVDqKco3cqDBNV0IVHCi1Fj5D
 cEa8r7EdbwtfyznDdC4g9lpvEjfcK6cEGksKL2vrOmR2U/eMM3sij5hxzEmCEoYFBCIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dqbt2+EHguaAyJfdsj1pJdiYjugks2h/JwhqKKoBxI4=; b=CnyKQBYmUUQSR5lN+2poYSFHkF
 DjduW0z0PZiYfC1ft1Slm+1ZvyDkra/cPeY1Qvu5mZCbj41g3VzpXkav0mDVSoxXN4qUKqWtV9e6S
 ZEzSaIwVmtvMBEvv0fu69rnC/fq9pPOPaVzP41FnvAkaU0oxvpA0uTpIKei/jJIxH61U=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPEHQ-0002Mj-Bi for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Aug 2022 02:32:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1B801B82964
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 20 Aug 2022 02:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95113C433D6;
 Sat, 20 Aug 2022 02:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660962720;
 bh=0ifbXkwVaZDFn/JcHj2ZQnv4iXqWMem4eEs4IJYr9co=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=A/XfBhKCOr6ka1fD+wSWxejS+C3JnBcEbPgqo+hBPccQNAOKGJjJsIpSxtipoTi/q
 wfLAKyywPHHe1AxdpVgX4WCPo4E7f4crTbg0aC0V1KEbQo6Numq6f2BzJnqfO5YsQJ
 aougx4XnaAerZ41Q4cKYci14+PrZcYuJc8Jd3ru7uvX4OqwS8Yd61t8MCHvLjBOOFa
 pXkDVx7EXujXxN0/RcznaQ/xkHKiuGD75W4bRYzxVFd5iBu2ng/i0lKHRm7zLG/CEN
 vtLAOw3PAiz8m4yThHLC1N+gvrY2rN3CvWSX+f6V1fir/RqdHiEMOBnpmx7mQ2IeV8
 TwiB5vxOaAsKg==
Message-ID: <347f5fe4-1db6-a8ab-7ab7-398b72f4b2df@kernel.org>
Date: Sat, 20 Aug 2022 10:31:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220811225454.2125297-1-jaegeuk@kernel.org>
 <YwAiZTYkFi/EP/Ls@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YwAiZTYkFi/EP/Ls@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/20 7:53, Jaegeuk Kim wrote: > ATGC is using SSR
 which violates LFS mode used by zoned device. > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oPEHQ-0002Mj-Bi
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: LFS mode does not support ATGC
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/8/20 7:53, Jaegeuk Kim wrote:
> ATGC is using SSR which violates LFS mode used by zoned device.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
