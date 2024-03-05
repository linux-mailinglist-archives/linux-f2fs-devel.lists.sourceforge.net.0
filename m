Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4667871288
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Mar 2024 02:57:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhK3h-0004k3-9W;
	Tue, 05 Mar 2024 01:57:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1rhK3U-0004j9-AH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 01:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qw7us6PtslL66jWV5rgbddJX+ZH8W/kC7W1JeYDVces=; b=MbraiTBHnME4z84xNziQB7uMn7
 tSjDOBG4yBUzgc5vz1HEH0UrdAoS8N6Be8YF7Tb3cXK5D0QYsMO7TNR56DRbxetcOIB2CLCS2BnJ2
 83+44m2n5QM62GsDHdikZtcyXS5y19NIbeA2luTwbYE1Z3vtUXR0xhiW7v0iHslVUVF0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qw7us6PtslL66jWV5rgbddJX+ZH8W/kC7W1JeYDVces=; b=CnnCvYfYNcnisYRNWbAJ3AokXi
 77c6Q+QAnt7p2T0r2s9chWPk0++wLHjZiUOh9hzTy3kHRH7m8byEZEPuwrcyUVMvtHuczkRUA7q0S
 YZOcngM6X4we6vEln4kTRHD78HCvzx3cEvgisD2jrAu+O82JGW5AecmEo0F58X2s2CDo=;
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rhK3N-0004nB-Oe for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 01:57:20 +0000
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5673f7b3196so2375405a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Mar 2024 17:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709603828; x=1710208628; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qw7us6PtslL66jWV5rgbddJX+ZH8W/kC7W1JeYDVces=;
 b=DMTFi070ia9FNwCPkrxUTW0rKXrQxowGRf6ldvHv48VgJF5H3ahuw9elKCIeMBJFJU
 oj2oTwZ4tv4A6wgy1q++/uKatNGar94oeIgou6PtKfbIFoptxtKvZpox+NpncvH/FfO4
 ggHK7rzAdyuuXmR8q1t0N2wGZQvUihi4YJocRdkPvAd6kVMxXGX53cuk/86nJMjN0lxN
 12BiI8alilHqSVLTG5MMU7PSQ4c/PH9sQ4dfobNI+OLV/joClhnRabeG5dRdvalGfq64
 YW0ssXM+OkQhn1aZfhSug5abgRvyuFAn7uoSyymdsm9HWf/7GOJCNFazEvETnR/zdaYw
 CUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709603828; x=1710208628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qw7us6PtslL66jWV5rgbddJX+ZH8W/kC7W1JeYDVces=;
 b=FTIQ9gJ1U/x6ytxWYWM8JDeAVdcjSlx3Fp6/6B790d7xQcKi0nAdrqFovPJyLxWJ79
 /WqcIP05FCaePawJjVHRqmQ+C75YdzO8U9V2C/hH2ZvijjTbHHGuUoJF13+GIdCOAxTQ
 IT5bXE57JcFt6wYk3kIIV71veZCx9nmfaNW0pSLjtxR1qt/QYqu5X/5VxsTdIB5/qBMw
 V98ulNrrQ41cjuNowy2UcyEBFlpPB7jXWeqCC8HS0TFb90MlQ6bhYfXRw1+IgWaaRA0s
 N7EGziCNn8wRHYFM2GIb0x9OQIT0/t5F1j/R0/AZ3SjmS+0RsaoB5u+gb7ququVMZWTj
 6aFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN3i2DHhKG+W0hpU8trXTV2wJBmQEAdy9bn9qGdx51P6H8HMpmbLUA+P2Ze/H8j3CMxWjEjArAEioGJ3p2MQGKdm+vfNAFBd3D8IMOsCTZ08og0hDtMA==
X-Gm-Message-State: AOJu0YyjqLrgtcwCoVIPY0uYi7cLVw/76DcNEPHLEtoiNIZVWnS7z/GH
 XBEVbZxns6ZdU7JJ2bNdu2b5uqKVUQVCJFc+U3idRErMIhnSjAzt3oA5HfIFKG32m35T2IyyGH2
 3PfZUcDPZYqc3liBbj7QTBkq9lu3XZCYUnLRvPQ==
