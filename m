Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DF346F968
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Dec 2021 03:57:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mvW61-0002d5-6k; Fri, 10 Dec 2021 02:57:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mkt@wondfobiotech.com>) id 1mvW5z-0002cy-K3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 02:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Type:MIME-Version:Message-ID:
 Reply-To:From:Date:To:Sender:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m29ACLOIXPQ4NO6pJsbECjUACG6t8x1wraUkR6NdO48=; b=FRuAe/ovZBM/uaC2bPujiuk+yJ
 yhrXZwyCskVRG5E+DHQybjvKUsSRVXeCjRs6CoO6dZ3F3ChGttqFn/cdRUF4eUpjenrrwPP0l3lgZ
 2fvz1eRruUkPQoqRmSp4BxMu55vpYtVVXd39OhPNMRC0yIvrnPvN0LKcnOTEg/aA1jHM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Type:MIME-Version:Message-ID:Reply-To:From:Date:To:Sender
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=m29ACLOIXPQ4NO6pJsbECjUACG6t8x1wraUkR6NdO48=; b=Q
 uZWu6YRTxhqrK4H+oUXUe+Rb5/xzvaTKyt2N4cijoQIihiFzl8yBilyFyuhHLx2TVcytYFX1AV0+q
 yO36fnsxWy5KqHhN2TiqgBhjujXf+DIXzDngMfdu81j8I/arDBpotBxYbNsibohfHegjTabp6jn8d
 s4G4GkdBQ7pMJeHc=;
Received: from discountvideocommercials.com ([192.129.175.112])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mvW5y-0006w8-U5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 02:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=marketing-products.net; s=default; h=Content-Type:MIME-Version:Message-ID:
 Reply-To:From:Date:Subject:To:Sender:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m29ACLOIXPQ4NO6pJsbECjUACG6t8x1wraUkR6NdO48=; b=MVHIh+3MFz+BgVrwxm/501d42d
 35YdMLyPkPhUHXtI/1oNscif9xpl5+b1ptfbYmHykSDgEDcVyWrpeJ0nt3lF2Tijx3VQX5kD+n8Le
 nvwOFlwrh4yE6UAuooEHywVtY9bzXCgeKRslh0Z6UYG6xurElWthFcIZOMZ+rmURQV0s8zphsJWyT
 u6OtU03ZXyhjNaDExjFJ3gcpnWbl7lM4PaO35XE77tSh1rZz7KSgVk/Um2dc9RW1TI175kfNiN2Y1
 VcTjiV8YTVGNLXQaHGIXsVxkAd8uwmivwzV+G+TsICWlcmCBtXZoH6TT6ky4clwAiHp+SigvQTzPm
 t8G501sg==;
Received: from marketin by hwsrv-652951.hostwindsdns.com with local (Exim
 4.94.2) (envelope-from <mkt@wondfobiotech.com>) id 1mvW5t-0006nk-0W
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 02:57:09 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-PHP-Script: marketing-products.net/wp-content/plugins/fabklhqici/vczstmtmvn.php for
 84.38.135.152
X-PHP-Originating-Script: 1012:vczstmtmvn.php(1) : eval()'d code(1) : eval()'d
 code(286) : eval()'d code(1) : eval()'d code
Date: Fri, 10 Dec 2021 02:57:08 +0000
From: marketing <mkt@wondfobiotech.com>
Message-ID: <b4c456350fd69d4da68567e818ea9ab5@marketing-products.net>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hwsrv-652951.hostwindsdns.com
X-AntiAbuse: Original Domain - lists.sourceforge.net
X-AntiAbuse: Originator/Caller UID/GID - [1012 992] / [47 12]
X-AntiAbuse: Sender Address Domain - wondfobiotech.com
X-Get-Message-Sender-Via: hwsrv-652951.hostwindsdns.com: authenticated_id:
 marketin/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hwsrv-652951.hostwindsdns.com: marketin
X-Source: 
X-Source-Args: /opt/cpanel/ea-php71/root/usr/bin/php-cgi 
X-Source-Dir: marketing-products.net:/public_html/wp-content/plugins/fabklhqici
X-Spam-Score: 8.2 (++++++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Warm greetings from Guangzhou Wondfo Biotech Co., Ltd. We
 are selling rapid test kit and it plays an important role for anti COVID-19.
 Please contact us freely if you need rapid test kit or gloves , mask and
 so on. Founded since 1992, Wondfo now has a wid [...] 
 Content analysis details:   (8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 NO_DNS_FOR_FROM        DNS: Envelope sender has no MX or A DNS records
 0.8 DKIM_ADSP_NXDOMAIN     No valid author signature and domain not in
 DNS
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.5 PDS_PHP_EVAL           PHP header shows eval'd code
 3.0 PHP_ORIG_SCRIPT_EVAL   From suspicious PHP source
 0.0 PHP_SCRIPT             Sent by PHP script
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1mvW5y-0006w8-U5
Subject: [f2fs-dev] [SPAM] Rapid test kit supplier
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
Reply-To: wondfotestkit@hotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Warm greetings from Guangzhou Wondfo Biotech Co., Ltd.
 
We are selling rapid test kit and it plays an important role for anti COVID-19. Please contact us freely if you need rapid test kit or gloves , mask and so on.
Founded since 1992, Wondfo now has a wide range of products for the rapid identification of cardiovascular diseases, inflammation, tumor, infectious diseases, drug abuse, pregnancy, and so on, widely sold to 140  countries and regions

if anything you need, kindly let me know. We can fight over diseases together !

Thanks and regards
Xiulan Jingyi

Guangzhou Wondfo Biotech Co., Ltd
Phone :( 86) 400-831-8768 
Fax: ( 86) 400-811-8797
Address :No.8 Lizhishan Road, Science City, Luogang District,Guangzhou, China
Website: www.wondfo.com.cn



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
