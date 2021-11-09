Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDA144AF42
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Nov 2021 15:13:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkRsj-0004qk-Rn; Tue, 09 Nov 2021 14:13:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mkRsi-0004qd-Ro
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 14:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HlTC5yjheYuLHbVhcWFURAHUHMUMxl7B6Px0J8ZM2r4=; b=YuDOWXYwm73vHDWpeJgkuA3yoP
 UNW9LAdZN7Pj3GPx57HRnMOhvQMXfZeBWDAmFGdk6sWQyDM/Gk4+s1/mrdBaD3JVDBMVfAfaiZ3lX
 kpGzmnHhULt6Bg+MgEwndSfXkKIKj7au5KsYBmCLDDtel0p+egiMZHHao3IP9by7yCAo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HlTC5yjheYuLHbVhcWFURAHUHMUMxl7B6Px0J8ZM2r4=; b=EZMJcqpBCgflLcxsKStfcxsny6
 Ha/ClxNPzUzIdL2Puz27TaThyEAKSFbyPILXNoqXjsSvufmSlfxyTGTzKpn4VyMQfw8xVUv3FUOOm
 oDQSbX9BZr8TwktZopezIxwarYHw046F6tJH8+1KpM8OA2oNJDCu25n9m4yQYG4xtadc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mkRsi-0003Lp-AX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 14:13:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0D4A610F7;
 Tue,  9 Nov 2021 14:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636467222;
 bh=MGSLQGW0xc+DWm75GDocxEAYZtiWV6/1Wnd11MV/x94=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=oRrqWIRCbAaEdvxSdsHnyKJyAa/MADjFZmJ3o63qG24rIe09sW/RlgaARBniDC8Wu
 e7max1r7YnvQxCljCB44a5zYfm3o2UwkaxmL97h0eNT90nM8zQaoD/RCN1CWtYawp9
 Z5HwmnrrEqt7OE2ThrCToY974bmcwvvHoIMS5gr3/vXWOvBsYniBXjq77Y0zTrIfdh
 B+NrSJAc25dV9cuRLC2T67RePBSqDLgknlK997Cu+9CBv+VgFHSKVL1wvQBGTtlx88
 ljoYxyZhOKa1uV2Uuq7IAVAl+od35YnxCXhK2Dn6YEMqZNPz4bEOjvQNwih9ix7jzv
 /qU/dZB6vPfcw==
Message-ID: <e7a51ef7-730e-1fe1-8e2d-284bf70841e9@kernel.org>
Date: Tue, 9 Nov 2021 22:13:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20211109021336.3796538-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211109021336.3796538-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/9 10:13, Jaegeuk Kim wrote: > This patch adds a
 way to attach HIPRI by expanding the existing sysfs's > data_io_flag. User
 can measure IO performance by enabling it. > > Signed-off-by: Jaeg [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mkRsi-0003Lp-AX
Subject: Re: [f2fs-dev] [PATCH] f2fs: provide a way to attach HIPRI for
 Direct IO
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

On 2021/11/9 10:13, Jaegeuk Kim wrote:
> This patch adds a way to attach HIPRI by expanding the existing sysfs's
> data_io_flag. User can measure IO performance by enabling it.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
