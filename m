Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7EC674A8C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Jan 2023 05:28:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIj0m-0004tl-04;
	Fri, 20 Jan 2023 04:28:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rob@landley.net>) id 1pIj0k-0004tf-PO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 04:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WxJtcfmjg8bDlWo77QXfqDNdo8CBClhx9W/RQtlqbwY=; b=NgSGFXLt6RrSEuLCe/VYd0KGN/
 V6mC4Nj2Odryvyy7fAAbm/1NzFIzNhmeOsVSWKe4ukHO2THe3J5rGRtShIrYdVbH8ftbz2oJ1C61s
 nN6ECRPb301yFa/DqjtDfwAD8C9pPv45tXDW9Q0DVJn0CW+nVfGn8weFIHZGWT2swSn0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WxJtcfmjg8bDlWo77QXfqDNdo8CBClhx9W/RQtlqbwY=; b=Ylkz/a0w6s/4l5nVWFXS6OnuvY
 Vg7wqU4sWht5Z9jZ06QiGIbN0R0PzJlvGxYuxwkYvf7m2N0W4dKHKrq5H/QhFnggwes+pghpIMwE8
 rMqT8JtSGAPDKwX2dUS5J63CepqM5tXXRmlafHlS7OX3s/pc33nk0T81SM9RmApji1jE=;
