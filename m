Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAA560F8ED
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Oct 2022 15:21:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oo2pP-0006IL-Pk;
	Thu, 27 Oct 2022 13:21:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oo2pO-0006IB-Ru
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 13:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1BqhOyr6Kp2HCOEoQbrh0OH2BmtRsi1Kst2L+mqtST0=; b=IiHN8n1FieGYoQcQFEv6Ys6HPn
 N5VllD1ntSZHEA6/Uasf+BkzLIerZNpiPTlmqfffsTY++rk9oIf61wEdHzepCSwJKd/TCQ3LHZPLv
 PQq7ZspI3qXz46fVjdt+D6iE2uMfJqCkRjNO8fuWNNfn6/4d73FOnyAiZl67EpITUY6U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1BqhOyr6Kp2HCOEoQbrh0OH2BmtRsi1Kst2L+mqtST0=; b=Fp7Nuz7+djhAONssS1J1RQ/J3L
 YAWUFExNFjKcy6gLb27ljL1CbmvVZrj4YY8d8NJo5sQhN65NC6n5TbaNYtvHwfiTwneH/rvJRpVgy
 JYFyzRV8tS78nP06jg5KKm5kfirUZuyY+/uE3HopQW+3bwlxW6VlPrD5R9hIxhu0PTAM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oo2pM-0008At-8B for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 13:21:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2E5B3B825E5;
 Thu, 27 Oct 2022 13:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7224C433C1;
 Thu, 27 Oct 2022 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666876895;
 bh=uUSpxEVe6BcMFJseHMkvWzGv+SrhS09+byNm28WWHeE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=r/xaOfpDj8272rEm55Fhsmx68VHMXsUY9+pQQVMvVJ4fUud6NeteGfCor2eFRRJfT
 JwX4d9W7+1CA9VCMo5s+LTqiHg8yRbAwDqQ09ecj5l3DZZ+t4pz5jOY2Z9ccqP4j/f
 RljnuvgqqK3WOOjKFSH9B3rjL39WmyElnJzW4idruEj8ta57zf0Q9aOjP8KA3iXiog
 1rQykHHnGd6OKBcnJd2g7BSTI9Jrl7KJMEtYVtU+JMZyj1SQlwED1KtsiImv2kWboz
 fKaYZiCH0mWt+ZCk9GArz4IW8lm1JS1FptBUrLm4/NakBmlEhRpKsV5f2LJGsdu/Ns
 7c+D0j/XP43og==
Message-ID: <db6d8470-47f5-39e4-a692-efdc16603144@kernel.org>
Date: Thu, 27 Oct 2022 21:21:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221027102447.75708-1-frank.li@vivo.com>
 <20221027102447.75708-2-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221027102447.75708-2-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/27 18:24,
 Yangtao Li wrote: > Return PTR_ERR(cprc->f2fs_issue_ckpt)
 instead of -ENOMEM;
 > Fixes line? > Signed-off-by: Yangtao Li <frank.li@vivo.com>
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
X-Headers-End: 1oo2pM-0008At-8B
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix return val in
 f2fs_start_ckpt_thread()
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

On 2022/10/27 18:24, Yangtao Li wrote:
> Return PTR_ERR(cprc->f2fs_issue_ckpt) instead of -ENOMEM;
> 

Fixes line?

> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
