Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5864E3BA404
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jul 2021 20:40:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lzO5b-00079N-DN; Fri, 02 Jul 2021 18:40:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <9sporst9@gmail.com>) id 1lzO5C-00078g-B9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 18:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Date:Reply-To:Content-Type:To:From:Sender:
 Message-ID:Cc:MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FNZtwLvrllRFWL+8hBj0nyO4zumHo8nebc8dxoTUJOs=; b=gH9wo2Xbvshvwt3l4ScaMOUqkC
 IEomxAno51M/SUN8u2zNIxyC9h/+yncI4FZaP/74ZmNnuRp9ldltXilp4hlt974mQJknCHjO74BQC
 yfC5+eUXMGF0v/Z5oF3yYuUk/f9vNBKLWj0bnwPFhjQgk1uO3T5DJzaCb10RvmQe51jE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Date:Reply-To:Content-Type:To:From:Sender:Message-ID:Cc:
 MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FNZtwLvrllRFWL+8hBj0nyO4zumHo8nebc8dxoTUJOs=; b=B/zjMUkyqL/YHE/O4pL98v4Os0
 BnMoylI0u91DXU6/JZA8OFpeGGDc82C1dKgrvF8qSL3eZfT58gCFF+MpHZZ2HiKmf+rqCgwzp/XlF
 mgLyhD9jPYLyEnKWa95ZpGqL89i9q5sKo/DEj1C+O/5U0AUYauH2pYPVuP9WwHbQ8eCw=;
Received: from usa-4.svrip.com ([209.141.35.52] helo=hyh85i1.com)
 by sfi-mx-2.v28.lw.sourceforge.com with smtp (Exim 4.92.3)
 id 1lzO52-0002fN-Rb
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 18:40:10 +0000
From: "Ms. Kim" <9sporst9@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 3 Jul 2021 01:39:53 +0700
X-Priority: 3
X-Spam-Score: 8.3 (++++++++)
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
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [209.141.35.52 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_L3      RBL: Low reputation (-3)
 [209.141.35.52 listed in bl.mailspike.net]
 1.0 MISSING_MID            Missing Message-Id: header
 0.0 RCVD_IN_MSPIKE_BL      Mailspike blacklisted
 1.2 NML_ADSP_CUSTOM_MED    ADSP custom_med hit, and not from a mailing list
 0.3 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
 2.0 SPOOFED_FREEMAIL       No description available.
 1.1 SPOOF_GMAIL_MID        From Gmail but it doesn't seem to be...
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1lzO52-0002fN-Rb
Subject: [f2fs-dev] [SPAM] my future investment ventures in your country
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
Message-Id: <E1lzO5b-00079N-DN@sfs-ml-2.v29.lw.sourceforge.com>

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
