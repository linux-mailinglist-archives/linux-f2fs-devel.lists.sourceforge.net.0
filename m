Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C398D378CE0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 15:38:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg67A-0001v8-5Y; Mon, 10 May 2021 13:38:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1lg679-0001uy-80; Mon, 10 May 2021 13:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RqI8fW5S9l0TI1T/zwfuC0aLeUz3zxD50+tfkFGtzsI=; b=ZbqabEX8YmUloSPqZbC6ZmYyhX
 nGjb/1ZAYUUl0GenzAl61ViWUfEP/cdPL/les+crU/BGRuHLhY7RRM6n2L4TJzb32/tu9yVZVsV9H
 pZdh13GW6hAuxZm2WyXMgrI1KTLbWV2s/ruFQq1kvS7Ktz7jmLHEknqNBIHoBnMKvRwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RqI8fW5S9l0TI1T/zwfuC0aLeUz3zxD50+tfkFGtzsI=; b=HXm+jYGvCsl1NYllsaShsJ7lsr
 NcLgdd7DU/cEW02xdWHpeZ3g9Ouuba9MsZpKXcb6366owbP28SQ7yxQKpCRlCd1jfGUL2lAbwV0nW
 UYt3s1KmxruaTbVeTpaR4sO82NB4C3NYvT0phFX7vT8F/YAaIwYEOr6WS8wWHVUBzhHw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lg675-0003CF-Fm; Mon, 10 May 2021 13:38:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC3B261421;
 Mon, 10 May 2021 13:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620653898;
 bh=POTo3HRRxAhY1WWlaeFo6BkcTm5UFXPjKCsWF/vTqlE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P/4kt59ATJt3MMq8o3rrK9LzWa5UoPyyn/Qv8Q6NsR+ovsaNgOhGumkJ3s+QeyZlY
 mkp1RSJDBywuRK2pqIzCfULgKANDf0kVzPkShXm7Qraf/KL42h8sHNzwIIIZziepHU
 1cBc0VMGP5ZXCvpOozd/XPhpRcKII2GV+t+2//cIV3cuDJc3nOaIF/eyI7STcvNwxN
 jcxTZBK8NBHOGI9kqRh0ffPb4rvNMVcODBe0KVX9czYjhKVi+9lVKEPkHn0PIjvDDH
 U/oUPFuGfszy5HRsPJnifB10869mpbS6mtWdO6hSvo3gHoQbR2cZYguXdpJ4LGaYVv
 DmXbC6buzATmw==
