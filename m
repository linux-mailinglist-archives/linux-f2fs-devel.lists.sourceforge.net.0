Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2AC85FB9D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Feb 2024 15:51:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rdAQ3-0002Hb-5a;
	Thu, 22 Feb 2024 14:51:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <m@bjorling.me>) id 1rdAPz-0002HS-Al
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 14:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G2omAYB7XWbRhd+2xEirxMz02GexZSs5D7pV8fUH3/o=; b=EK46R7BYgE7765cuKQLI4iWspN
 tosTQaIQpP6yU/UEJlLm/ABwSPWHEDZQuYW6FmMC2nQU7t7tqNaO5uWzfRAZhr2QEDbTGFqf3zpO9
 CqzapUjO7xXNhhTsTTNe9fwNgjl9kuZZJkWxGb937lGPN5I5x1aLkkHlWxZN2S6cYvmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G2omAYB7XWbRhd+2xEirxMz02GexZSs5D7pV8fUH3/o=; b=IFV8Tf1LQfTB0fxfCNRaMZm8Ko
 OJNdNqtTmb9p/bP16u/nNqMpxLy/eQ6URRQ7YkDjs1Da1/JhgQBR6zcQzZJiXbYcUSqtcSOl1sCYf
 4PgbqY6gqCQBBFJN1oD/VIiHaMjB4QaIk5AIY8vFea5/kc6mF1aB+ECLj9WtYoFQNaaY=;
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rdAPu-0005wE-Qi for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 14:51:24 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 84455581793;
 Thu, 22 Feb 2024 09:33:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 22 Feb 2024 09:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bjorling.me; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1708612423;
 x=1708616023; bh=G2omAYB7XWbRhd+2xEirxMz02GexZSs5D7pV8fUH3/o=; b=
 X6BMthJzZe8KLMXgtf3QUc6/IM/VOLY8qoGWoG1LJgDAJQkN+uiutoLJCbz4iVHA
 rJoizqvYSEJfl6VndSxX+sWk6FRifjve/O8y9uCw4NIqifo+vWDBdoWhPrT17DZF
 bawZphtthywKPVeDpiharKcIWVAjg/TD6/YVi3NePNDDQRTa7CqHEGb2Tj8+ied7
 +J6HTUCMOmn5PNimOx+Xw8Z/NfUrV4nDwV2J0/Les3hqCkmAJR2JB40e/cfXcp90
 JkOhmXrmTe/6yuYUyQB4R0egjNVZIhSYSvMzn7M7pZzz94iSrxQ2kPuZbM7wSM2F
 FMBOEf4KjK8vAsHD3C3xUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=if4314918.fm1; t=
 1708612423; x=1708616023; bh=G2omAYB7XWbRhd+2xEirxMz02GexZSs5D7p
 V8fUH3/o=; b=C9GNx5wIwzDkbmTor117zgXQXhFM00YLxso2Pxm+iy35d4xdGj8
 kKaK/+Jn00ThI+MRrpjgdavVFSXKkX39oDZRN55iA0o0gJ7XQ/x34D2ZcZYXF0uh
 Me7N91KPCQ4sJo6zuNv9flsaObgbdiFb86Ok8ZoM1Tv8gQwbzlhwpdgp09k5uYTr
 nOqi1eeQms9+vDi+m7Z8GMHcJphnkco0/IMJ5NVAVh+5yTJXKJcysBX5OEg5Ud6W
 e4ux223ALzp46xQUnJLb2gxdqx6gXPu5hWvGtpDtXgQXWHmIeYagqJgxnVdoWDtY
 fb40jOjKRD8wLCc8pT2cxYtL75PMWhf2D6w==
X-ME-Sender: <xms:RlvXZYeDTx2HiZFSV8L1cbsV1T4d3gXTjmtmYvnOBlDTFoBwWcmXbw>
 <xme:RlvXZaNmcIVnQ0pyFpqofyeqTWAS4dKuOSOAEHdSl4QKA75HbziZTF4Odx5YUeHvn
 -Sin1R9iJzF0v52TNE>
