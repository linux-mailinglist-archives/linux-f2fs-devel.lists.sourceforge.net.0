Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 580E278168B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 19 Aug 2023 04:06:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qXBMU-0000He-Pv;
	Sat, 19 Aug 2023 02:06:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <groeck7@gmail.com>) id 1qXBMS-0000HW-H8
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 19 Aug 2023 02:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J58C6UQSEf9y+XiorzJqo/qZ1VXEXwZ07S7scdpEOcE=; b=aOLFd278YLusp3cLpc3sVlwSlb
 r+M3WKZZUxCENuRgeHwdODJUoWmSEISmE7bEo29M/iZUY0rQSZWthJDkec+GCY14Bqtqd0lHMd7Za
 t6YDdGirUdPOdnD6m3F6BRo54Hb8bKnuFlX8TRCFxJ/6fLNnLbeis6oPdA0voaUCy+Ds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J58C6UQSEf9y+XiorzJqo/qZ1VXEXwZ07S7scdpEOcE=; b=lyN0PgP2BCxd5JYhuFa/xSOjTz
 DTBdwwjmn8jBnBpuNEJNLK/uTURWHdzLM8Tvo0CvtYljBM3a0CgR7MHLeTV7Lc+B6xo9eD9eK14q/
 rg/PGOGpI5gq/lA0MSwXCBKEddheQM2XfSs6ZYU/TPHo4WfEFDqCa72yXDtjl2hQmiHc=;
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qXBMN-0003D6-KX for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 19 Aug 2023 02:06:44 +0000
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3a7ca8720a0so1057673b6e.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Aug 2023 19:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692410794; x=1693015594;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J58C6UQSEf9y+XiorzJqo/qZ1VXEXwZ07S7scdpEOcE=;
 b=BKvGqZXRK07QPeq8wEwy8iDVGqycZ1dShOjhSruheVby+Z6dMqsbMzIAVVxPuXEV1P
 Ei+4NcMsXbpWF9iCQNvHYHXX7D2Yk9gEQQ8rwEGtEdmg3TBbcknVLbxTKL3uZ3sCNYz1
 cXMkGUngE1KUCAUFKo+u4ltK4M5YbEfuimly4VVgbidkkBEpDanR7QHcKGMmC5wKT7ap
 NHlB4+a2HXe62HXxY219eEpUXHaaCqMkgchgK/oHtJDiroviJN/2M4aYfBlz7WM2tQqy
 soTIIbOH7TXLsux6zGAmZkgm4jjlKZbSWrACK3zNAtJQMP/2cw4H+f7A7agDXgUC37XQ
 BHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692410794; x=1693015594;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J58C6UQSEf9y+XiorzJqo/qZ1VXEXwZ07S7scdpEOcE=;
 b=emP/s8KcDc0v9vvp8rxkzIclKVJFt3e16j7rM9WymAUzv9TkNVKB46EPjPAK4DhfFx
 bt1yVX7yUQ3pSlVgbyfFDvWytv6zp/j8KdXyYlhWL9vT/BOHbQNuZyGebTrI53ptcdjz
 Ynw0A5pbMQSYBqHQy4yU4VEi1uYi17nGH6fenRw05fTzC914NiEktwrcOykXqm+IBGdE
 KghgsLCtbSGkmBJI852RT5nqX9C8sTqQs486KwOox6vWjT3C0pA5nWtKRg5/yY0wH/ni
 8XxmzyofS2cGlo0Ftpu7k/o2JHsVOS1WGJ44P8fd/hXwjcQzzQLBt5IaBwiIyyunFC9N
 1/yg==
X-Gm-Message-State: AOJu0YwwoK6TqeM+KLBnUoVz35VamLhcZTJc6LU3gfqnQjpJJ5L/U5WQ
 BSHJ2X8v3jfVd3CNOHLNOgtwgBVise8=
X-Google-Smtp-Source: AGHT+IGDvwON7LLkO1ZD40WjitLgx675t6mp59Dcy5z/fyC5wBFIxPSHUPhmnGZvAOrxE/BDcgaNig==
X-Received: by 2002:a05:6808:164e:b0:3a7:1962:d7ff with SMTP id
 az14-20020a056808164e00b003a71962d7ffmr993781oib.57.1692410793928; 
 Fri, 18 Aug 2023 19:06:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 x17-20020aa79191000000b00682a908949bsm2213866pfa.92.2023.08.18.19.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 19:06:33 -0700 (PDT)
