Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDC9CwUqcmmadwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 14:45:41 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2386779B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 14:45:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SRy/8UDoIPYll2gZlaXEWI+MLtDOsCLGCr5PLAPfWZM=; b=R7M+TtW2oflBZDgU/qxEnHJXoB
	gToNVTOPFwz9au/oSdsmlVfsGY1d58YXP0DnH0v2px9A+Fzo3xe6zZSLi384OnOjGfd4+I89e56V9
	Tev9MGvGnXuFF+CVWJ7IboUQLG4I1Uy0Eie2/4Mqcm80Z663y6OmW3k7U1UU57prxdaY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viv04-0001aD-0V;
	Thu, 22 Jan 2026 13:45:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sajiv@icompucare.my>) id 1viv02-0001a7-7I
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 13:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YcC18MwU7reQdlDJEAzOSvGKZE6b154t0b5VERSvP7Q=; b=T/msfjBYBXjb5w1WjpHHFnZMx2
 VZeKFpMY33nCNLIWNSJSfAftkN66XL0snaXhDUvx8fUL1qO6idwrinTVLIWjK/X1mN3xWud/29/oi
 nVtBD8lP+FEiPUhERaU2ukfFB6VFL+bJFY3WEUzpkbWpussyefLWWkFNsoAyMN/7mpqA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YcC18MwU7reQdlDJEAzOSvGKZE6b154t0b5VERSvP7Q=; b=Q
 a/Vc5I4D0ep3WUV22SQoqZ43zTgMucRtAn7IX7ItnkdRg9mVYJlX7l1ZMHnhS9RVPuVhwB0xIrMF7
 oqKAX7Wb9mCYZM2ocJEfZGe3UZ0D4aY47rkIZfUvhXKPnQRrVlK3xsujTFBqMpHDFxXk+G1oW3ZOB
 kXGvOEDQOC7CFJRY=;
Received: from [122.163.123.165] (helo=icompucare.my)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1viv02-0001Ii-3X for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 13:45:26 +0000
To: linux-f2fs-devel@lists.sourceforge.net
Date: 22 Jan 2026 18:54:15 +0530
Message-ID: <20260122185414.65835A5A00472F56@icompucare.my>
MIME-Version: 1.0
X-Spam-Score: 5.0 (+++++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Warm Greetings support. I have been trying to reach you on
 your telephone contact but no answer. We offer Corporate and Personal Loans
 at a competitive 2% APR,
 with flexible terms and no early repayment penalties.Loan
 terms r [...] 
 Content analysis details:   (5.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in digit
 [cc4921290(at)gmail.com]
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 LOTS_OF_MONEY          Huge... sums of money
 1.0 MONEY_FREEMAIL_REPTO   Lots of money from someone using free email?
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1viv02-0001Ii-3X
Subject: Re: [f2fs-dev] Business Loan Offer @2%
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
From: Maria Torres via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: cc4921290@gmail.com
Cc: Maria Torres <sajiv@icompucare.my>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	MSBL_EBL(7.50)[cc4921290@gmail.com:replyto];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	FAKE_REPLY(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	R_SPF_ALLOW(0.00)[+ip4:216.105.38.7];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[cc4921290@gmail.com]
X-Rspamd-Queue-Id: 9E2386779B
X-Rspamd-Action: no action


Warm Greetings support.

I have been trying to reach you on your telephone contact but no 
answer. We offer Corporate and Personal Loans at a competitive 2% 
 APR,with flexible terms and no early repayment penalties.Loan 
terms range from 2 to 10 years, and we reward brokers or 
referrers with a 1% commission. The Minimum amount you can borrow 
is $20,000.00 US Dollars to a Maximum of $10B USD. We are 
interested in investing in business opportunities globally 
including equity investment.

Kind Regards.

Maria Torres


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
