Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C268B595E7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Sep 2025 14:20:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgEW0SGYBZuNDu8odQFq7ajRdghz5GYWI8Q73RXymI4=; b=YNRPcBoi+DCLW8Xi4dI0DobUfg
	HNeHccPriT08x08OBSWSjOppr3qw+4GlvanC5TBWb3btEGZQW127obriGOppGTmKCwn56bNHvCoVS
	hjXc9ZQ6UXcDulS8ql8Yjyzi2yx9m1+TRVcNN6FIfm4Hu7IGCRXSYd+sDP6JaLR66PvE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uyUfe-0008U9-PB;
	Tue, 16 Sep 2025 12:20:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jprusakowski@google.com>) id 1uyUfd-0008U3-Vj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 12:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qpTj7Nqy+YOGw0s/V38MS7a59oHs6vcqs/ZR8OoDv4Q=; b=imkDDkapMlT2RkxSOOtoSxhA2N
 /XW1lvhPf+FyQZJcnWzwv+s+Zv+zhdGhiaaAVRgA0Ca7BxnkbwYKURz+TudorHh0OnMNg0xFAwqyA
 nkn31WT32CMP3RDhzJGeFyfPy3e9WLH8vpukVC1UC6005+Y3NJXIIQi/e8RTXpJSslUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qpTj7Nqy+YOGw0s/V38MS7a59oHs6vcqs/ZR8OoDv4Q=; b=gIIqkJFqVhtPOfdGy/gQQeLflg
 +RK1kEIebhgn+KrnSCta3AzGSA05i6iZJjFO5toQQjqXqZ5HUXraYgN+CL92nOVOyOMkTee2yy8F4
 Ip0+fFlMpXLQYcQpU+T2BuV/ZhzQAAUpjYLHqscoqe86fpk8l7Q1LWI4apOBcmb0VxoM=;
