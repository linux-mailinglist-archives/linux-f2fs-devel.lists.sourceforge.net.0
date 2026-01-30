Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BwSLsEhfGmgKgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jan 2026 04:13:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53383B6BFE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jan 2026 04:13:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJoriBN/YDgcTaO2up0I6YOCaGd9fTB2B1GU3vTTxAo=; b=AYKjh059N9Sv0yFrKS9k8yI26j
	o4eq54tC9Wl+LCDW20ekftvKJeXqyKacYnGLlQdX1XfAPQgPaRn/Ld2EqQSmANT0sm4K9L9P4v9jN
	TKa2OusUERnsPkVpl4Y5RDzOJP0alRvBEaCn696TAoVxzS5kOoiianOZgTxoTmgohAn0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vlewE-0001zD-NY;
	Fri, 30 Jan 2026 03:12:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vlewC-0001z6-Mh
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Jan 2026 03:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pisjMpCl/zmfAoHfoSS4OmtWpOnaiF51cAxLHfo/TS8=; b=Y8p53qnwKtmv9t/G8M9uKBKL9V
 c8lw4pUFySR9We1B999r7BogR+Ecob+8TPu1WfEquIicTOVih+lXEpjULu8DPwyJTkBHvguTey8UZ
 c2DJacr8Dli5lTrL15NKLHmf/9h8+nPKXUWMvABYgzIiGinOM6vJBTLtIHNhUWJl/peY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pisjMpCl/zmfAoHfoSS4OmtWpOnaiF51cAxLHfo/TS8=; b=ikfejosTyJUzK0KRBrnVyJ5YzG
 cdoSJo9dWfEOEztLmWGF+aMFMzceQ24vVIH5FReSMCFoFaHlqTbWCckB9CVKlE7hMvlSP3YSEwFtK
 qJ9fLvgsbWxvis14sBQ838z8G1vffBzJKtQSnPfPZEDU94Qx4Ln9gXYg5mFCILJYNkmA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vlewB-0005Em-MG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Jan 2026 03:12:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C263060125;
 Fri, 30 Jan 2026 03:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3949CC19421;
 Fri, 30 Jan 2026 03:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769742756;
 bh=ksshzQAuhCriOLBJAnuN0ESDZDnM73Y+Ev6c0KveRPY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=vC5tbbpkkH0jBUE7D5/7VGadb7N2/6u9JnjmfhuSvmQnbhGQdRqXdXYhpRtCv+H7y
 MjXf1YTQIs8WJ3MIfaObLEx0HWy6/V7qvJgJsf5LgT5vvXDzV2aAGAnoADZMtmW+Sf
 lZkXn8UNFvkfr4nMcSznLr+tUkfI9JA4vhJ9ldKi1wzZcCMKI2hZ8zJtoWfNoavpzN
 FE0CymFC3YtI9s8BTLVvmE34N9DfQ3DxB1yOjINnC0KbkjDT/xwct3zB0rDqdwalw0
 dc6WAOx2rcpacLWwd7H6Q1UtOo7GTW6msWT+M6TGRlQ3z2Oc1HOa1yKMG3yG3BYzTI
 vRLn/KBl9fk9A==
Message-ID: <ad6699b5-f04b-4156-b57e-d00c05ea422d@kernel.org>
Date: Fri, 30 Jan 2026 11:12:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20260126222801.2229197-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20260126222801.2229197-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/27/2026 6:28 AM, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > In a previous commit, a bug was introduced where
 compact SSA summaries > failed to utilize the entire block spa [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vlewB-0005Em-MG
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix incomplete block usage in compact
 SSA summaries
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
Cc: Chris Mason <clm@meta.com>, Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kernel-team@android.com,m:clm@meta.com,m:daehojeong@google.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,android.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email]
X-Rspamd-Queue-Id: 53383B6BFE
X-Rspamd-Action: no action

On 1/27/2026 6:28 AM, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> In a previous commit, a bug was introduced where compact SSA summaries
> failed to utilize the entire block space in non-4KB block size
> configurations, leading to inefficient space management.
> 
> This patch fixes the calculation logic to ensure that compact SSA
> summaries can fully occupy the block regardless of the block size.
> 
> Reported-by: Chris Mason <clm@meta.com>
> Fixes: e48e16f3e37f ("f2fs: support non-4KB block size without packed_ssa feature")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
