Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDsMK1GfBmrQlQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2026 06:21:37 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B215492C8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2026 06:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llciA7/jBJKw2gUoQPUPdEtx9piuiM7z6JNU8ai0Zss=; b=Xn8D8BD0UbcCIwqs9ZqW9u4ihC
	4PHP5NXLDsvNOwomVjkSQP/UzEqYDLsX7Dlwl2mpFPDeKqMe4BpFJ+jZVcxfosZiDZOJ0BKU6+rw0
	scpxOHVCy0TzShRZsHDiwVCSM7tMhJfVGSdJMIZPWRRR3T/eq+iCO7lCy3YyzuMQQL60=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wNk3L-0005tQ-L3;
	Fri, 15 May 2026 04:21:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wNk3K-0005tK-Mq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 04:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NPomADqyDIcMcwbtbimtUMnHbU2Z+dTOnIM4+rLv56M=; b=FouWqmV3IdyA6Z8yxw3dJN5bzZ
 D8XQdbzqpcOnH3DwmY1lOzK1pgz7ew6Duz3GKNo2o2fVI8BIit7rMLxdBuM1E45PtGsiwx4LEOEwK
 qdVtRHkvV0o8WruMH+7sNVzwDCc14dR2kjkVkpYD1VicpTOMDil/q/1AvQrkZCKCPgaI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NPomADqyDIcMcwbtbimtUMnHbU2Z+dTOnIM4+rLv56M=; b=VzjhmMbfQCDLmpk1YwBEOFhQeE
 wl8QZoK0nDEaEbPMQSGpeZoowjhnwIWnmXq03MitrsEmf1emqbN0OdlcEiSDFVWMAH9VQGNEArg5G
 ZT6VsQTSt9N6Pm8O6jCwddntJy0DX/zEnsRSB1vacBbQxWwRQbZ2vRMGlcV6z6zJ0Vt4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wNk3J-00016g-PO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 04:21:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EDA724423B;
 Fri, 15 May 2026 04:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163E2C2BCB0;
 Fri, 15 May 2026 04:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778818888;
 bh=1hwyYbJ/lx4eY+s7V6mdbavb6iE7LNxuin8WYSh1mqU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QCIV9X9efhsVIKh6BkXawkYENMqm3KVWLguYThz2jdXkzCY124o53dtmY+cQqW5jc
 fg5YO7IcbFm05eRMzMiKcogWAFDegXnWbF9aiplGy1wytWEr4+iKRoecMPGcRI+p2Y
 n6BSsZsbNdv5uNvGX1TK2B2s9+y6rfJHg2PsNHmajTdLt0HAqfhBqsCWM8KivLoTZI
 hvMnGxSpcIaZA0HxYHHSyPmbvlsmN4fQb7cxOijXHIyWDv0ODcQvJ2y0uQDSGS0enT
 9vmdjWyoO1Rn6Wtus7puG4bby35MbqI+O+wD+PCElh4qR7oTEf+a/SVCa2vSDdjEg/
 SB+HIZm90HweA==
Message-ID: <5352628c-8c61-4df3-8460-ca44a4fcbb2e@kernel.org>
Date: Fri, 15 May 2026 04:21:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joanne Chang <joannechien@google.com>, Zorro Lang <zlang@kernel.org>,
 fstests@vger.kernel.org
References: <20260513032009.2300435-1-joannechien@google.com>
 <20260513032009.2300435-2-joannechien@google.com>
Content-Language: en-US
In-Reply-To: <20260513032009.2300435-2-joannechien@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/13/26 03:20, Joanne Chang wrote: > F2FS has removed the
 trailing "=" in the mount options for disabling > user journaled quotas.
 Update f2fs/021 to try the new syntax first and > fall back to the [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wNk3J-00016g-PO
Subject: Re: [f2fs-dev] [PATCH v1 2/2] f2fs/021: Fix mount syntax for
 disabling jquota
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: A6B215492C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joannechien@google.com,m:zlang@kernel.org,m:fstests@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Action: no action

On 5/13/26 03:20, Joanne Chang wrote:
> F2FS has removed the trailing "=" in the mount options for disabling
> user journaled quotas. Update f2fs/021 to try the new syntax first and
> fall back to the legacy syntax if the initial mount attempt fails.
> 
> Signed-off-by: Joanne Chang <joannechien@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
