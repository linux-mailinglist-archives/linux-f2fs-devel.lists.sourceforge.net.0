Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD0DDE157
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Oct 2019 02:02:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Date:Message-Id:MIME-Version:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ijuYb0+F4vXeO6ghal5xplNESqyfgwD/zLXWYjNbY70=; b=nLtEFRneHyXByAZjNWSichgTF1
	IoXq8SFqKsUxkGvZwjc79PjrQayNzw6cOt8l+ja4CCPgGK59SgoJbD55KwTxUys1zv2m6onaUqnu3
	HzBAJf7oPgOKBC/GqxZfoRg/CJu9NoXoPVx+2GJX2YlV3ecB+J/EmkaLtKGS4ltvaeds=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iML9R-0003nH-E9; Mon, 21 Oct 2019 00:02:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <apache@gatefjohn.tk>) id 1iML9Q-0003nB-Td
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Oct 2019 00:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Date:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Reply-To:From:Subject:To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hlDsYYVwDJv/mMdvnXDEHfQC7eOK915OwRdN37Klul4=; b=hJ0ljR6YCVk1lYxv6mtGpszIpv
 f1a7IRKdcDIkeXASMMS2+hibgHtTgVWR+IpZVrDiZaDd9erxBNHL1o3HFaWIeRBl3LbDpW7ew4uhH
 BC94Otkzz5gBpki3lAjYt/vbCl7BIQM1haSD9yAL6RzIfw/zJbV8uLRztyXICB4KSzZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Date:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Reply-To:From:Subject:To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hlDsYYVwDJv/mMdvnXDEHfQC7eOK915OwRdN37Klul4=; b=l
 Gar38ocU12DvsKb3q6UilkVBy+jZMwWuQEnU3o+TKP87aRutn0UuYj55nJhmB1L0NagH2yTPs/+B/
 9XqZYbIZFjjDwau+p2Ki9DBa3y11IxE7aeysdnHVORwpgVOu8OXniSyofr8zn6u0RCUR9/SVXLYae
 m7uCjvut4JaZ6zmE=;
Received: from [139.59.62.52] (helo=mail.gatefjohn.tk)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1iML9P-00FVRp-DO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Oct 2019 00:02:20 +0000
Received: by mail.gatefjohn.tk (Postfix, from userid 48)
 id B53913C6B67; Sun, 20 Oct 2019 20:03:19 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
X-PHP-Originating-Script: 0:ygehagea.php
MIME-Version: 1.0
Message-Id: <20191020223313.B53913C6B67@mail.gatefjohn.tk>
Date: Sun, 20 Oct 2019 20:03:19 +0000 (UTC)
X-Spam-Score: 7.0 (+++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [139.59.62.52 listed in zen.spamhaus.org]
 1.3 RCVD_IN_RP_RNBL        RBL: Relay in RNBL,
 https://senderscore.org/blacklistlookup/
 [139.59.62.52 listed in bl.score.senderscore.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 1.1 DATE_IN_PAST_03_06     Date: is 3 to 6 hours before Received: date
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iML9P-00FVRp-DO
Subject: [f2fs-dev] Purchase Order
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
From: Daniel Murray via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: sinara-group@list.ru
Cc: Daniel Murray <sinara-group@bk.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,friend,

This is Daniel Murray and i am purchasing manager from Sinara Group Co.,LTD in Russia.
We are glad to know about your company from the web and we are interested in your products.
Could you kindly send us your Latest catalog and price list for our trial order.

Thanks and Best Regards,

Daniel Murray
Purchasing Manager
Sinara Group Co.,LTD




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
