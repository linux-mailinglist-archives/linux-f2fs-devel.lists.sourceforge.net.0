Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B5D950B7C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2024 19:33:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdvO8-0006FH-TK;
	Tue, 13 Aug 2024 17:32:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sdvO7-0006F3-PR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 17:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mV2CIDgtQjfnfL1zkE8Kr3wO5iybTcwQL2R+oto1HXU=; b=fsK38UTk2ZZsNWqR5HI3jDPHlx
 z712e8IfVALzjPs1fhbO/UivoACZa1ecJaw6s4nR8GTVRIKej5L67Dyq1MfsoBI3VMotHCWzRmPSm
 zLZo/cXKgbM+zy1eNTqAEnmh/p+Vk9Rw1lEWosE3jtCFt2LtNrLv+DUaCqEuyReK+F7c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mV2CIDgtQjfnfL1zkE8Kr3wO5iybTcwQL2R+oto1HXU=; b=L01+0sLZbbeOVH7+1kcqzsXWSB
 /glxDTvT35EnUQF2tWRQMnZE2wtGkdU+1G115fro8EiYyB3aH0vqxMwLT86P6B4fA2tJiFoJAp5gn
 z3ezBHjxLh6b9JBi1EEMuQLx/de9Y2ah23s6gbgaO7ANm9/tr+mdYlRcbAH0dk/60a9U=;
