Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A83DAB4C07
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 08:34:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOp9mwczT3KNF+Tqs9QqkWBqq7uATlnq7qMapi3uA6s=; b=mAcwuj/r2uqn8lrs3+d81EEJmZ
	nr6LtjSyDXEZeqnAvZuGd8n96ooslGJL9mTM2ElzdeXoe+bKSoCLb+gjyOBrSkcr6TV+uTJSY7Tez
	mIvDhS8z4N+CrB0gqK0yeG3sRdCK3lLXZTIPEhpmjCGGPZz1GBmKmCAzmLiqJHKUJALE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEjDp-0005XH-0P;
	Tue, 13 May 2025 06:34:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEjDm-0005XA-W6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 06:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uq3p46liXrbSXGMvdqJBKZVJP5M+WKB5E0d2hRWw5fU=; b=T3ws5T/YEfsIZOJ4yBrdn46imZ
 tcGe9gLMYM6eGZOSvJgjCu7RIZjwZrbdIB6NZ+hxIEjrMcMJT8J/zxqSgnCLgS7x8TmDRxqGszala
 DlOfhz14loInh2ndCfC55/OibmUIE1Cfyz3ST1wtNpoN3Ro1SBcoIwFuM96kYe1kw7tA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uq3p46liXrbSXGMvdqJBKZVJP5M+WKB5E0d2hRWw5fU=; b=gJ6edKj4fl5DDz2QOhBTHKXUBI
 vUA4U9vgKpFz/1Culzyl4qbkaDqJsFhjIyQrZMcnOE57iOMtHAJcHHyLIT1DDoRZOyDG9bgdbLcWH
 //oibpeIg6NMYQhpVebVHOV/l3eXwoRVK1dYvwj5WI6zCppqLkgQGtShU6Rtkda2a6sw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEjDm-0000cz-9T for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 06:34:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A2734614C0;
 Tue, 13 May 2025 06:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4945BC4CEED;
 Tue, 13 May 2025 06:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747118068;
 bh=ORgLMITxeIyffJ4kFtLu1h4Mh8Q9hlUWYLleES2f2lE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=UGocXwC0ochsFRNKa9jZYXMnu8vntCsPFMbXh6206Pj8y7En90phD0RdyN/LxzLCE
 82J36pPxSCwjacFcvpBRrF8IDjQlEqacV6O1sKl0tlTAl6Y4h0qvL+PMd2QA1CLush
 BS17XOqXNwKt88vXoWhWhNbEQ52P9B6lVkIlEY8+T3ibDhcFIAWAklZbLT4xLwdnbc
 TdA//RZn9tf7Vp++nxjG306X7RWiTH447MBVIYyTyxkTfSmCyPWkH4MQs0m8hR0Eco
 iGb2iSvmWXHbZiDxohPrDrVwgYoxzjS7vye79OWyCtCbxXXesvY/eW1cnjxPxmOZTT
 4vDeMLVhzA0kw==
Message-ID: <ba2bc9bf-7cec-4871-b603-8130c84fc917@kernel.org>
Date: Tue, 13 May 2025 14:34:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@infradead.org>
References: <20250513055721.2918793-1-chao@kernel.org>
 <aCLgPLUiFsiCzSBK@infradead.org>
Content-Language: en-US
In-Reply-To: <aCLgPLUiFsiCzSBK@infradead.org>
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/13/25 14:01, Christoph Hellwig wrote: > On Tue, May 13, 
 2025 at 01:57:20PM +0800, Chao Yu wrote: >> .init_{,de}compress_ctx uses
 kvmalloc() to alloc memory, it will try >> to allocate physically [...] 
 Content analysis details:   (-1.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEjDm-0000cz-9T
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: use vmalloc instead of kvmalloc in
 .init_{, de}compress_ctx
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-mm@kvack.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/13/25 14:01, Christoph Hellwig wrote:
> On Tue, May 13, 2025 at 01:57:20PM +0800, Chao Yu wrote:
>> .init_{,de}compress_ctx uses kvmalloc() to alloc memory, it will try
>> to allocate physically continuous page first, it may cause more memory
>> allocation pressure, let's use vmalloc instead to mitigate it.
> 
> Shouldn't this be handled in kvmalloc instead of working around it in
> callers?

kvmalloc() will allocate physically continuous page first, so it may race
w/ other physically continuous page allocator who uses kmalloc(), in
scenario of there are few physically continuous pages.

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
