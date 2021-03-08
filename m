Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C28B033070D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Mar 2021 06:03:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lJ82h-0004uk-Si; Mon, 08 Mar 2021 05:02:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nami@5fafa.xyz>) id 1lJ82g-0004uS-CE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Mar 2021 05:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Date:
 Reply-To:MIME-Version:To:Subject:From:Sender:Message-ID:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NXLrjnw6zI7BocruTTJtFWcJ6qWv+mwcqxLRSY3jRJI=; b=jNA+KqpLJY7fao2HRMIFo7D+9n
 FD1DBvy69y9jnAqug4T/E8kZxU9oKkqodD9lh2aYF8P/toIgQxt0URzCagq2CQDbJQvmrf7RguUGH
 GkqajYRwUKiLKJsuReGRiAuv5YzzLjcayL4QqNkNn5XLYnIFEwIebdxyq0sAZon5V+l4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Date:Reply-To:MIME-Version:To:
 Subject:From:Sender:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NXLrjnw6zI7BocruTTJtFWcJ6qWv+mwcqxLRSY3jRJI=; b=J
 IUSYryDo39ji1VpqVjutWDY0RHcI7v8l0eufWlVXfsBXJjmFl8QMYxelgqPqPMgH5/dpe82UJEdfr
 /6b49uhCsu+Oua9/q7ziy0eBHjoYUwdZpuo13URUV9Y/G524u+NxXqzL4qjYzUw4Z5wpjsd0guGDg
 jH1gbQs15lZaXz60=;
Received: from 5fafa.xyz ([106.75.237.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lJ82X-000SII-89
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Mar 2021 05:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=default; d=5fafa.xyz;
 h=From:Subject:To:MIME-Version:Reply-To:Date:Content-Type:Content-Transfer-Encoding;
 i=nami@5fafa.xyz; bh=NxP5VtJjwHufso4gXAJ75krU5YQ=;
 b=hTYpv6+OLuB4BmiAhSkvcQzyDPih9VFJFrfxGaYTEDDW942f/iPH2/FZZmx3ohl4tniVdEjAy9vC
 /RcelmzQPU7dz5zh4SwhnaveoWWR2qk94z51j5cRiGoSophgADaHxsSSCJd+PyH+jw0Z4eoCOVik
 e7/6Sx0kW4G6rTKHxf0=
From: "Ms. Melvida Bullock" <nami@5fafa.xyz>
To: linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Date: Mon, 8 Mar 2021 13:01:56 +0800
X-Spam-Score: 7.4 (+++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?106.75.237.29>]
 1.5 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [106.75.237.29 listed in psbl.surriel.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in digit
 (melvbullockzone123[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 MISSING_MID            Missing Message-Id: header
 0.0 LOTS_OF_MONEY          Huge... sums of money
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 0.0 MONEY_FREEMAIL_REPTO   Lots of money from someone using free email?
 1.0 XFER_LOTSA_MONEY       Transfer a lot of money
 0.0 ADVANCE_FEE_2_NEW_MONEY Advance Fee fraud and lots of money
X-Headers-End: 1lJ82X-000SII-89
Subject: [f2fs-dev] Greetings Dear Beloved:
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
Reply-To: melvbullockzone123@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
Message-Id: <E1lJ82h-0004uk-Si@sfs-ml-1.v29.lw.sourceforge.com>

Dear Beloved,

Life is gradually passing away from me as a result of my present medical condition and my personal doctor confided in me yesterday that I have only a few more weeks to live. In view of this setback, I want to donate my estate for humanitarian assistance, since this has always been the plan of my late husband and besides I have no child. In an effort to compliment the good work of our creator for humanity and the wish of my late Husband I donate the sum of 10,000,000.00 Euro (Ten Million EUR) to you. Upon your acknowledgement of this mail and informing me of your nationality and current place of resident, my Bank will facilitate due processes for transfer of this legacy to you. May God bless you as you use this money judiciously for the work of charity to help the less privileged.

Sincere regards,

Ms. Melvida Bullock
Email: melvbullockzone123@gmail.com



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
