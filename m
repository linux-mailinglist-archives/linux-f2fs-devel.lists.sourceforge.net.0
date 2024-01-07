Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1248A82649A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Jan 2024 16:08:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rMUkv-0005VC-O8;
	Sun, 07 Jan 2024 15:08:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <support@patkon.com>) id 1rMUku-0005V6-OV
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Jan 2024 15:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Type:MIME-Version:Message-ID:
 Reply-To:From:Date:Subject:To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HPLPYW2HcdQkJkwLJpH9wfaWv5eruXMsGj0u/qQRsTw=; b=fiVFL4pqOd8fuYSbXEQa2OKjh+
 wfwEoDUzbKsIUzjrd07pgQLWIcH8VDvdvvwcC0VuZzRoXh+Bt85XcqUES3r56rrZUc/VRO612WeD7
 BRTsfgi5H7J6J90CX0Hju21nMFrxEcciC53+7Cct1OUEZDYuEQYuJfTFq/fb/VWqXn0M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Type:MIME-Version:Message-ID:Reply-To:From:Date:Subject:To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HPLPYW2HcdQkJkwLJpH9wfaWv5eruXMsGj0u/qQRsTw=; b=C
 +gI7GYOQM2hZ2GdHgdDhqeuCngGEixpuYCd492VfAX9+u0ARy45bX4c1pVdj8N8kyL/dQZZevqFwG
 yEYkq8HQU7ieqno63wkqYo3J/4oUpaSuY23vXhQzjU7tuqsGxWfvR8ixqs5ChCk62JKp0P0CD18Vn
 YY3VDDYb04LHsKsk=;
Received: from merih2.dnsflare.com ([185.85.205.13])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rMUkt-0001Zi-LY for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Jan 2024 15:08:04 +0000
Received: from patko629 by merih2.dnsflare.com with local (Exim 4.96.2)
 (envelope-from <support@patkon.com>) id 1rMUkc-0004j3-2V
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Jan 2024 18:07:46 +0300
To: linux-f2fs-devel@lists.sourceforge.net
X-PHP-Script: patkon.com/wp-content/iDBydoFazW4.php for 212.102.49.88
X-PHP-Originating-Script: 1066:iDBydoFazW4.php
Date: Sun, 7 Jan 2024 15:07:46 +0000
From: GORDON COLE KC <support@patkon.com>
Message-ID: <9fc7b250630c9df23149e3764cfc67d7@patkon.com>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - merih2.dnsflare.com
X-AntiAbuse: Original Domain - lists.sourceforge.net
X-AntiAbuse: Originator/Caller UID/GID - [1066 994] / [47 12]
X-AntiAbuse: Sender Address Domain - patkon.com
X-Get-Message-Sender-Via: merih2.dnsflare.com: authenticated_id:
 patko629/from_h
X-Authenticated-Sender: merih2.dnsflare.com: support@patkon.com
X-Source: 
X-Source-Args: php-fpm: pool patkon_com                                 
X-Source-Dir: patkon.com:/public_html/wp-content
X-Spam-Score: 6.5 (++++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Compliments I hope this letter finds you in good health. I
 am writing to you as an attorney representing the estate of my client, Late
 Adams, who passed away. My client left behind an estate, including various
 a [...] Content analysis details:   (6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [185.85.205.13 listed in dnsbl-1.uceprotect.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 1.0 PHP_ORIG_SCRIPT        Sent by bot & other signs
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 0.0 FILL_THIS_FORM         Fill in a form with personal information
 2.0 FILL_THIS_FORM_LONG    Fill in a form with personal information
 0.0 T_FILL_THIS_FORM_LOAN  Answer loan question(s)
X-Headers-End: 1rMUkt-0001Zi-LY
Subject: [f2fs-dev] COMPLIMENTS!!!
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
Reply-To: gcukesqoj@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Compliments

 I hope this letter finds you in good health. I am writing to you as an attorney representing the estate of my client, Late Adams, who passed away. My client left behind an estate, including various assets and investments, for which we are currently in the process of identifying the rightful heirs or beneficiaries.

During the initial stages of our investigation, it has come to our attention that there may be potential heirs or individuals who share the same surname as my client and may be entitled to claim the inheritance. Our diligent research has led us to discover your name and its possible connection to the inheritance in question due to the shared surname.

We understand that this may come as a surprise to you, and you may have questions or concerns regarding the inheritance. Please be assured that we are committed to handling this matter with the utmost discretion and professionalism. We seek to ensure that the inheritance is distributed in accordance with the law and my client's wishes, which is why we are reaching out to potential beneficiaries.

If you are indeed a relative or heir of Late Adams, we kindly request that you contact our law office as soon as possible to discuss this matter further. It is crucial that we verify your connection to the deceased and facilitate the necessary legal steps to ensure your rightful share of the inheritance.

Please note that we have taken all precautions to verify the legitimacy of potential heirs. We will require some documentation and information from you to establish your claim, such as identification documents, or other relevant evidence of your relationship to my client.

To discuss this matter in more detail, please contact our office via email at gordon.cole@gordoncole.co.uk and  gcukesqoj@gmail.com
. Our team is available to address your inquiries and assist you throughout the process.

To facilitate the process of this transaction, urgently forward to me
Your full names,
Telephone and fax numbers,
Address,
Age,
Marital status,
Occupation

http://news.bbc.co.uk/1/hi/business/5171222.stm

I will be expecting to hear from you.

Regards
Gordon Cole KC
Thank you for your cooperation, and we look forward to hearing from you soon.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
