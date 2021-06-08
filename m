Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6783A0670
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jun 2021 23:50:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqjbp-0007ZU-SH; Tue, 08 Jun 2021 21:50:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <9sporst9@gmail.com>) id 1lqjbn-0007ZL-SG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Jun 2021 21:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Date:Reply-To:Content-Type:To:Subject:From:Sender:
 Message-ID:Cc:MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FNZtwLvrllRFWL+8hBj0nyO4zumHo8nebc8dxoTUJOs=; b=cfPPsYALxV89lTbeXIJIW5ZNs5
 GL5iz4ElBgSyfJjb+lBm+ty/AbgSzbXp2BEnzBN0pe2l8yfK/Y/tRRv1bIpy/n2SXW89WA7XxLb+F
 0dognNYlJtB8/Pi5LfthSQB8qonCUhlRQDIyluBXIDtDNzP4nfZ2nk11jP2mW1L/idcw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Date:Reply-To:Content-Type:To:Subject:From:Sender:Message-ID:Cc:
 MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FNZtwLvrllRFWL+8hBj0nyO4zumHo8nebc8dxoTUJOs=; b=IPQcHZ9mhkJYw0H/9I5U/VXmGI
 og82sn5b6kkN2U69GaUUiZV7CvHcNare3zRIFSmhygDSv6Dftjr//CebcgluXGQO/o0B30nrBoVsL
 oxmexeG8r+ebrpZHalkMD7JJzGJE4lLvsvLMbROpTqJwOBmy1BJdgTSYTbHgSnk0oF9s=;
Received: from [103.11.67.138] (helo=ehv3new.com)
 by sfi-mx-2.v28.lw.sourceforge.com with smtp (Exim 4.92.3)
 id 1lqjbf-00075p-DR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Jun 2021 21:50:04 +0000
From: "Ms. Kim" <9sporst9@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 9 Jun 2021 04:49:47 +0700
X-Priority: 3
X-Spam-Score: 7.0 (+++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (9sporst9[at]gmail.com)
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in digit
 (9sporst9[at]gmail.com)
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (9sporst9[at]gmail.com)
 1.0 MISSING_MID            Missing Message-Id: header
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 SPOOFED_FREEMAIL_NO_RDNS From SPOOFED_FREEMAIL and no rDNS
 1.2 NML_ADSP_CUSTOM_MED    ADSP custom_med hit, and not from a mailing list
 2.0 SPOOFED_FREEMAIL       No description available.
 0.3 SPOOF_GMAIL_MID        From Gmail but it doesn't seem to be...
X-Headers-End: 1lqjbf-00075p-DR
Subject: [f2fs-dev] my future investment ventures in your country
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
Reply-To: "Ms. Kim" <9sporst9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
Message-Id: <E1lqjbp-0007ZU-SH@sfs-ml-2.v29.lw.sourceforge.com>

my future investment ventures in your country
My name is Ms. Kim Anong, A Thai citizen in Asian Continent but currently
residing in abroad, I trust this email meets you in good health, I just got
your contact today during a research about your country and I will say that
I foresee success of my future investment ventures in your country. I want
to invest in your country and I would like you to assist me in my investment
with moral and physical advises. Please do reply me as soon as possible so
we can discuss more.

I look forward to hear from you soon
9sporst9@gmail.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
