Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BED53BBF6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jun 2022 17:57:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwnCD-00066n-Rw; Thu, 02 Jun 2022 15:57:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <soc.salesmktgs@sharjahoxygen.com>)
 id 1nwnCA-00066c-PF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jun 2022 15:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Reply-To:From:
 Date:Subject:To:Sender:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dmHRIGS2rljxIOknV4VU/p/O9X/mSEPbWDlpvd9lQ3I=; b=bHGYP0LCLZ+OXRmUdFQrItuJBb
 eWsscyLbEJEvJGLTAbQSb3ZC22+pdxSwPol4PhJhryu4GCgZ4CKkfg8hvb3jDs4Wk4QUurwFJGM5W
 exl9y9OSqgGEE6VglIgnPXZgpGCXhNp4QjNhvlLtsDNxJ9F/g3ehYaZp5g/Hg5CJxElA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Reply-To:From:Date:Subject:To:Sender
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dmHRIGS2rljxIOknV4VU/p/O9X/mSEPbWDlpvd9lQ3I=; b=k
 Q0unuxGs9dDEtV4dnwsjySVZ44d+8NkvHf4j+tsTaFor4zV0zhCFpAUwLgRq5eSjx4VmWXLV6BuME
 KHlDC3PWIixFlgQtp5DILvSOnPp/ozoUMiCHF5Q3TTBiUNR/z+3XVHdk85pjfMj7uw9R3Bv/+QPXT
 X7pcpRnLSmnbcD9I=;
Received: from [143.110.184.46] (helo=unicodetestserver2021.in)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nwnCA-002S6E-Ot
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jun 2022 15:57:11 +0000
Received: by unicodetestserver2021.in (Postfix, from userid 33)
 id 30FAA3D4944; Thu,  2 Jun 2022 21:06:43 +0530 (IST)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 2 Jun 2022 21:06:43 +0530
From: SOC SALES & MARKETING <soc.salesmktgs@sharjahoxygen.com>
Message-ID: <44338c1cf3d31639cbdbf7daf2e1d333@dentaltogether.com>
MIME-Version: 1.0
X-Spam-Score: 6.1 (++++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Good day, Sir With our experience in the Gas Industry, we
 provide high quality and approved international standards to large and small
 companies in the various types of industries Our Primary activities are:
 -Lease and Sales - Cylinders, Vaporizer, ISO and Storage Tanks -Fabrication
 and Supply - Cylinder Quads / Racks / Carry Racks / Regulating Manifolds
 -Supply of Gases - Indu [...] 
 Content analysis details:   (6.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [143.110.184.46 listed in wl.mailspike.net]
 1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [143.110.184.46 listed in dnsbl-1.uceprotect.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [143.110.184.46 listed in bl.score.senderscore.com]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1nwnCA-002S6E-Ot
Subject: [f2fs-dev] Gas producer and supplier of gas related equipment
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
Reply-To: soc.salesmktg@hotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Good day,  Sir
With our experience in the Gas Industry, we provide high quality and approved international standards to large and small companies in the various types of industries

Our Primary activities are:
-Lease and Sales - Cylinders, Vaporizer, ISO and Storage Tanks
-Fabrication and Supply - Cylinder Quads / Racks / Carry Racks / Regulating Manifolds
-Supply of Gases - Industrial, Medical, Specialty Gases and Gas Mixtures
-Liquid Bulk Supply - Ammonia, Propane, LPG, Carbon Dioxide, Argon, Nitrous Oxide, Oxygen and Nitrogen
-Installation and Commissioning - Liquid and Gas Plants, Gas Filling Stations with Storage Tanks Facilities
-Trading - All Types of Gas accessories and Gas related Equipments

We carry out Hydrotesting of cylinders, racks and tube trailers along with the complete refurbishment of skids including repair of frames and manifolds, blasting, painting and other services as per customer requirement.

If you need our service, pls inform me

 
 
 
Regards,
RAHUL NARAIN
General Manager - Projects, Exports & Bulk Sales
 
SHARJAH OXYGEN COMPANY (SOC)
P.O. Box 800, Sharjah, UAE
Tel:  971-6-529 1199 Ext 23 / Fax:  971-6-529 1099

Skype email: soc.salesmktg@hotmail.com
 
SOC Website: http://www.sharjahoxygen.com
Working Hours: 8:00AM to 6:00PM (Sunday to Thursday)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
