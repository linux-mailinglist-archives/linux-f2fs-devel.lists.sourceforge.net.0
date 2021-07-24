Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 642273D453C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Jul 2021 08:29:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m7B9b-0000wg-6C; Sat, 24 Jul 2021 06:28:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <office2@gmail.com>) id 1m7B9Z-0000wY-NF
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 24 Jul 2021 06:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZWGgJmm6IGuAQ37jBPJFICxquStIKc0ONlf4crAJZBo=; b=Koy8rbEtlt+LvEhbP+N5DLbV0m
 vJtuizJnuhS+JCbAEiTLceFTfpc85JWcDHqsh4F9T3gII1WxDx/chbnDd04JuAGXiX0G+v5fLyfGA
 F33S08UH8iDah6Gd7GbLSA08aSf8G4qnjKeZ5INVfVA8H+t+aIjXfBK2S6bv0TUegw3U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZWGgJmm6IGuAQ37jBPJFICxquStIKc0ONlf4crAJZBo=; b=S
 wPCwRo0X7Pk/lslnZOF+eZAEvlp2tzVmDJPRwk4hR2p+vHDeX91N4AZ0FBgzRBrAcFj6ayS4Loquz
 8Zm5GM/QxTmKUOoQQC5kaokiDSTalNp5WX8SIhzhag4cCdfIUcL0KtJklYAqehdmHUFRTMBkLd77i
 Lz/hLc+Kn3+DHLEo=;
Received: from srv52-12.adimudra.in ([103.228.113.167])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m7B9X-000xnq-Qa
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 24 Jul 2021 06:28:53 +0000
Received: from [37.49.225.109] (port=62633 helo=gmail.com)
 by 103-228-113-167.cprapid.com with esmtpa (Exim 4.94.2)
 (envelope-from <office2@gmail.com>) id 1m7B9L-000HxW-0K
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 24 Jul 2021 11:58:39 +0530
From: "FWS BHC" <office2@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: 24 Jul 2021 08:28:38 +0200
Message-ID: <20210724082838.B43A6E56E7A9B0F8@gmail.com>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - 103-228-113-167.cprapid.com
X-AntiAbuse: Original Domain - lists.sourceforge.net
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - gmail.com
X-Get-Message-Sender-Via: 103-228-113-167.cprapid.com: authenticated_id:
 noreply@adimudra.com
X-Authenticated-Sender: 103-228-113-167.cprapid.com: noreply@adimudra.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Score: 8.6 (++++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [37.49.225.109 listed in dnsbl.sorbs.net]
 2.3 FSL_HELO_FAKE          No description available.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (office2[at]gmail.com)
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (office2[at]gmail.com)
 0.0 LOTS_OF_MONEY          Huge... sums of money
 1.5 MONEY_NOHTML           Lots of money in plain text
 1.2 NML_ADSP_CUSTOM_MED    ADSP custom_med hit, and not from a mailing list
 1.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1m7B9X-000xnq-Qa
Subject: [f2fs-dev] [SPAM] Re: Can we discuss?
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
Reply-To: office@htnmaline.xyz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I want to discuss a business with you. I am having your business 
complementary card. Can we discuss?
We are politician and we don't have time to invest. we are 
willing to invest $10 Million to $50 million in area of 
Investment interest: Oil & Gas, Agriculture, Aviation, Tourism, 
Retail, Real Estate & Construction, IT & Communications, 
Engineering, Utilities, Telecoms, Mining, Maritime Sector and 
Entertainment industries.
Purpose of Funds: LONG TERM INVESTMENT ( at least for a period of 
10 years )
Thanks
Miller


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
