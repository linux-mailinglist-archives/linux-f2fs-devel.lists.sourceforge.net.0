Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B088C8F834
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Nov 2025 17:31:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:MIME-Version:Date:Message-ID:To:From:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tZNh9OAWZC2DOd4HCXBT7OVRryD/+0SNFPe7jxS1U+g=; b=VMlXTh7luS7Pu9Z1C7MeJflumX
	Eado7OYsqDxTFXKIngfVvTIm92j/KOSsHu88w7DCKQJhpPZK7GKPtKEY7QneZeJLWYVd6OeAcr3MX
	SkubceoL8HJM6NOq2ybwSqpMOC/MUEC+36NHrJwc5cBvoqcTceuYbOz39fHVETBE60DQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOetf-0002Hg-RD;
	Thu, 27 Nov 2025 16:31:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <90295@msa.hinet.net>) id 1vOetd-0002HZ-Lo
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Nov 2025 16:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Type:MIME-Version:Date:
 Content-Transfer-Encoding:Message-ID:Reply-To:To:From:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZNYtndDCKh6r4EUXo/etIwC6qOR4mP2L9/5ZFk7yiPc=; b=hUCj3NcIkxXjqGrtguEyQv56sQ
 JDGi46FK/P8t6GO2RC/dbHhtl0aOcxzTAGeB+x44cfq33yT/pBy8aZIajAu6Kr+m8fj8ghbUrpZOs
 QWzFN6KDWVpU7ZRgpzs2PQcWL8bewnOW4telR3F51qRpOFl6/XzxnEQNGevI9nvgV4S4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Type:MIME-Version:Date:Content-Transfer-Encoding:
 Message-ID:Reply-To:To:From:Sender:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZNYtndDCKh6r4EUXo/etIwC6qOR4mP2L9/5ZFk7yiPc=; b=lrmJqYkt3BPQ1C3rjBaz2gkkoH
 HTaKcSkPUwcWsTVWV+noD9RiUXTe5t8C0reUmULBp3qGtRH7JxUKMjFoVUDp2tI9A0ppXwR2j80O8
 sBpfXU5tSwHdLMOLRBPH8Hh93FBq+fK5JJhcbRHInVDHX1zw4znH9n6UOE2o9ZITpIw4=;
Received: from 210-65-1-144.hinet-ip.hinet.net ([210.65.1.144]
 helo=cdmsr1.hinet.net) by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vOetY-0005Vm-Vl for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Nov 2025 16:31:05 +0000
Received: from cmsr3.hinet.net ([10.199.216.82])
 by cdmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 5ARGUV2u406675
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 28 Nov 2025 00:30:52 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=msa.hinet.net;
 s=default; t=1764261052; bh=0Ol2toTlJ4QpUNzN+eX+mnim/uE=;
 h=From:To:Subject:Date;
 b=mMYd4MROk4MCgxCw9Tf0M8yXHygTxMhHrQwNrmHHK4iQrFZ4m1hJfjEr2eLwhzjqJ
 43kYEdfLxJgL/PQbQnRKaEZ4whNLJxQHvDpAj3D16tgO7H6yeSnYo7qm+RpMcmznxv
 5jRK13favBDF6aCyW/LyZpOEFWFmBFeafnS6RNyM=
Received: from [127.0.0.1] (1-160-126-177.dynamic-ip.hinet.net [1.160.126.177])
 by cmsr3.hinet.net (8.15.2/8.15.2) with ESMTPS id 5ARGPdx9884070
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 28 Nov 2025 00:27:25 +0800
From: "Fadel - Crona" <90295@msa.hinet.net>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <6e167afa-1fd7-a447-61b0-9a0af604bc13@msa.hinet.net>
Date: Thu, 27 Nov 2025 16:27:24 +0000
MIME-Version: 1.0
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=PoUwbBM3 c=0 sm=1 tr=0 ts=69287bee
 p=86hzbzkIsB4A:10 a=xjlYW2c7PS4V/2/8fD5bfw==:117
X-Spam-Score: 7.7 (+++++++)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dear Linux-f2fs-devel, I hope you’re doing well. I’m reaching
    out to learn more about the products listed in the attached document and
   would really appreciate your prompt feedback. Could you please share details
    about pricing, availability, specifications, and any current offers or promotions?
    It would also be great to know about your shipping options and estimated
   delivery time [...] 
 
 Content analysis details:   (7.7 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  4.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
                             [210.65.1.144 listed in dnsbl-1.uceprotect.net]
  1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
                             [210.65.1.144 listed in dnsbl-2.uceprotect.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  1.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [90295(at)msa.hinet.net]
  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in digit
                             [sb199047(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [90295(at)msa.hinet.net]
  0.4 RDNS_DYNAMIC           Delivered to internal network by host with
                             dynamic-looking rDNS
  1.0 FREEMAIL_REPLYTO       Reply-To/From or Reply-To/body contain different
                             freemails
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1vOetY-0005Vm-Vl
Subject: [f2fs-dev] =?utf-8?q?=5BSPAM=5D_LPO_39845_Thursday=2C_November_27?=
 =?utf-8?q?=2C_2025_at_05=3A27=3A23_PM?=
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
Reply-To: Procurement <sb199047@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RGVhciBMaW51eC1mMmZzLWRldmVsLAoKSSBob3BlIHlvdeKAmXJlIGRvaW5nIHdlbGwuIEnigJlt
IHJlYWNoaW5nIG91dCB0byBsZWFybiBtb3JlIGFib3V0IHRoZSBwcm9kdWN0cyBsaXN0ZWQgaW4g
dGhlIGF0dGFjaGVkIGRvY3VtZW50IGFuZCB3b3VsZCByZWFsbHkgYXBwcmVjaWF0ZSB5b3VyIHBy
b21wdCBmZWVkYmFjay4KCkNvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgZGV0YWlscyBhYm91dCBwcmlj
aW5nLCBhdmFpbGFiaWxpdHksIHNwZWNpZmljYXRpb25zLCBhbmQgYW55IGN1cnJlbnQgb2ZmZXJz
IG9yIHByb21vdGlvbnM/IEl0IHdvdWxkIGFsc28gYmUgZ3JlYXQgdG8ga25vdyBhYm91dCB5b3Vy
IHNoaXBwaW5nIG9wdGlvbnMgYW5kIGVzdGltYXRlZCBkZWxpdmVyeSB0aW1lcy4KCllvdXIgcXVp
Y2sgcmVzcG9uc2Ugd2lsbCBoZWxwIG1lIG1vdmUgZm9yd2FyZCB3aXRoIG15IGRlY2lzaW9uLCBz
byBJ4oCZZCBiZSBncmF0ZWZ1bCBpZiB5b3UgY291bGQgZ2V0IGJhY2sgdG8gbWUgYXQgeW91ciBl
YXJsaWVzdCBjb252ZW5pZW5jZS4KClRoYW5rIHlvdSBzbyBtdWNoIGZvciB5b3VyIHRpbWUgYW5k
IGFzc2lzdGFuY2Ug4oCUIEkgdHJ1bHkgYXBwcmVjaWF0ZSBpdCBhbmQgbG9vayBmb3J3YXJkIHRv
IGhlYXJpbmcgZnJvbSB5b3Ugc29vbi4KCldhcm0gcmVnYXJkcywKTXMuIEVybmVzdG8gRmVlbmV5
CkhlYWQgb2YgUHJvY3VyZW1lbnQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
