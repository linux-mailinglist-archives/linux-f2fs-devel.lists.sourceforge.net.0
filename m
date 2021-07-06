Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6593BC4A4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jul 2021 03:40:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m0a4c-0001M8-4i; Tue, 06 Jul 2021 01:40:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <LifePointsPaneL@outlook.com>) id 1m0a4Q-0001Kn-J4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Jul 2021 01:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:Content-Transfer-Encoding:Content-Type:
 Subject:Date:To:From:MIME-Version:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lka8purfgQLLprLga3YfSsVAaqKnx2V3rPJ+s2sK8i4=; b=SaD2YVqr8OKDHEc571CIYU2eEB
 0qxFqo7YrK5rxH7/ugzPzZt26+rgsGE51xa86psCAd7XMKd+K9Nta7WcCyK8b+q0nxX9T++jCnKXL
 qYKaoKIBGs/FcU1sOfx0UQAqNM28WXthmDuUTrFs1XSIELp+MSuVJToHLNLtLzvaG6gk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:Content-Transfer-Encoding:Content-Type:Subject:Date:To:From:
 MIME-Version:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Lka8purfgQLLprLga3YfSsVAaqKnx2V3rPJ+s2sK8i4=; b=k
 JkRbFB5rBnjqE/MtKS/YL/H885Jsg1AgcaF5M+q9P5R4UAqpM9qzsUQxzKbT1nsBWScxFcmsrnlaR
 0xGuG8xSdSeLkBa/3BUGarDnmQLSNMJQv24X9juWjzax6f5oNC6jbHIbpIJURvag6W8AV1kexgXy2
 WTpkz2F+jV7hqp0E=;
Received: from mail.unimax.com ([50.220.81.186] helo=remote.unimax.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.92.3)
 id 1m0a4F-0004tW-MD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Jul 2021 01:40:18 +0000
MIME-Version: 1.0
From: LifePoints Research LLC <LifePointsPaneL@outlook.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Priority: 1
Priority: urgent
Importance: high
Date: Tue, 6 Jul 2021 01:39:51 +0000
Message-ID: <4e826f65-5cf2-4826-b319-89b96f00d2f8@EXCHANGE1.unimax.local>
X-Spam-Score: 3.6 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?50.220.81.186>]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (lifepointspanel[at]outlook.com)
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
 0.0 FILL_THIS_FORM         Fill in a form with personal information
 0.0 T_FILL_THIS_FORM_LONG  Fill in a form with personal information
 1.0 FORM_FRAUD             Fill a form and a fraud phrase
X-Headers-End: 1m0a4F-0004tW-MD
Subject: [f2fs-dev] [Alert]: PROJECT STUDY
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Dear Prospective Panelist,

You have been selected as a Quality Service Evaluator to participate in our short 5-10 minutes Paid Research Evaluation survey on select Walgreens/Walmart/CVS stores within your area.

COMPENSATION: 
You will earn $500.00 for every completed evaluation survey assignment.

SURVEY [#53779-1001] DIRECTIVES: 
LifePoints Research will issue your first survey packet alongside a check for $1400.00 meant to cover the expense and compensation for your evaluation survey via USPS within the next 1-2 business days.

You will conduct your evaluation survey by visiting the nearest Walgreens/Walmart/CVS store within your area to utilize their store services for customer satisfaction standards, associate skills, facility management and product testing.

As a survey panelist, you are to act as a potential customer at the assigned Walgreens/Walmart/CVS store and conduct your evaluation survey on the quality of efficiency of associates, customer service and standards in order to submit a fair and unbiased rating in your survey reports.

APPLY:
____________________________
Complete Your Survey Profile >
*********************************
*Full Name: 
*Mailing Address: 
*Zip Code: 
*Phone Number (cell): 
*Age: 
*Alternate Email Address: 
*Work Related Experience: 
*********************************


Sincerely,

LifePoints Research LLC
685 US Highway 202/206 Ste 204
Bridgewater ?, NJ 08807-1775
Attn: Richard Scott (Operations Manager)
[ P: (585) 532-6525 ]



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
