Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA826AAD4CE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 07:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYQY7DEjJCk3OKAxM0tGogCnLq6OD3TEldA0kMv8OBA=; b=XT4dhzuVQs5BWoSIs68XuXllJ3
	yWSq3hgtxEXeHQMc/BYbm9IOZ8gJoUA+JGQqIfuixBNaOsly/Guc2sGfhVURxW+dyANGlS1d5m1/i
	R/JlfVw57RO4Q86+3GigxP1Va7VLEG7Vz/GZkUbx++gqZ8mKE88b+9d9c+HbKrPFYOS8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCX1t-0004M5-4n;
	Wed, 07 May 2025 05:09:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1uCX1o-0004Lw-Ao
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 05:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fmIuv+NVMknYCAE6TCTFvWQhIXOSC9EkxcL92TtRf2k=; b=c9EzHlnFSp2GLpmD29comidTnR
 1EcSf7IukO/ergJH6dlAT8Trhg/Zgb+CKgOv27qnQgltbItLfyqFjDKiFH1iSSVWskpLdbUggrZ90
 rcjl7X6TNtZXKGWEi4JCJWvkjItiCTtWZ+QvNIRr0ohOIKnH9/FIBPY/go3eU/mDmX+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fmIuv+NVMknYCAE6TCTFvWQhIXOSC9EkxcL92TtRf2k=; b=UM69U1XKfoD42nQJJFFYruzFeO
 q1jgneesjgCCJlHcCwR+DCVsjsE6EsbECt2MXUha9SCueBltdJU6i58CAxg9RYcb2XyyQhZu5DD25
 n/xx+YmQqf2+gh7uDKi5xPESWbgk9htFmK2NayG61UIdCXd+TFykW611Ncphwbg9jQUk=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCX1Y-0004u2-0X for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 05:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746594520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fmIuv+NVMknYCAE6TCTFvWQhIXOSC9EkxcL92TtRf2k=;
 b=IXvF/CMlGgt+u3HYE//MWmFqSrG8KBnlSp9bLHAiDIWi9ZdsQyimdxLhE93Ae1bdQ3+L0G
 MVy2uItOPVVjFoWeJ9CbQpXPit7269GqxG8aEKB9Xse0CJVDD5rFHF+yJlStKvRa3CwVfq
 hJzBuNeYrN9jvZLddsMlugFqeO9GL5Q=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-0f7TX0kWNPe8WKzj8LKt2w-1; Wed, 07 May 2025 01:08:39 -0400
X-MC-Unique: 0f7TX0kWNPe8WKzj8LKt2w-1
X-Mimecast-MFC-AGG-ID: 0f7TX0kWNPe8WKzj8LKt2w_1746594518
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-22c31b55ac6so89676085ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 May 2025 22:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746594518; x=1747199318;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fmIuv+NVMknYCAE6TCTFvWQhIXOSC9EkxcL92TtRf2k=;
 b=OJSiB9st43EDTYmj2DdN5kZrGABv+Jcd8njFwXO4mkJ9IZIJ8KF24q0NLP5fjEw3fa
 RI5I5eyNBcPBT+wwot9DsYEBg0vR1FtfUxSH3nBJJRVdR60FufBX9W9xkmWHB9bwTMJE
 D8Uzy5UE1OwmAqIgYQolvf+Io4oQ4oh7IPPu9U/cF5s5CXY1ptJzLes5uq84CuW61iy7
 jeCLmob8ZQHH8+56pZqN5XERBDpz4DRVHYupGS6YAn9OiulM9ne/7zGw3EzPZ3J/yCpY
 f6UAIPCYdjj1hBEr8lV3w9H1hyonW9pSM6rE2nWswPPcncfHsHtibhP362cfJ/Yat2Ek
 rRJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMcf1pWlksEXf5cgsvlgWZhQv7Pq91serReGCRQOtqzxfGFAilxjFXvNZbtMCeReHxcLVgdc2pD1ndei2NOkCb@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzbVOfIfUh099EPcc7GCjjFA3ajh8We2IqfYDF8g0NxS6l7Sm7y
 6yivrjbThy2ETAA233jOehV/uGYn4HTKsoLZgICUhguKfyITPRwUTK6wulIGNParulr0TyCZUPQ
 bYIQ2125PODK4jDSgnP8PHI8UIgKxShHcYC0FTAChiqSqhgIKaFjxnSxXvAtv1pLDb/qAhuuncT
 A=
