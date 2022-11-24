Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1B2637C82
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Nov 2022 16:10:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oyDrj-0005Yf-Eq;
	Thu, 24 Nov 2022 15:10:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oyDrh-0005YZ-U7
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Nov 2022 15:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0G3PVchfznNv9ALdeUzwL+EW6HllTQm7BxqrZeBkTwY=; b=M8kUJuCmRG9jejX5WB+a4VLg+W
 XbrKq9vO0WjQ7jnneSnaMJBj0O3+7Z+EBCwTXaUCx0JcHGPmowj5pYKrkPV8wNyDX8w40yKBqXkyE
 j47gxxXDj1GH4dmRntnOeQCzR43QxrhMy690dCfzYVK3RagtHTnWtPjZsKPDMI+pKxAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0G3PVchfznNv9ALdeUzwL+EW6HllTQm7BxqrZeBkTwY=; b=Cu4malbvN80OLUeyZi7jzL61i8
 KnINcS29Ghe5sjE7Ef9kWzvVMkUj0WN4FGgcR0oOSPT9Gi7JE9+NY4fq6yn8muY0Q95zjIqtZnXGZ
 7rCAYEHMWIm7y1JP9l3eSekL8/D/6NBbhUlR3BIVUxIH/ie/QECuj+JEw0TtrWqkJMB8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oyDrc-0050HO-Pk for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Nov 2022 15:10:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 79B76B827FF;
 Thu, 24 Nov 2022 15:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2ADEC433C1;
 Thu, 24 Nov 2022 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669302601;
 bh=jy/VddZQBiwD+16FHO9sWnOOWepGfjbF8iNxZJH/hF0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=AJy94VGFGikAlAAbsj96vWT9FtJtq8Cig3KLZtlS0NjGokZT35sREumWQzi3Tsc91
 bp9cJbAWh5/SyFsAbazTZdrL3KCWEtcBCxiHrTp5gbMISV6wodCcyT9R9cQ4ohRmRS
 kQc7vKsNZnjFBt8X6RkLipHVAhhxAVSVgLe1DPwPL6+GZ2vUNGqg+pxJC/x3fXt92o
 gUX11vIiNToojxpDVmc+aPQ+4sbR58DvIgLoom5kJPhchi6mySNmx2bvdpLVF1GQ0/
 LhBW4P91bGS9lDZhRzGg08r+/Hw3CQgAzb8Yl4WjDxOPWCDTOClQRDJHqlryQa3/r5
 vvU1FEao1uxmg==
Message-ID: <d8e36305-1f0a-092d-2286-76f40e91e19a@kernel.org>
Date: Thu, 24 Nov 2022 23:09:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: yonggil.song@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20221122090320epcms2p2e5df6f7bb1c2d80ae69fd5e4f84b08be@epcms2p2>
 <20221122090320epcms2p2e5df6f7bb1c2d80ae69fd5e4f84b08be@epcms2p2>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221122090320epcms2p2e5df6f7bb1c2d80ae69fd5e4f84b08be@epcms2p2>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/22 17:03, Yonggil Song wrote: > When f2fs chooses
 GC victim in large section & LFS mode, > next_victim_seg[gc_type] is referenced
 first. After segment is freed, > next_victim_seg[gc_type] h [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oyDrc-0050HO-Pk
Subject: Re: [f2fs-dev] [RESEND][PATCH] f2fs: avoid victim selection from
 previous victim section
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

On 2022/11/22 17:03, Yonggil Song wrote:
> When f2fs chooses GC victim in large section & LFS mode,
> next_victim_seg[gc_type] is referenced first. After segment is freed,
> next_victim_seg[gc_type] has the next segment number.
> However, next_victim_seg[gc_type] still has the last segment number
> even after the last segment of section is freed. In this case, when f2fs
> chooses a victim for the next GC round, the last segment of previous victim
> section is chosen as a victim.
> 
> Initialize next_victim_seg[gc_type] to NULL_SEGNO for the last segment in
> large section.
> 
> Fixes: e3080b0120a1 ("f2fs: support subsectional garbage collection")
> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
