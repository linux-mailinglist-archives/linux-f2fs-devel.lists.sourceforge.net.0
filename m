Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33223CF040E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 03 Jan 2026 19:38:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Bmo+JY7CZLwKRp/JwW1E8CUPT1w475XnOjz35i/3g4=; b=j8xxqqXjQp5Nae6bEyuyMcx6yv
	oLOaigdc1bzqKESFQ729aqYVhiBfEsifoWVS9LRIcgLz/cBNf9sKlzc/dpddm/Txtjj6h+R4YfyFM
	/wCybU/au/65etjlp+N2lpBosdfYhcDlZGw6oNGAcUJGPYFRurWBEAnkKVX3q0Ce3jx4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vc6WH-0005uh-AX;
	Sat, 03 Jan 2026 18:38:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s.shtylyov@auroraos.dev>) id 1vc6WE-0005uG-9T
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 03 Jan 2026 18:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wqmtYJ7wnIM5QO85hs3B2/gYlUfqGxNIXGGe7NY3+Bk=; b=MkIBoRcChQ5g7meBGhP96QWPVZ
 YEWdMVuYDPdCUqFIGqnmDNX2FqwZ9WYiqse2XHbSZH6eK+/RawP/Ett1RfABdH4vBKyg4Beak9gcW
 ho+kFWo0cvgoWWo8Xi3FSVeX4Uz1hYKDwbpX4lSR1BY88pakHRAejTkUYG3lCs2sBG2Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wqmtYJ7wnIM5QO85hs3B2/gYlUfqGxNIXGGe7NY3+Bk=; b=m9nD3Hpg/35xFneFge1pAZUvCl
 ZNTLiHXP7ry2fzrjxajFd59xOM99i9Drt/iL2M3H4K7Vq2dN3+wtj65NSh4jWv4Es3zR3GCIAwzLA
 B7xr/q0SCV9fgRRxUfVffOYx9IiaLWbFl1Z43iTB6CWXvO14jcairZki/NqezFTJ6vsM=;
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vc6WE-0007Cf-2L for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 03 Jan 2026 18:38:31 +0000
Received: from [192.168.2.104] (213.87.153.13) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Sat, 3 Jan 2026
 21:38:20 +0300
Message-ID: <36335ae5-13d3-4876-a958-b4cf54586f20@auroraos.dev>
Date: Sat, 3 Jan 2026 21:38:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <938c75a4-b825-4341-b208-44de1dc5a7fd@auroraos.dev>
 <2bc6224e-a4df-429e-9c86-acdbf460ce86@kernel.org>
 <89996710-016d-40c7-9b18-61dc7bb9dfcc@auroraos.dev>
Content-Language: en-US
In-Reply-To: <89996710-016d-40c7-9b18-61dc7bb9dfcc@auroraos.dev>
X-Originating-IP: [213.87.153.13]
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/26/25 12:12 PM, Sergey Shtylyov wrote: [...] >>> In
 __is_valid_data_blkaddr(), an *if* statement is used where a *switch* >>>
 statement clearly fits better... >> >> I think previous version is clear to
 understand, unless we add more *_ADDR. :) > [...] 
 Content analysis details:   (1.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1vc6WE-0007Cf-2L
Subject: Re: [f2fs-dev] [PATCH] f2fs: use *switch* statement in
 __is_valid_data_blkaddr()
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
From: Sergey Shtylyov via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/26/25 12:12 PM, Sergey Shtylyov wrote:
[...]

>>> In __is_valid_data_blkaddr(), an *if* statement is used where a *switch*
>>> statement clearly fits better...
>>
>> I think previous version is clear to understand, unless we add more *_ADDR. :)
> 
>    And I don't think # of the *_ADDR macros matters whtn it's already > 1.

   s/whtn/when/.
   By using a string of blkaddr comparisons you cause the compiler to do extra
work (for no good reason).

[...]

MBR, Sergey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
