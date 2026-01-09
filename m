Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CA7D06EA0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 09 Jan 2026 04:06:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81j1tuHL42ifeDXVRyxJNfD245JXuYXcMDOycQssV8s=; b=R8hzkz8RWx2qATBGvJwuwAl0rG
	zCsJIOwR/5/lM/vl/v19DM21kQnxG6jaItYzuJeeO5BQDypxvCmL1YvwUgXY4mLuXF+H2Qj8xqhCW
	tVWxhawRz02Qtt2YNxkyadrtuv9dIS9lTy5MPQqqyaewz/SBMd7zFac+Kh/dWMjrWK1U=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ve2pK-0004CC-OU;
	Fri, 09 Jan 2026 03:06:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <21cnbao@gmail.com>) id 1ve2pI-0004C4-Pw
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 03:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9E77J/5K4QG160FYP4J8tJd5lh9BjlFNmZBac+1Wi+8=; b=i67O+iW+LQFmmbB8egmrxUVvVO
 AV6mZUmdTSyOuPHcsyDLKqz6o189i4f/q1Fnig1H3gvgidTsMzI20YmhojPcj5AZmHFznABYZLvXI
 r1VaMp9ixvm/Cf2Hp4L2isKZSg39iAJBfGoLymTBm5VnpVJY1Fgpl2tH+wYAHCBV2LIE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9E77J/5K4QG160FYP4J8tJd5lh9BjlFNmZBac+1Wi+8=; b=gGT1NpJzT/Clf9u+bTZVPVrDXg
 T9mYzvUnfNiJLYODpPGbhLo1v9NQAQj1WJsPjF2aw/lbOglkvTH7+tyzxLDGku0tk0DppoTSeU4a9
 66TZ7J1rCDZnLL5DL+vD3NRuXGwgGVMZECoYGMGPs3iHQBU1jO+Q+rmt+QEg77G/8tNs=;
