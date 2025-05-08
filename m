Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0BAB03AA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 21:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ncpEEhsT7votujHWUKAOAFu1VfhuFsTljb1963ni+k=; b=JJbwhKKi0cUhhDy5oUrhmpsMEV
	pzxHPM+PYWT8i3S4bJqx3f4hUI5JYbpXe32b87gkhTclQcWmB0NWL23lsE76F3/wK9wYnvVwobht9
	BtXPx4fqyvZ40c0Wgpl2c+ZuGi8b9ylq/PtqFe89mYPOnD7z8CZVVZtV6CZFV0AGb25U=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uD6st-0000MP-JZ;
	Thu, 08 May 2025 19:26:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1uD6sq-0000MG-Fk
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 19:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nOEZ3Z4gprgV0eoVphm2mn4dPOAQZ82KJIfJEGplbHA=; b=IJZcyLNgyWGTmKYloqcssYmXPU
 eI2Reisl6g68KbPvJKyLFKqeJY//Dq+Is/1hui95KQqc7xBHSbu8O2LOuaYkWPedGZA6Yk8ahw6w3
 ZtypeuSiBANbBc/vyduEOKAHtpK1BnGuE7J9yxGTsRp1p0GApqU/G4vH2xkXkUs2nnrM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nOEZ3Z4gprgV0eoVphm2mn4dPOAQZ82KJIfJEGplbHA=; b=A7F49QFVlBOtR+4y8EeoZGzbU2
 TimfZ43Gemo/gz6bY3qzk1oyT3v5z0J6z6bMGtVqQEjR57hr+IT/DYMzeIMh0G+5gnHIJjQZHSzFp
 vNBE4qVISR4PRncP0GttjwBbyBkb6hNr+bzEEaB81SlhVTzFZfAwTUyjHLQINI7qCsmc=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uD6sp-0004c6-0F for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 19:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746732363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nOEZ3Z4gprgV0eoVphm2mn4dPOAQZ82KJIfJEGplbHA=;
 b=QxSOrafTofE0BJrCmMWH2WeEV/817yHKiIfP6pYSmtkcNLk6p5yjpWkwxs+iOivUUk2EvH
 i5zCzSBYvCqIEQBWMzPP+O+G94wnW0p6fJOjXYJ+bY5wFfRUlcxiP7aJBAwsv/ws1lkkT+
 0aqsA48KP8lbxkXEdnbhYmMwfjk9KEA=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553--Nbv9VigPQWXZDmy-7zTvQ-1; Thu, 08 May 2025 15:26:01 -0400
X-MC-Unique: -Nbv9VigPQWXZDmy-7zTvQ-1
X-Mimecast-MFC-AGG-ID: -Nbv9VigPQWXZDmy-7zTvQ_1746732360
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-736fff82264so1121748b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 May 2025 12:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746732360; x=1747337160;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nOEZ3Z4gprgV0eoVphm2mn4dPOAQZ82KJIfJEGplbHA=;
 b=aLY0oTWaWhGXal2ywr4pguos9r0pr1Itri77wDv8q/vmVKcKx/1tpP8fQdUUFjMAuU
 QPwxkkOnK2LzuPnpnB9vSGNDiL4I49bpzhbzAzaGHDcLuQc/h2Xm+8bdk+w1kS69ooBE
 GAH7jhf2H4vX8urqgDzi8NR2F3uv/iQbueLAdx1nkvYuTKZfvtZEBwD0dL/B7f80KynQ
 sCPS/kKTzqOvvkwSOut3LmrJ1/x2Q8blOmGkxSR23cOlFIFTrse+bZjHTOxPiqX/Mt1c
 RB3wKHf1nvKM9KuNsTiCQ+D2aL12cD4zCh9cwaf5HwMw2V1pnjmhdkl+1hVt5zfGxLyG
 +qEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh0AKzZJwDdwkEpU6vg4ArTEaWj/1n77ish6TLBA94cHEIM2kO9sn2ASeCFU3chmQoG9Pod11gXDeRE8UFqjB2@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxw9P0exCsRTcroppECJfPDUi5AwyZJGVe9SulZ+BYTTcLtZpyP
 /bdJJXbVdp+jNsLbMA6c2C0bn/PIwcxPrIiXF+1QGbyIx3YSyYxkl4nSLGGslAmrjErZBqDa8jH
 YhidhFescl5zNyQZaozyC8v6Y9wB/zRwvaJbT0dCJ7havejTTOcHGf7LtYowcNpBq+yLgtNaIgR
 M=
