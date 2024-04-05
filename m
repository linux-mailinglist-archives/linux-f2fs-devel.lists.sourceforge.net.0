Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E17899DE2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Apr 2024 15:02:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rsjDG-0007rs-LT;
	Fri, 05 Apr 2024 13:02:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rsjDF-0007rl-5y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Apr 2024 13:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aWLYruX+n4gVPEziGRA09ofQrAhjDYdM5vnxn4zF260=; b=e7nTKkMAUsrCIiCcXBnP09JtZt
 ChD+bTigfukLE/oNxMmFVa9GVNbdGa56GkvCJRJYus13Q0OweRMTUB7Z9lV4SROzHE2LA1FuyhKE4
 JySfjDxYk7YgbtC3TfZrvuFVeH6nVWpFt6gTOw9JtYoX2EkAvNCWSHmDzw6oa2LzfzvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aWLYruX+n4gVPEziGRA09ofQrAhjDYdM5vnxn4zF260=; b=gSaQwad0CmGoJRmwIl/NKVKgO+
 HVQWdG8Yyj2van5L1+7Up5mPaW1mnUqYVL9uDVc20LaktLCpR1yKIljPpingGa4e3igz4XnRCW+jL
 tdqgnOlbmhmTKA5IAtrwSw+gr9qDVTUcbzmKhn18gbO94GCHu31s1Y5EJ3zLs1Rs5VKI=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rsjDB-00085A-3D for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Apr 2024 13:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712322138;
 bh=0qxne+41P4xydT7YiBxh6DYcIOjLCZo3g8yosL1RhTk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bsHKARNqS+OHF4+T+1kHOH7GHkI35avfbG9C1FlCEbDEK3uZ9zafaM3qj+HhJ8lep
 3DK6D0WttksR1tAoEAoxuhE3LzCnZVDVsgkma3uQbhk9fG0RbTc85fqxAxUV0TJrqR
 qcKC6IVIdzhNqOKFwXuaBoQ7ZZfzlz0NO+Zaz6pm6JbmNi5+o8UtudjHZ+aYwQvquC
 kfLMQF4/0MZlKRwnmuw7nWdT+FiPNjBNF3EtUw8VfKyMjPPgMWNQyRjH4IFK4WBFQx
 MoOHhF0gIIcYbc/nS8+62EPxPNMNd7TnKtUs+ItmLESFUTGLpEADRTESvaMpoTRMKP
 QaNifUJP3N1lQ==
Received: from [100.90.194.27] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 82AA9378200D;
 Fri,  5 Apr 2024 13:02:16 +0000 (UTC)
Message-ID: <ec3a3946-d6d6-40e1-8645-34b258d8b507@collabora.com>
Date: Fri, 5 Apr 2024 16:02:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>
References: <20240405121332.689228-1-eugen.hristev@collabora.com>
 <Zg_sF1uPG4gdnJxI@casper.infradead.org>
Content-Language: en-US
In-Reply-To: <Zg_sF1uPG4gdnJxI@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/5/24 15:18, Matthew Wilcox wrote: > On Fri, Apr 05, 2024
 at 03:13:23PM +0300, Eugen Hristev wrote: >> Hello, >> >> I am trying to
 respin the series here : >> https://www.spinics.net/lists/linux-e [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rsjDB-00085A-3D
Subject: Re: [f2fs-dev] [PATCH v16 0/9] Cache insensitive cleanup for
 ext4/f2fs
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
From: Eugen Hristev via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: krisman@suse.de, brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/5/24 15:18, Matthew Wilcox wrote:
> On Fri, Apr 05, 2024 at 03:13:23PM +0300, Eugen Hristev wrote:
>> Hello,
>>
>> I am trying to respin the series here :
>> https://www.spinics.net/lists/linux-ext4/msg85081.html
> 
> The subject here is "Cache insensitive cleanup for ext4/f2fs".
> Cache insensitive means something entirely different
> https://en.wikipedia.org/wiki/Cache-oblivious_algorithm
> 
> I suspect you mean "Case insensitive".

You are correct, I apologize for the typo.

> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com
> This list is managed by https://mailman.collabora.com



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
