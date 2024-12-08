Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 298749E8445
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 Dec 2024 09:45:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tKCum-0006ji-3B;
	Sun, 08 Dec 2024 08:45:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ubuntu@bmi-tech.cn>) id 1tKCul-0006jc-2y
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 08 Dec 2024 08:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xpdqNvBW2iJujK9fBlE1satOfe/JYoJ+RWKSpnEpE14=; b=XAsHsc6ec4zp+FzVDEazqORs+c
 NRh0JtD7yf2s3CeC7ZV0GMS+VhV3MQzxgr748KV0TQG4UjW+VtbBcqE38brn75JDY0EVul/B95nHM
 bGfo2twpw66MAH4p1qwP5dDyCkFr71iFWhSncphu/JuFjBsm8iYnzT4P+2+kpBaj6tB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xpdqNvBW2iJujK9fBlE1satOfe/JYoJ+RWKSpnEpE14=; b=A
 20nCtP6AGm8A62yqqesnH9miczWUYOjA21ZMwBvRW0y3bNJgJnuCtnKJzv5NvVfPUxxbVhBWZs5V/
 NdLVr0ocnVWz9FjmRCsO0Khq8t3hDE7bLEjPWxKXJ6sIjtV7+1aPAKLJChf66sQCjTcjcAKyZNkk/
 wfz5GYWf2HlFGaY8=;
Received: from [39.156.195.158] (helo=mail.bmi-tech.cn)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1tKCuk-0006Kg-At for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 08 Dec 2024 08:45:19 +0000
Received: from bmi-tech.cn (unknown [41.138.89.243])
 by mail.bmi-tech.cn (Postfix) with ESMTPA id C1D2A82F14C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  8 Dec 2024 16:43:14 +0800 (CST)