X-Google-Smtp-Source: AGHT+IH/roTdZh/Go7x9sWPisWOSOQ3FEPoCnx1VP18PVkLL9PgiV1f6MXWEzhUqmNBNr6rZAzmGwd6hh1uAeKPjTUM=
X-Received: by 2002:a50:a41b:0:b0:565:7b88:1cff with SMTP id
 u27-20020a50a41b000000b005657b881cffmr7787242edb.11.1709603827695; Mon, 04
 Mar 2024 17:57:07 -0800 (PST)
MIME-Version: 1.0
References: <20240111081743.2999210-1-chao@kernel.org>
 <ae43ed8a-49b5-44bf-8fea-a222091e9790@kernel.org>
 <ed3eecaf9e2f4c8fae2fd01241aa097e@BJMBX02.spreadtrum.com>
In-Reply-To: <ed3eecaf9e2f4c8fae2fd01241aa097e@BJMBX02.spreadtrum.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 5 Mar 2024 09:56:56 +0800
Message-ID: <CAHJ8P3JzanzGqjuJ8ODMxE4rguxrQ-yd4Ho16RCDH9u975gOEA@mail.gmail.com>
To: =?UTF-8?B?54mb5b+X5Zu9IChaaGlndW8gTml1KQ==?= <Zhiguo.Niu@unisoc.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dear Jaegeuk, Let me describe the problem process, it is reproduced
    by monkey stability test: 1.SBI_NEED_CP flag bit is set， set_sbi_flag(F2FS_I_SB(inode),
    SBI_NEED_CP); 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.49 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rhK3N-0004nB-Oe
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: reduce expensive checkpoint trigger
 frequency
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
Cc: =?UTF-8?B?6YeR57qi5a6HIChIb25neXUgSmluKQ==?= <hongyu.jin@unisoc.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RGVhciAgSmFlZ2V1aywKCkxldCBtZSBkZXNjcmliZSB0aGUgcHJvYmxlbSBwcm9jZXNzLCBpdCBp
cyByZXByb2R1Y2VkIGJ5IG1vbmtleSBzdGFiaWxpdHkgdGVzdDoKCiAxLlNCSV9ORUVEX0NQIGZs
YWcgYml0IGlzIHNldO+8jAogc2V0X3NiaV9mbGFnKEYyRlNfSV9TQihpbm9kZSksIFNCSV9ORUVE
X0NQKTsKCiAyLkNrcHQgdGhyZWFkIGlzIGJsb2NrZWQgYnkgSU8gYnVzeSB3aGVuIGl0IGlzIGRv
aW5nIENQLCAgaXQgY2FuIG5vdApnZXQgcmVxdWVzdCB0YWcgZnJvbSBibG9jayBxdWV1ZSwKIFBJ
RDogNTA1ICAgICAgVEFTSzogZmZmZmZmODBlZDdmNDljMCAgQ1BVOiA0ICAgIENPTU1BTkQ6ICJm
MmZzX2NrcHQtMjU0OjQiCiAjMCBbZmZmZmZmYzAxNWZjYjMzMF0gX19zd2l0Y2hfdG8gYXQgZmZm
ZmZmYzAxMDE5NjM1MAogIzEgW2ZmZmZmZmMwMTVmY2IzOTBdIF9fc2NoZWR1bGUgYXQgZmZmZmZm
YzAxMTY4ZTUzYwogIzIgW2ZmZmZmZmMwMTVmY2IzZjBdIHNjaGVkdWxlIGF0IGZmZmZmZmMwMTE2
OGVkN2MKICMzIFtmZmZmZmZjMDE1ZmNiNDUwXSBpb19zY2hlZHVsZSBhdCBmZmZmZmZjMDExNjhm
N2EwCiAjNCBbZmZmZmZmYzAxNWZjYjRjMF0gYmxrX21xX2dldF90YWcgYXQgZmZmZmZmYzAxMDEw
MDhhNAogIzUgW2ZmZmZmZmMwMTVmY2I1MzBdIGJsa19tcV9nZXRfcmVxdWVzdCBhdCBmZmZmZmZj
MDEwOTI0MWIwCiAjNiBbZmZmZmZmYzAxNWZjYjVmMF0gYmxrX21xX21ha2VfcmVxdWVzdCBhdCBm
ZmZmZmZjMDEwOTIzM2JjCiAjNyBbZmZmZmZmYzAxNWZjYjY4MF0gZ2VuZXJpY19tYWtlX3JlcXVl
c3QgYXQgZmZmZmZmYzAxMDBmYzZlYwogIzggW2ZmZmZmZmMwMTVmY2I3MDBdIHN1Ym1pdF9iaW8g
YXQgZmZmZmZmYzAxMDBmYzNiOAogIzkgW2ZmZmZmZmMwMTVmY2I3NTBdIF9fc3VibWl0X2JpbyBh
dCBmZmZmZmZjMDEwODFhMmUwCiAjMTAgW2ZmZmZmZmMwMTVmY2I3ZDBdIF9fc3VibWl0X21lcmdl
ZF9iaW8gYXQgZmZmZmZmYzAxMDgxYjA3YwogIzExIFtmZmZmZmZjMDE1ZmNiOGEwXSBmMmZzX3N1
Ym1pdF9wYWdlX3dyaXRlIGF0IGZmZmZmZmMwMTAwZWNkM2MKICMxMiBbZmZmZmZmYzAxNWZjYjk5
MF0gZjJmc19kb193cml0ZV9tZXRhX3BhZ2UgYXQgZmZmZmZmYzAxMDg0NTczOAogIzEzIFtmZmZm
ZmZjMDE1ZmNiOWQwXSBfX2YyZnNfd3JpdGVfbWV0YV9wYWdlIGF0IGZmZmZmZmMwMTA4MGE4ZjQK
ICMxNCBbZmZmZmZmYzAxNWZjYmI2MF0gZjJmc19zeW5jX21ldGFfcGFnZXMgYXQgZmZmZmZmYzAx
MDgwYTY4NAogIzE1IFtmZmZmZmZjMDE1ZmNiY2EwXSBkb19jaGVja3BvaW50IGF0IGZmZmZmZmMw
MTA4MGYwYTgKICMxNiBbZmZmZmZmYzAxNWZjYmQxMF0gZjJmc193cml0ZV9jaGVja3BvaW50IGF0
IGZmZmZmZmMwMTA4MGU1MGMKICMxNyBbZmZmZmZmYzAxNWZjYmRiMF0gX19jaGVja3BvaW50X2Fu
ZF9jb21wbGV0ZV9yZXFzIGF0IGZmZmZmZmMwMTA4MTBmNTQKICMxOCBbZmZmZmZmYzAxNWZjYmU0
MF0gaXNzdWVfY2hlY2twb2ludF90aHJlYWQgYXQgZmZmZmZmYzAxMDgxMTNlYwogIzE5IFtmZmZm
ZmZjMDE1ZmNiZTgwXSBrdGhyZWFkIGF0IGZmZmZmZmMwMTAyNjY1YjAKCiAzLlN1YnNlcXVlbnQg
cmVndWxhciBmaWxlIGZzeW5jIHdpbGwgdHJpZ2dlciBja3B0IGJlY2F1c2UgU0JJX05FRURfQ1AK
aGFzIG5vdCBiZWVuIGNsZWFyZWQuCiBJbiBmYWN0LCB0aGVzZSBjYXNlcyBzaG91bGQgbm90IHRy
aWdnZXIgY2twdC4KCiA0LklmIHNvbWUgcHJvY2Vzc2VzIHRoYXQgcGVyZm9ybSBmMmZzX2RvX3N5
bmNfZmlsZSBhcmUgaW1wb3J0YW50IHByb2Nlc3NlcwogaW4gdGhlIHN5c3RlbShzdWNoIGFzIGlu
aXQpIGFuZCBhcmUgYmxvY2tlZCBmb3IgdG9vIGxvbmcsIGl0IHdpbGwKY2F1c2Ugb3RoZXIgcHJv
YmxlbXMgaW4gdGhlIHN5c3RlbSwgQU5SIG9yIGFuZHJvaWQgcmVib290CiBQSUQ6IDI4NyAgICAg
IFRBU0s6IGZmZmZmZjgwZjllYjBlYzAgIENQVTogMiAgICBDT01NQU5EOiAiaW5pdCIKICMwIFtm
ZmZmZmZjMDEzODliYWIwXSBfX3N3aXRjaF90byBhdCBmZmZmZmZjMDEwMTk2MzUwCiAjMSBbZmZm
ZmZmYzAxMzg5YmIxMF0gX19zY2hlZHVsZSBhdCBmZmZmZmZjMDExNjhlNTNjCiAjMiBbZmZmZmZm
YzAxMzg5YmI3MF0gc2NoZWR1bGUgYXQgZmZmZmZmYzAxMTY4ZWQ3YwogIzMgW2ZmZmZmZmMwMTM4
OWJiYzBdIHdhaXRfZm9yX2NvbXBsZXRpb24gYXQgZmZmZmZmYzAxMTY5MjM2OAogIzQgW2ZmZmZm
ZmMwMTM4OWJjYTBdIGYyZnNfaXNzdWVfY2hlY2twb2ludCBhdCBmZmZmZmZjMDEwODEwY2IwCiAj
NSBbZmZmZmZmYzAxMzg5YmQwMF0gZjJmc19zeW5jX2ZzIGF0IGZmZmZmZmMwMTA3ZjRlMWMKICM2
IFtmZmZmZmZjMDEzODliZGMwXSBmMmZzX2RvX3N5bmNfZmlsZSBhdCBmZmZmZmZjMDEwN2Q0ZDQ0
CiAjNyBbZmZmZmZmYzAxMzg5YmUyMF0gZjJmc19zeW5jX2ZpbGUgYXQgZmZmZmZmYzAxMDdkNDky
YwogIzggW2ZmZmZmZmMwMTM4OWJlMzBdIF9fYXJtNjRfc3lzX2ZzeW5jIGF0IGZmZmZmZmMwMTA1
ZDMxZDgKICM5IFtmZmZmZmZjMDEzODliZTcwXSBlbDBfc3ZjX2NvbW1vbiBhdCBmZmZmZmZjMDEw
MWFhNTUwCiAjMTAgW2ZmZmZmZmMwMTM4OWJlYjBdIGVsMF9zdmNfaGFuZGxlciBhdCBmZmZmZmZj
MDEwMDg4NmZjCgphbmQgSSB0ZXN0ZWQgQ2hhbydzIHBhdGNoIGNhbiBhdm9pZCB0aGUgYWJvdmUg
Y2FzZSwgcGxlYXNlIGhlbHAKY29uc2lkZXIgdGhpcyBwYXRjaCBvcgphbnkgY29tbWVudC9zdWdn
ZXN0aW9ucyBhYm91dCB0aGlzPwoKdGhhbmtzIQoKT24gTW9uLCBGZWIgMjYsIDIwMjQgYXQgOToy
MuKAr0FNIOeJm+W/l+WbvSAoWmhpZ3VvIE5pdSkgPFpoaWd1by5OaXVAdW5pc29jLmNvbT4gd3Jv
dGU6Cj4KPgo+IEhpIEphZWdldWsKPgo+IFNvcnJ5IGZvciBkaXN0dXJiaW5nIHlvdSwgRG8geW91
IGhhdmUgYW55IGNvbW1lbnRzIGFib3V0IHRoaXMgcGF0Y2ggZnJvbSBDaGFvLCBJ4oCZdmUgbWV0
IHRoaXMgaXNzdWUgc2V2ZXJhbCB0aW1lcyBvbiBvdXIgcGxhdGZvcm0gd2hlbiBkbyBtb25rZXkg
dGVzdC4KPiBUaGFua3MhCj4KPiAtLS0tLemCruS7tuWOn+S7ti0tLS0tCj4g5Y+R5Lu25Lq6OiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4g5Y+R6YCB5pe26Ze0OiAyMDI05bm0MuaciDE55pel
IDE1OjE5Cj4g5pS25Lu25Lq6OiBqYWVnZXVrQGtlcm5lbC5vcmcKPiDmioTpgIE6IGxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyDniZvlv5flm70gKFpoaWd1byBOaXUpIDxaaGlndW8uTml1QHVuaXNvYy5jb20+Cj4g5Li7
6aKYOiBSZTogW1BBVENIIHYzXSBmMmZzOiByZWR1Y2UgZXhwZW5zaXZlIGNoZWNrcG9pbnQgdHJp
Z2dlciBmcmVxdWVuY3kKPgo+Cj4g5rOo5oSPOiDov5nlsIHpgq7ku7bmnaXoh6rkuo7lpJbpg6jj
gILpmaTpnZ7kvaDnoa7lrprpgq7ku7blhoXlrrnlronlhajvvIzlkKbliJnkuI3opoHngrnlh7vk
u7vkvZXpk77mjqXlkozpmYTku7bjgIIKPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQg
ZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZS4KPgo+Cj4KPiBKYWVnZXVrLAo+Cj4gQW55IGNvbW1lbnRzPwo+
Cj4gT24gMjAyNC8xLzExIDE2OjE3LCBDaGFvIFl1IHdyb3RlOgo+ID4gV2UgbWF5IHRyaWdnZXIg
aGlnaCBmcmVxdWVudCBjaGVja3BvaW50IGZvciBiZWxvdyBjYXNlOgo+ID4gMS4gbWtkaXIgL21u
dC9kaXIxOyBzZXQgZGlyMSBlbmNyeXB0ZWQgMi4gdG91Y2ggL21udC9maWxlMTsgZnN5bmMKPiA+
IC9tbnQvZmlsZTEgMy4gbWtkaXIgL21udC9kaXIyOyBzZXQgZGlyMiBlbmNyeXB0ZWQgNC4gdG91
Y2ggL21udC9maWxlMjsKPiA+IGZzeW5jIC9tbnQvZmlsZTIgLi4uCj4gPgo+ID4gQWx0aG91Z2gs
IG5ld2x5IGNyZWF0ZWQgZGlyIGFuZCBmaWxlIGFyZSBub3QgcmVsYXRlZCwgZHVlIHRvIGNvbW1p
dAo+ID4gYmJmMTU2ZjdhZmE3ICgiZjJmczogZml4IGxvc3QgeGF0dHJzIG9mIGRpcmVjdG9yaWVz
IiksIHdlIHdpbGwgdHJpZ2dlcgo+ID4gY2hlY2twb2ludCB3aGVuZXZlciBmc3luYygpIGNvbWVz
IGFmdGVyIGEgbmV3IGVuY3J5cHRlZCBkaXIgY3JlYXRlZC4KPiA+Cj4gPiBJbiBvcmRlciB0byBh
dm9pZCBzdWNoIGNvbmRpdGlvbiwgbGV0J3MgcmVjb3JkIGFuIGVudHJ5IGluY2x1ZGluZwo+ID4g
ZGlyZWN0b3J5J3MgaW5vIGludG8gZ2xvYmFsIGNhY2hlIHdoZW4gd2UgaW5pdGlhbGl6ZSBlbmNy
eXB0aW9uIHBvbGljeQo+ID4gaW4gYSBjaGVja3BvaW50ZWQgZGlyZWN0b3J5LCBhbmQgdGhlbiBv
bmx5IHRyaWdnZXIgY2hlY2twb2ludCgpIHdoZW4KPiA+IHRhcmdldCBmaWxlJ3MgcGFyZW50IGhh
cyBub24tcGVyc2lzdGVkIGVuY3J5cHRpb24gcG9saWN5LCBmb3IgdGhlIGNhc2UKPiA+IGl0cyBw
YXJlbnQgaXMgbm90IGNoZWNrcG9pbnRlZCwgbmVlZF9kb19jaGVja3BvaW50KCkgaGFzIGNvdmVy
IHRoYXQgYnkKPiA+IHZlcmlmeWluZyBpdCB3aXRoIGYyZnNfaXNfY2hlY2twb2ludGVkX25vZGUo
KS4KPiA+Cj4gPiBSZXBvcnRlZC1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29t
Pgo+ID4gVGVzdGVkLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gPiBS
ZXBvcnRlZC1ieTogWXVubGVpIEhlIDxoZXl1bmxlaUBoaWhvbm9yLmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gdjM6Cj4gPiAtIFJl
Y2VudGx5LCBaaGlndW8gTml1IHJlcG9ydGVkIHRoZSBzYW1lIGlzc3VlLCBzbyBJIHJlcG9zdCB0
aGlzIHBhdGNoCj4gPiBmb3IgY29tbWVudHMuCj4gPiAgIGZzL2YyZnMvZjJmcy5oICAgICAgICAg
ICAgICB8ICAyICsrCj4gPiAgIGZzL2YyZnMvZmlsZS5jICAgICAgICAgICAgICB8ICAzICsrKwo+
ID4gICBmcy9mMmZzL3hhdHRyLmMgICAgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKy0tCj4g
PiAgIGluY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaCB8ICAzICsrLQo+ID4gICA0IGZpbGVzIGNo
YW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmggaW5kZXgKPiA+IGUyZTBjYTQ1Zjg4
MS4uMDA5NGE4Yzg1ZjRhIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPiA+ICsrKyBi
L2ZzL2YyZnMvZjJmcy5oCj4gPiBAQCAtMjc5LDYgKzI3OSw3IEBAIGVudW0gewo+ID4gICAgICAg
QVBQRU5EX0lOTywgICAgICAgICAgICAgLyogZm9yIGFwcGVuZCBpbm8gbGlzdCAqLwo+ID4gICAg
ICAgVVBEQVRFX0lOTywgICAgICAgICAgICAgLyogZm9yIHVwZGF0ZSBpbm8gbGlzdCAqLwo+ID4g
ICAgICAgVFJBTlNfRElSX0lOTywgICAgICAgICAgLyogZm9yIHRyYW5zYWN0aW9ucyBkaXIgaW5v
IGxpc3QgKi8KPiA+ICsgICAgIEVOQ19ESVJfSU5PLCAgICAgICAgICAgIC8qIGZvciBlbmNyeXB0
ZWQgZGlyIGlubyBsaXN0ICovCj4gPiAgICAgICBGTFVTSF9JTk8sICAgICAgICAgICAgICAvKiBm
b3IgbXVsdGlwbGUgZGV2aWNlIGZsdXNoaW5nICovCj4gPiAgICAgICBNQVhfSU5PX0VOVFJZLCAg
ICAgICAgICAvKiBtYXguIGxpc3QgKi8KPiA+ICAgfTsKPiA+IEBAIC0xMTQ3LDYgKzExNDgsNyBA
QCBlbnVtIGNwX3JlYXNvbl90eXBlIHsKPiA+ICAgICAgIENQX0ZBU1RCT09UX01PREUsCj4gPiAg
ICAgICBDUF9TUEVDX0xPR19OVU0sCj4gPiAgICAgICBDUF9SRUNPVkVSX0RJUiwKPiA+ICsgICAg
IENQX0VOQ19ESVIsCj4gPiAgIH07Cj4gPgo+ID4gICBlbnVtIGlvc3RhdF90eXBlIHsKPiA+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jIGluZGV4Cj4gPiA4MTk4
YWZiNWZiOWMuLjE4YjMzYjFmMGM4MyAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4g
PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+ID4gQEAgLTIxOCw2ICsyMTgsOSBAQCBzdGF0aWMgaW5s
aW5lIGVudW0gY3BfcmVhc29uX3R5cGUgbmVlZF9kb19jaGVja3BvaW50KHN0cnVjdCBpbm9kZSAq
aW5vZGUpCj4gPiAgICAgICAgICAgICAgIGYyZnNfZXhpc3Rfd3JpdHRlbl9kYXRhKHNiaSwgRjJG
U19JKGlub2RlKS0+aV9waW5vLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgVFJBTlNfRElSX0lOTykpCj4gPiAgICAgICAgICAgICAgIGNw
X3JlYXNvbiA9IENQX1JFQ09WRVJfRElSOwo+ID4gKyAgICAgZWxzZSBpZiAoZjJmc19leGlzdF93
cml0dGVuX2RhdGEoc2JpLCBGMkZTX0koaW5vZGUpLT5pX3Bpbm8sCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFTkNfRElSX0lOTykpCj4g
PiArICAgICAgICAgICAgIGNwX3JlYXNvbiA9IENQX0VOQ19ESVI7Cj4gPgo+ID4gICAgICAgcmV0
dXJuIGNwX3JlYXNvbjsKPiA+ICAgfQo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMveGF0dHIuYyBi
L2ZzL2YyZnMveGF0dHIuYyBpbmRleAo+ID4gZjI5MGZlOTMyN2M0Li5jYmQxYjg4Mjk3ZmUgMTAw
NjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL3hhdHRyLmMKPiA+ICsrKyBiL2ZzL2YyZnMveGF0dHIuYwo+
ID4gQEAgLTYyOSw2ICs2MjksNyBAQCBzdGF0aWMgaW50IF9fZjJmc19zZXR4YXR0cihzdHJ1Y3Qg
aW5vZGUgKmlub2RlLCBpbnQgaW5kZXgsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
Y2hhciAqbmFtZSwgY29uc3Qgdm9pZCAqdmFsdWUsIHNpemVfdCBzaXplLAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBwYWdlICppcGFnZSwgaW50IGZsYWdzKQo+ID4gICB7Cj4gPiAr
ICAgICBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+ID4gICAg
ICAgc3RydWN0IGYyZnNfeGF0dHJfZW50cnkgKmhlcmUsICpsYXN0Owo+ID4gICAgICAgdm9pZCAq
YmFzZV9hZGRyLCAqbGFzdF9iYXNlX2FkZHI7Cj4gPiAgICAgICBpbnQgZm91bmQsIG5ld3NpemU7
Cj4gPiBAQCAtNzcyLDggKzc3MywxOSBAQCBzdGF0aWMgaW50IF9fZjJmc19zZXR4YXR0cihzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBpbnQgaW5kZXgsCj4gPiAgICAgICBpZiAoaW5kZXggPT0gRjJGU19Y
QVRUUl9JTkRFWF9FTkNSWVBUSU9OICYmCj4gPiAgICAgICAgICAgICAgICAgICAgICAgIXN0cmNt
cChuYW1lLCBGMkZTX1hBVFRSX05BTUVfRU5DUllQVElPTl9DT05URVhUKSkKPiA+ICAgICAgICAg
ICAgICAgZjJmc19zZXRfZW5jcnlwdGVkX2lub2RlKGlub2RlKTsKPiA+IC0gICAgIGlmIChTX0lT
RElSKGlub2RlLT5pX21vZGUpKQo+ID4gLSAgICAgICAgICAgICBzZXRfc2JpX2ZsYWcoRjJGU19J
X1NCKGlub2RlKSwgU0JJX05FRURfQ1ApOwo+ID4gKwo+ID4gKyAgICAgaWYgKFNfSVNESVIoaW5v
ZGUtPmlfbW9kZSkpIHsKPiA+ICsgICAgICAgICAgICAgLyoKPiA+ICsgICAgICAgICAgICAgICog
SW4gcmVzdHJpY3QgbW9kZSwgZnN5bmMoKSBhbHdheXMgdHJpZXMgdHJpZ2dlcmluZyBjaGVja3Bv
aW50Cj4gPiArICAgICAgICAgICAgICAqIGZvciBhbGwgbWV0YWRhdGEgY29uc2lzdGVuY3ksIGlu
IG90aGVyIG1vZGUsIGl0IG9ubHkgdHJpZ2dlcnMKPiA+ICsgICAgICAgICAgICAgICogY2hlY2tw
b2ludCB3aGVuIHBhcmVudCdzIGVuY3J5cHRpb24gbWV0YWRhdGEgdXBkYXRlcy4KPiA+ICsgICAg
ICAgICAgICAgICovCj4gPiArICAgICAgICAgICAgIGlmIChGMkZTX09QVElPTihzYmkpLmZzeW5j
X21vZGUgPT0gRlNZTkNfTU9ERV9TVFJJQ1QpCj4gPiArICAgICAgICAgICAgICAgICAgICAgc2V0
X3NiaV9mbGFnKEYyRlNfSV9TQihpbm9kZSksIFNCSV9ORUVEX0NQKTsKPiA+ICsgICAgICAgICAg
ICAgZWxzZSBpZiAoSVNfRU5DUllQVEVEKGlub2RlKSAmJgo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGYyZnNfaXNfY2hlY2twb2ludGVkX25vZGUoc2JpLCBpbm9kZS0+aV9pbm8pKQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIGYyZnNfYWRkX2lub19lbnRyeShzYmksIGlub2RlLT5pX2lubywg
RU5DX0RJUl9JTk8pOwo+ID4gKyAgICAgfQo+ID4KPiA+ICAgc2FtZToKPiA+ICAgICAgIGlmIChp
c19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQUNMX01PREUpKSB7IGRpZmYgLS1naXQKPiA+IGEv
aW5jbHVkZS90cmFjZS9ldmVudHMvZjJmcy5oIGIvaW5jbHVkZS90cmFjZS9ldmVudHMvZjJmcy5o
IGluZGV4Cj4gPiA3ZWQwZmM0MzBkYzYuLjQ4ZjJlMzk5ZTE4NCAxMDA2NDQKPiA+IC0tLSBhL2lu
Y2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaAo+ID4gKysrIGIvaW5jbHVkZS90cmFjZS9ldmVudHMv
ZjJmcy5oCj4gPiBAQCAtMTM5LDcgKzEzOSw4IEBAIFRSQUNFX0RFRklORV9FTlVNKEVYX0JMT0NL
X0FHRSk7Cj4gPiAgICAgICAgICAgICAgIHsgQ1BfTk9ERV9ORUVEX0NQLCAgICAgICJub2RlIG5l
ZWRzIGNwIiB9LCAgICAgICAgICAgICAgXAo+ID4gICAgICAgICAgICAgICB7IENQX0ZBU1RCT09U
X01PREUsICAgICAiZmFzdGJvb3QgbW9kZSIgfSwgICAgICAgICAgICAgIFwKPiA+ICAgICAgICAg
ICAgICAgeyBDUF9TUEVDX0xPR19OVU0sICAgICAgImxvZyB0eXBlIGlzIDIiIH0sICAgICAgICAg
ICAgICBcCj4gPiAtICAgICAgICAgICAgIHsgQ1BfUkVDT1ZFUl9ESVIsICAgICAgICJkaXIgbmVl
ZHMgcmVjb3ZlcnkiIH0pCj4gPiArICAgICAgICAgICAgIHsgQ1BfUkVDT1ZFUl9ESVIsICAgICAg
ICJkaXIgbmVlZHMgcmVjb3ZlcnkiIH0sICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICB7IENQ
X0VOQ19ESVIsICAgICAgICAgICAicGVyc2lzdCBlbmNyeXB0aW9uIHBvbGljeSIgfSkKPiA+Cj4g
PiAgICNkZWZpbmUgc2hvd19zaHV0ZG93bl9tb2RlKHR5cGUpICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ID4gICAgICAgX19wcmludF9zeW1ib2xpYyh0eXBlLCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
