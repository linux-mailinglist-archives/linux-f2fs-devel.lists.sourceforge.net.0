Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A84AC9239F6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2024 11:28:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOZo3-0006Fy-30;
	Tue, 02 Jul 2024 09:28:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunyibuaa@gmail.com>) id 1sOZo0-0006Fr-4O
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 09:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nW5NUpvADTD8UVO2vLBBZH7ScJjLCuiOXUWaKXBk80A=; b=PrUDJwukeEQWZltzRXHcSlCjuK
 fSCwBmImTxuZZ2Ecp/6qrRt/J6gHyWok9bv3pGkyG6sAZ4Z55I+04ZooStrRqbx76cIem0OSa/zqR
 aVDScb9N/OQACHfWQey4TyMUu+qYrj6hi0cE3G7HEZ2E4QZbZ594kqOQMB/zojG7JxIs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nW5NUpvADTD8UVO2vLBBZH7ScJjLCuiOXUWaKXBk80A=; b=FQdOcfa9sjxufa8ze5U2fLWT//
 Fu1M4FNTb2XtWupvYNf0IfE0gz3rTzcSi3CbLGhCMOh9t6j3lWAPWKmmGo0yaXg2MbpX1Uncmrl0O
 rKffvP5PUqza3tZEmall604I93HrQfikXJS8ng6+pCoLNIHz464MXG6Zom1LwVmJ/H5I=;
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sOZo0-0005rH-I0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 09:28:08 +0000
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ec50d4e47bso38230781fa.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 02 Jul 2024 02:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719912476; x=1720517276; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nW5NUpvADTD8UVO2vLBBZH7ScJjLCuiOXUWaKXBk80A=;
 b=K4wRUMMPAylVvD2VR8a5qEfT/RuIlDzTFU5gouAPXZlxtsWOrEgLzOg4fDKiSSf4Sp
 +mpHk9y1/JzxnkUiobxFpLnmJpt9r+1lM5nxpqS7FoxR5BSR6g23aJDEp1UmnbMXE7Fa
 0h8PNdiPFsWOA1UyNvpum8GM7FhKzLwYj4Bsz+EzkUkuMhp2//sARUf+T3u/1znheTkg
 5v5VOG26YFJvMe4+CQ6ETZB/A13OF1z6ZREjGqKMrpnAtRo0nuZzb70cSgUESo0EQArJ
 53iInZzgZhtYm3ZFI3DhwzqD8Moe4TOZpBmcKGB226in4nPBK2/pvayH/4Cc3VS4QZ/4
 zdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719912476; x=1720517276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nW5NUpvADTD8UVO2vLBBZH7ScJjLCuiOXUWaKXBk80A=;
 b=w+OpqSAme6N0ZIhrkOpfALHb1TyGPVN3OLXztMGukALD/jyGDP+hdVbttVGw1kwsw1
 VzKuF47i3Y8squmagxUVFcTB6OYrK1tGCedeHx5cgUZxvLzucawda+PKBUcpSIcKFJZ1
 GRO2aWWbs5r9x2jUB7XagnALlbfGqn531xZOEirJOoo7pd2a38jx4L5QCqFmLukSLTbZ
 DqAlapq4Jloz+D1vq5KN+kgYooIhGF/lzYd1JPlTyonJkatRFs/MZ54eTRavOF+vvpHb
 RAEVqj2fJjtjB1oc0jXen5D84ijhfSIQOnmjVsgIRlemTOmlDMCCBa9fxWzNAx049Mtw
 35XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXld1Ko6yRNgbJ9LyReL4ceb/mcw1setEr4SKDdttZswZ/o17yQ4oOwJ8zqHziFGJsgQP0zs0wOMzNeTAhuc2d9xl4PCw6aoIyU7c9I1R3TkOooSyMBoQ==
X-Gm-Message-State: AOJu0YzkFDWJLmm9JUjHkzOrlRbD6ZEJABUnBIyX4oIC/HOorWB5q/Us
 c8s7TlWkUR7DXXMaXR2uJbzY0E1IaYliC/kZ5MwbRIdyhOygsM3IHO/Ru2Ukh9Jy4tgWhP+g4HJ
 xLD/Ql/15AaNXeFHCH+nvXAug+Pk=
X-Google-Smtp-Source: AGHT+IHEO5OiCIH3xFHQ38s2EbEo+++BlCllu0Kc3PP0e/MXs8XptBFZ09d7RoqPv7WEmY7LcHd5XEhDXnGeTqpA7JE=
X-Received: by 2002:a2e:a912:0:b0:2ee:4e67:85ec with SMTP id
 38308e7fff4ca-2ee5e337908mr73043911fa.5.1719912475717; Tue, 02 Jul 2024
 02:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240701075138.1144575-1-yi.sun@unisoc.com>
 <20240701075138.1144575-2-yi.sun@unisoc.com>
 <ZoLoJ-uBo9qyAlMg@slm.duckdns.org>
 <ycmaxfuqpnj3vnmseikx7m7jkzsp2t2qtlncgub44xhxohs6du@hucdavhpcvpi>
