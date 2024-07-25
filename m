Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA193BB39
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 05:27:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWp8L-00031T-4o;
	Thu, 25 Jul 2024 03:27:13 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sWp8J-00031N-EP
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 03:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f6BSbULDmCZEYLRQbRhbVR+svwvyRUH47BCW7tNhTx8=; b=ipfhUsV4+rpT58JA1XdQ5aq0E7
 NR0uggNWZy5bMql9YFxa0yJsvLhh0NLBO4BQN68lyonoQ9v8EWchtYHnbygyuCIfbIg805KdBKK1O
 7euaW6NmBQ2G8hjJrt0cPKuEDim4UOtlnmjvdTMuEKsrVsvzsKQ2tNr1WhFJDV0k4B0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f6BSbULDmCZEYLRQbRhbVR+svwvyRUH47BCW7tNhTx8=; b=UVBv7ebPZ22SuCO4c4yT1Trc2k
 ZZd6SaBhhPENkYyL6lWII4UP09CSj+EE5PaF//kI/ehHIAzBlkZ8SpXbTYF9d4gMFJqvJo5MAViNU
 MqP2hdZatEpMwPYnV2rcDrWcTPd6T2d3O+T7Ud6tpblD4MiFpVfSc7Rof9hxbKbOdee8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWp8I-0005tJ-Lx for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 03:27:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E8214CE1067;
 Thu, 25 Jul 2024 03:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC83BC116B1;
 Thu, 25 Jul 2024 03:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721878018;
 bh=gGwMIdCOYRfy/mM7Bd/IbD8r8Bjgo53wbELW0P1EN4E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hcURaIH/dxLxM4HNR1i5CX64gLcFYJpQ3+lgsyCvxDlnGHC5RL2Dr/MRxIU238YU/
 5TVCsR1jWszBpgPqXdDYjBKvtMh413aZ50JJfV4hBFebevAH47FbBDzVPaBIweiLU4
 puC0PFumvsgx0eLr+RfVTG0529zXw+FpFE9sA7WxnD7oF0STxxR/uVTa19r9LDXpnK
 KvpkTXHSwmWHH10B+uGhdZjvKK4DUZiBKa9ZdX1A+bpxcdu7D2u6XrvD55N4Nbyok5
 Dmi6TFoU5GbSTu7a58U/1wCM4uK3UdXtpdqiJieA272spJNcYSPbDLFeKlyrFYOEez
 AOZxTo9irnOcQ==
Message-ID: <cc2ec27b-783e-486b-9f7d-5b9c2d67520d@kernel.org>
Date: Thu, 25 Jul 2024 11:26:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240724175158.11928-1-n.zhandarovich@fintech.ru>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240724175158.11928-1-n.zhandarovich@fintech.ru>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/25 1:51,
 Nikita Zhandarovich wrote: > While calculating
 the end addresses of main area and segment 0, u32 > may be not enough to
 hold the result without the danger of int > overflow. > > Jus [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWp8I-0005tJ-Lx
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid potential int overflow in
 sanity_check_area_boundary()
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/25 1:51, Nikita Zhandarovich wrote:
> While calculating the end addresses of main area and segment 0, u32
> may be not enough to hold the result without the danger of int
> overflow.
> 
> Just in case, play it safe and cast one of the operands to a
> wider type (u64).
>   
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
> 
> Fixes: fd694733d523 ("f2fs: cover large section in sanity check of super")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
