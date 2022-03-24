Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C65FD4E664A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Mar 2022 16:49:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nXPi6-0006sp-6z; Thu, 24 Mar 2022 15:49:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <info@enersac.com>) id 1nXPi2-0006sQ-33
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Mar 2022 15:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Date:Reply-To:Content-Type:To:Subject:From:Sender:
 Message-ID:Cc:MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kUDRdhHWPKzlq3B1eKLU6ZP77qF6kjch0dx4OxXP8O8=; b=ijyyGrHvbTHwGYS6wLd/dE+F+F
 O9BswqNscG9ZbgGZ3js+9baGhnyUcpEdqUpcmGbrCCriup3rqyYgSTJVWFitAiRy6oa6N2858eGzg
 YKLQpptMtiIgNG2fsCDAMweeochT93XL4NjA4SXL3SC7g4pNPm5X8jq4/u3vE1ulKSkw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Date:Reply-To:Content-Type:To:Subject:From:Sender:Message-ID:Cc:
 MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kUDRdhHWPKzlq3B1eKLU6ZP77qF6kjch0dx4OxXP8O8=; b=Z/0tzBUQToiR5MqE9olNx8zheh
 nZ79Q2jTzKo1ARyTy1mzMkB14hSX/d7AlqV8zHt2TLcC1LCJiqAuADiQp8l1LkmaNIYfHpX2trs6h
 21jsflzYSIq/mbJtMaaegQHkD/zcqXjrZz83R/bykrEV7yE35n60epc32VI8JulNexro=;
Received: from b2bserver.de ([195.252.157.3] helo=vm36470.psmanaged.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nXPhz-0006Fs-SH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Mar 2022 15:49:08 +0000
Received: from Windows (unknown [83.137.6.243])
 by vm36470.psmanaged.com (Postfix) with ESMTPA id CD9BE5BCE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Mar 2022 16:39:25 +0100 (CET)
Authentication-Results: vm36470-b2b;
 spf=pass (sender IP is 83.137.6.243) smtp.mailfrom=info@enersac.com
 smtp.helo=Windows
Received-SPF: pass (vm36470-b2b: connection is authenticated)
From: "Ltd Finance" <info@enersac.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 24 Mar 2022 15:39:25 +0000
X-Priority: 3
X-Library: Indy 8.0.25
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Attention;
 We are pleased to announce that your linux-f2fs-devel@lists.sourceforge.net
 was nominated as one of the 28 recipients under the AMAZON Third category
 SWEEPSTAKE 2022 Prospect, tagged to encourage onli [...] 
 Content analysis details:   (1.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_PERMERROR        SPF: test of record failed (permerror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.5 SUBJ_ALL_CAPS          Subject is all capitals
 0.0 PP_MIME_FAKE_ASCII_TEXT BODY: MIME text/plain claims to be ASCII
 but isn't
 0.0 CTE_8BIT_MISMATCH      Header says 7bits but body disagrees
 0.1 MISSING_MID            Missing Message-Id: header
 0.0 LOTS_OF_MONEY          Huge... sums of money
 0.1 MONEY_NOHTML           Lots of money in plain text
 1.0 XFER_LOTSA_MONEY       Transfer a lot of money
 0.0 ADVANCE_FEE_2_NEW_MONEY Advance Fee fraud and lots of money
X-Headers-End: 1nXPhz-0006Fs-SH
Subject: [f2fs-dev] CLAIM YOUR OFFER
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
Reply-To: info@enersac.com
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0747948880550583544=="
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
Message-Id: <E1nXPi6-0006sp-6z@sfs-ml-1.v29.lw.sourceforge.com>

--===============0747948880550583544==
Content-Type: text/plain;iso-8859-1

Attention;

We are pleased to announce that your linux-f2fs-devel@lists.sourceforge.net was nominated as one of the 28 recipients under the AMAZON Third category SWEEPSTAKE 2022 Prospect, tagged to encourage online transactions.

Endeavor to contact Clearance Agent via Email: amazonexpress@zohomail.eu or call: + 447440723766  by stating your Claims serial numbers AMZ:6087/3545-22 that contains a prize relief of £650,000.00 to be paid  via Bank transfer or Certified cheque.

AMAZON UK


--===============0747948880550583544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0747948880550583544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

--===============0747948880550583544==--
