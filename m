Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4973C14A6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jul 2021 15:48:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m1UOB-0004Lo-7o; Thu, 08 Jul 2021 13:48:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <mabeljohnson@citromail.hu>) id 1m1UO8-0004Lh-Tr
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Jul 2021 13:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Type:MIME-Version:Message-ID:
 Reply-To:From:Date:To:Sender:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3OHMJYX74KmGOm1vWBk99SEK+F/MmrnsSZHY7CGdVFg=; b=L0mgFEANZu7MT63Y9uuew5n2Ds
 RtrPAWa9Sks5VnqvoxbzWozn9EXOi4j6l3HZeIAjlMI/1DykOOnE2LurdYOmwR95eIdccjgR0fLXC
 qvOuscAkFFkMkZrx6aeoRVgPn+LPTzlxsvITa20AK+osRp33FsabqRPRdIvt11Iv2KaM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Type:MIME-Version:Message-ID:Reply-To:From:Date:To:Sender
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3OHMJYX74KmGOm1vWBk99SEK+F/MmrnsSZHY7CGdVFg=; b=P
 Ja/lgEQvyXbEnTmGN6N9/RK99hoxFC9sCPr2ctIUYSFAsrl+omlxMgx2hvOi1iVEQK6bEy6kFot5R
 7ymWN9rM11oc0pJS/HMQVo9asAYPNrn6a8+Xi2CfUrhX8X9vz4EQNmXEWNKBaHXR3UzElp7w+0r4L
 OLGdkTHzhUpZ5Ya8=;
Received: from mx-n04.wc2.phx1.stabletransit.com ([207.246.242.250])
 by sfi-mx-1.v28.lw.sourceforge.com with smtp (Exim 4.92.3)
 id 1m1UNu-00FvwW-PW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Jul 2021 13:48:24 +0000
Received: by mx-n04.wc2.phx1.stabletransit.com (Postfix, from userid 114)
 id AC7AB18296F; Thu,  8 Jul 2021 08:32:30 -0500 (CDT)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 mx-n04.wc2.phx1.stabletransit.com
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=6.0 tests=BAYES_50,FREEMAIL_FROM,
 FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,SUBJ_ALL_CAPS,
 T_FILL_THIS_FORM_SHORT,UNPARSEABLE_RELAY autolearn=no
 autolearn_force=no version=3.4.2
X-Spam-Virus: No
Received: from php-v027.wc2.phx1.stabletransit.com (unknown [10.40.206.156])
 by mx-n04.wc2.phx1.stabletransit.com (Postfix) with ESMTP id 071B1182972
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  8 Jul 2021 08:32:30 -0500 (CDT)
Received: from digilu (uid 2914979) (envelope-from mabeljohnson@citromail.hu)
 id 20156
 by php-v027.wc2.phx1.stabletransit.com (DragonFly Mail Agent v0.11);
 Thu, 08 Jul 2021 08:32:30 -0500
To: linux-f2fs-devel@lists.sourceforge.net
X-PHP-Originating-Script: 2914979:class.engine.php(12) : runtime-created
 function
Date: Thu, 8 Jul 2021 08:32:30 -0500
From: MARY JOHNSON <mabeljohnson@citromail.hu>
Message-ID: <b69a1d7ff288d9a7eb8e09c4a1f11e07@jackieleestudio.com>
MIME-Version: 1.0
X-Spam-Score: 8.6 (++++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (mabeljohnson[at]citromail.hu)
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [207.246.242.250 listed in bl.score.senderscore.com]
 0.7 SPF_NEUTRAL            SPF: sender does not match SPF record (neutral)
 0.5 SUBJ_ALL_CAPS          Subject is all capitals
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in digit
 (mj224294[at]gmail.com)
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 1.0 FREEMAIL_REPLYTO       Reply-To/From or Reply-To/body contain different
 freemails 1.5 SPOOFED_FREEMAIL       No description available.
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal information
 2.5 SPOOFED_FREEM_REPTO    Forged freemail sender with freemail reply-to
 0.9 FORM_FRAUD             Fill a form and a fraud phrase
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1m1UNu-00FvwW-PW
Subject: [f2fs-dev] [SPAM] WORK OF GOD.
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
Reply-To: mj224294@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I am Mrs. Mary Johnson,78years,an aging widow suffering from cancer, I am on admission at a hospital.I would like to willfully entrust the rest of my monetary assets to you, Kindly reply back with your full Name, cellphone, address, to enable me to send you a letter of authorization to contact my bank first inland bank nigeria plc so that they can transfer my funds to your account for the purpose of helping the poor as indicated on my WILL.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