Received: from mail-qv1-f50.google.com ([209.85.219.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ve2pI-0007Lc-Dh for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 03:06:12 +0000
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-88a32bf0248so30574166d6.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 Jan 2026 19:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767927961; x=1768532761; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9E77J/5K4QG160FYP4J8tJd5lh9BjlFNmZBac+1Wi+8=;
 b=TEE2nbf0/PUd6qFheL40dEDvpoQHEn1jiIHtlYjDqXJJ+pG47VGFSGokPcn7mUrZu0
 Ti/UJqQurdD7dqu0dh2VCRAQdHtTJk0E8qrbuWCg5Q0UYwflluk3AkvxbMTlxTQ49yxG
 l6tL9vbYLRNOLXoRsov79OBV3u2BIe8fLVXcpIcOroT9atbc6u/cCA0j5SerGbePXoIC
 SD2Tn+uaiE3soXW0sbJ80G3Jpxm3iEJhVIaB6LhwvUjNxESd04sDC9f80QWKKXV9KM76
 usx1doftmNKwriO4hVX/fCjR7Wb7y21uMzi6Kz3Ux6mf9ylwrr/DWnJp1CRGUMqJa76o
 qMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767927961; x=1768532761;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9E77J/5K4QG160FYP4J8tJd5lh9BjlFNmZBac+1Wi+8=;
 b=Qyv9nkO6TnTYoCMBmXcvB3cuwzJ6moQbFjLD1Y01KR57EPzf0ACZyS0oOOvH4SxFqf
 iDk7xm1BY/dInnlgRgj5y19SxxT+YeBXOIdBZ3+kZ0b0cK1qxXV/8lXC6WSXcqpvsCIP
 NrM5sCo52e85CyBuxq3m8gGs0KgSZbSmsjJpDfa779mra53QyK46iQCdxTllCy1orlc9
 v+0H4LCPS8tEhWYXC6coMjeiW3TukMkYmnJ5SRM19ULqff5R7e+GN5AjXwKzIbjuSI5B
 d8thRUU8W41X8DjEcGdegrNzeBoUusj9xwIYXe5KjTj02xQnhetN/L04w/B8MnxqvtCg
 ZCdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjYXKp8woYBu3MDMwT5U3Bwf2Qbwpr1wX2YKObmpKN1qySSN1nk/HBX7G7kAJFxSz+lkklxVBLIA+EMECGRvsA@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwOb/fgR1LJGpyX8IG17O/IGXmZivD8CLXI710uMvHLbRLWlpFm
 vz4YgaEQM7V6ZJtaS+jswAWz279W/R1TkLI66k6IiI6jI3pp/UaDGSdVRuuc3Ppcgc/wEnPNjCu
 Pj+KTv5p5zwDtYl27m1mS7SaW1nbGZDA=
X-Gm-Gg: AY/fxX472At/0i12j7nMFgHbrzTgL8SjeR0mtt7QqzfQiRasDn/vZ0ZvnCHMlyXT36g
 dIisBtKlJL+RLzRz4G1VN/w/doXcU+/BYTII/TenFAmsYzSnCFFRzEMlAPbJeC9+bi4sma16/sc
 oWHZ/nLIRMm2EyPXZxldY2pbD9eMgyxCLhuCoY5oKDqrVmKSuCb6UEiATWMCz29MNxNnDWOAV96
 lGxwylMf0cUuwxKSx+pTHTyOpwM9G0XoO4KR1J0zs4XZsOC941ZCi94YStsBuUBRKnVYQ==
X-Google-Smtp-Source: AGHT+IHy9yHpzReIwHanptX34H9U4kWWW1sIPpOh51FGOn5Jx08/V2p0+TOSKZGW+rR7W8aI216kNiFFfwEeV9jAqxA=
X-Received: by 2002:a05:6214:20c7:b0:890:271c:1993 with SMTP id
 6a1803df08f44-89084183a00mr124676806d6.7.1767927961201; Thu, 08 Jan 2026
 19:06:01 -0800 (PST)
MIME-Version: 1.0
References: <20260109024716.12047-1-chao@kernel.org>
In-Reply-To: <20260109024716.12047-1-chao@kernel.org>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 Jan 2026 16:05:49 +1300
X-Gm-Features: AQt7F2qV1Gc3IGrlaM53KfjSqJ6Q3XKsAlniVCcflNlDr75xHplrQ-_sfVF3NLQ
Message-ID: <CAGsJ_4wjXMXk4YKsYebmtTa5dKVO21b91ieY=foYULWS+DyroQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 9,
 2026 at 3:47 PM Chao Yu wrote: > > Below testcase
 can change large folio supported inode from immutable > to mutable, it's
 not as expected, let's add a new check condition in > f2fs_s [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [21cnbao(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.50 listed in wl.mailspike.net]
X-Headers-End: 1ve2pI-0007Lc-Dh
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to prevent clearing immutable for
 large folio supported inode
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBKYW4gOSwgMjAyNiBhdCAzOjQ34oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IEJlbG93IHRlc3RjYXNlIGNhbiBjaGFuZ2UgbGFyZ2UgZm9saW8gc3VwcG9y
dGVkIGlub2RlIGZyb20gaW1tdXRhYmxlCj4gdG8gbXV0YWJsZSwgaXQncyBub3QgYXMgZXhwZWN0
ZWQsIGxldCdzIGFkZCBhIG5ldyBjaGVjayBjb25kaXRpb24gaW4KPiBmMmZzX3NldGZsYWdzX2Nv
bW1vbigpIHRvIGRldGVjdCBhbmQgcmVqZWN0IGl0Lgo+Cj4gLSBkZCBpZj0vZGV2L3plcm8gb2Y9
L21udC9mMmZzL3Rlc3QgYnM9MzJrIGNvdW50PTQKPiAtIGYyZnNfaW8gc2V0ZmxhZ3MgaW1tdXRh
YmxlIC9tbnQvZjJmcy90ZXN0Cj4gLSBlY2hvIDMgPiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMK
PiAgOiB0byByZWxvYWQgaW5vZGUgd2l0aCBsYXJnZSBmb2xpbwo+IC0gZjJmc19pbyByZWFkIDMy
IDAgMSBtbWFwIDAgMCAvbW50L2YyZnMvdGVzdAo+IC0gZjJmc19pbyBjbGVhcmZsYWdzIGltbXV0
YWJsZSAvbW50L2YyZnMvdGVzdAo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJu
ZWwub3JnPgo+IC0tLQo+ICBmcy9mMmZzL2ZpbGUuYyB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2Zz
L2YyZnMvZmlsZS5jCj4gaW5kZXggY2UyOTFmMTUyYmMzLi5mN2Y5ZGEwYjIxNWYgMTAwNjQ0Cj4g
LS0tIGEvZnMvZjJmcy9maWxlLmMKPiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+IEBAIC0yMTU1LDYg
KzIxNTUsMTIgQEAgc3RhdGljIGludCBmMmZzX3NldGZsYWdzX2NvbW1vbihzdHJ1Y3QgaW5vZGUg
Kmlub2RlLCB1MzIgaWZsYWdzLCB1MzIgbWFzaykKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAg
ICAgfQo+Cj4gKyAgICAgICBpZiAoKGlmbGFncyBeIG1hc2tlZF9mbGFncykgJiBGMkZTX0lNTVVU
QUJMRV9GTCkgewo+ICsgICAgICAgICAgICAgICBpZiAoKG1hc2tlZF9mbGFncyAmIEYyRlNfSU1N
VVRBQkxFX0ZMKSAmJgo+ICsgICAgICAgICAgICAgICAgICAgICAgIG1hcHBpbmdfbGFyZ2VfZm9s
aW9fc3VwcG9ydChpbm9kZS0+aV9tYXBwaW5nKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKCkhpIFl1LCBJIGZpbmQgaXQgYSBiaXQgb2RkIHRvIHByZXZlbnQgdW5z
ZXR0aW5nIGltbXV0YWJsZSBzb2xlbHkKYmVjYXVzZSBsYXJnZSBmb2xpb3MgYXJlIGluIHVzZS4g
SWYgdW5zZXR0aW5nIGltbXV0YWJsZSBpcyBjb25zaWRlcmVkCnVuZXhwZWN0ZWQgYmVoYXZpb3Is
IGl0IHNob3VsZCBiZSBkaXNhbGxvd2VkIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlcgpsYXJnZSBmb2xp
b3MgYXJlIHVzZWQsIGFuZCBhcHBseSBlcXVhbGx5IGluIGJvdGggY2FzZXMuCgpJJ20gbm90IHN1
cmUgd2hldGhlciByZXZlcnRpbmcgdGhlIGxhcmdlIGZvbGlvcyBzZXR0aW5nIGlzIHRoZQpiZXR0
ZXIgYXBwcm9hY2g6CnRydW5jYXRlX3BhZ2VjYWNoZShpbm9kZSwgaW5vZGUtPmlfc2l6ZSk7Cm1h
cHBpbmdfc2V0X2ZvbGlvX29yZGVyX3JhbmdlKGlub2RlLT5pX21hcHBpbmcsIDAsIDApOwoKCj4g
KyAgICAgICB9Cj4gKwo+ICAgICAgICAgZmktPmlfZmxhZ3MgPSBpZmxhZ3MgfCAoZmktPmlfZmxh
Z3MgJiB+bWFzayk7Cj4gICAgICAgICBmMmZzX2J1Z19vbihGMkZTX0lfU0IoaW5vZGUpLCAoZmkt
PmlfZmxhZ3MgJiBGMkZTX0NPTVBSX0ZMKSAmJgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAoZmktPmlfZmxhZ3MgJiBGMkZTX05PQ09NUF9GTCkpOwo+IC0tCj4gMi40
MC4xCgoKVGhhbmtzCkJhcnJ5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
