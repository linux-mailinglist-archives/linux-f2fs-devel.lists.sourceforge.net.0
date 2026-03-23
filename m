Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NogMm8JwWmtPwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 10:35:43 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 787E02EF29B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 10:35:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rx9MWHM28K4VY2fMTBO+8CtL62Aij+gaYKQA4xIyzqQ=; b=hoUFxXdZKBQpaPh20iSl1KuSpI
	tkw3cdagi9K+m2iRknQ3RsUKr9obphtil0hM9fUn+Btt3dHfYfYGAE2zoVuqbJzF2kNao/t1gq/z/
	UJ/M1QJl5B5J1aYvllEf8IOK4244yTFt9R6w5rzwoYrJS23UxqurT3mgiAVs41rUpBHM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4bhA-0005p0-MW;
	Mon, 23 Mar 2026 09:35:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w4bgr-0005oM-Gj
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 09:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x/oroOsLHby9JuX6zeqxxmkS9BrWPRDxQpqpHfE5V0M=; b=AyqS5nfDd3F4vYk2JW0FnkkFJh
 pWlF+ZRo2VWA2kr5TEhHS2jYwFuwHBjevl6wB1uoMKNrJG5pcWYotk6KB/3hy+QtN6Plfr+V4g2Y3
 Qw8Kaj2Q2vK9gAIpNs1bI9rsKyMJN05Czwk0ADjGsr0UFM7qwjJKPc6Z4Ssr/qdmfAoo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x/oroOsLHby9JuX6zeqxxmkS9BrWPRDxQpqpHfE5V0M=; b=XoDL3iXwu7GTvtyV5FOOjShF0T
 N2ygsHiMJK6U7qumqVgDwdXK5bqw/OL2d/yQi/gdJ5+9pJ0SQF5CQueVeUAENiyh4WsEfDD27uE3H
 QLE4r/CWegnDGekvjpwsEbZGdTUxhcW2mbWPQCkA61IueqsiIMtQq5/0Qyqeb4+r3y0U=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4bgp-0000dV-4s for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 09:35:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 83E70600CB;
 Mon, 23 Mar 2026 09:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C9AC4CEF7;
 Mon, 23 Mar 2026 09:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774258509;
 bh=845t7eLTgzrtGaH/BU6YRImwl/8UJP55LaAZ4SQ5z64=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=mrCb+c1M3VLvuCFGTL/FEQQgu4rKMd0bWFiZJvCyIoPAx7ptfn055XtELi1GuJOCv
 1bI1OYWLexRKkltiKsiyKIjso/udWs6qtOEORdZCmf40vOUNWcatDk2dDpXzyj9W34
 gBlaXLSR2IQcwYWp2lNgnBkbMceayYnDj5jJFfm+yuqReIujYiH9IbuNWdxnYieQwz
 DxrfGP/7AzXAsyONNo6LQ/ngyaimPrDG4IAkBxWrrBl5FEudvd9TWkfCN7ljFyB6Z5
 6xlbRZplGDRzHDPX8c/1S80CJB7qHTeY0XfuNnv3Nze0ntMYneGqM1AqxEyvz3ZuwP
 OqO+jQtNE3LfQ==
Message-ID: <59040f8a-ee7d-4a56-8f98-0e7e1527bff0@kernel.org>
Date: Mon, 23 Mar 2026 17:35:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yangyang Zang <zangyangyang66@gmail.com>, zlang@kernel.org
References: <20260319033519.3954784-1-zangyangyang1@xiaomi.com>
 <20260319033519.3954784-2-zangyangyang1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260319033519.3954784-2-zangyangyang1@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/19/26 11:35, Yangyang Zang wrote: > This is a regression
 test to check whether the f2fs root inode > is corrupted after the resize
 operation. > During the resize operation, SSA data blocks are mi [...] 
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
X-Headers-End: 1w4bgp-0000dV-4s
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs/024: add testcase to check resize
 corrupting root inode
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
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
X-Rspamd-Queue-Id: 787E02EF29B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 11:35, Yangyang Zang wrote:
> This is a regression test to check whether the f2fs root inode
> is corrupted after the resize operation.
> During the resize operation, SSA data blocks are migrated and
> zeroed. This process may incorrectly zero out the main area
> blocks, leading to root inode corruption.
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