Date: Mon, 10 May 2021 15:38:07 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <20210510153807.4405695e@coco.lan>
In-Reply-To: <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lg675-0003CF-Fm
Subject: Re: [f2fs-dev] [PATCH 00/53] Get rid of UTF-8 chars that can be
 mapped as ASCII
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RW0gTW9uLCAxMCBNYXkgMjAyMSAxNDoxNjoxNiArMDEwMApFZHdhcmQgQ3JlZSA8ZWNyZWUueGls
aW54QGdtYWlsLmNvbT4gZXNjcmV2ZXU6Cgo+IE9uIDEwLzA1LzIwMjEgMTI6NTUsIE1hdXJvIENh
cnZhbGhvIENoZWhhYiB3cm90ZToKPiA+IFRoZSBtYWluIHBvaW50IG9uIHRoaXMgc2VyaWVzIGlz
IHRvIHJlcGxhY2UganVzdCB0aGUgb2NjdXJyZW5jZXMKPiA+IHdoZXJlIEFTQ0lJIHJlcHJlc2Vu
dHMgdGhlIHN5bWJvbCBlcXVhbGx5IHdlbGwgIAo+IAo+ID4gCS0gVSsyMDE0ICgn4oCUJyk6IEVN
IERBU0ggIAo+IEVtIGRhc2ggaXMgbm90IHRoZSBzYW1lIHRoaW5nIGFzIGh5cGhlbi1taW51cywg
YW5kIHRoZSBsYXR0ZXIgZG9lcyBub3QKPiAgc2VydmUgJ2VxdWFsbHkgd2VsbCcuICBQZW9wbGUg
dXNlIGVtIGRhc2hlcyBiZWNhdXNlIOKAlCBldmVuIGluCj4gIG1vbm9zcGFjZSBmb250cyDigJQg
dGhleSBtYWtlIHRleHQgZWFzaWVyIHRvIHJlYWQgYW5kIGNvbXByZWhlbmQsIHdoZW4KPiAgdXNl
ZCBjb3JyZWN0bHkuCgpUcnVlLCBidXQgaWYgeW91IGxvb2sgYXQgdGhlIGRpZmYsIG9uIHNldmVy
YWwgcGxhY2VzLCBJTUhPIGEgc2luZ2xlCmh5cGhlbiB3b3VsZCBtYWtlIG1vcmUgc2Vuc3VzLiBN
YXliZSB0aG9zZSBwbGFjZXMgY2FtZSBmcm9tIGEgY29udmVydGVkCmRvYy4KCj4gSSBhY2NlcHQg
dGhhdCBzb21lIG9mIHRoZSBvdGhlciBkaXN0aW5jdGlvbnMg4oCUIGxpa2UgZW4gZGFzaGVzIOKA
lCBhcmUKPiAgbmVlZGxlc3NseSBwZWRhbnRpYyAodGhvdWdoIEkgZG9uJ3QgZG91YnQgdGhlcmUg
aXMgc29tZW9uZSBvdXQgdGhlcmUKPiAgd2hvIHdpbGwgZ2xhZGx5IGRlZmVuZCB0aGVtIHdpdGgg
dGhlIHNhbWUgZmVydm91ciB3aXRoIHdoaWNoIEkgYXJndWUKPiAgZm9yIHRoZSBlbSBkYXNoKSBh
bmQgSSB3b3VsZG4ndCB0YWtlIHRoZSB0cm91YmxlIHRvIHVzZSB0aGVtIG15c2VsZjsKPiAgYnV0
IEkgdGhpbmsgdGhlcmUgaXMgYSByZWFzb25hYmxlIGFzc3VtcHRpb24gdGhhdCB3aGVuIHNvbWVv
bmUgZ29lcwo+ICB0byB0aGUgZWZmb3J0IG9mIHVzaW5nIGEgVW5pY29kZSBwdW5jdHVhdGlvbiBt
YXJrIHRoYXQgaXMgc2VtYW50aWMKPiAgKHJhdGhlciB0aGFuIG1lcmVseSB0eXBvZ3JhcGhpY2Fs
KSwgdGhleSBwcm9iYWJseSBoYWQgYSByZWFzb24gZm9yCj4gIGRvaW5nIHNvLgo+IAo+ID4gCS0g
VSsyMDE4ICgn4oCYJyk6IExFRlQgU0lOR0xFIFFVT1RBVElPTiBNQVJLCj4gPiAJLSBVKzIwMTkg
KCfigJknKTogUklHSFQgU0lOR0xFIFFVT1RBVElPTiBNQVJLCj4gPiAJLSBVKzIwMWMgKCfigJwn
KTogTEVGVCBET1VCTEUgUVVPVEFUSU9OIE1BUksKPiA+IAktIFUrMjAxZCAoJ+KAnScpOiBSSUdI
VCBET1VCTEUgUVVPVEFUSU9OIE1BUksgIAo+IChUaGVzZSBhcmUgcHVyZWx5IHR5cG9ncmFwaGlj
LCBJIGhhdmUgbm8gcHJvYmxlbSB3aXRoIGR1bXBpbmcgdGhlbS4pCj4gCj4gPiAJLSBVKzAwZDcg
KCfDlycpOiBNVUxUSVBMSUNBVElPTiBTSUdOICAKPiBQcmVzdW1hYmx5IHRoaXMgaXMgYXBwZWFy
aW5nIGluIG1hdGhlbWF0aWNhbCBmb3JtdWxhZSwgaW4gd2hpY2ggY2FzZQo+ICBjaGFuZ2luZyBp
dCB0byAneCcgbG9zZXMgc2VtYW50aWMgaW5mb3JtYXRpb24uCj4gCj4gPiBVc2luZyB0aGUgYWJv
dmUgc3ltYm9scyB3aWxsIGp1c3QgdHJpY2sgdG9vbHMgbGlrZSBncmVwIGZvciBubyBnb29kCj4g
PiByZWFzb24uICAKPiBOQlNQLCBzdXJlLiAgVGhhdCBvbmUncyBwcm9iYWJseSBhbiBhcnRlZmFj
dCBvZiBzb21lIGRvY3VtZW50IGZvcm1hdAo+ICBjb252ZXJzaW9uIHNvbWV3aGVyZSBhbG9uZyB0
aGUgbGluZSwgYW55d2F5Lgo+IEJ1dCB3aGF0IGtpbmRzIG9mIHRoaW5ncyB3aXRoIMOXIG9yIOKA
lCBpbiBhcmUgZ29pbmcgdG8gYmUgZ3JlcHQgZm9yPwoKQWN0dWFsbHksIG9uIGFsbW9zdCBhbGwg
cGxhY2VzLCB0aG9zZSBhcmVuJ3QgdXNlZCBpbnNpZGUgbWF0aCBmb3JtdWxhZSwgYnV0Cmluc3Rl
YWQsIHRoZXkgZGVzY3JpYmUgdmlkZW8gc29tZSByZXNvbHV0aW9uczoKCgkkIGdpdCBncmVwIMOX
IERvY3VtZW50YXRpb24vCglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9hc3VzLHowMHQtdG01cDUtbnQzNTU5Ni55YW1sOnRpdGxlOiBBU1VTIFowMFQgVE01
UDUgTlQzNTU5NiA1LjUiIDEwODDDlzE5MjAgTENEIFBhbmVsCglEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUtZHNpLnlhbWw6ICAgICAg
ICAjIExHIEFDWDQ2N0FLTS03IDQuOTUiIDEwODDDlzE5MjAgTENEIFBhbmVsCglEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvdGx2MzIwYWRjeDE0MC55YW1sOiAgICAgIDEg
LSBNaWMgYmlhcyBpcyBzZXQgdG8gVlJFRiDDlyAxLjA5NgoJRG9jdW1lbnRhdGlvbi91c2Vyc3Bh
Y2UtYXBpL21lZGlhL3Y0bC9jcm9wLnJzdDpvZiAxNiDDlyAxNiBwaXhlbHMuIFRoZSBzb3VyY2Ug
Y3JvcHBpbmcgcmVjdGFuZ2xlIGlzIHNldCB0byBkZWZhdWx0cywKCURvY3VtZW50YXRpb24vdXNl
cnNwYWNlLWFwaS9tZWRpYS92NGwvY3JvcC5yc3Q6d2hpY2ggYXJlIGFsc28gdGhlIHVwcGVyIGxp
bWl0IGluIHRoaXMgZXhhbXBsZSwgb2YgNjQwIMOXIDQwMCBwaXhlbHMgYXQKCURvY3VtZW50YXRp
b24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvY3JvcC5yc3Q6b2Zmc2V0IDAsIDAuIEFuIGFwcGxp
Y2F0aW9uIHJlcXVlc3RzIGFuIGltYWdlIHNpemUgb2YgMzAwIMOXIDIyNSBwaXhlbHMsCglEb2N1
bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL2Nyb3AucnN0OlRoZSBkcml2ZXIgc2V0
cyB0aGUgaW1hZ2Ugc2l6ZSB0byB0aGUgY2xvc2VzdCBwb3NzaWJsZSB2YWx1ZXMgMzA0IMOXIDIy
NCwKCURvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvY3JvcC5yc3Q6aXMgNjA4
IMOXIDIyNCAoMjI0IMOXIDI6MSB3b3VsZCBleGNlZWQgdGhlIGxpbWl0IDQwMCkuIFRoZSBvZmZz
ZXQgMCwgMCBpcwoJRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9jcm9wLnJz
dDpyZWN0YW5nbGUgb2YgNjA4IMOXIDQ1NiBwaXhlbHMuIFRoZSBwcmVzZW50IHNjYWxpbmcgZmFj
dG9ycyBsaW1pdAoJRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9jcm9wLnJz
dDpjcm9wcGluZyB0byA2NDAgw5cgMzg0LCBzbyB0aGUgZHJpdmVyIHJldHVybnMgdGhlIGNyb3Bw
aW5nIHNpemUgNjA4IMOXIDM4NAoJRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0
bC9jcm9wLnJzdDphbmQgYWRqdXN0cyB0aGUgaW1hZ2Ugc2l6ZSB0byBjbG9zZXN0IHBvc3NpYmxl
IDMwNCDDlyAxOTIuCglEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL2RpZmYt
djRsLnJzdDpzaXplIGJpdG1hcCBvZiAxMDI0IMOXIDYyNSBiaXRzLiBTdHJ1Y3QgOmM6dHlwZTpg
djRsMl93aW5kb3dgCglEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL3ZpZGlv
Yy1jcm9wY2FwLnJzdDogICAgICAgQXNzdW1pbmcgcGl4ZWwgYXNwZWN0IDEvMSB0aGlzIGNvdWxk
IGJlIGZvciBleGFtcGxlIGEgNjQwIMOXIDQ4MAoJRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBp
L21lZGlhL3Y0bC92aWRpb2MtY3JvcGNhcC5yc3Q6ICAgICAgIHJlY3RhbmdsZSBmb3IgTlRTQywg
YSA3Njggw5cgNTc2IHJlY3RhbmdsZSBmb3IgUEFMIGFuZCBTRUNBTQoKaXQgaXMgYSB3YXkgbW9y
ZSBsaWtlbHkgdGhhdCwgaWYgc29tZW9uZSB3YW50cyB0byBncmVwLCB0aGV5IHdvdWxkIGJlIApk
b2luZyBzb21ldGhpbmcgbGlrZSB0aGlzLCBpbiBvcmRlciB0byBnZXQgdmlkZW8gcmVzb2x1dGlv
bnM6CgoJJCBnaXQgZ3JlcCAtRSAiXGJbMS05XVswLTldK1xzKnhccypbMC05XStcYiIgRG9jdW1l
bnRhdGlvbi8KCURvY3VtZW50YXRpb24vQUJJL29ic29sZXRlL3N5c2ZzLWRyaXZlci1oaWQtcm9j
Y2F0LWtvbmVwbHVzOkRlc2NyaXB0aW9uOiAgICAgICAgV2hlbiByZWFkIHRoZSBtb3VzZSByZXR1
cm5zIGEgMzB4MzAgcGl4ZWwgaW1hZ2Ugb2YgdGhlCglEb2N1bWVudGF0aW9uL0FCSS9vYnNvbGV0
ZS9zeXNmcy1kcml2ZXItaGlkLXJvY2NhdC1rb25lcHVyZTpEZXNjcmlwdGlvbjogICAgICAgIFdo
ZW4gcmVhZCB0aGUgbW91c2UgcmV0dXJucyBhIDMweDMwIHBpeGVsIGltYWdlIG9mIHRoZQoJRG9j
dW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1idXMtZXZlbnRfc291cmNlLWRldmljZXMtaHZf
MjR4NzogICAgICAgICAgICAgICBQcm92aWRlcyBhY2Nlc3MgdG8gdGhlIGJpbmFyeSAiMjR4NyBj
YXRhbG9nIiBwcm92aWRlZCBieSB0aGUKCURvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMt
YnVzLWV2ZW50X3NvdXJjZS1kZXZpY2VzLWh2XzI0eDc6ICAgICAgICAgICAgICAgaHR0cHM6Ly9y
YXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2ptZXNtb24vY2F0YWxvZy0yNHg3L21hc3Rlci9odi0y
NHg3LQljYXRhbG9nLmgKCURvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtYnVzLWV2ZW50
X3NvdXJjZS1kZXZpY2VzLWh2XzI0eDc6ICAgICAgICAgICAgICAgRXhwb3NlcyB0aGUgInZlcnNp
b24iIGZpZWxkIG9mIHRoZSAyNHg3IGNhdGFsb2cuIFRoaXMgaXMgYWxzbwoJRG9jdW1lbnRhdGlv
bi9BQkkvdGVzdGluZy9zeXNmcy1idXMtZXZlbnRfc291cmNlLWRldmljZXMtaHZfMjR4NzogICAg
ICAgICAgICAgICBIQ0FMTHMgdG8gcmV0cmlldmUgaHYtMjR4NyBwbXUgZXZlbnQgY291bnRlciBk
YXRhLgoJRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1idXMtdmZpby1tZGV2OiAgICAg
ICAgICAiMiBoZWFkcywgNTEyTSBGQiwgMjU2MHgxNjAwIG1heGltdW0gcmVzb2x1dGlvbiIKCURv
Y3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZHJpdmVyLXdhY29tOiAgICAgICAgICAgb2Yg
dGhlIGRldmljZS4gVGhlIGltYWdlIGlzIGEgNjR4MzIgcGl4ZWwgNC1iaXQgZ3JheSBpbWFnZS4g
VGhlCglEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWRyaXZlci13YWNvbTogICAgICAg
ICAgIDEwMjQgYnl0ZSBiaW5hcnkgaXMgc3BsaXQgdXAgaW50byAxNnggNjQgYnl0ZSBjaHVua3Mu
IEVhY2ggNjQKCURvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZHJpdmVyLXdhY29tOiAg
ICAgICAgICAgaW1hZ2UgaGFzIHRvIGNvbnRhaW4gMjU2IGJ5dGVzICg2NHgzMiBweCAxIGJpdCBj
b2xvdXIpLgoJRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9lZGlkLnJzdDpjb21tb25seSB1c2Vk
IHNjcmVlbiByZXNvbHV0aW9ucyAoODAweDYwMCwgMTAyNHg3NjgsIDEyODB4MTAyNCwgMTYwMHgx
MjAwLAoJRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9lZGlkLnJzdDoxNjgweDEwNTAsIDE5MjB4
MTA4MCkgYXMgYmluYXJ5IGJsb2JzLCBidXQgdGhlIGtlcm5lbCBzb3VyY2UgdHJlZSBkb2VzCglE
b2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2VkaWQucnN0OklmIHlvdSB3YW50IHRvIGNyZWF0ZSB5
b3VyIG93biBFRElEIGZpbGUsIGNvcHkgdGhlIGZpbGUgMTAyNHg3NjguUywKCURvY3VtZW50YXRp
b24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0OiAgICAgICAgICAgICAgICAgICAg
ICAgIGVkaWQvMTAyNHg3NjguYmluLCBlZGlkLzEyODB4MTAyNC5iaW4sCglEb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dDogICAgICAgICAgICAgICAgICAgICAg
ICBlZGlkLzE2ODB4MTA1MC5iaW4sIG9yIGVkaWQvMTkyMHgxMDgwLmJpbiBpcyBnaXZlbgoJRG9j
dW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQ6ICAgICAgICAgICAg
ICAgICAgICAgICAgMiAtIFRoZSBWR0EgU2hpZWxkIGlzIGF0dGFjaGVkICgxMDI0eDc2OCkKCURv
Y3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbWVkaWEvZHZiX2ludHJvLnJzdDpzaWduYWwgZW5jb2Rl
ZCBhdCBhIHJlc29sdXRpb24gb2YgNzY4eDU3NiAyNC1iaXQgY29sb3IgcGl4ZWxzIG92ZXIgMjUK
CURvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbWVkaWEvaW14LnJzdDoxMjgweDk2MCBpbnB1dCBm
cmFtZSB0byA2NDB4NDgwLCBhbmQgdGhlbiAvMiBkb3duc2NhbGUgaW4gYm90aAoJRG9jdW1lbnRh
dGlvbi9hZG1pbi1ndWlkZS9tZWRpYS9pbXgucnN0OmRpbWVuc2lvbnMgdG8gMzIweDI0MCAoYXNz
dW1lcyBpcHUxX2NzaTAgaXMgbGlua2VkIHRvIGlwdTFfY3NpMF9tdXgpOgoJRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9tZWRpYS9pbXgucnN0OiAgIG1lZGlhLWN0bCAtViAiJ2lwdTFfY3NpMF9t
dXgnOjJbZm10OlVZVlkyWDgvMTI4MHg5NjBdIgoKd2hpY2ggd29uJ3QgZ2V0IHRoZSBhYm92ZSwg
ZHVlIHRvIHRoZSB1c2FnZSBvZiB0aGUgVVRGLTggYWx0ZXJuYXRpdmUuCgpJbiBhbnkgY2FzZSwg
cmVwbGFjaW5nIGFsbCB0aGUgYWJvdmUgYnkgJ3gnIHNlZW1zIHRvIGJlIHRoZSByaWdodCB0aGlu
ZywKYXQgbGVhc3Qgb24gbXkgZXllcy4KCj4gSWYgdGhlcmUgYXJlIGVtIGRhc2hlcyBseWluZyBh
cm91bmQgdGhhdCBzZW1hbnRpY2FsbHkgX3Nob3VsZF8gYmUKPiAgaHlwaGVuLW1pbnVzIChvbmUg
b2YgeW91ciBwYXRjaGVzIEkndmUgc2VlbiwgZm9yIGluc3RhbmNlLCBmaXhlcyBhbgo+ICAqZW4q
IGRhc2ggbW9vbmxpZ2h0aW5nIGFzIHRoZSBvcHRpb24gY2hhcmFjdGVyIGluIGFuIGBldGh0b29s
YAo+ICBjb21tYW5kIGxpbmUpLCB0aGVuIHN1cmUsIGNvbnZlcnQgdGhlbS4KPiBCdXQgYW55IHRp
bWUgc29tZW9uZSBpcyB1c2luZyBhIFVuaWNvZGUgY2hhcmFjdGVyIHRvICpleHByZXNzCj4gIHNl
bWFudGljcyosIGV2ZW4gaWYgeW91IGhhcHBlbiB0byB0aGluayB0aGUgc2VtYW50aWMgZGlzdGlu
Y3Rpb24KPiAgaW52b2x2ZWQgaXMgYSBwZWRhbnRpYyBvciB1bmltcG9ydGFudCBvbmUsIEkgdGhp
bmsgeW91IG5lZWQgYW4KPiAgZXhwbGljaXQgZ3JlcCBjYXNlIHRvIGp1c3RpZnkgQVNDSUlmeWlu
ZyBpdC4KClllYWgsIGluIHRoZSBjYXNlIG9mIGh5cGhlbi9kYXNoIGl0IHNlZW1zIHRvIG1ha2Ug
c2Vuc2UgdG8gZG91YmxlIGNoZWNrCml0LgoKVGhhbmtzLApNYXVybwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
