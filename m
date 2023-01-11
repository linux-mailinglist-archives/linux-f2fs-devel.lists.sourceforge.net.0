Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FD3665CBB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jan 2023 14:37:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFbIK-0002qk-V0;
	Wed, 11 Jan 2023 13:37:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pFbIE-0002qd-34
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 13:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vy82HmjDJwa9VA9NfPJDfUcXYFY1I7bAwuXRgTFC0XY=; b=ZqdBrwA5y3ZMEFyenCgTH9Wcg6
 JZBJ1jAGzcQMwLMMAAblOfqbS1t4oXyoOHMSWvRtI1jKVYW71TP4NETRNOsoPO56cy2SBZZ/iXNfz
 /D0qzkrGsCQYgRIjn4+JpwUDVIiWuwk3IhQxql4jKIhkpxISbmI5m+ipFkfAhoWFV/Ps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vy82HmjDJwa9VA9NfPJDfUcXYFY1I7bAwuXRgTFC0XY=; b=Un2n9nu8mXpBayAoGAcGYdlAVs
 3bU+D/EoddV9OmnHeielTrU5nRq6z7l5EHYe8oZFTNQY2JhRl8cMKkX0DYRoFFs8gYnS/Ps4toQhf
 W8SLr3Fezpr1Pdn+axCTA3OZzUH/3hSmt1it+bAzm6o3fUtVyKuD60r/asupHplhqKe8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFbIC-0004E0-LZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 13:37:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 63483B81BF8;
 Wed, 11 Jan 2023 13:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58CFC433F0;
 Wed, 11 Jan 2023 13:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673444237;
 bh=FUoxN2QD+ZOvE+dYb+cCMYOTxaRlpUEgW1gFBA0KI04=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=q14kiXpxdOpYgzAzVmHJdYQbDBOa+NB4z4mbNj+5u+9lRy5rAOZQtvbtUKw5RncI2
 P/GmrWKXkFy8V3OVpd5o/8FqfpX2Cm9ZDvvggDgnVmUjwotoiRKbCwvrgfMuciqq7k
 lb9rYGtK1AQYcM6W0DpbVIuc8VGxqj+/jqzDyAe3hFru0sXU/1d905q0WWjyssrBg8
 u7hXtOJByQMTG43F9IGrXxdwB017tSy1FsUlJFYiiNo/Qi3t3Yfv2nJR5hlSufJYoV
 qOYLIN+Xjuto0RlsQqR8pUMQLMTELwg+Nhya0sXrSgZ04hGKq/+Mytwc545YtILebG
 Wpgnn11Af4v+w==
Message-ID: <732e4696-5349-fb3b-87e5-8f0ecf368571@kernel.org>
Date: Wed, 11 Jan 2023 21:37:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221212133644.1503-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221212133644.1503-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/12 21:36, Yangtao Li wrote: > discard_wake and
 gc_wake have only two values, 0 or 1. > So there is no need to use int type
 to store them. > > BTW, move discard_wake to the end of the > disc [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pFbIC-0004E0-LZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: convert discard_wake and gc_wake to
 bool type
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

On 2022/12/12 21:36, Yangtao Li wrote:
> discard_wake and gc_wake have only two values, 0 or 1.
> So there is no need to use int type to store them.
> 
> BTW, move discard_wake to the end of the
> discard_cmd_control structure.
> 
> Before:
> 
>    - sizeof(struct discard_cmd_control): 8392
> 
> After move:
> 
>    - sizeof(struct discard_cmd_control): 8384
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