X-Gm-Gg: ASbGncsRZykWFDS7EvgCiGtYCL8jVLVCjnF1Kq4nOfuVxWw5cZ575tw/FFqlLblA/C0
 V5Qla5+gDmCVYWvEUQpu/Za/UvKrkBY6W16i/R577xIEMzAZ6FtZh2qlQEw8f2xpR1eZeshcBQi
 Qf6lKfi68HHWks4RDRUl3+3CIhiT+uhrJE0MilX+6iChkg0j7DcQVc1oFdSeWmyFOhI8eG6Wrnu
 pF3Ecajsj9KQMtrW7gl5noyPeYg+a59wu899UQx++cz10513XHrE55W50UbaIHodSiAVHdNqhx/
 cMf+638dV5KINbxUKucfDIObtD5BMWqwq9wEt40dJOZbdgEQxqtn
X-Received: by 2002:a17:902:d4ce:b0:21f:35fd:1b6c with SMTP id
 d9443c01a7336-22e5ede6912mr26160975ad.45.1746594518255; 
 Tue, 06 May 2025 22:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsouU9Velf8EBfVx/RQ+IkBNoIeu46dxROrVEsTyz4Z53WH9ttelpZhq0ou7ZszouACsVrRw==
X-Received: by 2002:a17:902:d4ce:b0:21f:35fd:1b6c with SMTP id
 d9443c01a7336-22e5ede6912mr26160765ad.45.1746594517881; 
 Tue, 06 May 2025 22:08:37 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e70b96c1bsm19985ad.83.2025.05.06.22.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 22:08:37 -0700 (PDT)
