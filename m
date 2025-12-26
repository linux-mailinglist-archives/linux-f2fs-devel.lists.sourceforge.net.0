Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31194CDE85C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 10:12:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99RGJ0PP0zqLD9P6GAURIuZcudbCk3HhgPc5KKxeq/c=; b=C/swymJ4jLHWEivI4bQfsggKV6
	HhZIawa2Qt8GXLtWoTfw7tV7FRapGE3bB3snEe5eTtzeiiOIIwxhFWBC6RoRZ9EiCUpniKiaUmigi
	6ZOV8pzF4XBykGp6NJrBQAk48VdJWraTECfWOhShlZQ9CtzwzY/cINseu0PIrc0S2Xx0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZ3sP-0004Fh-JM;
	Fri, 26 Dec 2025 09:12:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s.shtylyov@auroraos.dev>) id 1vZ3sN-0004Fa-IM
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 09:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AE3j98tMwy5l88BOLgvqKusabkBhAUz9NYLxmIjefmg=; b=AOOpI00H61w/NChcILlIY/869J
 L+WGx5sYICb5wt19JoTIMviwumrrtW7LIVFbg18i6/Yc2uR65hVuRu0fn3AvI6hSXKf3vScEub6YF
 dbhT0M0gDB7YvE0an0mdLWLFgBSk2h8j9EY0rLw+3ExVqk7DK2V6wOlRvwCYG5SdSW3I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AE3j98tMwy5l88BOLgvqKusabkBhAUz9NYLxmIjefmg=; b=LAPDf83E8LN9ut8sue+mfOtcha
 kfDT+LU1Gm9OfPPfX6FVfVMIVTYV0gy8fSPehMNNGDy9i+/By/dU6omjSZMi/3zT7Jsi5n6PgQHev
 Tvdd8H7QlNCFglktsvBgW0hOKnRsnjGQveSGFYmcdXn6GwcVm6H23Bs8tzYGQBwl8/sw=;
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vZ3sM-0003IP-JD for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 09:12:47 +0000
Received: from [192.168.2.104] (213.87.153.41) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Fri, 26 Dec
 2025 12:12:32 +0300
Message-ID: <89996710-016d-40c7-9b18-61dc7bb9dfcc@auroraos.dev>
Date: Fri, 26 Dec 2025 12:12:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <938c75a4-b825-4341-b208-44de1dc5a7fd@auroraos.dev>
 <2bc6224e-a4df-429e-9c86-acdbf460ce86@kernel.org>
Content-Language: en-US
In-Reply-To: <2bc6224e-a4df-429e-9c86-acdbf460ce86@kernel.org>
X-Originating-IP: [213.87.153.41]
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/26/25 6:01 AM,
 Chao Yu wrote: [...] >> In __is_valid_data_blkaddr(), 
 an *if* statement is used where a *switch* >> statement clearly fits better...
 > > I think previous version is clear to understand, unless we add more *_ADDR.
 :) Content analysis details:   (1.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1vZ3sM-0003IP-JD
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

On 12/26/25 6:01 AM, Chao Yu wrote:
[...]

>> In __is_valid_data_blkaddr(), an *if* statement is used where a *switch*
>> statement clearly fits better...
> 
> I think previous version is clear to understand, unless we add more *_ADDR. :)

   And I don't think # of the *_ADDR macros matters whtn it's already > 1.

> Thanks,

[...]
MBR, Sergey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