X-Gm-Gg: ASbGnctGFsm8QjBTHrdZL6lGm/iAGSgi5KLKKgPzb/ixMFg0XkGO34xvIVzwg7Yvosb
 NJUslgYSjSbiODwQDUT1X+ar5MlXnLf2d5ZQifFk2D9W42jyoDFrCgCJLkAuMvD4YPYQ+fXYaZR
 TcG6r91uYUNB5tnygI0HO0K9jukgxwyCiqUmYhyBIBEl7i1XadxoerBQ9reLS7a7Y+HYAxO2ssY
 GwtlLkZxTg48TzKvV2SxYZFZbG//Xix+0ifCeQI6SHtJXBJt+3bRtryir2pDZ2glA9XkHJHPeO1
 XmQxacvT3R47OBrU9j6miYFtj9/K4ckP6FgAPp3qpQ9oh6u78fYj
X-Received: by 2002:a05:6a00:2f52:b0:73e:356:98b0 with SMTP id
 d2e1a72fcca58-740a94e63e7mr6126724b3a.8.1746732360418; 
 Thu, 08 May 2025 12:26:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKFDM/p//EPxZrqhAehjFHlzGYiSfOQUOhYxPVzQh79kxCgOQXC3mtOrwwcQjENORwLmcM+g==
X-Received: by 2002:a05:6a00:2f52:b0:73e:356:98b0 with SMTP id
 d2e1a72fcca58-740a94e63e7mr6126691b3a.8.1746732360024; 
 Thu, 08 May 2025 12:26:00 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237734c4asm407201b3a.57.2025.05.08.12.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 12:25:59 -0700 (PDT)