Received: from mail-qt1-f176.google.com ([209.85.160.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pIj0c-009qSz-ME for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 04:28:18 +0000
Received: by mail-qt1-f176.google.com with SMTP id e8so3365900qts.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Jan 2023 20:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WxJtcfmjg8bDlWo77QXfqDNdo8CBClhx9W/RQtlqbwY=;
 b=195AXt9odDu2myrtF32+GBb0qMFgjNikCrpxsa+WbA8hIOrugiKzMmRa6ck9jEEnh+
 BAiMUjeACSwa7DIsy0nd31WMLgqeemkaP54UGh/z5/4/iE4OKfk/JF3Mfjc9Slk04hNo
 yl5Eob9OFP8rjo94KXNck41rTFVGwR12Dn+yA5SLoZAqZ3VzofVm+vx+0BgQAYSmr785
 93R2tgLtdgq0ZrmMjpy2ltpjwYB3CfaG5BeK8n4rbY9oAJxrmKWOuImd3ZYcTj/FPdb2
 jJLXFRha+Q7ERnsBZifTFijpda8XPNDI9gPItiLsvkjmbQtAsn8L1qQF4XOocbXXc8zc
 lOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WxJtcfmjg8bDlWo77QXfqDNdo8CBClhx9W/RQtlqbwY=;
 b=5kZJrvzeuz+BPor7mkYaeZkV1x/imUfF3zvSG92dw0LsK5979Wc4TXMB34672UsRXi
 F/TSMgmJn6xFi0x22TfoXquGeGpmsWeEZM7ISpnhwoB93g5Twbg3GMr4K/24Tu8wDTc8
 Bi54wz9Ez1yZUDBtVBJANoqlb1o1PzbB9dlc9wuM+MKU3g5i/XP1twGvoLQQMLgbE8sw
 VXXKxhm2pP/xbh4MFKtCxwcPB43xj5FzYo61l06t2tMTELCnYXpvcgy+hIs+SyMGBpq9
 Hyx7RpaGK7xxbw/jQjPTmbnEwTZF80+gBFJn5sECGcxbjqrx9FvAww7ntYP1HINrMaav
 bGfQ==
X-Gm-Message-State: AFqh2krSEzBeyMp77YycLKORCEPSMnN6AyZqBPsiWpua8OTs1FDKcfC5
 jD85ddT4wrzaw6F6egGCjjXX9OxxkXy80OZvQlcKwg==
X-Google-Smtp-Source: AMrXdXsEe/2+E0aFpK50BI2W31LvjkQnB05BvrClqgL71HBhXQ2hq9P1I+orXsNyKBoEZPHv4iTJdA==
X-Received: by 2002:a9d:704f:0:b0:685:579f:918e with SMTP id
 x15-20020a9d704f000000b00685579f918emr6930248otj.0.1674184742349; 
 Thu, 19 Jan 2023 19:19:02 -0800 (PST)
Received: from ?IPV6:2607:fb90:f20b:1885:28a8:1eff:fe1b:3320?
 ([2607:fb90:f20b:1885:28a8:1eff:fe1b:3320])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a9d73c6000000b006860be3a43fsm7631822otk.14.2023.01.19.19.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 19:19:01 -0800 (PST)
Message-ID: <0f51dac4-836b-0ff2-38c6-5521745c1c88@landley.net>
Date: Thu, 19 Jan 2023 21:31:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "Michael.Karcher" <Michael.Karcher@fu-berlin.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
 <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
 <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
 <CAMuHMdWbBRkhecrqcir92TgZnffMe8ku2t7PcVLqA6e6F-j=iw@mail.gmail.com>
 <429140e0-72fe-c91c-53bc-124d33ab5ffa@physik.fu-berlin.de>
 <CAMuHMdWpHSsAB3WosyCVgS6+t4pU35Xfj3tjmdCDoyS2QkS7iw@mail.gmail.com>
 <0d238f02-4d78-6f14-1b1b-f53f0317a910@physik.fu-berlin.de>
 <1732342f-49fe-c20e-b877-bc0a340e1a50@fu-berlin.de>
From: Rob Landley <rob@landley.net>
In-Reply-To: <1732342f-49fe-c20e-b877-bc0a340e1a50@fu-berlin.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 1/19/23 16:11, Michael.Karcher wrote: > Isn't this supposed
    to be caught by this check: >>>> >>>>          a, __same_type(a,
   NULL) >>>> >>>> ? >>> >>> Yeah, but gcc thinks it is smarter tha [...] 
 
 Content analysis details:   (-0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.160.176 listed in wl.mailspike.net]
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.176 listed in list.dnswl.org]
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pIj0c-009qSz-ME
Subject: Re: [f2fs-dev] Calculating array sizes in C - was: Re: Build
 regressions/improvements in v6.2-rc1
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
Cc: linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-sh@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAxLzE5LzIzIDE2OjExLCBNaWNoYWVsLkthcmNoZXIgd3JvdGU6Cj4gSXNuJ3QgdGhpcyBz
dXBwb3NlZCB0byBiZSBjYXVnaHQgYnkgdGhpcyBjaGVjazoKPj4+Pgo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqAgYSwgX19zYW1lX3R5cGUoYSwgTlVMTCkKPj4+Pgo+Pj4+ID8KPj4+Cj4+PiBZZWFoLCBi
dXQgZ2NjIHRoaW5rcyBpdCBpcyBzbWFydGVyIHRoYW4gdXMuLi4KPj4+IFByb2JhYmx5IGl0IGRy
b3BzIHRoZSB0ZXN0LCBhc3N1bWluZyBVQiBjYW5ub3QgaGFwcGVuLgo+PiBIbW0sIHNvdW5kcyBs
aWtlIGEgR0dDIGJ1ZyB0byBtZSB0aGVuLiBOb3Qgc3VyZSBob3cgdG8gZml4IHRoaXMgdGhlbi4K
PiAKPiAKPiBJIGRvbid0IHNlZSBhIGNsZWFyIGJ1ZyBhdCB0aGlzIHBvaW50LiBXZSBhcmUgdGFs
a2luZyBhYm91dCB0aGUgQyBleHByZXNzaW9uCj4gCj4gIMKgIF9fc2FtZV90eXBlKCh2b2lkKikw
LCAodm9pZCopMCk/IDAgOiBzaXplb2YoKHZvaWQqKTApL3NpemVvZigqKCh2b2lkKjApKQoKKih2
b2lkKikgaXMgdHlwZSAidm9pZCIgd2hpY2ggZG9lcyBub3QgaGF2ZSBhIHNpemUuCgpUaGUgcHJv
YmxlbSBpcyBnY2MgIm9wdGltaXppbmcgb3V0IiBhbiBlYXJsaWVyIHR5cGUgY2hlY2ssIHRoZSBz
YW1lIHdheSBpdAoib3B0aW1pemVzIG91dCIgY2hlY2tzIGZvciBzaWduZWQgaW50ZWdlciBtYXRo
IG92ZXJmbG93aW5nLCBvciAib3B0aW1pemVzIG91dCIgYQpjb21wYXJpc29uIHRvIHBvaW50ZXJz
IGZyb20gdHdvIGRpZmZlcmVudCBsb2NhbCB2YXJpYWJsZXMgZnJvbSBkaWZmZXJlbnQKZnVuY3Rp
b24gY2FsbHMgdHJ5aW5nIHRvIGNhbGN1bGF0ZSB0aGUgYW1vdW50IG9mIHN0YWNrIHVzZWQsIG9y
ICJvcHRpbWl6ZXMgb3V0Igp1c2luZyBjaGFyICp4ID0gKGNoYXIgKikxOyBhcyBhIGZsYWcgdmFs
dWUgYW5kIHRoZW4gZG9pbmcgImlmICghKHgtMSkpIGJlY2F1c2UKaXQgY2FuICJuZXZlciBoYXBw
ZW4iLi4uCj4gSSBzdWdnZXN0IHRvIGZpbGUgYSBidWcgYWdhaW5zdCBnY2MgY29tcGxhaW5pbmcg
YWJvdXQgYSAic3B1cmlvdXMgCj4gd2FybmluZyIsIGFuZCB1c2luZyAiLVdlcnJvciAtV25vLWVy
cm9yLXNpemVvZi1wb2ludGVyLWRpdiIgdW50aWwgZ2NjIGlzIAo+IGFkYXB0ZWQgdG8gbm90IGVt
aXQgdGhlIHdhcm5pbmcgYWJvdXQgdGhlIHBvaW50ZXIgZGl2aXNpb24gaWYgdGhlIHJlc3VsdCAK
PiBpcyBub3QgdXNlZC4KClJlbWVtYmVyIHdoZW4gZ2NjIGdvdCByZXdyaXR0ZW4gaW4gYysrIHN0
YXJ0aW5nIGluIDIwMDc/CgpIaXN0b3JpY2FsbHkgdGhlIG1haW4gbWFya2V0aW5nIHB1c2ggb2Yg
QysrIHdhcyB0aGF0IGl0IGNvbnRhaW5zIHRoZSB3aG9sZSBvZiBDCmFuZCB0aGVyZWZvcmUgTVVT
VCBiZSBqdXN0IGFzIGdvb2QgYSBsYW5ndWFnZSwgdGhlIHNhbWUgd2F5IGEgbXVkIHBpZSBjb250
YWlucwphbiBlbnRpcmUgZ2xhc3Mgb2Ygd2F0ZXIgYW5kIHRoZXJlZm9yZSBNVVNUIGJlIGp1c3Qg
YXMgZ29vZCBhIGJldmVyYWdlLiBBbnl0aGluZwpDIGNhbiBkbyB0aGF0IEMrKyBfY2FuJ3RfIGRv
IGlzIHNlZW4gYXMgYW4gZXhpc3RlbnRpYWwgdGhyZWF0IGJ5IEMrKyBkZXZlbG9wZXJzLgpUaGV5
J3ZlIHdvcmtlZCBkaWxsaWdlbnRseSB0byAiZml4IiBDIG5vdCBiZWluZyBhIGdpYW50IHBpbGUg
b2YgInVuZGVmaW5lZApiZWhhdmlvciIgdGhlIHdheSBDKysgaXMgZm9yIDE1IHllYXJzIG5vdy4K
CkkgaGF2ZS4uLiBvcGluaW9ucyBvbiB0aGlzLgoKPiBSZWdhcmRzLAo+ICDCoCBNaWNoYWVsIEth
cmNoZXIKClJvYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
