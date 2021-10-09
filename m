Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55206427724
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Oct 2021 06:24:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mZ3ul-0002by-FB; Sat, 09 Oct 2021 04:24:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mZ3uj-0002bq-Tb
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Oct 2021 04:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tdsmBzv6vSUatL52VQ4NlO0ZOSULLbLEqCmNPlto1qE=; b=O11MHUjYMDXR7EKJjtB/tj+5sL
 QvX0BcswjomT7vracDCpIcNHwVaraWtcDvIWl8E1dCycxrpOqIogyMYMyKz7NW4JqLLWc89Tg3hAT
 cGF0FncDHT2oqg20eUFMm80hW4x1FDEORzX6hH5QAC8YTyGET1lLUJuyvIWAYj+1y5ZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tdsmBzv6vSUatL52VQ4NlO0ZOSULLbLEqCmNPlto1qE=; b=NHS3qmXW4EoO7YlhVaTjSzDpXW
 GOTIkWQOhctwIuvouYgDc0iDXuok+GIk0HMwBV57IuO/lEFXyUpjkGBa/lmm0U4SuLpilpD/2MXE/
 prYSSx2fBz8zHDyNgRCDRU43rx8sxJFCQ6Bq0LlTy4jvNXF/7W1Jc+lMvdcy/56Kmokg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mZ3ua-0008GI-L9
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Oct 2021 04:24:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8868960FD7;
 Sat,  9 Oct 2021 04:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633753475;
 bh=ziwox/3IPHFZ71CM62L5TFAi8Z8VL2tm8zXgH6+KQZQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=S1CFT7su1MlEsaYtzgDHbEI3QvBE+AnJXOzxJXdBBWwT03VLEGBuIlu6XUPP5m0fI
 MPkjiWwhJPDHLN9FuVefyA37GqDyR+d645D5Fzn4BUseX5KEgHxDbd97Stjp1Q5JRK
 BVG0CbRdLGUqlOkYY/Me9cpzwPcEbOb5yyF4wtWLdAPbyoYE65wpnpUrDnsBQISmXu
 HyLxtqpOZwG1awF+NRTy5kWHyctViP3gQlb9defCalbHNJTEhMCPfEaMfcOyoFD1yS
 WRGdlXcH7n/39eqkxaZg/wPxD8vjheqjZXMWKDtk/ewVZphI78GuQUbsX9q7dV8n8C
 XXrOuXQ5WogNA==
To: keosung.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <CGME20210930005939epcms2p7303bf6f96c824720f824989746491cba@epcms2p7>
 <20210930005939epcms2p7303bf6f96c824720f824989746491cba@epcms2p7>
From: Chao Yu <chao@kernel.org>
Message-ID: <a59baec0-02cf-28d6-17cd-3ff6dfdf0a01@kernel.org>
Date: Sat, 9 Oct 2021 12:24:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210930005939epcms2p7303bf6f96c824720f824989746491cba@epcms2p7>
Content-Language: en-US
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/9/30 8:59, Keoseong Park wrote: > Since active_logs
 can be set to 2 or 4 or NR_CURSEG_PERSIST_TYPE(6), > it cannot be set to
 NR_CURSEG_TYPE(8). > That is, whint_mode is always off. > > Therefo [...] 
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
X-Headers-End: 1mZ3ua-0008GI-L9
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to use WHINT_MODE
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
Cc: "changfengnan@vivo.com" <changfengnan@vivo.com>,
 Sung-Jun Park <sungjun07.park@samsung.com>,
 Jinyoung CHOI <j-young.choi@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tanghuan@vivo.com" <tanghuan@vivo.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/9/30 8:59, Keoseong Park wrote:
> Since active_logs can be set to 2 or 4 or NR_CURSEG_PERSIST_TYPE(6),
> it cannot be set to NR_CURSEG_TYPE(8).
> That is, whint_mode is always off.
> 
> Therefore, the condition is changed from NR_CURSEG_TYPE to NR_CURSEG_PERSIST_TYPE.
> 

Fixes: d0b9e42ab615 (f2fs: introduce inmem curseg)

> Cc: Chao Yu <chao@kernel.org>
> Reported-by: Huan Tang <tanghuan@vivo.com>
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> Signed-off-by: Keoseong Park <keosung.park@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