Date: Fri, 9 May 2025 03:25:55 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250508192555.7sw42hmrye2jqznb@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250507053642.842805-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250507053642.842805-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4Izms93xxTa6C2_nNvtmYi3Mprklv6ftu0SRKrWa6_Q_1746732360
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 07, 2025 at 01:36:42PM +0800, Chao Yu wrote: >
 As Han Qi reported in bugzilla [1], commit 5c26d2f1d3f5 ("unicode: Don't
 > special case ignorable code points") changes logic to handle ignor [...]
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uD6sp-0004c6-0F
Subject: Re: [f2fs-dev] [PATCH v3] f2fs/012: test red heart lookup
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

T24gV2VkLCBNYXkgMDcsIDIwMjUgYXQgMDE6MzY6NDJQTSArMDgwMCwgQ2hhbyBZdSB3cm90ZToK
PiBBcyBIYW4gUWkgcmVwb3J0ZWQgaW4gYnVnemlsbGEgWzFdLCBjb21taXQgNWMyNmQyZjFkM2Y1
ICgidW5pY29kZTogRG9uJ3QKPiBzcGVjaWFsIGNhc2UgaWdub3JhYmxlIGNvZGUgcG9pbnRzIikg
Y2hhbmdlcyBsb2dpYyB0byBoYW5kbGUgaWdub3JhYmxlCj4gY29kZSBwb2ludHMsIHdoZW4gd2Ug
aGFuZGxlIGZpbGVuYW1lIHdoaWNoIGhhcyBzcGVjaWFsIHVuaWNvZGUgY2hhcmFjdG9yCj4gbGlr
ZSByZWQgaGVhcnQg4p2k77iPLCB1dGY4X2Nhc2Vmb2xkKCkgbWF5IHJldHVybiBkaWZmZXJlbnQg
bGVuZ3RoIHRoYW4gaW4gdGhlCj4gcGFzdCwgcmVzdWx0IGluIHRoYXQgZjJmcyBjYWNsdWF0ZXMg
aGFzaCBjb2RlIGluY29ycmVjbHR5LCBldmVudHVhbGx5LAo+IGZpbGVuYW1lIHcvIHNwZWNpYWwg
dW5pY29kZSBjaGFyYWN0b3Igd2lsbCBub3QgYmUgZm91bmQgdy8gdGhlIHdyb25nIGhhc2gKPiBj
b2RlLgo+IAo+IGYyZnMgaGFzIGludHJvZHVjZWQgYSBsaW5lYXIgbG9va3VwIGZhbGxiYWNrIHcv
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
IC0tLQo+IHYzOgo+IC0gdXNlIF9yZXF1aXJlX3NjcmF0Y2hfbm9jaGVjayBpbnN0ZWFkIG9mIF9y
ZXF1aXJlX3NjcmF0Y2ggdG8gYXZvaWQKPiBfY2hlY2tfZmlsZXN5c3RlbXMgZmFpbHVyZSBvbiBj
b3JydXB0ZWQgaW1hZ2UKPiAtIGZpeCB0eXBvOiBzL2ludHJvZHVjZXMvaW50cm9kdWNlZAoKVGhp
cyB2ZXJzaW9uIGlzIGdvb2QgdG8gbWUsIHRoYW5rcyEKClJldmlld2VkLWJ5OiBab3JybyBMYW5n
IDx6bGFuZ0ByZWRoYXQuY29tPgoKPiAgdGVzdHMvZjJmcy8wMTIgICAgIHwgNzAgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICB0ZXN0cy9mMmZzLzAxMi5v
dXQgfCAgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKykKPiAgY3JlYXRl
IG1vZGUgMTAwNzU1IHRlc3RzL2YyZnMvMDEyCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9m
MmZzLzAxMi5vdXQKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvZjJmcy8wMTIgYi90ZXN0cy9mMmZz
LzAxMgo+IG5ldyBmaWxlIG1vZGUgMTAwNzU1Cj4gaW5kZXggMDAwMDAwMDAuLmIzZGY5YThmCj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Rlc3RzL2YyZnMvMDEyCj4gQEAgLTAsMCArMSw3MCBAQAo+
ICsjISAvYmluL2Jhc2gKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsj
IENvcHlyaWdodCAoYykgMjAyNSBDaGFvIFl1LiAgQWxsIFJpZ2h0cyBSZXNlcnZlZC4KPiArIwo+
ICsjIEZTIFFBIFRlc3QgTm8uIGYyZnMvMDEyCj4gKyMKPiArIyBUaGlzIHRlc3RjYXNlIGNoZWNr
cyB3aGV0aGVyIGxpbmVhciBsb29rdXAgZmFsbGJhY2sgd29ya3Mgd2VsbAo+ICsjIG9yIG5vdCBh
cyBiZWxvdzoKPiArIyAxLmNyZWF0ZSBmaWxlIHcvIHJlZCBoZWFydCBhcyBpdHMgZmlsZW5hbWUK
PiArIyAyLmluamVjdCB3cm9uZyBoYXNoIGNvZGUgdG8gdGhlIGZpbGUKPiArIyAzLmRpc2FibGUg
bGluZWFyIGxvb2t1cCwgZXhwZWN0IGxvb2t1cCBmYWlsdXJlCj4gKyMgNC5lbmFibGUgbGluZWFy
IGxvb2t1cCwgZXhwZWN0IGxvb2t1cCBzdWNjZWVkCj4gKyMKPiArLiAuL2NvbW1vbi9wcmVhbWJs
ZQo+ICtfYmVnaW5fZnN0ZXN0IGF1dG8gcXVpY2sgY2FzZWZvbGQKPiArCj4gK19maXhlZF9ieV9r
ZXJuZWxfY29tbWl0IDkxYjU4N2JhNzllMSBcCj4gKwkiZjJmczogSW50cm9kdWNlIGxpbmVhciBz
ZWFyY2ggZm9yIGRlbnRyaWVzIgo+ICsKPiArZXhwb3J0IExDX0FMTD1DLlVURi04Cj4gK19yZXF1
aXJlX3NjcmF0Y2hfbm9jaGVjawo+ICtfcmVxdWlyZV9jb21tYW5kICIkRjJGU19JT19QUk9HIiBm
MmZzX2lvCj4gK19yZXF1aXJlX2NvbW1hbmQgIiRGMkZTX0lOSkVDVF9QUk9HIiBpbmplY3QuZjJm
cwo+ICsKPiArY2hlY2tfbG9va3VwKCkKPiArewo+ICsJbG9jYWwgbm9saW5lYXJfbG9va3VwPSQx
Cj4gKwlsb2NhbCBkaXI9JFNDUkFUQ0hfTU5UL2Rpcgo+ICsJIyByZWQgaGVhcnQgY2hhcmFjdG9y
IGluIHVuaWNvZGUgZm9ybWF0Cj4gKwlsb2NhbCByZWRoZWFydD0kZGlyLyQnXHUyNzY0XHVmZTBm
Jwo+ICsKPiArCV9zY3JhdGNoX21rZnMgLU8gY2FzZWZvbGQgLUMgdXRmOCA+PiAkc2VxcmVzLmZ1
bGwKPiArCV9zY3JhdGNoX21vdW50Cj4gKwo+ICsJbWtkaXIgJGRpcgo+ICsJJEYyRlNfSU9fUFJP
RyBzZXRmbGFncyBjYXNlZm9sZCAkZGlyID4+ICRzZXFyZXMuZnVsbAo+ICsJdG91Y2ggJHJlZGhl
YXJ0Cj4gKwlpbm89YHN0YXQgLWMgJyVpJyAkcmVkaGVhcnRgCj4gKwlfc2NyYXRjaF91bm1vdW50
Cj4gKwo+ICsJIyBzaG91bGQgdHVuZSBub2xpbmVhcl9sb29rdXAgZmVhdHVyZSBiZWZvcmUgZmF1
bHQgaW5qZWN0aW9uCj4gKwkkRjJGU19GU0NLX1BST0cgLS1ub2xpbmVhci1sb29rdXA9JG5vbGlu
ZWFyX2xvb2t1cCAkU0NSQVRDSF9ERVYgPj4gJHNlcXJlcy5mdWxsCj4gKwo+ICsJIyBjaGVjayB3
aGV0aGVyIGxpbmVhcl9sb29rdXAgaXMgY2hhbmdlZCBhcyBleHBlY3RlZAo+ICsJaWYgWyAkbm9s
aW5lYXJfbG9va3VwID09ICIxIiBdOyB0aGVuCj4gKwkJJEYyRlNfRlNDS19QUk9HICRTQ1JBVENI
X0RFViB8IGdyZXAgLXEgImxpbmVhcl9sb29rdXAgXFtkaXNhYmxlXF0iIHx8CVwKPiArCQkJCQlf
ZmFpbCAibGluZWFyX2xvb2t1cCBpcyBub3QgZGlzYWJsZWQiCj4gKwllbHNlCj4gKwkJJEYyRlNf
RlNDS19QUk9HICRTQ1JBVENIX0RFViB8IGdyZXAgLXEgImxpbmVhcl9sb29rdXAgXFtlbmFibGVc
XSIgfHwJXAo+ICsJCQkJCV9mYWlsICJsaW5lYXJfbG9va3VwIGlzIG5vdCBlbmFibGVkIgo+ICsJ
ZmkKPiArCj4gKwkkRjJGU19JTkpFQ1RfUFJPRyAtLWRlbnQgLS1tYiBkX2hhc2ggLS1uaWQgJGlu
byAtLXZhbCAweDlhMmVhMDY4ICRTQ1JBVENIX0RFViA+PiAkc2VxcmVzLmZ1bGwKPiArCj4gKwlf
c2NyYXRjaF9tb3VudAo+ICsJaWYgWyAkbm9saW5lYXJfbG9va3VwID09ICIxIiBdOyB0aGVuCj4g
KwkJWyAtZiAkcmVkaGVhcnQgXSAmJiBfZmFpbCAicmVkIGhlYXJ0IGZpbGUgc2hvdWxkIG5vdCBl
eGlzdCIKPiArCWVsc2UKPiArCQlbIC1mICRyZWRoZWFydCBdIHx8IF9mYWlsICJyZWQgaGVhcnQg
ZmlsZSBzaG91bGQgZXhpc3QiCj4gKwlmaQo+ICsJX3NjcmF0Y2hfdW5tb3VudAo+ICt9Cj4gKwo+
ICtjaGVja19sb29rdXAgMQo+ICtjaGVja19sb29rdXAgMAo+ICsKPiArZWNobyAiU2lsZW5jZSBp
cyBnb2xkZW4iCj4gKwo+ICtzdGF0dXM9MAo+ICtleGl0Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2Yy
ZnMvMDEyLm91dCBiL3Rlc3RzL2YyZnMvMDEyLm91dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAuLjNhZmVjYTJmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Rlc3RzL2Yy
ZnMvMDEyLm91dAo+IEBAIC0wLDAgKzEsMiBAQAo+ICtRQSBvdXRwdXQgY3JlYXRlZCBieSAwMTIK
PiArU2lsZW5jZSBpcyBnb2xkZW4KPiAtLSAKPiAyLjQ5LjAKPiAKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
