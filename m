Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIHSHacGwWmtPwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 10:23:51 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5C52EEFCE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 10:23:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcvzkKU6kh02c2mPqJWl2cZ4+t8ur2cv0lyaLpaxTpo=; b=UFR2uTZU1QFOwLk6wsGNcHfwzJ
	SfclmVvSIYjSOzrtm7CpdsNm49xr7Qbfg0g7Ac8nGNrvB9Dv0Rei9bATBeSXo4RAwfp8vZOaPoTqn
	RAP6VvKAR3A4xB9L7KxWxp7JQxCgBK7vUQSxm0B/VPsFEThsNBePhfBuCsYNpK08l/8c=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4bVj-00077L-N9;
	Mon, 23 Mar 2026 09:23:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w4bVC-00076t-JQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 09:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uOgJpOcOO7Xwtu6FFlA+FwUVqLhCBgfOdy6m5SvzqEc=; b=J1ly9FADGb4nOWokPmKnJliJHZ
 i+uIe6NdXNTeWsjVwuKaMETn/H5M6O8WaMmq/iMKYDocbaaMIkSfS1faa2/M2Ddhw/WHt5WOkLmGG
 Bh3XiZW3nnwsdGbVIMS994ovoEFiCUc5C7pWj7K6Zm7oB0P3NaUSWOWg/SLSgjRugTWM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uOgJpOcOO7Xwtu6FFlA+FwUVqLhCBgfOdy6m5SvzqEc=; b=nPUbC9c0oNzrxwod7c9cJTJpwR
 X/XPiCbz6XHYXcquCTAru9o/+bf33GYcHz6yM3ncXQUtQ3gIQXmy/ICtGsybqrtCdqAF/+xxzVu5f
 YK0AgwBTws5W1iPA3NwWsXwqsta5Oe92fDVNcN+wE550wSkFQdmoFNvPkglXYBstG8+0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4bVB-0008Ld-W6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 09:23:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A08ED443DC;
 Mon, 23 Mar 2026 09:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD8FC4CEF7;
 Mon, 23 Mar 2026 09:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774257783;
 bh=Md/3K/1YWnuoMAa6HdqNhhhC8PvYlXoK7J2Lf4KVoik=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=LMU7Z+221EIfAkbZfgbSgQA7A2fCtke6+OsvzifuwdN4YAV8K47mf/AFDlxmOkXZZ
 tY6tB5yOM3uPjrdaSdsEHeDdVkVRSB8ibjHWPmnVkKT7ssxayHpMTtIKN7vdDmjj/Z
 4GUN6775gPRWCySO6+riD8FrTBMYR/pPaiAePNZWs1TaCXLZHEiwLUJTzcvJ+L+8vm
 UGQJtmswOQGjyPro2rsrirzEf5k/HUAJYx4/XIHddXN2Pei5jF62Yut7tJ7CKY7fDh
 7FVqaFqNbJTwoS14bFe7h88kwND773nrCNsWGrPAyZyF1ZvryZ8j9ZHQxf5NsFpizH
 0GrT5DVwuSGmg==
Message-ID: <c0e09f6d-ec4a-4bce-b27a-35af2be5b2de@kernel.org>
Date: Mon, 23 Mar 2026 17:22:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yangyang Zang <zangyangyang66@gmail.com>, zlang@kernel.org
References: <20260319033519.3954784-1-zangyangyang1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260319033519.3954784-1-zangyangyang1@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/19/26 11:35,
 Yangyang Zang wrote: > export F2FS_RESIZE_PROG w/ resize.f2fs,
 it can be used for resize f2fs. > > Cc: Jaegeuk Kim <jaegeuk@kernel.org>
 > Cc: Chao Yu <chao@kernel.org> > Signed-off-b [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w4bVB-0008Ld-W6
Subject: Re: [f2fs-dev] [PATCH 1/2] common/config: export F2FS_RESIZE_PROG
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zangyangyang66@gmail.com,m:zlang@kernel.org,m:zangyangyang1@xiaomi.com,m:jaegeuk@kernel.org,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 2A5C52EEFCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 11:35, Yangyang Zang wrote:
> export F2FS_RESIZE_PROG w/ resize.f2fs, it can be used for resize f2fs.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Chao Yu <chao@kernel.org>
> Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
