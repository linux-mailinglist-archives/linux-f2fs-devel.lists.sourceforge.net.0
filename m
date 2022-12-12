Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F48649C06
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 11:24:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4fys-0006zy-FQ;
	Mon, 12 Dec 2022 10:24:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4fyk-0006zb-4T
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 10:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L9QnaBnvn2+Abm0vOPKz04m1m/c5yR6gq85wq3MkYhI=; b=WSysQg2+8XhUSVrTVXcmmq8OK2
 PAI0m5UdDLft7fCBJZ049xQYKT1wYiXmYo6zpD/Kk6Znv0EgYxeH4EhulyD2Et2SUNBKEYyO/HoN1
 PPnpS43x7t5ctN13+H4jHnurdXhxrZH4cguDhx0hqnptXUc/GgXLQ9f175IZUh4giZMM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L9QnaBnvn2+Abm0vOPKz04m1m/c5yR6gq85wq3MkYhI=; b=e1MdDwLmZWxzYhP8f3RPLJgFnI
 pOrksHUx3QABD5AkP9s5dWEFvaxZ4kzOCKFvgy8LI/AjDHagBNTWHbg8Hrn06mHEC2G5HKsZF3ns6
 aDkBLNRJX81QOfuRpetxVt33xDt4gzvmEHrdMmt8b55/5LMJSMVBmgRBtrBLqU9HGDoQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4fyd-0003hn-FH for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 10:24:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62F3DB80B9F;
 Mon, 12 Dec 2022 10:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C722AC433EF;
 Mon, 12 Dec 2022 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670840635;
 bh=QVh2FacIZw0QmY6waNMNoeqr2IOPISHIV0yA3SQCiHs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oWJU4bJtY7LAZR1dUBK/bUpJjV/aZWjAu5HXBTSzxSUDpkRvvrpDkuoum3q8tuxXa
 99F9kBA3RZkraB1ragitgbvoEgK4w9j20jV+j1bk6HXhzkcfyGpgegaKAL6RXSe/7v
 WQFfww3ihE9keWdRYuFoZmadgKgtEVQJvA88tc15fy43xUEzpTz3TL8YOPw+KzzKUJ
 h6FtXRolaAlQ16Jd1KaIH4fSGxr/tJZ+5bcLwCL0m50unuuegLSQSvdj+Ml/aK/K8A
 cyFF9QJQGW0U4ZhnRoGtEoB7VNa3sc4iv9kcQTJMRD2zHaU6Q9B+9640/tNHn4+BOr
 WwvhZ3YdPFwWA==
Message-ID: <c559c081-b9db-38dd-4c63-d22df4614c02@kernel.org>
Date: Mon, 12 Dec 2022 18:23:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Yuwei Guan <ssawgyw@gmail.com>, jaegeuk@kernel.org
References: <20221211130841.113959-1-Yuwei.Guan@zeekrlife.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221211130841.113959-1-Yuwei.Guan@zeekrlife.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/11 21:08, Yuwei Guan wrote: > In non-foreground
 gc mode, if no victim is selected,
 the gc process > will wait for no_gc_sleep_time
 before waking up again. In this > subsequent time, even th [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4fyd-0003hn-FH
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: reset wait_ms to default if any of
 the victims have been selected
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/11 21:08, Yuwei Guan wrote:
> In non-foreground gc mode, if no victim is selected, the gc process
> will wait for no_gc_sleep_time before waking up again. In this
> subsequent time, even though a victim will be selected, the gc process
> still waits for no_gc_sleep_time before waking up. The configuration
> of wait_ms is not reasonable.
> 
> After any of the victims have been selected, we need to reset wait_ms to
> default sleep time from no_gc_sleep_time.
> 
> Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
