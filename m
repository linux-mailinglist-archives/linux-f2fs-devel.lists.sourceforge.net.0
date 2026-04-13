Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKwgNqPa3GmcWQkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 13:59:31 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CFA3EBA3D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 13:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulAkVSpkcY8eBrYnCA3clVCwBphFkTSyXqSdzLXGfyQ=; b=ayJaP8iKZZNVjBgUjmqLjEXgOX
	cC+WtgE6STTNqtfE+loaJavro9VRVcEraXU8QDhGpz8B+DTS6jcujBG/OjKA7+8E40qOjkiekqWmP
	92rf2UaFRewOS/cziK32+Bfw1Qq5DqdOiBlL5oMrz+8gV8L+VoEApQI2bhU+er9B80JI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wCFwr-0005uf-53;
	Mon, 13 Apr 2026 11:59:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wCFwX-0005tt-0Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 11:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3REi8zd6XlMVhi6P03ZWJyGP5agPgsVGIvxvdSYjCaE=; b=KnZEiMixzJUc7AIlYhR6os5Aw7
 b8l/tc++RamAEZH3KKwQybU4G6B+hxACG2gjyxLHh1n78iDPsHosvOitrllAJfKe0brv+P5XtvC5Z
 RDjaSxN20UPf5wuFBQxcaT7rRBPcL7EFYq+Ow2ZtT1D/cqZ6L/6gzplCjK7fjuWP4Emo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3REi8zd6XlMVhi6P03ZWJyGP5agPgsVGIvxvdSYjCaE=; b=Fl2eS589W6LO1eUsHqlKZ24847
 v/CnHe5Zu7K6k/94+DXOS/DfGvumdGtUnlyt87yA5bJKGtB/jmGrgFLsLkzNYh3ABiFF2pCQpGQq6
 0qSh5aOtHKrUPaR1t+FBsCiJXAfJDkINiuz6JXEompkK2erUwzS2qVMPmzR/wiNGPCOQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wCFwI-00058W-N2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 11:58:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1356460172;
 Mon, 13 Apr 2026 11:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13386C116C6;
 Mon, 13 Apr 2026 11:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776081519;
 bh=jxhpLR/Nkhj73AXGkJ+9HMKBaynT9lQ/vhr9EHyqOzw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=nPkdoPGBIOT6yBlGzq5VgV+7K2lEoKs7A51hsRBp6S+aVomBjWtNiiwnTu8i3CeSc
 ju4a8K5l5oh96jA59j8cZHPiKz1q/V9YWvGMwuouPnJzMKxKe515IKcdSQVA5RJ4eQ
 Rx7U/ENchJLAyFOLK6eCltQWNtOzJXW1bFQSdiMjLexgcagRSwg1qIeHyTsznpd019
 pnjn/czHxrvBVjlpVdPTcNkGnGE2cAShMjZib9Y8cKmZFF1/qSKtK0qGxo9dyl8As+
 Ml+PGOrplCxqEJTgElD08G58kUFftFyv9+WZF23e7qezI53mojDgyJsMqIkp4F6rhM
 mkJ3GTo0C5Mtw==
Message-ID: <f2c94473-b708-4269-9c7e-b06259ac4c3c@kernel.org>
Date: Mon, 13 Apr 2026 19:58:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260410150537.1683974-2-monty_pavel@sina.com>
 <20260410150537.1683974-4-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260410150537.1683974-4-monty_pavel@sina.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/10/2026 11:05 PM, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > In f2fs_sbi_show(), the extension_list,
 extension_count and > hot_ext_count are read without holding sbi [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wCFwI-00058W-N2
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: protect extension_list reading
 with sb_lock in f2fs_sbi_show()
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email]
X-Rspamd-Queue-Id: 89CFA3EBA3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/2026 11:05 PM, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> In f2fs_sbi_show(), the extension_list, extension_count and
> hot_ext_count are read without holding sbi->sb_lock. If a concurrent
> sysfs store modifies the extension list via f2fs_update_extension_list(),
> the show path may read inconsistent count and array contents, potentially
> leading to out-of-bounds access or displaying stale data.
> 
> Fix this by holding sb_lock around the entire extension list read
> and format operation.
> 
> Fixes: b6a06cbbb5f7 ("f2fs: support hot file extension")
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
