Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 283768B09D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 14:40:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzbvP-0002YK-PY;
	Wed, 24 Apr 2024 12:40:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvic9@mailbox.org>) id 1rzbvN-0002Y9-FV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 12:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Cc:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4vfx43bGfFiKFSXII1HRkfi7xazwTRMZlaFx7Xy9Xcw=; b=ZKp+05/+uVO8tOPQo4/fMalzUT
 I55THCLWU1ZHWUu5z4rJsodFxPOiYf+2u9aaV1w47lY8tV45ws7RW654lfBbidbirpAZ7f0Dh5z9j
 9oC6eVAlqdEYW8oujH82aIkWRD++EhfZHLLDUlZ6SixTeiV84C/vlfVW+PDo8ugVCgu4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4vfx43bGfFiKFSXII1HRkfi7xazwTRMZlaFx7Xy9Xcw=; b=LiDb5D179ijwyxsLYO8wbaVBWV
 GIlvkgf9YKwqQjQhp78SFIglknxAWMShJd3h7QRfx1xOh0wfZ59WwnV4hCMlf8Psc5FIKL3H6BpHJ
 Y4fuyAixcoH2Eif/AUQoCr432Nd8MwSRqoXSeln2RnuXJKWlqlTrSsRbnUbhfOJsD70E=;
Received: from mout-p-102.mailbox.org ([80.241.56.152])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzbvM-00030S-Ff for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 12:40:33 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4VPdql2dZ9z9t41;
 Wed, 24 Apr 2024 14:40:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1713962419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4vfx43bGfFiKFSXII1HRkfi7xazwTRMZlaFx7Xy9Xcw=;
 b=AjStHHcLZ7FXn5bvx8+DZLtPBOULy28RXK5EBe0pk1ZSt6kyVmCx7ttg1IRcFDDNSnhbG/
 +tvgVzeWzEKTn8MSa0wH2f4f9Ka4Nu6esgWu3RWyd5WdV5dorobVyhfGwsNMB/dETF1iLB
 vYg/7JgLXAwHCgExbhl5R0Eiymt4Mq6S572Od0GLhOQ82famnlN99mi27k/v/GUSz09iR4
 NIaUkp7tHOoJKeMGnRPvYqlbe860iQglAKzbqOr4RYCIvAgZQjaa6L8sQbnhrZVWz4xq/7
 bH0OUialhhD4O2Jy2ibKw/nEfvl9lNfWZo4YlMnfBllu1ls94b/F1aptCHFrYw==
Message-ID: <ee866828-bb35-4ddd-9616-731f7b14a9ed@mailbox.org>
Date: Wed, 24 Apr 2024 14:40:13 +0200
MIME-Version: 1.0
Content-Language: en-US
To: linux-f2fs-devel@lists.sourceforge.net
References: <bug-218770-202145@https.bugzilla.kernel.org/>
 <bug-218770-202145-zsFZHchmJ1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218770-202145-zsFZHchmJ1@https.bugzilla.kernel.org/>
X-MBO-RS-META: mbokn8afgfojbksf65aadk38pjyqdfxw
X-MBO-RS-ID: 9b356eb45a2d4dce6ef
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/24/24 14:30,
 bugzilla-daemon@kernel.org wrote: >
 https://bugzilla.kernel.org/show_bug.cgi?id=218770
 > > --- Comment #5 from Guido (guido.iodice@gmail.com) --- > (In reply to
 Artem S. Tashkinov fr [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mailbox.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rzbvM-00030S-Ff
Subject: Re: [f2fs-dev] [Bug 218770] fsck seems unable to solve corruption
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
From: Tor Vic via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Tor Vic <torvic9@mailbox.org>
Cc: guido.iodice@gmail.com, aros@gmx.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 4/24/24 14:30, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=218770
> 
> --- Comment #5 from Guido (guido.iodice@gmail.com) ---
> (In reply to Artem S. Tashkinov from comment #4)
>> On 4/24/24 12:21 PM, Tor Vic wrote:
>>>
>>> I can confirm the constant fsck issue, and it was fixed in my case by
>>> the following patch:
>>>
>>>
>>>
>> https://lore.kernel.org/linux-f2fs-devel/20240409203411.1885121-3-jaegeuk@kernel.org/
> 
> I have 6.9.rc5 (dated 2024-04-21 on kernel.org) Is that patch already applied
> to it? If yes, it doesn't solve the bug.
> 

No, not applied yet.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