Received: from mail-vk1-f181.google.com ([209.85.221.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sdvO7-0003tP-42 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 17:32:51 +0000
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-4f6b8b7d85bso1959072e0c.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Aug 2024 10:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723570365; x=1724175165; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mV2CIDgtQjfnfL1zkE8Kr3wO5iybTcwQL2R+oto1HXU=;
 b=clva05Ql0SIQH4LPPhKiCbANm2XuOzcwBA2KAahI+4iKHAKhWX+e0fBBwXiD1PGAQO
 Ob9FKxV826Q/5QfLimsQUZh9VL0Di4epTSVlKV8fIP3duP6ydWKX7X8fsGDddXjPkQGU
 5UBIDfElL6I7iHzIJ6tJ+3Gg4YctPfkEtzzJiK96yAtR7u6lD22XmLqlkMYwpKsA/ipx
 hUAtPkGCzSFLKqRM+7b8cCde9q5vtgZpBdCkwhW0XGbnOaKi5jRSGSe9rdLjI+eKMiKy
 1lCyXPQ0+7vIKCLkOWsFzCQeQmvWgbC+gCYh38dk/Bg/70jBIGv4pUtcQ2rzmxsUbtcO
 N1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723570365; x=1724175165;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mV2CIDgtQjfnfL1zkE8Kr3wO5iybTcwQL2R+oto1HXU=;
 b=svErqhKd8RNAZAAFS8dMVz+/XSUOykXB6KXQ5qY2oKNwH2kS4+er0xF0i3YEz8m71n
 1AAEpw43nXhzrZzN86EY3xhFOOWzVTNL2CkVqVhcVwaYeD/ZrJ3JbUmZUhka9mQL+u4L
 EMQDVqqdpYy+s6Bj4j1UHu6fpEo3aHtLuvt2Kbw4e7ukr7zuQ49kSEmrJMzCoaVWvGeN
 CrhWd9wzS9zOfJffUxxsyG4HzRXusy5kMZKDAIeKn6dlyWY9tRsmRe6nDf+GISmE/5Zj
 bJtZ3JpJDY0nzt/iGw+Tk1iLG4K+mSMLMEMVFadz45J7FO6b0bnBMbTATOOTmfj9p3JU
 LeLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfGrOPAgCQWCs9o0rPfRED3BypvGOXue6qNvB87L/u1RopDtJ/6WkG71IKcnmPLOrsRiE0Rq2tYG2XykTL1U+b621mpyWSTWfZB94aCq+Le65Za7zE/A==
X-Gm-Message-State: AOJu0YyrTpaJYMfLSHb7DKH8VhVfGaraoYzBSRD8NzsQJ3o2N9EuL1B/
 uDJn6DpCmqD08kQuu5QCZd/g9hamK05hFJd4J/ZOWY4lOIfkvjsmqBZVfG/1CB+sOeV7epta9Ad
 +6bHrd3TRYYBUcLtha2bqn8Vr2ps=
X-Google-Smtp-Source: AGHT+IEG6/jPYdhGdlCbiGl93YeU1Z0AJ0DoZt7Au1/rT9b+nPLjsYqz71cc6Rq0whXRPt7NvJoDvbe7EqxkPlQ6vX0=
X-Received: by 2002:a05:6122:311c:b0:4df:1d06:eeb7 with SMTP id
 71dfb90a1353d-4fad1c4f434mr512830e0c.1.1723570365093; Tue, 13 Aug 2024
 10:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20240813073246epcas1p4085b32d2b008b77119b811dc328b964e@epcas1p4.samsung.com>
 <20240813073244.9052-1-youngjin.gil@samsung.com>
In-Reply-To: <20240813073244.9052-1-youngjin.gil@samsung.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 13 Aug 2024 10:32:34 -0700
Message-ID: <CACOAw_y7g6CGCDB4NG7Y-+cg2niYxg4NVpcm5eg717j45GowtQ@mail.gmail.com>
To: Yeongjin Gil <youngjin.gil@samsung.com>
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Aug 13, 2024 at 12:34 AM Yeongjin Gil wrote: > >
    The i_pino in f2fs_inode_info has the previous parent's i_ino when inode
   > was renamed, which may cause f2fs_ioc_start_atomic_write to fail [...] 
 
 Content analysis details:   (-5.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.221.181 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.181 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdvO7-0003tP-42
Subject: Re: [f2fs-dev] [PATCH] f2fs: Create COW inode from parent dentry
 for atomic write
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
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBBdWcgMTMsIDIwMjQgYXQgMTI6MzTigK9BTSBZZW9uZ2ppbiBHaWwgPHlvdW5namlu
LmdpbEBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiBUaGUgaV9waW5vIGluIGYyZnNfaW5vZGVfaW5m
byBoYXMgdGhlIHByZXZpb3VzIHBhcmVudCdzIGlfaW5vIHdoZW4gaW5vZGUKPiB3YXMgcmVuYW1l
ZCwgd2hpY2ggbWF5IGNhdXNlIGYyZnNfaW9jX3N0YXJ0X2F0b21pY193cml0ZSB0byBmYWlsLgo+
IElmIGZpbGVfd3JvbmdfcGlubyBpcyB0cnVlIGFuZCBpX25saW5rIGlzIDEsIHRoZW4gdG8gZmlu
ZCBhIHZhbGlkIHBpbm8sCj4gd2Ugc2hvdWxkIHJlZmVyIHRvIHRoZSBkZW50cnkgZnJvbSBpbm9k
ZS4KPgo+IFRvIHJlc29sdmUgdGhpcyBpc3N1ZSwgbGV0J3MgZ2V0IHBhcmVudCBpbm9kZSB1c2lu
ZyBwYXJlbnQgZGVudHJ5Cj4gZGlyZWN0bHkuCj4KPiBGaXhlczogM2RiMWRlMGU1ODJjICgiZjJm
czogY2hhbmdlIHRoZSBjdXJyZW50IGF0b21pYyB3cml0ZSB3YXkiKQo+IFJldmlld2VkLWJ5OiBT
dW5nam9uZyBTZW8gPHNqMTU1Ny5zZW9Ac2Ftc3VuZy5jb20+Cj4gUmV2aWV3ZWQtYnk6IFN1bm1p
biBKZW9uZyA8c19taW4uamVvbmdAc2Ftc3VuZy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWWVvbmdq
aW4gR2lsIDx5b3VuZ2ppbi5naWxAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gIGZzL2YyZnMvZmlsZS5j
IHwgMTIgKysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2Zp
bGUuYwo+IGluZGV4IGZiYThiNWYyMTZmOS4uMWVhZTEyM2YwMzE1IDEwMDY0NAo+IC0tLSBhL2Zz
L2YyZnMvZmlsZS5jCj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiBAQCAtMjEyNyw3ICsyMTI3LDYg
QEAgc3RhdGljIGludCBmMmZzX2lvY19zdGFydF9hdG9taWNfd3JpdGUoc3RydWN0IGZpbGUgKmZp
bHAsIGJvb2wgdHJ1bmNhdGUpCj4gICAgICAgICBzdHJ1Y3QgbW50X2lkbWFwICppZG1hcCA9IGZp
bGVfbW50X2lkbWFwKGZpbHApOwo+ICAgICAgICAgc3RydWN0IGYyZnNfaW5vZGVfaW5mbyAqZmkg
PSBGMkZTX0koaW5vZGUpOwo+ICAgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJG
U19JX1NCKGlub2RlKTsKPiAtICAgICAgIHN0cnVjdCBpbm9kZSAqcGlub2RlOwo+ICAgICAgICAg
bG9mZl90IGlzaXplOwo+ICAgICAgICAgaW50IHJldDsKPgo+IEBAIC0yMTc4LDE1ICsyMTc3LDEw
IEBAIHN0YXRpYyBpbnQgZjJmc19pb2Nfc3RhcnRfYXRvbWljX3dyaXRlKHN0cnVjdCBmaWxlICpm
aWxwLCBib29sIHRydW5jYXRlKQo+ICAgICAgICAgLyogQ2hlY2sgaWYgdGhlIGlub2RlIGFscmVh
ZHkgaGFzIGEgQ09XIGlub2RlICovCj4gICAgICAgICBpZiAoZmktPmNvd19pbm9kZSA9PSBOVUxM
KSB7Cj4gICAgICAgICAgICAgICAgIC8qIENyZWF0ZSBhIENPVyBpbm9kZSBmb3IgYXRvbWljIHdy
aXRlICovCj4gLSAgICAgICAgICAgICAgIHBpbm9kZSA9IGYyZnNfaWdldChpbm9kZS0+aV9zYiwg
ZmktPmlfcGlubyk7Cj4gLSAgICAgICAgICAgICAgIGlmIChJU19FUlIocGlub2RlKSkgewo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGYyZnNfdXBfd3JpdGUoJmZpLT5pX2djX3J3c2VtW1dSSVRF
XSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gUFRSX0VSUihwaW5vZGUpOwo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+IC0gICAgICAgICAgICAgICB9Cj4gKyAg
ICAgICAgICAgICAgIHN0cnVjdCBkZW50cnkgKmRlbnRyeSA9IGZpbGVfZGVudHJ5KGZpbHApOwo+
ICsgICAgICAgICAgICAgICBzdHJ1Y3QgaW5vZGUgKmRpciA9IGRfaW5vZGUoZGVudHJ5LT5kX3Bh
cmVudCk7Cj4KPiAtICAgICAgICAgICAgICAgcmV0ID0gZjJmc19nZXRfdG1wZmlsZShpZG1hcCwg
cGlub2RlLCAmZmktPmNvd19pbm9kZSk7Cj4gLSAgICAgICAgICAgICAgIGlwdXQocGlub2RlKTsK
PiArICAgICAgICAgICAgICAgcmV0ID0gZjJmc19nZXRfdG1wZmlsZShpZG1hcCwgZGlyLCAmZmkt
PmNvd19pbm9kZSk7Cj4gICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBmMmZzX3VwX3dyaXRlKCZmaS0+aV9nY19yd3NlbVtXUklURV0pOwo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+IC0tCj4gMi40MC4xCj4KClJldmlld2VkLWJ5
OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgoKVGhhbmtzLAoKPgo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
