Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C12876F60
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Mar 2024 07:31:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1riqEz-0000Vp-3C;
	Sat, 09 Mar 2024 06:31:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <SRS0=QXqU=KP=scrollout.comdepot.pl=postmaster@comdepot.pl>)
 id 1riqEx-0000Vi-9L for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Mar 2024 06:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FAsDsfGhRgHLhiPEp5G/wiEHNNbE0kr6ZZQI+0qFbSs=; b=ANpr4DbV+FrDak891YzmE5dprl
 1P/jfzDqmyBw+Ow2yks13w9p8mL8QoDQo98UOKDoycxtODmD6I26nr3VyWNxg6JUjaXXsMYcJ4Ikj
 n+OPfwM1m5m7aktn02otV6VWt1paak0oxn/dzjArIoGSjojJJ/47tabO50Z7INxwU+Uk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FAsDsfGhRgHLhiPEp5G/wiEHNNbE0kr6ZZQI+0qFbSs=; b=E
 +ZjQjSQSNJmz3PAOa9CW2Ha+p6XqxDxPQH5SriRYKeWzbkjkDQ+oDvk9h9GuIuOCh2/lCtZ6kgJum
 YDW43MvM7mN2Hple3MNd4gYBecHvhIZRxoAx5LGej3QPwkXnkupL2yp96kkiz+qhp062ZubBNA8f3
 ldQYgm013DH9owrY=;
Received: from [158.101.188.237] (helo=scrollout.comdepot.pl)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1riqEl-0001wQ-G1 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Mar 2024 06:31:27 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by scrollout.comdepot.pl (Postfix) with ESMTP id 4Ts9fp42gCzFcZL
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  9 Mar 2024 05:53:54 +0100 (CET)
X-Virus-Scanned: Scrollout F1 at comdepot.pl
Received: from scrollout.comdepot.pl ([127.0.0.1])
 by localhost (scrollout.comdepot.pl [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id LskrB-MYQr7C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  9 Mar 2024 05:53:41 +0100 (CET)
Received: from scrollout.comdepot.pl (localhost.localdomain [127.0.0.1])
 by scrollout.comdepot.pl (Postfix) with ESMTP id 4TrY4B1jDdzD04D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  8 Mar 2024 05:25:12 +0100 (CET)
From: Mr Philippe <postmaster@scrollout.comdepot.pl>
To: linux-f2fs-devel@lists.sourceforge.net
Date: 08 Mar 2024 05:25:10 +0100
Message-ID: <20240308052509.58C78D49F97CC431@scrollout.comdepot.pl>
MIME-Version: 1.0
X-Spam-Score: 8.5 (++++++++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Bonjour, Je me présente Monsieur Philippe MARTINEZ, je vous
    contacte suite à un don de 1 525 000 € que je veux vous offrir, car mes
    jours sont comptés. Pour plus de renseignements, je vous prie d [...] 
 
 Content analysis details:   (8.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
                             https://senderscore.org/blocklistlookup/
                           [158.101.188.237 listed in bl.score.senderscore.com]
  1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
                             [158.101.188.237 listed in dnsbl-1.uceprotect.net]
  0.5 RCVD_IN_MSPIKE_L5      RBL: Very bad reputation (-5)
                             [158.101.188.237 listed in bl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  1.3 RDNS_NONE              Delivered to internal network by a host with no rDNS
  1.0 RCVD_IN_MSPIKE_BL      Mailspike blocklisted
  1.0 HK_NAME_MR_MRS         No description available.
  2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1riqEl-0001wQ-G1
Subject: [SPAM] Re: Très Important
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
Reply-To: phillippemartinez@outlook.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Qm9uam91ciwKSmUgbWUgcHLDqXNlbnRlIE1vbnNpZXVyIFBoaWxpcHBlIE1BUlRJTkVaLCBqZSB2
b3VzIGNvbnRhY3RlIHN1aXRlIArDoCB1biBkb24gZGUgMSA1MjUgMDAwIOKCrCBxdWUgamUgdmV1
eCB2b3VzIG9mZnJpciwgY2FyIG1lcyBqb3VycyAKc29udCBjb21wdMOpcy4gUG91ciBwbHVzIGRl
IHJlbnNlaWduZW1lbnRzLCBqZSB2b3VzIHByaWUgZGUgYmllbiAKdm91bG9pciBtZSBjb250YWN0
ZXIgw6AgbW9uIGFkcmVzc2UgY291cnJpZWwgcGVyc29ubmVsOiAKcGhpbGxpcHBlbWFydGluZXpA
b3V0bG9vay5jb20KUXVlIGxlIFNlaWduZXVyIERpZXUgY3LDqWF0ZXVyIGR1IGNpZWwgZXQgZGUg
bGEgdGVycmUgZXhhdWNlIHZvcyAKcHJpw6hyZXMsIEFtZW4uCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
