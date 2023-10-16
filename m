Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B29B27CAD6C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Oct 2023 17:25:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qsPTU-00077P-9w;
	Mon, 16 Oct 2023 15:25:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1qsPTS-00077F-PD
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 15:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VdJuKEfOYE5A8Kjx9jh0E3Zg2w1jYR6HPq2kjcrmS/0=; b=iHsRnuadBLem3rHAnapR5ePZcX
 yH+FHCd8F1T3nzOrlLLVUSBpxeQ/RbsmguBXT1hoRRhKb7yKRwOV1oZsy3wCJtXP5kF1wN6o0V7+5
 z14AYpO/8DeqPTeLa0SoSlqr09eW7+cv21BRfi51WuthuWgYEGGK4D6sc7e7gsJwXL+g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VdJuKEfOYE5A8Kjx9jh0E3Zg2w1jYR6HPq2kjcrmS/0=; b=ap/00q/Jg7672p4ufy12bVYWe+
 +sEiFERNJHfoIhbpb9n1WFVEX4xcbJh4zoEgLfCokLeWKEl1tGtlTJYG6CGyr6r0U92X8zI1cQ8GK
 BmCkG3xf9cq3uqArlAHi0oZ06dxBw+K6DGWYwUgIkz2w3U/zZnrzAKE6UuvcAUzFYUjo=;
