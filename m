Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0301FDD5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 May 2019 04:57:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hR6Zn-0001Ar-8Z; Thu, 16 May 2019 02:56:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <Dhlexpressworldwides@cosmofirms.com>)
 id 1hR6Zl-0001Ak-Nv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 May 2019 02:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=M/WOXILj8D9gyUKJ6TqQnfIcKZ
 sEVieK7MG6on7c7soXVcIIgM+LHuQSZvSK3e+XDLIY1M0tLKx+iRJEKmeR2A0V3TVg93W5sPl6oIZ
 gb1rSmYAnIdxYQHnVvEyYB6B61D4Lzd+5KUJkjWvez+2tXipSoQjec4ko6UQgVzRNihc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
 Date:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=J
 u60IEdvEcWsGwQ8IHiiyWiODXF7KDnkfrbvuvdGK6umFmr9+CHtoJRYm4Dv8eoHthnm0JHK1MjKeG
 SZkcYXgxvmsYhSqELMf3PzLDI5K+zDU4lVflCctSMAURdRtrCbZ+fmZ8onjY+5Xsl2BaDhr0EXzJO
 dc001ThMl9NwjFzU=;
Received: from server.cosmofirms.com ([162.144.86.61])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hR6Zk-000CnH-KD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 May 2019 02:56:57 +0000
Received: from [127.0.0.1] (port=44912 helo=EC2AMAZJKCM83K)
 by server.cosmofirms.com with smtp (Exim 4.91)
 (envelope-from <Dhlexpressworldwides@cosmofirms.com>)
 id 1hR614-0005Da-UW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 May 2019 02:21:07 +0000
From: "=?utf-8?Q?DHL=20Express=20Worldwide?="
 <Dhlexpressworldwides@cosmofirms.com> 
To: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 16 May 2019 02:21:04 +0000
MIME-Version: 1.0
Message-ID: <EC2AMAZJKCM83K03c4db6031d942e7a2724c218742030f@EC2AMAZJKCM83K>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.cosmofirms.com
X-AntiAbuse: Original Domain - lists.sourceforge.net
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - cosmofirms.com
X-Get-Message-Sender-Via: server.cosmofirms.com: acl_c_authenticated_local_user:
 root
X-Authenticated-Sender: server.cosmofirms.com: root
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.3 RCVD_IN_RP_RNBL        RBL: Relay in RNBL,
 https://senderscore.org/blacklistlookup/
 [162.144.86.61 listed in bl.score.senderscore.com]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
X-Headers-End: 1hR6Zk-000CnH-KD
Subject: [f2fs-dev] =?utf-8?q?DHL_On_Demand_Delivery?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
