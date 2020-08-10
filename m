Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E2F24031F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Aug 2020 10:04:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k52mv-00060L-91; Mon, 10 Aug 2020 08:04:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <info@jangosh.com>) id 1k52mt-00060E-Tg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Aug 2020 08:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Reply-To:Date:From:To:Subject:
 Content-Description:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iuCO3trWiPK+Sl4i6gYUEBYLhFWkKqFoDnIYtKrLO4A=; b=Ji0vp8x+rCpvNG5IpZg52Ks398
 i+YLYv2c8MSd2uCyfZdRQrdw4NAbOv8lGmaS1BxhoDle2rGrZfQv4GuSfYKZbPTfCDFOfHQVbxC8X
 WfNRABcoiUrPUE2c6+o70odEW2u6V/zSxPla1omn/IKWblUcJeK+a9C+5jLsTNGdoZtA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Cc:Content-ID:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iuCO3trWiPK+Sl4i6gYUEBYLhFWkKqFoDnIYtKrLO4A=; b=GiwKa5tW7tSKrF7zL/pt/8gKS4
 6KhE4ioTN5tjZOk2buLqTh5U+oKUGd+okjYCEhf7faXAcTnBZInE3MZgZ+sOfKhh8zFg8rOFoKyoD
 61SlqSOXRQCJ4qYXN/zgty9Z2UKf19IL3b8Uct4ScrTaCMp+urzMOl/ajJDlh4NvErkE=;
Received: from [104.193.252.207] (helo=DS7919209.clientshostname.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1k52ms-005RO6-QC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Aug 2020 08:04:07 +0000
Received: from [178.238.8.170] (localhost [IPv6:::1])
 by DS7919209.clientshostname.com (Postfix) with ESMTP id 20FB550595
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Aug 2020 02:14:52 -0400 (EDT)
MIME-Version: 1.0
Content-Description: Mail message body
To: linux-f2fs-devel@lists.sourceforge.net
From: "Jangosh Group" <info@jangosh.com>
Date: Mon, 10 Aug 2020 08:14:45 +0200
Message-Id: <20200810061454.20FB550595@DS7919209.clientshostname.com>
X-Spam-Score: 6.2 (++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.7 DEAR_SOMETHING         BODY: Contains 'Dear (something)'
 0.0 RCVD_IN_MSPIKE_L4      RBL: Bad reputation (-4)
 [104.193.252.207 listed in bl.mailspike.net]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 RCVD_IN_MSPIKE_BL      Mailspike blacklisted
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1k52ms-005RO6-QC
Subject: [f2fs-dev] Product Inquiry
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
Reply-To: Jangosh Group <jangosh.group@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Dear Sir/ Madam

Do you export your product, if yes? send us your export list or Catalog.

We want to purchase your product, what is your MOQ.

Your quick response would be appreciated.

Best regards,
Miss Maria Gonzales
Jangosh Group LLC
(Purchasing Manager)
For the Company.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
