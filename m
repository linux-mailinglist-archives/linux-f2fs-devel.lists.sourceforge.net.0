Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3568D7D19
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2024 10:15:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sE2qI-0001NM-UX;
	Mon, 03 Jun 2024 08:14:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1sE2qH-0001N6-EP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 08:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uqWtcKaIGXr5SYEy9GKQV/zonae2Y0QYE8AUlyxsKU0=; b=JvuL6my75OQoWxpEVKsNxXNf98
 ZwC4hnRGo61Lk8VCRXPpW79cwTfakNGT5rjff8Z6iTJjxVb9FfkVtkZqmdq8i8LkOf4OMVI4tpcOl
 zHmfVjdCQXuKsG6tXeplpaD7+xqvtIVQt97Tdb3HIKWpDER7GbRWW1xzINPmrUDJ2W84=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uqWtcKaIGXr5SYEy9GKQV/zonae2Y0QYE8AUlyxsKU0=; b=Nj9P6M6XI3Ed+2KhNnmK29hGtp
 YMfSjrSGZaOmngLFyLVwivupTguFANYEokiDa4Ne+IEd8/dr3lq3b1+Bk3o16AP4N7TO5MaFLIJtd
 5Zk/69ZmjqB/HpIORvlnRGrAujm7+e4JXrv7bpYDBG/0r6KwJsXKfRlD4n79GazOe2nM=;
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sE2qH-0004om-RE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 08:14:57 +0000
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-35dce610207so1821485f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Jun 2024 01:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717402490; x=1718007290; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uqWtcKaIGXr5SYEy9GKQV/zonae2Y0QYE8AUlyxsKU0=;
 b=YXdhRCPSLAPHTjp7wszwkxAukCKIKTbhgm3hTAHzX7PYhkFAdSf2y3lJK8aZJGnSYb
 kBx2BEyV+4iJMiA+KKYbY0A24ck4CnfHilnhIRrKpXNBPjQGnqyCf5ssXEAicHR5P7N2
 xNvU6yrcly7G9utCpUSnUScawMQO4v2RVJJRiaOT78JNKJeqkBLbmsvhCMKxxE7JajLp
 3IsuOQjT9i4Q64JVfhARahmvKFQ9g9SwMgKPQo0zsRHgNJJh6WGwF/PqDjRyb1+mu9Jv
 BEd0IlND8OP2uio+hS+EEzguW0VO56L00cH54t4EejHVcR6oYHoxjOn1stsSH8sfQM/i
 HLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717402490; x=1718007290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uqWtcKaIGXr5SYEy9GKQV/zonae2Y0QYE8AUlyxsKU0=;
 b=qi7RzYUaJAz4wDDfuvDg4tPgB2YBsJ/oIxIUcIuy8oIRsCcKipqmU4ZFsIPLq2Oa6B
 kZZA/UWsKV7FITyPHQpvE8pLpyxTcFHvTjpQIdm63fDOZWtWnoMm3RXNxuBVqIPnoFh4
 LW2irJYk7vMlqr3lIwjiqhqJ40IyXxJoI59+osYk96kb/esjNj7v760rj2bxjFsoz1yI
 CSeZLxH62Fkvbv5bf/gsjBYQ0I6Okwsze2tUNdovL6z48f5Hbb6Xu13MDBAjv649vXgi
 Eep4zrT8Ir4cqNfTPlZmACFOzOfc6V/lpQ4YyMG4f+CEKF+dNJimN5/klphcaEtVjtkb
 7GhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWhd/lxW4uW7OnPHbbZLLCZQvMGXz07ehY9WK38u7jf0bON6TCs4gGopENW/QIXO2tsflH/FftAgd+Ig379yfdxcHA71AwrXVmuVyPhYwV38Ck3Drn8Q==
X-Gm-Message-State: AOJu0YyJlRZjMSpFvJU6139psHGepDbYl4LxiH0OZFeGAV/UGri0Xu3b
 q7ToacM7NPjTsal9bzALtTFxRXBAOlbMaYp4JdFIaoGIyrXlE4IPHzvj7NivHr48cXrsRBdn+FU
 XLbWHXju7cf/zngNrZ4Z1cX6512ApI7cN