In-Reply-To: <ycmaxfuqpnj3vnmseikx7m7jkzsp2t2qtlncgub44xhxohs6du@hucdavhpcvpi>
From: yi sun <sunyibuaa@gmail.com>
Date: Tue, 2 Jul 2024 17:27:19 +0800
Message-ID: <CALpufv3bAsMey1DFb8HPbp8gPZWBU-6rrhvRWwVQsxXhPXOvdA@mail.gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>, Tejun Heo <tj@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Yes, adding the io priority attribute to work will bring huge
 benefits in the following scenarios: The system has huge IO pressure (these
 IOs may all be low-priority IOs), and a work (we hope to compl [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.208.170 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.208.170 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.208.170 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sunyibuaa[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.170 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sOZo0-0005rH-I0
Subject: Re: [f2fs-dev] [PATCH v2 1/2] workqueue: new struct io_work
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
Cc: yunlongxing23@gmail.com, ebiggers@google.com, linux-kernel@vger.kernel.org,
 jiangshanlai@gmail.com, Yi Sun <yi.sun@unisoc.com>,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

WWVzLCBhZGRpbmcgdGhlIGlvIHByaW9yaXR5IGF0dHJpYnV0ZSB0byB3b3JrIHdpbGwgYnJpbmcg
aHVnZSBiZW5lZml0cyBpbiB0aGUKZm9sbG93aW5nIHNjZW5hcmlvczoKVGhlIHN5c3RlbSBoYXMg
aHVnZSBJTyBwcmVzc3VyZSAodGhlc2UgSU9zIG1heSBhbGwgYmUgbG93LXByaW9yaXR5IElPcyks
CmFuZCBhIHdvcmsgKHdlIGhvcGUgdG8gY29tcGxldGUgcXVpY2tseSkgaXMgYWxzbyBkb2luZyBJ
Ty4gSWYgdGhpcyB3b3JrCmRvZXMgbm90IHNldCBJTyBwcmlvcml0eSwgaXQgd2lsbCBiZSBibG9j
a2VkIGJlY2F1c2UgaXQgaXMgZGlmZmljdWx0IHRvIGdldCBJTwpyZXNvdXJjZXMuIEFuZCBpZiB0
aGlzIHdvcmsgc2V0cyBhIGhpZ2ggSU8gcHJpb3JpdHkgYW5kIHBhc3NlcyB0aGUgSU8gcHJpb3Jp
dHkKdG8ga3dvcmtlciwgdGhlbiB0aGlzIHdvcmsgd2lsbCBiZSBjb21wbGV0ZWQgcXVpY2tseSAo
YXMgd2UgZXhwZWN0KS4KCk9uIFR1ZSwgSnVsIDIsIDIwMjQgYXQgMTE6NTPigK9BTSBLZW50IE92
ZXJzdHJlZXQKPGtlbnQub3ZlcnN0cmVldEBsaW51eC5kZXY+IHdyb3RlOgo+Cj4gT24gTW9uLCBK
dWwgMDEsIDIwMjQgYXQgMDc6MzI6MjNBTSBHTVQsIFRlanVuIEhlbyB3cm90ZToKPiA+IEhlbGxv
LAo+ID4KPiA+IE9uIE1vbiwgSnVsIDAxLCAyMDI0IGF0IDAzOjUxOjM3UE0gKzA4MDAsIFlpIFN1
biB3cm90ZToKPiA+ID4gKy8qCj4gPiA+ICsgKiBJZiBhIHdvcmsgbWF5IGRvIGRpc2sgSU8sIGl0
IGlzIHJlY29tbWVuZGVkIHRvIHVzZSBzdHJ1Y3QgaW9fd29yawo+ID4gPiArICogaW5zdGVhZCBv
ZiBzdHJ1Y3Qgd29ya19zdHJ1Y3QuCj4gPiA+ICsgKi8KPiA+ID4gK3N0cnVjdCBpb193b3JrIHsK
PiA+ID4gKyAgIHN0cnVjdCB3b3JrX3N0cnVjdCB3b3JrOwo+ID4gPiArCj4gPiA+ICsgICAvKiBJ
ZiB0aGUgd29yayBkb2VzIHN1Ym1pdF9iaW8sIGlvIHByaW9yaXR5IG1heSBiZSBuZWVkZWQuICov
Cj4gPiA+ICsgICB1bnNpZ25lZCBzaG9ydCBpb3ByaW87Cj4gPiA+ICsgICAvKiBSZWNvcmQga3dv
cmtlcidzIG9yaWdpbmFsIGlvIHByaW9yaXR5LiAqLwo+ID4gPiArICAgdW5zaWduZWQgc2hvcnQg
b3JpX2lvcHJpbzsKPiA+ID4gKyAgIC8qIFdoZXRoZXIgdGhlIHdvcmsgaGFzIHNldCBpbyBwcmlv
cml0eT8gKi8KPiA+ID4gKyAgIGxvbmcgaW9wcmlvX2ZsYWc7Cj4gPiA+ICt9Owo+ID4KPiA+IFRo
ZXJlIGFyZSBmdW5kYW1lbnRhbCBsaW1pdGF0aW9ucyB0byB0aGlzIGFwcHJvYWNoIGluIHRlcm1z
IG9mCj4gPiBwcmlvcml0aXphdGlvbi4gSWYgeW91IHRhZyBlYWNoIHdvcmsgaXRlbXMgd2l0aCBw
cmlvcml0eSBhbmQgdGhlbiBzZW5kIHRoZW0KPiA+IHRvIHRoZSBzYW1lIHdvcmtxdWV1ZSwgdGhl
cmUncyBub3RoaW5nIHByZXZlbnRpbmcgYSBsb3cgcHJpb3JpdHkgaXNzdWVyIGZyb20KPiA+IGZs
b29kaW5nIHRoZSB3b3JrcXVldWUgYW5kIGNhdXNpbmcgYSBwcmlvcml0eSBpbnZlcnNpb24uIGll
LiBUbyBzb2x2ZSB0aGlzCj4gPiBwcm9wZXJseSwgeW91IG5lZWQgcGVyLWlzc3Vlci1jbGFzcyB3
b3JrcXVldWUgc28gdGhhdCB0aGUgY29uY3VycmVuY3kgbGltaXQKPiA+IGlzIG5vdCBzaGFyZWQg
YWNyb3NzIGRpZmZlcmVudCBwcmlvcml0aWVzLgo+ID4KPiA+IE5vdywgdGhpcyBsaW1pdGVkIGlt
cGxlbWVudGF0aW9uLCB3aGlsZSBpbmNvbXBsZXRlIGFuZCBlYXN5IHRvIGRlZmVhdCwgbWF5Cj4g
PiBzdGlsbCBiZSB1c2VmdWwuIEFmdGVyIGFsbCwgaW9wcmlvIGl0c2VsZiwgSSB0aGluaywgaXMg
Zmxhd2VkIGluIHRoZSBzYW1lCj4gPiB3YXkuIElmIGYyZnMgd2FudHMgdG8gaW1wbGVtZW50IHRo
aXMgaW50ZXJuYWxseSwgdGhhdCdzIG9rYXksIEkgc3VwcG9zZSwgYnV0Cj4gPiBhcyBhIGdlbmVy
aWMgbWVjaGFuaXNtLCBJIGRvbid0IHRoaW5rIHRoaXMgbWFrZXMgYSBsb3Qgb2Ygc2Vuc2UuCj4K
PiBBbmQgSSB3b25kZXIgaWYgdGhlIHJlYXNvbiBmb3Igc3VibWl0dGluZyBmcm9tIGEgd29ya3F1
ZXVlIGlzbid0IGFsc28KPiBwcmlvcml0eSBpbnZlcnNpb24/Cj4KPiBJIGhhdmVuJ3QgbG9va2Vk
IGF0IHRoZSBmMmZzIGNvZGUsIGJ1dCB0aGF0IGNvbWVzIHVwIGluIGJjYWNoZWZzOyB3ZQo+IGhh
dmUgSU9zIHRoYXQgd2Ugc3VibWl0IGZyb20gd29ycXVldWUgY29udGV4dCBiZWNhdXNlIHRoZXkn
cmUgc3VibWl0dGVkCj4gaW4gY29udGV4dHMgd2hlcmUgd2UgX3JlYWxseV8gY2Fubm90IGJsb2Nr
IC0gdGhleSdyZSBtZXRhZGF0YSBJT3MsIGFuZAo+IHRodXMgYWxzbyBoaWdoIHByaW9yaXR5IElP
cy4gQnV0IGlmIHRoZSBxdWV1ZSBpcyBhbHJlYWR5IGZ1bGwgd2l0aCBsb3dlcgo+IHByaW9yaXR5
IElPcy4uLgo+Cj4gcGVyaGFwcyB3aGF0IHdlIG5lZWQgaXMgYSBiaW8gZmxhZyB0byBzYXkgImRv
IG5vdCBibG9jayBpbiB0aGUKPiBzdWJtaXNzaW9uIHBhdGgsIHF1ZXVlIGlzIGFsbG93ZWQgdG8g
ZXhjZWVkIG5vcm1hbCBsaW1pdHMgZm9yIHRoaXMgKGhpZ2gKPiBwcmlvcml0eSkgSU8iCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
