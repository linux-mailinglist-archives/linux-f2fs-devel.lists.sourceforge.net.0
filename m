Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10376A1ADAF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2025 00:55:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tb72h-0006te-E2;
	Thu, 23 Jan 2025 23:55:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <simon@gosfordukfinanceltd.com>) id 1tb72f-0006tX-KD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Jan 2025 23:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jTXMQLYLnzzl4tMhcmVu4eyUgjcdCEZafbd/djhgyDc=; b=GN8F3brmKR1+YPc4642d79qAXU
 9wD9eNZ+5Nd1Wp4NwN4W6R3iKz9x17NNnfiLhxQA+ZO5kiNGr3MPctz5gIU1n3T2i13nRQm+c1X9N
 ESzfyn0ZOj18H0XaRCydT9LonZ7KGcuLdyrq8C04zbKOc99Ub0Dc2Ld/VvfOL4gmj5AQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jTXMQLYLnzzl4tMhcmVu4eyUgjcdCEZafbd/djhgyDc=; b=M
 vaapNMzEskz+DmA/Un6/RbEETIs4MJNcpiX1Uhca9oR1rlBtTN58h8haK59C6XV8Q5MzNKPcYG2Vs
 eiXPcnrbZQa0HvGi1wn3ZnaVVx+qNcpsN9fFTHvjH99bJUIHni0eXoRCkpIusNrH1nxEMH1X3DjOr
 fB7eBgov5usabS+M=;
Received: from [38.43.111.254] (helo=mail.grupoarka.pe)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tb72e-00049i-Bu for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Jan 2025 23:55:20 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.grupoarka.pe (Postfix) with ESMTP id 7DBEE10A07F58
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jan 2025 18:36:24 -0500 (-05)
Received: from mail.grupoarka.pe ([127.0.0.1])
 by localhost (mail.grupoarka.pe [127.0.0.1]) (amavis, port 10032) with ESMTP
 id cwuTy2Ph-XUx for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jan 2025 18:36:24 -0500 (-05)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.grupoarka.pe (Postfix) with ESMTP id 3B65410A0C7BA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jan 2025 18:12:38 -0500 (-05)
X-Virus-Scanned: amavis at grupoarka.pe
Received: from mail.grupoarka.pe ([127.0.0.1])
 by localhost (mail.grupoarka.pe [127.0.0.1]) (amavis, port 10026) with ESMTP
 id rGJirVwKCGMG for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jan 2025 18:12:38 -0500 (-05)
Received: from gosfordukfinanceltd.com (gateway [172.27.225.126])
 by mail.grupoarka.pe (Postfix) with ESMTP id 421EA10A13388
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jan 2025 17:55:51 -0500 (-05)
From: Mr Simon <simon@gosfordukfinanceltd.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: 23 Jan 2025 23:53:05 -0800
Message-ID: <20250123235305.396AA3A78B927929@gosfordukfinanceltd.com>
MIME-Version: 1.0
X-Spam-Score: 3.2 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Greetings, The GOSFORD FINANCE & LOANS LTD (UK) invites you
 to partner with us and benefit from our new Loan and Project funding program.
 We offer loans and funding for various good projects. This is however in
 [...] Content analysis details:   (3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [38.43.111.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [38.43.111.254 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.5 SUBJ_ALL_CAPS          Subject is all capitals
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 DATE_IN_FUTURE_06_12   Date: is 6 to 12 hours after Received: date
 0.0 FROM_FMBLA_NEWDOM28    From domain was registered in last 14-28
 days 0.4 HK_NAME_MR_MRS         No description available.
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1tb72e-00049i-Bu
Subject: Re: [f2fs-dev] NEW BUSINESS PLAN
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
Reply-To: ritchie@gosfordukfinance.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Greetings,

The GOSFORD FINANCE & LOANS LTD (UK) invites you to partner with 
us and benefit from our new Loan and Project funding program. We
offer loans and funding for various good projects. This is 
however in the form of a partnership.

Do you have projects and businesses that require funding? We are 
ready to give out Loans (big or small), at just 2% per annum for
15 years. If you're interested in any of our proposals, then send 
me your mobile phone number so that I can write to you or give
you a call for more details on our Loan Investment Funding Plan.

I look forward to your response

Mr Simon
GOSFORD FINANCE &
LOANS LTD


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