Date: Fri, 18 Aug 2023 19:06:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <22fab316-237c-4363-b968-96e8307cdd59@roeck-us.net>
References: <ae78956b-0c55-4980-8ec4-5cccf7e69c16@roeck-us.net>
 <CAOtxgyeE+PLWVCTMHbr6OgwXY5MB1vPmauY2wcvEZdW8OhM-YQ@mail.gmail.com>
 <93fee6c4-fb2b-49eb-ab54-e77603289f6a@roeck-us.net>
 <CAOtxgychpamcvMDtOcX=ZGsL8WPfYfLAjCRg-YAnEHYDBva+7g@mail.gmail.com>
 <63722b9f-b510-50a7-8839-6ada783d2164@kernel.org>
 <20230817155319.GA1483@sol.localdomain>
 <700c2e58-d2fe-47c6-85a8-aa7f7b1613cf@roeck-us.net>
 <CAOtxgyedoExF5yfJO6BkU6fYjJMpfJBDuEuG_2rjyT7o9qcX4Q@mail.gmail.com>
 <ZOAOTcUAskB+F5ez@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOAOTcUAskB+F5ez@google.com>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 18, 2023 at 05:35:25PM -0700, Jaegeuk Kim wrote:
 > May I know if this works? > >
 https://lore.kernel.org/linux-f2fs-devel/20230819003012.3473675-1-jaegeuk@kernel.org/T/#u
 > Yes, that fixes the problem for me. That makes me wonder, though: Why not
 just use the _nested functions unconditionally ? 
 Content analysis details:   (0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [groeck7[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [groeck7[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.177 listed in wl.mailspike.net]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1qXBMN-0003D6-KX
Subject: Re: [f2fs-dev] circular locking dependency warning in f2fs
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBBdWcgMTgsIDIwMjMgYXQgMDU6MzU6MjVQTSAtMDcwMCwgSmFlZ2V1ayBLaW0gd3Jv
dGU6Cj4gTWF5IEkga25vdyBpZiB0aGlzIHdvcmtzPwo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyMzA4MTkwMDMwMTIuMzQ3MzY3NS0xLWphZWdldWtAa2Vy
bmVsLm9yZy9ULyN1Cj4gCgpZZXMsIHRoYXQgZml4ZXMgdGhlIHByb2JsZW0gZm9yIG1lLiBUaGF0
IG1ha2VzIG1lIHdvbmRlciwgdGhvdWdoOgpXaHkgbm90IGp1c3QgdXNlIHRoZSBfbmVzdGVkIGZ1
bmN0aW9ucyB1bmNvbmRpdGlvbmFsbHkgPwoKVGhhbmtzLApHdWVudGVyCgo+IE9uIDA4LzE4LCBK
YWVnZXVrIEtpbSB3cm90ZToKPiA+IENoYW8sCj4gPiAKPiA+IERvIHlvdSBoYXZlIHNvbWUgYmFu
ZHdpZHRoIHRvIGFkZHJlc3MgdGhpcz8gT3RoZXJ3aXNlLCBJJ2xsIGRvIHNvbWUuCj4gPiAKPiA+
IFRoYW5rcywKPiA+IAo+ID4gT24gRnJpLCBBdWcgMTgsIDIwMjMgYXQgNjoxNeKAr0FNIEd1ZW50
ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwg
QXVnIDE3LCAyMDIzIGF0IDA4OjUzOjE5QU0gLTA3MDAsIEVyaWMgQmlnZ2VycyB3cm90ZToKPiA+
ID4gPiBPbiBUaHUsIEF1ZyAxNywgMjAyMyBhdCAxMDoyNjoxMlBNICswODAwLCBDaGFvIFl1IHdy
b3RlOgo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGxvY2sobmV3X2lub2RlIzItPmlfc2VtKQo+ID4gPiA+ID4gPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvY2so
ZGlyLT5pX3hhdHRyX3NlbSkKPiA+ID4gPiA+ID4gPiA+IGxvY2sobmV3X2lub2RlIzEtPmlfc2Vt
KQo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IFRoaXMgbG9va3MgZmluZSB0byBtZS4K
PiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBCYXNlZCBvbiB5b3Vy
IGZlZWRiYWNrLCBhbSBJIGNvcnJlY3QgYXNzdW1pbmcgdGhhdCB5b3UgZG9uJ3QgcGxhbgo+ID4g
PiA+ID4gPiA+IHRvIGZpeCB0aGlzID8KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSdtIHF1aXRl
IG9wZW4gdG8gc29tZXRoaW5nIHRoYXQgSSBtYXkgbWlzcy4gQ2hhbywgd2hhdCBkbyB5b3UgdGhp
bms/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSmFlZ2V1aywgSSBhZ3JlZSB3aXRoIHlvdSwgaXQgbG9v
a3MgbGlrZSBhIGZhbHNlIGFsYXJtLgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEZhbHNlIHBv
c2l0aXZlIGxvY2tkZXAgcmVwb3J0cyBzdGlsbCBuZWVkIHRvIGJlIGVsaW1pbmF0ZWQsIGZvciBl
eGFtcGxlIGJ5Cj4gPiA+ID4gZml4aW5nIHRoZSBsb2NrZGVwIGFubm90YXRpb25zLiAgT3RoZXJ3
aXNlIGl0J3MgaW1wb3NzaWJsZSB0byBkaXN0aW5ndWlzaCB0aGVtCj4gPiA+ID4gZnJvbSB0cnVl
IHBvc2l0aXZlcy4KPiA+ID4gPgo+ID4gPgo+ID4gPiBFeGFjdGx5LCBhbmQgdGhhdCBpcyB3aHkg
SSBkb24ndCB0ZXN0IGZlYXR1cmVzIHdpdGgga25vd24gbG9ja2RlcCBhbm5vdGF0aW9uCj4gPiA+
IGlzc3Vlcy4gSSdsbCBkcm9wIGYyZnMgZnJvbSBteSBsaXN0IG9mIGZlYXR1cmVzIHRvIHRlc3Qg
Zm9yIHRoZSB0aW1lIGJlaW5nLgo+ID4gPgo+ID4gPiBHdWVudGVyCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
