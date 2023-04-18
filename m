Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5738E6E66D0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Apr 2023 16:12:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pom4N-0005FF-V4;
	Tue, 18 Apr 2023 14:12:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <corbet@lwn.net>) id 1pom4M-0005F9-Mr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 14:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PT2NCMZmHfmFhFO7WyZGuotWhtVsbEgq9Kzj+l34a7M=; b=k76xJ36MqYX73Pc/OQCktZslmD
 qydL7W7W/1iaXsfRsjHTVTTnuba09EAb76n8ROtNS4cS9Kn4TpVoIZeVvdukv9C/1E2BZpUUA+kbb
 fpgxWib8RfCnKLQBJ6RRXTlS9tmnry+B0Yb47Ot/xIDH+fCRX1pKip8FUekRghD3NFX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PT2NCMZmHfmFhFO7WyZGuotWhtVsbEgq9Kzj+l34a7M=; b=KlV9RdzJLTmvneYtrEH0IpEIt6
 PLxIIjs9zIfOSu2ZQ1xLhPXx5rQJ/6Tq7cCWYIgTZqZhTi2xYRvNrcVhu4iszAKPONlwGc1dy1ITU
 K9yyUdTZfNBrk1IGGexGhHPTONaOx66tSjZWl9ggngRCFgqOSnNS6+mD1GZKCMDliRQ4=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pom4J-00BTyV-W5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 14:12:29 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 0296E49B;
 Tue, 18 Apr 2023 13:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0296E49B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1681825650; bh=PT2NCMZmHfmFhFO7WyZGuotWhtVsbEgq9Kzj+l34a7M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qKmHPEkMmP0pBZDYzLk8DxuAtMJRzraMP4DqyUhUdaT6/RVJStVzZDawwe4MX/Nu1
 S5edW14rv/szYB5dh02gjIgPXvYSgH2DREbewUipFAPlDBbx3f3H6+JUJGCAUYydeI
 2sbUSQNLb6iZsC4hHH3fUMaV9RF9qgsT6RjcyQI036ZXmYvD0ElTbfJoJ/031GoFQa
 NMi4dr7qeTtDNEYt4xVhnmvxmco0HrNtkmRMCDw3aMqUYsFvAyZCacn/aoFZzuNMbp
 immz4RPN+fhTfvn+hX6X2Ft0IN1hVX7ZniZRGFymKJT7mqQNSjLi6Ep+eR45MS7BoX
 qZ6NXu97r9h0A==
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Yangtao Li <frank.li@vivo.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
In-Reply-To: <4517330a-00a3-220f-2fc5-a9ef4aba5ea8@gmail.com>
References: <20230417044100.56409-1-frank.li@vivo.com>
 <4517330a-00a3-220f-2fc5-a9ef4aba5ea8@gmail.com>
Date: Tue, 18 Apr 2023 07:47:29 -0600
Message-ID: <87354xe1zi.fsf@meer.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Bagas Sanjaya <bagasdotme@gmail.com> writes: > On 4/17/23
 11:41, Yangtao Li wrote: >> Let's descrbie it's read extent cache. > > "Clarify
 the fact that extent_cache and noextent_cache toggle read > extent cache
 on or off." 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [45.79.88.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pom4J-00BTyV-W5
Subject: Re: [f2fs-dev] [PATCH v2] docs: f2fs: specify extent cache for read
 explicitly
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> On 4/17/23 11:41, Yangtao Li wrote:
>> Let's descrbie it's read extent cache.
>
> "Clarify the fact that extent_cache and noextent_cache toggle read
> extent cache on or off."

Please stop nit-picking patches.  This is good enough, though I might
fix the "describe" typo on the way in.

>> -extent_cache		 Enable an extent cache based on rb-tree, it can cache
>> -			 as many as extent which map between contiguous logical
>> +extent_cache		 Enable a read extent cache based on rb-tree, it can cache
> "... . It can cache ..."

Bagas.  Enough.  Seriously.

>>  noinline_data		 Disable the inline data feature, inline data feature is
>>  			 enabled by default.
>
> "Disable inline data feature, for which the feature is enabled by
> default." (submit as separate patch).

And please stop trying to make additional work for others.  If you want
to improve something, submit a patch yourself.

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
