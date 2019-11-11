Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 675B7F70FA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Nov 2019 10:42:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Message-ID:Date:To:Content-Description:
	MIME-Version:Sender:Content-ID:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1+ACRSa/XbFwP6zBB/qtYjJdS06Nxw6ByoDkma3yQms=; b=SsbXtcrDPPbeuh+LwDpTg2ntM7
	+atu1RuRuZab5y0XHEtSFadh5F3OFG7QfloQcDfkhHgtZjQKC04JlvbdS97OTz0e3qsuDiRU9ULF9
	rXDfqojVsD5EGn5c1uRfWci+5EWPqCkhO+rj7pe5sU+pM7Kv9EuwJgEODC06tQ0+zgrY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iU6Co-0003Gd-Du; Mon, 11 Nov 2019 09:41:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <jportfolio.managements-linux+2Df2fs+2Ddevel=lists.sourceforge.net@epay.com>)
 id 1iU6Cn-0003GQ-4W
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 09:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:Reply-To:Date:From:To:Subject:
 Content-Description:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7q9n6Tr6N62lgCu9r1nm9kAiVScpDx9nrmiyZWB09P0=; b=gO9nyg1IkaGc3lbM+FqYtIxApM
 oWC1UFvoC/c434pQvF/dkdOK9UofPOWY5wXfrMAGqiwlJkp/PErN3lKXd6Og8nYHCDpcl7GW3Sb5j
 A14dGMdBMd5QRHIdFlPmPBKpTUBXJiKWn0M+vBI/4T+wAvWO06cvy433Ncp7IHMKHvrg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Cc:Content-ID:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7q9n6Tr6N62lgCu9r1nm9kAiVScpDx9nrmiyZWB09P0=; b=YejH+xiabJ/7aqnyJqtbGecGOq
 4O5RKJWvuKpmGjqUelu9iPYBYHrN1bkCCD0CRFuPzunrUKKSEq30jDtD3U7ODi+EHNL2P1VOHQ07o
 1aScIGUqh2qtlByY8X11nhvUhs9vwfWCHWOWZQ7PBJ/g1JXy8qrhaG9VwosY6rj7D5J8=;
Received: from mail.iserviceltd.com ([157.245.160.152])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1iU6Cm-00ElYz-3j
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 09:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=epay.com;
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-Description:Subject:To:From:Date:Reply-To:Message-ID;
 i=jportfolio.managements@epay.com; 
 bh=18TjuDxD2VZoK6udkStVVKxmrSQ=;
 b=DjTwpSXztiiiE8yJMJHEqH/cIyhYTgPGixkYEIv4pCv/06m7pqrwR8ckfqIQuaJZ8AKh/Eckd+D2
 Uosetkjib7bsxlrZFeFJuho4yAhmZW62XL/gHuwOkGck0iUuIeuTVI92MshOpDStM/uVKbxbLUQK
 Evdz2XiQjkovqobSLa98lVMQgU/oXfI3QU04NLDVLpZ7eVNnu8w4C2X92lp+dC9kaGrlk9W59r/B
 9qvZPGDPXyzDTZotDmuf2OcLYwSfYGMqcIsHp56rkLdkmD9usFyALZ+sKw4mCKUYEXCtP9LNp1Qx
 khP/nq6V8Hqd06mGBKQmh8IYniQ/Q+qlX+aD9w==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=epay.com;
 b=NSBvo52r2fww//1Il+K369ClQebUKekdKUomS3abAnb6W5VF8r9hW2f08Qo8kW2JXEQephk2PwWX
 OhwhU7vOmHcCOL/Mc6pAwVSVeJHNMJi5mXoOjHLhXcgeLWQNL0kuXg6qGhnY3OuyfcehzPFyggYV
 VWy/kemfzWn/H4SoXCYd3xV2vn3rpAeDInmtBKpwgoEXeJ0yN2paFNSAl6FURAyKLL0emwuNXltO
 bgYC8B6pSSmY1rztDIQT/QjFnKYKDEJxtSMREzaJqRF+JfiSlfpw1fo9g5cKXyDX5v5evH2SVZJI
 kPTjAlVhOFpHMWUaiv6UE836W6PFVJZnWebEEA==;
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.iserviceltd.com 71AE371419
MIME-Version: 1.0
Content-Description: Mail message body
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 11 Nov 2019 11:41:26 +0200
Message-ID: <0.0.0.742.1D59874315B3F32.0@mail.iserviceltd.com>
X-Spam-Score: 7.7 (+++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?157.245.160.152>]
 1.5 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [157.245.160.152 listed in psbl.surriel.com]
 1.3 RCVD_IN_RP_RNBL        RBL: Relay in RNBL,
 https://senderscore.org/blacklistlookup/
 [157.245.160.152 listed in bl.score.senderscore.com]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iU6Cm-00ElYz-3j
Subject: Re: [f2fs-dev] 10 November
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
From: Portfolio Managements via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: portfolio.managements@aol.com
Cc: Portfolio Managements  <jportfolio.managements@epay.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Good Day ,

I am outsourcing individuals with proficient abilities to manage a vast wealth for an Arab Angel Investor with beleaguered political situation. These funds can be invested in tranches of 50 M or a tranche that is suitable for the portfolio manager.

If you have Investment and/or Portfolio Management abilities, credible projects in need of funding or existing businesses requiring expansion, we would be delighted to work with you.

Sincerely,

John


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
