Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F99952728
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Aug 2024 02:49:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1seOg1-0002sY-7u;
	Thu, 15 Aug 2024 00:49:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1seOfw-0002sQ-Dt
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Aug 2024 00:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IK2lqRS6tPkj1MEo1sQpHUQsVRO+f5oY8RH5r84g8O8=; b=UoBthadiJPnz8ZNY5MMAODmaDX
 iDUpoolnpV6LEHHFcqXo8uOrcFZZN8d7Ra82ElV6NJNM3biaHG/b4Bsb5ia7NvveAqAN88z6bxYXZ
 Sggqvjiq3dSQWsLySflY4pph7tudhR9POpBxAk1Pt3cGWhAOzHj/IwuNvI/Ry9qJJkXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IK2lqRS6tPkj1MEo1sQpHUQsVRO+f5oY8RH5r84g8O8=; b=HKEqCSNbsQyufQM0/qicOX2DXT
 wEgHumwY//ZFrHRkw156wI0U8nNui6dX7xlk9vZMKqIn5GHWr5wURkDcHtqGr9xImW8yVtowserQ1
 dC6zCWJ0GRNZ5r0f55oG86LRQPzG1IhGBT6HueaSTzcFcS825B7keGv56k4rlrxSPEWE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seOfw-0002Ch-Ah for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Aug 2024 00:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9AF14CE1A2C;
 Thu, 15 Aug 2024 00:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A801DC116B1;
 Thu, 15 Aug 2024 00:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723682944;
 bh=y8xNM5xTWL+o54BCKSf286utnCJvuhLRMKPjE3Q3tLE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tqSsNCS5y8CTocSxypHY+a1qDcYIxBqGLtoyBzgmDD9NjuNGT0wyctQnGsj8M7atE
 J4AX9w4buCx2TgttsmVr/nuHND2H9MborhV7a3x3RsVxfEcMCzTQ/neZEU644UGaCW
 xuK05485TPr6V2AEPrni7Mh71Az82+uB+UHisioFzRUN0t4h2M5i/hV7y9UBZG7lvM
 ssDB+GJkKOQ5NNBX7hKmCeI1Fjas0UhZcw7T6sFy4SbitcuDP+blwlhm/9d/6C8eld
 M1+NAqxDc88ok3Jgl72mcBVbYzfAMqZ+A+TvE9qt4/u2mP2ZSXAb/cBdK6jH19qJSB
 4Y72FSxd9ac9g==
Message-ID: <54932cf8-0381-4e72-a02e-7424e7a3339b@kernel.org>
Date: Thu, 15 Aug 2024 08:49:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <0afb817e75a84859e1a86e1a7ba2041a9b852b6e.1723117820.git.christophe.jaillet@wanadoo.fr>
 <99199c2a-1dbf-439c-ad24-68ed8844e096@kernel.org>
 <ZrzXIlJvWsOu2IIP@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZrzXIlJvWsOu2IIP@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/15 0:11, Jaegeuk Kim wrote: > Sorry,
 could you please
 post the patch to the mailing list again? > I don't see the first patch.
 I've resent it. :) Thanks, 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1seOfw-0002Ch-Ah
Subject: Re: [f2fs-dev] [PATCH] f2fs: Use sysfs_emit_at() to simplify code
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
Cc: kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/15 0:11, Jaegeuk Kim wrote:
> Sorry, could you please post the patch to the mailing list again?
> I don't see the first patch.

I've resent it. :)

Thanks,

> 
> Thanks,
> 
> On 08/14, Chao Yu wrote:
>> On 2024/8/8 19:50, Christophe JAILLET wrote:
>>> This file already uses sysfs_emit(). So be consistent and also use
>>> sysfs_emit_at().
>>>
>>> This slightly simplifies the code and makes it more readable.
>>>
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>
>> Reviewed-by: Chao Yu <chao@kernel.org>
>>
>> Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
