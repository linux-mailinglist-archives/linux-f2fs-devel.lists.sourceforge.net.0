Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC011116198
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 Dec 2019 14:16:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1idwQ5-0006YG-9j; Sun, 08 Dec 2019 13:16:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <glqinhongwei@gmail.com>) id 1idwQ4-0006Y8-5H
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Dec 2019 13:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cewNBaUujx1A4WvRtVGyymbYOU9ROei7SC5S0+EMppQ=; b=FEWUeCFk8ejaWvFUtCTI2sc6se
 9MpkZzcHCXzjJ7gidMFcdiOLZ0IthYVMAELZIHByzMxnlhU0N3pgo2wBNdBMqP30CL/cy4S30qcel
 dbzf9WyaJWtxEoGQBwmXESqp5Yml9Ex9MKC8VbvVOzFYzZsufkW7eKYa2EL1q1+q8Eig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cewNBaUujx1A4WvRtVGyymbYOU9ROei7SC5S0+EMppQ=; b=Ump9GLHmVgw5gkkzoOPajUvu6g
 PCWgHGnnQALqxwJq9/9DXDU2htybSJrsxkWMLqyByw/jJ9wrhnA365ULw67ICacHRTc/HA++Im09j
 keG1ctOl3S0VyV99OiQwpmNO+QLWtdCbEew4mm+BwT4dzDHdpeh+XWokPIFVcHq0NIZw=;
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1idwQ0-00EFi4-I5
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Dec 2019 13:16:16 +0000
Received: by mail-io1-f67.google.com with SMTP id u7so11950656iop.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 08 Dec 2019 05:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cewNBaUujx1A4WvRtVGyymbYOU9ROei7SC5S0+EMppQ=;
 b=LKH3hpNCprlSBtq+rc7iqWEgsnJAY7S4mIJT3bwywQ6jUaqan8AJNVXS4VTRGxAX00
 2JcSsDzuTRxYhHqTysE3d4jmmrq27d3a+2IWBV0X70SgW26MIbDPE/DmAQWgcrw1u6gr
 0tGSPMxBfD8DWm08ekN5qmE9yg3hyFHDxfi/j6c6UK1a4spqn8r0vL0MQsu9swvZKOYG
 SQTQ3xdkNem0ZmEGmlAFOQi3rmvsq24hMxD64V8H8IJnzKvmv1jN079q+2VfqzIj6BIH
 xEjACzroaxhSC7XoB2eXLKfEQVszCeCUFHa4qkwiFnADUriIXXc6KABciHEmJTUzWSp+
 NqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cewNBaUujx1A4WvRtVGyymbYOU9ROei7SC5S0+EMppQ=;
 b=HT9p+BU033PVV15vbpcQl9k355FKmotC3qFI1j75SSbVSh6Pfy2ROt9FbW0y5bPmAy
 YB1CL87muhWxxzVkMo7nutDsYbmfrx/oiJeqCwrLCH60Wioo/OF21s+9U3codDbHNDLd
 Ys8c3Nr/UQYuNuwjCt4RBKKRuF7GmJqiKLTTeyzAPed6AtFt0ofrF44+Vjg7j2WgEjpr
 dosuzemIDE+Gtey6vbXViyiVBdxltoUUUta+3WUY/K89nJy2An6SPo1b1Mqq6EmRaIuo
 awkF7cFlyfRN0id06GOn/ijJXzq+hpIaobBOn+jDj2xzL8zJa8sYVkMR2vgURQqBDsb3
 UWhA==
X-Gm-Message-State: APjAAAX9xBqQYZjNlVK0Myoa8DvQ2SK+AFKn3W96Z+dVrP4Piqs+2olQ
 eXrFAPcOlxKCn+82dLzWowwzeUd1vonGvrYMmi/GoernJmrVJg==
X-Google-Smtp-Source: APXvYqyUXj0OQt72UIOaME6kJmugLNpIX/XGSPlFKDLAIBrUPl9p/UttB4QDh3QACg8K2QiVS1WKu5E4lhTDBicZRrg=
X-Received: by 2002:a05:6602:114:: with SMTP id
 s20mr7722721iot.131.1575810966669; 
 Sun, 08 Dec 2019 05:16:06 -0800 (PST)
