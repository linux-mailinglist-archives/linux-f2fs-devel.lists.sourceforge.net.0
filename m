Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F066C992C0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 22:29:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrAc0TufaRiDn1bPLK5wt/QRNlQJGa7XCkBYM0mYA9A=; b=ZGz372AnWL/45fHMVwSvC1Ouur
	jf5sz+0X+h49quYpj1Ez3wDVexhn5q0s4soxrLmKVA62i3S72Ezc9ZltvHc9WQbNj2eo42ogKjbSi
	wXiHo+o0/Qt6Kcl+fWvCoyzYUI/dCOyp4AI2Cx/qzGF6FH1XqRrwc51ycnI/L8M/FqxM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQBSL-0008Gt-1J;
	Mon, 01 Dec 2025 21:29:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vQBSJ-0008Gm-LK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g+EjuvmcxspAZcpVDYREIf71qEPC3POtRYqxz0uqBx8=; b=XistYROXS7dAUhPSAOj0FCSeEG
 B28YqrccIL0etcNY7+BxJ/112jMygJvIFzd5w1pia+h8Nla1BGiXMAAGwtu7YZYxoCRHVS1Zsay4M
 VjNJmzdjBZvImxxcW7Wr7F8eIp8WdUHyK16TNFreJpmIOsvGz4DTRxOvcNTkO867IQXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g+EjuvmcxspAZcpVDYREIf71qEPC3POtRYqxz0uqBx8=; b=QPnFpI97Ct1m670X51q97gm+hB
 bhAvlkuk4TzTthkfvQz4HzcHqNCbDsLtSPjGDjxZHZcFhMZdATb0RmWvGuMqvin8k/hc1ku2MzTPF
 NzEc8A9unvXTWM6J61VvCQxem1JO9FFEj57B8gmwvp/n3d3yrQI+OU1+HP1PhXjHTvv4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQBSJ-0003MW-7R for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:29:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 982D160152
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Dec 2025 21:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8172C4CEF1;
 Mon,  1 Dec 2025 21:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764624545;
 bh=9iqnBkCWkupWZXMjvzXI7HYMJruKmtDXUhR/FxrPkFU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=MZNHwATwadPb2wCclNCXcZhiHPIdIX82dAuzjtviJ9TmksFS8FYtNcvoHiSQQVHKe
 j3Ka6FNAHGjtYqc/hmyJ6nFOzu0KzzFuaLFtQTM1YIDlv2KipM9FhHMhwL41inB/jO
 xF03fFubtz4rQlnx4v51qLdE4fe4+BvbfPzSVyt7DCcnRHv+8mi3LnEsC97xEg/SLf
 CFkbcGTpNxRNQea8G3yHTIsMoTzNLWY5ZprQw2AkLTSTMjipWQS2RUL+NdJHGrcgMa
 26ywgql33s/1m1uQ9n1uelptMGQB7ruhulDRWw7fNyVe2mKDB7dAGMs7DjXL3lGHGd
 u3xKsdvOYXd8Q==
Message-ID: <f54507de-293c-4a86-bcb0-96a7c6012dea@kernel.org>
Date: Mon, 1 Dec 2025 13:29:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20251201204620.905318-1-jaegeuk@kernel.org>
 <20251201204620.905318-2-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20251201204620.905318-2-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/12/2 04:46, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Add a method to read out pages into unevictable mapping by mmap(), mlock2(), 
 > and madvise() > > Signed-off-by: Jaegeuk Kim <jaegeuk@kerne [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQBSJ-0003MW-7R
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs_io: add read test with mlock2 and
 madvise
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/12/2 04:46, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Add a method to read out pages into unevictable mapping by mmap(), mlock2(),
> and madvise()
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