X-Google-Smtp-Source: AGHT+IHaHtLHw0ERydOHDlrNBojyLujhlu0p/k/sSwV+V3ALZQW1pAfUigOTzPAM4IBokppYqAngENr4XyewvTXNypw=
X-Received: by 2002:adf:e5ce:0:b0:355:7e4:3cfb with SMTP id
 ffacd0b85a97d-35e0f26999bmr7003910f8f.23.1717402490331; Mon, 03 Jun 2024
 01:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <1717146645-18829-1-git-send-email-zhiguo.niu@unisoc.com>
 <b0c9f3dc-417a-4891-bdf0-25b849828e3b@kernel.org>
 <CAHJ8P3LFkk0YnF-vnsd7wVMHXyhJN43Gfqtq3EBqjxoqgd88mg@mail.gmail.com>
 <10f4898f-0b8c-4503-8620-3bb566e9a163@kernel.org>
In-Reply-To: <10f4898f-0b8c-4503-8620-3bb566e9a163@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 3 Jun 2024 16:14:38 +0800
Message-ID: <CAHJ8P3LVadqmrFsZLcbCp_QdCo06F2YtpgfL0hrVrrp6fdyrnA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Jun 3, 2024 at 3:50 PM Chao Yu wrote: > > On 2024/6/3
    14:52, Zhiguo Niu wrote: > > On Mon, Jun 3, 2024 at 2:39 PM Chao Yu wrote:
    > >> > >> On 2024/5/31 17:10, Zhiguo Niu wrote: > >>> U [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.41 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.41 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.41 listed in bl.score.senderscore.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.41 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sE2qH-0004om-RE
Subject: Re: [f2fs-dev] [PATCH] f2fs: use new ioprio Macro to get ckpt
 thread ioprio data
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
Cc: jaegeuk@kernel.org, ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBKdW4gMywgMjAyNCBhdCAzOjUw4oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIDIwMjQvNi8zIDE0OjUyLCBaaGlndW8gTml1IHdyb3RlOgo+ID4gT24g
TW9uLCBKdW4gMywgMjAyNCBhdCAyOjM54oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3
cm90ZToKPiA+Pgo+ID4+IE9uIDIwMjQvNS8zMSAxNzoxMCwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+
Pj4gVXNlIG5ldyBNYWNybyBJT1BSSU9fUFJJT19MRVZFTCB0byBnZXQgY2twdCB0aHJlYWQgaW9w
cmlvIGRhdGEobGV2ZWwpLAo+ID4+PiBpdCBpcyBtb3JlIGFjY3VyYXRlIGFuZCBjb25zaXN0ZW4g
d2l0aCB0aGUgd2F5IHNldHRpbmcgY2twdCB0aHJlYWQKPiA+Pj4gaW9wcmlvKElPUFJJT19QUklP
X1ZBTFVFKGNsYXNzLCBkYXRhKSkuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBO
aXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICAgIGZzL2YyZnMvc3lz
ZnMuYyB8IDIgKy0KPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N5c2ZzLmMgYi9mcy9m
MmZzL3N5c2ZzLmMKPiA+Pj4gaW5kZXggNzI2NzZjNS4uNTVkNDZkYSAxMDA2NDQKPiA+Pj4gLS0t
IGEvZnMvZjJmcy9zeXNmcy5jCj4gPj4+ICsrKyBiL2ZzL2YyZnMvc3lzZnMuYwo+ID4+PiBAQCAt
MzQwLDcgKzM0MCw3IEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNfc2JpX3Nob3coc3RydWN0IGYyZnNf
YXR0ciAqYSwKPiA+Pj4gICAgICAgIGlmICghc3RyY21wKGEtPmF0dHIubmFtZSwgImNrcHRfdGhy
ZWFkX2lvcHJpbyIpKSB7Cj4gPj4+ICAgICAgICAgICAgICAgIHN0cnVjdCBja3B0X3JlcV9jb250
cm9sICpjcHJjID0gJnNiaS0+Y3ByY19pbmZvOwo+ID4+PiAgICAgICAgICAgICAgICBpbnQgY2xh
c3MgPSBJT1BSSU9fUFJJT19DTEFTUyhjcHJjLT5ja3B0X3RocmVhZF9pb3ByaW8pOwo+ID4+PiAt
ICAgICAgICAgICAgIGludCBkYXRhID0gSU9QUklPX1BSSU9fREFUQShjcHJjLT5ja3B0X3RocmVh
ZF9pb3ByaW8pOwo+ID4+PiArICAgICAgICAgICAgIGludCBkYXRhID0gSU9QUklPX1BSSU9fTEVW
RUwoY3ByYy0+Y2twdF90aHJlYWRfaW9wcmlvKTsKPiA+Pgo+ID4+IFNvLCBjYW4geW91IHBsZWFz
ZSB1c2UgJ2xldmVsJyB0byBpbnN0ZWFkICdkYXRhJyBpbiBmMmZzX3NiaV9zaG93KCkgYW5kCj4g
Pj4gX19zYmlfc3RvcmUoKT8KPiA+IEhpIENoYW8sCj4gPgo+ID4gSU9QUklPX1BSSU9fREFUQSBp
biB0aGUgbmV3IGtlcm5lbCB2ZXJzaW9uIGluY2x1ZGVzIHR3byBwYXJ0czogbGV2ZWwgYW5kIGhp
bnQuCj4gPiBJbiBfX3NiaV9zdG9yZSwgIiBJT1BSSU9fUFJJT19WQUxVRShjbGFzcywgZGF0YSki
ICBpcyB1c2VkIHRvIHNldCBja3B0Cj4gPiBpb3ByaW9yaXR5LAo+ID4gYW5kIGl0IHdpbGwgcGFz
cyBkZWZhdWx0IGhpbnQgdmFsdWUsIHdlIGp1c3QgbmVlZCB0byBrZWVwIGNsYXNzIC9sZXZlbCBy
aWdodC4KPgo+IFpoaWd1bywKPgo+IEkgdGhpbmsgZjJmcyBvbmx5IHN1cHBvcnQgY29uZmlndXJp
bmcgcHJpb2xldmVsIHJhdGhlciB0aGFuIHByaW9sZXZlbCBhbmQKPiBwcmlvaGludCBvZiBja3B0
IHRocmVhZCB2aWEgY2twdF90aHJlYWRfaW9wcmlvIHN5c2ZzIGludGVyZmFjZSwgc28gaXQgd2ls
bAo+IGJlIG1vcmUgcmVhZGFibGUgdG8gdXNlICdsZXZlbCcgaW5zdGVhZCBvZiAnZGF0YScgaW4g
Y29udGV4dCBvZiB0aGUgaW50ZXJmYWNlLAo+IHRob3VnaHRzPwpIaSAgQ2hhbywKSSB1bmRlcnN0
YW5kIHdoYXQgeW91IHNhaWQgYW5kIEkgYWdyZWUgd2l0aCB0aGlzLiBJIHdpbGwgdXBkYXRlIGl0
IGluCnRoZSBuZXh0IHZlcnNpb24uClRoYW5rcyEKPgo+IFRoYW5rcywKPgo+ID4KPiA+ICAgI2Rl
ZmluZSBJT1BSSU9fUFJJT19WQUxVRShwcmlvY2xhc3MsIHByaW9sZXZlbCkgXAo+ID4gICAgIGlv
cHJpb192YWx1ZShwcmlvY2xhc3MsIHByaW9sZXZlbCwgSU9QUklPX0hJTlRfTk9ORSkKPiA+IHNv
IGkgdGhpbmsgdGhpcyBwYXJ0IGlzIG5vdCBuZWVkZWQgdG8gbW9kaWZ5Lgo+ID4KPiA+IHRoYW5r
cyEKPiA+Pgo+ID4+IFRoYW5rcywKPiA+Pgo+ID4+Pgo+ID4+PiAgICAgICAgICAgICAgICBpZiAo
Y2xhc3MgIT0gSU9QUklPX0NMQVNTX1JUICYmIGNsYXNzICE9IElPUFJJT19DTEFTU19CRSkKPiA+
Pj4gICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+PgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