X-ME-Received: <xmr:RlvXZZh9trwzcbS6jbm25u9Wb37LaJVrutavIJsBMdVGIGxdRInKF2747dVxP24xmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeggdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepofgrthhi
 rghsuceujhpprhhlihhnghcuoehmsegsjhhorhhlihhnghdrmhgvqeenucggtffrrghtth
 gvrhhnpeduveehjeetteffjeeltdefgeekhfeufeelheejfedvhfeutdffiedvtdfhudeh
 hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmse
 gsjhhorhhlihhnghdrmhgv
X-ME-Proxy: <xmx:RlvXZd91jSv1s27xR-ASgEhMYnYeQutteABRysgrkT4KNto1bFyi1w>
 <xmx:RlvXZUtO-eoPbQANBG_e2trJW-2w_xFgtApVJ2jM2KnjNSDchSYZww>
 <xmx:RlvXZUFUiMD1e9KDq5FIM5eUcAAZNkDF9PzqhLQHCkPDpDDH8DDBvw>
 <xmx:R1vXZYjY0PRdnmum_PjmFqg6EYHR4DKHYpBgzme6w39muDt0zhclIg>
Feedback-ID: if4314918:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Feb 2024 09:33:41 -0500 (EST)
Message-ID: <65e03e4d-b7ef-27f9-2651-eac372f17a9b@bjorling.me>
Date: Thu, 22 Feb 2024 15:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Juhyung Park <qkrwngud825@gmail.com>
References: <20240207005105.3744811-1-jaegeuk@kernel.org>
 <20240207005105.3744811-3-jaegeuk@kernel.org> <ZcQSV0HyTwoiW8os@google.com>
 <f174092a-192a-47f9-a1d4-14d86bba266c@kernel.org>
 <ZdT3EqOB-wXM1NLm@google.com>
 <CAD14+f106hmLXMOfLu_cd55rAKmv-KLq-HqCSrKULt27OPhk=w@mail.gmail.com>
 <ZdYylhiPrv9Pa7It@google.com>
From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>
In-Reply-To: <ZdYylhiPrv9Pa7It@google.com>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 21-02-2024 18:27, Jaegeuk Kim wrote: >> Doesn't this break
 practically all ZNS NVMe devices? > > Yes, so here I'm in questioning who
 is really using w/ zone capacity. If there's > no user complaining, I'd like
 to deprecate this, since th [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [66.111.4.224 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1rdAPu-0005wE-Qi
Subject: Re: [f2fs-dev] [PATCH 3/3 v2] f2fs: kill zone-capacity support
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, daehojeong@google.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 =?UTF-8?Q?Matias_Bj=c3=b8rling?= <matias.bjorling@wdc.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 21-02-2024 18:27, Jaegeuk Kim wrote:

>> Doesn't this break practically all ZNS NVMe devices?
> 
> Yes, so here I'm in questioning who is really using w/ zone capacity. If there's
> no user complaining, I'd like to deprecate this, since this adds code complexity
> and unnecessary checks.
> 

Hi Jaegeuk,

I like to make a couple of points to hopefully keep the support in a 
little while longer.

- NVMe-based zone devices continue to be developed with the pow2 zone 
size and zone size != zone cap features. There was some divergence in 
the first-gen drives. However, all the second-gen drives I know of are 
implemented with those features in mind.

- A very active community is doing work using f2fs, and many of those 
members are working with the ZN540s device (which exposes a pow2 zone size).

- For drives with a capacity of less than 16TiB, f2fs is an excellent 
file system to use and is really useful for various use cases. We're 
using the f2fs daily for a couple of our workloads.

Work is ongoing on btrfs and XFS to support zoned storage devices, but 
they have yet to be through the trenches as much as f2fs has been with 
its zone support. So it would be great to have f2fs continue to support 
the pow2 zone sizes, as it is a valuable feature for the currently used 
and second-gen drives that have been released or are soon becoming 
available.

If there is a performance concern with the feature re: ZUFS, maybe the 
pow2 implementation could be slightly more computationally expensive, as 
the feature, anyway, typically is used on more beefy systems.

Regards,
Matias


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
