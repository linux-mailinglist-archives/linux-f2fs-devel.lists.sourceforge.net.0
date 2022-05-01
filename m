Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4455167AD
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 May 2022 22:20:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlG3K-0007qC-68; Sun, 01 May 2022 20:20:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <frontera@fronteracapltalgroup.com>)
 id 1nlG3I-0007pn-EW
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 May 2022 20:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x89nbLaLVhqUmG3SNUCqLT+CXmhd4xdj45Mto1LC/AI=; b=nVHr1IAqoo1xrdSf5iYMsFhGok
 JZ0r8gkhZVskvVYl6oJDaHogmckH13u+1LVybWh4cSyDoy5Gy7rw5GHcy6Y38tqBCx7uKG7aS2YMS
 35CiKCzi0jy+XgAWwevUlNU/vVLW/xHAX8gGAWKfGt0JHJCcPJuBqHFm13XLJ+0USGFk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=x89nbLaLVhqUmG3SNUCqLT+CXmhd4xdj45Mto1LC/AI=; b=R
 XEjngaDU5U5d0XgLfdelSMAvWdmg+rK418/HtbiIUbfnxGA0z8//EnyzbUnC1CzGgc2OCmKpzVJ/i
 2Cupo9IocZuJhaeDX/3fnkHtg8XCsQ3dbe6fq7/r0P4iaOb3oaHn6pNzn2IGYswPxU5eD1y2c7ytW
 m0GWQDO+Ged8oyIo=;
Received: from [45.133.1.102] (helo=fronteracapltalgroup.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.94.2)
 id 1nlG3H-00Fw46-VV
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 May 2022 20:20:20 +0000
From: Anice Armani <frontera@fronteracapltalgroup.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: 01 May 2022 22:20:14 +0200
Message-ID: <20220501222013.94BD2CE5A7ED6A57@fronteracapltalgroup.com>
MIME-Version: 1.0
X-Spam-Score: 8.7 (++++++++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hello, I’m Anice Armani. I work with Frontera Capital in
    the UAE. Frontera Capital is a boutique investment firm that focuses on fixed
    income and money market investment opportunities in frontier ma [...] 
 
 Content analysis details:   (8.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
                             [45.133.1.102 listed in dnsbl-1.uceprotect.net]
  1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in
                             bl.spamcop.net
                [Blocked - see <https://www.spamcop.net/bl.shtml?45.133.1.102>]
  1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
                             https://senderscore.org/blocklistlookup/
                             [45.133.1.102 listed in bl.score.senderscore.com]
  0.4 NO_DNS_FOR_FROM        DNS: Envelope sender has no MX or A DNS records
  2.7 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
                             [45.133.1.102 listed in psbl.surriel.com]
  0.8 DKIM_ADSP_NXDOMAIN     No valid author signature and domain not in
                             DNS
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  1.3 RDNS_NONE              Delivered to internal network by a host with no rDNS
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1nlG3H-00Fw46-VV
Subject: [f2fs-dev] [SPAM] proposal  UAE
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
Reply-To: frontera@fronterascapitalgroup.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8sIEnigJltIEFuaWNlIEFybWFuaS4gSSB3b3JrIHdpdGggRnJvbnRlcmEgQ2FwaXRhbCBp
biB0aGUgVUFFLiAKRnJvbnRlcmEgQ2FwaXRhbCBpcyBhIGJvdXRpcXVlIGludmVzdG1lbnQgZmly
bSB0aGF0IGZvY3VzZXMgb24gCmZpeGVkIGluY29tZSBhbmQgbW9uZXkgbWFya2V0IGludmVzdG1l
bnQgb3Bwb3J0dW5pdGllcyBpbiAKZnJvbnRpZXIgbWFya2V0cy4gQXQgcHJlc2VudCwgSSdtIGxp
bmtlZCB3aXRoIGludmVzdG9ycyB3aG8gYXJlIApyZWFkeSB0byBmdW5kIHByb2plY3RzIGFzIHRo
ZXkgYXJlIHNlZWtpbmcgbWVhbnMgb2YgZXhwYW5kaW5nIAp0aGVpciBwb3J0Zm9saW8gb3V0c2lk
ZSB0aGUgR3VsZiByZWdpb24gYnkgaW52ZXN0aW5nIGluIGZvcmVpZ24gCmNvbXBhbmllcyBhbmQg
cHJvamVjdHMuCgpJIGF3YWl0IHlvdXIgcmVzcG9uc2UuCgpUaGFua3MgYW5kIHN0YXkgc2FmZS4K
CkFuaWNlIEFybWFuaQoKRnJvbnRlcmEgQ2FwaXRhbCAgCgpVbml0ZWQgQXJhYiBFbWlyYXRlCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
