Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3072343A933
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Oct 2021 02:23:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfAFv-0005dk-Mv; Tue, 26 Oct 2021 00:23:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mfAFu-0005dZ-5b
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 00:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d3gvAYC7gisBvuQTd0NYnruT7z/289A2c9cG2Ak/cVQ=; b=W0L6Oo1j9buiq994mKwaR/amCr
 aZgI49/5xKaHbcM0F2AWTjWvPpTu/c4NgJ9CVTYvi04Zd0lsQoSYXfAKx6TRLBUxmU+mxyuR8E6bp
 xBnYwM8FJ0W1fIpp7UhdoevGainhPDULlNm+muqTBkmrAJ5T+fjYD2viJn1ODwMRl9yw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d3gvAYC7gisBvuQTd0NYnruT7z/289A2c9cG2Ak/cVQ=; b=FJQ8i/V5KZ0DsEe5Sprryk50d5
 8T5CAqbfuvSvm6PeW1d1522x1RKEJSry77w+S03Ic5wGdGjF1T7Mjt5NhEP0lR+4y0x7lC7FvEY0J
 K5YkacJzyT+fDN4keIb/iPnESLw3/+2HieHNfTAR8Cu14/ETmCda5x3YJ73ooh9C7nNY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfAFs-0005e5-Rk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 00:23:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B36FE60FC2;
 Tue, 26 Oct 2021 00:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635207822;
 bh=X4URehZSW2EUW+6kqx7H/4YQ4IILjFVgONmjP9AEGRw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F4GugLMD0oTkYf9qDSZ6dtfzf/YnWw/wA0xy9ntQZlIr6AcSqdLLYwNROgtJqdXW9
 /3FMgdDVKS/LBa/D/z72Twu0173QSSccYBBxJXauVPtmfEiY/DMZPoFF6KWnI1UbV/
 WF3jMKuVqfKcZT7X3q/9Et2ZRq26RTT2JEFbybKdH7NsMwAT6xre4TzSJGhxHfegny
 QVKknz8b1e0VCkonusNY4yjh0PCvckG5onvju0WVv2BFrLqIuZaMLdlFCawLUfXgJu
 UiSaMINXaWiqx8iCL27gOdb2dY93Pv0BXYeC7u6n5LgP/FvpzBs+9BzE7Fwfs+MdZD
 iP2VkuSFV/oPA==
Message-ID: <630e58f1-6c27-ad97-2c3e-72a959cd8142@kernel.org>
Date: Tue, 26 Oct 2021 08:23:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk.kim@gmail.com>, Fengnan Chang <changfengnan@vivo.com>
References: <20211023030835.218219-1-changfengnan@vivo.com>
 <CAOtxgye-6iZ8P7TdTib3wi+DRb2XHHnVdZe-0Yr3R-Wz017paw@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAOtxgye-6iZ8P7TdTib3wi+DRb2XHHnVdZe-0Yr3R-Wz017paw@mail.gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/10/26 5:56, Jaegeuk Kim wrote: > Could you please
 take a look? > >
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=00426e4d450aad0ed66b04a16959e1895c1d29e7
 Looks good to me. 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mfAFs-0005e5-Rk
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress: fix overwrite may reduce
 compress ratio unproperly
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/10/26 5:56, Jaegeuk Kim wrote:
> Could you please take a look?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=00426e4d450aad0ed66b04a16959e1895c1d29e7 

Looks good to me.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