Received: from mail-qt1-f170.google.com ([209.85.160.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uyUfd-0006uA-FP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 12:20:29 +0000
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4b78657a35aso194871cf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Sep 2025 05:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758025223; x=1758630023;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qpTj7Nqy+YOGw0s/V38MS7a59oHs6vcqs/ZR8OoDv4Q=;
 b=NDIAf295q8F/Dakp9mr0sQoyN1Pju3FHzy6/pAVkfMGzRai26QSNicGVgeouO3IIdN
 jFhmPWECNPItbGQLr7nftdVhk47tkqrerzVKAvvHtSZsnuPAeQ7TDG2FQGljnBC2nlGp
 U3WfgficTFEquB8yHfP5QJ4hnmvmW6RakV92Jb7O2N7nTDLT0e237by2Z6fzuFRXDo97
 KlXZFKpP5NLahmJ8vPy9Tfop23cNk22+hJfpvVbq8yX8IlUX3cQFF3Xm8anq1/RnywWS
 aBT5JQ9WNUibAc7tCLHSeWFMBoGFytWUduiYHlKD3JCSvDEdKvRfW7M/JB8l1LDNG7hk
 bz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758025223; x=1758630023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qpTj7Nqy+YOGw0s/V38MS7a59oHs6vcqs/ZR8OoDv4Q=;
 b=cgSAXRXLSkudc61h/j9a0WXmitD0UUov6c3rHrIuYWePerXX12HZnIWArQPXi+LANV
 TOqR8u1oM7uB5HWkwXOnAXM8QISq9KPnXwb/S9ZnXHqisRHcKaMqH5uaDLgmnkMIEvrx
 F5tBLWxwGwwvPxKl0ivqhqvGo/R2I1c7w5z0LWnmDFSSSa39W9EyvQiSATXqktWeDfMx
 PwGgf8eyPvzJsaOolH1l16y0B3QRE2qcTe59VGNbR8LVYcJJnWxqDkQc81JaN5sXVDQO
 F0TGKlY2sBeI5GGhaKElhuQZm3GLyn3Fr5qVauvZ/R4HrmhfLkLfosups86GPeV7RFit
 1Y2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx8D3M6JL5bbKu7f+VdGZrdmWlspm5EKmjh8W5gMpLEhXtXWmOMJCwPnor7rjRNvwrqM99GjcouXQnr9551AZP@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwS+opf6Z8yS+mSefyjOjuqL7bU1EemutSyn1+l9fMNaZk9VrGX
 DFR5WEpwGLY8hyn89slJiRiRQnws9AcpHZpf46UDco00QEH4jxlG/XgblME/QCg7JlF7NUadu6V
 iCdFY7I+LPem9wSypBWCHhDX41NzkJhmlUdsEjgpM6htzjnakMFWR7XTtzYI=
X-Gm-Gg: ASbGnctxAU63IqnQbrVUVW0Fb8n1JWm/nmKaKx8fZ54aO+KQgs6m8nShxMOGfZsw0Sc
 xD+52p/2dpSQbVsrMEhfTUK7KYQLGDgRGYirJThPBasY8ytwNCqArB6Hob9yGcwYgK/Spu0SjKy
 Vv+SJgyCxx+BSE6GSoUVyWZwxxX/ULD9RvUeh5C3hh6u0s8ts0ChX485/byBeHbEkvGLpVvYOD9
 a/NMXh6uvsQqjF4qD3ZWgw4fpfGM9NnyA==
X-Google-Smtp-Source: AGHT+IG97+gDeo+x5k0gCWuMikrkn4VHk9ftt27Tqf/oLwJjb1o85aamc3nuM83i8Vq8mn2pDTiamRESwoTGzEndy6o=
X-Received: by 2002:a05:6e02:2781:b0:41f:1ff3:a01d with SMTP id
 e9e14a558f8ab-4240fef05afmr4212315ab.17.1758024830783; Tue, 16 Sep 2025
 05:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250915100451.810719-1-jprusakowski@google.com>
 <20250915100451.810719-2-jprusakowski@google.com>
 <20250915143951.GB1993@quark>
In-Reply-To: <20250915143951.GB1993@quark>
Date: Tue, 16 Sep 2025 14:13:39 +0200
X-Gm-Features: AS18NWALWUsumuuOmET2CnM-Cg0K4VAqo5JNSd7sMREwfFAN1usprwK7xm0HEyQ
Message-ID: <CAHwWncjUFzByau+oWh--Q3t-w6FjQ8kWG_fiOyEzLB=HHfdAsg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Sep 15,
 2025 at 4:40 PM Eric Biggers <ebiggers@kernel.org>
 wrote: > > On Mon, Sep 15, 2025 at 12:04:51PM +0200, Jan Prusakowski wrote:
 > > common/encrypt: Do not run _verify_ciphertext_for_enc [...] 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uyUfd-0006uA-FP
Subject: Re: [f2fs-dev] [PATCH v2 1/1] common/encrypt: Do not run
 _verify_ciphertext_for_encryption_policy on compressed FS
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
From: Jan Prusakowski via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jan Prusakowski <jprusakowski@google.com>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBTZXAgMTUsIDIwMjUgYXQgNDo0MOKAr1BNIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCAxNSwgMjAyNSBhdCAxMjowNDo1MVBN
ICswMjAwLCBKYW4gUHJ1c2Frb3dza2kgd3JvdGU6Cj4gPiBjb21tb24vZW5jcnlwdDogRG8gbm90
IHJ1biBfdmVyaWZ5X2NpcGhlcnRleHRfZm9yX2VuY3J5cHRpb25fcG9saWN5IG9uIGNvbXByZXNz
ZWQgRlMKPgo+IEEgYmV0dGVyIHRpdGxlIHdvdWxkIGJlIHNvbWV0aGluZyBsaWtlCj4gImNvbW1v
bi9lbmNyeXB0OiBFeHBsaWNpdGx5IHNldCB0aGUgdGVzdCBmaWxlIHRvIHVuY29tcHJlc3NlZCIu
CgpBZ3JlZWQsIHdpbGwgZml4IHRoYXQgaW4gdjMuCgo+ID4gQEAgLTc5MCw2ICs3OTAsMTMgQEAg
X2RvX3ZlcmlmeV9jaXBoZXJ0ZXh0X2Zvcl9lbmNyeXB0aW9uX3BvbGljeSgpCj4gPiAgICAgICBf
c2V0X2VuY3BvbGljeSAkZGlyICRrZXlzcGVjICRzZXRfZW5jcG9saWN5X2FyZ3MgLWYgJHBvbGlj
eV9mbGFncwo+ID4gICAgICAgZm9yIHNyYyBpbiAkdG1wLnRlc3RmaWxlXyo7IGRvCj4gPiAgICAg
ICAgICAgICAgIGRzdD0kZGlyLyR7c3JjIyMqLn0KPiA+ICsgICAgICAgICAgICAgIyBUbyBtYWtl
IHN1cmUgdGhlIHRlc3QgZmlsZSBpcyBub3QgY29tcHJlc3NlZCB3ZSBjcmVhdGUgYW4gZW1wdHkg
b25lCj4gPiArICAgICAgICAgICAgICMgYW5kIGRpc2FibGUgY29tcHJlc3Npb24gZmlyc3QgKEYy
RlMgd29uJ3QgYWxsb3cgcmVzZXR0aW5nIHRoZQo+ID4gKyAgICAgICAgICAgICAjIGNvbXByZXNz
aW9uIGZsYWcgaWYgdGhlIGZpbGUgaGFzIGRhdGEgYWxyZWFkeSBpbiBpdCkuCj4gPiArICAgICAg
ICAgICAgIHRvdWNoICRkc3QKPiA+ICsgICAgICAgICAgICAgaWYgbHNhdHRyICRkc3QgfCBncmVw
IC1xRSAiLitjLisgJGRzdCIgOyB0aGVuCj4gPiArICAgICAgICAgICAgICAgICAgICAgY2hhdHRy
IC1jICRkc3QKPiA+ICsgICAgICAgICAgICAgZmkKPiA+ICAgICAgICAgICAgICAgY3AgJHNyYyAk
ZHN0Cj4gPiAgICAgICAgICAgICAgIGlub2RlPSQoc3RhdCAtYyAlaSAkZHN0KQo+ID4gICAgICAg
ICAgICAgICBibG9ja2xpc3Q9JChfZ2V0X2NpcGhlcnRleHRfYmxvY2tfbGlzdCAkZHN0KQo+Cj4g
SXMgYWRkaW5nICdtJyAoRlNfTk9DT01QX0ZMKSBuZWVkZWQgdG9vPyAgSWYgbm90LCB3aHkgZG9l
cyBpdCBleGlzdD8KCkluIG15IHNldHVwIGZpbGVzIGNyZWF0ZWQgaGF2ZSBGU19DT01QUl9GTCBz
ZXQgZnJvbSB0aGUgc3RhcnQuIEp1c3QgY2xlYXJpbmcKRlNfQ09NUFJfRkwgYXBwZWFycyB0byBo
ZWxwIGFzIG5vdyBhbGwgdGhlIHRlc3RzIHVzaW5nCl92ZXJpZnlfY2lwaGVydGV4dF9mb3JfZW5j
cnlwdGlvbl9wb2xpY3kKcGFzcyB3aGVuIEkgcnVuIHRoZW0gb24gZjJmcyB3aXRoICItbyBjb21w
cmVzc19leHRlbnNpb249KiIuCgpEbyB5b3UgdGhpbmsgd2Ugc2hvdWxkIGFkZCAnbScgKEZTX05P
Q09NUF9GTCkgYXMgd2VsbCBqdXN0IGluIGNhc2Ugc29tZSBvdGhlciBGUwpiZWhhdmVzIGRpZmZl
cmVudGx5PyBEbyB5b3UgaGF2ZSBhbnkgaWRlYXMgb24gd2hhdCBvdGhlciBGUyBJIHNob3VsZCBj
aGVjaz8KCj4gQWxzbywgaGF2ZSB5b3UgdmVyaWZpZWQgdGhhdCB0aGUgdGVzdHMgdGhhdCB1c2Ug
dGhpcyBmdW5jdGlvbiBzdGlsbCBwYXNzCj4gb24gYm90aCBleHQ0IGFuZCBmMmZzPwoKWWVzLCB0
aGVyZSBhcmUgbm8gcmVncmVzc2lvbnMgb24gZXh0NCBhbmQgZjJmcy4gSSBjaGVja2VkIGdlbmVy
aWMvMzY5LApnZW5lcmljLzU0OCwgZ2VuZXJpYy81NDksIGdlbmVyaWMvNTUwLCBnZW5lcmljLzU4
MiwgZ2VuZXJpYy81ODMsIGdlbmVyaWMvNTg0LApnZW5lcmljLzU5MiwgZ2VuZXJpYy82MDIsIGdl
bmVyaWMvNjkzIGFuZCBnZW5lcmljLzczOS4KCkFsbCBub3cgcGFzcyBleGNlcHQgZ2VuZXJpYy8z
Njkgd2hpY2ggaXMgc2tpcHBlZCBkdWUgdG8gbm8gc3VwcG9ydCBmb3IKaGFyZHdhcmUtd3JhcHBl
ZCBpbmxpbmUgZW5jcnlwdGlvbiBrZXlzKS4KCktpbmQgcmVnYXJkcywKSmFuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