MIME-Version: 1.0
References: <tencent_0B38BD6C2739091DE8A052D6D772D1DEAA06@qq.com>
 <4ef45a4b-47fa-4d7e-a060-4cad56ca372a@kernel.org>
In-Reply-To: <4ef45a4b-47fa-4d7e-a060-4cad56ca372a@kernel.org>
From: Hongwei Qin <glqinhongwei@gmail.com>
Date: Sun, 8 Dec 2019 21:15:55 +0800
Message-ID: <CAKvRR0QoH2RAEzb9ki8GVUX22omST-Z2kq287i0fXmYXC7XCLw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (glqinhongwei[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: usenix.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1idwQ0-00EFi4-I5
Subject: Re: [f2fs-dev] Potential data corruption?
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
Cc: linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksCgpPbiBTdW4sIERlYyA4LCAyMDE5IGF0IDEyOjAxIFBNIENoYW8gWXUgPGNoYW9Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IE9uIDIwMTktMTItNyAxODoxMCwg57qi54On55qE
5aiB5YyW6aW8IHdyb3RlOgo+ID4gSGkgRjJGUyBleHBlcnRzLAo+ID4gVGhlIGZvbGxvd2luZyBj
b25mdXNlcyBtZToKPiA+Cj4gPiBBIHR5cGljYWwgZnN5bmMoKSBnb2VzIGxpa2UgdGhpczoKPiA+
IDEpIElzc3VlIGRhdGEgYmxvY2sgSU9zCj4gPiAyKSBXYWl0IGZvciBjb21wbGV0aW9uCj4gPiAz
KSBJc3N1ZSBjaGFpbmVkIG5vZGUgYmxvY2sgSU9zCj4gPiA0KSBXYWl0IGZvciBjb21wbGV0aW9u
Cj4gPiA1KSBJc3N1ZSBmbHVzaCBjb21tYW5kCj4gPgo+ID4gSW4gb3JkZXIgdG8gcHJlc2VydmUg
ZGF0YSBjb25zaXN0ZW5jeSB1bmRlciBzdWRkZW4gcG93ZXIgZmFpbHVyZSwgaXQgcmVxdWlyZXMg
dGhhdCB0aGUgc3RvcmFnZSBkZXZpY2UgcGVyc2lzdHMgZGF0YSBibG9ja3MgcHJpb3IgdG8gbm9k
ZSBibG9ja3MuCj4gPiBPdGhlcndpc2UsIHVuZGVyIHN1ZGRlbiBwb3dlciBmYWlsdXJlLCBpdCdz
IHBvc3NpYmxlIHRoYXQgdGhlIHBlcnNpc3RlZCBub2RlIGJsb2NrIHBvaW50cyB0byBOVUxMIGRh
dGEgYmxvY2tzLgo+Cj4gRmlyc3RseSBpdCBkb2Vzbid0IGJyZWFrIFBPU0lYIHNlbWFudGljcywg
cmlnaHQ/IHNpbmNlIGZzeW5jKCkgZGlkbid0IHJldHVybgo+IHN1Y2Nlc3NmdWxseSBiZWZvcmUg
c3VkZGVuIHBvd2VyLWN1dCwgc28gd2UgY2FuIG5vdCBndWFyYW50ZWUgdGhhdCBkYXRhIGlzIGZ1
bGx5Cj4gcGVyc2lzdGVkIGluIHN1Y2ggY29uZGl0aW9uLgo+Cj4gSG93ZXZlciwgd2hhdCB5b3Ug
d2FudCBsb29rcyBsaWtlIGF0b21pYyB3cml0ZSBzZW1hbnRpY3MsIHdoaWNoIG1vc3RseSBkYXRh
YmFzZQo+IHdhbnQgdG8gZ3VhcmFudGVlIGR1cmluZyBkYiBmaWxlIHVwZGF0ZS4KPgo+IEYyRlMg
aGFzIHN1cHBvcnQgYXRvbWljX3dyaXRlIHZpYSBpb2N0bCwgd2hpY2ggaXMgdXNlZCBieSBTUUxp
dGUgb2ZmaWNpYWxseSwgSQo+IGd1ZXNzIHlvdSBjYW4gY2hlY2sgaXRzIGltcGxlbWVudGF0aW9u
IGRldGFpbC4KPgo+IFRoYW5rcywKPgoKVGhhbmtzIGZvciB5b3VyIGtpbmQgcmVwbHkuCkl0J3Mg
dHJ1ZSB0aGF0IGlmIHdlIG1lZXQgcG93ZXIgZmFpbHVyZSBiZWZvcmUgZnN5bmMoKSBjb21wbGV0
ZXMsClBPU0lYIGRvZW4ndCByZXF1aXJlIEZTIHRvIHJlY292ZXIgdGhlIGZpbGUuIEhvd2V2ZXIs
IGNvbnNpZGVyIHRoZQpmb2xsb3dpbmcgc2l0dWF0aW9uOgoKMSkgRGF0YSBibG9jayBJT3MgKE5v
dCBwZXJzaXN0ZWQpCjIpIE5vZGUgYmxvY2sgSU9zIChBbGwgUGVyc2lzdGVkKQozKSBQb3dlciBm
YWlsdXJlCgpTaW5jZSB0aGUgbm9kZSBibG9ja3MgYXJlIGFsbCBwZXJzaXN0ZWQgYmVmb3JlIHBv
d2VyIGZhaWx1cmUsIHRoZSBub2RlCmNoYWluIGlzbid0IGJyb2tlbi4gTm90ZSB0aGF0IHRoaXMg
ZmlsZSdzIG5ldyBkYXRhIGlzIG5vdCBwcm9wZXJseQpwZXJzaXN0ZWQgYmVmb3JlIGNyYXNoLiBT
byB0aGUgcmVjb3ZlcnkgcHJvY2VzcyBzaG91bGQgYmUgYWJsZSB0bwpyZWNvZ25pemUgdGhpcyBz
aXR1YXRpb24gYW5kIGF2b2lkIHJlY292ZXIgdGhpcyBmaWxlLiBIb3dldmVyLCBzaW5jZQp0aGUg
bm9kZSBjaGFpbiBpcyBub3QgYnJva2VuLCBwZXJoYXBzIHRoZSByZWNvdmVyeSBwcm9jZXNzIHdp
bGwgcmVnYXJkCnRoaXMgZmlsZSBhcyByZWNvdmVyYWJsZT8KClRoYW5rcyEKCj4gPgo+ID4gSG93
ZXZlciwgYWNjb3JkaW5nIHRvIHRoaXMgc3R1ZHkgKGh0dHBzOi8vd3d3LnVzZW5peC5vcmcvY29u
ZmVyZW5jZS9mYXN0MTgvcHJlc2VudGF0aW9uL3dvbiksIHRoZSBwZXJzaXN0ZW50IG9yZGVyIG9m
IHJlcXVlc3RzIGRvZXNuJ3QgbmVjZXNzYXJpbHkgZXF1YWxzIHRvIHRoZSByZXF1ZXN0IGZpbmlz
aCBvcmRlciAoZHVlIHRvIGRldmljZSB2b2xhdGlsZSBjYWNoZXMpLiBUaGlzIG1lYW5zIHRoYXQg
aXRzIHBvc3NpYmxlIHRoYXQgdGhlIG5vZGUgYmxvY2tzIGdldCBwZXJzaXN0ZWQgcHJpb3IgdG8g
ZGF0YSBibG9ja3MuCj4gPgo+ID4gRG9lcyBGMkZTIGhhdmUgb3RoZXIgbWVjaGFuaXNtcyB0byBw
cmV2ZW50IHN1Y2ggaW5jb25zaXN0ZW5jeT8gT3IgZG9lcyBpdCByZXF1aXJlIHRoZSBkZXZpY2Ug
dG8gcGVyc2lzdCBkYXRhIHdpdGhvdXQgcmVvcmRlcmluZz8KPiA+Cj4gPiBUaGFua3MhCj4gPgo+
ID4gSG9uZ3dlaQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiA+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+ID4KPgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
