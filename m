Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C4191C8C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2020 23:10:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGrkM-0001PI-1I; Tue, 24 Mar 2020 22:10:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <samokojere@remittance.com>) id 1jGrkH-0001Oj-1k
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Mar 2020 22:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HoWrRjup2LzMpzWBhZG3XKu1q9eruPbw5yZzFqsR2p8=; b=X7mYJNNej8wXKOLBrXcPV8+TQ0
 DW9fIj2J/V/uhq9KrZj7gicCBNQC8mAuCjkGzFaSh09kAX6CZVr4aFXc0u/QSddvJ+XlRLjCjEh+m
 aoHDz1Esmpw/zNDTzFiOTsgh8fXbyjaFja5lR1uuixyRmfBEFE8Hi6HVU9vflfRiTq/g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HoWrRjup2LzMpzWBhZG3XKu1q9eruPbw5yZzFqsR2p8=; b=T
 UCWQzL+xtdTEsqd9Vj6WOaha6mRge+ekjmeDwi1dycxpt8oyuPyMIlF6D+AnPUpTPSwK8r5sTh+je
 Zp+M8J/vs4KyQSypw5XbhPd4YBDUceG6H/6apE5dSUJnUUlliZkHTVs2UcSeFmxG8Nlcb281eoMc+
 kTloJtqI6YVtq8qY=;
Received: from smtphost103.smtphosting.sk ([185.14.255.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jGrkF-0061l4-Rm
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Mar 2020 22:10:01 +0000
Received: from remittance.com (unknown [180.214.239.142])
 by smtphost103.smtphosting.sk (Postfix) with ESMTP id 6A94E6FF64
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Mar 2020 22:51:47 +0100 (CET)
From: Mr.  Samuel Chukwuyem Okojere <samokojere@remittance.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: 24 Mar 2020 14:51:45 -0700
Message-ID: <20200324145145.F80FB2123178DF22@remittance.com>
MIME-Version: 1.0
X-Spam-Score: 6.3 (++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?185.14.255.193>]
 1.5 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [185.14.255.193 listed in psbl.surriel.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in digit
 (samokojere250[at]gmail.com)
 1.3 RCVD_IN_RP_RNBL        RBL: Relay in RNBL,
 https://senderscore.org/blacklistlookup/
 [185.14.255.193 listed in bl.score.senderscore.com]
 0.0 HK_NAME_MR_MRS         No description available.
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal information
 0.0 FORM_FRAUD_5           Fill a form and many fraud phrases
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGrkF-0061l4-Rm
Subject: [f2fs-dev] Your Fund.
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
Reply-To: samokojere250@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Attention:

In consonance with the Central (Apex) Banks of West African 
countries (BENIN, BURKINA FASO, CAPE VERDE, COTE D'IVOIRE, 
GAMBIA, GHANA, GUINEA, GUINEA BISSAU, LIBERIA, MALI, NIGER, 
NIGERIA, SENEGAL, SIERRA LEONE,TOGO),we are committed to 
identifying beneficiaries/payments for eventual unconditional 
transfer to beneficiaries.

I, respectfully wish to draw your attention to the following that 
you have been identified as a beneficiary of outstanding Fund 
currently long overdue and to help / facilitate our on going 
exercise, preparing to the unconditional transfer of your funds, 
You need to urgently reconfirm your details and requisite 
information viz,

(a) Full names and address and telephone.
(b) Copy of your identity.
(c) Essential documents pertaining to your funds and your claim 
for payment.

Note:   You are quickly advised to stop communication with any 
other person whatsoever.Finally, endeavor to treat this mail as 
imperative and urgent and also to maintain confidentiality on it 
at all times and in all places until you have received your 
funds.

Finally, endeavor to treat this mail as imperative and urgent and 
also to maintain confidentiality on it at all times and in all 
places until you have received your funds.

Sincerely Yours,

Mr. Samuel Chukwuyem Okojere
Director,Payment Systems Management Department
Central Bank of Nigeria
Plot 33,Abubakar Tafawa Balewa Way 
Central Business District,Cadastral Zone,
Abuja,Federal Capital Territory,Nigeria 
P.M.B. 0187,Garki Abuja. 
Nigeria


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