From: Marie PRESLES <ubuntu@bmi-tech.cn>
To: linux-f2fs-devel@lists.sourceforge.net
Date: 08 Dec 2024 09:43:10 +0100
Message-ID: <20241208094310.32CBF75C4F3B355F@bmi-tech.cn>
MIME-Version: 1.0
X-Spam-Score: 3.8 (+++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Bonjour, J'espère que vous allez bien! Je suis désolé de
    vous contacter comme ça, ce n'est pas mon habitude. Ayant suivi mon cœur
    je pense que vous êtes la personne dont j'ai besoin pour mon message que
    [...] 
 
 Content analysis details:   (3.8 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [39.156.195.158 listed in bl.score.senderscore.com]
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [39.156.195.158 listed in sa-trusted.bondedsender.org]
  1.3 RDNS_NONE              Delivered to internal network by a host with no rDNS
  2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1tKCuk-0006Kg-At
Subject: [f2fs-dev] Mme Marie PRESLES
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
Reply-To: preslesmarie@yahoo.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Qm9uam91ciwKCkonZXNww6hyZSBxdWUgdm91cyBhbGxleiBiaWVuISBKZSBzdWlzIGTDqXNvbMOp
IGRlIHZvdXMgY29udGFjdGVyIApjb21tZSDDp2EsIGNlIG4nZXN0IHBhcyBtb24gaGFiaXR1ZGUu
IEF5YW50IHN1aXZpIG1vbiBjxZN1ciBqZSAKcGVuc2UgcXVlIHZvdXMgw6p0ZXMgbGEgcGVyc29u
bmUgZG9udCBqJ2FpIGJlc29pbiBwb3VyIG1vbiBtZXNzYWdlIApxdWUgamUgcG9ydGUgw6Agdm90
cmUgY29ubmFpc3NhbmNlLiBKZSB2b3VzIGRlbWFuZGUgZGUgcG9ydGVyIHVuZSAKYXR0ZW50aW9u
IHBhcnRpY3VsacOocmUgw6AgbW9uIG1lc3NhZ2UgYWZpbiBxdWUgdm91cyBwdWlzc2lleiAKcHJl
bmRyZSBsYSBib25uZSBkw6ljaXNpb24uIEVuIGVmZmV0LCBqZSBtJ2FwcGVsbGUgTWFyaWUgUFJF
U0xFUyAsIAp1biBib3Vyc2llciBzbG92YXF1ZSDDoCBsYSByZXRyYWl0ZSBvw7kgaidhaSBmYWl0
IGZvcnR1bmUgZGFucyBkZXMgCmVudHJlcHJpc2VzIGVuIHBsZWluIGVzc29yIHRlbGxlcyBxdWUg
bGVzIGJvdXJzZXMgZXQgYmllbiBwbHVzIAplbmNvcmUuIE1haXMgw6AgdW4gbW9tZW50IGhvcnMg
ZHUgdGVtcHMgZGUgbm9zIHBhcmNvdXJzLCBsYSAKcsOpYWxpdMOpIG5vdXMgbW9udHJlIHF1ZSBy
aWVuIG7igJllc3Qgw6l0ZXJuZWwuIEMnZXN0IGFpbnNpIHF1ZSBqJ2FpIApyw6lhbGlzw6kgcXVl
IGxlIGTDqWJ1dCBkZSBjaGFxdWUgdmllIGEgdG91am91cnMgdW5lIGZpbiBldCBxdWUgamUgCm5l
IHBldXggcGFzIHJlc3RlciBsb25ndGVtcHMuIEVuIGVmZmV0LCBqZSBzb3VmZnJlIAptYWxoZXVy
ZXVzZW1lbnQgZCd1biBjYW5jZXIgZW4gcGhhc2UgdGVybWluYWxlLCBsZSBtw6lkZWNpbiAKdHJh
aXRhbnQgbSdhIGRpdCBxdWUgbWVzIGpvdXJzIMOpdGFpZW50IGNvbXB0w6lzIGVuIHJhaXNvbiBk
ZSBtYSAKc2FudMOpIGTDqWdyYWTDqWUgZXQgZGUgbW9uIMOiZ2UgYXZhbmPDqS4gw4l0YW50IHVu
ZSBncmFuZGV1ciBkJ8OibWUgcXVpIApmYWl0IGRlIG1vaSB1biBwaGlsYW50aHJvcGUsIGonYWkg
dG91am91cnMgdW4gY8WTdXIgcG91ciBtZXMgCnNlbWJsYWJsZXMsIHN1cnRvdXQgY2V1eCBxdWkg
c291ZmZyZW50LCBjZXV4IHF1aSBsdXR0ZW50LCB0b3VzIApjZXMgZ2VucyBxdWkgbmUgc29udCBw
YXMgZW50ZW5kdXMgZXQgY2VsYSBsb3JzIGRlIG1lcyB2b3lhZ2VzLiAKU2FjaGV6IHF1ZSBjZWxh
IG5lIG1lIHNlcnQgw6AgcmllbiBkJ2F2b2lyIGRlcyBiaWVucyBldCBkZSBuZSBwYXMgCnBhcnRh
Z2VyIHNhY2hhbnQgcXVlIGxhIG1vcnQgZXN0IMOgIG1lcyB0cm91c3Nlcy4gQydlc3QgcG91cnF1
b2kgCmplIHNvdWhhaXRlIGJpZW4gdm91bG9pciB2b3VzIG9mZnJpciBtYSBwcm9wcmnDqXTDqSBk
J3VuZSBzb21tZSBkZSAKMjUgNTgwIDAwMCDigqwsIGFmaW4gcXVlIHZvdXMgcHVpc3NpZXogcsOp
YWxpc2VyIGxlcyBwcm9qZXRzIHF1aSAKdm91cyB0aWVubmVudCDDoCBjxZN1ci4gVmV1aWxsZXog
cHJlbmRyZSBjb250YWN0IGF2ZWMgbW9uIG5vdGFpcmUgCnBvdXIgcsOpY2xhbWVyIHZvdHJlIGRv
bmF0aW9uLCBhZmluIHF1ZSBsZXMgZG9jdW1lbnRzIHNvaWVudCAKw6l0YWJsaXMgcG91ciB2b3Vz
IHBlcm1ldHRyZSBkZSBqdXN0aWZpZXIgbCdvcmlnaW5lIGRlIHZvcyBmb25kcy4KCkJpZW4gw6Ag
dm91cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