Received: from mail-ua1-f44.google.com ([209.85.222.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qsPTN-000193-Nn for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 15:25:42 +0000
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-7b5fafed01aso1660052241.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Oct 2023 08:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697469932; x=1698074732; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VdJuKEfOYE5A8Kjx9jh0E3Zg2w1jYR6HPq2kjcrmS/0=;
 b=VA9jiAUM7ZGr35gTv3UpGl1B8gYdk5IMpd+hzvLPd5MjRuzBVEHYFYgYFa+xbYFj+s
 yjZy5K9cAfSlW4URWZMxXXkwBGTkvv05VUkaEwndXJB1DOF4ng4BYUyoFKqNqiQOYSyk
 pqrgnLSt8K7XlXImmjS3tQDNQPYiB/etsWfVx8JvFVeFjGfBaCbuvEyG0tKQqjtAvyKR
 plB94TA7ASDtQYKeOrrakYUfWGnsyuBaXCCmDb4kJ/LoM5RAQ+yOX192hKOFTk2ZGyKZ
 VWLKX9+PXCB8hrQneEHAItVG6HRt8ybAPea9YVl5Z6v8lq7Gm4TLWoFXyaMiYG938cVS
 FHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697469932; x=1698074732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VdJuKEfOYE5A8Kjx9jh0E3Zg2w1jYR6HPq2kjcrmS/0=;
 b=U0MuCjVYxD50pRX4O7LuWvxRRwV4pGbilAjmdGfdFfjKeB1PHh1A+XIWKLURXuYYJk
 eyB86puK6AJYn4TlPuin3JhR8T6oENfK0YtckxdHxZ+ABUL/im4s8IC5ggPB+i4ZtT9F
 vjVU9ntckobc0HI2rP0thRY5ZmBlpd/V9eEH4QvqeiZzRQCKhh5sBblBcSxLxKOQkD5w
 S2l2Joncc67Ip8p39WrMJPODhWV7lz4tYQdMbvf86rrW3DrQyLd33uADK5O2Q2zOaRrd
 40AHvBLycB/mClowFNJt4z3Hel2sr4814YUiiydDiopE1fICKA9L7awa65wLpcmoZDOa
 K1kQ==
X-Gm-Message-State: AOJu0Yw1LCeUHwM+Wb3dGRjgblcgzbms7jtQ8QFvxBPiLDehs9unN5YY
 AKEBuDzP3bHHkPUMh8+LpiWUmerGj/LIqNw6RyY=
X-Google-Smtp-Source: AGHT+IHv6LjWv4HRL2UxPCMbLFi0e3vcsrOMIJJaPnJhhozM8EwMLhbByMTuBqLyW6wAzcEu6poTCfw8lOddnKHAqEs=
X-Received: by 2002:a67:c205:0:b0:458:11dd:87aa with SMTP id
 i5-20020a67c205000000b0045811dd87aamr1217133vsj.22.1697469931930; Mon, 16 Oct
 2023 08:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231013222453.240961-1-daeho43@gmail.com>
 <b16ea8fb-b3f2-4ae9-c543-cd84e0f3fa48@kernel.org>
In-Reply-To: <b16ea8fb-b3f2-4ae9-c543-cd84e0f3fa48@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 16 Oct 2023 08:25:21 -0700
Message-ID: <CACOAw_y4L_8YcJu3rK4cFFjwMg+z=XKppTGd2A6F+W9=mMV2Lg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, Oct 15, 2023 at 11:33 PM Chao Yu wrote: > > On 2023/10/14
    6:24, Daeho Jeong wrote: > > From: Daeho Jeong > > > > Need to initialize
    allocated node areas after memory allocation. > > > > [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.44 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.44 listed in wl.mailspike.net]
X-Headers-End: 1qsPTN-000193-Nn
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: initialize allocated node area
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBPY3QgMTUsIDIwMjMgYXQgMTE6MzPigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gMjAyMy8xMC8xNCA2OjI0LCBEYWVobyBKZW9uZyB3cm90ZToKPiA+
IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPgo+ID4gTmVlZCB0
byBpbml0aWFsaXplIGFsbG9jYXRlZCBub2RlIGFyZWFzIGFmdGVyIG1lbW9yeSBhbGxvY2F0aW9u
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5j
b20+Cj4gPiAtLS0KPiA+ICAgZnNjay9ub2RlLmMgICAgICAgfCAxICsKPiA+ICAgaW5jbHVkZS9m
MmZzX2ZzLmggfCAyICsrCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2ZzY2svbm9kZS5jIGIvZnNjay9ub2RlLmMKPiA+IGluZGV4IDM3
NjE0NzAuLjY1MDgzNDAgMTAwNjQ0Cj4gPiAtLS0gYS9mc2NrL25vZGUuYwo+ID4gKysrIGIvZnNj
ay9ub2RlLmMKPiA+IEBAIC0xMjcsNiArMTI3LDcgQEAgYmxvY2tfdCBuZXdfbm9kZV9ibG9jayhz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPgo+ID4gICAgICAgbm9kZV9ibGsgPSBjYWxsb2Mo
QkxPQ0tfU1osIDEpOwo+Cj4gY2FsbG9jKCkgaGFzIGFscmVhZHkgaW5pdGlhbGl6ZWQgbWVtb3J5
IHcvIHplcm8sIGl0IGRvZXNuJ3QgbmVlZCB0byByZWluaXRpYWxpemUKPiBpdCBhZ2Fpbj8KClNv
cnJ5LCBJIHdhcyBjb25mdXNlZC4gOigKCgo+Cj4gPiAgICAgICBBU1NFUlQobm9kZV9ibGspOwo+
ID4gKyAgICAgbWVtc2V0KG5vZGVfYmxrLCAwLCBCTE9DS19TWik7Cj4gPgo+ID4gICAgICAgRjJG
U19OT0RFX0ZPT1RFUihub2RlX2JsayktPm5pZCA9IGNwdV90b19sZTMyKGRuLT5uaWQpOwo+ID4g
ICAgICAgRjJGU19OT0RFX0ZPT1RFUihub2RlX2JsayktPmlubyA9IEYyRlNfTk9ERV9GT09URVIo
ZjJmc19pbm9kZSktPmlubzsKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2YyZnNfZnMuaCBiL2lu
Y2x1ZGUvZjJmc19mcy5oCj4gPiBpbmRleCAzYzc0NTFjLi43ZTIyMjc4IDEwMDY0NAo+ID4gLS0t
IGEvaW5jbHVkZS9mMmZzX2ZzLmgKPiA+ICsrKyBiL2luY2x1ZGUvZjJmc19mcy5oCj4gPiBAQCAt
MTgyNiw2ICsxODI2LDggQEAgc3RhdGljIGlubGluZSB2b2lkIHNob3dfdmVyc2lvbihjb25zdCBj
aGFyICpwcm9nKQo+ID4gICBzdGF0aWMgaW5saW5lIHZvaWQgZjJmc19pbml0X2lub2RlKHN0cnVj
dCBmMmZzX3N1cGVyX2Jsb2NrICpzYiwKPiA+ICAgICAgICAgICAgICAgc3RydWN0IGYyZnNfbm9k
ZSAqcmF3X25vZGUsIG5pZF90IGlubywgdGltZV90IG10aW1lLCBtb2RlX3QgbW9kZSkKPiA+ICAg
ewo+ID4gKyAgICAgbWVtc2V0KHJhd19ub2RlLCAwLCBGMkZTX0JMS1NJWkUpOwo+Cj4gRGl0dG8s
Cj4KPiBUaGFua3MsCj4KPiA+ICsKPiA+ICAgICAgIEYyRlNfTk9ERV9GT09URVIocmF3X25vZGUp
LT5uaWQgPSBjcHVfdG9fbGUzMihpbm8pOwo+ID4gICAgICAgRjJGU19OT0RFX0ZPT1RFUihyYXdf
bm9kZSktPmlubyA9IGNwdV90b19sZTMyKGlubyk7Cj4gPiAgICAgICBGMkZTX05PREVfRk9PVEVS
KHJhd19ub2RlKS0+Y3BfdmVyID0gY3B1X3RvX2xlNjQoMSk7CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
