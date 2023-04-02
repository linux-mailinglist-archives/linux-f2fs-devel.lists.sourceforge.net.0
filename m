Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DDF6D3846
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  2 Apr 2023 16:18:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1piyXH-0002iw-Bq;
	Sun, 02 Apr 2023 14:18:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1piyXF-0002im-VO
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Apr 2023 14:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YOqHnX+Xvyu1vib25M5bwfYjWU+5xDFrcQ4Hiey//OA=; b=mXrREi+ObWHgkGx+vtYe6lel5k
 EBnqSoWLtsO0tHADeuRpFlXKczD1EFX9IjZ9NsWbj1doAdWDRjMwc4M/YXAbqtBlLfZcmxDkRRo3X
 XEbqcTDY49JjtHYvlsvUnoQSJanIhf79cs9MIKX6FJxX+I5tiTarXuhJ2Mby0ufeK5mc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YOqHnX+Xvyu1vib25M5bwfYjWU+5xDFrcQ4Hiey//OA=; b=c0Fac+5nDIJyboC3OPwAJdLadH
 4yGz0vJXSKs+t+1yw54MjQ2vtt93mL9gDUFMq3ya+ZulTarBLJX5WQ3e5hXv+XhfTPUk8t3lEFemz
 IRPoWXfnN0k/wEihLKtbmhGxe7TKGsqrUnzI3FKeIFP/4oRMagEnRXbYx+/lWh8nGqaM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1piyXF-00CrIK-M1 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Apr 2023 14:18:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 709E3B80E9A;
 Sun,  2 Apr 2023 14:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE42C433D2;
 Sun,  2 Apr 2023 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680445094;
 bh=fz7rffbHJHElbGaSr0rWltKJ8qv5T/nMbg9/U/QGbR8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NGDxqod1lu+IQfUhErJqUeKVJC2V2yJcp7v90Q62vCmFN3NzlrwAOS8+2lMQ5qCeL
 nTG5nZT4KYABdXCQPxrKbjZX7hCo0YVBSI39zhZTSTVbiT0H7cwFioOIPe3Em5ANS6
 sOH0uqHZDz/7+rAhPChZJurdLMToHKki4khUksXyy4VpHV4Ilh9ppza8NW8LL8FQZI
 JZbgzwgr4Q/yVfY2LvnXsAoHGkJMAKrCDjUwGQyY0HzS1MjH7Q0wcZi5+V5kGX28Uj
 wDtWEOrPsV5VkkI/BwrpgiFedmTBVIG7RN3KzizmeBsx4vY0drtKclCb7ZXFktgag7
 1vVR8NELY0ZCg==
Message-ID: <cafc34c2-4d55-0a4b-336f-cadf039e21dc@kernel.org>
Date: Sun, 2 Apr 2023 22:18:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Yohan Joung <jyh429@gmail.com>, jaegeuk@kernel.org
References: <20230402031259.286-1-yohan.joung@sk.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230402031259.286-1-yohan.joung@sk.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/2 11:12, Yohan Joung wrote: > From: Yohan Joung
 <jyh429@gmail.com> > > Fix alignment check to be correct in npo2 as well >
 > Signed-off-by: Yohan Joung <yohan.joung@sk.com> Reviewed-by: Chao Yu
 <chao@kernel.org>
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1piyXF-00CrIK-M1
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix align check for npo2
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

On 2023/4/2 11:12, Yohan Joung wrote:
> From: Yohan Joung <jyh429@gmail.com>
> 
> Fix alignment check to be correct in npo2 as well
> 
> Signed-off-by: Yohan Joung <yohan.joung@sk.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