Date: Wed, 7 May 2025 13:08:33 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250507050833.f72gsjv4xc4fdhuf@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250415093822.1100476-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250415093822.1100476-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EIm0SDfbaEkONe_lDcY9CLlsEa4Ppte_8H1t5C5zTS8_1746594518
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 15, 2025 at 05:38:22PM +0800, Chao Yu wrote: >
 As Han Qi reported in bugzilla [1], commit 5c26d2f1d3f5 ("unicode: Don't
 > special case ignorable code points") changes logic to handle ignor [...]
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCX1Y-0004u2-0X
Subject: Re: [f2fs-dev] [PATCH v2] f2fs/012: test red heart lookup
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
From: Zorro Lang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zorro Lang <zlang@redhat.com>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgMDU6Mzg6MjJQTSArMDgwMCwgQ2hhbyBZdSB3cm90ZToK
PiBBcyBIYW4gUWkgcmVwb3J0ZWQgaW4gYnVnemlsbGEgWzFdLCBjb21taXQgNWMyNmQyZjFkM2Y1
ICgidW5pY29kZTogRG9uJ3QKPiBzcGVjaWFsIGNhc2UgaWdub3JhYmxlIGNvZGUgcG9pbnRzIikg
Y2hhbmdlcyBsb2dpYyB0byBoYW5kbGUgaWdub3JhYmxlCj4gY29kZSBwb2ludHMsIHdoZW4gd2Ug
aGFuZGxlIGZpbGVuYW1lIHdoaWNoIGhhcyBzcGVjaWFsIHVuaWNvZGUgY2hhcmFjdG9yCj4gbGlr
ZSByZWQgaGVhcnQg4p2k77iPLCB1dGY4X2Nhc2Vmb2xkKCkgbWF5IHJldHVybiBkaWZmZXJlbnQg
bGVuZ3RoIHRoYW4gaW4gdGhlCj4gcGFzdCwgcmVzdWx0IGluIHRoYXQgZjJmcyBjYWNsdWF0ZXMg
aGFzaCBjb2RlIGluY29ycmVjbHR5LCBldmVudHVhbGx5LAo+IGZpbGVuYW1lIHcvIHNwZWNpYWwg
dW5pY29kZSBjaGFyYWN0b3Igd2lsbCBub3QgYmUgZm91bmQgdy8gdGhlIHdyb25nIGhhc2gKPiBj
b2RlLgo+IAo+IGYyZnMgaGFzIGludHJvZHVjZXMgYSBsaW5lYXIgbG9va3VwIGZhbGxiYWNrIHcv
IGNvbW1pdCA5MWI1ODdiYTc5ZTEKPiAoImYyZnM6IEludHJvZHVjZSBsaW5lYXIgc2VhcmNoIGZv
ciBkZW50cmllcyIpLCBvbmNlIGhhc2gtYmFzZWQgbG9va3VwCj4gZmFpbHMsIGl0IHRyaWVzIGxp
bmVhciBsb29rdXAgYXMgYSBmYWxsYmFjay4KPiAKPiBUaGlzIHBhdGNoIGNhbiBoZWxwIHRvIGNo
ZWNrIHdoZXRoZXIgbGluZWFyIGxvb2t1cCBmYWxsYmFjayB3b3JrcyB3ZWxsCj4gb3Igbm90Lgo+
IAo+IEZpcnN0bHksIHdlIHVzZSBiZWxvdyB0ZXN0Y2FzZSB0byBjaGVjayBob3cgaGFzaCBjb2Rl
IGNoYW5nZXM6Cj4gCj4gbWtmcy5mMmZzIC1mIC1PIGNhc2Vmb2xkIC1DIHV0ZjggL2Rldi92ZGEK
PiBtb3VudCAvZGV2L3ZkYSAvbW50L2YyZnMKPiBta2RpciAvbW50L2YyZnMvZGlyLwo+IGYyZnNf
aW8gc2V0ZmxhZ3MgY2FzZWZvbGQgL21udC9mMmZzL2Rpcgo+IHRvdWNoIC9tbnQvZjJmcy9kaXIv
JCdcdTI3NjRcdWZlMGYnCj4gdW1vdW50IC9tbnQvZjJmcwo+IGR1bXAuZjJmcyAtaSA0IC1kIDMg
L2Rldi92ZGEKPiBkdW1wLmYyZnMgLWIgJGJsa2FkZHJfb2ZfZGlyIC1kIDMgL2Rldi92ZGEKPiAK
PiB3L28gKCJ1bmljb2RlOiBEb24ndCBzcGVjaWFsIGNhc2UgaWdub3JhYmxlIGNvZGUgcG9pbnRz
IikKPiBbZHVtcF9kaXJlbnQ6IDk5MV0gYml0bWFwIHBvc1sweDJdIG5hbWVb4p2k77iPXSBsZW5b
MHg2XSBoYXNoWzB4MTlkZDcxMzJdIGlub1sweDVdIHR5cGVbMHgxXQo+IFtkdW1wX2RpcmVudDog
OTk4XSBuYW1lKGhleClbMHhlMiAweDlkIDB4YTQgMHhlZiAweGI4IDB4OGYgMHgwXQo+IAo+IHcv
ICgidW5pY29kZTogRG9uJ3Qgc3BlY2lhbCBjYXNlIGlnbm9yYWJsZSBjb2RlIHBvaW50cyIpCj4g
W2R1bXBfZGlyZW50OiA5OTFdIGJpdG1hcCBwb3NbMHgyXSBuYW1lW+KdpO+4j10gbGVuWzB4Nl0g
aGFzaFsweDlhMmVhMDY4XSBpbm9bMHg1XSB0eXBlWzB4MV0KPiBbZHVtcF9kaXJlbnQ6IDk5OF0g
bmFtZShoZXgpWzB4ZTIgMHg5ZCAweGE0IDB4ZWYgMHhiOCAweDhmIDB4MF0KPiAKPiBDb3JyZWN0
IGhhc2ggY29kZToJMHgxOWRkNzEzMgo+IFdyb25nIGhhc2ggY29kZToJMHg5YTJlYTA2OAo+IAo+
IFNvLCB3ZSBjYW4gdGVzdCBhcyBiZWxvdzoKPiAKPiAxLiBjcmVhdGUgZmlsZSB3LyByZWQgaGVh
cnQgYXMgaXRzIGZpbGVuYW1lCj4gMi4gaW5qZWN0IHdyb25nIGhhc2ggY29kZSB0byB0aGUgZmls
ZQo+IDMuIGRpc2FibGUgbGluZWFyIGxvb2t1cCwgZXhwZWN0IGxvb2t1cCBmYWlsdXJlCj4gNC4g
ZW5hYmxlIGxpbmVhciBsb29rdXAsIGV4cGVjdCBsb29rdXAgc3VjY2VlZAo+IAo+IFsxXSBodHRw
czovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxOTU4Ngo+IAo+IENjOiBK
YWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+IENjOiBEYW5pZWwgTGVlIDxjaHVsbGVl
QGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+
IC0tLQoKU29ycnkgZm9yIHRoaXMgbGF0ZSByZXZpZXcsIHRoaXMgdmVyc3Npb24gbG9va3MgZ29v
ZCB0byBtZSwganVzdCBvbmUgcmV2aWV3IHBvaW50CmFzIGJlbG93IC4uCgo+IHYyOgo+IC0gdHVu
ZSBsaW5lYXJfbG9va3VwIGZlYXR1cmUgYmVmb3JlIGZhdWx0IGluamVjdGlvbgo+IC0gY2hlY2sg
c3RhdHVzIGFmdGVyIHR1bmluZyBsaW5lYXJfbG9va3VwIGZlYXR1cmUKPiAtIGNsZWFuIHVwIGNv
ZGVzCj4gIHRlc3RzL2YyZnMvMDEyICAgICB8IDczICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiAgdGVzdHMvZjJmcy8wMTIub3V0IHwgIDIgKysKPiAgMiBm
aWxlcyBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDc1NSB0ZXN0
cy9mMmZzLzAxMgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvZjJmcy8wMTIub3V0Cj4gCj4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2YyZnMvMDEyIGIvdGVzdHMvZjJmcy8wMTIKPiBuZXcgZmlsZSBt
b2RlIDEwMDc1NQo+IGluZGV4IDAwMDAwMDAwLi4zOGE2M2YyZQo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi90ZXN0cy9mMmZzLzAxMgo+IEBAIC0wLDAgKzEsNzMgQEAKPiArIyEgL2Jpbi9iYXNoCj4g
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArIyBDb3B5cmlnaHQgKGMpIDIw
MjUgQ2hhbyBZdS4gIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCj4gKyMKPiArIyBGUyBRQSBUZXN0IE5v
LiBmMmZzLzAxMgo+ICsjCj4gKyMgVGhpcyB0ZXN0Y2FzZSBjaGVja3Mgd2hldGhlciBsaW5lYXIg
bG9va3VwIGZhbGxiYWNrIHdvcmtzIHdlbGwKPiArIyBvciBub3QgYXMgYmVsb3c6Cj4gKyMgMS5j
cmVhdGUgZmlsZSB3LyByZWQgaGVhcnQgYXMgaXRzIGZpbGVuYW1lCj4gKyMgMi5pbmplY3Qgd3Jv
bmcgaGFzaCBjb2RlIHRvIHRoZSBmaWxlCj4gKyMgMy5kaXNhYmxlIGxpbmVhciBsb29rdXAsIGV4
cGVjdCBsb29rdXAgZmFpbHVyZQo+ICsjIDQuZW5hYmxlIGxpbmVhciBsb29rdXAsIGV4cGVjdCBs
b29rdXAgc3VjY2VlZAo+ICsjCj4gKy4gLi9jb21tb24vcHJlYW1ibGUKPiArX2JlZ2luX2ZzdGVz
dCBhdXRvIHF1aWNrIGNhc2Vmb2xkCj4gKwo+ICtfZml4ZWRfYnlfa2VybmVsX2NvbW1pdCA5MWI1
ODdiYTc5ZTEgXAo+ICsJImYyZnM6IEludHJvZHVjZSBsaW5lYXIgc2VhcmNoIGZvciBkZW50cmll
cyIKPiArCj4gK2V4cG9ydCBMQ19BTEw9Qy5VVEYtOAo+ICtfcmVxdWlyZV9zY3JhdGNoCj4gK19y
ZXF1aXJlX2NvbW1hbmQgIiRGMkZTX0lPX1BST0ciIGYyZnNfaW8KPiArX3JlcXVpcmVfY29tbWFu
ZCAiJEYyRlNfSU5KRUNUX1BST0ciIGluamVjdC5mMmZzCj4gKwo+ICtjaGVja19sb29rdXAoKQo+
ICt7Cj4gKwlsb2NhbCBub2xpbmVhcl9sb29rdXA9JDEKPiArCWxvY2FsIGRpcj0kU0NSQVRDSF9N
TlQvZGlyCj4gKwkjIHJlZCBoZWFydCBjaGFyYWN0b3IgaW4gdW5pY29kZSBmb3JtYXQKPiArCWxv
Y2FsIHJlZGhlYXJ0PSRkaXIvJCdcdTI3NjRcdWZlMGYnCj4gKwo+ICsJX3NjcmF0Y2hfbWtmcyAt
TyBjYXNlZm9sZCAtQyB1dGY4ID4+ICRzZXFyZXMuZnVsbAo+ICsJX3NjcmF0Y2hfbW91bnQKPiAr
Cj4gKwlta2RpciAkZGlyCj4gKwkkRjJGU19JT19QUk9HIHNldGZsYWdzIGNhc2Vmb2xkICRkaXIg
Pj4gJHNlcXJlcy5mdWxsCj4gKwl0b3VjaCAkcmVkaGVhcnQKPiArCWlubz1gc3RhdCAtYyAnJWkn
ICRyZWRoZWFydGAKPiArCV9zY3JhdGNoX3VubW91bnQKPiArCj4gKwkjIHNob3VsZCB0dW5lIG5v
bGluZWFyX2xvb2t1cCBmZWF0dXJlIGJlZm9yZSBmYXVsdCBpbmplY3Rpb24KPiArCSRGMkZTX0ZT
Q0tfUFJPRyAtLW5vbGluZWFyLWxvb2t1cD0kbm9saW5lYXJfbG9va3VwICRTQ1JBVENIX0RFViA+
PiAkc2VxcmVzLmZ1bGwKPiArCj4gKwkjIGNoZWNrIHdoZXRoZXIgbGluZWFyX2xvb2t1cCBpcyBj
aGFuZ2VkIGFzIGV4cGVjdGVkCj4gKwlpZiBbICRub2xpbmVhcl9sb29rdXAgPT0gIjEiIF07IHRo
ZW4KPiArCQkkRjJGU19GU0NLX1BST0cgJFNDUkFUQ0hfREVWIHwgZ3JlcCAtcSAibGluZWFyX2xv
b2t1cCBcW2Rpc2FibGVcXSIgfHwJXAo+ICsJCQkJCV9mYWlsICJsaW5lYXJfbG9va3VwIGlzIG5v
dCBkaXNhYmxlZCIKPiArCWVsc2UKPiArCQkkRjJGU19GU0NLX1BST0cgJFNDUkFUQ0hfREVWIHwg
Z3JlcCAtcSAibGluZWFyX2xvb2t1cCBcW2VuYWJsZVxdIiB8fAlcCj4gKwkJCQkJX2ZhaWwgImxp
bmVhcl9sb29rdXAgaXMgbm90IGVuYWJsZWQiCj4gKwlmaQo+ICsKPiArCSRGMkZTX0lOSkVDVF9Q
Uk9HIC0tZGVudCAtLW1iIGRfaGFzaCAtLW5pZCAkaW5vIC0tdmFsIDB4OWEyZWEwNjggJFNDUkFU
Q0hfREVWID4+ICRzZXFyZXMuZnVsbAo+ICsKPiArCV9zY3JhdGNoX21vdW50Cj4gKwlpZiBbICRu
b2xpbmVhcl9sb29rdXAgPT0gIjEiIF07IHRoZW4KPiArCQlbIC1mICRyZWRoZWFydCBdICYmIF9m
YWlsICJyZWQgaGVhcnQgZmlsZSBzaG91bGQgbm90IGV4aXN0Igo+ICsJZWxzZQo+ICsJCVsgLWYg
JHJlZGhlYXJ0IF0gfHwgX2ZhaWwgInJlZCBoZWFydCBmaWxlIHNob3VsZCBleGlzdCIKPiArCWZp
Cj4gKwlfc2NyYXRjaF91bm1vdW50Cj4gKwo+ICsJIyB0byBhdm9pZCBfY2hlY2tfZmlsZXN5c3Rl
bXMgZmFpbHVyZSBpbiB0aGUgZW5kIG9mIHRlc3QKPiArCV9yZXBhaXJfc2NyYXRjaF9mcyA+PiAk
c2VxcmVzLmZ1bGwKCklmIHlvdSB3YW50IHRvIG1ha2Ugc3VyZSAiZnNjay5mMmZzIGNhbiByZXBh
aXIgYWJvdmUgY29ycnVwdGlvbiIsIHRoZW4gdGhpcyBjb21tZW50IGlzbid0IHJpZ2h0LgpJZiB5
b3UganVzdCB3YW50IHRvIGF2b2lkIF9jaGVja19maWxlc3lzdGVtcyBmYWlsdXJlLCB5b3UgY2Fu
IHJlcGxhY2UgX3JlcXVpcmVfc2NyYXRjaCB3aXRoCl9yZXF1aXJlX3NjcmF0Y2hfbm9jaGVjaywg
dGhlbiByZW1vdmUgdGhpcyBsaW5lLgoKVGhhbmtzLApab3JybwoKPiArfQo+ICsKPiArY2hlY2tf
bG9va3VwIDEKPiArY2hlY2tfbG9va3VwIDAKPiArCj4gK2VjaG8gIlNpbGVuY2UgaXMgZ29sZGVu
Igo+ICsKPiArc3RhdHVzPTAKPiArZXhpdAo+IGRpZmYgLS1naXQgYS90ZXN0cy9mMmZzLzAxMi5v
dXQgYi90ZXN0cy9mMmZzLzAxMi5vdXQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwLi4zYWZlY2EyZgo+IC0tLSAvZGV2L251bGwKPiArKysgYi90ZXN0cy9mMmZzLzAxMi5v
dXQKPiBAQCAtMCwwICsxLDIgQEAKPiArUUEgb3V0cHV0IGNyZWF0ZWQgYnkgMDEyCj4gK1NpbGVu
Y2UgaXMgZ29sZGVuCj4gLS0gCj4gMi40OS4wCj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
