Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D87F1D2D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Nov 2023 20:15:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r59jU-0001gz-Qm;
	Mon, 20 Nov 2023 19:14:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Ahmadramcfacffa3@pobox.com>) id 1r59jT-0001gt-Eq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Nov 2023 19:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Content-Type:Sender:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bcLXkx/V9zh53+x4go2x/BiaDpHd3MR6Z7nd9BSuHCs=; b=mrGz9s/MeoW0KRzboYGuM4YfQB
 VjI2YeZf+BQcHX+sVwjlKSE3XzYGOriAft2AXai0iHPyD952G7kbZ18IjdzmsYdetPKAaagE14HnP
 wQEBArIf0scd4llHVB6qHH+EQ84MDNlMe85dr/l850pCdNEZaRhr8OU/okIGsYiXEwXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Content-Type:Sender:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bcLXkx/V9zh53+x4go2x/BiaDpHd3MR6Z7nd9BSuHCs=; b=LRhohkI9yAn1eqM/8ENeX+v+dd
 AX1RG4xPGCywi53bsL8Vv7AAAugQ0Rdt7oCLUPt7IdVRlk1W99sLYj4rymU64226tM2bh6Vk7hAO7
 PuuIyaN6KU3x5O1v0MeS5DSOPO0MQLz7fDUKCN3mThSV9j03y9vS2/wa8MQk8gv47A2Y=;
Received: from marine.unionapex.com ([202.82.82.2]
 helo=GHMG01.great-harvest.local)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r59jS-00BKaI-Rv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Nov 2023 19:14:55 +0000
X-AuditID: c0a80a26-927612400000462b-2a-655b7f418fa6
Received: from [45.154.98.249] (Unknown_Domain [45.154.98.249])
 (using TLS with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 by GHMG01.great-harvest.local (Symantec Messaging Gateway) with SMTP id
 F4.F0.17963.14F7B556; Mon, 20 Nov 2023 23:46:09 +0800 (HKT)
Message-ID: <F4.F0.17963.14F7B556@GHMG01.great-harvest.local>
MIME-Version: 1.0
Content-Description: Mail message body
To: linux-f2fs-devel@lists.sourceforge.net
From: "Ramadan Ahmad" <Ahmadramcfacffa3@pobox.com>
Date: Mon, 20 Nov 2023 16:46:07 +0100
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNJMWRmVeSWpSXmKPExsWiOyvpp65jfXSqwamLOhaXFrk7MHrsXvCZ
 KYAxissmJTUnsyy1SN8ugStj+5M+5oKzzBU7p1xiaWD8zdTFyMkhIWAiMfv2VtYuRi4OIYFV
 TBKv7u5jBkkwC+hJ3Jg6hQ3E5hWwlXhzci47hC0ocXLmExaIGm2JZQtfA9VzANlqEl+7SkDC
 wgKGEk+PXGUEsUUEtCQmNvwFs9kEjCTap58Fa2URUJXYcvoOK4gtJKAucX7qFaYJjDyzkGye
 hWTbLCTbZiFsW8DIsopRyt3D193AUC+9KDWxRDcjsagstbhELyc/OTFnEyMwfA6s4FLbwfhx
 0ke9Q4xMHIyHGCU4mJVEeL8JRaQK8aYkVlalFuXHF5XmpBYfYpTmYFES5w0IkIoXEkhPLEnN
 Tk0tSC2CyTJxcEo1MNnG7w+Prc7cbrFy3+uGbfu9lrhalapn1mg9qrl04ugrzpeJl5ZbXjux
 wO3joqkX0y84iQt75Vg9OzwnNjnfj20Ji8u2D+e+cjq5Tc5/0tEos21mrVOt00XPTs+ymtVJ
 X7/uithjGzGpcfdiD8tHSQd4eDh/TjhhePjd6/sPHntM662/Urjy2poNl1fseNAg4OPcnnny
 iXId+8+4xYZZ1uu3bgxZ9VzQ5NaHjUcPC//xUdBtEF42v1r7cdShW3eYDayvRXqJf0r0KnT3
 3JARMWftta32DAGzV0w1fKTxU9744KVJl7YFRra1TF4p6SvW8PVr5I97B+WX/NtfvWO54NR9
 13nYnVirgl+KMXZ77J2rxFKckWioxVxUnAgAUuMyE44CAAA=
X-Spam-Score: 3.4 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Attn: linux-f2fs-devel@lists.sourceforge.net Date: 20-11-2023
 Subject: Investment Expression of Interest (IEOI) Dear Sir,
 Having been referred
 to your investment by my team, we would be honored to review your available
 investment projects for onward referral to my principal investors who can
 allocate capital for the fina [...] 
 Content analysis details:   (3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [202.82.82.2 listed in dnsbl-1.uceprotect.net]
 1.7 DEAR_SOMETHING         BODY: Contains 'Dear (something)'
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 0.7 SPF_NEUTRAL            SPF: sender does not match SPF record (neutral)
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1r59jS-00BKaI-Rv
Subject: [f2fs-dev] Investment Expression of Interest (IEOI)
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
Reply-To: finance@almnadrinvestment.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Attn: linux-f2fs-devel@lists.sourceforge.net
Date: 20-11-2023
Subject: Investment Expression of Interest (IEOI)

Dear Sir,

Having been referred to your investment by my team, we would be honored to review your available investment projects for onward referral to my principal investors who can allocate capital for the financing of it.

kindly advise at your convenience

Best Regards,
Ramadan Ahmad CFA
Chartered Finance Investment Analyst


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
