Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B88A95D4EB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2024 20:11:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1shYkv-0007h2-CD;
	Fri, 23 Aug 2024 18:11:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <josef@toxicpanda.com>) id 1shYkt-0007gv-Fu
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Aug 2024 18:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PavImyZBpQ0ihxMWSk5vea6sJaOx+LLDGLk4+jUyTQM=; b=A7A/W74P1WDDIbjJNTSVF/legm
 ki+SyLspOzRx/9V66MRlSptXmZuTj3zQ6ZF2rnjVdJf8WLrLmmO2ibMVl0SfvczEP1qjRsPo3EWPN
 d0ucEI+al42XVfnOL4BceNlja8REWjCQeV0WRk0D1ooNmmX1Flly3IugrBkPDoJGTNAM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PavImyZBpQ0ihxMWSk5vea6sJaOx+LLDGLk4+jUyTQM=; b=PGTO4atzVuVKZK7mPVjS1kf7qz
 cqRLxCXICD+CrvUXiIGx82bseZUzdnC5j64wz/p6Hu4R88+p3EupZLD8ISkh4CXa+yT778h63Vc59
 V3uAwzNXAlYJRocmNED2xauqUT/c7kU//aeHzgRPhvsupLi1M9fxCtvAGFKBGl41a+34=;
Received: from mail-il1-f169.google.com ([209.85.166.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1shYkt-0006TT-5U for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Aug 2024 18:11:24 +0000
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-39b0826298cso7859145ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Aug 2024 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1724436677; x=1725041477;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PavImyZBpQ0ihxMWSk5vea6sJaOx+LLDGLk4+jUyTQM=;
 b=uRAPAwIk/PwhLkyurO8Bl3oJjH3ayDlcNfT56DAbRweo0RAcZCRxvoxv12qhS/Se9v
 0Saoabteq6Kkna/AdfL8Cd2/ThZiOeXMEsI0S3L5Ro+WGk+70l+/SQPLCVtxk0CfeR1f
 Ab6VvRKiL30bSRKinFJ4C6ofJMxpIlrcWHiSdApIi3FnkXne+0ETRAq4ozV9kzJh/LG8
 R2PMdvrgMdhZWY96kx/Mqflqa7w3F7WAD1wtxAug2OpTDKPi0aCfdxqRANU5rlIEmBdu
 cEpAARCtb7tg8aDLCQIl8mRrYAgHpTNGlZntTiVBlyQlN7pk8SVRFAjc+Twp/QkS2BTe
 wo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724436677; x=1725041477;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PavImyZBpQ0ihxMWSk5vea6sJaOx+LLDGLk4+jUyTQM=;
 b=WrsCcWXvcFu8gUjrqSML3n4iMCa5w1VSEleaZjyPY0kqWuF9dbroLxii2s3AegxSDb
 EsUhzKdckxaZu7Wpphyk5pNRnTF/SZ3g970pNRwew3hPlxWba//GSDOrcDiq8XEkbKdX
 eJUw1389rZg9pChUnrI5dVMi56gSyR+6VIzBLmpfwOQxGgahOr3Z0KaPh446vDxoh04x
 KKf95uROUUOzh/4CQtoAepCRMMueQ/BIm2u2CMhI0PJmV+7lxppXgK2eO3rH/+kCaVfX
 QdrpFllBXuoOcAxMaXz3RphhWo5yvoNTECwVVBvExS/We+eDByGttpr3mnzZm0UFuLT/
 9ryQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGq0a9VuZ6yQ6HdaHZR/oUPwwQLE23Xz1/qEzGAZWRaymUnPUVTax90UdHwjt0ZGAC59Nt5lalEqa3qqbgUWRh@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy8Vk/6euYtFUD0vaNsm2QTCvEOKNz4F+BV1DiwtMNZ8nQ9qgLl
 TZ/05vFsMYo2MiXOw17dqsPIJaaIIifQIm/JBzCg9iCVtd45otnGsqnjXX4BMrF0FOrar6o7mRY
 Y
X-Google-Smtp-Source: AGHT+IG8Fm82VABdYczpwnZazgSBY53cfYwx8usVNQ4UDHH85sJ8NsypfnBCHAXtWEf+TlIObLxeJw==
X-Received: by 2002:a05:6830:6183:b0:709:61c1:374c with SMTP id
 46e09a7af769-70e0eb88668mr3202201a34.20.1724426256087; 
 Fri, 23 Aug 2024 08:17:36 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com.
 [76.182.20.124]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6c39b1f114dsm5740597b3.74.2024.08.23.08.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 08:17:35 -0700 (PDT)
Date: Fri, 23 Aug 2024 11:17:34 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20240823151734.GB2234629@perftesting>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
 <20240822013714.3278193-3-lizetao1@huawei.com>
 <Zsaq_QkyQIhGsvTj@casper.infradead.org>
 <0f643b0f-f1c2-48b7-99d5-809b8b7f0aac@gmx.com>
 <ZscqGAMm1tofHSSG@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZscqGAMm1tofHSSG@casper.infradead.org>
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Aug 22, 2024 at 01:07:52PM +0100, Matthew Wilcox wrote:
    > On Thu, Aug 22, 2024 at 08:28:09PM +0930, Qu Wenruo wrote: > > 在 2024/8/22
    12:35, Matthew Wilcox 写道: > > > > - while (cur < page [...] 
 
 Content analysis details:   (-5.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.166.169 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.166.169 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.166.169 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.169 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1shYkt-0006TT-5U
Subject: Re: [f2fs-dev] [PATCH 02/14] btrfs: convert
 get_next_extent_buffer() to take a folio
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
Cc: Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-f2fs-devel@lists.sourceforge.net,
 clm@fb.com, terrelln@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBBdWcgMjIsIDIwMjQgYXQgMDE6MDc6NTJQTSArMDEwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gT24gVGh1LCBBdWcgMjIsIDIwMjQgYXQgMDg6Mjg6MDlQTSArMDkzMCwgUXUgV2Vu
cnVvIHdyb3RlOgo+ID4g5ZyoIDIwMjQvOC8yMiAxMjozNSwgTWF0dGhldyBXaWxjb3gg5YaZ6YGT
Ogo+ID4gPiA+IC0Jd2hpbGUgKGN1ciA8IHBhZ2Vfc3RhcnQgKyBQQUdFX1NJWkUpIHsKPiA+ID4g
PiArCXdoaWxlIChjdXIgPCBmb2xpb19zdGFydCArIFBBR0VfU0laRSkgewo+ID4gPiAKPiA+ID4g
UHJlc3VtYWJseSB3ZSB3YW50IHRvIHN1cHBvcnQgbGFyZ2UgZm9saW9zIGluIGJ0cmZzIGF0IHNv
bWUgcG9pbnQ/Cj4gPiAKPiA+IFllcywgYW5kIHdlJ3JlIGFscmVhZHkgd29ya2luZyB0b3dhcmRz
IHRoYXQgZGlyZWN0aW9uLgo+ID4gCj4gPiA+IEkgY2VydGFpbmx5IHdhbnQgdG8gcmVtb3ZlIENP
TkZJR19SRUFEX09OTFlfVEhQX0ZPUl9GUyBzb29uIGFuZCB0aGF0J2xsCj4gPiA+IGJlIGEgYml0
IG9mIGEgcmVncmVzc2lvbiBmb3IgYnRyZnMgaWYgaXQgZG9lc24ndCBoYXZlIGxhcmdlIGZvbGlv
Cj4gPiA+IHN1cHBvcnQuICBTbyBzaG91bGRuJ3Qgd2UgYWxzbyBzL1BBR0VfU0laRS9mb2xpb19z
aXplKGZvbGlvKS8gPwo+ID4gCj4gPiBBRkFJSyB3ZSdyZSBvbmx5IGdvaW5nIHRvIHN1cHBvcnQg
bGFyZ2VyIGZvbGlvcyB0byBzdXBwb3J0IGxhcmdlciB0aGFuCj4gPiBQQUdFX1NJWkUgc2VjdG9y
IHNpemUgc28gZmFyLgo+IAo+IFdoeSBkbyB5b3Ugbm90IHdhbnQgdGhlIHBlcmZvcm1hbmNlIGdh
aW5zIGZyb20gdXNpbmcgbGFyZ2VyIGZvbGlvcz8KPiAKPiA+IFNvIGV2ZXJ5IGZvbGlvIGlzIHN0
aWxsIGluIGEgZml4ZWQgc2l6ZSAoc2VjdG9yIHNpemUsID49IFBBR0VfU0laRSkuCj4gPiAKPiA+
IE5vdCBmYW1pbGlhciB3aXRoIHRyYW5zcGFyZW50IGh1Z2UgcGFnZSwgSSB0aG91Z2h0IHRyYW5z
cGFyZW50IGh1Z2UgcGFnZQo+ID4gaXMgdHJhbnNwYXJlbnQgdG8gZnMuCj4gPiAKPiA+IE9yIGRv
IHdlIG5lZWQgc29tZSBzcGVjaWFsIGhhbmRsaW5nPwo+ID4gTXkgdW5lZHVjYXRlZCBndWVzcyBp
cywgd2Ugd2lsbCBnZXQgYSBsYXJnZXIgZm9saW8gcGFzc2VkIHRvIHJlYWRwYWdlCj4gPiBjYWxs
IGJhY2sgZGlyZWN0bHk/Cj4gCj4gV2h5IGRvIHlvdSBjaG9vc2UgdG8gcmVtYWluIHVuZWR1Y2F0
ZWQ/ICBJdCdzIG5vdCBsaWtlIEkndmUgYmVlbiBrZWVwaW5nCj4gYWxsIG9mIHRoaXMgdG8gbXlz
ZWxmIGZvciB0aGUgcGFzdCBmaXZlIHllYXJzLiAgSSd2ZSBnaXZlbiBkb3plbnMgb2YKPiBwcmVz
ZW50YXRpb25zIG9uIGl0LCBpbmNsdWRpbmcgcGxlbmFyeSBzZXNzaW9ucyBhdCBMU0ZNTS4gIEFz
IGEgZmlsZXN5c3RlbQo+IGRldmVsb3BlciwgeW91IG11c3Qgd2FudCB0byBub3Qga25vdyBhYm91
dCBpdCBhdCB0aGlzIHBvaW50Lgo+IAoKT3IsIGEgbW9yZSBjaGFyaXRhYmxlIHJlYWQsIGlzIHRo
YXQgdGhpcyBwYXJ0aWN1bGFyIGRldmVsb3BlciBoYXMgbmV2ZXIgYmVlbiB0bwpMU0ZNTUJQRi9Q
bHVtYmVycy9hbnl3aGVyZSB5b3UndmUgZ2l2ZW4gYSB0YWxrLgoKVGhpcyBzdHVmZiBpcyBjb21w
bGljYXRlZCwgSSBkb24ndCBldmVuIGtub3cgd2hhdCdzIGdvaW5nIG9uIGhhbGYgdGhlIHRpbWUs
IG11Y2gKbGVzcyBhIGRldmVsb3BlciB3aG8gZXhjbHVzaXZlbHkgd29ya3Mgb24gYnRyZnMgaW50
ZXJuYWxzLgoKVGhlcmUncyBhIGxvdCBvZiB0aGluZ3MgdG8ga25vdyBpbiB0aGlzIHNwYWNlLCB3
ZSBjYW4ndCBhbGwga25vdyB3aGF0J3MgZ29pbmcgb24KaW4gZXZlcnkgY29ybmVyLgoKQXMgZm9y
IHRoZSB0b3BpYyBhdCBoYW5kLCBJJ20gbW92aW5nIHVzIGluIHRoZSBkaXJlY3Rpb24gb2YgYW4g
aW9tYXAgY29udmVyc2lvbgpzbyB3ZSBjYW4gaGF2ZSB0aGUgbGFyZ2UgZm9saW8gc3VwcG9ydCwg
cmVnYXJkbGVzcyBvZiB0aGUgdW5kZXJseWluZwpzZWN0b3JzaXplL21ldGFkYXRhIGJsb2NrIHNp
emUuICBVbmZvcnR1bmF0ZWx5IHRoZXJlJ3MgYSBsb3Qgb2YgZnVuZGFtZW50YWwKY2hhbmdlcyB0
aGF0IG5lZWQgdG8gYmUgbWFkZSB0byBmYWNpbGl0YXRlIHRoYXQsIGFuZCB0aG9zZSBhcmUgZ29p
bmcgdG8gdGFrZQpzb21lIHRpbWUgdG8gdGVzdCBhbmQgdmFsaWRhdGUgdG8gbWFrZSBzdXJlIHdl
IGRpZG4ndCBicmVhayBhbnl0aGluZy4gIEluIHRoZQptZWFudGltZSB3ZSdyZSBnb2luZyB0byBi
ZSBpbiB0aGlzIHdlaXJkIGxpbWJvIHN0YXRlcyB3aGlsZSBJIHRhY2tsZSB0aGUKaW5kaXZpZHVh
bCBwcm9ibGVtIGFyZWFzLgoKTXkgcHJpb3JpdGllcyBhcmUgc3BsaXQgYmV0d2VlbiBnZXR0aW5n
IHRoaXMgdG8gd29yayBhbmQgZnVzZSBpbXByb3ZlbWVudHMgdG8KZXZlbnR1YWxseSBubyBsb25n
ZXIgbmVlZCB0byBoYXZlIGZpbGUgc3lzdGVtcyBpbiB0aGUga2VybmVsIHRvIGF2b2lkIGFsbCB0
aGlzCmluIGdlbmVyYWwsIHNvIGl0J3MgZ29pbmcgdG8gYmUgc3B1cnR5LCBidXQgSSBob3BlIHRv
IGhhdmUgdGhpcyB3b3JrIGRvbmUgYnkgdGhlCm5leHQgTFNGTU1CUEYuICBUaGFua3MsCgpKb3Nl
ZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
